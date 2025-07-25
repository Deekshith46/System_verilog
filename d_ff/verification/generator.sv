class generator;
    transaction trans;
    mailbox #(transaction) mbx;
    mailbox #(transaction) mbxref;
    
    event sconext;
    event done;

    function new(mailbox #(transaction) mbx, mailbox #(transaction) mbxref);
         this.mbx = mbx;
         this.mbxref = mbxref;
        trans = new();
    endfunction

    task run();
        repeat(30)
            begin
                assert(trans.randomize)
                    else $error("[GEN]:RANDOMIZATION FAILED");
                mbx.put(trans.copy);
                mbxref.put(trans.copy);
                trans.display("GEN");
                @(sconext);
            end
            ->done;
    endtask

endclass
