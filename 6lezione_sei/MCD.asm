.globl _start
.data
    num1: .word 24
    num2: .word 30
.text
_start:
    # Main code
	la a0, num1
    lw a0, 0(a0)
    la a1, num2
    lw a1, 0(a1)

    jal ra, MCD

    #exit
    li    a0, 10
    ecall
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
