.globl _start
.data
    num: .word 10
.text
_start:
    # call serief
    la    a0, num
    lw    a0, 0(a0)
    jal   ra, serief

    #exit
    li    a0, 10
    ecall

# f(1) = 1
# f(2) = 1
# f(3) = 1
# f(x) = f(x-1) + f(x-2) + f(x-3), per x > 3

#****************************************************
# completare la funzione serief nel campo di sotto
serief:
    li t0, 3
    bgt a0, t0, else
        li a0, 1
        ret
    else:
        # preservo ra e i registri che utilizzero'
        addi sp, sp, -24
        sd ra, 0(sp)
        sd s0, 8(sp)
        sd s1, 16(sp)

        addi a0, a0, -1     # calcolo x-1
        addi s0, a0, 0      # lo salvo in s0
        jal ra, serief      # chiamo serief su x-1
        
        addi s1, a0, 0      # salvo il risultato di serief su s1
        addi a0, s0, -1     # calcolo x-2
        addi s0, a0, 0      # lo salvo in s0
        jal ra, serief      # chiamo serief su x-2
        
        add s1, s1, a0      # aggiungo il risultato di serief a s1
        addi a0, s0, -1     # calcolo x-3
        addi s0, a0, 0      # lo salvo in s0
        jal ra, serief      # chiamo serief su x-3
        
        add a0, a0, s1      # aggiungo s1 al risultato di serief

        # ripristino ra e i registri utilizzati
        ld ra, 0(sp)        
        ld s0, 8(sp)
        ld s1, 16(sp)
        addi sp, sp, 24
    ret