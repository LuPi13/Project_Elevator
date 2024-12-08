`timescale 1ms / 10us


module Project_Elevator(destination, emergency, summon, close, depart, seg_data, seg_sel, door_status, RGB, sound, LCD_E, LCD_RS, LCD_RW, LCD_DATA, rst, clk, debug1, debug2);

    input [6:0] destination;
    wire [6:0] destination_trig;
    input [1:0] emergency;
    wire [1:0] emergency_trig;
    input summon, close;
    wire summon_trig, close_trig;
    input [6:0] depart;
    input rst, clk;
    
    oneshot_universal #(.WIDTH(11)) osu({destination[6:0], emergency[1:0], summon, close}, {destination_trig[6:0], emergency_trig[1:0], summon_trig, close_trig}, rst, clk);
    
    output [7:0] seg_data;
    output [7:0] seg_sel;
    output reg [1:0] door_status;
    output reg [11:0] RGB;
    output reg sound;
    output wire LCD_E;
    output reg LCD_RS, LCD_RW;
    output reg [7:0] LCD_DATA;
    output reg [2:0] debug1;
    output reg [2:0] debug2;
    
    
    reg [15:0] ev1_cnt;
    reg [15:0] ev2_cnt;
    reg [3:0] summoner;
    reg [3:0] reserver;
    reg summon_reservation;
    reg [15:0] ev1_eta;
    reg [15:0] ev2_eta;
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
    reg [11:0] emergency_cnt;
    reg [12:0] lcd_cnt;
    reg [3:0] lcd_state;

    seg7_controller seg7(ev1_control, ev2_control, seg_data, seg_sel, rst, clk);    
    
    parameter IDLE = 4'b0000, EMERGENCY = 4'b1111, DOOR_OPEN = 4'b0001, MOVE_TO_DEP = 4'b0010, MOVE_TO_DEST = 4'b0011, DOOR_OPENING = 4'b0100, DOOR_CLOSING = 4'b0101;

    parameter DELAY = 4'b1000, FUNCTION_SET = 4'b1001, ENTRY_MODE = 4'b1010, DISP_ONOFF = 4'b1011, LINE1 = 4'b1100, LINE2 = 4'b1101, DELAY_T = 4'b1110, CLEAR_DISP = 4'b1111;
    
    
    always @(negedge rst or posedge clk) begin //호출버튼, 호출층 제어
        if(!rst) begin
            summoner <= 4'd0;
        end
        else begin
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
        end
    end
    
    always @(negedge rst or posedge clk) begin
        if(!rst) begin
            reserver <= 0;
        end
        else begin
            if(((ev1_state != IDLE) && (ev2_state != IDLE)) && summon_trig) begin
                reserver <= summoner;
            end
            /*
            else begin
                reserver <= 0;
            end
            */
        end
    end
    
    always @(negedge rst or posedge clk) begin
        if(!rst) begin
            summon_reservation <= 0;
        end
        else begin
            if(summon_trig) begin
                if((ev1_state != IDLE) && (ev2_state != IDLE)) begin
                    summon_reservation <= 1;
                end
            end
            if((((ev1_state == MOVE_TO_DEP) && (ev1_summoner == reserver)) || ((ev2_state == MOVE_TO_DEP) && (ev2_summoner == reserver))) && (summon_reservation == 1)) begin
                summon_reservation <= 0;
            end
        end
    end
    
//호출 시 엘리베이터 거리 계산, 호출 버튼 누르는 순간에만 올바른 계산함, 이외에는 현재층 출력(쓸 일 없음)
    always @(negedge rst or posedge clk) begin
        if(!rst) begin
            ev1_distance <= 0;
            ev2_distance <= 0;
        end
        else begin
            ev1_distance = (summoner > ev1_control[11:8]) ? (summoner - ev1_control[11:8]) : (ev1_control[11:8] - summoner);
            ev2_distance = (summoner > ev2_control[11:8]) ? (summoner - ev2_control[11:8]) : (ev2_control[11:8] - summoner);
        end
    end
    
//둘 다 움직이고 있을 때 호출 시 엘리베이터 도착 시간 계산
    always @(negedge rst or posedge clk) begin
        if(!rst) begin
            ev1_eta <= 0;
            ev2_eta <= 0;
        end
        else begin
            ev1_eta <= (((ev1_control[11:8] >= ev1_target) ? ev1_control[11:8] - ev1_target : ev1_target - ev1_control[11:8])
            + ((ev1_target >= reserver) ? ev1_target - reserver : reserver - ev1_target))
            + (ev1_state == MOVE_TO_DEST ? 8 : 0)
            + (ev1_state == MOVE_TO_DEP ? 4 : 0)
            + (ev1_state == DOOR_OPENING ? 4 : 0)
            + (ev1_state == DOOR_OPEN ? 3 : 0)
            + (ev1_state == DOOR_CLOSING ? 1 : 0)
            + (ev1_state == EMERGENCY ? 1000 : 0);
            ev2_eta <= (((ev2_control[11:8] >= ev2_target) ? ev2_control[11:8] - ev2_target : ev2_target - ev2_control[11:8])
            + ((ev2_target >= reserver) ? ev2_target - reserver : reserver - ev2_target))
            + (ev2_state == MOVE_TO_DEST ? 8 : 0)
            + (ev2_state == MOVE_TO_DEP ? 4 : 0)
            + (ev2_state == DOOR_OPENING ? 4 : 0)
            + (ev2_state == DOOR_OPEN ? 3 : 0)
            + (ev2_state == DOOR_CLOSING ? 1 : 0)
            + (ev2_state == EMERGENCY ? 1000 : 0);
        end
    end

    always @(negedge rst or posedge clk) begin //sound 제어
        if(!rst) sound <= 0;
        else begin
            if(((ev1_state == DOOR_OPENING) && (ev1_cnt <= 500)) || ((ev2_state == DOOR_OPENING) && (ev2_cnt <= 500))) sound <= ~sound;
        end
    end


    always @(negedge rst or posedge clk) begin //ev1 state 제어
        if(!rst) begin
            ev1_state <= IDLE;
            ev1_cnt <= 1;
            ev1_target <= 0;
            ev1_control <= 12'b0001_1101_0000; //0001: 현재 1층, 1101: -(이동중 아님), 0000: 카운터
            door_status[1] <= 0;
        end
        else begin
            ev1_control[3:0] <= ev1_cnt / 1000;
            
            if((ev1_state != EMERGENCY) && emergency[1]) ev1_state <= EMERGENCY;
            
            case(ev1_state)
                IDLE: begin
                    if((summoner == ev1_control[11:8]) && summon_trig) begin
                        ev1_cnt <= 1;
                        ev1_state <= DOOR_OPEN;
                    end
                    else if((summoner != 0) && summon_trig && !((ev2_state == DOOR_OPEN) && (summoner == ev2_control[11:8]))) begin
                        if((ev2_state != IDLE) || ((ev2_state == IDLE) && (ev1_distance <= ev2_distance))) begin
                            ev1_state <= MOVE_TO_DEP;
                            ev1_summoner <= summoner;
                        end
                    end
                    else if((reserver != 0) && summon_reservation && (ev1_eta <= ev2_eta)) begin
                        ev1_state <= MOVE_TO_DEP;
                        ev1_summoner <= reserver;
                    end
                end
                MOVE_TO_DEP: begin
                    if(ev1_control[11:8] == ev1_summoner) begin
                        ev1_cnt <= 1;
                        ev1_control[7:4] <= 4'b1101;
                        ev1_state <= DOOR_OPENING;
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
                        door_status[1] <= 0;
                        ev1_state <= DOOR_CLOSING;
                    end
                    else if((summoner == ev1_control[11:8]) && summon_trig) ev1_cnt <= 1;
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
                            ev1_cnt <= 1;
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
                EMERGENCY: begin
                    door_status[1] <= 1;
                    ev1_control[7:4] <= 4'b1101;
                    ev1_cnt <= 1;
                end
            endcase
        end
    end

    always @(negedge rst or posedge clk) begin //ev2 state 제어
        if(!rst) begin
            ev2_state <= IDLE;
            ev2_cnt <= 1;
            ev2_target <= 0;
            ev2_control <= 12'b0001_1101_0000;
            door_status[0] <= 0;
        end
        else begin
            ev2_control[3:0] <= ev2_cnt / 1000;
            
            if((ev2_state != EMERGENCY) && emergency[0]) ev2_state <= EMERGENCY;
            
            case(ev2_state)
                IDLE: begin
                    if((summoner == ev2_control[11:8]) && summon_trig) begin
                        ev2_cnt <= 1;
                        ev2_state <= DOOR_OPEN;
                    end
                    else if((summoner != 0) && summon_trig && !((ev1_state == DOOR_OPEN) && (summoner == ev1_control[11:8]))) begin
                        if((ev1_state != IDLE) || ((ev1_state == IDLE) && (ev1_distance > ev2_distance))) begin
                            ev2_state <= MOVE_TO_DEP;
                            ev2_summoner <= summoner;
                        end
                    end
                    else if((reserver != 0) && summon_reservation && (ev1_eta <= ev2_eta)) begin
                        ev2_state <= MOVE_TO_DEP;
                        ev2_summoner <= reserver;
                    end
                end
                MOVE_TO_DEP: begin
                    if(ev2_control[11:8] == ev2_summoner) begin
                        ev2_cnt <= 1;
                        ev2_control[7:4] <= 4'b1101;
                        ev2_state <= DOOR_OPENING;
                    end
                    else begin
                        ev2_cnt <= ev2_cnt + 1;
                        if(ev2_control[11:8] < ev2_summoner) begin
                            if (ev2_cnt % 2000 == 0) begin
                                ev2_control[11:8] <= ev2_control[11:8] + 1;
                                ev2_cnt <=1;
                            end
                            ev2_control[7:4] <= 4'b1111;
                        end
                        else begin
                            if (ev2_cnt % 2000 == 0) begin
                                ev2_control[11:8] <= ev2_control[11:8] - 1;
                                ev2_cnt <= 1;
                            end
                            ev2_control[7:4] <= 4'b1110;
                        end
                    end
                end
                DOOR_OPENING: begin
                    if(ev2_cnt >= 2000) begin
                        ev2_cnt <= 1;
                        ev2_state <= DOOR_OPEN;
                        ev2_control[7:4] <= 4'b1101;
                    end
                    else begin
                        ev2_cnt <= ev2_cnt + 1;
                    end
                end
                DOOR_OPEN: begin
                    if(ev2_cnt >= 4000 || close_trig == 1) begin
                        ev2_cnt <= 1;
                        door_status[0] <= 0;
                        ev2_state <= DOOR_CLOSING;
                    end
                    else if((summoner == ev2_control[11:8]) && summon_trig) ev2_cnt <= 1;
                    else begin
                        ev2_cnt <= ev2_cnt + 1;
                        door_status[0] <= 1;
                        if(|destination) begin
                            case(destination)
                                7'b1000000: ev2_target <= 1;
                                7'b0100000: ev2_target <= 2;
                                7'b0010000: ev2_target <= 3;
                                7'b0001000: ev2_target <= 4;
                                7'b0000100: ev2_target <= 5;
                                7'b0000010: ev2_target <= 6;
                                7'b0000001: ev2_target <= 7;
                                default: ev2_target <= 0;
                            endcase
                        end
                    end
                end
                DOOR_CLOSING: begin
                    if(ev2_cnt >= 2000) begin
                        if(ev2_target == 0) begin
                            ev2_cnt <= 1;
                            ev2_state <= IDLE;
                        end
                        else begin
                            ev2_cnt <= 1;
                            ev2_state <= MOVE_TO_DEST;
                        end
                    end
                    else begin
                        ev2_cnt <= ev2_cnt + 1;
                    end
                end
                MOVE_TO_DEST: begin
                    if(ev2_control[11:8] == ev2_target) begin
                        ev2_cnt <= 1;
                        ev2_control[7:4] <= 4'b1101;
                        ev2_target <= 0;
                        ev2_state <= DOOR_OPENING;
                    end
                    else begin
                        ev2_cnt <= ev2_cnt + 1;
                        if(ev2_control[11:8] < ev2_target) begin
                            if (ev2_cnt % 2000 == 0) begin
                                ev2_control[11:8] <= ev2_control[11:8] + 1;
                                ev2_cnt <= 1;
                            end
                            ev2_control[7:4] <= 4'b1111;
                        end
                        else begin
                            if (ev2_cnt % 2000 == 0) begin
                                ev2_control[11:8] <= ev2_control[11:8] - 1;
                                ev2_cnt <= 1;
                            end
                            ev2_control[7:4] <= 4'b1110;
                        end
                    end
                end
                EMERGENCY: begin
                    door_status[0] <= 1;
                    ev2_control[7:4] <= 4'b1101;
                    ev2_cnt <= 1;
                end
            endcase
        end
    end


    always @(negedge rst or posedge clk) begin //emergency 제어, 불빛
        if(!rst) begin
            emergency_cnt <= 1;
        end
        else begin
            if(emergency_cnt >= 1000) begin
                emergency_cnt <= 1;
            end
            else begin
                emergency_cnt <= emergency_cnt + 1;
            end

            if((ev1_state == EMERGENCY) && (ev2_state != EMERGENCY)) begin
                if(emergency_cnt <= 500) begin
                    RGB <= 12'b100_110_000_000;
                end
                else begin
                    RGB <= 12'b110_100_000_000;
                end
            end

            else if((ev2_state == EMERGENCY) && (ev1_state != EMERGENCY)) begin
                if(emergency_cnt <= 500) begin
                    RGB <= 12'b000_000_110_100;
                end
                else begin
                    RGB <= 12'b000_000_100_110;
                end
            end

            else if((ev1_state == EMERGENCY) && (ev2_state == EMERGENCY)) begin
                if(emergency_cnt <= 500) begin
                    RGB <= 12'b110_100_110_100;
                end
                else begin
                    RGB <= 12'b100_110_100_110;
                end
            end
            
            else RGB <= 12'b000_000_000_000;
        end
    end


    always @(posedge clk or negedge rst) begin //LCD state
        if(!rst) begin
            lcd_state = DELAY;
            lcd_cnt <= 0;
            end
        
        else begin
            lcd_cnt <= lcd_cnt + 1;
            case (lcd_state)
                DELAY: begin
                    if(lcd_cnt == 70) begin
                        lcd_state = FUNCTION_SET;
                        lcd_cnt <= 0;
                    end
                end
                FUNCTION_SET: begin
                    if(lcd_cnt == 30) begin
                        lcd_state = DISP_ONOFF;
                        lcd_cnt <= 0;
                    end
                end
                DISP_ONOFF: begin
                    if(lcd_cnt == 30) begin
                        lcd_state = ENTRY_MODE;
                        lcd_cnt <= 0;
                    end
                end
                ENTRY_MODE: begin
                    if(lcd_cnt == 30) begin
                        lcd_state = LINE1;
                        lcd_cnt <= 0;
                    end
                end
                LINE1: begin
                    if(lcd_cnt == 20) begin
                        lcd_state = LINE2;
                        lcd_cnt <= 0;
                    end
                end
                LINE2: begin
                    if(lcd_cnt == 20) begin
                        lcd_state = DELAY_T;
                        lcd_cnt <= 1;
                    end
                end
                DELAY_T: begin
                    if(|emergency_trig) begin
                        lcd_state = CLEAR_DISP;
                        lcd_cnt <= 0;
                    end
                end
                CLEAR_DISP: begin
                    if(lcd_cnt == 10) begin
                        lcd_state = LINE1;
                        lcd_cnt <= 0;
                    end
                end
            endcase
        end
    end

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_1_00000000;
            {debug1, debug2} <= 6'b000000;
        end
        else begin
            case(lcd_state)
                FUNCTION_SET: begin
                    {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_00111000;
                    end
                DISP_ONOFF: begin
                    {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_00001100;
                    end
                ENTRY_MODE: begin
                    if(lcd_cnt <= 20) {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_00000110;
                    else {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_00000001;
                    end
                LINE1: begin
                    if((ev1_state == EMERGENCY) && (ev2_state != EMERGENCY)) begin
                        case(lcd_cnt)
                            00: {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_10000000; // Set DDRAM Address
                            01: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01000101; // 'E'
                            02: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01010110; // 'V'
                            03: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00110001; // '1'
                            04: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            05: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101111; // 'o'
                            06: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110101; // 'u'
                            07: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110100; // 't'
                            08: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            09: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101111; // 'o'
                            10: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100110; // 'f'
                            11: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            12: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            13: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            14: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110010; // 'r'
                            15: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110110; // 'v'
                            16: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101001; // 'i'
                            17: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100011; // 'c'
                            18: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            19: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00101110; // '.'
                            default: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' ' (default)
                        endcase
                    end
                    else if((ev1_state != EMERGENCY) && (ev2_state == EMERGENCY)) begin
                        case(lcd_cnt)
                            00: {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_10000000; // Set DDRAM Address
                            01: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01000101; // 'E'
                            02: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01010110; // 'V'
                            03: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00110010; // '2'
                            04: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            05: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101111; // 'o'
                            06: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110101; // 'u'
                            07: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110100; // 't'
                            08: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            09: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101111; // 'o'
                            10: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100110; // 'f'
                            11: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            12: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            13: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            14: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110010; // 'r'
                            15: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110110; // 'v'
                            16: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101001; // 'i'
                            17: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100011; // 'c'
                            18: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            19: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00101110; // '.'
                            default: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' ' (default)
                        endcase
                    end
                    else if((ev1_state == EMERGENCY) && (ev2_state == EMERGENCY)) begin
                        case(lcd_cnt)
                            00: {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_10000000; // Set DDRAM Address
                            01: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01001111; // 'O'
                            02: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110101; // 'u'
                            03: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110100; // 't'
                            04: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            05: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101111; // 'o'
                            06: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100110; // 'f'
                            07: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            08: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            09: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            10: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110010; // 'r'
                            11: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110110; // 'v'
                            12: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101001; // 'i'
                            13: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100011; // 'c'
                            14: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            15: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00101110; // '.'
                            default: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' ' (default)
                        endcase
                    end
                    else {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_11000000;
                end
                
                LINE2: begin
                    if((ev1_state == EMERGENCY) && (ev2_state != EMERGENCY)) begin
                        case(lcd_cnt)
                            00: {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_11000000; // Set DDRAM Address
                            01: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01010000; // 'P'
                            02: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101100; // 'l'
                            03: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            04: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100001; // 'a'
                            05: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            06: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            07: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            08: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110101; // 'u'
                            09: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            10: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            11: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            12: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01000101; // 'E'
                            13: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01010110; // 'V'
                            14: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00110010; // '2'
                            default: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' ' (default)
                        endcase
                    end
                    else if((ev1_state != EMERGENCY) && (ev2_state == EMERGENCY)) begin
                        case(lcd_cnt)
                            00: {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_11000000; // Set DDRAM Address
                            01: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01010000; // 'P'
                            02: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101100; // 'l'
                            03: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            04: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100001; // 'a'
                            05: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            06: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            07: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            08: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110101; // 'u'
                            09: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            10: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            11: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            12: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01000101; // 'E'
                            13: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01010110; // 'V'
                            14: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00110001; // '1'
                            default: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' ' (default)
                        endcase
                    end
                    else if((ev1_state == EMERGENCY) && (ev2_state == EMERGENCY)) begin
                        case(lcd_cnt)
                            00: {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_11000000; // Set DDRAM Address
                            01: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01010000; // 'P'
                            02: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101100; // 'l'
                            03: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            04: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100001; // 'a'
                            05: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            06: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            07: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            08: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110101; // 'u'
                            09: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            10: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100101; // 'e'
                            11: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' '
                            12: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            13: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110100; // 't'
                            14: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01100001; // 'a'
                            15: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01101001; // 'i'
                            16: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110010; // 'r'
                            17: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_01110011; // 's'
                            18: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00101110; // '.'
                            default: {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_0_00100000; // ' ' (default)
                        endcase
                    end
                    else {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_11000000;
                end
                DELAY_T: begin
                    if(lcd_cnt[8:0] == 9'b111111111) begin
                        {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_00011000;
                    end
                    else begin
                        {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_11000000;
                    end
                end
                CLEAR_DISP: begin
                    {LCD_RS, LCD_RW, LCD_DATA} = 10'b0_0_00000001;
                end
                default:
                    {LCD_RS, LCD_RW, LCD_DATA} = 10'b1_1_00000000;
            endcase
        end
    end
assign LCD_E = clk;   

endmodule
