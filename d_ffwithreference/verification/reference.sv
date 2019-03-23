class reference;

    transaction trans_in , trans_out;

    mailbox #(transaction) mbx_in;
    mailbox #(transaction) mbx_out;

    function new(mailbox #(transaction) mbx_in , mailbox #(transaction)mbx_out);
        this.mbx_in = mbx_in;
        this.mbx_out = mbx_out;
    endfunction

    task run();
    trans_in = new();
    trans_out = new();
        forever begin
           mbx_in.get(trans_in);
#20;
           trans_out.din = trans_in.din;
          // trans_out.dout = trans_in.din;
           mbx_out.put(trans_out);
           trans_out.display("REF");           
        end
        endtask
endclass
