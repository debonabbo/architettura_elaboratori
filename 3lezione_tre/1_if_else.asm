.globl _start

.data 
	x: .word 1
    y: .word 2
.text

_start:
    la t3, x
    lw t0, 0(t3)
    lw t1, 4(t3)

    #Frammento uno              
    sub t0, t0, t1              #sottraggo t1 a t0
    bge t0, x0, ENDIF_uno       #se t0 >= 0 salto a ENDIF_uno
        li t0, 0x0              # t0 = 0
    ENDIF_uno: 
    addi t1, t1, -1             # t1 += -1

    #Frammento due
    addi t0, t0, -2             #sottraggo 2 a t0
    add t0, t0, t1              #t0 += t1
    bge t0, t1, ELSE            #se t0 > t1 salto a ELSE
        addi t0, t0, 1          # t0 += 1
        beq x0, x0, ENDIF_due   #salto a ENDIF_due
    ELSE: 
        addi t1, t1, 1          # t1 += 1
    ENDIF_due:


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
