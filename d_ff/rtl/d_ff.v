module d_ff(din,clk,rst,dout);
    input din;
    input clk;
    input rst;
    output reg dout;
        
        always@(posedge clk)
                begin
                     if(rst)begin
                            dout <= 1'b0;
                        end
                     else begin
                        dout <=din;
                        end
                end
endmodule

 


