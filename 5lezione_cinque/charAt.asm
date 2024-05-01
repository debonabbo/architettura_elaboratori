.globl _start
.data
    stringa: .string "Ciao :)"
    n: .word 3
.text

_start:
    la a0, stringa
    la a1, n
    lw a1, 0(a1)
    
    jal ra, charAt

charAt: 
    add a0, a0, a1
    lbu a0, 0(a0)
    ret

exit:
    addi x17, x0, 10  # call number 10 = exit / il valore 10 equivale a EXIT
    ecall
