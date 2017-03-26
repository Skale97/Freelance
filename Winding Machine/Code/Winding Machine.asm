
_main:

;Winding Machine.c,74 :: 		void main() {
;Winding Machine.c,75 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Winding Machine.c,76 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,78 :: 		TRISB = 0b00000111;
	MOVLW      7
	MOVWF      TRISB+0
;Winding Machine.c,79 :: 		PORTB = 0;
	CLRF       PORTB+0
;Winding Machine.c,80 :: 		TRISC = 0;
	CLRF       TRISC+0
;Winding Machine.c,82 :: 		currentPositionRotate = 1;
	MOVLW      1
	MOVWF      _currentPositionRotate+0
	CLRF       _currentPositionRotate+1
	CLRF       _currentPositionRotate+2
	CLRF       _currentPositionRotate+3
;Winding Machine.c,83 :: 		currentPositionMove = 1;
	MOVLW      0
	MOVWF      _currentPositionMove+0
	MOVLW      0
	MOVWF      _currentPositionMove+1
	MOVLW      0
	MOVWF      _currentPositionMove+2
	MOVLW      127
	MOVWF      _currentPositionMove+3
;Winding Machine.c,84 :: 		menu = 1;
	MOVLW      1
	MOVWF      _menu+0
;Winding Machine.c,85 :: 		cursorPosition = 5;
	MOVLW      5
	MOVWF      _cursorPosition+0
;Winding Machine.c,86 :: 		select = 0;
	CLRF       _select+0
;Winding Machine.c,87 :: 		direction = 1;
	MOVLW      1
	MOVWF      _direction+0
;Winding Machine.c,88 :: 		sizeOfTable = sizeof(stepTable)/2;
	MOVLW      4
	MOVWF      _sizeofTable+0
;Winding Machine.c,90 :: 		PORTC = 0b10001000;
	MOVLW      136
	MOVWF      PORTC+0
;Winding Machine.c,92 :: 		readMemory(&numberOfTurns, 24);
	MOVLW      _numberOfTurns+0
	MOVWF      FARG_readMemory_number+0
	MOVLW      24
	MOVWF      FARG_readMemory_offset+0
	CALL       _readMemory+0
;Winding Machine.c,93 :: 		if(numberOfTurns != 314156){
	MOVF       _numberOfTurns+3, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main242
	MOVF       _numberOfTurns+2, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main242
	MOVF       _numberOfTurns+1, 0
	XORLW      203
	BTFSS      STATUS+0, 2
	GOTO       L__main242
	MOVF       _numberOfTurns+0, 0
	XORLW      44
L__main242:
	BTFSC      STATUS+0, 2
	GOTO       L_main0
;Winding Machine.c,94 :: 		writeMemory(0, 0);
	CLRF       FARG_writeMemory_number+0
	CLRF       FARG_writeMemory_number+1
	CLRF       FARG_writeMemory_number+2
	CLRF       FARG_writeMemory_number+3
	CLRF       FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,95 :: 		writeMemory(0, 4);
	CLRF       FARG_writeMemory_number+0
	CLRF       FARG_writeMemory_number+1
	CLRF       FARG_writeMemory_number+2
	CLRF       FARG_writeMemory_number+3
	MOVLW      4
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,96 :: 		writeMemory(0, 8);
	CLRF       FARG_writeMemory_number+0
	CLRF       FARG_writeMemory_number+1
	CLRF       FARG_writeMemory_number+2
	CLRF       FARG_writeMemory_number+3
	MOVLW      8
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,97 :: 		writeMemory(0, 12);
	CLRF       FARG_writeMemory_number+0
	CLRF       FARG_writeMemory_number+1
	CLRF       FARG_writeMemory_number+2
	CLRF       FARG_writeMemory_number+3
	MOVLW      12
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,98 :: 		writeMemory(0, 16);
	CLRF       FARG_writeMemory_number+0
	CLRF       FARG_writeMemory_number+1
	CLRF       FARG_writeMemory_number+2
	CLRF       FARG_writeMemory_number+3
	MOVLW      16
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,99 :: 		writeMemory(100, 20);
	MOVLW      100
	MOVWF      FARG_writeMemory_number+0
	CLRF       FARG_writeMemory_number+1
	CLRF       FARG_writeMemory_number+2
	CLRF       FARG_writeMemory_number+3
	MOVLW      20
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,100 :: 		writeMemory(314156, 24);
	MOVLW      44
	MOVWF      FARG_writeMemory_number+0
	MOVLW      203
	MOVWF      FARG_writeMemory_number+1
	MOVLW      4
	MOVWF      FARG_writeMemory_number+2
	MOVLW      0
	MOVWF      FARG_writeMemory_number+3
	MOVLW      24
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,101 :: 		}
L_main0:
;Winding Machine.c,102 :: 		readMemory(&numberOfTurns, 0);
	MOVLW      _numberOfTurns+0
	MOVWF      FARG_readMemory_number+0
	CLRF       FARG_readMemory_offset+0
	CALL       _readMemory+0
;Winding Machine.c,103 :: 		readMemory(&wireWidth, 4);
	MOVLW      _wireWidth+0
	MOVWF      FARG_readMemory_number+0
	MOVLW      4
	MOVWF      FARG_readMemory_offset+0
	CALL       _readMemory+0
;Winding Machine.c,104 :: 		readMemory(&coilLength, 8);
	MOVLW      _coilLength+0
	MOVWF      FARG_readMemory_number+0
	MOVLW      8
	MOVWF      FARG_readMemory_offset+0
	CALL       _readMemory+0
;Winding Machine.c,105 :: 		readMemory(&stepsPerTurn, 12);
	MOVLW      _stepsPerTurn+0
	MOVWF      FARG_readMemory_number+0
	MOVLW      12
	MOVWF      FARG_readMemory_offset+0
	CALL       _readMemory+0
;Winding Machine.c,106 :: 		readMemory(&stepsPerMM, 16);
	MOVLW      _stepsPerMM+0
	MOVWF      FARG_readMemory_number+0
	MOVLW      16
	MOVWF      FARG_readMemory_offset+0
	CALL       _readMemory+0
;Winding Machine.c,107 :: 		readMemory(&stepDelayMs, 20);
	MOVLW      _stepDelayMs+0
	MOVWF      FARG_readMemory_number+0
	MOVLW      20
	MOVWF      FARG_readMemory_offset+0
	CALL       _readMemory+0
;Winding Machine.c,109 :: 		clicked = 0;
	CLRF       _clicked+0
;Winding Machine.c,110 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,111 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,112 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,114 :: 		while(1){
L_main1:
;Winding Machine.c,115 :: 		if (clicked == 2){
	MOVF       _clicked+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Winding Machine.c,116 :: 		update();
	CALL       _update+0
;Winding Machine.c,117 :: 		clicked = 0;
	CLRF       _clicked+0
;Winding Machine.c,118 :: 		} else {
	GOTO       L_main4
L_main3:
;Winding Machine.c,119 :: 		if(PORTB.F2){
	BTFSS      PORTB+0, 2
	GOTO       L_main5
;Winding Machine.c,120 :: 		button = 1;
	MOVLW      1
	MOVWF      _button+0
;Winding Machine.c,121 :: 		clicked = 1;
	MOVLW      1
	MOVWF      _clicked+0
;Winding Machine.c,122 :: 		} else if(PORTB.F1){
	GOTO       L_main6
L_main5:
	BTFSS      PORTB+0, 1
	GOTO       L_main7
;Winding Machine.c,123 :: 		button = 2;
	MOVLW      2
	MOVWF      _button+0
;Winding Machine.c,124 :: 		clicked = 1;
	MOVLW      1
	MOVWF      _clicked+0
;Winding Machine.c,125 :: 		} else if(PORTB.F0){
	GOTO       L_main8
L_main7:
	BTFSS      PORTB+0, 0
	GOTO       L_main9
;Winding Machine.c,126 :: 		button = 3;
	MOVLW      3
	MOVWF      _button+0
;Winding Machine.c,127 :: 		clicked = 1;
	MOVLW      1
	MOVWF      _clicked+0
;Winding Machine.c,128 :: 		} else if(clicked == 1){
	GOTO       L_main10
L_main9:
	MOVF       _clicked+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;Winding Machine.c,129 :: 		clicked = 2;
	MOVLW      2
	MOVWF      _clicked+0
;Winding Machine.c,130 :: 		}
L_main11:
L_main10:
L_main8:
L_main6:
;Winding Machine.c,131 :: 		}
L_main4:
;Winding Machine.c,133 :: 		if(start == 1 && clicked == 0){
	MOVF       _start+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	MOVF       _clicked+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main14
L__main232:
;Winding Machine.c,134 :: 		stepRotate();
	CALL       _stepRotate+0
;Winding Machine.c,135 :: 		stepMove(rotateToMoveRatio, direction);
	MOVF       _rotateToMoveRatio+0, 0
	MOVWF      FARG_stepMove_numberOfSteps+0
	MOVF       _rotateToMoveRatio+1, 0
	MOVWF      FARG_stepMove_numberOfSteps+1
	MOVF       _rotateToMoveRatio+2, 0
	MOVWF      FARG_stepMove_numberOfSteps+2
	MOVF       _rotateToMoveRatio+3, 0
	MOVWF      FARG_stepMove_numberOfSteps+3
	MOVF       _direction+0, 0
	MOVWF      FARG_stepMove_direction+0
	CALL       _stepMove+0
;Winding Machine.c,137 :: 		if(currentPositionRotate % stepsPerTurn == 0){
	MOVF       _stepsPerTurn+0, 0
	MOVWF      R4+0
	MOVF       _stepsPerTurn+1, 0
	MOVWF      R4+1
	MOVF       _stepsPerTurn+2, 0
	MOVWF      R4+2
	MOVF       _stepsPerTurn+3, 0
	MOVWF      R4+3
	MOVF       _currentPositionRotate+0, 0
	MOVWF      R0+0
	MOVF       _currentPositionRotate+1, 0
	MOVWF      R0+1
	MOVF       _currentPositionRotate+2, 0
	MOVWF      R0+2
	MOVF       _currentPositionRotate+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	XORWF      R0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main243
	MOVF       R4+0, 0
	XORWF      R0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main243
	MOVF       R4+0, 0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main243
	MOVF       R0+0, 0
	XORLW      0
L__main243:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;Winding Machine.c,138 :: 		currentNumberOfTurns++;
	MOVF       _currentNumberOfTurns+0, 0
	MOVWF      R0+0
	MOVF       _currentNumberOfTurns+1, 0
	MOVWF      R0+1
	MOVF       _currentNumberOfTurns+2, 0
	MOVWF      R0+2
	MOVF       _currentNumberOfTurns+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _currentNumberOfTurns+0
	MOVF       R0+1, 0
	MOVWF      _currentNumberOfTurns+1
	MOVF       R0+2, 0
	MOVWF      _currentNumberOfTurns+2
	MOVF       R0+3, 0
	MOVWF      _currentNumberOfTurns+3
;Winding Machine.c,139 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,141 :: 		if(currentNumberOfTurns == numberOfTurns){
	MOVF       _currentNumberOfTurns+3, 0
	XORWF      _numberOfTurns+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main244
	MOVF       _currentNumberOfTurns+2, 0
	XORWF      _numberOfTurns+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main244
	MOVF       _currentNumberOfTurns+1, 0
	XORWF      _numberOfTurns+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main244
	MOVF       _currentNumberOfTurns+0, 0
	XORWF      _numberOfTurns+0, 0
L__main244:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;Winding Machine.c,142 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,143 :: 		Lcd_Out(1, 7, "DONE");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Winding_32Machine+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Winding Machine.c,144 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;Winding Machine.c,145 :: 		start = 0;
	CLRF       _start+0
;Winding Machine.c,146 :: 		menu = 1;
	MOVLW      1
	MOVWF      _menu+0
;Winding Machine.c,147 :: 		cursorPosition = 5;
	MOVLW      5
	MOVWF      _cursorPosition+0
;Winding Machine.c,148 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,149 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,150 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,151 :: 		}
L_main16:
;Winding Machine.c,153 :: 		if(direction != 0 && currentPositionRotate % sizeOfTable == 0){
	MOVF       _direction+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _sizeofTable+0, 0
	MOVWF      R4+0
	MOVLW      0
	BTFSC      R4+0, 7
	MOVLW      255
	MOVWF      R4+1
	MOVWF      R4+2
	MOVWF      R4+3
	MOVF       _currentPositionRotate+0, 0
	MOVWF      R0+0
	MOVF       _currentPositionRotate+1, 0
	MOVWF      R0+1
	MOVF       _currentPositionRotate+2, 0
	MOVWF      R0+2
	MOVF       _currentPositionRotate+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	XORWF      R0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main245
	MOVF       R4+0, 0
	XORWF      R0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main245
	MOVF       R4+0, 0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main245
	MOVF       R0+0, 0
	XORLW      0
L__main245:
	BTFSS      STATUS+0, 2
	GOTO       L_main20
L__main231:
;Winding Machine.c,154 :: 		currentPositionRotate = 0;
	CLRF       _currentPositionRotate+0
	CLRF       _currentPositionRotate+1
	CLRF       _currentPositionRotate+2
	CLRF       _currentPositionRotate+3
;Winding Machine.c,155 :: 		}
L_main20:
;Winding Machine.c,156 :: 		}
L_main15:
;Winding Machine.c,158 :: 		if(direction != 0 && (currentPositionMove >= coilLength*stepsPerMM/100.0 || currentPositionMove <= 0)){
	MOVF       _direction+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	MOVF       _coilLength+0, 0
	MOVWF      R0+0
	MOVF       _coilLength+1, 0
	MOVWF      R0+1
	MOVF       _coilLength+2, 0
	MOVWF      R0+2
	MOVF       _coilLength+3, 0
	MOVWF      R0+3
	MOVF       _stepsPerMM+0, 0
	MOVWF      R4+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R4+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R4+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	CALL       _longint2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       _currentPositionMove+0, 0
	MOVWF      R0+0
	MOVF       _currentPositionMove+1, 0
	MOVWF      R0+1
	MOVF       _currentPositionMove+2, 0
	MOVWF      R0+2
	MOVF       _currentPositionMove+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main230
	MOVF       _currentPositionMove+0, 0
	MOVWF      R4+0
	MOVF       _currentPositionMove+1, 0
	MOVWF      R4+1
	MOVF       _currentPositionMove+2, 0
	MOVWF      R4+2
	MOVF       _currentPositionMove+3, 0
	MOVWF      R4+3
	CLRF       R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main230
	GOTO       L_main25
L__main230:
L__main229:
;Winding Machine.c,159 :: 		direction = 0;
	CLRF       _direction+0
;Winding Machine.c,160 :: 		lastRotation = currentPositionRotate + stepsPerTurn/2.0;
	MOVF       _stepsPerTurn+0, 0
	MOVWF      R0+0
	MOVF       _stepsPerTurn+1, 0
	MOVWF      R0+1
	MOVF       _stepsPerTurn+2, 0
	MOVWF      R0+2
	MOVF       _stepsPerTurn+3, 0
	MOVWF      R0+3
	CALL       _longint2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       _currentPositionRotate+0, 0
	MOVWF      R0+0
	MOVF       _currentPositionRotate+1, 0
	MOVWF      R0+1
	MOVF       _currentPositionRotate+2, 0
	MOVWF      R0+2
	MOVF       _currentPositionRotate+3, 0
	MOVWF      R0+3
	CALL       _longint2double+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4+0
	MOVF       FLOC__main+1, 0
	MOVWF      R4+1
	MOVF       FLOC__main+2, 0
	MOVWF      R4+2
	MOVF       FLOC__main+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _double2longint+0
	MOVF       R0+0, 0
	MOVWF      _lastRotation+0
	MOVF       R0+1, 0
	MOVWF      _lastRotation+1
	MOVF       R0+2, 0
	MOVWF      _lastRotation+2
	MOVF       R0+3, 0
	MOVWF      _lastRotation+3
;Winding Machine.c,161 :: 		}
L_main25:
;Winding Machine.c,163 :: 		if(direction == 0 && currentPositionRotate == lastRotation){
	MOVF       _direction+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main28
	MOVF       _currentPositionRotate+3, 0
	XORWF      _lastRotation+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main246
	MOVF       _currentPositionRotate+2, 0
	XORWF      _lastRotation+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main246
	MOVF       _currentPositionRotate+1, 0
	XORWF      _lastRotation+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main246
	MOVF       _currentPositionRotate+0, 0
	XORWF      _lastRotation+0, 0
L__main246:
	BTFSS      STATUS+0, 2
	GOTO       L_main28
L__main228:
;Winding Machine.c,164 :: 		if(currentPositionMove > 0) {
	MOVF       _currentPositionMove+0, 0
	MOVWF      R4+0
	MOVF       _currentPositionMove+1, 0
	MOVWF      R4+1
	MOVF       _currentPositionMove+2, 0
	MOVWF      R4+2
	MOVF       _currentPositionMove+3, 0
	MOVWF      R4+3
	CLRF       R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main29
;Winding Machine.c,165 :: 		direction = -1;
	MOVLW      255
	MOVWF      _direction+0
;Winding Machine.c,166 :: 		} else {
	GOTO       L_main30
L_main29:
;Winding Machine.c,167 :: 		direction = 1;
	MOVLW      1
	MOVWF      _direction+0
;Winding Machine.c,168 :: 		}
L_main30:
;Winding Machine.c,169 :: 		}
L_main28:
;Winding Machine.c,170 :: 		}
L_main14:
;Winding Machine.c,171 :: 		}
	GOTO       L_main1
;Winding Machine.c,172 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_pause:

;Winding Machine.c,174 :: 		void pause(long delay){
;Winding Machine.c,175 :: 		while (delay>0){
L_pause31:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_pause_delay+3, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pause248
	MOVF       FARG_pause_delay+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__pause248
	MOVF       FARG_pause_delay+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__pause248
	MOVF       FARG_pause_delay+0, 0
	SUBLW      0
L__pause248:
	BTFSC      STATUS+0, 0
	GOTO       L_pause32
;Winding Machine.c,176 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_pause33:
	DECFSZ     R13+0, 1
	GOTO       L_pause33
	DECFSZ     R12+0, 1
	GOTO       L_pause33
	NOP
	NOP
;Winding Machine.c,177 :: 		delay--;
	MOVLW      1
	SUBWF      FARG_pause_delay+0, 1
	BTFSS      STATUS+0, 0
	SUBWF      FARG_pause_delay+1, 1
	BTFSS      STATUS+0, 0
	SUBWF      FARG_pause_delay+2, 1
	BTFSS      STATUS+0, 0
	SUBWF      FARG_pause_delay+3, 1
;Winding Machine.c,178 :: 		}
	GOTO       L_pause31
L_pause32:
;Winding Machine.c,179 :: 		}
L_end_pause:
	RETURN
; end of _pause

_readMemory:

;Winding Machine.c,181 :: 		void readMemory(long *number, short offset){
;Winding Machine.c,183 :: 		*number = 0;
	MOVF       FARG_readMemory_number+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;Winding Machine.c,184 :: 		for(i = 0; i<4; i++){
	CLRF       readMemory_i_L0+0
L_readMemory34:
	MOVLW      128
	XORWF      readMemory_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_readMemory35
;Winding Machine.c,185 :: 		*number *= 256;
	MOVF       FARG_readMemory_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R5+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R5+1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R5+2
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R5+3
	MOVF       R5+2, 0
	MOVWF      R0+3
	MOVF       R5+1, 0
	MOVWF      R0+2
	MOVF       R5+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       FARG_readMemory_number+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R0+2, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R0+3, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;Winding Machine.c,186 :: 		*number += EEPROM_Read(i+offset);
	MOVF       FARG_readMemory_offset+0, 0
	ADDWF      readMemory_i_L0+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       FARG_readMemory_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R5+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R5+1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R5+2
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R5+3
	MOVF       R0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	CLRF       R1+2
	CLRF       R1+3
	MOVF       R5+0, 0
	ADDWF      R1+0, 1
	MOVF       R5+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R5+1, 0
	ADDWF      R1+1, 1
	MOVF       R5+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R5+2, 0
	ADDWF      R1+2, 1
	MOVF       R5+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R5+3, 0
	ADDWF      R1+3, 1
	MOVF       FARG_readMemory_number+0, 0
	MOVWF      FSR
	MOVF       R1+0, 0
	MOVWF      INDF+0
	MOVF       R1+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R1+2, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R1+3, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;Winding Machine.c,187 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_readMemory37:
	DECFSZ     R13+0, 1
	GOTO       L_readMemory37
	DECFSZ     R12+0, 1
	GOTO       L_readMemory37
	NOP
	NOP
;Winding Machine.c,184 :: 		for(i = 0; i<4; i++){
	INCF       readMemory_i_L0+0, 1
;Winding Machine.c,188 :: 		}
	GOTO       L_readMemory34
L_readMemory35:
;Winding Machine.c,189 :: 		}
L_end_readMemory:
	RETURN
; end of _readMemory

_writeMemory:

;Winding Machine.c,191 :: 		void writeMemory(long number, short offset){
;Winding Machine.c,193 :: 		for(i = 3; i>=0; i--){
	MOVLW      3
	MOVWF      writeMemory_i_L0+0
L_writeMemory38:
	MOVLW      128
	XORWF      writeMemory_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_writeMemory39
;Winding Machine.c,194 :: 		EEPROM_Write(i + offset, number % 256);
	MOVF       FARG_writeMemory_offset+0, 0
	ADDWF      writeMemory_i_L0+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FARG_writeMemory_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_writeMemory_number+1, 0
	MOVWF      R0+1
	MOVF       FARG_writeMemory_number+2, 0
	MOVWF      R0+2
	MOVF       FARG_writeMemory_number+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Winding Machine.c,195 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_writeMemory41:
	DECFSZ     R13+0, 1
	GOTO       L_writeMemory41
	DECFSZ     R12+0, 1
	GOTO       L_writeMemory41
	NOP
	NOP
;Winding Machine.c,196 :: 		number /= 256;
	MOVF       FARG_writeMemory_number+1, 0
	MOVWF      FARG_writeMemory_number+0
	MOVF       FARG_writeMemory_number+2, 0
	MOVWF      FARG_writeMemory_number+1
	MOVF       FARG_writeMemory_number+3, 0
	MOVWF      FARG_writeMemory_number+2
	MOVLW      0
	BTFSC      FARG_writeMemory_number+3, 7
	MOVLW      255
	MOVWF      FARG_writeMemory_number+3
;Winding Machine.c,193 :: 		for(i = 3; i>=0; i--){
	DECF       writeMemory_i_L0+0, 1
;Winding Machine.c,197 :: 		}
	GOTO       L_writeMemory38
L_writeMemory39:
;Winding Machine.c,198 :: 		}
L_end_writeMemory:
	RETURN
; end of _writeMemory

_stepRotate:

;Winding Machine.c,200 :: 		void stepRotate(){
;Winding Machine.c,201 :: 		currentPositionRotate++;
	MOVF       _currentPositionRotate+0, 0
	MOVWF      R0+0
	MOVF       _currentPositionRotate+1, 0
	MOVWF      R0+1
	MOVF       _currentPositionRotate+2, 0
	MOVWF      R0+2
	MOVF       _currentPositionRotate+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _currentPositionRotate+0
	MOVF       R0+1, 0
	MOVWF      _currentPositionRotate+1
	MOVF       R0+2, 0
	MOVWF      _currentPositionRotate+2
	MOVF       R0+3, 0
	MOVWF      _currentPositionRotate+3
;Winding Machine.c,202 :: 		PORTC &= 0b11110000;
	MOVLW      240
	ANDWF      PORTC+0, 1
;Winding Machine.c,203 :: 		PORTC |= stepTable[currentPositionRotate % sizeOfTable];
	MOVF       _sizeofTable+0, 0
	MOVWF      R4+0
	MOVLW      0
	BTFSC      R4+0, 7
	MOVLW      255
	MOVWF      R4+1
	MOVWF      R4+2
	MOVWF      R4+3
	MOVF       _currentPositionRotate+0, 0
	MOVWF      R0+0
	MOVF       _currentPositionRotate+1, 0
	MOVWF      R0+1
	MOVF       _currentPositionRotate+2, 0
	MOVWF      R0+2
	MOVF       _currentPositionRotate+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	ADDLW      _stepTable+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      PORTC+0, 1
;Winding Machine.c,204 :: 		pause(stepDelayMs);
	MOVF       _stepDelayMs+0, 0
	MOVWF      FARG_pause_delay+0
	MOVF       _stepDelayMs+1, 0
	MOVWF      FARG_pause_delay+1
	MOVF       _stepDelayMs+2, 0
	MOVWF      FARG_pause_delay+2
	MOVF       _stepDelayMs+3, 0
	MOVWF      FARG_pause_delay+3
	CALL       _pause+0
;Winding Machine.c,205 :: 		}
L_end_stepRotate:
	RETURN
; end of _stepRotate

_stepMove:

;Winding Machine.c,207 :: 		void stepMove(double numberOfSteps, short direction){
;Winding Machine.c,209 :: 		for(i = (currentPositionMove + 0.5); direction != 0 && direction * i < floor(direction * (currentPositionMove + direction * (numberOfSteps + 0.5))); i += direction){
	MOVF       _currentPositionMove+0, 0
	MOVWF      R0+0
	MOVF       _currentPositionMove+1, 0
	MOVWF      R0+1
	MOVF       _currentPositionMove+2, 0
	MOVWF      R0+2
	MOVF       _currentPositionMove+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      126
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      stepMove_i_L0+0
	MOVF       R0+1, 0
	MOVWF      stepMove_i_L0+1
L_stepMove42:
	MOVF       FARG_stepMove_direction+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_stepMove43
	MOVF       FARG_stepMove_direction+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	MOVF       stepMove_i_L0+0, 0
	MOVWF      R4+0
	MOVF       stepMove_i_L0+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__stepMove+8
	MOVF       R0+1, 0
	MOVWF      FLOC__stepMove+9
	MOVF       FARG_stepMove_numberOfSteps+0, 0
	MOVWF      R0+0
	MOVF       FARG_stepMove_numberOfSteps+1, 0
	MOVWF      R0+1
	MOVF       FARG_stepMove_numberOfSteps+2, 0
	MOVWF      R0+2
	MOVF       FARG_stepMove_numberOfSteps+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      126
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__stepMove+4
	MOVF       R0+1, 0
	MOVWF      FLOC__stepMove+5
	MOVF       R0+2, 0
	MOVWF      FLOC__stepMove+6
	MOVF       R0+3, 0
	MOVWF      FLOC__stepMove+7
	MOVF       FARG_stepMove_direction+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      FLOC__stepMove+0
	MOVF       R0+1, 0
	MOVWF      FLOC__stepMove+1
	MOVF       R0+2, 0
	MOVWF      FLOC__stepMove+2
	MOVF       R0+3, 0
	MOVWF      FLOC__stepMove+3
	MOVF       FLOC__stepMove+0, 0
	MOVWF      R0+0
	MOVF       FLOC__stepMove+1, 0
	MOVWF      R0+1
	MOVF       FLOC__stepMove+2, 0
	MOVWF      R0+2
	MOVF       FLOC__stepMove+3, 0
	MOVWF      R0+3
	MOVF       FLOC__stepMove+4, 0
	MOVWF      R4+0
	MOVF       FLOC__stepMove+5, 0
	MOVWF      R4+1
	MOVF       FLOC__stepMove+6, 0
	MOVWF      R4+2
	MOVF       FLOC__stepMove+7, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       _currentPositionMove+0, 0
	MOVWF      R4+0
	MOVF       _currentPositionMove+1, 0
	MOVWF      R4+1
	MOVF       _currentPositionMove+2, 0
	MOVWF      R4+2
	MOVF       _currentPositionMove+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       FLOC__stepMove+0, 0
	MOVWF      R4+0
	MOVF       FLOC__stepMove+1, 0
	MOVWF      R4+1
	MOVF       FLOC__stepMove+2, 0
	MOVWF      R4+2
	MOVF       FLOC__stepMove+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	MOVF       R0+0, 0
	MOVWF      FLOC__stepMove+0
	MOVF       R0+1, 0
	MOVWF      FLOC__stepMove+1
	MOVF       R0+2, 0
	MOVWF      FLOC__stepMove+2
	MOVF       R0+3, 0
	MOVWF      FLOC__stepMove+3
	MOVF       FLOC__stepMove+8, 0
	MOVWF      R0+0
	MOVF       FLOC__stepMove+9, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVF       FLOC__stepMove+0, 0
	MOVWF      R4+0
	MOVF       FLOC__stepMove+1, 0
	MOVWF      R4+1
	MOVF       FLOC__stepMove+2, 0
	MOVWF      R4+2
	MOVF       FLOC__stepMove+3, 0
	MOVWF      R4+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_stepMove43
L__stepMove233:
;Winding Machine.c,210 :: 		PORTC &= 0b00001111;
	MOVLW      15
	ANDWF      PORTC+0, 1
;Winding Machine.c,211 :: 		PORTC |= stepTable[(i + direction) % sizeOfTable] << 4;
	MOVF       FARG_stepMove_direction+0, 0
	ADDWF      stepMove_i_L0+0, 0
	MOVWF      R0+0
	MOVF       stepMove_i_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVLW      0
	BTFSC      FARG_stepMove_direction+0, 7
	MOVLW      255
	ADDWF      R0+1, 1
	MOVF       _sizeofTable+0, 0
	MOVWF      R4+0
	MOVLW      0
	BTFSC      R4+0, 7
	MOVLW      255
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _stepTable+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      PORTC+0, 1
;Winding Machine.c,212 :: 		pause(stepDelayMs);
	MOVF       _stepDelayMs+0, 0
	MOVWF      FARG_pause_delay+0
	MOVF       _stepDelayMs+1, 0
	MOVWF      FARG_pause_delay+1
	MOVF       _stepDelayMs+2, 0
	MOVWF      FARG_pause_delay+2
	MOVF       _stepDelayMs+3, 0
	MOVWF      FARG_pause_delay+3
	CALL       _pause+0
;Winding Machine.c,209 :: 		for(i = (currentPositionMove + 0.5); direction != 0 && direction * i < floor(direction * (currentPositionMove + direction * (numberOfSteps + 0.5))); i += direction){
	MOVF       FARG_stepMove_direction+0, 0
	ADDWF      stepMove_i_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       stepMove_i_L0+1, 1
	MOVLW      0
	BTFSC      FARG_stepMove_direction+0, 7
	MOVLW      255
	ADDWF      stepMove_i_L0+1, 1
;Winding Machine.c,213 :: 		}
	GOTO       L_stepMove42
L_stepMove43:
;Winding Machine.c,214 :: 		currentPositionMove += direction * numberOfSteps;
	MOVF       FARG_stepMove_direction+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	CALL       _int2double+0
	MOVF       FARG_stepMove_numberOfSteps+0, 0
	MOVWF      R4+0
	MOVF       FARG_stepMove_numberOfSteps+1, 0
	MOVWF      R4+1
	MOVF       FARG_stepMove_numberOfSteps+2, 0
	MOVWF      R4+2
	MOVF       FARG_stepMove_numberOfSteps+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       _currentPositionMove+0, 0
	MOVWF      R4+0
	MOVF       _currentPositionMove+1, 0
	MOVWF      R4+1
	MOVF       _currentPositionMove+2, 0
	MOVWF      R4+2
	MOVF       _currentPositionMove+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _currentPositionMove+0
	MOVF       R0+1, 0
	MOVWF      _currentPositionMove+1
	MOVF       R0+2, 0
	MOVWF      _currentPositionMove+2
	MOVF       R0+3, 0
	MOVWF      _currentPositionMove+3
;Winding Machine.c,215 :: 		}
L_end_stepMove:
	RETURN
; end of _stepMove

_codetxt_to_ramtxt:

;Winding Machine.c,217 :: 		char* codetxt_to_ramtxt(const char* ctxt){
;Winding Machine.c,220 :: 		for(i = 0; txt[i] = ctxt[i]; i++);
	CLRF       R3+0
L_codetxt_to_ramtxt47:
	MOVF       R3+0, 0
	ADDLW      codetxt_to_ramtxt_txt_L0+0
	MOVWF      R2+0
	MOVF       R3+0, 0
	ADDWF      FARG_codetxt_to_ramtxt_ctxt+0, 0
	MOVWF      R0+0
	MOVF       FARG_codetxt_to_ramtxt_ctxt+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_codetxt_to_ramtxt48
	INCF       R3+0, 1
	GOTO       L_codetxt_to_ramtxt47
L_codetxt_to_ramtxt48:
;Winding Machine.c,222 :: 		return txt;
	MOVLW      codetxt_to_ramtxt_txt_L0+0
	MOVWF      R0+0
;Winding Machine.c,223 :: 		}
L_end_codetxt_to_ramtxt:
	RETURN
; end of _codetxt_to_ramtxt

_writeNumber:

;Winding Machine.c,225 :: 		void writeNumber(long number, short dotPosition, short offsetPosition){
;Winding Machine.c,228 :: 		for(i = 5; i >= 0; i--){
	MOVLW      5
	MOVWF      writeNumber_i_L0+0
L_writeNumber50:
	MOVLW      128
	XORWF      writeNumber_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_writeNumber51
;Winding Machine.c,229 :: 		if(i == dotPosition-1){
	MOVLW      1
	SUBWF      FARG_writeNumber_dotPosition+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	BTFSC      FARG_writeNumber_dotPosition+0, 7
	MOVLW      255
	ADDWF      R1+1, 1
	MOVLW      0
	BTFSC      writeNumber_i_L0+0, 7
	MOVLW      255
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__writeNumber255
	MOVF       R1+0, 0
	XORWF      writeNumber_i_L0+0, 0
L__writeNumber255:
	BTFSS      STATUS+0, 2
	GOTO       L_writeNumber53
;Winding Machine.c,230 :: 		txt[i] = '.';
	MOVF       writeNumber_i_L0+0, 0
	ADDLW      writeNumber_txt_L0+0
	MOVWF      FSR
	MOVLW      46
	MOVWF      INDF+0
;Winding Machine.c,231 :: 		} else {
	GOTO       L_writeNumber54
L_writeNumber53:
;Winding Machine.c,232 :: 		txt[i] = number % 10 + '0';
	MOVF       writeNumber_i_L0+0, 0
	ADDLW      writeNumber_txt_L0+0
	MOVWF      FLOC__writeNumber+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FARG_writeNumber_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_writeNumber_number+1, 0
	MOVWF      R0+1
	MOVF       FARG_writeNumber_number+2, 0
	MOVWF      R0+2
	MOVF       FARG_writeNumber_number+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__writeNumber+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Winding Machine.c,233 :: 		number /= 10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       FARG_writeNumber_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_writeNumber_number+1, 0
	MOVWF      R0+1
	MOVF       FARG_writeNumber_number+2, 0
	MOVWF      R0+2
	MOVF       FARG_writeNumber_number+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R0+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       R0+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       R0+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       R0+3, 0
	MOVWF      FARG_writeNumber_number+3
;Winding Machine.c,234 :: 		}
L_writeNumber54:
;Winding Machine.c,228 :: 		for(i = 5; i >= 0; i--){
	DECF       writeNumber_i_L0+0, 1
;Winding Machine.c,235 :: 		}
	GOTO       L_writeNumber50
L_writeNumber51:
;Winding Machine.c,236 :: 		Lcd_Out(2, 1+offsetPosition, txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	INCF       FARG_writeNumber_offsetPosition+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      writeNumber_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Winding Machine.c,237 :: 		}
L_end_writeNumber:
	RETURN
; end of _writeNumber

_tenTo:

;Winding Machine.c,239 :: 		long tenTo(short power){
;Winding Machine.c,241 :: 		result = 1;
	MOVLW      1
	MOVWF      tenTo_result_L0+0
	CLRF       tenTo_result_L0+1
	CLRF       tenTo_result_L0+2
	CLRF       tenTo_result_L0+3
;Winding Machine.c,242 :: 		for (; power > 0; power--) {
L_tenTo55:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_tenTo_power+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_tenTo56
;Winding Machine.c,243 :: 		result *= 10;
	MOVF       tenTo_result_L0+0, 0
	MOVWF      R0+0
	MOVF       tenTo_result_L0+1, 0
	MOVWF      R0+1
	MOVF       tenTo_result_L0+2, 0
	MOVWF      R0+2
	MOVF       tenTo_result_L0+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      tenTo_result_L0+0
	MOVF       R0+1, 0
	MOVWF      tenTo_result_L0+1
	MOVF       R0+2, 0
	MOVWF      tenTo_result_L0+2
	MOVF       R0+3, 0
	MOVWF      tenTo_result_L0+3
;Winding Machine.c,242 :: 		for (; power > 0; power--) {
	DECF       FARG_tenTo_power+0, 1
;Winding Machine.c,244 :: 		}
	GOTO       L_tenTo55
L_tenTo56:
;Winding Machine.c,245 :: 		return result;
	MOVF       tenTo_result_L0+0, 0
	MOVWF      R0+0
	MOVF       tenTo_result_L0+1, 0
	MOVWF      R0+1
	MOVF       tenTo_result_L0+2, 0
	MOVWF      R0+2
	MOVF       tenTo_result_L0+3, 0
	MOVWF      R0+3
;Winding Machine.c,246 :: 		}
L_end_tenTo:
	RETURN
; end of _tenTo

_speed11:

;Winding Machine.c,248 :: 		void speed11(const code char *menu){
;Winding Machine.c,249 :: 		Lcd_Out(1, 1, codetxt_to_ramtxt(menu));
	MOVF       FARG_speed11_menu+0, 0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVF       FARG_speed11_menu+1, 0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;Winding Machine.c,250 :: 		}
L_end_speed11:
	RETURN
; end of _speed11

_speed21:

;Winding Machine.c,252 :: 		void speed21(const code char *menu){
;Winding Machine.c,253 :: 		Lcd_Out(2, 1, codetxt_to_ramtxt(menu));
	MOVF       FARG_speed21_menu+0, 0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVF       FARG_speed21_menu+1, 0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;Winding Machine.c,254 :: 		}
L_end_speed21:
	RETURN
; end of _speed21

_speed27:

;Winding Machine.c,256 :: 		void speed27(const code char *menu){
;Winding Machine.c,257 :: 		Lcd_Out(2, 7, codetxt_to_ramtxt(menu));
	MOVF       FARG_speed27_menu+0, 0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVF       FARG_speed27_menu+1, 0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;Winding Machine.c,258 :: 		}
L_end_speed27:
	RETURN
; end of _speed27

_screenRefresh:

;Winding Machine.c,260 :: 		void screenRefresh(){
;Winding Machine.c,261 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,262 :: 		switch(menu){
	GOTO       L_screenRefresh58
;Winding Machine.c,263 :: 		case 1:
L_screenRefresh60:
;Winding Machine.c,264 :: 		speed11(menu11); //Number of turns
	MOVLW      _menu11+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu11+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,265 :: 		writeNumber(numberOfTurns, 0, 0);
	MOVF       _numberOfTurns+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _numberOfTurns+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _numberOfTurns+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _numberOfTurns+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,266 :: 		speed27(menu12); // NEXT
	MOVLW      _menu12+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu12+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,267 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,268 :: 		case 2:
L_screenRefresh61:
;Winding Machine.c,269 :: 		writeNumber(numberOfTurns, 0, 0);
	MOVF       _numberOfTurns+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _numberOfTurns+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _numberOfTurns+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _numberOfTurns+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,270 :: 		speed27(menu22); // <NEXT>
	MOVLW      _menu22+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu22+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,271 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,272 :: 		case 3:
L_screenRefresh62:
;Winding Machine.c,273 :: 		speed11(menu31); // Wire width
	MOVLW      _menu31+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu31+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,274 :: 		writeNumber(wireWidth, 3, 0);
	MOVF       _wireWidth+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _wireWidth+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _wireWidth+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _wireWidth+3, 0
	MOVWF      FARG_writeNumber_number+3
	MOVLW      3
	MOVWF      FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,275 :: 		speed27(menu32); // mm NEXT
	MOVLW      _menu32+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu32+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,276 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,277 :: 		case 4:
L_screenRefresh63:
;Winding Machine.c,278 :: 		writeNumber(wireWidth, 3, 0);
	MOVF       _wireWidth+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _wireWidth+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _wireWidth+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _wireWidth+3, 0
	MOVWF      FARG_writeNumber_number+3
	MOVLW      3
	MOVWF      FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,279 :: 		speed27(menu42); // mm <NEXT>
	MOVLW      _menu42+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu42+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,280 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,281 :: 		case 5:
L_screenRefresh64:
;Winding Machine.c,282 :: 		speed11(menu51); // Coil length
	MOVLW      _menu51+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu51+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,283 :: 		writeNumber(coilLength, 4, 0);
	MOVF       _coilLength+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _coilLength+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _coilLength+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _coilLength+3, 0
	MOVWF      FARG_writeNumber_number+3
	MOVLW      4
	MOVWF      FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,284 :: 		speed27(menu32); // mm NEXT
	MOVLW      _menu32+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu32+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,285 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,286 :: 		case 6:
L_screenRefresh65:
;Winding Machine.c,287 :: 		writeNumber(coilLength, 4, 0);
	MOVF       _coilLength+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _coilLength+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _coilLength+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _coilLength+3, 0
	MOVWF      FARG_writeNumber_number+3
	MOVLW      4
	MOVWF      FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,288 :: 		speed27(menu42); // mm <NEXT>
	MOVLW      _menu42+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu42+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,289 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,290 :: 		case 7:
L_screenRefresh66:
;Winding Machine.c,291 :: 		speed11(menu71); // Settings
	MOVLW      _menu71+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu71+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,292 :: 		speed21(menu72); // <SKIP> ENTER
	MOVLW      _menu72+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu72+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,293 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,294 :: 		case 8:
L_screenRefresh67:
;Winding Machine.c,295 :: 		speed21(menu82); // SKIP <ENTER>
	MOVLW      _menu82+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu82+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,296 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,297 :: 		case 9:
L_screenRefresh68:
;Winding Machine.c,298 :: 		speed11(menu91); // Move carriage
	MOVLW      _menu91+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu91+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,299 :: 		speed21(menu92); // <<o  <    >   >>
	MOVLW      _menu92+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu92+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,300 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,301 :: 		case 10:
L_screenRefresh69:
;Winding Machine.c,302 :: 		speed21(menu102); // <<   <o   >   >>
	MOVLW      _menu102+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu102+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,303 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,304 :: 		case 11:
L_screenRefresh70:
;Winding Machine.c,305 :: 		speed21(menu112); // <<   <SAVE>   >>
	MOVLW      _menu112+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu112+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,306 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,307 :: 		case 12:
L_screenRefresh71:
;Winding Machine.c,308 :: 		speed21(menu122); // <<   <   o>   >>
	MOVLW      _menu122+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu122+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,309 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,310 :: 		case 13:
L_screenRefresh72:
;Winding Machine.c,311 :: 		speed21(menu132); // <<   <    >  o>>
	MOVLW      _menu132+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu132+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,312 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,313 :: 		case 14:
L_screenRefresh73:
;Winding Machine.c,314 :: 		speed11(menu141); // Setup saved
	MOVLW      _menu141+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu141+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,315 :: 		speed21(menu142); // <MENU> START
	MOVLW      _menu142+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu142+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,316 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,317 :: 		case 15:
L_screenRefresh74:
;Winding Machine.c,318 :: 		speed21(menu152); // MENU <START>
	MOVLW      _menu152+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu152+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,319 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,320 :: 		case 16:
L_screenRefresh75:
;Winding Machine.c,321 :: 		speed11(menu161); // Progress
	MOVLW      _menu161+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu161+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,322 :: 		writeNumber(currentNumberOfTurns, 0, 0);
	MOVF       _currentNumberOfTurns+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _currentNumberOfTurns+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _currentNumberOfTurns+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _currentNumberOfTurns+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,323 :: 		Lcd_Out(2, 7, " of ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Winding_32Machine+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Winding Machine.c,324 :: 		writeNumber(numberOfTurns, 0, 10);
	MOVF       _numberOfTurns+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _numberOfTurns+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _numberOfTurns+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _numberOfTurns+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	MOVLW      10
	MOVWF      FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,325 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,326 :: 		case 17:
L_screenRefresh76:
;Winding Machine.c,327 :: 		speed11(menu171); // Progress paused
	MOVLW      _menu171+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu171+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,328 :: 		writeNumber(currentNumberOfTurns, 0, 0);
	MOVF       _currentNumberOfTurns+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _currentNumberOfTurns+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _currentNumberOfTurns+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _currentNumberOfTurns+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,329 :: 		Lcd_Out(2, 7, " of ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Winding_32Machine+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Winding Machine.c,330 :: 		writeNumber(numberOfTurns, 0, 10);
	MOVF       _numberOfTurns+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _numberOfTurns+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _numberOfTurns+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _numberOfTurns+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	MOVLW      10
	MOVWF      FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,331 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,332 :: 		case 18:
L_screenRefresh77:
;Winding Machine.c,333 :: 		speed11(menu181); // Steps per turn
	MOVLW      _menu181+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu181+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,334 :: 		writeNumber(stepsPerTurn, 0, 0);
	MOVF       _stepsPerTurn+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _stepsPerTurn+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _stepsPerTurn+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _stepsPerTurn+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,335 :: 		speed27(menu12); // NEXT
	MOVLW      _menu12+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu12+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,336 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,337 :: 		case 19:
L_screenRefresh78:
;Winding Machine.c,338 :: 		writeNumber(stepsPerTurn, 0, 0);
	MOVF       _stepsPerTurn+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _stepsPerTurn+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _stepsPerTurn+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _stepsPerTurn+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,339 :: 		speed27(menu22); // <NEXT>
	MOVLW      _menu22+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu22+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,340 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,341 :: 		case 20:
L_screenRefresh79:
;Winding Machine.c,342 :: 		speed11(menu201); // Steps per mm
	MOVLW      _menu201+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu201+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,343 :: 		writeNumber(stepsPerMM, 0, 0);
	MOVF       _stepsPerMM+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,344 :: 		speed27(menu12); // NEXT
	MOVLW      _menu12+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu12+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,345 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,346 :: 		case 21:
L_screenRefresh80:
;Winding Machine.c,347 :: 		writeNumber(stepsPerMM, 0, 0);
	MOVF       _stepsPerMM+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,348 :: 		speed27(menu22);  // <NEXT>
	MOVLW      _menu22+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu22+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,349 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,350 :: 		case 22:
L_screenRefresh81:
;Winding Machine.c,351 :: 		speed11(menu221); // Step delay in ms
	MOVLW      _menu221+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu221+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,352 :: 		writeNumber(stepDelayMs, 0, 0);
	MOVF       _stepDelayMs+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _stepDelayMs+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _stepDelayMs+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _stepDelayMs+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,353 :: 		speed27(menu12); // NEXT
	MOVLW      _menu12+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu12+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,354 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,355 :: 		case 23:
L_screenRefresh82:
;Winding Machine.c,356 :: 		writeNumber(stepDelayMs, 0, 0);
	MOVF       _stepDelayMs+0, 0
	MOVWF      FARG_writeNumber_number+0
	MOVF       _stepDelayMs+1, 0
	MOVWF      FARG_writeNumber_number+1
	MOVF       _stepDelayMs+2, 0
	MOVWF      FARG_writeNumber_number+2
	MOVF       _stepDelayMs+3, 0
	MOVWF      FARG_writeNumber_number+3
	CLRF       FARG_writeNumber_dotPosition+0
	CLRF       FARG_writeNumber_offsetPosition+0
	CALL       _writeNumber+0
;Winding Machine.c,357 :: 		speed27(menu22);  // <NEXT>
	MOVLW      _menu22+0
	MOVWF      FARG_speed27_menu+0
	MOVLW      hi_addr(_menu22+0)
	MOVWF      FARG_speed27_menu+1
	CALL       _speed27+0
;Winding Machine.c,358 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,359 :: 		case 24:
L_screenRefresh83:
;Winding Machine.c,360 :: 		speed11(menu241); // Settings saved
	MOVLW      _menu241+0
	MOVWF      FARG_speed11_menu+0
	MOVLW      hi_addr(_menu241+0)
	MOVWF      FARG_speed11_menu+1
	CALL       _speed11+0
;Winding Machine.c,361 :: 		speed21(menu242); // <MENU> SETTINGS
	MOVLW      _menu242+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu242+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,362 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,363 :: 		case 25:
L_screenRefresh84:
;Winding Machine.c,364 :: 		speed21(menu252); // MENU <SETTINGS>
	MOVLW      _menu252+0
	MOVWF      FARG_speed21_menu+0
	MOVLW      hi_addr(_menu252+0)
	MOVWF      FARG_speed21_menu+1
	CALL       _speed21+0
;Winding Machine.c,365 :: 		break;
	GOTO       L_screenRefresh59
;Winding Machine.c,366 :: 		}
L_screenRefresh58:
	MOVF       _menu+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh60
	MOVF       _menu+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh61
	MOVF       _menu+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh62
	MOVF       _menu+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh63
	MOVF       _menu+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh64
	MOVF       _menu+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh65
	MOVF       _menu+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh66
	MOVF       _menu+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh67
	MOVF       _menu+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh68
	MOVF       _menu+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh69
	MOVF       _menu+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh70
	MOVF       _menu+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh71
	MOVF       _menu+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh72
	MOVF       _menu+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh73
	MOVF       _menu+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh74
	MOVF       _menu+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh75
	MOVF       _menu+0, 0
	XORLW      17
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh76
	MOVF       _menu+0, 0
	XORLW      18
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh77
	MOVF       _menu+0, 0
	XORLW      19
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh78
	MOVF       _menu+0, 0
	XORLW      20
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh79
	MOVF       _menu+0, 0
	XORLW      21
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh80
	MOVF       _menu+0, 0
	XORLW      22
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh81
	MOVF       _menu+0, 0
	XORLW      23
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh82
	MOVF       _menu+0, 0
	XORLW      24
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh83
	MOVF       _menu+0, 0
	XORLW      25
	BTFSC      STATUS+0, 2
	GOTO       L_screenRefresh84
L_screenRefresh59:
;Winding Machine.c,367 :: 		}
L_end_screenRefresh:
	RETURN
; end of _screenRefresh

_resetCursor:

;Winding Machine.c,369 :: 		void resetCursor(short dotPosition){
;Winding Machine.c,371 :: 		for (i = 0; ((cursorPosition >= 6 - dotPosition) && (i < 4 - cursorPosition)) ||
	CLRF       resetCursor_i_L0+0
L_resetCursor85:
	MOVF       FARG_resetCursor_dotPosition+0, 0
	SUBLW      6
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      1
	BTFSS      FARG_resetCursor_dotPosition+0, 7
	MOVLW      0
	ADDWF      R1+1, 1
	MOVLW      128
	BTFSC      _cursorPosition+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__resetCursor262
	MOVF       R1+0, 0
	SUBWF      _cursorPosition+0, 0
L__resetCursor262:
	BTFSS      STATUS+0, 0
	GOTO       L__resetCursor236
	MOVF       _cursorPosition+0, 0
	SUBLW      4
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      1
	BTFSS      _cursorPosition+0, 7
	MOVLW      0
	ADDWF      R1+1, 1
	MOVLW      128
	BTFSC      resetCursor_i_L0+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__resetCursor263
	MOVF       R1+0, 0
	SUBWF      resetCursor_i_L0+0, 0
L__resetCursor263:
	BTFSC      STATUS+0, 0
	GOTO       L__resetCursor236
	GOTO       L__resetCursor234
;Winding Machine.c,372 :: 		((cursorPosition < 6 - dotPosition) && (i < 5 - cursorPosition)); i++){
L__resetCursor236:
	MOVF       FARG_resetCursor_dotPosition+0, 0
	SUBLW      6
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      1
	BTFSS      FARG_resetCursor_dotPosition+0, 7
	MOVLW      0
	ADDWF      R1+1, 1
	MOVLW      128
	BTFSC      _cursorPosition+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__resetCursor264
	MOVF       R1+0, 0
	SUBWF      _cursorPosition+0, 0
L__resetCursor264:
	BTFSC      STATUS+0, 0
	GOTO       L__resetCursor235
	MOVF       _cursorPosition+0, 0
	SUBLW      5
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      1
	BTFSS      _cursorPosition+0, 7
	MOVLW      0
	ADDWF      R1+1, 1
	MOVLW      128
	BTFSC      resetCursor_i_L0+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__resetCursor265
	MOVF       R1+0, 0
	SUBWF      resetCursor_i_L0+0, 0
L__resetCursor265:
	BTFSC      STATUS+0, 0
	GOTO       L__resetCursor235
	GOTO       L__resetCursor234
L__resetCursor235:
	GOTO       L_resetCursor86
L__resetCursor234:
;Winding Machine.c,373 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,372 :: 		((cursorPosition < 6 - dotPosition) && (i < 5 - cursorPosition)); i++){
	INCF       resetCursor_i_L0+0, 1
;Winding Machine.c,374 :: 		}
	GOTO       L_resetCursor85
L_resetCursor86:
;Winding Machine.c,375 :: 		}
L_end_resetCursor:
	RETURN
; end of _resetCursor

_numberInput:

;Winding Machine.c,377 :: 		void numberInput(long *number, short dotPosition){
;Winding Machine.c,379 :: 		switch(button){
	GOTO       L_numberInput94
;Winding Machine.c,380 :: 		case 1:
L_numberInput96:
;Winding Machine.c,381 :: 		if(select == 0){
	MOVF       _select+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_numberInput97
;Winding Machine.c,382 :: 		Lcd_Cmd(_LCD_UNDERLINE_ON);
	MOVLW      14
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,383 :: 		select = 1;
	MOVLW      1
	MOVWF      _select+0
;Winding Machine.c,384 :: 		} else {
	GOTO       L_numberInput98
L_numberInput97:
;Winding Machine.c,385 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,386 :: 		select = 0;
	CLRF       _select+0
;Winding Machine.c,387 :: 		}
L_numberInput98:
;Winding Machine.c,388 :: 		break;
	GOTO       L_numberInput95
;Winding Machine.c,389 :: 		case 2:
L_numberInput99:
;Winding Machine.c,390 :: 		if(select == 0){
	MOVF       _select+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_numberInput100
;Winding Machine.c,391 :: 		cursorPosition--;
	DECF       _cursorPosition+0, 1
;Winding Machine.c,392 :: 		if(cursorPosition == 5-dotPosition) {
	MOVF       FARG_numberInput_dotPosition+0, 0
	SUBLW      5
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      1
	BTFSS      FARG_numberInput_dotPosition+0, 7
	MOVLW      0
	ADDWF      R1+1, 1
	MOVLW      0
	BTFSC      _cursorPosition+0, 7
	MOVLW      255
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__numberInput267
	MOVF       R1+0, 0
	XORWF      _cursorPosition+0, 0
L__numberInput267:
	BTFSS      STATUS+0, 2
	GOTO       L_numberInput101
;Winding Machine.c,393 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,394 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,395 :: 		} else if (cursorPosition < 0){
	GOTO       L_numberInput102
L_numberInput101:
	MOVLW      128
	XORWF      _cursorPosition+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_numberInput103
;Winding Machine.c,396 :: 		menu++;
	INCF       _menu+0, 1
;Winding Machine.c,397 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,398 :: 		} else {
	GOTO       L_numberInput104
L_numberInput103:
;Winding Machine.c,399 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,400 :: 		}
L_numberInput104:
L_numberInput102:
;Winding Machine.c,401 :: 		} else {
	GOTO       L_numberInput105
L_numberInput100:
;Winding Machine.c,402 :: 		temp = tenTo(cursorPosition);
	MOVF       _cursorPosition+0, 0
	MOVWF      FARG_tenTo_power+0
	CALL       _tenTo+0
	MOVF       R0+0, 0
	MOVWF      FLOC__numberInput+4
	MOVF       R0+1, 0
	MOVWF      FLOC__numberInput+5
	MOVF       R0+2, 0
	MOVWF      FLOC__numberInput+6
	MOVF       R0+3, 0
	MOVWF      FLOC__numberInput+7
	MOVF       FLOC__numberInput+4, 0
	MOVWF      numberInput_temp_L0+0
	MOVF       FLOC__numberInput+5, 0
	MOVWF      numberInput_temp_L0+1
	MOVF       FLOC__numberInput+6, 0
	MOVWF      numberInput_temp_L0+2
	MOVF       FLOC__numberInput+7, 0
	MOVWF      numberInput_temp_L0+3
;Winding Machine.c,403 :: 		if(*number % (10*temp) >= 9*temp) {
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__numberInput+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FLOC__numberInput+1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FLOC__numberInput+2
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FLOC__numberInput+3
	MOVLW      10
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       FLOC__numberInput+4, 0
	MOVWF      R4+0
	MOVF       FLOC__numberInput+5, 0
	MOVWF      R4+1
	MOVF       FLOC__numberInput+6, 0
	MOVWF      R4+2
	MOVF       FLOC__numberInput+7, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__numberInput+0, 0
	MOVWF      R0+0
	MOVF       FLOC__numberInput+1, 0
	MOVWF      R0+1
	MOVF       FLOC__numberInput+2, 0
	MOVWF      R0+2
	MOVF       FLOC__numberInput+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      FLOC__numberInput+0
	MOVF       R0+1, 0
	MOVWF      FLOC__numberInput+1
	MOVF       R0+2, 0
	MOVWF      FLOC__numberInput+2
	MOVF       R0+3, 0
	MOVWF      FLOC__numberInput+3
	MOVLW      9
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       FLOC__numberInput+4, 0
	MOVWF      R4+0
	MOVF       FLOC__numberInput+5, 0
	MOVWF      R4+1
	MOVF       FLOC__numberInput+6, 0
	MOVWF      R4+2
	MOVF       FLOC__numberInput+7, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      128
	XORWF      FLOC__numberInput+3, 0
	MOVWF      R4+0
	MOVLW      128
	XORWF      R0+3, 0
	SUBWF      R4+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__numberInput268
	MOVF       R0+2, 0
	SUBWF      FLOC__numberInput+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__numberInput268
	MOVF       R0+1, 0
	SUBWF      FLOC__numberInput+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__numberInput268
	MOVF       R0+0, 0
	SUBWF      FLOC__numberInput+0, 0
L__numberInput268:
	BTFSS      STATUS+0, 0
	GOTO       L_numberInput106
;Winding Machine.c,404 :: 		*number -= 9*temp;
	MOVLW      9
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       numberInput_temp_L0+0, 0
	MOVWF      R4+0
	MOVF       numberInput_temp_L0+1, 0
	MOVWF      R4+1
	MOVF       numberInput_temp_L0+2, 0
	MOVWF      R4+2
	MOVF       numberInput_temp_L0+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R4+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R4+1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R4+2
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R4+3
	MOVF       R0+0, 0
	SUBWF      R4+0, 1
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R0+1, 0
	SUBWF      R4+1, 1
	MOVF       R0+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R0+2, 0
	SUBWF      R4+2, 1
	MOVF       R0+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R0+3, 0
	SUBWF      R4+3, 1
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       R4+0, 0
	MOVWF      INDF+0
	MOVF       R4+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R4+2, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R4+3, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;Winding Machine.c,405 :: 		} else {
	GOTO       L_numberInput107
L_numberInput106:
;Winding Machine.c,406 :: 		*number += temp;
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+2
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+3
	MOVF       numberInput_temp_L0+0, 0
	ADDWF      R0+0, 1
	MOVF       numberInput_temp_L0+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     numberInput_temp_L0+1, 0
	ADDWF      R0+1, 1
	MOVF       numberInput_temp_L0+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     numberInput_temp_L0+2, 0
	ADDWF      R0+2, 1
	MOVF       numberInput_temp_L0+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     numberInput_temp_L0+3, 0
	ADDWF      R0+3, 1
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R0+2, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R0+3, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;Winding Machine.c,407 :: 		}
L_numberInput107:
;Winding Machine.c,408 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,409 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,410 :: 		resetCursor(dotPosition);
	MOVF       FARG_numberInput_dotPosition+0, 0
	MOVWF      FARG_resetCursor_dotPosition+0
	CALL       _resetCursor+0
;Winding Machine.c,411 :: 		Lcd_Cmd(_LCD_UNDERLINE_ON);
	MOVLW      14
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,412 :: 		}
L_numberInput105:
;Winding Machine.c,413 :: 		break;
	GOTO       L_numberInput95
;Winding Machine.c,414 :: 		case 3:
L_numberInput108:
;Winding Machine.c,415 :: 		if(select == 0){
	MOVF       _select+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_numberInput109
;Winding Machine.c,416 :: 		cursorPosition++;
	INCF       _cursorPosition+0, 1
;Winding Machine.c,417 :: 		if(dotPosition != 0 && cursorPosition == 6-dotPosition) {
	MOVF       FARG_numberInput_dotPosition+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_numberInput112
	MOVF       FARG_numberInput_dotPosition+0, 0
	SUBLW      6
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      1
	BTFSS      FARG_numberInput_dotPosition+0, 7
	MOVLW      0
	ADDWF      R1+1, 1
	MOVLW      0
	BTFSC      _cursorPosition+0, 7
	MOVLW      255
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__numberInput269
	MOVF       R1+0, 0
	XORWF      _cursorPosition+0, 0
L__numberInput269:
	BTFSS      STATUS+0, 2
	GOTO       L_numberInput112
L__numberInput239:
;Winding Machine.c,418 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,419 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,420 :: 		} else if ((dotPosition != 0 && cursorPosition > 4) || cursorPosition > 5){
	GOTO       L_numberInput113
L_numberInput112:
	MOVF       FARG_numberInput_dotPosition+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__numberInput238
	MOVLW      128
	XORLW      4
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cursorPosition+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__numberInput238
	GOTO       L__numberInput237
L__numberInput238:
	MOVLW      128
	XORLW      5
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cursorPosition+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__numberInput237
	GOTO       L_numberInput118
L__numberInput237:
;Winding Machine.c,421 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,422 :: 		menu++;
	INCF       _menu+0, 1
;Winding Machine.c,423 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,424 :: 		} else{
	GOTO       L_numberInput119
L_numberInput118:
;Winding Machine.c,425 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,426 :: 		}
L_numberInput119:
L_numberInput113:
;Winding Machine.c,427 :: 		} else {
	GOTO       L_numberInput120
L_numberInput109:
;Winding Machine.c,428 :: 		temp = tenTo(cursorPosition);
	MOVF       _cursorPosition+0, 0
	MOVWF      FARG_tenTo_power+0
	CALL       _tenTo+0
	MOVF       R0+0, 0
	MOVWF      FLOC__numberInput+4
	MOVF       R0+1, 0
	MOVWF      FLOC__numberInput+5
	MOVF       R0+2, 0
	MOVWF      FLOC__numberInput+6
	MOVF       R0+3, 0
	MOVWF      FLOC__numberInput+7
	MOVF       FLOC__numberInput+4, 0
	MOVWF      numberInput_temp_L0+0
	MOVF       FLOC__numberInput+5, 0
	MOVWF      numberInput_temp_L0+1
	MOVF       FLOC__numberInput+6, 0
	MOVWF      numberInput_temp_L0+2
	MOVF       FLOC__numberInput+7, 0
	MOVWF      numberInput_temp_L0+3
;Winding Machine.c,429 :: 		if(*number % (10*temp) < temp) {
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__numberInput+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FLOC__numberInput+1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FLOC__numberInput+2
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FLOC__numberInput+3
	MOVLW      10
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       FLOC__numberInput+4, 0
	MOVWF      R4+0
	MOVF       FLOC__numberInput+5, 0
	MOVWF      R4+1
	MOVF       FLOC__numberInput+6, 0
	MOVWF      R4+2
	MOVF       FLOC__numberInput+7, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__numberInput+0, 0
	MOVWF      R0+0
	MOVF       FLOC__numberInput+1, 0
	MOVWF      R0+1
	MOVF       FLOC__numberInput+2, 0
	MOVWF      R0+2
	MOVF       FLOC__numberInput+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVLW      128
	XORWF      R0+3, 0
	MOVWF      R4+0
	MOVLW      128
	XORWF      FLOC__numberInput+7, 0
	SUBWF      R4+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__numberInput270
	MOVF       FLOC__numberInput+6, 0
	SUBWF      R0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__numberInput270
	MOVF       FLOC__numberInput+5, 0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__numberInput270
	MOVF       FLOC__numberInput+4, 0
	SUBWF      R0+0, 0
L__numberInput270:
	BTFSC      STATUS+0, 0
	GOTO       L_numberInput121
;Winding Machine.c,430 :: 		*number += 9*temp;
	MOVLW      9
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       numberInput_temp_L0+0, 0
	MOVWF      R4+0
	MOVF       numberInput_temp_L0+1, 0
	MOVWF      R4+1
	MOVF       numberInput_temp_L0+2, 0
	MOVWF      R4+2
	MOVF       numberInput_temp_L0+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R4+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R4+1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R4+2
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R4+3
	MOVF       R4+0, 0
	ADDWF      R0+0, 1
	MOVF       R4+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R4+1, 0
	ADDWF      R0+1, 1
	MOVF       R4+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R4+2, 0
	ADDWF      R0+2, 1
	MOVF       R4+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R4+3, 0
	ADDWF      R0+3, 1
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R0+2, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R0+3, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;Winding Machine.c,431 :: 		} else {
	GOTO       L_numberInput122
L_numberInput121:
;Winding Machine.c,432 :: 		*number -= temp;
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+2
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+3
	MOVF       numberInput_temp_L0+0, 0
	SUBWF      R0+0, 1
	MOVF       numberInput_temp_L0+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     numberInput_temp_L0+1, 0
	SUBWF      R0+1, 1
	MOVF       numberInput_temp_L0+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     numberInput_temp_L0+2, 0
	SUBWF      R0+2, 1
	MOVF       numberInput_temp_L0+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     numberInput_temp_L0+3, 0
	SUBWF      R0+3, 1
	MOVF       FARG_numberInput_number+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R0+2, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R0+3, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;Winding Machine.c,433 :: 		}
L_numberInput122:
;Winding Machine.c,434 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,435 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,436 :: 		resetCursor(dotPosition);
	MOVF       FARG_numberInput_dotPosition+0, 0
	MOVWF      FARG_resetCursor_dotPosition+0
	CALL       _resetCursor+0
;Winding Machine.c,437 :: 		Lcd_Cmd(_LCD_UNDERLINE_ON);
	MOVLW      14
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,438 :: 		}
L_numberInput120:
;Winding Machine.c,439 :: 		}
	GOTO       L_numberInput95
L_numberInput94:
	MOVF       _button+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_numberInput96
	MOVF       _button+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_numberInput99
	MOVF       _button+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_numberInput108
L_numberInput95:
;Winding Machine.c,440 :: 		}
L_end_numberInput:
	RETURN
; end of _numberInput

_nextButton:

;Winding Machine.c,442 :: 		void nextButton(short dotPosition, short nextDotPosition){
;Winding Machine.c,444 :: 		switch(button){
	GOTO       L_nextButton123
;Winding Machine.c,445 :: 		case 1:
L_nextButton125:
;Winding Machine.c,446 :: 		switch(menu){
	GOTO       L_nextButton126
;Winding Machine.c,447 :: 		case 2:
L_nextButton128:
;Winding Machine.c,448 :: 		writeMemory(numberOfTurns, 0);
	MOVF       _numberOfTurns+0, 0
	MOVWF      FARG_writeMemory_number+0
	MOVF       _numberOfTurns+1, 0
	MOVWF      FARG_writeMemory_number+1
	MOVF       _numberOfTurns+2, 0
	MOVWF      FARG_writeMemory_number+2
	MOVF       _numberOfTurns+3, 0
	MOVWF      FARG_writeMemory_number+3
	CLRF       FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,449 :: 		break;
	GOTO       L_nextButton127
;Winding Machine.c,450 :: 		case 4:
L_nextButton129:
;Winding Machine.c,451 :: 		writeMemory(wireWidth, 4);
	MOVF       _wireWidth+0, 0
	MOVWF      FARG_writeMemory_number+0
	MOVF       _wireWidth+1, 0
	MOVWF      FARG_writeMemory_number+1
	MOVF       _wireWidth+2, 0
	MOVWF      FARG_writeMemory_number+2
	MOVF       _wireWidth+3, 0
	MOVWF      FARG_writeMemory_number+3
	MOVLW      4
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,452 :: 		break;
	GOTO       L_nextButton127
;Winding Machine.c,453 :: 		case 6:
L_nextButton130:
;Winding Machine.c,454 :: 		writeMemory(coilLength, 8);
	MOVF       _coilLength+0, 0
	MOVWF      FARG_writeMemory_number+0
	MOVF       _coilLength+1, 0
	MOVWF      FARG_writeMemory_number+1
	MOVF       _coilLength+2, 0
	MOVWF      FARG_writeMemory_number+2
	MOVF       _coilLength+3, 0
	MOVWF      FARG_writeMemory_number+3
	MOVLW      8
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,455 :: 		break;
	GOTO       L_nextButton127
;Winding Machine.c,456 :: 		case 19:
L_nextButton131:
;Winding Machine.c,457 :: 		writeMemory(stepsPerTurn, 12);
	MOVF       _stepsPerTurn+0, 0
	MOVWF      FARG_writeMemory_number+0
	MOVF       _stepsPerTurn+1, 0
	MOVWF      FARG_writeMemory_number+1
	MOVF       _stepsPerTurn+2, 0
	MOVWF      FARG_writeMemory_number+2
	MOVF       _stepsPerTurn+3, 0
	MOVWF      FARG_writeMemory_number+3
	MOVLW      12
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,458 :: 		break;
	GOTO       L_nextButton127
;Winding Machine.c,459 :: 		case 21:
L_nextButton132:
;Winding Machine.c,460 :: 		writeMemory(stepsPerMM, 16);
	MOVF       _stepsPerMM+0, 0
	MOVWF      FARG_writeMemory_number+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      FARG_writeMemory_number+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      FARG_writeMemory_number+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      FARG_writeMemory_number+3
	MOVLW      16
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,461 :: 		break;
	GOTO       L_nextButton127
;Winding Machine.c,462 :: 		case 23:
L_nextButton133:
;Winding Machine.c,463 :: 		writeMemory(stepDelayMs, 20);
	MOVF       _stepDelayMs+0, 0
	MOVWF      FARG_writeMemory_number+0
	MOVF       _stepDelayMs+1, 0
	MOVWF      FARG_writeMemory_number+1
	MOVF       _stepDelayMs+2, 0
	MOVWF      FARG_writeMemory_number+2
	MOVF       _stepDelayMs+3, 0
	MOVWF      FARG_writeMemory_number+3
	MOVLW      20
	MOVWF      FARG_writeMemory_offset+0
	CALL       _writeMemory+0
;Winding Machine.c,464 :: 		break;
	GOTO       L_nextButton127
;Winding Machine.c,465 :: 		}
L_nextButton126:
	MOVF       _menu+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton128
	MOVF       _menu+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton129
	MOVF       _menu+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton130
	MOVF       _menu+0, 0
	XORLW      19
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton131
	MOVF       _menu+0, 0
	XORLW      21
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton132
	MOVF       _menu+0, 0
	XORLW      23
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton133
L_nextButton127:
;Winding Machine.c,466 :: 		menu++;
	INCF       _menu+0, 1
;Winding Machine.c,467 :: 		if(nextDotPosition == 0) {
	MOVF       FARG_nextButton_nextDotPosition+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_nextButton134
;Winding Machine.c,468 :: 		cursorPosition = 5;
	MOVLW      5
	MOVWF      _cursorPosition+0
;Winding Machine.c,469 :: 		} else {
	GOTO       L_nextButton135
L_nextButton134:
;Winding Machine.c,470 :: 		cursorPosition = 4;
	MOVLW      4
	MOVWF      _cursorPosition+0
;Winding Machine.c,471 :: 		}
L_nextButton135:
;Winding Machine.c,472 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,473 :: 		if(menu != 7 && menu != 24){
	MOVF       _menu+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton138
	MOVF       _menu+0, 0
	XORLW      24
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton138
L__nextButton240:
;Winding Machine.c,474 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,475 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,476 :: 		}
L_nextButton138:
;Winding Machine.c,477 :: 		break;
	GOTO       L_nextButton124
;Winding Machine.c,478 :: 		case 2:
L_nextButton139:
;Winding Machine.c,479 :: 		menu--;
	DECF       _menu+0, 1
;Winding Machine.c,480 :: 		if(dotPosition == 0) {
	MOVF       FARG_nextButton_dotPosition+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_nextButton140
;Winding Machine.c,481 :: 		cursorPosition = 5;
	MOVLW      5
	MOVWF      _cursorPosition+0
;Winding Machine.c,482 :: 		} else {
	GOTO       L_nextButton141
L_nextButton140:
;Winding Machine.c,483 :: 		cursorPosition = 4;
	MOVLW      4
	MOVWF      _cursorPosition+0
;Winding Machine.c,484 :: 		}
L_nextButton141:
;Winding Machine.c,485 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,486 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,487 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,488 :: 		break;
	GOTO       L_nextButton124
;Winding Machine.c,489 :: 		case 3:
L_nextButton142:
;Winding Machine.c,490 :: 		menu--;
	DECF       _menu+0, 1
;Winding Machine.c,491 :: 		cursorPosition = 0;
	CLRF       _cursorPosition+0
;Winding Machine.c,492 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,493 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,494 :: 		for (i = 0; i < 5; i++){
	CLRF       nextButton_i_L0+0
	CLRF       nextButton_i_L0+1
L_nextButton143:
	MOVLW      128
	XORWF      nextButton_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__nextButton272
	MOVLW      5
	SUBWF      nextButton_i_L0+0, 0
L__nextButton272:
	BTFSC      STATUS+0, 0
	GOTO       L_nextButton144
;Winding Machine.c,495 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,494 :: 		for (i = 0; i < 5; i++){
	INCF       nextButton_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       nextButton_i_L0+1, 1
;Winding Machine.c,496 :: 		}
	GOTO       L_nextButton143
L_nextButton144:
;Winding Machine.c,497 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,498 :: 		break;
	GOTO       L_nextButton124
;Winding Machine.c,499 :: 		}
L_nextButton123:
	MOVF       _button+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton125
	MOVF       _button+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton139
	MOVF       _button+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_nextButton142
L_nextButton124:
;Winding Machine.c,500 :: 		}
L_end_nextButton:
	RETURN
; end of _nextButton

_twoButton:

;Winding Machine.c,502 :: 		void twoButton(){
;Winding Machine.c,503 :: 		switch(button){
	GOTO       L_twoButton146
;Winding Machine.c,504 :: 		case 1:
L_twoButton148:
;Winding Machine.c,505 :: 		switch(menu){
	GOTO       L_twoButton149
;Winding Machine.c,506 :: 		case 7:
L_twoButton151:
;Winding Machine.c,507 :: 		menu = 9;
	MOVLW      9
	MOVWF      _menu+0
;Winding Machine.c,508 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,509 :: 		break;
	GOTO       L_twoButton150
;Winding Machine.c,510 :: 		case 8:
L_twoButton152:
;Winding Machine.c,511 :: 		case 25:
L_twoButton153:
;Winding Machine.c,512 :: 		menu = 18;
	MOVLW      18
	MOVWF      _menu+0
;Winding Machine.c,513 :: 		cursorPosition = 5;
	MOVLW      5
	MOVWF      _cursorPosition+0
;Winding Machine.c,514 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,515 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,516 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,517 :: 		break;
	GOTO       L_twoButton150
;Winding Machine.c,518 :: 		case 14:
L_twoButton154:
;Winding Machine.c,519 :: 		case 24:
L_twoButton155:
;Winding Machine.c,520 :: 		menu = 1;
	MOVLW      1
	MOVWF      _menu+0
;Winding Machine.c,521 :: 		cursorPosition = 5;
	MOVLW      5
	MOVWF      _cursorPosition+0
;Winding Machine.c,522 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,523 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,524 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,525 :: 		break;
	GOTO       L_twoButton150
;Winding Machine.c,526 :: 		case 15:      // Process Start
L_twoButton156:
;Winding Machine.c,527 :: 		menu = 16;
	MOVLW      16
	MOVWF      _menu+0
;Winding Machine.c,528 :: 		start = 1;
	MOVLW      1
	MOVWF      _start+0
;Winding Machine.c,529 :: 		rotateToMoveRatio = wireWidth*stepsPerMM*1.0/(stepsPerTurn*1000.0);
	MOVF       _wireWidth+0, 0
	MOVWF      R0+0
	MOVF       _wireWidth+1, 0
	MOVWF      R0+1
	MOVF       _wireWidth+2, 0
	MOVWF      R0+2
	MOVF       _wireWidth+3, 0
	MOVWF      R0+3
	MOVF       _stepsPerMM+0, 0
	MOVWF      R4+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R4+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R4+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      FLOC__twoButton+0
	MOVF       R0+1, 0
	MOVWF      FLOC__twoButton+1
	MOVF       R0+2, 0
	MOVWF      FLOC__twoButton+2
	MOVF       R0+3, 0
	MOVWF      FLOC__twoButton+3
	MOVF       _stepsPerTurn+0, 0
	MOVWF      R0+0
	MOVF       _stepsPerTurn+1, 0
	MOVWF      R0+1
	MOVF       _stepsPerTurn+2, 0
	MOVWF      R0+2
	MOVF       _stepsPerTurn+3, 0
	MOVWF      R0+3
	CALL       _longint2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__twoButton+0, 0
	MOVWF      R0+0
	MOVF       FLOC__twoButton+1, 0
	MOVWF      R0+1
	MOVF       FLOC__twoButton+2, 0
	MOVWF      R0+2
	MOVF       FLOC__twoButton+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _rotateToMoveRatio+0
	MOVF       R0+1, 0
	MOVWF      _rotateToMoveRatio+1
	MOVF       R0+2, 0
	MOVWF      _rotateToMoveRatio+2
	MOVF       R0+3, 0
	MOVWF      _rotateToMoveRatio+3
;Winding Machine.c,530 :: 		currentPositionRotate = 0;
	CLRF       _currentPositionRotate+0
	CLRF       _currentPositionRotate+1
	CLRF       _currentPositionRotate+2
	CLRF       _currentPositionRotate+3
;Winding Machine.c,531 :: 		currentPositionMove = 0;
	CLRF       _currentPositionMove+0
	CLRF       _currentPositionMove+1
	CLRF       _currentPositionMove+2
	CLRF       _currentPositionMove+3
;Winding Machine.c,532 :: 		currentNumberOfTurns = 0;
	CLRF       _currentNumberOfTurns+0
	CLRF       _currentNumberOfTurns+1
	CLRF       _currentNumberOfTurns+2
	CLRF       _currentNumberOfTurns+3
;Winding Machine.c,533 :: 		direction = 1;
	MOVLW      1
	MOVWF      _direction+0
;Winding Machine.c,534 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,535 :: 		break;
	GOTO       L_twoButton150
;Winding Machine.c,536 :: 		}
L_twoButton149:
	MOVF       _menu+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton151
	MOVF       _menu+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton152
	MOVF       _menu+0, 0
	XORLW      25
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton153
	MOVF       _menu+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton154
	MOVF       _menu+0, 0
	XORLW      24
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton155
	MOVF       _menu+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton156
L_twoButton150:
;Winding Machine.c,537 :: 		break;
	GOTO       L_twoButton147
;Winding Machine.c,538 :: 		case 2:
L_twoButton157:
;Winding Machine.c,539 :: 		case 3:
L_twoButton158:
;Winding Machine.c,540 :: 		switch(menu){
	GOTO       L_twoButton159
;Winding Machine.c,541 :: 		case 7:
L_twoButton161:
;Winding Machine.c,542 :: 		case 14:
L_twoButton162:
;Winding Machine.c,543 :: 		case 24:
L_twoButton163:
;Winding Machine.c,544 :: 		menu++;
	INCF       _menu+0, 1
;Winding Machine.c,545 :: 		break;
	GOTO       L_twoButton160
;Winding Machine.c,546 :: 		case 8:
L_twoButton164:
;Winding Machine.c,547 :: 		case 15:
L_twoButton165:
;Winding Machine.c,548 :: 		case 25:
L_twoButton166:
;Winding Machine.c,549 :: 		menu--;
	DECF       _menu+0, 1
;Winding Machine.c,550 :: 		break;
	GOTO       L_twoButton160
;Winding Machine.c,551 :: 		}
L_twoButton159:
	MOVF       _menu+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton161
	MOVF       _menu+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton162
	MOVF       _menu+0, 0
	XORLW      24
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton163
	MOVF       _menu+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton164
	MOVF       _menu+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton165
	MOVF       _menu+0, 0
	XORLW      25
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton166
L_twoButton160:
;Winding Machine.c,552 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,553 :: 		}
	GOTO       L_twoButton147
L_twoButton146:
	MOVF       _button+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton148
	MOVF       _button+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton157
	MOVF       _button+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_twoButton158
L_twoButton147:
;Winding Machine.c,554 :: 		}
L_end_twoButton:
	RETURN
; end of _twoButton

_moveCarriage:

;Winding Machine.c,556 :: 		void moveCarriage(){
;Winding Machine.c,557 :: 		switch(button){
	GOTO       L_moveCarriage167
;Winding Machine.c,558 :: 		case 1:
L_moveCarriage169:
;Winding Machine.c,559 :: 		switch(menu){
	GOTO       L_moveCarriage170
;Winding Machine.c,560 :: 		case 9:
L_moveCarriage172:
;Winding Machine.c,561 :: 		currentPositionMove = stepsPerMM*10;
	MOVF       _stepsPerMM+0, 0
	MOVWF      R0+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R0+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R0+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      _currentPositionMove+0
	MOVF       R0+1, 0
	MOVWF      _currentPositionMove+1
	MOVF       R0+2, 0
	MOVWF      _currentPositionMove+2
	MOVF       R0+3, 0
	MOVWF      _currentPositionMove+3
;Winding Machine.c,562 :: 		stepMove(5*stepsPerMM, -1);
	MOVLW      5
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       _stepsPerMM+0, 0
	MOVWF      R4+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R4+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R4+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_stepMove_numberOfSteps+0
	MOVF       R0+1, 0
	MOVWF      FARG_stepMove_numberOfSteps+1
	MOVF       R0+2, 0
	MOVWF      FARG_stepMove_numberOfSteps+2
	MOVF       R0+3, 0
	MOVWF      FARG_stepMove_numberOfSteps+3
	MOVLW      255
	MOVWF      FARG_stepMove_direction+0
	CALL       _stepMove+0
;Winding Machine.c,563 :: 		break;
	GOTO       L_moveCarriage171
;Winding Machine.c,564 :: 		case 10:
L_moveCarriage173:
;Winding Machine.c,565 :: 		currentPositionMove = stepsPerMM*10;
	MOVF       _stepsPerMM+0, 0
	MOVWF      R0+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R0+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R0+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      _currentPositionMove+0
	MOVF       R0+1, 0
	MOVWF      _currentPositionMove+1
	MOVF       R0+2, 0
	MOVWF      _currentPositionMove+2
	MOVF       R0+3, 0
	MOVWF      _currentPositionMove+3
;Winding Machine.c,566 :: 		stepMove(stepsPerMM, -1);
	MOVF       _stepsPerMM+0, 0
	MOVWF      R0+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R0+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R0+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R0+3
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_stepMove_numberOfSteps+0
	MOVF       R0+1, 0
	MOVWF      FARG_stepMove_numberOfSteps+1
	MOVF       R0+2, 0
	MOVWF      FARG_stepMove_numberOfSteps+2
	MOVF       R0+3, 0
	MOVWF      FARG_stepMove_numberOfSteps+3
	MOVLW      255
	MOVWF      FARG_stepMove_direction+0
	CALL       _stepMove+0
;Winding Machine.c,567 :: 		break;
	GOTO       L_moveCarriage171
;Winding Machine.c,568 :: 		case 11:
L_moveCarriage174:
;Winding Machine.c,569 :: 		menu = 14;
	MOVLW      14
	MOVWF      _menu+0
;Winding Machine.c,570 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,571 :: 		break;
	GOTO       L_moveCarriage171
;Winding Machine.c,572 :: 		case 12:
L_moveCarriage175:
;Winding Machine.c,573 :: 		currentPositionMove = stepsPerMM*10;
	MOVF       _stepsPerMM+0, 0
	MOVWF      R0+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R0+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R0+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      _currentPositionMove+0
	MOVF       R0+1, 0
	MOVWF      _currentPositionMove+1
	MOVF       R0+2, 0
	MOVWF      _currentPositionMove+2
	MOVF       R0+3, 0
	MOVWF      _currentPositionMove+3
;Winding Machine.c,574 :: 		stepMove(stepsPerMM, +1);
	MOVF       _stepsPerMM+0, 0
	MOVWF      R0+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R0+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R0+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R0+3
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_stepMove_numberOfSteps+0
	MOVF       R0+1, 0
	MOVWF      FARG_stepMove_numberOfSteps+1
	MOVF       R0+2, 0
	MOVWF      FARG_stepMove_numberOfSteps+2
	MOVF       R0+3, 0
	MOVWF      FARG_stepMove_numberOfSteps+3
	MOVLW      1
	MOVWF      FARG_stepMove_direction+0
	CALL       _stepMove+0
;Winding Machine.c,575 :: 		break;
	GOTO       L_moveCarriage171
;Winding Machine.c,576 :: 		case 13:
L_moveCarriage176:
;Winding Machine.c,577 :: 		currentPositionMove = stepsPerMM*10;
	MOVF       _stepsPerMM+0, 0
	MOVWF      R0+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R0+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R0+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      _currentPositionMove+0
	MOVF       R0+1, 0
	MOVWF      _currentPositionMove+1
	MOVF       R0+2, 0
	MOVWF      _currentPositionMove+2
	MOVF       R0+3, 0
	MOVWF      _currentPositionMove+3
;Winding Machine.c,578 :: 		stepMove(5*stepsPerMM, +1);
	MOVLW      5
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       _stepsPerMM+0, 0
	MOVWF      R4+0
	MOVF       _stepsPerMM+1, 0
	MOVWF      R4+1
	MOVF       _stepsPerMM+2, 0
	MOVWF      R4+2
	MOVF       _stepsPerMM+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_stepMove_numberOfSteps+0
	MOVF       R0+1, 0
	MOVWF      FARG_stepMove_numberOfSteps+1
	MOVF       R0+2, 0
	MOVWF      FARG_stepMove_numberOfSteps+2
	MOVF       R0+3, 0
	MOVWF      FARG_stepMove_numberOfSteps+3
	MOVLW      1
	MOVWF      FARG_stepMove_direction+0
	CALL       _stepMove+0
;Winding Machine.c,579 :: 		break;
	GOTO       L_moveCarriage171
;Winding Machine.c,580 :: 		}
L_moveCarriage170:
	MOVF       _menu+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage172
	MOVF       _menu+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage173
	MOVF       _menu+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage174
	MOVF       _menu+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage175
	MOVF       _menu+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage176
L_moveCarriage171:
;Winding Machine.c,581 :: 		break;
	GOTO       L_moveCarriage168
;Winding Machine.c,582 :: 		case 2:
L_moveCarriage177:
;Winding Machine.c,583 :: 		switch(menu){
	GOTO       L_moveCarriage178
;Winding Machine.c,584 :: 		case 9:
L_moveCarriage180:
;Winding Machine.c,585 :: 		case 10:
L_moveCarriage181:
;Winding Machine.c,586 :: 		case 11:
L_moveCarriage182:
;Winding Machine.c,587 :: 		case 12:
L_moveCarriage183:
;Winding Machine.c,588 :: 		menu++;
	INCF       _menu+0, 1
;Winding Machine.c,589 :: 		currentPositionMove = 0;
	CLRF       _currentPositionMove+0
	CLRF       _currentPositionMove+1
	CLRF       _currentPositionMove+2
	CLRF       _currentPositionMove+3
;Winding Machine.c,590 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,591 :: 		break;
	GOTO       L_moveCarriage179
;Winding Machine.c,592 :: 		case 13:
L_moveCarriage184:
;Winding Machine.c,593 :: 		menu = 9;
	MOVLW      9
	MOVWF      _menu+0
;Winding Machine.c,594 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,595 :: 		break;
	GOTO       L_moveCarriage179
;Winding Machine.c,596 :: 		}
L_moveCarriage178:
	MOVF       _menu+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage180
	MOVF       _menu+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage181
	MOVF       _menu+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage182
	MOVF       _menu+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage183
	MOVF       _menu+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage184
L_moveCarriage179:
;Winding Machine.c,597 :: 		break;
	GOTO       L_moveCarriage168
;Winding Machine.c,598 :: 		case 3:
L_moveCarriage185:
;Winding Machine.c,599 :: 		switch(menu){
	GOTO       L_moveCarriage186
;Winding Machine.c,600 :: 		case 9:
L_moveCarriage188:
;Winding Machine.c,601 :: 		menu = 13;
	MOVLW      13
	MOVWF      _menu+0
;Winding Machine.c,602 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,603 :: 		break;
	GOTO       L_moveCarriage187
;Winding Machine.c,604 :: 		case 10:
L_moveCarriage189:
;Winding Machine.c,605 :: 		case 11:
L_moveCarriage190:
;Winding Machine.c,606 :: 		case 12:
L_moveCarriage191:
;Winding Machine.c,607 :: 		case 13:
L_moveCarriage192:
;Winding Machine.c,608 :: 		menu--;
	DECF       _menu+0, 1
;Winding Machine.c,609 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,610 :: 		break;
	GOTO       L_moveCarriage187
;Winding Machine.c,611 :: 		}
L_moveCarriage186:
	MOVF       _menu+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage188
	MOVF       _menu+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage189
	MOVF       _menu+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage190
	MOVF       _menu+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage191
	MOVF       _menu+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage192
L_moveCarriage187:
;Winding Machine.c,612 :: 		break;
	GOTO       L_moveCarriage168
;Winding Machine.c,613 :: 		}
L_moveCarriage167:
	MOVF       _button+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage169
	MOVF       _button+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage177
	MOVF       _button+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_moveCarriage185
L_moveCarriage168:
;Winding Machine.c,614 :: 		}
L_end_moveCarriage:
	RETURN
; end of _moveCarriage

_update:

;Winding Machine.c,616 :: 		void update(){
;Winding Machine.c,617 :: 		switch(menu){
	GOTO       L_update193
;Winding Machine.c,618 :: 		case 1:
L_update195:
;Winding Machine.c,619 :: 		numberInput(&numberOfTurns, 0);
	MOVLW      _numberOfTurns+0
	MOVWF      FARG_numberInput_number+0
	CLRF       FARG_numberInput_dotPosition+0
	CALL       _numberInput+0
;Winding Machine.c,620 :: 		break;
	GOTO       L_update194
;Winding Machine.c,621 :: 		case 2:
L_update196:
;Winding Machine.c,622 :: 		nextButton(0, 3);
	CLRF       FARG_nextButton_dotPosition+0
	MOVLW      3
	MOVWF      FARG_nextButton_nextDotPosition+0
	CALL       _nextButton+0
;Winding Machine.c,623 :: 		break;
	GOTO       L_update194
;Winding Machine.c,624 :: 		case 3:
L_update197:
;Winding Machine.c,625 :: 		numberInput(&wireWidth, 3);
	MOVLW      _wireWidth+0
	MOVWF      FARG_numberInput_number+0
	MOVLW      3
	MOVWF      FARG_numberInput_dotPosition+0
	CALL       _numberInput+0
;Winding Machine.c,626 :: 		break;
	GOTO       L_update194
;Winding Machine.c,627 :: 		case 4:
L_update198:
;Winding Machine.c,628 :: 		nextButton(3, 4);
	MOVLW      3
	MOVWF      FARG_nextButton_dotPosition+0
	MOVLW      4
	MOVWF      FARG_nextButton_nextDotPosition+0
	CALL       _nextButton+0
;Winding Machine.c,629 :: 		break;
	GOTO       L_update194
;Winding Machine.c,630 :: 		case 5:
L_update199:
;Winding Machine.c,631 :: 		numberInput(&coilLength, 4);
	MOVLW      _coilLength+0
	MOVWF      FARG_numberInput_number+0
	MOVLW      4
	MOVWF      FARG_numberInput_dotPosition+0
	CALL       _numberInput+0
;Winding Machine.c,632 :: 		break;
	GOTO       L_update194
;Winding Machine.c,633 :: 		case 6:
L_update200:
;Winding Machine.c,634 :: 		nextButton(4, 0);
	MOVLW      4
	MOVWF      FARG_nextButton_dotPosition+0
	CLRF       FARG_nextButton_nextDotPosition+0
	CALL       _nextButton+0
;Winding Machine.c,635 :: 		break;
	GOTO       L_update194
;Winding Machine.c,636 :: 		case 18:
L_update201:
;Winding Machine.c,637 :: 		numberInput(&stepsPerTurn, 0);
	MOVLW      _stepsPerTurn+0
	MOVWF      FARG_numberInput_number+0
	CLRF       FARG_numberInput_dotPosition+0
	CALL       _numberInput+0
;Winding Machine.c,638 :: 		break;
	GOTO       L_update194
;Winding Machine.c,639 :: 		case 19:
L_update202:
;Winding Machine.c,640 :: 		nextButton(0, 0);
	CLRF       FARG_nextButton_dotPosition+0
	CLRF       FARG_nextButton_nextDotPosition+0
	CALL       _nextButton+0
;Winding Machine.c,641 :: 		break;
	GOTO       L_update194
;Winding Machine.c,642 :: 		case 20:
L_update203:
;Winding Machine.c,643 :: 		numberInput(&stepsPerMM, 0);
	MOVLW      _stepsPerMM+0
	MOVWF      FARG_numberInput_number+0
	CLRF       FARG_numberInput_dotPosition+0
	CALL       _numberInput+0
;Winding Machine.c,644 :: 		break;
	GOTO       L_update194
;Winding Machine.c,645 :: 		case 21:
L_update204:
;Winding Machine.c,646 :: 		nextButton(0, 0);
	CLRF       FARG_nextButton_dotPosition+0
	CLRF       FARG_nextButton_nextDotPosition+0
	CALL       _nextButton+0
;Winding Machine.c,647 :: 		break;
	GOTO       L_update194
;Winding Machine.c,648 :: 		case 22:
L_update205:
;Winding Machine.c,649 :: 		numberInput(&stepDelayMs, 0);
	MOVLW      _stepDelayMs+0
	MOVWF      FARG_numberInput_number+0
	CLRF       FARG_numberInput_dotPosition+0
	CALL       _numberInput+0
;Winding Machine.c,650 :: 		break;
	GOTO       L_update194
;Winding Machine.c,651 :: 		case 23:
L_update206:
;Winding Machine.c,652 :: 		nextButton(0, 0);
	CLRF       FARG_nextButton_dotPosition+0
	CLRF       FARG_nextButton_nextDotPosition+0
	CALL       _nextButton+0
;Winding Machine.c,653 :: 		break;
	GOTO       L_update194
;Winding Machine.c,654 :: 		case 7:
L_update207:
;Winding Machine.c,655 :: 		case 8:
L_update208:
;Winding Machine.c,656 :: 		case 14:
L_update209:
;Winding Machine.c,657 :: 		case 15:
L_update210:
;Winding Machine.c,658 :: 		case 24:
L_update211:
;Winding Machine.c,659 :: 		case 25:
L_update212:
;Winding Machine.c,660 :: 		twoButton();
	CALL       _twoButton+0
;Winding Machine.c,661 :: 		break;
	GOTO       L_update194
;Winding Machine.c,662 :: 		case 9:
L_update213:
;Winding Machine.c,663 :: 		case 10:
L_update214:
;Winding Machine.c,664 :: 		case 11:
L_update215:
;Winding Machine.c,665 :: 		case 12:
L_update216:
;Winding Machine.c,666 :: 		case 13:
L_update217:
;Winding Machine.c,667 :: 		moveCarriage();
	CALL       _moveCarriage+0
;Winding Machine.c,668 :: 		break;
	GOTO       L_update194
;Winding Machine.c,669 :: 		case 16:
L_update218:
;Winding Machine.c,670 :: 		switch(button){
	GOTO       L_update219
;Winding Machine.c,671 :: 		case 1:
L_update221:
;Winding Machine.c,672 :: 		start = 0;
	CLRF       _start+0
;Winding Machine.c,673 :: 		menu = 1;
	MOVLW      1
	MOVWF      _menu+0
;Winding Machine.c,674 :: 		cursorPosition = 5;
	MOVLW      5
	MOVWF      _cursorPosition+0
;Winding Machine.c,675 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,676 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,677 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,678 :: 		break;
	GOTO       L_update220
;Winding Machine.c,679 :: 		case 2:
L_update222:
;Winding Machine.c,680 :: 		start = 0;
	CLRF       _start+0
;Winding Machine.c,681 :: 		menu = 17;
	MOVLW      17
	MOVWF      _menu+0
;Winding Machine.c,682 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,683 :: 		break;
	GOTO       L_update220
;Winding Machine.c,684 :: 		}
L_update219:
	MOVF       _button+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_update221
	MOVF       _button+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_update222
L_update220:
;Winding Machine.c,685 :: 		break;
	GOTO       L_update194
;Winding Machine.c,686 :: 		case 17:
L_update223:
;Winding Machine.c,687 :: 		switch(button){
	GOTO       L_update224
;Winding Machine.c,688 :: 		case 1:
L_update226:
;Winding Machine.c,689 :: 		start = 0;
	CLRF       _start+0
;Winding Machine.c,690 :: 		menu = 1;
	MOVLW      1
	MOVWF      _menu+0
;Winding Machine.c,691 :: 		cursorPosition = 5;
	MOVLW      5
	MOVWF      _cursorPosition+0
;Winding Machine.c,692 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,693 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,694 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Winding Machine.c,695 :: 		break;
	GOTO       L_update225
;Winding Machine.c,696 :: 		case 3:
L_update227:
;Winding Machine.c,697 :: 		start = 1;
	MOVLW      1
	MOVWF      _start+0
;Winding Machine.c,698 :: 		menu = 16;
	MOVLW      16
	MOVWF      _menu+0
;Winding Machine.c,699 :: 		screenRefresh();
	CALL       _screenRefresh+0
;Winding Machine.c,700 :: 		break;
	GOTO       L_update225
;Winding Machine.c,701 :: 		}
L_update224:
	MOVF       _button+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_update226
	MOVF       _button+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_update227
L_update225:
;Winding Machine.c,702 :: 		break;
	GOTO       L_update194
;Winding Machine.c,703 :: 		}
L_update193:
	MOVF       _menu+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_update195
	MOVF       _menu+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_update196
	MOVF       _menu+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_update197
	MOVF       _menu+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_update198
	MOVF       _menu+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_update199
	MOVF       _menu+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_update200
	MOVF       _menu+0, 0
	XORLW      18
	BTFSC      STATUS+0, 2
	GOTO       L_update201
	MOVF       _menu+0, 0
	XORLW      19
	BTFSC      STATUS+0, 2
	GOTO       L_update202
	MOVF       _menu+0, 0
	XORLW      20
	BTFSC      STATUS+0, 2
	GOTO       L_update203
	MOVF       _menu+0, 0
	XORLW      21
	BTFSC      STATUS+0, 2
	GOTO       L_update204
	MOVF       _menu+0, 0
	XORLW      22
	BTFSC      STATUS+0, 2
	GOTO       L_update205
	MOVF       _menu+0, 0
	XORLW      23
	BTFSC      STATUS+0, 2
	GOTO       L_update206
	MOVF       _menu+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_update207
	MOVF       _menu+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_update208
	MOVF       _menu+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_update209
	MOVF       _menu+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_update210
	MOVF       _menu+0, 0
	XORLW      24
	BTFSC      STATUS+0, 2
	GOTO       L_update211
	MOVF       _menu+0, 0
	XORLW      25
	BTFSC      STATUS+0, 2
	GOTO       L_update212
	MOVF       _menu+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_update213
	MOVF       _menu+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_update214
	MOVF       _menu+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_update215
	MOVF       _menu+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_update216
	MOVF       _menu+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_update217
	MOVF       _menu+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_update218
	MOVF       _menu+0, 0
	XORLW      17
	BTFSC      STATUS+0, 2
	GOTO       L_update223
L_update194:
;Winding Machine.c,704 :: 		}
L_end_update:
	RETURN
; end of _update
