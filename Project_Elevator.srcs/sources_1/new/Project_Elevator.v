`timescale 1ms / 10us


module Project_Elevator(destination, emergency, summon, close, depart, seg_data, seg_sel, door_status, RGB, sound, LCD_E, LCD_RS, LCD_RW, LCD_DATA, rst, clk);

    input [6:0] destination;
    wire [6:0] destination_trig;
    input [1:0] emergency;
    input summon, close;
    reg summon_trig;
    input [6:0] depart;
    input rst, clk;
    
    oneshot_universal #(.WIDTH(8)) osu({destination[6:0], summon}, {destination_trig[6:0], summon_trig}, rst, clk);
    
    output [7:0] seg_data;
    output [7:0] seg_sel;
    output [1:0] door_status;
    output [11:0] RGB;
    output reg sound;
    output reg LCD_E, LCD_RS, LCD_RW;
    output [7:0] LCD_DATA;
    
    reg [15:0] cnt;
    reg [3:0] ev1_state;
    reg [3:0] ev2_state;
    reg [11:0] ev1_control;
    reg [11:0] ev2_control;

    
    
    parameter IDLE = 4'b0000, EMERGENCY = 4'b1111, DOOR_OPEN = 4'b0001, MOVE_TO_DEP = 4'b0010, MOVE_TO_DEST = 4'b0011, DOOR_CLOSING = 4'b0100;
    
    always @(negedge rst or posedge clk) begin
        if(!rst) begin
            ev1_state <= IDLE;
            ev2_state <= IDLE;
            ev1_control <= 12'b0001_1101_0000; //0001: 1층시작, 1101: -(이동중 아님), 0000: 카운터
            ev2_control <= 12'b0001_1101_0000;
            cnt <= 0;
        end
    end
endmodule
