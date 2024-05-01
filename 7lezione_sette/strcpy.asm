.globl _start

.data
    src: .string "source"
    dst: .string "------------"

.text
_start:
    la a0, src
    la a1, dst
    jal ra, strcpy

    la a0, dst
    jal ra, strlen
    li a0, 1
    ecall

# lunghezza della stringa puntata da a0.
# return su a0
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

# Questa funzione e' molto lunga perche' "tradotta" dall'algoritmo in c
strcpy:
    addi sp, sp, -48
    sd s0, 0(sp) #i
    sd s1, 8(sp) #n
    sd s2, 16(sp) #m

    sd s3, 24(sp) #src
    sd s4, 32(sp) #dest
    sd ra, 40(sp) #ra

    addi s3, a0, 0  
    addi s4, a1, 0

    jal ra, strlen
    addi s1, a0, 0  # n = strlen(src)
    addi a0, s4, 0  # a0 = &dest
    jal ra, strlen
    addi s2, a0, 0  # m = strlen(dest)
    
    addi s0, zero, 0 # i = 0

    while_strcpy:
    bge s0, s2, endwhile_strcpy
        bge s0, s1, zeri # se i >= n ho finito i caratteri da copiare
        # devo copiare il carattere
        lb t0, 0(s3)
        sb t0, 0(s4)
        j endzeri   # salto a endzeri
        zeri:
        # ho finito i caratteri
        # devo scrivere \0
        sb zero, 0(s4)
        endzeri:
        addi s3, s3, 1 # src++
        addi s4, s4, 1 # dest++
        addi s0, s0, 1 # i++
        j while_strcpy
    endwhile_strcpy:
    
    ld s0, 0(sp) #i
    ld s1, 8(sp) #n
    ld s2, 16(sp) #m
    ld s3, 24(sp) #src
    ld s4, 32(sp) #dest
    ld ra, 40(sp) #ra
    addi sp, sp, 48
    ret