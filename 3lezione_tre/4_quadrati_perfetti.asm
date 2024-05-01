.globl _start

.data 
	N: .word 10
    res: .word 0
.text

# IMPLEMENTAZIONE in C
# N = 4;
# res = 0;
# while(N > 0){
#     quadrato = 0;
#     quadrato = N*N;
#     res += quadrato;
#     N--;
# }

_start:
    la t0, N        
    lw t0, 0(t0)    # t0 = N
    li t1, 0        # t1 = res

    while:
    bge zero, t0, endwhile
        mul t2, t0, t0
        add t1, t1, t2
        addi t0, t0, -1
        beq zero, zero, while
    endwhile:

    # t1 contiene il risultato
    la t3, res      #leggo l'indirizzo di res (t3 = &res)
    sw t1, 0(t3)    #salvo t1 in res (*t3 = t1)

    #stampo res
    addi a1, t1, 0
    addi a0, zero, 1
    ecall

exit:
    addi a0, x0, 10  # call number 10 = exit
    ecall
