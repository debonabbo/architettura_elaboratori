.globl _start

.data 
	size: .word 5
    array: .dword 123, 234, 345, 456, 567
    result: 0
.text

_start:
    la t0, size
    lw t0, 0(t0)
    la t1, array

    lw t2, 0(t1)
    addi t0, t0, -1
    addi t1, t1, 8

    while:
    bge zero, t0, endwhile
        lw t3, 0(t1)
        
        bge t3, t2, endif
            la t0, result
            sw zero, 0(t0)
            beq zero, zero, fine
        endif:

        addi t0, t0, -1
        addi t1, t1, 8
        beq zero, zero, while
    endwhile:

    la t0, result
    addi t1, zero, 1
    sw t1, 0(t0)

    fine:
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
