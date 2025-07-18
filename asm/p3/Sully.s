global main
extern sprintf
extern dprintf
extern system
section .bss
comd resb 100
out_name resb 10
fd resb 8
y resb 8
section .text
main:
mov rax, [x]
sub rax, 1
mov [y], rax
push out_name_fmt
mov rdi, out_name
mov rsi, out_name_fmt
mov rdx, [x]
call sprintf
pop rax
push exec_cmd_fmt
mov rdi, comd
mov rsi, exec_cmd_fmt
mov rdx, [x]
call sprintf
pop rax
mov eax, [x]
cmp eax, 0
jl end
mov rax, 2
mov rdi, out_name
mov rsi, 1 | 0o100
mov rdx, 0o644
syscall
mov [fd], rax
push out_content_fmt
sub rsp, 8
push 34
mov rdi, [fd]
mov rsi, out_content_fmt
mov rdx, 10
mov rcx, [y]
mov r8, out_content_fmt
mov r9, 37
call dprintf
pop rax
mov rax, 2
mov rdi, [fd]
syscall
push comd
mov rdi, comd
call system
pop rax
end:
mov rax, 60
xor rdi, rdi
syscall  
section .data
x dd 5
exec_cmd_fmt: db 'nasm -felf64 Sully_%1$d.s -o Sully_%1$d.o && gcc -no-pie Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d && rm -f *.o',0
out_name_fmt: db 'Sully_%d.s',0
out_content_fmt: db "global main%1$cextern sprintf%1$cextern dprintf%1$cextern system%1$csection .bss%1$ccomd resb 100%1$cout_name resb 10%1$cfd resb 8%1$cy resb 8%1$csection .text%1$cmain:%1$cmov rax, [x]%1$csub rax, 1%1$cmov [y], rax%1$cpush out_name_fmt%1$cmov rdi, out_name%1$cmov rsi, out_name_fmt%1$cmov rdx, [x]%1$ccall sprintf%1$cpop rax%1$cpush exec_cmd_fmt%1$cmov rdi, comd%1$cmov rsi, exec_cmd_fmt%1$cmov rdx, [x]%1$ccall sprintf%1$cpop rax%1$cmov eax, [x]%1$ccmp eax, 0%1$cjl end%1$cmov rax, 2%1$cmov rdi, out_name%1$cmov rsi, 1 | 0o100%1$cmov rdx, 0o644%1$csyscall%1$cmov [fd], rax%1$cpush out_content_fmt%1$csub rsp, 8%1$cpush 34%1$cmov rdi, [fd]%1$cmov rsi, out_content_fmt%1$cmov rdx, 10%1$cmov rcx, [y]%1$cmov r8, out_content_fmt%1$cmov r9, 37%1$ccall dprintf%1$cpop rax%1$cmov rax, 2%1$cmov rdi, [fd]%1$csyscall%1$cpush comd%1$cmov rdi, comd%1$ccall system%1$cpop rax%1$cend:%1$cmov rax, 60%1$cxor rdi, rdi%1$csyscall  %1$csection .data%1$cx dd %2$d%1$cexec_cmd_fmt: db 'nasm -felf64 Sully_%4$c1$d.s -o Sully_%4$c1$d.o && gcc -no-pie Sully_%4$c1$d.o -o Sully_%4$c1$d && ./Sully_%4$c1$d && rm -f *.o',0%1$cout_name_fmt: db 'Sully_%4$cd.s',0%1$cout_content_fmt: db %5$c%3$s%5$c,0",0