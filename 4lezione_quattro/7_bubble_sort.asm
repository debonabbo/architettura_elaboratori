.globl _start
.data
    size:   .word  8                 # size of the array        
    array:  .dword 8,7,6,5,4,3,2,1    # array of long integers

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
            ld t3, 0(t2)
            ld t4, 8(t2)
            bge t4, t3, endif
                sd t4, 0(t2)
                sd t3, 8(t2)
                addi t0, zero, 1
            endif:
            addi t2, t2, 8
            addi t1, t1, -1
            beq zero, zero, for
        endfor:
        beq zero, zero, while
    endwhile:
    
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall