`timescale 1ms / 10us


module Project_Elevator(destination, emergency, summon, close, depart, seg_data, seg_sel, door_status, RGB, sound, LCD_E, LCD_RS, LCD_RW, LCD_DATA, rst, clk);

    input [6:0] destination;
    wire [6:0] destination_trig;
    input [1:0] emergency;
    input summon, close;
    wire summon_trig, close_trig;
    input [6:0] depart;
    input rst, clk;
    
    oneshot_universal #(.WIDTH(9)) osu({destination[6:0], summon, close}, {destination_trig[6:0], summon_trig, close_trig}, rst, clk);
    
    output [7:0] seg_data;
    output [7:0] seg_sel;
    output reg [1:0] door_status;
    output reg [11:0] RGB;
    output sound;
    output LCD_E, LCD_RS, LCD_RW;
    output reg [7:0] LCD_DATA;
    
    
    reg [15:0] ev1_cnt;
    reg [15:0] ev2_cnt;
    reg [3:0] summoner;
    reg [3:0] ev1_summoner;
    reg [3:0] ev2_summoner;
    reg [3:0] ev1_target;
    reg [3:0] ev2_target;
    reg [4:0] ev1_distance;
    reg [4:0] ev2_distance;
    reg [3:0] ev1_state;
    reg [3:0] ev2_state;
    reg [11:0] ev1_control;
    reg [11:0] ev2_control;

    seg7_controller seg7(ev1_control, ev2_control, seg_data, seg_sel, rst, clk);    
    
    parameter IDLE = 4'b0000, EMERGENCY = 4'b1111, DOOR_OPEN = 4'b0001, MOVE_TO_DEP = 4'b0010, MOVE_TO_DEST = 4'b0011, DOOR_OPENING = 4'b0100, DOOR_CLOSING = 4'b0101;
    
        
    always @(negedge rst or posedge clk) begin //엘리베이터 호출
        if(!rst) begin
            ev1_summoner <= 4'd0;
            ev2_summoner <= 4'd0;
            ev1_control <= 12'b0001_1101_0000; //0001: 현재 1층, 1101: -(이동중 아님), 0000: 카운터
            ev2_control <= 12'b0001_1101_0000;
            summoner <= 4'd0;
        end
        else begin
            if(summon_trig == 1) begin
                case(depart)
                    7'b0000001: summoner <= 7;
                    7'b0000010: summoner <= 6;
                    7'b0000100: summoner <= 5;
                    7'b0001000: summoner <= 4;
                    7'b0010000: summoner <= 3;
                    7'b0100000: summoner <= 2;
                    7'b1000000: summoner <= 1;
                    default: summoner <= 0;
                endcase
                ev1_distance = (summoner - ev1_control[11:8] + 7) % 7;
                ev2_distance = (summoner - ev2_control[11:8] + 7) % 7;
            end

            if(summoner != 0) begin
                if(((ev1_state == IDLE) && (ev2_state != IDLE)) ||
                ((ev1_state == IDLE) && (ev2_state == IDLE) && (ev1_distance <= ev2_distance))) begin
                    ev1_cnt <= 1;
                    ev1_state <= MOVE_TO_DEP;
                    ev1_summoner <= summoner;
                end
                else begin
                    ev2_cnt <= 1;
                    ev2_state <= MOVE_TO_DEP;
                    ev2_summoner <= summoner;
                end
            end
        end
    end

    always @(negedge rst or posedge clk) begin //ev1 state 제어
        if(!rst) begin
            ev1_state <= IDLE;
            ev1_cnt <= 0;
            ev1_target <= 0;
        end
        else begin
            ev1_control[3:0] <= ev1_cnt / 1000;
            case(ev1_state)
                MOVE_TO_DEP: begin
                    if(ev1_control[11:8] == ev1_summoner) begin
                        ev1_cnt <= 1;
                        ev1_control[7:4] <= 4'b1101;
                        ev1_state <= DOOR_OPENING;
                        summoner <= 0;
                    end
                    else begin
                        ev1_cnt <= ev1_cnt + 1;
                        if(ev1_control[11:8] < ev1_summoner) begin
                            if (ev1_cnt % 2000 == 0) begin
                                ev1_control[11:8] <= ev1_control[11:8] + 1;
                                ev1_cnt <=1;
                            end
                            ev1_control[7:4] <= 4'b1111;
                        end
                        else begin
                            if (ev1_cnt % 2000 == 0) begin
                                ev1_control[11:8] <= ev1_control[11:8] - 1;
                                ev1_cnt <= 1;
                            end
                            ev1_control[7:4] <= 4'b1110;
                        end
                    end
                end
                DOOR_OPENING: begin
                    if(ev1_cnt >= 2000) begin
                        ev1_cnt <= 1;
                        ev1_state <= DOOR_OPEN;
                        ev1_control[7:4] <= 4'b1101;
                    end
                    else begin
                        ev1_cnt <= ev1_cnt + 1;
                    end
                end
                DOOR_OPEN: begin
                    if(ev1_cnt >= 4000 || close_trig == 1) begin
                        ev1_cnt <= 1;
                        ev1_state <= DOOR_CLOSING;
                    end
                    else if(summoner == ev1_control[11:8]) ev1_cnt <= 1;
                    else begin
                        ev1_cnt <= ev1_cnt + 1;
                        door_status[1] <= 1;
                        if(|destination) begin
                            case(destination)
                                7'b1000000: ev1_target <= 1;
                                7'b0100000: ev1_target <= 2;
                                7'b0010000: ev1_target <= 3;
                                7'b0001000: ev1_target <= 4;
                                7'b0000100: ev1_target <= 5;
                                7'b0000010: ev1_target <= 6;
                                7'b0000001: ev1_target <= 7;
                                default: ev1_target <= 0;
                            endcase
                        end
                    end
                end
                DOOR_CLOSING: begin
                    if(ev1_cnt >= 2000) begin
                        if(ev1_target == 0) begin
                            ev1_cnt <= 0;
                            ev1_state <= IDLE;
                        end
                        else begin
                            ev1_cnt <= 1;
                            ev1_state <= MOVE_TO_DEST;
                        end
                    end
                    else begin
                        ev1_cnt <= ev1_cnt + 1;
                    end
                end
                MOVE_TO_DEST: begin
                    if(ev1_control[11:8] == ev1_target) begin
                        ev1_cnt <= 1;
                        ev1_control[7:4] <= 4'b1101;
                        ev1_target <= 0;
                        ev1_state <= DOOR_OPENING;
                    end
                    else begin
                        ev1_cnt <= ev1_cnt + 1;
                        if(ev1_control[11:8] < ev1_target) begin
                            if (ev1_cnt % 2000 == 0) begin
                                ev1_control[11:8] <= ev1_control[11:8] + 1;
                                ev1_cnt <= 1;
                            end
                            ev1_control[7:4] <= 4'b1111;
                        end
                        else begin
                            if (ev1_cnt % 2000 == 0) begin
                                ev1_control[11:8] <= ev1_control[11:8] - 1;
                                ev1_cnt <= 1;
                            end
                            ev1_control[7:4] <= 4'b1110;
                        end
                    end
                end
            endcase
        end
    end
endmodule
