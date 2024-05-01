.globl _start

.data 
	# variables here 
.text

_start:
    li t0, 8    #variabile N
    li t1, 1    #variabile R
    li t2, 0    #variabile A
    li t3, 1    #variabile B

    while: 
    bge zero, t0, fine_while    #if(0 >= N) salta a fine_while 
        add t1, t2, t3          #t1 = t2 + t3
        addi t2, t3, 0          #t2 = t3
        addi t3, t1, 0          #t3 = t1
        addi t0, t0, -1         # t0-- ovvero N--
        beq zero, zero, while   #torna all'inizio del while
    fine_while:

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
