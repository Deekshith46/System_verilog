class driver;

    transaction trans;
    mailbox #(transaction) mbx;
    virtual dff dif;

    function new( virtual dff dif , mailbox #(transaction) mbx);
    this.dif = dif;
    this.mbx = mbx;
   // trans = new();
    endfunction

    task reset();
        dif.rst <= 1'b1;
        repeat(5) @(posedge dif.clk);
        dif.rst <= 1'b0;
        @(posedge dif.clk);
        $display("[DRV] RESET DONE");
    endtask

    task run();
        forever begin
            mbx.get(trans);
                dif.din <= trans.din;
            @(posedge dif.clk);
                trans.display("DRV");
            dif.din <= 1'b0;
            @(posedge dif.clk);            
        end
    endtask

endclass
