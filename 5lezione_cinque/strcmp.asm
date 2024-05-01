.globl _start
.data
    str1: .string  "first."
    str2: .string  "second."
.text
_start:
    # call strcmp
    la   a0, str1
    la   a1, str2
    jal  ra, strcmp

    #exit
    li   a0, 10
    ecall

strcmp:
    addi t2, zero, 1
    while:
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    bne t0, t1, endwhile
        beq t0, zero, uguali

        addi a0, a0, 1
        addi a1, a1, 1
    beq zero, zero, while
    endwhile:
    
    beq zero, zero, fine

    uguali:
    add t2, zero, zero

    fine:
    add a0, t2, zero
    ret

strmcp2:
    lbu t1, 0(a0)
    lbu t2, 0(a1)

    bne t1, t2, strcmp_end
    bne t1, zero, strcmp_conta
    add a0, zero, zero
    ret

    strcmp_conta:
    addi a0, a0, 1
    addi a1, a1, 1
    j strmcp2

    strcmp_end:
    addi a0, zero, 1
    ret