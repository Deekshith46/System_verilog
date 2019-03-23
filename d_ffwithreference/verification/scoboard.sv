class scoboard;

    transaction trans_mon, trans_ref;

    mailbox #(transaction) mbx_mon;
    mailbox #(transaction) mbx_ref;
    event sconext;

    function new( mailbox #(transaction) mbx_mon , mailbox #(transaction) mbx_ref);
    this.mbx_mon = mbx_mon;
    this.mbx_ref = mbx_ref;
    //trans = new();
    endfunction

    task run();
        forever begin
            mbx_mon.get(trans_mon);
            mbx_ref.get(trans_ref);
            
            trans_mon.display("SCO");
           trans_ref.display("REF");

                if(trans_mon.dout == trans_ref.din)
                    $display("[SCO]: DATA MATCHED");
                else 
                    $display("[SCO]: DATA MISS MATCHED");
                    $display("------------------------------------");
                    //trans_mon.display("MON TO SCO");
                    //trans_ref.display("REF TO SCO");
                 
                   -> sconext;
        end
        
    endtask
endclass
