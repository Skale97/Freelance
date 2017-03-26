
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Taxi.c,27 :: 		void interrupt()
;Taxi.c,29 :: 		if(INTCON.TMR0IF) {
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
;Taxi.c,30 :: 		TMR0 = 5;
	MOVLW      5
	MOVWF      TMR0+0
;Taxi.c,31 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;Taxi.c,32 :: 		if(counter == 125){
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt18
	MOVLW      125
	XORWF      _counter+0, 0
L__interrupt18:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt1
;Taxi.c,33 :: 		halfSec = 0;
	BCF        _halfSec+0, BitPos(_halfSec+0)
;Taxi.c,34 :: 		refresh = 1;
	BSF        _refresh+0, BitPos(_refresh+0)
;Taxi.c,35 :: 		}
L_interrupt1:
;Taxi.c,36 :: 		if(counter >= 250){
	MOVLW      0
	SUBWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt19
	MOVLW      250
	SUBWF      _counter+0, 0
L__interrupt19:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt2
;Taxi.c,37 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;Taxi.c,38 :: 		halfSec = 1;
	BSF        _halfSec+0, BitPos(_halfSec+0)
;Taxi.c,39 :: 		refresh = 1;
	BSF        _refresh+0, BitPos(_refresh+0)
;Taxi.c,40 :: 		seconds++;
	INCF       _seconds+0, 1
	BTFSC      STATUS+0, 2
	INCF       _seconds+1, 1
;Taxi.c,41 :: 		if(seconds >= 60){
	MOVLW      128
	XORWF      _seconds+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt20
	MOVLW      60
	SUBWF      _seconds+0, 0
L__interrupt20:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt3
;Taxi.c,42 :: 		minutes++;
	INCF       _minutes+0, 1
	BTFSC      STATUS+0, 2
	INCF       _minutes+1, 1
;Taxi.c,43 :: 		seconds = 0;
	CLRF       _seconds+0
	CLRF       _seconds+1
;Taxi.c,44 :: 		if(minutes >= 100){
	MOVLW      128
	XORWF      _minutes+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt21
	MOVLW      100
	SUBWF      _minutes+0, 0
L__interrupt21:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt4
;Taxi.c,45 :: 		minutes = 0;
	CLRF       _minutes+0
	CLRF       _minutes+1
;Taxi.c,46 :: 		}
L_interrupt4:
;Taxi.c,47 :: 		}
L_interrupt3:
;Taxi.c,48 :: 		}
L_interrupt2:
;Taxi.c,49 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;Taxi.c,50 :: 		}
L_interrupt0:
;Taxi.c,52 :: 		if(INTCON.RBIF){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt5
;Taxi.c,53 :: 		if(PORTB.F7){
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt6
;Taxi.c,54 :: 		stop = ~stop;
	MOVLW
	XORWF      _stop+0, 1
;Taxi.c,55 :: 		if(!stop){
	BTFSC      _stop+0, BitPos(_stop+0)
	GOTO       L_interrupt7
;Taxi.c,56 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;Taxi.c,57 :: 		TMR0 = 5;
	MOVLW      5
	MOVWF      TMR0+0
;Taxi.c,58 :: 		seconds = 0;
	CLRF       _seconds+0
	CLRF       _seconds+1
;Taxi.c,59 :: 		minutes = 0;
	CLRF       _minutes+0
	CLRF       _minutes+1
;Taxi.c,60 :: 		dolars = 0;
	CLRF       _dolars+0
	CLRF       _dolars+1
;Taxi.c,61 :: 		cents = 0;
	CLRF       _cents+0
	CLRF       _cents+1
;Taxi.c,62 :: 		}
L_interrupt7:
;Taxi.c,63 :: 		}
L_interrupt6:
;Taxi.c,64 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;Taxi.c,65 :: 		}
L_interrupt5:
;Taxi.c,66 :: 		}
L_end_interrupt:
L__interrupt17:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Taxi.c,68 :: 		void main()
;Taxi.c,72 :: 		float coef = 1;
	MOVLW      0
	MOVWF      main_coef_L0+0
	MOVLW      0
	MOVWF      main_coef_L0+1
	MOVLW      0
	MOVWF      main_coef_L0+2
	MOVLW      127
	MOVWF      main_coef_L0+3
;Taxi.c,74 :: 		stop = 1;
	BSF        _stop+0, BitPos(_stop+0)
;Taxi.c,76 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Taxi.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Taxi.c,78 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Taxi.c,80 :: 		TRISB = 0b10000000;
	MOVLW      128
	MOVWF      TRISB+0
;Taxi.c,81 :: 		INTCON.GIE  = 1;
	BSF        INTCON+0, 7
;Taxi.c,82 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;Taxi.c,83 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;Taxi.c,84 :: 		INTCON.RBIE = 1;
	BSF        INTCON+0, 3
;Taxi.c,86 :: 		OPTION_REG = 0b11000100;
	MOVLW      196
	MOVWF      OPTION_REG+0
;Taxi.c,87 :: 		TMR0 = 5;
	MOVLW      5
	MOVWF      TMR0+0
;Taxi.c,88 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;Taxi.c,89 :: 		INTCON.TMR0IE = 1;
	BSF        INTCON+0, 5
;Taxi.c,91 :: 		Lcd_Out(1,1,"Dev: skalesms");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Taxi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Taxi.c,92 :: 		Lcd_Out(2,1,"@gmail.com");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Taxi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Taxi.c,94 :: 		Delay_ms(300);
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
;Taxi.c,95 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Taxi.c,97 :: 		Lcd_Out(1, 1, "00:00      0,00$");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Taxi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Taxi.c,100 :: 		while(1)
L_main9:
;Taxi.c,102 :: 		if(refresh){
	BTFSS      _refresh+0, BitPos(_refresh+0)
	GOTO       L_main11
;Taxi.c,103 :: 		refresh = 0;
	BCF        _refresh+0, BitPos(_refresh+0)
;Taxi.c,104 :: 		if(!stop){
	BTFSC      _stop+0, BitPos(_stop+0)
	GOTO       L_main12
;Taxi.c,105 :: 		IntToStrWithZeros(minutes, txt);
	MOVF       _minutes+0, 0
	MOVWF      FARG_IntToStrWithZeros_input+0
	MOVF       _minutes+1, 0
	MOVWF      FARG_IntToStrWithZeros_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStrWithZeros_output+0
	CALL       _IntToStrWithZeros+0
;Taxi.c,106 :: 		dolars = minutes*coef;
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	MOVF       _minutes+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVF       main_coef_L0+0, 0
	MOVWF      R4+0
	MOVF       main_coef_L0+1, 0
	MOVWF      R4+1
	MOVF       main_coef_L0+2, 0
	MOVWF      R4+2
	MOVF       main_coef_L0+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _dolars+0
	MOVF       R0+1, 0
	MOVWF      _dolars+1
;Taxi.c,107 :: 		str[0] = txt[4];
	MOVF       main_txt_L0+4, 0
	MOVWF      main_str_L0+0
;Taxi.c,108 :: 		str[1] = txt[5];
	MOVF       main_txt_L0+5, 0
	MOVWF      main_str_L0+1
;Taxi.c,110 :: 		if(halfSec) str[2] = ':';
	BTFSS      _halfSec+0, BitPos(_halfSec+0)
	GOTO       L_main13
	MOVLW      58
	MOVWF      main_str_L0+2
	GOTO       L_main14
L_main13:
;Taxi.c,111 :: 		else str[2] = ' ';
	MOVLW      32
	MOVWF      main_str_L0+2
L_main14:
;Taxi.c,113 :: 		IntToStrWithZeros(seconds, txt);
	MOVF       _seconds+0, 0
	MOVWF      FARG_IntToStrWithZeros_input+0
	MOVF       _seconds+1, 0
	MOVWF      FARG_IntToStrWithZeros_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStrWithZeros_output+0
	CALL       _IntToStrWithZeros+0
;Taxi.c,114 :: 		cents = seconds*10*coef/6;
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	MOVF       _seconds+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	CALL       _int2double+0
	MOVF       main_coef_L0+0, 0
	MOVWF      R4+0
	MOVF       main_coef_L0+1, 0
	MOVWF      R4+1
	MOVF       main_coef_L0+2, 0
	MOVWF      R4+2
	MOVF       main_coef_L0+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      64
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _cents+0
	MOVF       R0+1, 0
	MOVWF      _cents+1
;Taxi.c,115 :: 		str[3] = txt[4];
	MOVF       main_txt_L0+4, 0
	MOVWF      main_str_L0+3
;Taxi.c,116 :: 		str[4] = txt[5];
	MOVF       main_txt_L0+5, 0
	MOVWF      main_str_L0+4
;Taxi.c,117 :: 		str[5] = 0;
	CLRF       main_str_L0+5
;Taxi.c,119 :: 		Lcd_Out(1,1,str);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_str_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Taxi.c,121 :: 		IntToStr(dolars, txt);
	MOVF       _dolars+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _dolars+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Taxi.c,122 :: 		str[0] = txt[4];
	MOVF       main_txt_L0+4, 0
	MOVWF      main_str_L0+0
;Taxi.c,123 :: 		str[1] = txt[5];
	MOVF       main_txt_L0+5, 0
	MOVWF      main_str_L0+1
;Taxi.c,124 :: 		str[2] = ',';
	MOVLW      44
	MOVWF      main_str_L0+2
;Taxi.c,125 :: 		IntToStrWithZeros(cents, txt);
	MOVF       _cents+0, 0
	MOVWF      FARG_IntToStrWithZeros_input+0
	MOVF       _cents+1, 0
	MOVWF      FARG_IntToStrWithZeros_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStrWithZeros_output+0
	CALL       _IntToStrWithZeros+0
;Taxi.c,126 :: 		str[3] = txt[4];
	MOVF       main_txt_L0+4, 0
	MOVWF      main_str_L0+3
;Taxi.c,127 :: 		str[4] = txt[5];
	MOVF       main_txt_L0+5, 0
	MOVWF      main_str_L0+4
;Taxi.c,128 :: 		str[5] = '$';
	MOVLW      36
	MOVWF      main_str_L0+5
;Taxi.c,129 :: 		str[6] = 0;
	CLRF       main_str_L0+6
;Taxi.c,131 :: 		Lcd_Out(1,11,str);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_str_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Taxi.c,134 :: 		Lcd_Out(2,4, "Driving");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Taxi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Taxi.c,135 :: 		}
	GOTO       L_main15
L_main12:
;Taxi.c,137 :: 		Lcd_Out(2, 4, "  Stop   ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Taxi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Taxi.c,138 :: 		Lcd_Out(1, 3, ":");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Taxi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Taxi.c,139 :: 		}
L_main15:
;Taxi.c,140 :: 		}
L_main11:
;Taxi.c,141 :: 		}
	GOTO       L_main9
;Taxi.c,142 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
