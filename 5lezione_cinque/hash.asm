.globl _start
.data
    str: .string "Ciao pinguino!"
.text

_start:
    la  a0, str
    jal ra, hash

    li a7, 10
    ecall

# long hash(char *str) {
#     long hash = 5381;
#     int i = 0;

#     while (str[i] != '\0') {
#         hash = ((hash << 5) + hash) + str[i];
#         i++;
#     }
#     return hash;
# }

hash:
    li t1, 5381

    while:
    lbu t0, 0(a0)
    beq t0, zero, endwhile
        slli t2, t1, 5
        add t1, t1, t2
        add t1, t1, t0

        addi a0, a0, 1
    beq zero, zero, while
    endwhile:

    add a0, t1, zero
    ret