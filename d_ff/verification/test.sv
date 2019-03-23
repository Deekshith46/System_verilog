
    
module tb;
    dff dif();

    d_ff dut(dif.clk,dif.rst,dif.din,dif.dout);

    initial begin
        dif.clk <= 0;
    end

    always #10 dif.clk <= ~dif.clock;

    environment env;

    initial begin
        env = new(dif);
        env.run();
    end
    
endmodule
