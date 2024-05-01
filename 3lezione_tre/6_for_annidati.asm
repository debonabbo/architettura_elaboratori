.globl _start

.data 
	# variables here 
.text

_start:
    li t0, 2    # a
    li t1, 3    # b
    li t2, 5    # R

    li t3, 0    # i                 # t3 = i = 0
    while_i:
    bge t3, t0, endwhile_i          #if(i >= a) vai a endwhile_i
        li t4, 0    # j                 # t4 = j = 0
        while_j:
        bge t4, t1, endwhile_j      #if(j >= b) vai a endwhile_j
            slli t2, t2, 1              # t2 *= 2  ovvero R *= 2
            add t2, t2, t3              # t2 += t3 ovvero R += i
            add t2, t2, t4              # t2 += t4 ovvero R += j
            addi t4, t4, 1              # t4 += 1  ovvero j++
            beq zero, zero, while_j     # torna a while_j
        endwhile_j:
        addi t3, t3, 1              # t3 += 1 ovvero i++
        beq zero, zero, while_i     # torna a while_i
    endwhile_i:


exit:
    addi a0, x0, 10  # call number 10 = exit
    ecall
