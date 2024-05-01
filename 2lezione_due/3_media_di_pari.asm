.globl _start

.text
_start:
    # calcola la media tra -2 e 4 (==1)
    li x5, -2
    li x6, 4

    li x7, 0
    # sommo i due numeri in x7
    add x7, x6, x5
    # divido per due spostando la somma calcolata di una posizione (2^1)
    srai x7, x7, 1 
    # nel registro x7 c'e' il risultato, ovvero 1
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
