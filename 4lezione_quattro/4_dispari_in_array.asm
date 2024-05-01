.globl _start

.data 
	size: .word 5
    array: .byte 3, 4, 5, 6, 7
    result: .word 0
.text

_start:
    la t0, size
    lw t0, 0(t0)    # t0 = size
    la t1, array    # t1 = array
    addi t2, zero, 0    # t2 = numero di dispari
    
    addi t4, zero, 1    #maschera con ultimo bit
    while:
    bge zero, t0, endwhile
        lw t3, 0(t1)
        and t3, t3, t4

        beq t3, zero, endif
            addi t2, t2, 1
        endif:

        addi t1, t1, 1
        addi t0, t0, -1
        beq zero, zero, while
    endwhile:

    la t0, result
    sw t2, 0(t0)
    
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
