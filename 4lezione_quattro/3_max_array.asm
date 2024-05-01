.globl _start

.data 
	size:   .word 4
    array:  .word 5, 2, 1, 7,
    result: .word 0
.text

_start:
    la t0, size
    lw t0, 0(t0)        # t0 = size
    la t1, array        # t1 = array
    lw t2, 0(t1)        # t2 = max = array[0]
    addi t0, t0, -1     # size--
    addi t1, t1, 4      # array++

    while:
    bge zero, t0, endwhile
        lw t3, 0(t1)
        bge t2, t3, endif
            addi t2, t3, 0
        endif:
        addi t1, t1, 4      #array++
        addi t0, t0, -1     #size--
        beq zero, zero, while
    endwhile:

    #t2 contiene il max
    la t0, result
    sw t2, 0(t0)
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
