ORG 100H

.DATA
    MSG1 DB 'Enter a single digit (0-9): $'
    EVEN_MSG DB 'The digit is even!$'
    ODD_MSG DB 'The digit is odd!$'
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
    
    MOV AH, 09H
    LEA DX, newline
    INT 21H
    
    ; Get the digit
    MOV AH, 01H
    INT 21H
    SUB AL, '0'  ; Convert ASCII to digit
    
    mov ah, 09h
    Lea dx, newline
    Int 21h
    
    ; Check if the digit is odd or even using MOD
    MOV BL, AL   ; Store the digit in BL
    MOV AH, 00   ; Clear AH
    MOV CL, 2    ; Divisor = 2
    DIV CL       ; Divide AX by 2 (AX = BL / CL)               ; Remainder is in AH, quotient in AL
    CMP AH, 0    ; Check if remainder is 0 (even)
    JZ EVEN      ; Jump to EVEN if zero

    ; If odd, display "The digit is odd!"
    MOV AH, 09H
    LEA DX, ODD_MSG
    INT 21H
    JMP PRINT_NEWLINE

EVEN:
    ; If even, display "The digit is even!"
    MOV AH, 09H
    LEA DX, EVEN_MSG
    INT 21H

PRINT_NEWLINE:
    ; Print newline
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    MOV AH, 4CH
    INT 21H

END MAIN
