module d_ff(din,clk,rst,dout);
    input din;
    input clk;
    input rst;
    output reg dout;
        
        always@(posedge clk)
                begin
                     if(rst)
                            dout <= 1'b0;
                        
                     else 
                        dout <= din;                       
                end
endmodule

 


