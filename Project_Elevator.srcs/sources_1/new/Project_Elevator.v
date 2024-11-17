`timescale 1ms / 10us


module Project_Elevator(destination, emergency, summon, close, depart, seg_data, seg_sel, door_status, RGB, sound, LCD_E, LCD_RS, LCD_RW, LCD_DATA, rst, clk);

    input [6:0] destination;
    input [1:0] emergency;
    input summon, close;
    input [6:0] depart;
    input rst, clk;
    
    output [7:0] seg_data;
    output [7:0] seg_sel;
    output [1:0] door_status;
    output [11:0] RGB;
    output reg sound;
    output reg LCD_E, LCD_RS, LCD_RW;
    output [7:0] LCD_DATA;

endmodule
