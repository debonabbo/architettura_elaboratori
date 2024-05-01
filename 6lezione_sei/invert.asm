.globl _start
.data
    size:  .word 8
    array: .word 1,5,3,7,2,6,4,8
.text
_start:
    # chiama invert
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)        
    jal  ra, invert
    
    #exit
    li   a0, 10
    ecall

#***************************************************
# completare la funzione invert nel campo di sotto
invert:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd s0, 8(sp)
    sd s1, 16(sp)
    sd s2, 24(sp)
    addi s0, a0, 0
    addi s1, zero, 0    # s1 = x = 0
    addi s2, a1, -1     # s2 = y = len-1
    loop:
    bge s1, s2, endloop # while(x<y)
        addi a0, s0, 0
        addi a1, s1, 0
        addi a2, s2, 0
        jal ra, swap
        addi s1, s1, 1  # x++
        addi s2, s2, -1 # y--
        j loop
    endloop:
    ld ra, 0(sp)
    ld s0, 8(sp)
    ld s1, 16(sp)
    ld s2, 24(sp)
    addi sp, sp, 32
    ret

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
