.globl _start

.data 
	size: .word 8
    array: .dword 2,1,3,2,3,-6,1,23 
.text

_start:
    la t0, size
    lw t0, 0(t0)
    la t1, array

    addi t3, zero, 8
    mul t2, t0, t3
    add t2, t1, t2
    addi t2, t2, -8
    # t2 contiene la fine dell'array
    # t1 contiene l'inizio dell'array
    
    srai t0, t0, 1
    # t0 contiene meta' lunghezza dell'array,
    # ovvero il numero di iterazioni del while

    while:
    bge zero, t0, endwhile
        # swap di t3 e t4 in memoria
        ld t3, 0(t1)
        ld t4, 0(t2)
        sd t3, 0(t2)
        sd t4, 0(t1)

        addi t1, t1, 8      # inizio++
        addi t2, t2, -8     # fine--
        addi t0, t0, -1     # iterazioni--
        beq zero, zero, while
    endwhile:

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall