.globl _start
.data
    array: .word 1,2,3,4,5,4,3,2,1
    size:  .word 9
    
.text
_start:
    # chiama palindrome
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, palindrome
    
    #exit
    li   a0, 10
    ecall

#*********************************************************
# completare la funzione palindrome nel campo di sotto
palindrome:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd s0, 8(sp)
    sd s1, 16(sp)
    sd s2, 24(sp)

    # Uso s0 al posto di a0
    addi s0, a0, 0      # s0 = array
    addi s1, zero, 0    # s1 = a
    addi s2, a1, -1     # s2 = b

    while:
    bge s1, s2, endwhile
        addi a0, s0, 0  # array
        addi a1, s1, 0  # a
        addi a2, s2, 0  # b
        jal ra, equal
        beq a0, zero, endwhile
        addi s1, s1, 1
        addi s2, s2, -1
        j while
    endwhile:

    ld ra, 0(sp)
    ld s0, 8(sp)
    ld s1, 16(sp)
    ld s2, 24(sp)
    addi sp, sp, 32
    ret

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