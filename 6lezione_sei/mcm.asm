.globl _start
.data
    num1: .word 5
    num2: .word 6
.text
_start:
    la    a0, num1
    la    a1, num2
    lw    a0, 0(a0)
    lw    a1, 0(a1)     
    jal   ra, mcm

    #exit
    li    a0, 10
    ecall

#****************************************************
mcm:
    addi sp, sp, -16
    sd ra, 8(sp)
    sd s1, 0(sp)

    mul s1, a0, a1
    jal ra, MCD
    div a0, s1, a0

    ld ra, 8(sp)
    ld s1, 0(sp)
    addi sp, sp, 16
    ret
MCD:
	# MCD code
    beq a0, a1, endloop
    ble a1, a0, else
        sub a1, a1, a0
        j MCD
    else:
        sub a0, a0, a1
        j MCD
    endloop:
    ret
