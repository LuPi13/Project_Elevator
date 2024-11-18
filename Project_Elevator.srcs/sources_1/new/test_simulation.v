`timescale 1ms / 10us


module test_simulation();
    reg [6:0] destination;
    reg [1:0] emergency;
    reg summon, close;
    reg [6:0] depart;
    reg rst, clk;
    
    wire [7:0] seg_data;
    wire [7:0] seg_sel;
    wire [1:0] door_status;
    wire [11:0] RGB;
    wire sound;
    wire LCD_E, LCD_RS, LCD_RW;
    wire [7:0] LCD_DATA;

    Project_Elevator ev_simul(destination, emergency, summon, close, depart, seg_data, seg_sel, door_status, RGB, sound, LCD_E, LCD_RS, LCD_RW, LCD_DATA, rst, clk);

    initial begin
        rst <= 1;
        clk <= 0;
        depart <= 7'b0000000;
        summon <= 0;
        close <= 0;
        #10 rst <= 0;
        #10 rst <= 1;

        #100 depart <= 7'b0100000;
        #10 summon <= 1;
        #10 summon <= 0;
        #5000 destination <= 7'b0000010;
        #10 destination <= 7'b0000000;
        #300 close <= 1;
        #10 close <= 0;
    end

    always begin
        #0.5 clk <= ~clk;
    end
endmodule
