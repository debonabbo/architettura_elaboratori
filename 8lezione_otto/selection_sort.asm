.globl _start
.data
    size:  .word  10
    array: .word  3,1,6,6,23,17,9,25,3,4

.text
_start:
    # chiama selection_sort
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, selection_sort
    
    #exit
    li   a7, 10
    ecall   

# void selection_sort(int array[], int size) {
##    if (size <= 1) 
#         return;
    
#     int min_idx = minarray(array, size);
#     swap(array, 0, min_idx);
#     selection_sort(array+1, size-1);
# }  

#****************************************************
# completare la funzione selection_sort nel campo di sotto
selection_sort:
    li t0, 1
    bgt a1, t0, else
        ret
    else:
        # preservo i registri che usero'
        addi sp, sp, -24
        sd ra, 0(sp)
        sd s0, 8(sp)
        sd s1, 16(sp)

        addi s0, a0, 0          # salvo &array in s0
        addi s1, a1, 0          # salvo size(array) in s1
        jal ra, minarray        # chiamo minarray su &array, size(array)

        addi a2, a0, 0          # metto il risultato di minarray in a2
        addi a1, zero, 0        # metto 0 in a1
        addi a0, s0, 0          # ripristino &array in a0
        jal ra, swap            # chiamo swap su &array, 0, res_minarray

        addi a0, s0, 0          # ripristino &array in a0
        addi a1, s1, 0          # ripristino size(array) in a1
        addi a0, a0, 4          # array++
        addi a1, a1, -1         # size--
        jal ra, selection_sort  # chiamo selection_sort su &array, size(array)

        # ripristino i registri utilizzati
        ld ra, 0(sp)
        ld s0, 8(sp)
        ld s1, 16(sp)
        addi sp, sp, 24
    ret

swap:
    #Calcolo gli indirizzi dei due valori
    addi t0, zero, 4
    mul a1, a1, t0
    mul a2, a2, t0
    add a1, a1, a0
    add a2, a2, a0
    #Carico i valori
    lw t0, 0(a1)
    lw t1, 0(a2)
    #Salvo i valori
    sw t1, 0(a1)
    sw t0, 0(a2)
    
    ret

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