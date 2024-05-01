.globl _start
.data
    buffer: .string  "test string"
    low:    .byte  'A'
    high:   .byte  'Z'

.text
_start:
    # call contains
    la   a0, buffer
    la   a1, low
    la   a2, high
    lbu  a1, 0(a1)
    lbu  a2, 0(a2)
    jal  ra, contains

    # exit
    li   a0, 10
    ecall

#******************************************
# completare la funzione nel campo di sotto
contains:
    lb t0, 0(a0)
    addi a0, a0, 1
    beq t0, zero, notfound
    blt t0, a1, contains
    blt a2, t0, contains
    # Elemento valido
    addi a0, zero, 1
    ret
    notfound:
        addi a0, zero, 0
        ret

