.globl _start

.data 
	n:   .word 13   # in binario 1011
    res: .word 0
.text

_start:
    la t0, n        # t0 = &n
    lw t0, 0(t0)    # n     t0 = *t0
    li t2, 0        # res   t2 = 0
    li t1, 1        # maschera ... 0000 0001 utilizzata per prelevare il bit
    
    while:
    beq zero, t0, endwhile  # se in t0 son tutti 0, salto a endwhile
        and t3, t0, t1      # prelevo l'ultimo bit di t0 e lo metto in t3
        add t2, t2, t3      # t2 += t3 (che vale 1 o 0)
        srli t0, t0, 1      # sposto t0 verso destra per leggere il prossimo bit
        beq zero, zero, while   # torno all'inizio del while
    endwhile:

    #salvo res in memoria
    la t0, res      # t0 = &res
    sw t2, 0(t0)    # *t0 = t2

print:
    #stampo t2 (ovvero il risultato)
    addi a0, zero, 1
    addi a1, t2, 0
    ecall
    
exit:
    addi a0, x0, 10  # call number 10 = exit
    ecall
