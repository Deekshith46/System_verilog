class generator;
    transaction trans;
    mailbox #(transaction) mbx_driver;
    mailbox #(transaction) mbx_ref;
    
    event sconext;
    event done;

    function new(mailbox #(transaction) mbx_driver, mailbox #(transaction) mbx_ref);
         this.mbx_driver = mbx_driver;
         this.mbx_ref = mbx_ref;
        trans = new();
    endfunction

    task run();
        repeat(30)
            begin
                assert(trans.randomize)
                    else $error("[GEN]:RANDOMIZATION FAILED");
                mbx_driver.put(trans.copy);
                mbx_ref.put(trans.copy);
                trans.display("GEN");
                @(sconext);
            end
            ->done;
    endtask

endclass
