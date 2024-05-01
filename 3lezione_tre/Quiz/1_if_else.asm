.globl _start

.data 
	x: .word 3
    y: .word 5
.text

_start:
    la t0, x
    lw t0, 0(t0)

    la t1, y
    lw t1, 0(t1)

    addi t0, t0, -2
    add t0, t0, t1

    if:
    bge t0, t1, else
        addi t0, t0, 1
        beq zero, zero, endif
    else:
        addi t1, t1, 1
    endif:

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
