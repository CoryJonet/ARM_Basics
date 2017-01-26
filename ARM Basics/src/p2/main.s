; Filename:     main.s 
; Author:       REPLACE WITH YOUR NAMES 
; Description:  
    export __main
    import problem2
    import NUM1
    import NUM2

    
    
;Indicating where the CODE section of the program starts
    AREA    FLASH, CODE, READONLY


;**********************************************
; main program start
;**********************************************
__main    
    LDR     R0, =(NUM1)
    LDR     R1, =(NUM2)
    MOV32   R2, #0x12345678
    MOV32   R3, #0x92245111
    STR     R2, [R0]
    STR     R3, [R1]
    BL       problem2
    B        __main
    ALIGN

    END