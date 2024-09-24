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
    ldrb w1, [x19]
    add w1, w1, #5
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_0:
    ldrb w1, [x19]
    cbz w1, loop_end_0
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    loop_start_1:
    ldrb w1, [x19]
    cbz w1, loop_end_1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_1
    loop_end_1:
    add x19, x19, #2
    loop_start_2:
    ldrb w1, [x19]
    cbz w1, loop_end_2
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_2
    loop_end_2:
    sub x19, x19, #1
    loop_start_3:
    ldrb w1, [x19]
    cbz w1, loop_end_3
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_3
    loop_end_3:
    sub x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_0
    loop_end_0:
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    add x19, x19, #1
    loop_start_4:
    ldrb w1, [x19]
    cbz w1, loop_end_4
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_4
    loop_end_4:
    sub x19, x19, #1
    loop_start_5:
    ldrb w1, [x19]
    cbz w1, loop_end_5
    loop_start_6:
    ldrb w1, [x19]
    cbz w1, loop_end_6
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_6
    loop_end_6:
    add x19, x19, #2
    loop_start_7:
    ldrb w1, [x19]
    cbz w1, loop_end_7
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_7
    loop_end_7:
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_8:
    ldrb w1, [x19]
    cbz w1, loop_end_8
    add x19, x19, #4
    loop_start_9:
    ldrb w1, [x19]
    cbz w1, loop_end_9
    add x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_9
    loop_end_9:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_10:
    ldrb w1, [x19]
    cbz w1, loop_end_10
    sub x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_10
    loop_end_10:
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_8
    loop_end_8:
    add x19, x19, #4
    loop_start_11:
    ldrb w1, [x19]
    cbz w1, loop_end_11
    add x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_11
    loop_end_11:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_12:
    ldrb w1, [x19]
    cbz w1, loop_end_12
    sub x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_12
    loop_end_12:
    sub x19, x19, #2
    loop_start_13:
    ldrb w1, [x19]
    cbz w1, loop_end_13
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #2
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_13
    loop_end_13:
    add x19, x19, #2
    loop_start_14:
    ldrb w1, [x19]
    cbz w1, loop_end_14
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_14
    loop_end_14:
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_15:
    ldrb w1, [x19]
    cbz w1, loop_end_15
    add x19, x19, #4
    loop_start_16:
    ldrb w1, [x19]
    cbz w1, loop_end_16
    add x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_16
    loop_end_16:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_17:
    ldrb w1, [x19]
    cbz w1, loop_end_17
    sub x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_17
    loop_end_17:
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_15
    loop_end_15:
    sub x19, x19, #1
    loop_start_18:
    ldrb w1, [x19]
    cbz w1, loop_end_18
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_18
    loop_end_18:
    add x19, x19, #1
    loop_start_19:
    ldrb w1, [x19]
    cbz w1, loop_end_19
    add x19, x19, #4
    loop_start_20:
    ldrb w1, [x19]
    cbz w1, loop_end_20
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #32
    strb w1, [x19]
    add x19, x19, #1
    loop_start_21:
    ldrb w1, [x19]
    cbz w1, loop_end_21
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #3
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_21
    loop_end_21:
    sub x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_22:
    ldrb w1, [x19]
    cbz w1, loop_end_22
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_22
    loop_end_22:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_20
    loop_end_20:
    ldrb w1, [x19]
    add w1, w1, #10
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    sub x19, x19, #3
    loop_start_23:
    ldrb w1, [x19]
    cbz w1, loop_end_23
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    loop_start_24:
    ldrb w1, [x19]
    cbz w1, loop_end_24
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #2
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #2
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #4
    ldrb w1, [x19]
    cbnz w1, loop_start_24
    loop_end_24:
    add x19, x19, #2
    loop_start_25:
    ldrb w1, [x19]
    cbz w1, loop_end_25
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #2
    ldrb w1, [x19]
    cbnz w1, loop_start_25
    loop_end_25:
    add x19, x19, #4
    loop_start_26:
    ldrb w1, [x19]
    cbz w1, loop_end_26
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #2
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #4
    ldrb w1, [x19]
    cbnz w1, loop_start_26
    loop_end_26:
    sub x19, x19, #4
    loop_start_27:
    ldrb w1, [x19]
    cbz w1, loop_end_27
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #4
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #4
    ldrb w1, [x19]
    cbnz w1, loop_start_27
    loop_end_27:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_23
    loop_end_23:
    add x19, x19, #3
    loop_start_28:
    ldrb w1, [x19]
    cbz w1, loop_end_28
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_29:
    ldrb w1, [x19]
    cbz w1, loop_end_29
    ldrb w1, [x19]
    add w1, w1, #2
    strb w1, [x19]
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_29
    loop_end_29:
    sub x19, x19, #1
    loop_start_30:
    ldrb w1, [x19]
    cbz w1, loop_end_30
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_30
    loop_end_30:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_28
    loop_end_28:
    sub x19, x19, #3
    loop_start_31:
    ldrb w1, [x19]
    cbz w1, loop_end_31
    sub x19, x19, #3
    ldrb w1, [x19]
    cbnz w1, loop_start_31
    loop_end_31:
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_19
    loop_end_19:
    ldrb w1, [x19]
    eor w1, w1, w1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_5
    loop_end_5:
mov x0, x20
bl _free
ldp x19, x20, [sp], #16
ldp x29, x30, [sp], #16
ret
eor w0, w0, w0
ret
