.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 0DH,0AH, 'Enter a character: $'
    MSG_UPPER DB 0DH,0AH, 'Converted to upper case:$'
    MSG_LOWER DB 0DH,0AH, 'Converted to lower case:$'
    MSG_NOT_LETTER DB 0DH,0AH, 'Input is not a letter.$'
    INPUT_CHAR DB ?
    
.CODE
MAIN PROC       
    MOV AX, @DATA       ;Initialize data segment
    MOV DS, AX 
    ;PRINT PROMPT
    MOV AH, 9           ;display string function
    LEA DX, PROMPT      ;Load address of PROMPT into DX
    INT 21H             ;execute the function
    ;READ INPUT CHARACTER
    MOV AH, 1           ;input character funciton
    INT 21H   
    MOV BL, AL;SAVE INPUT CHARACTER   
    
    ;CHECK IF INPUT IS LETTER
    CMP BL, 'A'         ;Compare input with 'A'
    JB NOT_LETTER       ;If less than 'A', it's not a letter
    CMP BL, 'Z'         ;Compare input with 'Z'
    JBE UPPER_CASE      ;If within 'A' to 'Z', it's uppercase
    
    CMP BL, 'a'         ;Compare input with 'a'                     
    JB NOT_LETTER       ;If less than 'a', it's not a letter
    CMP BL,'z'          ;Compare input with 'z'
    JBE LOWER_CASE      ;If within 'a' to 'z', it's lowercase
                     
  LOWER_CASE:
    ;Convert to upper case
    AND BL, 11011111b   ;Clear bit 5 to convert to uppercase
    ;Print result   
    MOV AH, 9
    LEA DX,MSG_UPPER    ;Load address of MSG_UPPER
    INT 21H             
    MOV AH,2            ;display character function
    MOV DL,BL           ;load converted character to dl
    INT 21H
    jmp EXIT            ;go to exit level
    
  UPPER_CASE:
    ;convert to lower case
    OR BL,00100000b     ;by using OR instruction set bit no. 5
    ;Print result
    MOV AH,9            ;display string function
    LEA DX, MSG_LOWER   ;load the effective address of MSG_lower
    INT 21H             ;execute the fucntion 
    MOV AH,2            ;display character function
    MOV DL,BL           ;load converted character to dl
    INT 21H
    JMP EXIT            ;go to exit level
    
  NOT_LETTER:
    ;Print error message
    MOV AH,9            ;display string function
    LEA DX,MSG_NOT_LETTER;load the effective address of MSG_NOT_LETTER 
    INT 21H             ;execute the function
  EXIT: 
  ;Exit Program
    MOV AH,4CH          ;terminate
    INT 21H;
    MAIN ENDP
END MAIN