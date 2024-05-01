.globl _start

.data 
    x: .word -5
    y: .word -2
    z: .word -4
    result: .word 0
.text

_start:
    la t3, x
    lw t0, 0(t3)
    lw t1, 4(t3)
    lw t2, 8(t3)

    addi t3, t0, 0
    bge t3, t1, endif1
        addi t3, t1, 0
    endif1:
    bge t3, t2, endif2
        addi t3, t2, 0
    endif2:

    la t0, result
    sw t3, 0(t0)
print:
    addi a0, t3, 0

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
