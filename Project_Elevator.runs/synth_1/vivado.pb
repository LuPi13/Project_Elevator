
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:042

00:00:072	
516.4452	
200.648Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/utils_1/imports/synth_1/Project_Elevator.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2u
sC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/utils_1/imports/synth_1/Project_Elevator.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
k
Command: %s
53*	vivadotcl2:
8synth_design -top Project_Elevator -part xc7s75fgga484-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
y
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2
xc7s75Z17-347h px� 
i
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2
xc7s75Z17-349h px� 
D
Loading part %s157*device2
xc7s75fgga484-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7s75fgga484-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
23024Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 1372.031 ; gain = 448.727
h px� 
�
synthesizing module '%s'%s4497*oasys2
Project_Elevator2
 2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
48@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
oneshot_universal2
 2l
hC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/oneshot_universal.v2
48@Z8-6157h px� 
H
%s
*synth20
.	Parameter WIDTH bound to: 9 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
oneshot_universal2
 2
02
12l
hC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/oneshot_universal.v2
48@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
seg7_controller2
 2j
fC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/seg7_controller.v2
48@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
seg7_controller2
 2
02
12j
fC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/seg7_controller.v2
48@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
988@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Project_Elevator2
 2
02
12k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
48@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
ev2_summoner_reg2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
518@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
ev2_cnt_reg2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
828@Z8-6014h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
ev1_distance_reg2
Project_Elevator2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
708@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
ev2_distance_reg2
Project_Elevator2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
718@Z8-7137h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RGB2
Project_Elevator2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
198@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
sound2
Project_Elevator2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
208@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
LCD_E2
Project_Elevator2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
218@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
LCD_RS2
Project_Elevator2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
218@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
LCD_RW2
Project_Elevator2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
218@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2

LCD_DATA2
Project_Elevator2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
228@Z8-3848h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2	
RGB[11]2
Project_ElevatorZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2	
RGB[10]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[9]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[8]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[7]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[6]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[5]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[4]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[3]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[2]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[1]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[0]2
Project_ElevatorZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
sound2
Project_ElevatorZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_E2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_RS2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_RW2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[7]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[6]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[5]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[4]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[3]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[2]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[1]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[0]2
Project_ElevatorZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
emergency[1]2
Project_ElevatorZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
emergency[0]2
Project_ElevatorZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 1483.359 ; gain = 560.055
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 1483.359 ; gain = 560.055
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 1483.359 ; gain = 560.055
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0052

1483.3592
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2m
iC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/constrs_1/new/Project_Elevator.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2m
iC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/constrs_1/new/Project_Elevator.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2k
iC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/constrs_1/new/Project_Elevator.xdc2$
".Xil/Project_Elevator_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1520.2302
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0072

1520.2302
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:16 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7s75fgga484-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:08 ; elapsed = 00:00:16 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:16 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:17 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   3 Input   32 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 2     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                5 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 2     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit        Muxes := 9     
h p
x
� 
F
%s
*synth2.
,	   6 Input   12 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   7 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   6 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   6 Input    1 Bit        Muxes := 4     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 140 (col length:80)
BRAMs: 180 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2	
RGB[11]2
Project_ElevatorZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2	
RGB[10]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[9]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[8]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[7]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[6]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[5]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[4]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[3]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[2]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[1]2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
RGB[0]2
Project_ElevatorZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
sound2
Project_ElevatorZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_E2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_RS2
Project_ElevatorZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_RW2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[7]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[6]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[5]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[4]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[3]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[2]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[1]2
Project_ElevatorZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
LCD_DATA[0]2
Project_ElevatorZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
emergency[1]2
Project_ElevatorZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
emergency[0]2
Project_ElevatorZ8-7129h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
door_status_reg[1]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
488@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
488@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
488@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[11]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[10]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[9]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[8]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
VCC2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[7]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
VCC2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[6]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
VCC2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[5]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[4]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
VCC2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[3]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[2]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[1]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_control_reg[0]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
398@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[15]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[14]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[13]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[12]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[11]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[10]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[9]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[8]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[7]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[6]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[5]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[4]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[3]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[2]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_cnt_reg[1]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
538@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
summoner_reg[3]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
498@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
498@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
498@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_state_reg[3]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
928@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
928@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
928@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_state_reg[2]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
468@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
468@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
468@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_state_reg[0]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
468@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
468@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
468@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_target_reg[3]/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
948@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
948@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
948@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_target_reg[2]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_target_reg[1]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
ev1_target_reg[0]__0/Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2k
gC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.srcs/sources_1/new/Project_Elevator.v2
548@Z8-6858h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:19 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:25 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:13 ; elapsed = 00:00:25 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:13 ; elapsed = 00:00:25 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:16 ; elapsed = 00:00:30 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:16 ; elapsed = 00:00:30 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:16 ; elapsed = 00:00:30 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:16 ; elapsed = 00:00:30 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:16 ; elapsed = 00:00:30 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:16 ; elapsed = 00:00:30 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
1
%s*synth2
+------+------+------+
h px� 
1
%s*synth2
|      |Cell  |Count |
h px� 
1
%s*synth2
+------+------+------+
h px� 
1
%s*synth2
|1     |BUFG  |     1|
h px� 
1
%s*synth2
|2     |LUT1  |     1|
h px� 
1
%s*synth2
|3     |LUT3  |     1|
h px� 
1
%s*synth2
|4     |LUT4  |     1|
h px� 
1
%s*synth2
|5     |LUT5  |     3|
h px� 
1
%s*synth2
|6     |LUT6  |     1|
h px� 
1
%s*synth2
|7     |FDCE  |     1|
h px� 
1
%s*synth2
|8     |FDPE  |     7|
h px� 
1
%s*synth2
|9     |IBUF  |     2|
h px� 
1
%s*synth2
|10    |OBUF  |    18|
h px� 
1
%s*synth2
|11    |OBUFT |    24|
h px� 
1
%s*synth2
+------+------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:16 ; elapsed = 00:00:30 . Memory (MB): peak = 1520.230 ; gain = 596.926
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
c
%s
*synth2K
ISynthesis finished with 0 errors, 108 critical warnings and 27 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:11 ; elapsed = 00:00:29 . Memory (MB): peak = 1520.230 ; gain = 560.055
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:16 ; elapsed = 00:00:31 . Memory (MB): peak = 1520.230 ; gain = 596.926
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1520.2302
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1520.2302
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

f4575637Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272
632
1082
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:192

00:00:362

1520.2302	
999.730Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1520.2302
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2e
cC:/Users/lupi1/Documents/Vivado/Project_Elevator/Project_Elevator.runs/synth_1/Project_Elevator.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2k
ireport_utilization -file Project_Elevator_utilization_synth.rpt -pb Project_Elevator_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Mon Nov 18 17:48:34 2024Z17-206h px� 


End Record