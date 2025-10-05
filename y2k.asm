; i was bored so i did a thing, try it out
; assemble with: nasm -f bin y2k.asm -o y2k.com
; dosbox is preferred but you can use any dos emulator, just follow the earlier instructions and you will be fine

org 0x100        ; .COM file starts at 0x100

section .text

start:
    ; Clear the screen (optional, just for fun)
    mov ah, 0x0F      ; Get video mode
    int 0x10
    mov ah, 0x00
    int 0x10          ; Reset video mode (clear screen)

    ; release the dogs of waaarrrrr aka the y2k joke
    mov dx, y2k_msg
    call print_string

    ; keypress wait
    mov ah, 0x00
    int 0x16

    ; Exit program
    mov ax, 0x4C00
    int 0x21

; ------------------------
; subroutine to print a string at DS:DX
; ------------------------
print_string:
    push ax
.next_char:
    mov al, [dx]
    cmp al, 0
    je .done
    mov ah, 0x0E
    int 0x10
    inc dx
    jmp .next_char
.done:
    pop ax
    ret

; ------------------------
; here it comes 
; ------------------------
y2k_msg db 13, 10, '>> SYSTEM DATE: JAN 1, 1900', 13, 10
        db '>> WELCOME TO WINDOWS -99', 13, 10
        db '>> LOADING... PLEASE INSERT FLOPPY DISK #47', 13, 10
        db '>> ERROR: YOUR COMPUTER THINKS IT''S A TYPEWRITER', 13, 10
        db '>> HAPPY Y2K!', 13, 10, 0

