# sum three numbers loaded in x5, x6, x7 and put the result in x28
.globl _start

.text
_start:
    # Carico tre numeri in x5, x6 e x7
    addi x5, x0, 3
    addi x6, x0, 4
    addi x7, x0, 5

    # Sommo i numeri in x28
    add x28, x5, x6
    add x28, x28, x7

exit:
    addi x17, x0, 10  # call number 10 = exit in a7 (x17)
    ecall
