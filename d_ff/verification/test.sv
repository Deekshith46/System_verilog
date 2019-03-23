    
module tb;
    dff dif();

    d_ff dut(.clk(dif.clk),.rst(dif.rst),.din(dif.din),.dout(dif.dout));

    initial begin
        dif.clk <= 0;
    end

    always #10 dif.clk <= ~dif.clk;

    environment env;

    initial begin
        env = new(dif);
        env.run();
    end

endmodule
