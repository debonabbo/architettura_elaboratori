.globl _start

.data 
	size: .word 3
    array: .word 1, 2, 3
    result: .word 0
.text

_start:
    la t0, size
	lw t0,0(t0)
	la t2, array # p = array pointer
	li t1,0 # i = 0
	li t6,0 # res = 0
loop:
	lw t3,0(t2) # load value in p
	add t6,t6,t3 # res += elem
	addi t1,t1,1 # i++
	addi t2,t2,4 # p++
	ble  t1,t0,loop
	la t3, result
	addi t6,t6,1 #wtf perché mi serve questa?
	sw t6,0(t3)

    stampa:
    #stampo t1
    addi a0, zero, 1
    addi a1, t6, 0
    ecall

exit:
    # addi x17, x0, 10  # call number 10 = exit
    addi a0, x0, 10  # call number 10 = exit
    ecall