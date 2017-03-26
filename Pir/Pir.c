
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
     if (INTCON.INTF){
        UART1_write_text("\r");
        Delay_ms(1000);
        UART1_write_text("AT+CSCS=\"GSM\"\r");
        Delay_ms(1000);
        UART1_write_text("AT+CMGF=1\r");
        Delay_ms(1000);
        UART1_write_text("AT+CMGS=\"+407xxxxxxxx\"\r");    //Number to which you want to send the sms
        Delay_ms(1000);
        UART1_write_text("Test M590 SMS kit module using AT commands from Arduino mega boards - niq_ro\r");   //The text of the message to be sent
        Delay_ms(1000);
        UART1_write(0x1A);
        Delay_ms(1000);
  
        INTCON.INTF = 0;
     }
}

void main() {
    TRISC = 0;
    PORTC.F0 = 0;

    TRISB = 0b00000001;  //Signal from PIR on RB0
    INTCON.INTF = 0;
    INTCON.INTE = 1;
    OPTION_REG.INTEDG = 1;

    INTCON.PEIE = 1;
    INTCON.GIE = 1;

    UART1_Init(115200);  // M590 should be connected just to UART
    
    while(1){
    }
}