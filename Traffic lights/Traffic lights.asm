
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Traffic lights.c,12 :: 		void interrupt(){
;Traffic lights.c,13 :: 		if(PIR1.TMR2IF == 1) {
	BTFSS      PIR1+0, 1
	GOTO       L_interrupt0
;Traffic lights.c,14 :: 		if(alertcounter == 0){
	MOVLW      0
	XORWF      _alertcounter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt19
	MOVLW      0
	XORWF      _alertcounter+0, 0
L__interrupt19:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt1
;Traffic lights.c,15 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;Traffic lights.c,16 :: 		if(counter == timing[state]){
	MOVF       _state+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _timing+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVF       _counter+1, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt20
	MOVF       R1+0, 0
	XORWF      _counter+0, 0
L__interrupt20:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt2
;Traffic lights.c,17 :: 		state++;
	INCF       _state+0, 1
;Traffic lights.c,18 :: 		if(state==12) {
	MOVF       _state+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
;Traffic lights.c,19 :: 		state = 0;
	CLRF       _state+0
;Traffic lights.c,20 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;Traffic lights.c,21 :: 		}
L_interrupt3:
;Traffic lights.c,22 :: 		PORTC = portcseq[state];
	MOVF       _state+0, 0
	ADDLW      _portcseq+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Traffic lights.c,23 :: 		PORTD = portdseq[state];
	MOVF       _state+0, 0
	ADDLW      _portdseq+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Traffic lights.c,24 :: 		}
L_interrupt2:
;Traffic lights.c,25 :: 		}
	GOTO       L_interrupt4
L_interrupt1:
;Traffic lights.c,27 :: 		alertcounter++;
	INCF       _alertcounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _alertcounter+1, 1
;Traffic lights.c,28 :: 		if(alertcounter >= alerttiming){
	MOVF       _alerttiming+1, 0
	SUBWF      _alertcounter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt21
	MOVF       _alerttiming+0, 0
	SUBWF      _alertcounter+0, 0
L__interrupt21:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt5
;Traffic lights.c,29 :: 		alertcounter = 0;
	CLRF       _alertcounter+0
	CLRF       _alertcounter+1
;Traffic lights.c,30 :: 		PORTC = portcseq[state];
	MOVF       _state+0, 0
	ADDLW      _portcseq+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Traffic lights.c,31 :: 		PORTD = portdseq[state];
	MOVF       _state+0, 0
	ADDLW      _portdseq+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Traffic lights.c,32 :: 		}
L_interrupt5:
;Traffic lights.c,33 :: 		}
L_interrupt4:
;Traffic lights.c,34 :: 		PIR1.TMR2IF = 0;
	BCF        PIR1+0, 1
;Traffic lights.c,35 :: 		}
L_interrupt0:
;Traffic lights.c,36 :: 		if(INTCON.RBIF == 1)
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt6
;Traffic lights.c,38 :: 		PIE1.TMR2IE = 0;
	BCF        PIE1+0, 1
;Traffic lights.c,39 :: 		if(PORTB.F4){
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt7
;Traffic lights.c,40 :: 		alertcounter = 1;
	MOVLW      1
	MOVWF      _alertcounter+0
	MOVLW      0
	MOVWF      _alertcounter+1
;Traffic lights.c,41 :: 		PORTC = alertportcseq[0];
	MOVF       _alertportcseq+0, 0
	MOVWF      PORTC+0
;Traffic lights.c,42 :: 		PORTD = alertportdseq[0];
	MOVF       _alertportdseq+0, 0
	MOVWF      PORTD+0
;Traffic lights.c,43 :: 		} else if(PORTB.F5){
	GOTO       L_interrupt8
L_interrupt7:
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt9
;Traffic lights.c,44 :: 		alertcounter = 1;
	MOVLW      1
	MOVWF      _alertcounter+0
	MOVLW      0
	MOVWF      _alertcounter+1
;Traffic lights.c,45 :: 		PORTC = alertportcseq[1];
	MOVF       _alertportcseq+1, 0
	MOVWF      PORTC+0
;Traffic lights.c,46 :: 		PORTD = alertportdseq[1];
	MOVF       _alertportdseq+1, 0
	MOVWF      PORTD+0
;Traffic lights.c,47 :: 		} else if(PORTB.F6){
	GOTO       L_interrupt10
L_interrupt9:
	BTFSS      PORTB+0, 6
	GOTO       L_interrupt11
;Traffic lights.c,48 :: 		alertcounter = 1;
	MOVLW      1
	MOVWF      _alertcounter+0
	MOVLW      0
	MOVWF      _alertcounter+1
;Traffic lights.c,49 :: 		PORTC = alertportcseq[2];
	MOVF       _alertportcseq+2, 0
	MOVWF      PORTC+0
;Traffic lights.c,50 :: 		PORTD = alertportdseq[2];
	MOVF       _alertportdseq+2, 0
	MOVWF      PORTD+0
;Traffic lights.c,51 :: 		} else if(PORTB.F7){
	GOTO       L_interrupt12
L_interrupt11:
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt13
;Traffic lights.c,52 :: 		alertcounter = 1;
	MOVLW      1
	MOVWF      _alertcounter+0
	MOVLW      0
	MOVWF      _alertcounter+1
;Traffic lights.c,53 :: 		PORTC = alertportcseq[3];
	MOVF       _alertportcseq+3, 0
	MOVWF      PORTC+0
;Traffic lights.c,54 :: 		PORTD = alertportdseq[3];
	MOVF       _alertportdseq+3, 0
	MOVWF      PORTD+0
;Traffic lights.c,55 :: 		}
L_interrupt13:
L_interrupt12:
L_interrupt10:
L_interrupt8:
;Traffic lights.c,56 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;Traffic lights.c,57 :: 		PIE1.TMR2IE = 1;
	BSF        PIE1+0, 1
;Traffic lights.c,58 :: 		}
L_interrupt6:
;Traffic lights.c,59 :: 		}
L_end_interrupt:
L__interrupt18:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Traffic lights.c,61 :: 		void main()
;Traffic lights.c,63 :: 		PORTB = 0;
	CLRF       PORTB+0
;Traffic lights.c,64 :: 		TRISB = 0b11110000;
	MOVLW      240
	MOVWF      TRISB+0
;Traffic lights.c,65 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;Traffic lights.c,66 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;Traffic lights.c,68 :: 		state = 1;
	MOVLW      1
	MOVWF      _state+0
;Traffic lights.c,69 :: 		PORTC = portcseq[state];
	MOVF       _state+0, 0
	ADDLW      _portcseq+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Traffic lights.c,70 :: 		PORTD = portdseq[state];
	MOVF       _state+0, 0
	ADDLW      _portdseq+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Traffic lights.c,72 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;Traffic lights.c,73 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;Traffic lights.c,74 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;Traffic lights.c,75 :: 		INTCON.RBIE = 1;
	BSF        INTCON+0, 3
;Traffic lights.c,77 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;Traffic lights.c,79 :: 		T2CON = 0b00111111;
	MOVLW      63
	MOVWF      T2CON+0
;Traffic lights.c,80 :: 		TMR2 = 0;
	CLRF       TMR2+0
;Traffic lights.c,81 :: 		PR2 = 0xFF;
	MOVLW      255
	MOVWF      PR2+0
;Traffic lights.c,82 :: 		PIR1.TMR2IF = 0;
	BCF        PIR1+0, 1
;Traffic lights.c,83 :: 		PIE1.TMR2IE = 1;
	BSF        PIE1+0, 1
;Traffic lights.c,85 :: 		alert = 0;
	BCF        _alert+0, BitPos(_alert+0)
;Traffic lights.c,87 :: 		while(1)
L_main15:
;Traffic lights.c,89 :: 		}
	GOTO       L_main15
;Traffic lights.c,90 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
