.globl _start

.text
_start:
    li x5, 0x0000000000000000
    # li x5, 0xFFF0FFFF
    li x6, 0xFFFFFFFF

    addi x29, x0, 12

    and x7, x5, x29
    sub x5, x5, x7

    slli x29, x29, 4
    sub x6, x6, x29

    slli x7, x7, 4
    or x6, x6, x7
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
