.globl _start

.text

_start:	
    # Metto i due numeri in x5 e x6
    li x5, 0x8000000000000000
    li x6, 0xD000000000000000

    # Sommo x5 con x6 e metto il risultato in x30
    add x30, x5, x6

    # Sottraggo x6 da x5 e metto il risultato in x30
    sub x30, x5, x6

    # Sommo x5 e x6 e metto il risultato in x30, poi ci aggiungo ancora x5
    add x30, x5, x6
    add x30, x30, x5

exit:
    addi x17, x0, 10  # call number 10 = exit / il valore 10 equivale a EXIT
    ecall
