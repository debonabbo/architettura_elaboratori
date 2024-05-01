.globl _start

.data 
	size: .word 3
    array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
.text

_start:
    la a0, array
    la a1, size
    lw a1, 0(a1)
    # jal ra, sumarray_it
    jal ra, sumarray_rec

exit:
    # addi x17, x0, 10  # call number 10 = exit
    addi a0, x0, 10  # call number 10 = exit
    ecall

sumarray_it:
    addi t0, a0, 0
    addi a0, zero, 0
    while:
        bge zero, a1, endwhile
        lw t1, 0(t0)    # t2 = *array
        add a0, a0, t1  # sum += t2
        addi t0, t0, 4  # array++
        addi a1, a1, -1
        j while
    endwhile:

    ret

sumarray_rec:
    # a0 = &array
    # a1 = size(array)
    bgt a1, zero, else
        li a0, 0
        ret
    else:
        # preservo ra e s0
        addi sp, sp, -16
        sd ra, 0(sp)
        sd s0, 8(sp)

        # metto l'elemento attuale in s0
        lw s0, 0(a0)

        # array++, size-- e chiamo sumarray
        addi a0, a0, 4
        addi a1, a1, -1
        jal ra, sumarray_rec

        # sommo il contenuto di a0 con l'elemento in s0
        add a0, a0, s0

        # ripristino ra e s0 precedenti
        ld ra, 0(sp)
        ld s0, 8(sp)
        addi sp, sp, 16
        ret