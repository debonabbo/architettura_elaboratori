.globl _start

.text

_start:

    #<assembler code here>


exit:
    addi x17, x0, 10  # call number 10 = exit / il valore 10 equivale a EXIT
    ecall
