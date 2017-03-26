unsigned int timing[12]     = {500, 700, 1000, 1500, 1700, 2000, 2500, 2700, 3000, 3500, 3700, 4000};
unsigned int alerttiming   = 400;
unsigned int counter       = 0;
unsigned short portcseq[12] = {0b00100100, 0b00100100, 0b00100100, 0b01100100, 0b10100100, 0b00100100, 0b00001100, 0b00010100, 0b00100100, 0b00100001, 0b00100010, 0b00100100};
unsigned short portdseq[12] = {0b00000011, 0b00000101, 0b00001001, 0b00001000, 0b00001000, 0b00001001, 0b00001001, 0b00001001, 0b00001001, 0b00001001, 0b00001001, 0b00001001};
unsigned short alertportcseq[4] = {0b00100001, 0b00001100, 0b01100100, 0b00100100};
unsigned short alertportdseq[4] = {0b00001001, 0b00001001, 0b00001000, 0b00000011};
short state;
bit alert;
unsigned int alertcounter  = 0;

void interrupt(){
   if(PIR1.TMR2IF == 1) {
      if(alertcounter == 0){
         counter++;
         if(counter == timing[state]){
           state++;
           if(state==12) {
              state = 0;
              counter = 0;
           }
           PORTC = portcseq[state];
           PORTD = portdseq[state];
         }
      }
      else{
       alertcounter++;
       if(alertcounter >= alerttiming){
           alertcounter = 0;
           PORTC = portcseq[state];
           PORTD = portdseq[state];
           }
      }
         PIR1.TMR2IF = 0;
  }
  if(INTCON.RBIF == 1)
  {
     PIE1.TMR2IE = 0;
     if(PORTB.F4){
        alertcounter = 1;
        PORTC = alertportcseq[0];
        PORTD = alertportdseq[0];
     } else if(PORTB.F5){
        alertcounter = 1;
        PORTC = alertportcseq[1];
        PORTD = alertportdseq[1];
     } else if(PORTB.F6){
        alertcounter = 1;
        PORTC = alertportcseq[2];
        PORTD = alertportdseq[2];
     } else if(PORTB.F7){
        alertcounter = 1;
        PORTC = alertportcseq[3];
        PORTD = alertportdseq[3];
     }
     INTCON.RBIF = 0;
     PIE1.TMR2IE = 1;
  }
}

void main()
{
  PORTB = 0;
  TRISB = 0b11110000;
  TRISC = 0b00000000;
  TRISD = 0b00000000;
  
  state = 1;
  PORTC = portcseq[state];
  PORTD = portdseq[state];

  INTCON.GIE = 1;
  INTCON.PEIE = 1;
  INTCON.RBIF = 0;
  INTCON.RBIE = 1;

  Delay_ms(500);

  T2CON = 0b00111111;
  TMR2 = 0;
  PR2 = 0xFF;
  PIR1.TMR2IF = 0;
  PIE1.TMR2IE = 1;

  alert = 0;
  
  while(1)
  {
  }
}