
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;CarOverspeedCheck.c,22 :: 		void interrupt()
;CarOverspeedCheck.c,24 :: 		if(PIR1.TMR2IF == 1) {
	BTFSS      PIR1+0, 1
	GOTO       L_interrupt0
;CarOverspeedCheck.c,25 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;CarOverspeedCheck.c,26 :: 		PIR1.TMR2IF = 0;
	BCF        PIR1+0, 1
;CarOverspeedCheck.c,28 :: 		}
L_interrupt0:
;CarOverspeedCheck.c,29 :: 		if(INTCON.RBIF == 1)                      //Makes sure that it is PORTB On-Change Interrupt
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt1
;CarOverspeedCheck.c,31 :: 		INTCON.RBIE = 0;
	BCF        INTCON+0, 3
;CarOverspeedCheck.c,32 :: 		if (PORTB.F5)  {
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt2
;CarOverspeedCheck.c,33 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_interrupt3:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt3
	DECFSZ     R12+0, 1
	GOTO       L_interrupt3
	NOP
	NOP
;CarOverspeedCheck.c,34 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;CarOverspeedCheck.c,35 :: 		T2CON = 0b00111111;               //Start Timer
	MOVLW      63
	MOVWF      T2CON+0
;CarOverspeedCheck.c,36 :: 		PORTC.F1 = 0;
	BCF        PORTC+0, 1
;CarOverspeedCheck.c,37 :: 		}
	GOTO       L_interrupt4
L_interrupt2:
;CarOverspeedCheck.c,38 :: 		else if(PORTB.F7){
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt5
;CarOverspeedCheck.c,39 :: 		T2CON = 0b00111011;                //Stop Timer
	MOVLW      59
	MOVWF      T2CON+0
;CarOverspeedCheck.c,40 :: 		speed = counter;
	MOVF       _counter+0, 0
	MOVWF      _speed+0
;CarOverspeedCheck.c,41 :: 		delay = 1;
	BSF        _delay+0, BitPos(_delay+0)
;CarOverspeedCheck.c,42 :: 		if(speed >= speedLimit) //Check overspeed
	MOVF       _speedLimit+0, 0
	SUBWF      _counter+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt6
;CarOverspeedCheck.c,43 :: 		PORTC.F1=1;                             //Activate buzzer
	BSF        PORTC+0, 1
	GOTO       L_interrupt7
L_interrupt6:
;CarOverspeedCheck.c,45 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
L_interrupt7:
;CarOverspeedCheck.c,46 :: 		}
L_interrupt5:
L_interrupt4:
;CarOverspeedCheck.c,47 :: 		}
L_interrupt1:
;CarOverspeedCheck.c,48 :: 		INTCON.RBIF = 0;                     //Clear PORTB On-Change Interrupt flag
	BCF        INTCON+0, 0
;CarOverspeedCheck.c,49 :: 		INTCON.RBIE = 1;                     //Enable PORTB On-Change Interrupt
	BSF        INTCON+0, 3
;CarOverspeedCheck.c,50 :: 		}
L_end_interrupt:
L__interrupt16:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;CarOverspeedCheck.c,52 :: 		void main()
;CarOverspeedCheck.c,55 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;CarOverspeedCheck.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);                 // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CarOverspeedCheck.c,57 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);            // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CarOverspeedCheck.c,59 :: 		TRISB = 0b10100000;
	MOVLW      160
	MOVWF      TRISB+0
;CarOverspeedCheck.c,60 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;CarOverspeedCheck.c,61 :: 		PORTC.F1 = 0;
	BCF        PORTC+0, 1
;CarOverspeedCheck.c,62 :: 		INTCON.GIE = 1;                      //Global Interrupt Enable
	BSF        INTCON+0, 7
;CarOverspeedCheck.c,63 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;CarOverspeedCheck.c,64 :: 		INTCON.RBIF = 0;                     //Clear PORTB On-Change Interrupt Flag
	BCF        INTCON+0, 0
;CarOverspeedCheck.c,65 :: 		INTCON.RBIE = 1;                     //Enable PORTB On-Change Interrupt
	BSF        INTCON+0, 3
;CarOverspeedCheck.c,67 :: 		Lcd_Out(1,1,"Dev: skalesms");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_CarOverspeedCheck+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CarOverspeedCheck.c,68 :: 		Lcd_Out(2,1,"@gmail.com");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_CarOverspeedCheck+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CarOverspeedCheck.c,70 :: 		Delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;CarOverspeedCheck.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CarOverspeedCheck.c,73 :: 		T2CON = 0b00111011;                        //Initializing Timer Module
	MOVLW      59
	MOVWF      T2CON+0
;CarOverspeedCheck.c,74 :: 		TMR2 = 0;
	CLRF       TMR2+0
;CarOverspeedCheck.c,75 :: 		PR2 = 0xFF;
	MOVLW      255
	MOVWF      PR2+0
;CarOverspeedCheck.c,76 :: 		delay = 0;
	BCF        _delay+0, BitPos(_delay+0)
;CarOverspeedCheck.c,77 :: 		PIE1.TMR2IE = 1;
	BSF        PIE1+0, 1
;CarOverspeedCheck.c,79 :: 		speedLimit = 20;
	MOVLW      20
	MOVWF      _speedLimit+0
;CarOverspeedCheck.c,81 :: 		while(1)
L_main9:
;CarOverspeedCheck.c,83 :: 		speed = counter;
	MOVF       _counter+0, 0
	MOVWF      _speed+0
;CarOverspeedCheck.c,84 :: 		IntToStr(speed, txt);
	MOVF       _counter+0, 0
	MOVWF      FARG_IntToStr_input+0
	CLRF       FARG_IntToStr_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CarOverspeedCheck.c,85 :: 		Lcd_Out(1,1,txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CarOverspeedCheck.c,86 :: 		if(PORTC.F1)
	BTFSS      PORTC+0, 1
	GOTO       L_main11
;CarOverspeedCheck.c,87 :: 		Lcd_Out(2, 1, "OVERSPEED");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_CarOverspeedCheck+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main12
L_main11:
;CarOverspeedCheck.c,89 :: 		Lcd_Out(2,1,"          ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_CarOverspeedCheck+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main12:
;CarOverspeedCheck.c,90 :: 		if(delay){
	BTFSS      _delay+0, BitPos(_delay+0)
	GOTO       L_main13
;CarOverspeedCheck.c,91 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
;CarOverspeedCheck.c,92 :: 		delay = 0;
	BCF        _delay+0, BitPos(_delay+0)
;CarOverspeedCheck.c,93 :: 		}
L_main13:
;CarOverspeedCheck.c,94 :: 		}
	GOTO       L_main9
;CarOverspeedCheck.c,95 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
