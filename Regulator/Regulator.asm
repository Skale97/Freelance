
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Regulator.c,29 :: 		void interrupt(){
;Regulator.c,30 :: 		if(INTCON.T0IF){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
;Regulator.c,31 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;Regulator.c,32 :: 		lcd_timing++;
	INCF       _lcd_timing+0, 1
	BTFSC      STATUS+0, 2
	INCF       _lcd_timing+1, 1
;Regulator.c,33 :: 		TMR0 = 56;
	MOVLW      56
	MOVWF      TMR0+0
;Regulator.c,34 :: 		INTCON.T0IF = 0;
	BCF        INTCON+0, 2
;Regulator.c,35 :: 		}
	GOTO       L_interrupt1
L_interrupt0:
;Regulator.c,36 :: 		else if(PIR1.ADIF){
	BTFSS      PIR1+0, 6
	GOTO       L_interrupt2
;Regulator.c,37 :: 		voltage = (ADRESL + ADRESH*256)*5/1024.0;
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _voltage+0
	MOVF       R0+1, 0
	MOVWF      _voltage+1
	MOVF       R0+2, 0
	MOVWF      _voltage+2
	MOVF       R0+3, 0
	MOVWF      _voltage+3
;Regulator.c,38 :: 		if(mode){
	BTFSS      _mode+0, BitPos(_mode+0)
	GOTO       L_interrupt3
;Regulator.c,39 :: 		if(voltage<2.0) PORTC.F0 = 1;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	MOVF       _voltage+0, 0
	MOVWF      R0+0
	MOVF       _voltage+1, 0
	MOVWF      R0+1
	MOVF       _voltage+2, 0
	MOVWF      R0+2
	MOVF       _voltage+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt4
	BSF        PORTC+0, 0
	GOTO       L_interrupt5
L_interrupt4:
;Regulator.c,40 :: 		else PORTC.F0 = 0;
	BCF        PORTC+0, 0
L_interrupt5:
;Regulator.c,41 :: 		}
L_interrupt3:
;Regulator.c,42 :: 		PIR1.ADIF = 0;
	BCF        PIR1+0, 6
;Regulator.c,43 :: 		}
	GOTO       L_interrupt6
L_interrupt2:
;Regulator.c,44 :: 		else if (INTCON.INTF){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt7
;Regulator.c,45 :: 		ADCON0.GO = 1;
	BSF        ADCON0+0, 2
;Regulator.c,46 :: 		freq = 8000.0/counter;
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      122
	MOVWF      R0+2
	MOVLW      139
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _freq+0
	MOVF       R0+1, 0
	MOVWF      _freq+1
	MOVF       R0+2, 0
	MOVWF      _freq+2
	MOVF       R0+3, 0
	MOVWF      _freq+3
;Regulator.c,48 :: 		if(!mode){
	BTFSC      _mode+0, BitPos(_mode+0)
	GOTO       L_interrupt8
;Regulator.c,49 :: 		if(freq>49.0 && freq<51.0) PORTC.F0 = 1;
	MOVF       _freq+0, 0
	MOVWF      R4+0
	MOVF       _freq+1, 0
	MOVWF      R4+1
	MOVF       _freq+2, 0
	MOVWF      R4+2
	MOVF       _freq+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      68
	MOVWF      R0+2
	MOVLW      132
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt11
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	MOVF       _freq+0, 0
	MOVWF      R0+0
	MOVF       _freq+1, 0
	MOVWF      R0+1
	MOVF       _freq+2, 0
	MOVWF      R0+2
	MOVF       _freq+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt11
L__interrupt21:
	BSF        PORTC+0, 0
	GOTO       L_interrupt12
L_interrupt11:
;Regulator.c,50 :: 		else PORTC.F0 = 0;
	BCF        PORTC+0, 0
L_interrupt12:
;Regulator.c,51 :: 		}
L_interrupt8:
;Regulator.c,52 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;Regulator.c,54 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;Regulator.c,55 :: 		}
L_interrupt7:
L_interrupt6:
L_interrupt1:
;Regulator.c,56 :: 		}
L_end_interrupt:
L__interrupt23:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Regulator.c,58 :: 		void main() {
;Regulator.c,59 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Regulator.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Regulator.c,61 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Regulator.c,63 :: 		TRISC = 0;
	CLRF       TRISC+0
;Regulator.c,64 :: 		PORTC.F0 = 0;
	BCF        PORTC+0, 0
;Regulator.c,66 :: 		ADCON0 = 0b10000000;
	MOVLW      128
	MOVWF      ADCON0+0
;Regulator.c,67 :: 		ADCON1 = 0b10001110;
	MOVLW      142
	MOVWF      ADCON1+0
;Regulator.c,68 :: 		ADCON0.ADON = 1;
	BSF        ADCON0+0, 0
;Regulator.c,69 :: 		PIR1.ADIF = 0;
	BCF        PIR1+0, 6
;Regulator.c,70 :: 		PIE1.ADIE = 1;
	BSF        PIE1+0, 6
;Regulator.c,72 :: 		TRISB = 0b00000011;
	MOVLW      3
	MOVWF      TRISB+0
;Regulator.c,73 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;Regulator.c,74 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;Regulator.c,75 :: 		OPTION_REG.INTEDG = 1;
	BSF        OPTION_REG+0, 6
;Regulator.c,77 :: 		OPTION_REG.T0CS = 0;
	BCF        OPTION_REG+0, 5
;Regulator.c,78 :: 		OPTION_REG.PSA = 1;
	BSF        OPTION_REG+0, 3
;Regulator.c,79 :: 		TMR0 = 56;
	MOVLW      56
	MOVWF      TMR0+0
;Regulator.c,81 :: 		INTCON.T0IF = 0;
	BCF        INTCON+0, 2
;Regulator.c,82 :: 		INTCON.T0IE = 1;
	BSF        INTCON+0, 5
;Regulator.c,84 :: 		Lcd_Out(1, 1, "Dev: skalesms");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Regulator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Regulator.c,85 :: 		Lcd_Out(2, 1, "@gmail.com");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Regulator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Regulator.c,87 :: 		Delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Regulator.c,88 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Regulator.c,89 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;Regulator.c,90 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;Regulator.c,92 :: 		while(1){
L_main14:
;Regulator.c,93 :: 		if(PORTB.F1) mode = 1;
	BTFSS      PORTB+0, 1
	GOTO       L_main16
	BSF        _mode+0, BitPos(_mode+0)
	GOTO       L_main17
L_main16:
;Regulator.c,94 :: 		else mode = 0;
	BCF        _mode+0, BitPos(_mode+0)
L_main17:
;Regulator.c,96 :: 		if(lcd_timing>1000){
	MOVF       _lcd_timing+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVF       _lcd_timing+0, 0
	SUBLW      232
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main18
;Regulator.c,97 :: 		lcd_timing = 0;
	CLRF       _lcd_timing+0
	CLRF       _lcd_timing+1
;Regulator.c,99 :: 		Lcd_Out(1, 1, "                ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Regulator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Regulator.c,100 :: 		if(mode){
	BTFSS      _mode+0, BitPos(_mode+0)
	GOTO       L_main19
;Regulator.c,101 :: 		voltageh = voltage;
	MOVF       _voltage+0, 0
	MOVWF      R0+0
	MOVF       _voltage+1, 0
	MOVWF      R0+1
	MOVF       _voltage+2, 0
	MOVWF      R0+2
	MOVF       _voltage+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _voltageh+0
	MOVF       R0+1, 0
	MOVWF      _voltageh+1
;Regulator.c,102 :: 		voltagel = voltage*100;
	MOVF       _voltage+0, 0
	MOVWF      R0+0
	MOVF       _voltage+1, 0
	MOVWF      R0+1
	MOVF       _voltage+2, 0
	MOVWF      R0+2
	MOVF       _voltage+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _voltagel+0
	MOVF       R0+1, 0
	MOVWF      _voltagel+1
;Regulator.c,103 :: 		voltagel%=100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _voltagel+0
	MOVF       R0+1, 0
	MOVWF      _voltagel+1
;Regulator.c,107 :: 		Lcd_Out(1, 1, "Voltage: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Regulator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Regulator.c,108 :: 		IntToStr(voltageh, print);
	MOVF       _voltageh+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _voltageh+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _print+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Regulator.c,109 :: 		ltrim(print);
	MOVLW      _print+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
;Regulator.c,110 :: 		strcat(print, ".");
	MOVLW      _print+0
	MOVWF      FARG_strcat_to+0
	MOVLW      ?lstr5_Regulator+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
;Regulator.c,111 :: 		IntToStr(voltagel, print2);
	MOVF       _voltagel+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _voltagel+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _print2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Regulator.c,112 :: 		ltrim(print2);
	MOVLW      _print2+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
;Regulator.c,113 :: 		strcat(print, print2);
	MOVLW      _print+0
	MOVWF      FARG_strcat_to+0
	MOVLW      _print2+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
;Regulator.c,114 :: 		strcat(print, " V");
	MOVLW      _print+0
	MOVWF      FARG_strcat_to+0
	MOVLW      ?lstr6_Regulator+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
;Regulator.c,115 :: 		Lcd_Out(1, 10, print);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _print+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Regulator.c,116 :: 		}
	GOTO       L_main20
L_main19:
;Regulator.c,119 :: 		freqh = freq;
	MOVF       _freq+0, 0
	MOVWF      R0+0
	MOVF       _freq+1, 0
	MOVWF      R0+1
	MOVF       _freq+2, 0
	MOVWF      R0+2
	MOVF       _freq+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _freqh+0
	MOVF       R0+1, 0
	MOVWF      _freqh+1
;Regulator.c,120 :: 		freql = freq*100;
	MOVF       _freq+0, 0
	MOVWF      R0+0
	MOVF       _freq+1, 0
	MOVWF      R0+1
	MOVF       _freq+2, 0
	MOVWF      R0+2
	MOVF       _freq+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _freql+0
	MOVF       R0+1, 0
	MOVWF      _freql+1
;Regulator.c,121 :: 		freql%=100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _freql+0
	MOVF       R0+1, 0
	MOVWF      _freql+1
;Regulator.c,123 :: 		Lcd_Out(1, 1, "Freq: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Regulator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Regulator.c,124 :: 		IntToStr(freqh, print);
	MOVF       _freqh+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _freqh+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _print+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Regulator.c,125 :: 		ltrim(print);
	MOVLW      _print+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
;Regulator.c,126 :: 		strcat(print, ".");
	MOVLW      _print+0
	MOVWF      FARG_strcat_to+0
	MOVLW      ?lstr8_Regulator+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
;Regulator.c,127 :: 		IntToStr(freql, print2);
	MOVF       _freql+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _freql+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _print2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Regulator.c,128 :: 		ltrim(print2);
	MOVLW      _print2+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
;Regulator.c,129 :: 		strcat(print, print2);
	MOVLW      _print+0
	MOVWF      FARG_strcat_to+0
	MOVLW      _print2+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
;Regulator.c,130 :: 		strcat(print, " Hz");
	MOVLW      _print+0
	MOVWF      FARG_strcat_to+0
	MOVLW      ?lstr9_Regulator+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
;Regulator.c,131 :: 		Lcd_Out(1, 9, print);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _print+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Regulator.c,132 :: 		}
L_main20:
;Regulator.c,133 :: 		}
L_main18:
;Regulator.c,134 :: 		}
	GOTO       L_main14
;Regulator.c,135 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
