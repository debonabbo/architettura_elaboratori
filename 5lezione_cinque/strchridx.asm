.globl _start
.data
    str:  .string "my long string"
    c:    .byte 'g'
.text
_start:
    # call strchridx
    la   a0, str
    la   a1, c
    lb   a1, 0(a1)
    jal  ra, strchridx

    #exit
    li   a7, 10
    ecall

# VERSIONE ISPIRATA AL PROF
strchridx:
    add t0, a0, zero

    while:
    lbu t1, 0(t0)
    beq t1, a1, endwhile
    addi t0, t0, 1

    bne t1, zero, while
    addi a0, zero, -1
    ret
    endwhile:

    sub a0, t0, a0
    ret

# PRIMA VERSIONE
# strchridx:
#     add t0, a0, zero

#     while:
#     lbu t1, 0(t0)
#     beq t1, a1, endwhile
#     beq t1, zero, notfound
#     addi t0, t0, 1
#     beq zero, zero, while
#     endwhile:

#     sub a0, t0, a0
#     beq zero, zero, fine
#     notfound:
#     addi a0, zero, -1

#     fine:
#     ret
