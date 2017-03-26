#line 1 "E:/Podaci/Programiranje/Freelance/Winding Machine/Code/Winding Machine.c"
const code char empty[] = "               ";
const code char menu11[] = "Number of turns";
const code char menu12[] = "     NEXT ";
const code char menu22[] = "    <NEXT>";
const code char menu31[] = "Wire width      ";
const code char menu32[] = "mm   NEXT ";
const code char menu42[] = "mm  <NEXT>";
const code char menu51[] = "Coil length     ";
const code char menu71[] = "Settings        ";
const code char menu72[] = "<SKIP>    ENTER ";
const code char menu82[] = " SKIP    <ENTER>";
const code char menu91[] = "Move carriage   ";
const code char menu92[] = "<<o  <    >   >>";
const code char menu102[] = "<<   <o   >   >>";
const code char menu112[] = "<<   <SAVE>   >>";
const code char menu122[] = "<<   <   o>   >>";
const code char menu132[] = "<<   <    >  o>>";
const code char menu141[] = "Setup saved     ";
const code char menu142[] = "<MENU>    START ";
const code char menu152[] = " MENU    <START>";
const code char menu161[] = "Progress        ";
const code char menu171[] = "Progress paused ";
const code char menu181[] = "Steps per turn  ";
const code char menu201[] = "Steps per mm    ";
const code char menu221[] = "Step delay in ms";
const code char menu241[] = "Settings saved  ";
const code char menu242[] = "<MENU> SETTINGS ";
const code char menu252[] = " MENU <SETTINGS>";


sbit LCD_RS at RD5_bit;
sbit LCD_EN at RD4_bit;
sbit LCD_D4 at RD3_bit;
sbit LCD_D5 at RD2_bit;
sbit LCD_D6 at RD1_bit;
sbit LCD_D7 at RD0_bit;

sbit LCD_RS_Direction at TRISD5_bit;
sbit LCD_EN_Direction at TRISD4_bit;
sbit LCD_D4_Direction at TRISD3_bit;
sbit LCD_D5_Direction at TRISD2_bit;
sbit LCD_D6_Direction at TRISD1_bit;
sbit LCD_D7_Direction at TRISD0_bit;


char stepTable[8] = {0b1000,

 0b0010,

 0b0100,

 0b0001,

 };
long currentPositionRotate, currentNumberOfTurns, lastRotation;
short menu, cursorPosition, select, button, clicked, start, direction, sizeofTable;
long numberOfTurns, wireWidth, coilLength, stepsPerTurn, stepsPerMM, stepDelayMs;
double rotateToMoveRatio, currentPositionMove;

void stepRotate();
void stepMove(double numberOfSteps, short direction);
char* codetxt_to_ramtxt(const char* txt);
void writeNumber(long number, short dorPosition, short offsetPosition);
long tenTo(short power);
void screenRefresh();
void numberInput(long *number, short dotPosition);
void nextButton(short dotPosition, short nextDotPosition);
void twoButton();
void moveCarriage();
void update();
void writeMemory(long number, short offset);
void readMemory(long *number, short offset);

void main() {
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);

 TRISB = 0b00000111;
 PORTB = 0;
 TRISC = 0;

 currentPositionRotate = 1;
 currentPositionMove = 1;
 menu = 1;
 cursorPosition = 5;
 select = 0;
 direction = 1;
 sizeOfTable = sizeof(stepTable)/2;

 PORTC = 0b10001000;

 readMemory(&numberOfTurns, 24);
 if(numberOfTurns != 314156){
 writeMemory(0, 0);
 writeMemory(0, 4);
 writeMemory(0, 8);
 writeMemory(0, 12);
 writeMemory(0, 16);
 writeMemory(100, 20);
 writeMemory(314156, 24);
 }
 readMemory(&numberOfTurns, 0);
 readMemory(&wireWidth, 4);
 readMemory(&coilLength, 8);
 readMemory(&stepsPerTurn, 12);
 readMemory(&stepsPerMM, 16);
 readMemory(&stepDelayMs, 20);

 clicked = 0;
 screenRefresh();
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 Lcd_Cmd(_LCD_SECOND_ROW);

 while(1){
 if (clicked == 2){
 update();
 clicked = 0;
 } else {
 if(PORTB.F2){
 button = 1;
 clicked = 1;
 } else if(PORTB.F1){
 button = 2;
 clicked = 1;
 } else if(PORTB.F0){
 button = 3;
 clicked = 1;
 } else if(clicked == 1){
 clicked = 2;
 }
 }

 if(start == 1 && clicked == 0){
 stepRotate();
 stepMove(rotateToMoveRatio, direction);

 if(currentPositionRotate % stepsPerTurn == 0){
 currentNumberOfTurns++;
 screenRefresh();

 if(currentNumberOfTurns == numberOfTurns){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 7, "DONE");
 Delay_ms(1000);
 start = 0;
 menu = 1;
 cursorPosition = 5;
 screenRefresh();
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 }

 if(direction != 0 && currentPositionRotate % sizeOfTable == 0){
 currentPositionRotate = 0;
 }
 }

 if(direction != 0 && (currentPositionMove >= coilLength*stepsPerMM/100.0 || currentPositionMove <= 0)){
 direction = 0;
 lastRotation = currentPositionRotate + stepsPerTurn/2.0;
 }

 if(direction == 0 && currentPositionRotate == lastRotation){
 if(currentPositionMove > 0) {
 direction = -1;
 } else {
 direction = 1;
 }
 }
 }
 }
}

void pause(long delay){
 while (delay>0){
 Delay_ms(1);
 delay--;
 }
}

void readMemory(long *number, short offset){
 short i;
 *number = 0;
 for(i = 0; i<4; i++){
 *number *= 256;
 *number += EEPROM_Read(i+offset);
 delay_ms(20);
 }
}

void writeMemory(long number, short offset){
 short i;
 for(i = 3; i>=0; i--){
 EEPROM_Write(i + offset, number % 256);
 delay_ms(20);
 number /= 256;
 }
}

void stepRotate(){
 currentPositionRotate++;
 PORTC &= 0b11110000;
 PORTC |= stepTable[currentPositionRotate % sizeOfTable];
 pause(stepDelayMs);
}

void stepMove(double numberOfSteps, short direction){
 int i;
 for(i = (currentPositionMove + 0.5); direction != 0 && direction * i < floor(direction * (currentPositionMove + direction * (numberOfSteps + 0.5))); i += direction){
 PORTC &= 0b00001111;
 PORTC |= stepTable[(i + direction) % sizeOfTable] << 4;
 pause(stepDelayMs);
 }
 currentPositionMove += direction * numberOfSteps;
}

char* codetxt_to_ramtxt(const char* ctxt){
 static char txt[20];
 char i;
 for(i = 0; txt[i] = ctxt[i]; i++);

 return txt;
}

void writeNumber(long number, short dotPosition, short offsetPosition){
 static char txt[6];
 short i;
 for(i = 5; i >= 0; i--){
 if(i == dotPosition-1){
 txt[i] = '.';
 } else {
 txt[i] = number % 10 + '0';
 number /= 10;
 }
 }
 Lcd_Out(2, 1+offsetPosition, txt);
}

long tenTo(short power){
 long result;
 result = 1;
 for (; power > 0; power--) {
 result *= 10;
 }
 return result;
}

void speed11(const code char *menu){
 Lcd_Out(1, 1, codetxt_to_ramtxt(menu));
}

void speed21(const code char *menu){
 Lcd_Out(2, 1, codetxt_to_ramtxt(menu));
}

void speed27(const code char *menu){
 Lcd_Out(2, 7, codetxt_to_ramtxt(menu));
}

void screenRefresh(){
 Lcd_Cmd(_LCD_CURSOR_OFF);
 switch(menu){
 case 1:
 speed11(menu11);
 writeNumber(numberOfTurns, 0, 0);
 speed27(menu12);
 break;
 case 2:
 writeNumber(numberOfTurns, 0, 0);
 speed27(menu22);
 break;
 case 3:
 speed11(menu31);
 writeNumber(wireWidth, 3, 0);
 speed27(menu32);
 break;
 case 4:
 writeNumber(wireWidth, 3, 0);
 speed27(menu42);
 break;
 case 5:
 speed11(menu51);
 writeNumber(coilLength, 4, 0);
 speed27(menu32);
 break;
 case 6:
 writeNumber(coilLength, 4, 0);
 speed27(menu42);
 break;
 case 7:
 speed11(menu71);
 speed21(menu72);
 break;
 case 8:
 speed21(menu82);
 break;
 case 9:
 speed11(menu91);
 speed21(menu92);
 break;
 case 10:
 speed21(menu102);
 break;
 case 11:
 speed21(menu112);
 break;
 case 12:
 speed21(menu122);
 break;
 case 13:
 speed21(menu132);
 break;
 case 14:
 speed11(menu141);
 speed21(menu142);
 break;
 case 15:
 speed21(menu152);
 break;
 case 16:
 speed11(menu161);
 writeNumber(currentNumberOfTurns, 0, 0);
 Lcd_Out(2, 7, " of ");
 writeNumber(numberOfTurns, 0, 10);
 break;
 case 17:
 speed11(menu171);
 writeNumber(currentNumberOfTurns, 0, 0);
 Lcd_Out(2, 7, " of ");
 writeNumber(numberOfTurns, 0, 10);
 break;
 case 18:
 speed11(menu181);
 writeNumber(stepsPerTurn, 0, 0);
 speed27(menu12);
 break;
 case 19:
 writeNumber(stepsPerTurn, 0, 0);
 speed27(menu22);
 break;
 case 20:
 speed11(menu201);
 writeNumber(stepsPerMM, 0, 0);
 speed27(menu12);
 break;
 case 21:
 writeNumber(stepsPerMM, 0, 0);
 speed27(menu22);
 break;
 case 22:
 speed11(menu221);
 writeNumber(stepDelayMs, 0, 0);
 speed27(menu12);
 break;
 case 23:
 writeNumber(stepDelayMs, 0, 0);
 speed27(menu22);
 break;
 case 24:
 speed11(menu241);
 speed21(menu242);
 break;
 case 25:
 speed21(menu252);
 break;
 }
}

void resetCursor(short dotPosition){
 short i;
 for (i = 0; ((cursorPosition >= 6 - dotPosition) && (i < 4 - cursorPosition)) ||
 ((cursorPosition < 6 - dotPosition) && (i < 5 - cursorPosition)); i++){
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }
}

void numberInput(long *number, short dotPosition){
long temp;
 switch(button){
 case 1:
 if(select == 0){
 Lcd_Cmd(_LCD_UNDERLINE_ON);
 select = 1;
 } else {
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 select = 0;
 }
 break;
 case 2:
 if(select == 0){
 cursorPosition--;
 if(cursorPosition == 5-dotPosition) {
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 } else if (cursorPosition < 0){
 menu++;
 screenRefresh();
 } else {
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }
 } else {
 temp = tenTo(cursorPosition);
 if(*number % (10*temp) >= 9*temp) {
 *number -= 9*temp;
 } else {
 *number += temp;
 }
 screenRefresh();
 Lcd_Cmd(_LCD_SECOND_ROW);
 resetCursor(dotPosition);
 Lcd_Cmd(_LCD_UNDERLINE_ON);
 }
 break;
 case 3:
 if(select == 0){
 cursorPosition++;
 if(dotPosition != 0 && cursorPosition == 6-dotPosition) {
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 } else if ((dotPosition != 0 && cursorPosition > 4) || cursorPosition > 5){
 Lcd_Cmd(_LCD_CURSOR_OFF);
 menu++;
 screenRefresh();
 } else{
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 }
 } else {
 temp = tenTo(cursorPosition);
 if(*number % (10*temp) < temp) {
 *number += 9*temp;
 } else {
 *number -= temp;
 }
 screenRefresh();
 Lcd_Cmd(_LCD_SECOND_ROW);
 resetCursor(dotPosition);
 Lcd_Cmd(_LCD_UNDERLINE_ON);
 }
 }
}

void nextButton(short dotPosition, short nextDotPosition){
int i;
switch(button){
 case 1:
 switch(menu){
 case 2:
 writeMemory(numberOfTurns, 0);
 break;
 case 4:
 writeMemory(wireWidth, 4);
 break;
 case 6:
 writeMemory(coilLength, 8);
 break;
 case 19:
 writeMemory(stepsPerTurn, 12);
 break;
 case 21:
 writeMemory(stepsPerMM, 16);
 break;
 case 23:
 writeMemory(stepDelayMs, 20);
 break;
 }
 menu++;
 if(nextDotPosition == 0) {
 cursorPosition = 5;
 } else {
 cursorPosition = 4;
 }
 screenRefresh();
 if(menu != 7 && menu != 24){
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 }
 break;
 case 2:
 menu--;
 if(dotPosition == 0) {
 cursorPosition = 5;
 } else {
 cursorPosition = 4;
 }
 screenRefresh();
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 Lcd_Cmd(_LCD_SECOND_ROW);
 break;
 case 3:
 menu--;
 cursorPosition = 0;
 screenRefresh();
 Lcd_Cmd(_LCD_SECOND_ROW);
 for (i = 0; i < 5; i++){
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 break;
 }
}

void twoButton(){
switch(button){
 case 1:
 switch(menu){
 case 7:
 menu = 9;
 screenRefresh();
 break;
 case 8:
 case 25:
 menu = 18;
 cursorPosition = 5;
 screenRefresh();
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 break;
 case 14:
 case 24:
 menu = 1;
 cursorPosition = 5;
 screenRefresh();
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 break;
 case 15:
 menu = 16;
 start = 1;
 rotateToMoveRatio = wireWidth*stepsPerMM*1.0/(stepsPerTurn*1000.0);
 currentPositionRotate = 0;
 currentPositionMove = 0;
 currentNumberOfTurns = 0;
 direction = 1;
 screenRefresh();
 break;
 }
 break;
 case 2:
 case 3:
 switch(menu){
 case 7:
 case 14:
 case 24:
 menu++;
 break;
 case 8:
 case 15:
 case 25:
 menu--;
 break;
 }
 screenRefresh();
 }
}

void moveCarriage(){
switch(button){
 case 1:
 switch(menu){
 case 9:
 currentPositionMove = stepsPerMM*10;
 stepMove(5*stepsPerMM, -1);
 break;
 case 10:
 currentPositionMove = stepsPerMM*10;
 stepMove(stepsPerMM, -1);
 break;
 case 11:
 menu = 14;
 screenRefresh();
 break;
 case 12:
 currentPositionMove = stepsPerMM*10;
 stepMove(stepsPerMM, +1);
 break;
 case 13:
 currentPositionMove = stepsPerMM*10;
 stepMove(5*stepsPerMM, +1);
 break;
 }
 break;
 case 2:
 switch(menu){
 case 9:
 case 10:
 case 11:
 case 12:
 menu++;
 currentPositionMove = 0;
 screenRefresh();
 break;
 case 13:
 menu = 9;
 screenRefresh();
 break;
 }
 break;
 case 3:
 switch(menu){
 case 9:
 menu = 13;
 screenRefresh();
 break;
 case 10:
 case 11:
 case 12:
 case 13:
 menu--;
 screenRefresh();
 break;
 }
 break;
 }
}

void update(){
 switch(menu){
 case 1:
 numberInput(&numberOfTurns, 0);
 break;
 case 2:
 nextButton(0, 3);
 break;
 case 3:
 numberInput(&wireWidth, 3);
 break;
 case 4:
 nextButton(3, 4);
 break;
 case 5:
 numberInput(&coilLength, 4);
 break;
 case 6:
 nextButton(4, 0);
 break;
 case 18:
 numberInput(&stepsPerTurn, 0);
 break;
 case 19:
 nextButton(0, 0);
 break;
 case 20:
 numberInput(&stepsPerMM, 0);
 break;
 case 21:
 nextButton(0, 0);
 break;
 case 22:
 numberInput(&stepDelayMs, 0);
 break;
 case 23:
 nextButton(0, 0);
 break;
 case 7:
 case 8:
 case 14:
 case 15:
 case 24:
 case 25:
 twoButton();
 break;
 case 9:
 case 10:
 case 11:
 case 12:
 case 13:
 moveCarriage();
 break;
 case 16:
 switch(button){
 case 1:
 start = 0;
 menu = 1;
 cursorPosition = 5;
 screenRefresh();
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 break;
 case 2:
 start = 0;
 menu = 17;
 screenRefresh();
 break;
 }
 break;
 case 17:
 switch(button){
 case 1:
 start = 0;
 menu = 1;
 cursorPosition = 5;
 screenRefresh();
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
 break;
 case 3:
 start = 1;
 menu = 16;
 screenRefresh();
 break;
 }
 break;
 }
}
