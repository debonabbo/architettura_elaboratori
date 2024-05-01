.globl _start

.data
    numstr: .string "324567"
.text

_start:
    # chiama strlen per ottenere la lunghezza della stringa 
    la a0, numstr 
    jal ra, strlen

    # chiama atoi 
    mv a1, a0 
    la a0, numstr
    jal ra, atoi_32bit
exit:
    # addi x17, x0, 10  # call number 10 = exit
    addi a0, x0, 10  # call number 10 = exit
    ecall

atoi:
    # a0 = numstr, a1 = n
    bgt a1, zero, else
        addi a0, zero, 0
        ret
    else:
        # preservo ra e s0
        addi sp, sp, -16
        sd ra, 0(sp)
        sd s0, 8(sp)

        # n--
        addi a1, a1, -1
        # calcolo indirizzo di array[n]
        add t0, a0, a1
        # metto l'elemento array[n] in s0
        lb s0, 0(t0)
        # chiamo atoi
        jal ra, atoi

        # moltiplico per 10 il contenuto di a0
        li t0, 10
        mul a0, a0, t0

        # ci sommo l'elemento prelevato prima
        add a0, s0, a0

        # tolgo '0'
        addi a0, a0, -48

        # ripristino ra e s0
        ld ra, 0(sp)
        ld s0, 8(sp)
        addi sp, sp, 16
        ret


strlen:
    addi t1, a0, 0
    while:
    lbu t0, 0(t1)
    beq zero, t0, endwhile
        addi t1, t1, 1
    beq zero, zero, while
    endwhile:
    sub a0, t1, a0
    ret