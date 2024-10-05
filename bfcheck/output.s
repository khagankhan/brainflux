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
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_0:
    ldrb w1, [x19]
    cbz w1, loop_end_0
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_0
    loop_end_0:
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
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
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_1:
    ldrb w1, [x19]
    cbz w1, loop_end_1
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_1
    loop_end_1:
    add x19, x19, #1
    add x19, x19, #1
    bl _getchar
    strb w0, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_2:
    ldrb w1, [x19]
    cbz w1, loop_end_2
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_2
    loop_end_2:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_3:
    ldrb w1, [x19]
    cbz w1, loop_end_3
    loop_start_4:
    ldrb w1, [x19]
    cbz w1, loop_end_4
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_4
    loop_end_4:
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_3
    loop_end_3:
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_5:
    ldrb w1, [x19]
    cbz w1, loop_end_5
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_5
    loop_end_5:
    loop_start_6:
    ldrb w1, [x19]
    cbz w1, loop_end_6
    ldrb w1, [x19]
    cbnz w1, loop_start_6
    loop_end_6:
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    bl _getchar
    strb w0, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_7:
    ldrb w1, [x19]
    cbz w1, loop_end_7
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_7
    loop_end_7:
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_8:
    ldrb w1, [x19]
    cbz w1, loop_end_8
    sub x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    loop_start_9:
    ldrb w1, [x19]
    cbz w1, loop_end_9
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_10:
    ldrb w1, [x19]
    cbz w1, loop_end_10
    loop_start_11:
    ldrb w1, [x19]
    cbz w1, loop_end_11
    sub x19, x19, #1
    loop_start_12:
    ldrb w1, [x19]
    cbz w1, loop_end_12
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_12
    loop_end_12:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_11
    loop_end_11:
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_10
    loop_end_10:
    ldrb w1, [x19]
    cbnz w1, loop_start_9
    loop_end_9:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_13:
    ldrb w1, [x19]
    cbz w1, loop_end_13
    add x19, x19, #1
    sub x19, x19, #1
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_14:
    ldrb w1, [x19]
    cbz w1, loop_end_14
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_15:
    ldrb w1, [x19]
    cbz w1, loop_end_15
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_16:
    ldrb w1, [x19]
    cbz w1, loop_end_16
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_17:
    ldrb w1, [x19]
    cbz w1, loop_end_17
    ldrb w1, [x19]
    cbnz w1, loop_start_17
    loop_end_17:
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_18:
    ldrb w1, [x19]
    cbz w1, loop_end_18
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_19:
    ldrb w1, [x19]
    cbz w1, loop_end_19
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_20:
    ldrb w1, [x19]
    cbz w1, loop_end_20
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    loop_start_21:
    ldrb w1, [x19]
    cbz w1, loop_end_21
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_22:
    ldrb w1, [x19]
    cbz w1, loop_end_22
    add x19, x19, #1
    loop_start_23:
    ldrb w1, [x19]
    cbz w1, loop_end_23
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_23
    loop_end_23:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_22
    loop_end_22:
    loop_start_24:
    ldrb w1, [x19]
    cbz w1, loop_end_24
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_25:
    ldrb w1, [x19]
    cbz w1, loop_end_25
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_26:
    ldrb w1, [x19]
    cbz w1, loop_end_26
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_27:
    ldrb w1, [x19]
    cbz w1, loop_end_27
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_28:
    ldrb w1, [x19]
    cbz w1, loop_end_28
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_29:
    ldrb w1, [x19]
    cbz w1, loop_end_29
    loop_start_30:
    ldrb w1, [x19]
    cbz w1, loop_end_30
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_30
    loop_end_30:
    loop_start_31:
    ldrb w1, [x19]
    cbz w1, loop_end_31
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    loop_start_32:
    ldrb w1, [x19]
    cbz w1, loop_end_32
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_32
    loop_end_32:
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_33:
    ldrb w1, [x19]
    cbz w1, loop_end_33
    ldrb w1, [x19]
    cbnz w1, loop_start_33
    loop_end_33:
    loop_start_34:
    ldrb w1, [x19]
    cbz w1, loop_end_34
    sub x19, x19, #1
    loop_start_35:
    ldrb w1, [x19]
    cbz w1, loop_end_35
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_36:
    ldrb w1, [x19]
    cbz w1, loop_end_36
    loop_start_37:
    ldrb w1, [x19]
    cbz w1, loop_end_37
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_37
    loop_end_37:
    ldrb w0, [x19]
    bl _putchar
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_36
    loop_end_36:
    ldrb w0, [x19]
    bl _putchar
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_35
    loop_end_35:
    loop_start_38:
    ldrb w1, [x19]
    cbz w1, loop_end_38
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_39:
    ldrb w1, [x19]
    cbz w1, loop_end_39
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_39
    loop_end_39:
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_38
    loop_end_38:
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_34
    loop_end_34:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    loop_start_40:
    ldrb w1, [x19]
    cbz w1, loop_end_40
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_40
    loop_end_40:
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_31
    loop_end_31:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_29
    loop_end_29:
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_28
    loop_end_28:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_41:
    ldrb w1, [x19]
    cbz w1, loop_end_41
    ldrb w1, [x19]
    cbnz w1, loop_start_41
    loop_end_41:
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    loop_start_42:
    ldrb w1, [x19]
    cbz w1, loop_end_42
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_43:
    ldrb w1, [x19]
    cbz w1, loop_end_43
    loop_start_44:
    ldrb w1, [x19]
    cbz w1, loop_end_44
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_44
    loop_end_44:
    ldrb w1, [x19]
    cbnz w1, loop_start_43
    loop_end_43:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_45:
    ldrb w1, [x19]
    cbz w1, loop_end_45
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
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
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_45
    loop_end_45:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_42
    loop_end_42:
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_46:
    ldrb w1, [x19]
    cbz w1, loop_end_46
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    loop_start_47:
    ldrb w1, [x19]
    cbz w1, loop_end_47
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_48:
    ldrb w1, [x19]
    cbz w1, loop_end_48
    sub x19, x19, #1
    loop_start_49:
    ldrb w1, [x19]
    cbz w1, loop_end_49
    loop_start_50:
    ldrb w1, [x19]
    cbz w1, loop_end_50
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_51:
    ldrb w1, [x19]
    cbz w1, loop_end_51
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_51
    loop_end_51:
    loop_start_52:
    ldrb w1, [x19]
    cbz w1, loop_end_52
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_52
    loop_end_52:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    loop_start_53:
    ldrb w1, [x19]
    cbz w1, loop_end_53
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_53
    loop_end_53:
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_50
    loop_end_50:
    sub x19, x19, #1
    sub x19, x19, #1
    loop_start_54:
    ldrb w1, [x19]
    cbz w1, loop_end_54
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_55:
    ldrb w1, [x19]
    cbz w1, loop_end_55
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_56:
    ldrb w1, [x19]
    cbz w1, loop_end_56
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_56
    loop_end_56:
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_55
    loop_end_55:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_57:
    ldrb w1, [x19]
    cbz w1, loop_end_57
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_57
    loop_end_57:
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_54
    loop_end_54:
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_49
    loop_end_49:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_48
    loop_end_48:
    add x19, x19, #1
    loop_start_58:
    ldrb w1, [x19]
    cbz w1, loop_end_58
    ldrb w1, [x19]
    cbnz w1, loop_start_58
    loop_end_58:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_47
    loop_end_47:
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_59:
    ldrb w1, [x19]
    cbz w1, loop_end_59
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_59
    loop_end_59:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_60:
    ldrb w1, [x19]
    cbz w1, loop_end_60
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    bl _getchar
    strb w0, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_60
    loop_end_60:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_61:
    ldrb w1, [x19]
    cbz w1, loop_end_61
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_61
    loop_end_61:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_62:
    ldrb w1, [x19]
    cbz w1, loop_end_62
    add x19, x19, #1
    add x19, x19, #1
    loop_start_63:
    ldrb w1, [x19]
    cbz w1, loop_end_63
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_63
    loop_end_63:
    ldrb w1, [x19]
    cbnz w1, loop_start_62
    loop_end_62:
    ldrb w1, [x19]
    cbnz w1, loop_start_46
    loop_end_46:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_27
    loop_end_27:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_64:
    ldrb w1, [x19]
    cbz w1, loop_end_64
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_64
    loop_end_64:
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_26
    loop_end_26:
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_25
    loop_end_25:
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_65:
    ldrb w1, [x19]
    cbz w1, loop_end_65
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    bl _getchar
    strb w0, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    add x19, x19, #1
    loop_start_66:
    ldrb w1, [x19]
    cbz w1, loop_end_66
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_67:
    ldrb w1, [x19]
    cbz w1, loop_end_67
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_68:
    ldrb w1, [x19]
    cbz w1, loop_end_68
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    loop_start_69:
    ldrb w1, [x19]
    cbz w1, loop_end_69
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_69
    loop_end_69:
    ldrb w1, [x19]
    cbnz w1, loop_start_68
    loop_end_68:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    loop_start_70:
    ldrb w1, [x19]
    cbz w1, loop_end_70
    ldrb w1, [x19]
    cbnz w1, loop_start_70
    loop_end_70:
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_71:
    ldrb w1, [x19]
    cbz w1, loop_end_71
    loop_start_72:
    ldrb w1, [x19]
    cbz w1, loop_end_72
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_73:
    ldrb w1, [x19]
    cbz w1, loop_end_73
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_74:
    ldrb w1, [x19]
    cbz w1, loop_end_74
    sub x19, x19, #1
    bl _getchar
    strb w0, [x19]
    loop_start_75:
    ldrb w1, [x19]
    cbz w1, loop_end_75
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    loop_start_76:
    ldrb w1, [x19]
    cbz w1, loop_end_76
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_76
    loop_end_76:
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_75
    loop_end_75:
    loop_start_77:
    ldrb w1, [x19]
    cbz w1, loop_end_77
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_77
    loop_end_77:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_74
    loop_end_74:
    loop_start_78:
    ldrb w1, [x19]
    cbz w1, loop_end_78
    loop_start_79:
    ldrb w1, [x19]
    cbz w1, loop_end_79
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_80:
    ldrb w1, [x19]
    cbz w1, loop_end_80
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_80
    loop_end_80:
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    bl _getchar
    strb w0, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    loop_start_81:
    ldrb w1, [x19]
    cbz w1, loop_end_81
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
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
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_81
    loop_end_81:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_82:
    ldrb w1, [x19]
    cbz w1, loop_end_82
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_82
    loop_end_82:
    ldrb w0, [x19]
    bl _putchar
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_79
    loop_end_79:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_78
    loop_end_78:
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_73
    loop_end_73:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_83:
    ldrb w1, [x19]
    cbz w1, loop_end_83
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    loop_start_84:
    ldrb w1, [x19]
    cbz w1, loop_end_84
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_84
    loop_end_84:
    loop_start_85:
    ldrb w1, [x19]
    cbz w1, loop_end_85
    sub x19, x19, #1
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_86:
    ldrb w1, [x19]
    cbz w1, loop_end_86
    loop_start_87:
    ldrb w1, [x19]
    cbz w1, loop_end_87
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_87
    loop_end_87:
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_86
    loop_end_86:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_85
    loop_end_85:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_83
    loop_end_83:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_72
    loop_end_72:
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_88:
    ldrb w1, [x19]
    cbz w1, loop_end_88
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    loop_start_89:
    ldrb w1, [x19]
    cbz w1, loop_end_89
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_89
    loop_end_89:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_88
    loop_end_88:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_71
    loop_end_71:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_90:
    ldrb w1, [x19]
    cbz w1, loop_end_90
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    loop_start_91:
    ldrb w1, [x19]
    cbz w1, loop_end_91
    ldrb w1, [x19]
    cbnz w1, loop_start_91
    loop_end_91:
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_90
    loop_end_90:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_67
    loop_end_67:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_92:
    ldrb w1, [x19]
    cbz w1, loop_end_92
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_92
    loop_end_92:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_66
    loop_end_66:
    ldrb w1, [x19]
    cbnz w1, loop_start_65
    loop_end_65:
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_24
    loop_end_24:
    loop_start_93:
    ldrb w1, [x19]
    cbz w1, loop_end_93
    ldrb w0, [x19]
    bl _putchar
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_93
    loop_end_93:
    loop_start_94:
    ldrb w1, [x19]
    cbz w1, loop_end_94
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_94
    loop_end_94:
    sub x19, x19, #1
    loop_start_95:
    ldrb w1, [x19]
    cbz w1, loop_end_95
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    add x19, x19, #1
    loop_start_96:
    ldrb w1, [x19]
    cbz w1, loop_end_96
    loop_start_97:
    ldrb w1, [x19]
    cbz w1, loop_end_97
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
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_97
    loop_end_97:
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_98:
    ldrb w1, [x19]
    cbz w1, loop_end_98
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_98
    loop_end_98:
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_99:
    ldrb w1, [x19]
    cbz w1, loop_end_99
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    add x19, x19, #1
    ldrb w0, [x19]
    bl _putchar
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_100:
    ldrb w1, [x19]
    cbz w1, loop_end_100
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_100
    loop_end_100:
    ldrb w1, [x19]
    cbnz w1, loop_start_99
    loop_end_99:
    ldrb w0, [x19]
    bl _putchar
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_101:
    ldrb w1, [x19]
    cbz w1, loop_end_101
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    loop_start_102:
    ldrb w1, [x19]
    cbz w1, loop_end_102
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    loop_start_103:
    ldrb w1, [x19]
    cbz w1, loop_end_103
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_104:
    ldrb w1, [x19]
    cbz w1, loop_end_104
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_104
    loop_end_104:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_105:
    ldrb w1, [x19]
    cbz w1, loop_end_105
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
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
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    loop_start_106:
    ldrb w1, [x19]
    cbz w1, loop_end_106
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_106
    loop_end_106:
    sub x19, x19, #1
    loop_start_107:
    ldrb w1, [x19]
    cbz w1, loop_end_107
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    loop_start_108:
    ldrb w1, [x19]
    cbz w1, loop_end_108
    ldrb w1, [x19]
    add w1, w1, #1
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
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_108
    loop_end_108:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_107
    loop_end_107:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_109:
    ldrb w1, [x19]
    cbz w1, loop_end_109
    loop_start_110:
    ldrb w1, [x19]
    cbz w1, loop_end_110
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    bl _getchar
    strb w0, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    loop_start_111:
    ldrb w1, [x19]
    cbz w1, loop_end_111
    ldrb w1, [x19]
    cbnz w1, loop_start_111
    loop_end_111:
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_112:
    ldrb w1, [x19]
    cbz w1, loop_end_112
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_112
    loop_end_112:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_110
    loop_end_110:
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_109
    loop_end_109:
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_105
    loop_end_105:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    loop_start_113:
    ldrb w1, [x19]
    cbz w1, loop_end_113
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_113
    loop_end_113:
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
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_103
    loop_end_103:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_102
    loop_end_102:
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_101
    loop_end_101:
    sub x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_96
    loop_end_96:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w0, [x19]
    bl _putchar
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
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
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    sub x19, x19, #1
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_95
    loop_end_95:
    ldrb w1, [x19]
    cbnz w1, loop_start_21
    loop_end_21:
    ldrb w1, [x19]
    cbnz w1, loop_start_20
    loop_end_20:
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_19
    loop_end_19:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_18
    loop_end_18:
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    bl _getchar
    strb w0, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
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
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_16
    loop_end_16:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_15
    loop_end_15:
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_14
    loop_end_14:
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    bl _getchar
    strb w0, [x19]
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    add x19, x19, #1
    add x19, x19, #1
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    sub x19, x19, #1
    sub x19, x19, #1
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    add x19, x19, #1
    ldrb w1, [x19]
    cbnz w1, loop_start_13
    loop_end_13:
    ldrb w1, [x19]
    sub w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    add w1, w1, #1
    strb w1, [x19]
    ldrb w1, [x19]
    cbnz w1, loop_start_8
    loop_end_8:
mov x0, x20
bl _free
ldp x19, x20, [sp], #16
ldp x29, x30, [sp], #16
eor w0, w0, w0
ret
