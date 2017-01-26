    export problem2
    export NUM1
    export NUM2
    export TOTAL

WORD    EQU     4
    
    AREA    FLASH, CODE, READONLY
    ALIGN
    
;******************************************************************************
; Initialize address 0x20000000 to the values defined in problem 1
;******************************************************************************
problem2

    PUSH    {R0-R12, LR}

;******************************************************************************
; DO NOT MODIFY ABOVE
;******************************************************************************

;******************************************************************************
; ADD CODE BELOW
;******************************************************************************

	LDR	R0, =(NUM1)			; Loads Num1
	LDR R1, =(NUM2)			; Loads Num2
	LDR R11, =(CARRY)		; Loads Carry memory address 
	LDR R12, =(TOTAL)		; Loads the Total memory address
	MOV R3, #1				; #1 constant for the carry bit
	LDR R9, [R0]			; First value of Num1
	LDR R10, [R1]			; First value of Num2
	
	MOV32 R2, #0x06666666	; Should not produce any carries
	ADDS R2, R9, R2			; Checks to see if valid BCD #
	ADDS	R3, R2, R10		; Adds the two numbers
	EORS	R4, R2, R10		; Contains correct digit if carried occured	 
	EORS	R5, R3, R4		; Has all carries in correct positions		
	
	MVN	R5, R5				; Nots the value in R5
	MOV32 R6, #0x11111110	; Helps produce inverse of each carry
	ANDS R6, R5, R6			; Inverse of each carry
	
	MOV R2, #1				; #1 constant for the carry bit
	
	LSRS R7, R6, #2			; Right bit shifts by 2
	LSRS R8, R6, #3			; And by 3
	ORRS R9, R7, R8			; And then ORs the two shifted values
	SUBS R10, R3, R9
	
	STRMI R2, [R11]			; Stores carry of 8th digit
	
	
	STR R10, [R12]			; Stores the result
	


;******************************************************************************
; DO NOT MODIFY BELOW
;******************************************************************************
    
    POP    {R0-R12, PC}
    ALIGN
    
    AREA    SRAM, READWRITE
NUM1     SPACE      WORD*1
NUM2     SPACE      WORD*1
TOTAL    SPACE      WORD*1
CARRY    SPACE      WORD*1
    END    
    
