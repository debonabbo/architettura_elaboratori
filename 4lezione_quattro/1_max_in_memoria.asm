.globl _start

.data 
	a:      .word 5
    b:      .word 10
    c:      .word 9
    max:    .word 0
.text

# max = a
## if(max < b)
#     max = b
## if(max < c)
#     max = c

_start:
    la t0 a         # t0 = &a
    lw t1 0(t0)     # t1 = a
    lw t2 4(t0)     # t2 = b
    lw t3 8(t0)     # t3 = c

    addi t4, t1, 0  # max = a

    bge t4, t2, endif1 # if max >= b allora endif1
        addi t4, t2, 0  # max = b
    endif1:
    bge t4, t3, endif2 # if max >= c allora endif2
        addi t4, t3, 0  # max = c
    endif2:

    sw t4, 12(t0)   # *(&a+12) = max

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
