class monitor;
  
transaction trans;
    mailbox #(transaction) mbx;
    virtual dff dif;

    function new( virtual dff dif , mailbox #(transaction) mbx);
    this.dif = dif;
    this.mbx = mbx;
    trans = new();
    endfunction

    task run();
        forever begin
        repeat(2) @(posedge dif.clk);
        trans.dout = vif.dout;
        mbx.put(trans);
        trans.display("MON");
        end                    
    endtask
endclass
