.globl _start
.data
    carattere: .byte '1'
.text

isdigit: 
    addi t0, a0, 0
    addi t1, zero, '/'  #Carattere prima di 0
    addi t2, zero, ':'  #Carattere dopo 9

    addi a0, zero, 0
    bge t0, t2, fine
    ble t0, t1, fine
    addi a0, zero, 1

    fine:
    ret

_start:
    la a0, carattere
    lb a0, 0(a0)
    
    jal ra, isdigit

exit:
    addi x17, x0, 10  # call number 10 = exit / il valore 10 equivale a EXIT
    ecall
