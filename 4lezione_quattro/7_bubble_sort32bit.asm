.globl _start
.data
    size:   .word  6                 # size of the array        
    array:  .word 6,5,4,3,2,1    # array of long integers

.text
_start:
    addi t0, zero, 1

    while:
    beq t0, zero, endwhile
        la t1, size
        lw t1, 0(t1)
        addi t1, t1, -1 #size
        
        addi t0, zero, 0
        la t2, array

        # t1 = i
        # t2 = array
        # t3 = *array
        # t4 = *array+1
        for:
        bge zero, t1, endfor
            lw t3, 0(t2)
            lw t4, 4(t2)
            bge t4, t3, endif
                sw t4, 0(t2)
                sw t3, 4(t2)
                addi t0, zero, 1
            endif:
            addi t2, t2, 4
            addi t1, t1, -1
            beq zero, zero, for
        endfor:
        beq zero, zero, while
    endwhile:
    
    #stampa
    addi a0, zero, 1
    la t2, array

    lw a1, 0(t2)
    ecall
    
    lw a1, 4(t2)
    ecall
    
    lw a1, 8(t2)
    ecall
    
    lw a1, 12(t2)
    ecall
    
    lw a1, 16(t2)
    ecall
    
    lw a1, 20(t2)
    ecall

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall