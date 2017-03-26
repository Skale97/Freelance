#line 1 "C:/Users/Marko/Desktop/CarOverspeeCheck/CarOverspeedCheck.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


unsigned short speed;
unsigned short speedLimit;
bit delay;
int counter;

void interrupt()
{
if(PIR1.TMR2IF == 1) {
counter++;
PIR1.TMR2IF = 0;

}
 if(INTCON.RBIF == 1)
 {
 INTCON.RBIE = 0;
 if (PORTB.F5) {
 Delay_ms(50);
 counter = 0;
 T2CON = 0b00111111;
 PORTC.F1 = 0;
 }
 else if(PORTB.F7){
 T2CON = 0b00111011;
 speed = counter;
 delay = 1;
 if(speed >= speedLimit)
 PORTC.F1=1;
 else
 PORTC.F1=0;
 }
 }
 INTCON.RBIF = 0;
 INTCON.RBIE = 1;
}

void main()
{
 char txt[7];
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 TRISB = 0b10100000;
 TRISC = 0b00000000;
 PORTC.F1 = 0;
 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.RBIF = 0;
 INTCON.RBIE = 1;

 Lcd_Out(1,1,"Dev: skalesms");
 Lcd_Out(2,1,"@gmail.com");

 Delay_ms(300);
 Lcd_Cmd(_LCD_CLEAR);

 T2CON = 0b00111011;
 TMR2 = 0;
 PR2 = 0xFF;
 delay = 0;
 PIE1.TMR2IE = 1;

 speedLimit = 20;

 while(1)
 {
 speed = counter;
 IntToStr(speed, txt);
 Lcd_Out(1,1,txt);
 if(PORTC.F1)
 Lcd_Out(2, 1, "OVERSPEED");
 else
 Lcd_Out(2,1,"          ");
 if(delay){
 Delay_ms(150);
 delay = 0;
 }
 }
}
