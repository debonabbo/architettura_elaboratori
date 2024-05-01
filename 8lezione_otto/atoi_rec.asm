.globl _start

.data
    numstr: .string "123"
.text

_start:
    # chiama strlen per ottenere la lunghezza della stringa 
    la a0, numstr 
    jal ra, strlen

    # chiama atoi 
    mv a1, a0 
    la a0, numstr
    jal ra, atoi
exit:
    # addi x17, x0, 10  # call number 10 = exit
    addi a0, x0, 10  # call number 10 = exit
    ecall

atoi:
    # a0 = numstr, a1 = size(numstr)
    bge a1, zero, else
        addi a0, zero, 0
        ret
    else:

    addi a1, a1, -1 # size = size - 1
    add t0, a0, a1  # t0 = &numstr + size
    lbu s1, 0(t0)   # s1 = *t0 = numstr[size]
    addi s1, s1, -'0'   # converto il carattere in numero
    jal atoi    # calcolo atoi(n-1)

    li t0, 10
    mul t0, t0, a0  # t0 = atoi(n-1) * 10
    add a0, s1, t0  # a0 = valore di numstr[size] sommato a t0
    



    ret

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