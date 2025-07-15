;  nasm -felf64 Colleen.asm && ld Colleen.o && ./a.out
global    _start

section   .text

; function to print the 'message' variable, but formatted so that it compiles as source
func:
push 0x22
mov rax, 1
mov rdi, 1
mov rsi, rsp
mov rdx, 1
syscall
pop rax

mov r9, 0 ; counter
loop_start:
cmp byte [message + r9], 0x0 ; check for null byte
je loop_end
cmp byte [message + r9], 0xA ; check for newline
je loop_newline

; print stuff here
lea r8, [message + r9]
mov rax, 1
mov rdi, 1
mov rsi, r8
mov rdx, 1
syscall

add r9, 1
jmp loop_start

loop_newline:
mov r8, 0x222C4178302C22 ; ",0xA,"
push r8
mov rax, 1
mov rdi, 1
mov rsi, rsp
mov rdx, 7
syscall
pop rax
add r9, 1
jmp loop_start

loop_end:
push 0x302C22 ; ",0
mov rax, 1
mov rdi, 1
mov rsi, rsp
mov rdx, 3
syscall
pop rax

ret

_start:
; write message here...
call func
mov rax, 60                 ; system call for exit
xor rdi, rdi                ; exit code 0
syscall                           ; invoke operating system to exit
section   .data

message: db"global _start",0xA,"section .text",0xA,"func:",0xA,"push 0x22",0xA,"mov rax, 1",0xA,"mov rdi, 1",0xA,"mov rsi, rsp",0xA,"mov rdx, 1",0xA,"syscall",0xA,"pop rax",0xA,"mov r9,0",0xA,"loop_start:",0xA,"cmp byte [message + r9],0x0",0xA,"je loop_end",0xA,"cmp byte [message + r9],0xA",0xA,"je loop_newline",0xA,"lea r8, [message + r9]",0xA,"mov rax, 1",0xA,"mov rdi, 1",0xA,"mov rsi, r8",0xA,"mov rdx, 1",0xA,"syscall",0xA,"add r9, 1",0xA,"jmp loop_start",0xA,"loop_newline:",0xA,"mov r8,0x222C4178302C22",0xA,"push r8",0xA,"mov rax, 1",0xA,"mov rdi, 1",0xA,"mov rsi, rsp",0xA,"mov rdx, 7",0xA,"syscall",0xA,"pop rax",0xA,"add r9, 1",0xA,"jmp loop_start",0xA,"loop_end:",0xA,"push 0x302C22",0xA,"mov rax, 1",0xA,"mov rdi, 1",0xA,"mov rsi, rsp",0xA,"mov rdx, 3",0xA,"syscall",0xA,"pop rax",0xA,"ret",0xA,"_start:",0xA,"mov rax, 1",0xA,"mov rdi, 1",0xA,"mov rsi, message",0xA,"mov rdx, 671",0xA,"syscall",0xA,"call func",0xA,"mov rax, 60",0xA,"xor rdi, rdi",0xA,"syscall",0xA,"section .data",0xA,"message: db ",0