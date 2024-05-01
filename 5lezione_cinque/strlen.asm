.globl _start
.data
    stringa: .string "Ciao :)"  #lunga 7
.text
_start:
    la a0, stringa
    
    jal ra, strlen
exit:
    addi x17, x0, 10  # call number 10 = exit / il valore 10 equivale a EXIT
    ecall

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

