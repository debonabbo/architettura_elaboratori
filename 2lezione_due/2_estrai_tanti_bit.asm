.globl _start

.text
_start:
    # li x5, 0x0000000000000000
    # li x5, 0xFFF0FFFF
    li x5, 0x12345678
    li x6, 0xFFFFFFFF

    # creo maschera in x29 per selezionare dal 11 al 16
    addi x29, x0, 63 # 11 1111
    slli x29, x29, 10   # 1111 1100 0000 0000

    # copio in x7 i valori da x5 usando la maschera x29
    and x7, x5, x29
    # cancello i valori appena prelevati
    sub x5, x5, x7

    # sposto la maschera di 15 per andare a copiare i valori nella 
    # posizione giusta di x6
    slli x29, x29, 15
    # faccio posto in x6 per i nuovi valori
    sub x6, x6, x29

    # sposto di 15 i valori che avevo prelevato
    slli x7, x7, 15
    # li carico in x6
    or x6, x6, x7
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
