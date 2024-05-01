.globl _start

.data 
	v1: .word 0x2
    v2: .word 0x4
    v3: .word 0x6
    v4: .word 0x8
    res: .word 0x0
.text

_start:
    la t0, v1       #carico l'indirizzo di v1 in t0
    lw t1, 0(t0)    #carico il valore della prima variabile in t1
    lw t2, 4(t0)    #carico il valore della seconda variabile in t2
    add t3, t2, t1  #sommo t1 e t2 in t3
    lw t1, 8(t0)    #carico il valore della terza variabile in t1
    add t3, t3, t1  #sommo t1 e t3 in t3 (ovvero t3 += t1)
    lw t1, 12(t0)   #carico il valore della quarta variabile in t1
    add t3, t3, t1  #sommo t1 e t3 in t3 (ovvero t3 += t1)

    srai t3, t3, 2  #divido il valore di t3 per 4, spostando di 

    sw t3, 16(t0)   #salvo il contenuto di t3 in memoria
                    #a 16 byte di distanza da t0 (v1) ovvero in res
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
