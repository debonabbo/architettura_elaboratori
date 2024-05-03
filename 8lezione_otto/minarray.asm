.globl _start

.data
    size:  .word  10
    array: .word  3,1,6,6,23,17,9,25,3,4
.text

_start:
    # chiama minarray
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, minarray
    
    #exit
    li   a7, 10
    ecall   

#****************************************************
# completare la funzione minarray nel campo di sotto
minarray:
    addi t0, a0, 0          # t0 = &array      
    lw   t1, 0(a0)          # t1 = min
    addi t2, a0, 0          # t2 = &min
    
    while:
    addi a0, a0, 4          # array++
    addi a1, a1, -1         # size--
    bge zero, a1, endwhile  # while(size>0)
        lw t3, 0(a0)        # leggo il valore
        bge t3, t1, endif   # if t3 < t1
            addi t1, t3, 0  # t1 = min = valore
            addi t2, a0, 0  # t2 = &min
        endif:
    j while
    endwhile:

    sub a0, t2, t0  # a0 = &min - &array
    srli a0, a0, 2  # a0 /= 4
    ret