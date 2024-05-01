.globl _start
.data
      buffer: .string  "BADPass4"
.text
_start:
    # call passrules
    la   a0, buffer
    jal  ra, passrules

    #exit
    li   a0, 10
    ecall

#****************************************************
# completare la funzione passrules nel campo di sotto
passrules:
    addi sp, sp, -16
    sd ra, 0(sp)    # salvo il ra
    sd s0, 8(sp)    # salvo il registro s0

    addi s0, a0, 0  # salvo l'indirizzo dell'array in s0

    # controllo se contiene lettere maiuscole
    addi a1, zero, 'A'
    addi a2, zero, 'Z'
    jal ra, contains
    beq zero, a0, end   # se non contiene le lettere, salto alla fine
    # controllo se contiene numeri
    addi a0, s0, 0
    addi a1, zero, '0'
    addi a2, zero, '9'
    jal ra, contains

    end:
    ld ra, 0(sp)    # ripristino il ra
    ld s0, 8(sp)    # ripristino il registro s0
    addi sp, sp, 16
    ret


contains:
    lb t0, 0(a0)
    addi a0, a0, 1
    beq t0, zero, notfound
    blt t0, a1, contains
    blt a2, t0, contains
    # Elemento valido
    addi a0, zero, 1
    ret
    notfound:
        addi a0, zero, 0
        ret