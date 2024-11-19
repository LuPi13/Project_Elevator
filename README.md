# Project_Elevator
### 기말과제하기싫다

- - -

## 해야할 목표
+ 엘리베이터는 2대
+ 건물은 7층 (1-7층)
1. 엘리베이터 호출
2. 엘리베이터 이동
3. 호출 시 더 빨리 오는 엘리베이터가 이동(이동시간 계산)
4. 긴급정지
5. 추가기능

- - -

## 세부 사항

### 1. 엘리베이터 호출
- ~~DIP 1-7: 엘리베이터 호출할 층 선택~~
- ~~DIP 스위치로 호출 층 선택 후, 호출버튼(SM_0) 누르기~~
- ~~8 Array 7-segment 0, 4로 엘리베이터 현재 층 표시~~

### 2. 엘리베이터 이동
- ~~엘리베이터 문이 열려있을 때 버튼스위치로 목표 층 입력 후, 출발(닫힘) 버튼스위치를 누르거나 4초가 지나면 문이 닫힘~~
- ~~문이 닫히고 2초 후에 출발~~
- ~~8 Array 7-segment 1, 5로 이동방향(U, d, -) 표시~~
- ~~한 층 이동 시간 2초, 8 Array 7-segment 2, 6으로 초 count~~
- 엘리베이터 도착 시 알림음 재생, ~~2초 후 LED4,8로 엘리베이터 개폐상태 표기~~
- ~~엘리베이터 문이 열려있을 때 아무 입력 없이 4초 지나면 문 닫히고, 목표 층 없으므로 엘리베이터 이동 없음(대기 상태)~~
- ~~위와 같이 대기 상태에서 다른 층 호출이 감지되면 즉시 이동 시작(2초 대기 X), 같은 층 호출이 감지되면 즉시 문 열리며 4초 카운트~~
- ~~문이 열려있지만 목표 층이 없는 상태에서 다른 층에서 호출 시 4초 끝나고, 2초 대기 후 출발, 같은 층 호출 시 4초 카운트 재시작~~

### 3. 호출 시 더 빨리 오는 엘리베이터가 이동(이동시간 계산)
- **전제: 엘리베이터는 항상 하나만 호출 됨**
- ~~두 엘리베이터가 모두 정지해 있을 경우, 가까운 층 엘리베이터 호출~~
- ~~둘의 거리가 동일하다면 엘리베이터 1 우선 호출~~
- ~~엘리베이터 한 개가 움직이고 있는 경우, 대기 상태인 나머지 호출~~
- 둘 다 움직이고 있는 경우, 이동 시간을 고려하여 먼저 올 수 있는 엘리베이터 호출
- 이동시간 포함 요소
    + 층 간 이동 시간(층 당 2초)
    + 문의 열림 상태(4초)
    + 문 닫히고 이동 전 대기 시간(2초)

### 4. 긴급정지
- 긴급정지 스위치(SM_8, SM_9)를 누르면 해당 엘리베이터 즉시 이동 정지
- 3 Color LED에 불빛 발생(빨강-노랑 점등?)
- Text LCD에 "EV1/2 out of service. Please use EV2/1." 출력, 문장이 기므로 주기적으로 shift 되어야 함.
- 둘 다 긴급정지 상태일 경우 "Out of service. Please use stairs." 출력

### 5. 추가기능
- 위에거나 다 하고 고민하자. 위에거 다 하기도 힘들어보인다.

- - -

## 핀 코드 및 대응기능
|SINGAL|PIN|기능|SIGNAL|PIN|기능|
|:--:|:--:|:--:|:--:|:--:|:---:|
|SM_1|K4|목표 층 선택: 1층|DIP1|Y1|호출 층 선택: 1층|
|SM_2|N8|목표 층 선택: 2층|DIP2|W3|호출 층 선택: 2층|
|SM_3|N4|목표 층 선택: 3층|DIP3|U2|호출 층 선택: 3층|
|SM_4|N1|목표 층 선택: 4층|DIP4|T1|호출 층 선택: 4층|
|SM_5|P6|목표 층 선택: 5층|DIP5|W4|호출 층 선택: 5층|
|SM_6|N6|목표 층 선택: 6층|DIP6|W1|호출 층 선택: 6층|
|SM_7|L5|목표 층 선택: 7층|DIP7|V4|호출 층 선택: 7층|
|SM_8|J2|EV1 긴급정지|DIP8|U4|ALL RESET|
|SM_9|K2|EV2 긴급정지|CLOCK|B6|Main clock: 1kHz|
|SM_10 (*)|L7||LCD_E|A6|LCD_E|
|SM_11 (0)|L1|EV 호출|LCD_RS|G6|LCD_RS|
|SM_12(#)|K6|문 닫기|LCD_RW|D6|LCD_RW|
|LED1|L4||LCD_D0|A4|LCD_D0|
|LED2|M4||LCD_D1|B2|LCD_D1|
|LED3|M2||LCD_D2|C3|LCD_D2|
|LED4|N7|EV1 개폐상태|LCD_D3|D4|LCD_D3|
|LED5|M7||LCD_D4|A2|LCD_D4|
|LED6|M3||LCD_D5|C5|LCD_D5|
|LED7|M1||LCD_D6|C1|LCD_D6|
|LED8|N5|EV2 개폐상태|LCD_D7|D1|LCD_D7|
|AR_SEG_A|F1|AR_SEG_A|AR_SEG_S0|H4|EV1 현재 층|
|AR_SEG_B|F5|AR_SEG_B|AR_SEG_S1|H6|EV1 이동 방향|
|AR_SEG_C|E2|AR_SEG_C|AR_SEG_S2|G1|EV1 카운터|
|AR_SEG_D|E4|AR_SEG_D|AR_SEG_S3|G3||
|AR_SEG_E|J1|AR_SEG_E|AR_SEG_S4|L6|EV2 현재 층|
|AR_SEG_F|J3|AR_SEG_F|AR_SEG_S5|K1|EV2 이동 방향|
|AR_SEG_G|J7|AR_SEG_G|AR_SEG_S6|K3|EV2 카운터|
|AR_SEG_DP|H2|AR_SEG_DP|AR_SEG_S7|K5||
|CLED_R1|T2|CLED_R1|CLED_R3|P2|CLED_R3|
|CLED_G1|U5|CLED_G1|CLED_G3|R7|CLED_G3|
|CLED_B1|U3|CLED_B1|CLED_B3|R5|CLED_B3|
|CLED_R2|U1|CLED_R2|CLED_R4|R3|CLED_R4|
|CLED_G2|V1|CLED_G2|CLED_G4|T6|CLED_G4|
|CLED_B2|W2|CLED_B2|CLED_B4|T3|CLED_B4|
|PIEZO|Y21|emergency sound|
