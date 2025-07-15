global _start
section .text
func:
push 0x22
mov rax, 1
mov rdi, r10
mov rsi, rsp
mov rdx, 1
syscall
pop rax
mov r9, 0
loop_start:
cmp byte [message + r9], 0x0
je loop_end
cmp byte [message + r9], 0xA
je loop_newline
lea r8, [message + r9]
mov rax, 1
mov rdi, r10
mov rsi, r8
mov rdx, 1
syscall
add r9, 1
jmp loop_start
loop_newline:
mov r8, 0x222C4178302C22
push r8
mov rax, 1
mov rdi, r10
mov rsi, rsp
mov rdx, 7
syscall
pop rax
add r9, 1
jmp loop_start
loop_end:
push 0x302C22
mov rax, 1
mov rdi, r10
mov rsi, rsp
mov rdx, 3
syscall
pop rax
ret
%macro mystart 0
%if 0
comment
%endif
_start:
mov rax, 2
mov rdi, filename
mov rsi, 1 | 0o100
mov rdx, 0o644
syscall
mov r10, rax
mov rax, 1
mov rdi, r10
mov rsi, message
mov rdx, 884
syscall
call func
mov rax, 3
mov rdi, r9
syscall
mov rax, 60
xor rdi, rdi
syscall
%endmacro
mystart
section .data
filename: db'Grace_kid.s',0
message: db"global _start",0xA,"section .text",0xA,"func:",0xA,"push 0x22",0xA,"mov rax, 1",0xA,"mov rdi, r10",0xA,"mov rsi, rsp",0xA,"mov rdx, 1",0xA,"syscall",0xA,"pop rax",0xA,"mov r9, 0",0xA,"loop_start:",0xA,"cmp byte [message + r9], 0x0",0xA,"je loop_end",0xA,"cmp byte [message + r9], 0xA",0xA,"je loop_newline",0xA,"lea r8, [message + r9]",0xA,"mov rax, 1",0xA,"mov rdi, r10",0xA,"mov rsi, r8",0xA,"mov rdx, 1",0xA,"syscall",0xA,"add r9, 1",0xA,"jmp loop_start",0xA,"loop_newline:",0xA,"mov r8, 0x222C4178302C22",0xA,"push r8",0xA,"mov rax, 1",0xA,"mov rdi, r10",0xA,"mov rsi, rsp",0xA,"mov rdx, 7",0xA,"syscall",0xA,"pop rax",0xA,"add r9, 1",0xA,"jmp loop_start",0xA,"loop_end:",0xA,"push 0x302C22",0xA,"mov rax, 1",0xA,"mov rdi, r10",0xA,"mov rsi, rsp",0xA,"mov rdx, 3",0xA,"syscall",0xA,"pop rax",0xA,"ret",0xA,"%macro mystart 0",0xA,"%if 0",0xA,"comment",0xA,"%endif",0xA,"_start:",0xA,"mov rax, 2",0xA,"mov rdi, filename",0xA,"mov rsi, 1 | 0o100",0xA,"mov rdx, 0o644",0xA,"syscall",0xA,"mov r10, rax",0xA,"mov rax, 1",0xA,"mov rdi, r10",0xA,"mov rsi, message",0xA,"mov rdx, 884",0xA,"syscall",0xA,"call func",0xA,"mov rax, 3",0xA,"mov rdi, r9",0xA,"syscall",0xA,"mov rax, 60",0xA,"xor rdi, rdi",0xA,"syscall",0xA,"%endmacro",0xA,"mystart",0xA,"section .data",0xA,"filename: db'Grace_kid.s',0",0xA,"message: db",0