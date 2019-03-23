
class environment;
    generator gen;
    driver drv;
    reference refm;
    monitor mon;
    scoboard sco;

    event next;

    mailbox #(transaction) mbx_drv;
    mailbox #(transaction) mbx_mon;
    mailbox #(transaction) mbx_ref_in;
    mailbox #(transaction) mbx_ref_out;

    virtual dff dif;

    function new(virtual dff dif);
        mbx_drv = new();
        mbx_mon = new();
        mbx_ref_in = new();
        mbx_ref_out = new();
        
        gen = new(mbx_drv, mbx_ref_in);
        drv = new(dif ,mbx_drv);
        mon = new(dif,mbx_mon);
        refm = new(mbx_ref_in , mbx_ref_out);
        sco = new(mbx_mon,mbx_ref_out);
        
        this.dif = dif;
        gen.sconext = next;
        sco.sconext = next;

    endfunction

    task pre_test();
        drv.reset();
    endtask

    task test();
        fork
            gen.run();
            drv.run();
            mon.run();
            refm.run();
            sco.run();
        join_any
    endtask

    task post_test();
        wait(gen.done.triggered);
        $finish();        
    endtask

    task run();
        pre_test();
        test();
        post_test();
    endtask
    
endclass
