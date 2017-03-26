// LCD module connections
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
// End LCD module connections

unsigned int counter;
int seconds;
int minutes;
bit refresh;
bit halfSec;
int dolars;
int cents;
bit stop;

//Interrupt function will be automatically executed on Interrupt
void interrupt()
{
  if(INTCON.TMR0IF) {
    TMR0 = 5;
    counter++;
    if(counter == 125){
      halfSec = 0;
      refresh = 1;
    }
    if(counter >= 250){
      counter = 0;
      halfSec = 1;
      refresh = 1;
      seconds++;
      if(seconds >= 60){
        minutes++;
        seconds = 0;
        if(minutes >= 100){
           minutes = 0;
        }
      }
    }
    INTCON.TMR0IF = 0;
  }
  
  if(INTCON.RBIF){
     if(PORTB.F7){
       stop = ~stop;
       if(!stop){
         counter = 0;
         TMR0 = 5;
         seconds = 0;
         minutes = 0;
         dolars = 0;
         cents = 0;
       }
     }
     INTCON.RBIF = 0;
  }
}

void main()
{
  char txt[7];
  char str[7];
  float coef = 1;
  
  stop = 1;
  
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);

  TRISB = 0b10000000;
  INTCON.GIE  = 1;
  INTCON.PEIE = 1;
  INTCON.RBIF = 0;
  INTCON.RBIE = 1;

  OPTION_REG = 0b11000100;
  TMR0 = 5;
  INTCON.TMR0IF = 0;
  INTCON.TMR0IE = 1;
  
  Lcd_Out(1,1,"Dev: skalesms");
  Lcd_Out(2,1,"@gmail.com");

  Delay_ms(300);
  Lcd_Cmd(_LCD_CLEAR);
  
  Lcd_Out(1, 1, "00:00      0,00$");


  while(1)
  {
    if(refresh){
      refresh = 0;
      if(!stop){
        IntToStrWithZeros(minutes, txt);
        dolars = minutes*coef;
        str[0] = txt[4];
        str[1] = txt[5];

        if(halfSec) str[2] = ':';
        else str[2] = ' ';
      
        IntToStrWithZeros(seconds, txt);
        cents = seconds*10*coef/6;
        str[3] = txt[4];
        str[4] = txt[5];
        str[5] = 0;

        Lcd_Out(1,1,str);
      
        IntToStr(dolars, txt);
        str[0] = txt[4];
        str[1] = txt[5];
        str[2] = ',';
        IntToStrWithZeros(cents, txt);
        str[3] = txt[4];
        str[4] = txt[5];
        str[5] = '$';
        str[6] = 0;

        Lcd_Out(1,11,str);
      

        Lcd_Out(2,4, "Driving");
      }
      else{
        Lcd_Out(2, 4, "  Stop   ");
        Lcd_Out(1, 3, ":");
      }
    }
  }
}