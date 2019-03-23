class generator;
    transaction trans;
    mailbox mbx;
    mailbox mbxref;
    
    event sconext;
    event done;

    function new(mailbox #(transaction) mbx, mailbox #(transaction) mbxref);
        mbx = this.mbx;
        mbxref = this.mbxref;
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
