.globl _start

.data
    num: .word 5
.text

_start:
    la a0, num
    lw a0, 0(a0)
    jal ra, fib_prof

exit:
    # addi x17, x0, 10  # call number 10 = exit
    addi a0, x0, 10  # call number 10 = exit
    ecall

fib:
    bgt a0, zero, elseif
        ret
    elseif:
    addi t0, zero, 1
    bgt a0, t0, else
        ret
    else:
        addi sp, sp, -16
        sd ra, 0(sp)
        sd a0, 8(sp)

        addi a0, a0, -1
        jal fib
        lw t0, 8(sp)    # carico di nuovo n in t0
        sw a0, 8(sp)    # salvo il risultato dell'esecuzione di fibonacci
        addi a0, t0, -2 # tolgo al risultato dell'esecuzione 2
        jal fib

        lw t0, 8(sp)    # carico il risultato dell'esecuzione di fib precedente
        add a0, a0, t0  # lo aggiungo al risultato dell'esecuzione attuale

        ld ra, 0(sp)
        addi sp, sp, 16
        ret