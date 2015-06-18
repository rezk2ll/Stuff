
; ____      ______  ______  _     _     
;|  _ \ ___|__  / |/ /___ \| |   | |    
;| |_) / _ \ / /| ' /  __) | |   | |    
;|  _ <  __// /_| . \ / __/| |___| |___ 
;|_| \_\___/____|_|\_\_____|_____|_____| , this should be assembled by NASM !
; 


	%macro write 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 0x80
	%endmacro

	%macro read 2
	mov eax,3
	xor ebx,ebx
	mov ecx,%1
	mov edx,%2
	int 0x80
	%endmacro


section .data                                       
	t1 db " ____      ______  ______  _     _     ",0xa
	l1 equ $-t1
	t2 db "|  _ \ ___|__  / |/ /___ \| |   | |  ",0xa
	l2 equ $-t2
	t3 db "| |_) / _ \ / /| ' /  __) | |   | |    ",0xa
	l3 equ $-t3
	t4 db "|  _ <  __// /_| . \ / __/| |___| |___ ",0xa
	l4 equ $-t4
	t5 db "|_| \_\___/____|_|\_\_____|_____|_____| F1nd_My_K3y5 #",0xa,0xa
	l5 equ $-t5
	t6 db "Password : ",0x0
	l6 equ $-t6
	nn db "No. !",0xa
	ln equ $-nn
	yy db "Yep , you Are correct !",0xa
	ly equ $-yy
	doge db "Such Flag !",0x0
	ld equ $-doge


section .bss
	junk resb 15
	buff resb 1
	flag resb 14

section .text                                       
	global _start

_start:
	write t1,l1
	write t2,l2
	write t3,l3
	write t4,l4
	write t5,l5
	write t6,l6
	read junk,14
	cmp eax,8
	jl NO
	mov edx,flag
	push junk
	xor ecx,ecx
	call init
	add ecx,eax
	call jnit
	add ecx,eax
	call knit
	add ecx,eax
	call lnit
	add ecx,eax
	call mnit
	add ecx,eax
	call nnit
	add ecx,eax
	call onit
	add ecx,eax
	call pnit
	add ecx,eax
	call qnit
	add ecx,eax
	call anit 
	add ecx,eax
	call bnit
	add ecx,eax
	call cnit
	add ecx,eax
	call dnit
	add ecx,eax
	sub ecx,0x40
	mov byte [edx],0x0
	mov edx,flag
	mov byte [flag+0xa],0x4f
	mov byte [flag+0xc],0x30
	call bajbouj
	cmp ecx,0x3da
	jne NO
	add ecx,0x40
	sub ecx,eax
	cmp ecx,0x3ef
	jne NO
	cmp ecx,0x4F
	jg Yep
	
NO:
	write nn,ln
	jmp check_password
	
Yep:
	write yy,ly
	jmp check_password



check_password:
	read buff,1
	cmp byte [buff],0xa
	jne check_password
	mov eax,1
	xor ebx,ebx
	int 0x80


init:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,4
	xor eax,eax
	mov al,byte [ebx]
	cmp al,0x66
	je init+9
	add al,6
	xor al,5
	mov byte [edx],al
	inc edx
	ret
	
jnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	mov al,byte [ebx]
	cmp al,0x6c
	je jnit+22
	add al,9
	xor al,7
	mov byte [edx],al
	inc edx
	ret
	add ebx,3
	jmp jnit+7
	
knit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,2
	mov al,byte [ebx]
	cmp al,0x61
	je knit+8
	add al,7
	xor al,3
	mov byte [edx],al
	inc edx
	ret
	
	
lnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,6
	mov al,byte [ebx]
	cmp al,0x67
	je lnit+7
	add al,5
	xor al,8
	mov byte [edx],al
	inc edx
	ret

mnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,5
	mov al,byte [ebx]
	cmp al,0x69
	je mnit+7
	add al,0x10
	xor al,0x45
	mov byte [edx],al
	inc edx
	ret

bajbouj:
	xor ebx,ebx
	xor esi,esi
	mov bl, byte [edx+esi]
	sub bl, byte [junk+esi]
	mov byte [edx+esi],bl
	inc esi
	cmp byte [edx+esi],0x0
	jne bajbouj+4
	call marzou9i
	ret

nnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,1
	mov al,byte [ebx]
	cmp al,0x53
	je mnit+7
	add al,0x11
	xor al,7
	mov byte [edx],al
	inc edx
	ret

onit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,3
	mov al,byte [ebx]
	cmp al,0x4e
	je onit+7
	add al,0x4
	xor al,2
	mov byte [edx],al
	inc edx
	ret
	
pnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,9
	mov al,byte [ebx]
	cmp al,0x4f
	je pnit+7
	add al,1
	xor al,8
	mov byte [edx],al
	inc edx
	ret

marzou9i:
	xor ebx,ebx
	call again
	ret
	

qnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,8
	mov al,byte [ebx]
	cmp al,0x30
	je qnit+7
	jmp knit+17
	
again:
	dec esi
	mov bl, byte [edx+esi]
	shl bl,2
	mov byte [edx+esi],bl
	cmp esi,0x0
	jne again
	ret
	
anit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,0xa
	mov al,byte [ebx]
	cmp al,0x50
	je anit+7
	jmp knit+17
bnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,0x7
	mov al,byte [ebx]
	cmp al,0x50
	je bnit+7
	jmp knit+17
cnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,0xb
	mov al,byte [ebx]
	cmp al,0x45
	je cnit+7
	jmp knit+17
dnit:
	pop esi
	mov ebx,esi
	pop esi
	push esi
	push ebx
	mov ebx,esi
	add ebx,0xc
	mov al,byte [ebx]
	cmp al,0x53
	je dnit+7
	jmp knit+17
