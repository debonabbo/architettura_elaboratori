.globl _start
.text
_start:
li a0, 1 # a
li a1, 2 # b
li s1, 0 # result

jal sum
add s1, a0, zero

#exit
li   a7, 10
ecall

sum:
add a0, a0, a1
jr ra