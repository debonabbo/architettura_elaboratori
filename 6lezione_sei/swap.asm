.globl _start
.data
    size:  .word 8
    array: .word 1,5,3,7,2,6,4,8
    x:     .word 0
    y:     .word 1
    
.text
_start:
    # chiama swap
    la   a0, array
    la   a1, x
    lw   a1, 0(a1)
    la   a2, y
    lw   a2, 0(a2)
    jal  ra, swap
    
    #exit
    li   a0, 10
    ecall

#***************************************************
# completare la funzione swap nel campo di sotto
swap:
    #Calcolo gli indirizzi dei due valori
    addi t0, zero, 4
    mul a1, a1, t0
    mul a2, a2, t0
    add a1, a1, a0
    add a2, a2, a0
    #Carico i valori
    lw t0, 0(a1)
    lw t1, 0(a2)
    #Salvo i valori
    sw t1, 0(a1)
    sw t0, 0(a2)
    
    ret
    