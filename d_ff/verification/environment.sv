
class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoboard sco;

    event next;

    mailbox #(transaction) gdmbx;
    mailbox #(transaction) msmbx;
    mailbox #(transaction) mbref;

    virtual dff dif;

    function new(virtual dff dif);
        this.dif = dif;
        gdmbx = new();
        msmbx = new();
        
        gen = new( gdmbx , mbref);
        drv = new(dif ,gdmbx);
        mon = new(dif,msmbx);
        mbref = new();
        sco = new(msmbx , mbref);

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
