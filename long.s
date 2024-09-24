	.text
	.align 2
	.global _main
	.extern _putchar, _getchar, _malloc, _free, _memset
_main:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	stp x19, x20, [sp, #-16]!
	mov x0, #30000
	bl _malloc
	mov x19, x0
	mov x20, x0
	mov x1, x19
	eor w2, w2, w2
	mov x3, #30000
	bl _memset
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #2
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_0:
    ldrb w1, [x19]
    cbz w1, loop_end_0
    add x19, x19, #1
    loop_start_1:
    ldrb w1, [x19]
    cbz w1, loop_end_1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #3
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #6
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #2
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_2:
    ldrb w1, [x19]
    cbz w1, loop_end_2
    add x19, x19, #1
    loop_start_3:
    ldrb w1, [x19]
    cbz w1, loop_end_3
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #3
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #6
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #2
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_4:
    ldrb w1, [x19]
    cbz w1, loop_end_4
    add x19, x19, #1
    loop_start_5:
    ldrb w1, [x19]
    cbz w1, loop_end_5
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #3
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #6
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #2
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_6:
    ldrb w1, [x19]
    cbz w1, loop_end_6
    add x19, x19, #1
    loop_start_7:
    ldrb w1, [x19]
    cbz w1, loop_end_7
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #3
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #5
    ldrb w1, [x19]
    add w1, w1, #3
    strb w1, [x19]
    loop_start_8:
    ldrb w1, [x19]
    cbz w1, loop_end_8
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #5
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_8
    loop_end_8:
    add x19, x19, #1
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    sub x19, x19, #6
    ldrb w1, [x19]
    cbnz w1, loop_start_7
    loop_end_7:
    sub x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_6
    loop_end_6:
    add x19, x19, #1
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    sub x19, x19, #5
    ldrb w1, [x19]
    cbnz w1, loop_start_5
    loop_end_5:
    sub x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_4
    loop_end_4:
    add x19, x19, #1
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    sub x19, x19, #5
    ldrb w1, [x19]
    cbnz w1, loop_start_3
    loop_end_3:
    sub x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_2
    loop_end_2:
    add x19, x19, #1
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    sub x19, x19, #5
    ldrb w1, [x19]
    cbnz w1, loop_start_1
    loop_end_1:
    sub x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_0
    loop_end_0:
    add x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
mov x0, x20
bl _free
ldp x19, x20, [sp], #16
ldp x29, x30, [sp], #16
ret
eor w0, w0, w0
ret
