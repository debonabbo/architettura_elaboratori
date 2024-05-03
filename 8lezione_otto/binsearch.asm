.globl _start
.data
    needle: .word 2
    size:   .word 8
    array:  .word 1,2,3,7,9,10,11,15
.text
_start:
    # chiama binsearch
    la   a0, array
    li   a1, 0
    la   a2, size
    lw   a2, 0(a2)
    addi a2, a2, -1
    la   a3, needle
    lw   a3, 0(a3)
    jal  ra, binsearch
    
    #exit
    li   a7, 10
    ecall

# int binsearch(int array[], int start, int end, int needle) {
##    if (end < start) {
#         return -1;
#     } 

#     int middle = (start + end) / 2;
##    if (needle == array[middle]) {
#         return middle;
#     } else if (needle < array[middle]) {
#         return binsearch(array, start, middle - 1, needle);
#     } else {
#         return binsearch(array, middle + 1, end, needle);
#     }
# }

#***************************************************
# completare la funzione binsearch nel campo di sotto
binsearch:
    bge a2, a1, else
        li a0, -1
        ret
    else:
        # preservo ra
        addi sp, sp, -8
        sd ra, 0(sp)

        # calcolo middle
        add t0, a1, a2      # middle = start + end  
        srli t0, t0, 1      # middle /= 2

        # trovo array[middle]
        addi t1, t0, 0      # offset = middle
        addi t2, zero, 4    
        mul t1, t1, t2      # offset *= 4
        add t1, t1, a0      # offset += &array
        lw t1, 0(t1)        # t1 = array[middle]
        
        beq a3, t1, return_middle # if(needle == array[middle]) -> return_middle
        bgt t1, a3, return_bins1  # if(needle < array[middle]) -> return_bins1
            # return bins2
            addi a1, t0, 1      # start = middle + 1
            jal ra, binsearch   # chiamo binsearch
        j end_return            # fine
        return_bins1:
            addi a2, t0, -1     # end = middle - 1
            jal ra, binsearch   # chiamo binsearch
        j end_return            # fine
        return_middle:
            addi a0, t0, 0      # return middle
        end_return:             # fine

        # ripristino ra
        ld ra, 0(sp)
        addi sp, sp, 8
    ret