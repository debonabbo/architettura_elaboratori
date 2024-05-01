.globl _start
.data        
    array: .word 1,1,2,2,3,4,4,1
    x:     .word 0
    y:     .word 1
    
.text
_start:
    # chiama equal
    la   a0, array
    la   a1, x
    lw   a1, 0(a1)
    la   a2, y
    lw   a2, 0(a2)
    jal  ra, equal
    
    #exit
    li   a7, 10
    ecall

#***************************************************
# completare la funzione equal nel campo di sotto
equal:
    addi t0, zero, 4    # Dimensione di una word
    mul a1, a1, t0      # Moltiplico l'indice e ottengo un offset
    mul a2, a2, t0      # Moltiplico l'indice e ottengo un offset
    add a1, a0, a1
    add a2, a0, a2
    lw a1, 0(a1)
    lw a2, 0(a2)
    beq a1, a2, si
    addi a0, zero, 0
    ret
    si:
    addi a0, zero, 1
    ret