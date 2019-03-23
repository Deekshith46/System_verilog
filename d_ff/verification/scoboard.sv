class scoboard;
    transaction trans, transref;
    mailbox #(transaction) mbx;
    mailbox #(transaction) mbxref;
    event sconext;

    function new( mailbox #(transaction) mbx , mailbox #(transaction) mbxref);
    this.mbx = mbx;
    this.mbxref = mbxref;
    trans = new();
    endfunction

    task run();
        forever begin
            mbx.get(trans);
            mbxref.get(transref);
            trans.display("SCO");
            transref.display("REF");
                if(trans.dout == transref.din)
                    $display("[SCO]: DATA MATCHED");
                else 
                    $display("[SCO]: DATA MISS MATCHED");
                    $display("------------------------------------");
                 
                    -> sconext;
        end
    endtask
endclass
