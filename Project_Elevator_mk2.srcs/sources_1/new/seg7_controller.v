`timescale 1ms / 10us


module seg7_controller(ev1_control, ev2_control, seg_data, seg_sel, rst, clk);

input rst, clk;
input [11:0] ev1_control;
input [11:0] ev2_control; //[11:8]: 층수(bin), [7:4]: 이동방향(U: 1111, d: 1110, -: 1101), [3:0]: 카운터(bin)

reg [7:0] display_select;

output reg [7:0] seg_data;
output reg [7:0] seg_sel;

always @(negedge rst or posedge clk) begin //seg_sel loop
    if (!rst) seg_sel <= 8'b11111110;
    else seg_sel <= {seg_sel[6:0], seg_sel[7]};
end

always @(*) begin
    case (display_select[3:0])
        0: seg_data = 8'b11111100;
        1: seg_data = 8'b01100000;
        2: seg_data = 8'b11011010;
        3: seg_data = 8'b11110010;
        4: seg_data = 8'b01100110;
        5: seg_data = 8'b10110110;
        6: seg_data = 8'b10111110;
        7: seg_data = 8'b11100000;
        8: seg_data = 8'b11111110;
        9: seg_data = 8'b11110110;
        13: seg_data = 8'b00000010; //-
        14: seg_data = 8'b01111010; //d
        15: seg_data = 8'b01111100; //U
        default: seg_data = 8'b00000000;
    endcase
end

always @(*) begin
    case (seg_sel)
        8'b11111101: display_select = ev2_control[3:0];
        8'b11111011: display_select = ev2_control[7:4];
        8'b11110111: display_select = ev2_control[11:8];
        8'b11011111: display_select = ev1_control[3:0];
        8'b10111111: display_select = ev1_control[7:4];
        8'b01111111: display_select = ev1_control[11:8];
        default: display_select = 4'b1100; //의미없는 값; 미출력
    endcase
end

endmodule
