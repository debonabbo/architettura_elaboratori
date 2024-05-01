.globl _start

.data 
	size: .word 5
    array: .word 1, 3, 4, 5, 6
    result: .word 0
.text

# size = 5;   # t0
# somma = 0;  # t1
# array = # t2

# while(size >= 0){
#     elemento = *array;
#     somma = somma + elemento;
#     size = size - 1;
#     array = array + 4;
# }

_start:
    # dichiarazioni delle variabili
    la t0, size
    lw t0, 0(t0)
    addi t1, zero, 0
    la t2, array

    # while loop
    while:
    bge zero, t0, endwhile
        lw t3, 0(t2)
        add t1, t1, t3
        addi t0, t0, -1
        addi t2, t2, 4
        beq zero, zero, while
    endwhile:

    #somma (t1) contiene la somma degli elementi
    la t0, result
    sw t1, 0(t0)

    stampa:
    #stampo t1
    addi a0, zero, 1
    addi a1, t1, 0
    ecall

exit:
    # addi x17, x0, 10  # call number 10 = exit
    addi a0, x0, 10  # call number 10 = exit
    ecall
