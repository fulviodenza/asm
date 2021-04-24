.section .data

data_items:
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

hello:
    .ascii "Hello There, general kenobi\0"

.section .text

.globl _start
_start:
    
    movl $0, %edi                   #move 0 in the index register
    movl data_items(,%edi,4), %eax  #load the first byte of data
    movl %eax, %ebx                 #since this is the first item, %eax is the biggest
    
start_loop:
    cmpl $0, %eax
    je loop_exit
    incl %edi
    movl data_items(,%edi,4), %eax
    cmpl %ebx, %eax
    jle start_loop
    
    movl %eax, %ebx
    jmp start_loop
    
loop_exit:
    movl $3, %ebx
    movl $1, %eax
    int $0x80
