    export problem1
    export SIZE
    export SRC
    export ANS

WORD	EQU	4

    AREA    FLASH, CODE, READONLY
    ALIGN
    
;******************************************************************************
; Initialize address 0x20000000 to the values defined in problem 1
;******************************************************************************
problem1

    PUSH {R0-R12, LR}

;******************************************************************************
; DO NOT MODIFY ABOVE
;******************************************************************************

;******************************************************************************
; ADD CODE BELOW
;******************************************************************************

	LDR	R0, =(SIZE) 			; Max size counter
	LDR R1, =(SRC)				; First source memory address 
	LDR R6, =(ANS)				; Answer
	MOV R2, #0 					; Counter i
	MOV R5, #0x0FFFFFFF			; Puts the biggest possible value into R5 to compare against
	LDR R7, [R0]				; Load value of SIZE into R7	
	
Loop

	LDR R8, [R1]				; Load first value of SRC
	LDR R3, [R8, R2]			; Get the ith element in SRC 
	ANDS R10, R3, #0x00000003 	; Checks lower 2 bits if a 0
	BGT	Not_Multiple			; Branches if SHR didn't give Z = 0 flag...not divisable by 4
	
	CMP	R5, R3					; Compares to see if contents R3 is smaller than contents R5
	MOVPL R5, R3				; Moves contents R3 into contents R5 if it's smaller
	

Not_Multiple
	ADD R2, R2, #WORD			; Increments i counter
	SUBS R7, R7, #1				; Decrements the size count 
	BNE	Loop

	MOV R11, #0x0FFFFFFF
	MOV R2, #0					; Used to place #0 in R2
	CMP	R11, R5					; Checks to see if any # was devisable by 4
	STRGT R5, [R6]				; If devisable by 4 smallest # found, store that # in ANS
	STRLE R2, [R6]				; Else store #0 in ANS

;******************************************************************************
; DO NOT MODIFY BELOW
;******************************************************************************
    
    POP {R0-R12, PC} 
    ALIGN
 
    
    AREA    SRAM, READWRITE
ANS    SPACE      4*1
SIZE   SPACE      4*1
SRC    SPACE      4*1
        END   
