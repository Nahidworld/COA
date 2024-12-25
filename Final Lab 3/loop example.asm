.MODEL SMALL       ;memoery model is small
.STACK 100H        ;stack size is 256 bytes
.DATA              ;data segment
.CODE              ;code segment
MAIN PROC          ;main procedure   
    
    mov cx,127     ;load register 
    mov bl, 0
    
    print:
    mov ah,2    ;print
    inc cx
    cmp cx,255
    ja exit
    mov dx,cx
    int 21h
    mov dx,32d
    int 21h
    jmp go
    
    go:
    inc bl
    cmp bl,10
    je nl
    jmp print
    
    nl:
    mov ah,2
    mov dl, 0dh
    int 21h
    mov dl,0ah
    int 21h
    mov bl,0
    jmp print
    
    exit:
    
    MOV AH, 4CH    
    int 21h
    MAIN ENDP
END MAIN