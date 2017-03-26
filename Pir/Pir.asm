
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Pir.c,14 :: 		void interrupt(){
;Pir.c,15 :: 		if (INTCON.INTF){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;Pir.c,16 :: 		UART1_write_text("\r");
	MOVLW      ?lstr1_Pir+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Pir.c,17 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt1:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt1
	DECFSZ     R12+0, 1
	GOTO       L_interrupt1
	DECFSZ     R11+0, 1
	GOTO       L_interrupt1
	NOP
	NOP
;Pir.c,18 :: 		UART1_write_text("AT+CSCS=\"GSM\"\r");
	MOVLW      ?lstr2_Pir+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Pir.c,19 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt2:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt2
	DECFSZ     R12+0, 1
	GOTO       L_interrupt2
	DECFSZ     R11+0, 1
	GOTO       L_interrupt2
	NOP
	NOP
;Pir.c,20 :: 		UART1_write_text("AT+CMGF=1\r");
	MOVLW      ?lstr3_Pir+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Pir.c,21 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt3:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt3
	DECFSZ     R12+0, 1
	GOTO       L_interrupt3
	DECFSZ     R11+0, 1
	GOTO       L_interrupt3
	NOP
	NOP
;Pir.c,22 :: 		UART1_write_text("AT+CMGS=\"+407xxxxxxxx\"\r");    //Number to which you want to send the sms
	MOVLW      ?lstr4_Pir+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Pir.c,23 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt4:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt4
	DECFSZ     R12+0, 1
	GOTO       L_interrupt4
	DECFSZ     R11+0, 1
	GOTO       L_interrupt4
	NOP
	NOP
;Pir.c,24 :: 		UART1_write_text("Test M590 SMS kit module using AT commands from Arduino mega boards - niq_ro\r");   //The text of the message to be sent
	MOVLW      ?lstr5_Pir+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Pir.c,25 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt5:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt5
	DECFSZ     R12+0, 1
	GOTO       L_interrupt5
	DECFSZ     R11+0, 1
	GOTO       L_interrupt5
	NOP
	NOP
;Pir.c,26 :: 		UART1_write(0x1A);
	MOVLW      26
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Pir.c,27 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt6:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt6
	DECFSZ     R12+0, 1
	GOTO       L_interrupt6
	DECFSZ     R11+0, 1
	GOTO       L_interrupt6
	NOP
	NOP
;Pir.c,29 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;Pir.c,30 :: 		}
L_interrupt0:
;Pir.c,31 :: 		}
L_end_interrupt:
L__interrupt10:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Pir.c,33 :: 		void main() {
;Pir.c,34 :: 		TRISC = 0;
	CLRF       TRISC+0
;Pir.c,35 :: 		PORTC.F0 = 0;
	BCF        PORTC+0, 0
;Pir.c,37 :: 		TRISB = 0b00000001;  //Signal from PIR on RB0
	MOVLW      1
	MOVWF      TRISB+0
;Pir.c,38 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;Pir.c,39 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;Pir.c,40 :: 		OPTION_REG.INTEDG = 1;
	BSF        OPTION_REG+0, 6
;Pir.c,42 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;Pir.c,43 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;Pir.c,45 :: 		UART1_Init(115200);  // M590 should be connected just to UART
	MOVLW      3
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Pir.c,47 :: 		while(1){
L_main7:
;Pir.c,48 :: 		}
	GOTO       L_main7
;Pir.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
