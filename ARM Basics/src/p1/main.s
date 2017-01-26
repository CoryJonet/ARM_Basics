; Filename:     main.s 
; Author:       REPLACE WITH YOUR NAMES 
; Description:  
    export __main
    import problem1
    import SIZE
    import SRC

    
    
;Indicating where the CODE section of the program starts
    AREA    FLASH, CODE, READONLY
SRC_ASM     DCD     2
            DCD     1
            DCD     101
            DCD     4
            DCD     100
            DCD     51
            DCD     76
            DCD     200
            DCD     70
            DCD     -1
            DCD     16
            DCD     44
            DCD     33
            DCD     201
            DCD     9
            DCD     17

            

;**********************************************
; main program start
;**********************************************
__main    
    LDR     R0, =(SIZE)
    MOV     R1, #16
    STR     R1, [R0]
    
    LDR     R0, =(SRC_ASM)
    LDR     R1, =(SRC)
    STR     R0, [R1]
    BL       problem1
    B        __main
    ALIGN

    END