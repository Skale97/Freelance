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

unsigned int counter = 0;
unsigned int lcd_timing = 0;
float voltage;
int voltageh;
int voltagel;
float freq;
int freqh;
int freql;
char print[8];
char print2[8];
bit mode;

void interrupt(){
     if(INTCON.T0IF){
        counter++;
        lcd_timing++;
        TMR0 = 56;
        INTCON.T0IF = 0;
     }
     else if(PIR1.ADIF){
        voltage = (ADRESL + ADRESH*256)*5/1024.0;
        if(mode){
        if(voltage<2.0) PORTC.F0 = 1;
        else PORTC.F0 = 0;
        }
        PIR1.ADIF = 0;
     }
     else if (INTCON.INTF){
        ADCON0.GO = 1;
        freq = 8000.0/counter;
        
        if(!mode){
        if(freq>49.0 && freq<51.0) PORTC.F0 = 1;
        else PORTC.F0 = 0;
        }
        counter = 0;

        INTCON.INTF = 0;
     }
}

void main() {
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);

    TRISC = 0;
    PORTC.F0 = 0;

    ADCON0 = 0b10000000;
    ADCON1 = 0b10001110;
    ADCON0.ADON = 1;
    PIR1.ADIF = 0;
    PIE1.ADIE = 1;

    TRISB = 0b00000011;
    INTCON.INTF = 0;
    INTCON.INTE = 1;
    OPTION_REG.INTEDG = 1;

    OPTION_REG.T0CS = 0;
    OPTION_REG.PSA = 1;
    TMR0 = 56;

    INTCON.T0IF = 0;
    INTCON.T0IE = 1;

    Lcd_Out(1, 1, "Dev: skalesms");
    Lcd_Out(2, 1, "@gmail.com");

    Delay_ms(300);
     Lcd_Cmd(_LCD_CLEAR);
    INTCON.PEIE = 1;
    INTCON.GIE = 1;

    while(1){
    if(PORTB.F1) mode = 1;
    else mode = 0;
    
        if(lcd_timing>1000){
         lcd_timing = 0;

         Lcd_Out(1, 1, "                ");
          if(mode){
         voltageh = voltage;
         voltagel = voltage*100;
         voltagel%=100;



         Lcd_Out(1, 1, "Voltage: ");
         IntToStr(voltageh, print);
         ltrim(print);
         strcat(print, ".");
         IntToStr(voltagel, print2);
         ltrim(print2);
         strcat(print, print2);
         strcat(print, " V");
         Lcd_Out(1, 10, print);
         }
         else{

         freqh = freq;
         freql = freq*100;
         freql%=100;
         
         Lcd_Out(1, 1, "Freq: ");
         IntToStr(freqh, print);
         ltrim(print);
         strcat(print, ".");
         IntToStr(freql, print2);
         ltrim(print2);
         strcat(print, print2);
         strcat(print, " Hz");
         Lcd_Out(1, 9, print);
         }
        }
    }
}