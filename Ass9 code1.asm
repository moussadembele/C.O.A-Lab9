                                      ORG 100H

.DATA
    MSG1 DB 'Enter first digit (0-9): $'
    MSG2 DB 'Enter second digit (0-9): $'
    EQUAL_MSG DB 'The digits are equal!$'
    NOT_EQUAL_MSG DB 'The digits are not equal!$'
    NEWLINE DB 0Dh, 0Ah, '$'

.CODE
MAIN:
    ; Set up data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display MSG1
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H
     
    MOV AH, 09h
    lea dx, newline
    int 21h
    
    ; Get first digit
    MOV AH, 01H  
    INT 21H
    SUB AL, '0'  ; Convert ASCII to digit
    MOV BL, AL   ; Store first digit in BL
                                           
    
    MOV AH, 09H
    LEA DX, newline
    int 21h                                       
    ; Display MSG2
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H 
    
    MOV AH, 09H
    LEA DX, newline
    Int 21h

    ; Get second digit
    MOV AH, 01H
    INT 21H
    SUB AL, '0'  ; Convert ASCII to digit
    MOV BH, AL   ; Store second digit in BH
    
    MOV AH, 09H
    LEA DX, newline
    int 21h
    
    ; Compare the two digits
    CMP BL, BH
    JE EQUAL      ; If BL == BH, jump to EQUAL

    ; If not equal, print "The digits are not equal!"
    MOV AH, 09H
    LEA DX, NOT_EQUAL_MSG
    INT 21H
    JMP PRINT_NEWLINE

EQUAL:
    ; If equal, print "The digits are equal!"
    MOV AH, 09H
    LEA DX, EQUAL_MSG
    INT 21H

PRINT_NEWLINE:
    ; Print newline
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    ; Terminate program
    MOV AH, 4CH
    INT 21H

END MAIN
