`timescale 1ms / 10us


module oneshot_universal(btn, btn_trig, rst, clk);

parameter WIDTH = 1;
input rst, clk;
input [WIDTH-1:0] btn;
reg [WIDTH-1:0] btn_reg;
output reg [WIDTH-1:0] btn_trig;

always @(negedge rst or posedge clk) begin
    if(!rst) begin
        btn_reg <= {WIDTH{1'b0}};
        btn_trig <= {WIDTH{1'b0}};
    end
    else begin
        btn_reg <= btn;
        btn_trig <= btn & ~btn_reg;
    end
end
endmodule
