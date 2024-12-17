.MODEL SMALL
.STACK 100H
.DATA 
m1 db 0DH,0AH, "Thank You$"
.CODE  
MAIN PROC
    mov ax, @data
    mov ds, ax
    mov ah, 2
    mov cx, 3;
    
    jmp Label_3
    
    Label_0:
    mov dl, 'b'
    int 21h
    jmp Label_5
    
    Label_1:
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    jmp label_0
    
    Label_2:
    mov dl, 'y'
    int 21h    
    jmp Label_6
    
    Label_3:
    mov dl, '*'
    int 21h
    dec cx 
    jnz Label_3
    jmp Label_1
    
    Label_4:
    mov dl, 'R'
    int 21h
    int 21h
    jmp Label_2
    
    Label_5:
    mov dl, 'e'
    int 21h
    mov cx,2
    jmp Label_4
    
    Label_6:
    mov ah,9
    lea dx, m1 
    int 21h
    main endp
END MAIN