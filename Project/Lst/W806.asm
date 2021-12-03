
.//Obj/W806.elf:     file format elf32-csky-little


Disassembly of section .text:

08010400 <__Vectors>:
 8010400:	00 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010410:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010420:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010430:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010440:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010450:	d0 05 01 08 d0 05 01 08 18 06 01 08 d0 05 01 08     ................
 8010460:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010470:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010480:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010490:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104a0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 ec 23 01 08     .............#..
 80104b0:	d0 05 01 08 d0 05 01 08 4c 23 01 08 6c 23 01 08     ........L#..l#..
 80104c0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 18 23 01 08 d0 05 01 08 d0 05 01 08     .....#..........
 80104f0:	d0 05 01 08 d0 05 01 08 ac 23 01 08 d0 05 01 08     .........#......

08010500 <Reset_Handler>:
    .align  2
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
#ifdef CONFIG_KERNEL_NONE
    lrw     r0, 0xe0000200
 8010500:	1019      	lrw      	r0, 0xe0000200	// 8010564 <__exit+0x4>
#else
    lrw     r0, 0x80000200
    mtcr    r0, psr
#endif
    mtcr    r0, psr
 8010502:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
 8010506:	1019      	lrw      	r0, 0x2000197c	// 8010568 <__exit+0x8>
    mov     sp, r0
 8010508:	6f83      	mov      	r14, r0

/*
 *	move __Vectors to irq_vectors
 */
    lrw     r1, __Vectors
 801050a:	1039      	lrw      	r1, 0x8010400	// 801056c <__exit+0xc>
    lrw     r2, __vdata_start__
 801050c:	1059      	lrw      	r2, 0x20000000	// 8010570 <__exit+0x10>
    lrw     r3, __vdata_end__
 801050e:	107a      	lrw      	r3, 0x20000100	// 8010574 <__exit+0x14>

    subu    r3, r2
 8010510:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 8010512:	3b40      	cmpnei      	r3, 0
    bf      .L_loopv0_done
 8010514:	0c08      	bf      	0x8010524	// 8010524 <Reset_Handler+0x24>

.L_loopv0:
    ldw     r0, (r1, 0)
 8010516:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010518:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 801051a:	2103      	addi      	r1, 4
    addi    r2, 4
 801051c:	2203      	addi      	r2, 4
    subi    r3, 4
 801051e:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 8010520:	3b40      	cmpnei      	r3, 0
    bt      .L_loopv0
 8010522:	0bfa      	bt      	0x8010516	// 8010516 <Reset_Handler+0x16>
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
 8010524:	1035      	lrw      	r1, 0x801576c	// 8010578 <__exit+0x18>
    lrw     r2, __data_start__
 8010526:	1056      	lrw      	r2, 0x20000100	// 801057c <__exit+0x1c>
    lrw     r3, __data_end__
 8010528:	1076      	lrw      	r3, 0x2000097c	// 8010580 <__exit+0x20>

    subu    r3, r2
 801052a:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 801052c:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
 801052e:	0c08      	bf      	0x801053e	// 801053e <Reset_Handler+0x3e>

.L_loop0:
    ldw     r0, (r1, 0)
 8010530:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010532:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 8010534:	2103      	addi      	r1, 4
    addi    r2, 4
 8010536:	2203      	addi      	r2, 4
    subi    r3, 4
 8010538:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 801053a:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
 801053c:	0bfa      	bt      	0x8010530	// 8010530 <Reset_Handler+0x30>
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
 #if 1
    lrw     r1, __bss_start__
 801053e:	1032      	lrw      	r1, 0x2000097c	// 8010584 <__exit+0x24>
    lrw     r2, __bss_end__
 8010540:	1052      	lrw      	r2, 0x20003310	// 8010588 <__exit+0x28>

    movi    r0, 0
 8010542:	3000      	movi      	r0, 0

    subu    r2, r1
 8010544:	6086      	subu      	r2, r1
    cmpnei  r2, 0
 8010546:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
 8010548:	0c06      	bf      	0x8010554	// 8010554 <Reset_Handler+0x54>

.L_loop1:
    stw     r0, (r1, 0)
 801054a:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
 801054c:	2103      	addi      	r1, 4
    subi    r2, 4
 801054e:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
 8010550:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
 8010552:	0bfc      	bt      	0x801054a	// 801054a <Reset_Handler+0x4a>
.L_loop1_done:
#endif

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
 8010554:	e0001972 	bsr      	0x8013838	// 8013838 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e0001958 	bsr      	0x8013808	// 8013808 <board_init>
#endif

    jbsr    main
 801055c:	e0000d3a 	bsr      	0x8011fd0	// 8011fd0 <main>

08010560 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010560:	0400      	br      	0x8010560	// 8010560 <__exit>
 8010562:	0000      	.short	0x0000
 8010564:	e0000200 	.long	0xe0000200
 8010568:	2000197c 	.long	0x2000197c
 801056c:	08010400 	.long	0x08010400
 8010570:	20000000 	.long	0x20000000
 8010574:	20000100 	.long	0x20000100
 8010578:	0801576c 	.long	0x0801576c
 801057c:	20000100 	.long	0x20000100
 8010580:	2000097c 	.long	0x2000097c
 8010584:	2000097c 	.long	0x2000097c
 8010588:	20003310 	.long	0x20003310

0801058c <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 801058c:	c1007420 	psrset      	ee

    subi    sp, 4
 8010590:	1421      	subi      	r14, r14, 4
    stw     r13, (sp)
 8010592:	ddae2000 	st.w      	r13, (r14, 0x0)
    addi    sp, 4
 8010596:	1401      	addi      	r14, r14, 4

    lrw     r13, g_trap_sp
 8010598:	ea8d000f 	lrw      	r13, 0x20001b7c	// 80105d4 <BLE_IRQHandler+0x4>
    stw     sp, (r13)
 801059c:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 80105a0:	ea8e000e 	lrw      	r14, 0x20001b7c	// 80105d8 <BLE_IRQHandler+0x8>

    subi    sp, 72
 80105a4:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 80105a6:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 80105aa:	100b      	lrw      	r0, 0x20001b7c	// 80105d4 <BLE_IRQHandler+0x4>
    ldw     r0, (r0)
 80105ac:	9000      	ld.w      	r0, (r0, 0x0)

    stw     r0, (sp, 56) /* save r14 */
 80105ae:	b80e      	st.w      	r0, (r14, 0x38)

    subi    r0, 4
 80105b0:	2803      	subi      	r0, 4
    ldw     r13, (r0)
 80105b2:	d9a02000 	ld.w      	r13, (r0, 0x0)
    stw     r13, (sp, 52)
 80105b6:	ddae200d 	st.w      	r13, (r14, 0x34)

    stw     r15, (sp, 60)
 80105ba:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
 80105be:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 80105c2:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
 80105c4:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 80105c8:	b811      	st.w      	r0, (r14, 0x44)

    mov     r0, sp
 80105ca:	6c3b      	mov      	r0, r14

    jbsr    trap_c
 80105cc:	e000194e 	bsr      	0x8013868	// 8013868 <trap_c>

080105d0 <BLE_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 80105d0:	07de      	br      	0x801058c	// 801058c <trap>
 80105d2:	0000      	.short	0x0000
 80105d4:	20001b7c 	.long	0x20001b7c
 80105d8:	20001b7c 	.long	0x20001b7c

080105dc <cpu_yeild>:
 *
 ********************************************************************/
.global cpu_yeild
.type   cpu_yeild, %function
cpu_yeild:
    lrw    r0, VIC_TSPDR
 80105dc:	1106      	lrw      	r0, 0xe000ec08	// 8010674 <tspend_handler+0x5c>
    bgeni  r1, 0
 80105de:	ea010001 	movi      	r1, 1
    stw    r1, (r0)
 80105e2:	b020      	st.w      	r1, (r0, 0x0)
    rts
 80105e4:	783c      	jmp      	r15

080105e6 <vPortStartTask>:
 *
 ********************************************************************/
.global vPortStartTask
.type   vPortStartTask, %function
vPortStartTask:
    psrclr   ie
 80105e6:	c0807020 	psrclr      	ie
    lrw      r4, pxCurrentTCB
 80105ea:	1184      	lrw      	r4, 0x20002d14	// 8010678 <tspend_handler+0x60>
    ld.w     r4, (r4)
 80105ec:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 80105ee:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 80105f2:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 80105f4:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 80105f8:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 80105fa:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 80105fe:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 8010602:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010606:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010608:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 801060c:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801060e:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 8010612:	1412      	addi      	r14, r14, 72

    rte
 8010614:	c0004020 	rte

08010618 <tspend_handler>:
 *
 ********************************************************************/
.global tspend_handler
.type   tspend_handler, %function
tspend_handler:
    subi     sp, 196
 8010618:	1531      	subi      	r14, r14, 196
    stm      r0-r13, (sp)
 801061a:	d40e1c2d 	stm      	r0-r13, (r14)
    stw      r15, (sp, 56)
 801061e:	ddee200e 	st.w      	r15, (r14, 0x38)
    addi     r0, sp, 60
 8010622:	180f      	addi      	r0, r14, 60
    stm      r16-r31, (r0)
 8010624:	d6001c2f 	stm      	r16-r31, (r0)
    addi     r0, 64
 8010628:	203f      	addi      	r0, 64
    fstms    vr0-vr15, (r0)
 801062a:	f5e03400 	fstms      	fr0-fr15, (r0)
    mfcr     r1, epsr
 801062e:	c0026021 	mfcr      	r1, cr<2, 0>
    stw      r1, (r0, 64)
 8010632:	b030      	st.w      	r1, (r0, 0x40)
    mfcr     r1, epc
 8010634:	c0046021 	mfcr      	r1, cr<4, 0>
    stw      r1, (r0, 68)
 8010638:	b031      	st.w      	r1, (r0, 0x44)

    lrw      r2, pxCurrentTCB
 801063a:	1050      	lrw      	r2, 0x20002d14	// 8010678 <tspend_handler+0x60>
    ld.w     r3, (r2)
 801063c:	9260      	ld.w      	r3, (r2, 0x0)
    st.w     sp, (r3)
 801063e:	ddc32000 	st.w      	r14, (r3, 0x0)

    jbsr     vTaskSwitchContext
 8010642:	e0002581 	bsr      	0x8015144	// 8015144 <vTaskSwitchContext>

    lrw      r4, pxCurrentTCB
 8010646:	108d      	lrw      	r4, 0x20002d14	// 8010678 <tspend_handler+0x60>
    ld.w     r4, (r4)
 8010648:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 801064a:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 801064e:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 8010650:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 8010654:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 8010656:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 801065a:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 801065e:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010662:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010664:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 8010668:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801066a:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 801066e:	1412      	addi      	r14, r14, 72

    rte
 8010670:	c0004020 	rte
 8010674:	e000ec08 	.long	0xe000ec08
 8010678:	20002d14 	.long	0x20002d14

0801067c <__fixunsdfsi>:
 801067c:	14d2      	push      	r4-r5, r15
 801067e:	3200      	movi      	r2, 0
 8010680:	ea2341e0 	movih      	r3, 16864
 8010684:	6d03      	mov      	r4, r0
 8010686:	6d47      	mov      	r5, r1
 8010688:	e00006b8 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 801068c:	e9a00007 	bhsz      	r0, 0x801069a	// 801069a <__fixunsdfsi+0x1e>
 8010690:	6c13      	mov      	r0, r4
 8010692:	6c57      	mov      	r1, r5
 8010694:	e0000722 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 8010698:	1492      	pop      	r4-r5, r15
 801069a:	3200      	movi      	r2, 0
 801069c:	ea2341e0 	movih      	r3, 16864
 80106a0:	6c13      	mov      	r0, r4
 80106a2:	6c57      	mov      	r1, r5
 80106a4:	e00004c4 	bsr      	0x801102c	// 801102c <__subdf3>
 80106a8:	e0000718 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 80106ac:	ea238000 	movih      	r3, 32768
 80106b0:	600c      	addu      	r0, r3
 80106b2:	1492      	pop      	r4-r5, r15

080106b4 <__udivdi3>:
 80106b4:	14c5      	push      	r4-r8
 80106b6:	6f4b      	mov      	r13, r2
 80106b8:	6d4f      	mov      	r5, r3
 80106ba:	6d03      	mov      	r4, r0
 80106bc:	6f07      	mov      	r12, r1
 80106be:	e9230054 	bnez      	r3, 0x8010766	// 8010766 <__udivdi3+0xb2>
 80106c2:	6484      	cmphs      	r1, r2
 80106c4:	0870      	bt      	0x80107a4	// 80107a4 <__udivdi3+0xf0>
 80106c6:	eb02ffff 	cmphsi      	r2, 65536
 80106ca:	0cc4      	bf      	0x8010852	// 8010852 <__udivdi3+0x19e>
 80106cc:	c6e05023 	bmaski      	r3, 24
 80106d0:	648c      	cmphs      	r3, r2
 80106d2:	3518      	movi      	r5, 24
 80106d4:	3310      	movi      	r3, 16
 80106d6:	c4a30c40 	inct      	r5, r3, 0
 80106da:	01dc      	lrw      	r6, 0x80151f4	// 80109e4 <__udivdi3+0x330>
 80106dc:	c4a24043 	lsr      	r3, r2, r5
 80106e0:	d0660023 	ldr.b      	r3, (r6, r3 << 0)
 80106e4:	614c      	addu      	r5, r3
 80106e6:	3320      	movi      	r3, 32
 80106e8:	60d6      	subu      	r3, r5
 80106ea:	e903000c 	bez      	r3, 0x8010702	// 8010702 <__udivdi3+0x4e>
 80106ee:	c462402d 	lsl      	r13, r2, r3
 80106f2:	c4a04045 	lsr      	r5, r0, r5
 80106f6:	c4614022 	lsl      	r2, r1, r3
 80106fa:	c445242c 	or      	r12, r5, r2
 80106fe:	c4604024 	lsl      	r4, r0, r3
 8010702:	c60d4841 	lsri      	r1, r13, 16
 8010706:	c42c8022 	divu      	r2, r12, r1
 801070a:	c4228423 	mult      	r3, r2, r1
 801070e:	630e      	subu      	r12, r3
 8010710:	c60c4823 	lsli      	r3, r12, 16
 8010714:	c40d55e5 	zext      	r5, r13, 15, 0
 8010718:	c604484c 	lsri      	r12, r4, 16
 801071c:	c4458420 	mult      	r0, r5, r2
 8010720:	6f0c      	or      	r12, r3
 8010722:	6430      	cmphs      	r12, r0
 8010724:	0808      	bt      	0x8010734	// 8010734 <__udivdi3+0x80>
 8010726:	6334      	addu      	r12, r13
 8010728:	6770      	cmphs      	r12, r13
 801072a:	5a63      	subi      	r3, r2, 1
 801072c:	0c03      	bf      	0x8010732	// 8010732 <__udivdi3+0x7e>
 801072e:	6430      	cmphs      	r12, r0
 8010730:	0d56      	bf      	0x80109dc	// 80109dc <__udivdi3+0x328>
 8010732:	6c8f      	mov      	r2, r3
 8010734:	6302      	subu      	r12, r0
 8010736:	c42c8020 	divu      	r0, r12, r1
 801073a:	7c40      	mult      	r1, r0
 801073c:	6306      	subu      	r12, r1
 801073e:	c60c482c 	lsli      	r12, r12, 16
 8010742:	c40455e4 	zext      	r4, r4, 15, 0
 8010746:	7d40      	mult      	r5, r0
 8010748:	6d30      	or      	r4, r12
 801074a:	6550      	cmphs      	r4, r5
 801074c:	6c43      	mov      	r1, r0
 801074e:	0808      	bt      	0x801075e	// 801075e <__udivdi3+0xaa>
 8010750:	6134      	addu      	r4, r13
 8010752:	6750      	cmphs      	r4, r13
 8010754:	5863      	subi      	r3, r0, 1
 8010756:	0d21      	bf      	0x8010998	// 8010998 <__udivdi3+0x2e4>
 8010758:	6550      	cmphs      	r4, r5
 801075a:	091f      	bt      	0x8010998	// 8010998 <__udivdi3+0x2e4>
 801075c:	2901      	subi      	r1, 2
 801075e:	4210      	lsli      	r0, r2, 16
 8010760:	6c04      	or      	r0, r1
 8010762:	3100      	movi      	r1, 0
 8010764:	1485      	pop      	r4-r8
 8010766:	64c4      	cmphs      	r1, r3
 8010768:	0c6b      	bf      	0x801083e	// 801083e <__udivdi3+0x18a>
 801076a:	eb03ffff 	cmphsi      	r3, 65536
 801076e:	0c6b      	bf      	0x8010844	// 8010844 <__udivdi3+0x190>
 8010770:	c6e0502c 	bmaski      	r12, 24
 8010774:	64f0      	cmphs      	r12, r3
 8010776:	ea0d0018 	movi      	r13, 24
 801077a:	ea0c0010 	movi      	r12, 16
 801077e:	c58d0c20 	incf      	r12, r13, 0
 8010782:	0386      	lrw      	r4, 0x80151f4	// 80109e4 <__udivdi3+0x330>
 8010784:	c583404d 	lsr      	r13, r3, r12
 8010788:	d1a4002d 	ldr.b      	r13, (r4, r13 << 0)
 801078c:	6370      	addu      	r13, r12
 801078e:	3520      	movi      	r5, 32
 8010790:	6176      	subu      	r5, r13
 8010792:	e925006c 	bnez      	r5, 0x801086a	// 801086a <__udivdi3+0x1b6>
 8010796:	644c      	cmphs      	r3, r1
 8010798:	0d0d      	bf      	0x80109b2	// 80109b2 <__udivdi3+0x2fe>
 801079a:	6480      	cmphs      	r0, r2
 801079c:	c4000500 	mvc      	r0
 80107a0:	6c57      	mov      	r1, r5
 80107a2:	1485      	pop      	r4-r8
 80107a4:	e9220006 	bnez      	r2, 0x80107b0	// 80107b0 <__udivdi3+0xfc>
 80107a8:	ea0d0001 	movi      	r13, 1
 80107ac:	c44d802d 	divu      	r13, r13, r2
 80107b0:	eb0dffff 	cmphsi      	r13, 65536
 80107b4:	0c55      	bf      	0x801085e	// 801085e <__udivdi3+0x1aa>
 80107b6:	c6e05023 	bmaski      	r3, 24
 80107ba:	674c      	cmphs      	r3, r13
 80107bc:	3518      	movi      	r5, 24
 80107be:	3310      	movi      	r3, 16
 80107c0:	c4a30c40 	inct      	r5, r3, 0
 80107c4:	0357      	lrw      	r2, 0x80151f4	// 80109e4 <__udivdi3+0x330>
 80107c6:	c4ad4043 	lsr      	r3, r13, r5
 80107ca:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 80107ce:	614c      	addu      	r5, r3
 80107d0:	3620      	movi      	r6, 32
 80107d2:	6196      	subu      	r6, r5
 80107d4:	e926009f 	bnez      	r6, 0x8010912	// 8010912 <__udivdi3+0x25e>
 80107d8:	c5a10082 	subu      	r2, r1, r13
 80107dc:	c60d4846 	lsri      	r6, r13, 16
 80107e0:	c40d55e5 	zext      	r5, r13, 15, 0
 80107e4:	3101      	movi      	r1, 1
 80107e6:	c4c2802c 	divu      	r12, r2, r6
 80107ea:	c4cc8423 	mult      	r3, r12, r6
 80107ee:	608e      	subu      	r2, r3
 80107f0:	4250      	lsli      	r2, r2, 16
 80107f2:	4c70      	lsri      	r3, r4, 16
 80107f4:	c4ac8420 	mult      	r0, r12, r5
 80107f8:	6cc8      	or      	r3, r2
 80107fa:	640c      	cmphs      	r3, r0
 80107fc:	0809      	bt      	0x801080e	// 801080e <__udivdi3+0x15a>
 80107fe:	60f4      	addu      	r3, r13
 8010800:	674c      	cmphs      	r3, r13
 8010802:	e44c1000 	subi      	r2, r12, 1
 8010806:	0c03      	bf      	0x801080c	// 801080c <__udivdi3+0x158>
 8010808:	640c      	cmphs      	r3, r0
 801080a:	0ce5      	bf      	0x80109d4	// 80109d4 <__udivdi3+0x320>
 801080c:	6f0b      	mov      	r12, r2
 801080e:	60c2      	subu      	r3, r0
 8010810:	c4c38020 	divu      	r0, r3, r6
 8010814:	7d80      	mult      	r6, r0
 8010816:	60da      	subu      	r3, r6
 8010818:	4370      	lsli      	r3, r3, 16
 801081a:	c40455e4 	zext      	r4, r4, 15, 0
 801081e:	7d40      	mult      	r5, r0
 8010820:	6cd0      	or      	r3, r4
 8010822:	654c      	cmphs      	r3, r5
 8010824:	6c83      	mov      	r2, r0
 8010826:	0808      	bt      	0x8010836	// 8010836 <__udivdi3+0x182>
 8010828:	60f4      	addu      	r3, r13
 801082a:	674c      	cmphs      	r3, r13
 801082c:	2800      	subi      	r0, 1
 801082e:	0cb3      	bf      	0x8010994	// 8010994 <__udivdi3+0x2e0>
 8010830:	654c      	cmphs      	r3, r5
 8010832:	08b1      	bt      	0x8010994	// 8010994 <__udivdi3+0x2e0>
 8010834:	2a01      	subi      	r2, 2
 8010836:	c60c4820 	lsli      	r0, r12, 16
 801083a:	6c08      	or      	r0, r2
 801083c:	1485      	pop      	r4-r8
 801083e:	3100      	movi      	r1, 0
 8010840:	6c07      	mov      	r0, r1
 8010842:	1485      	pop      	r4-r8
 8010844:	eb0300ff 	cmphsi      	r3, 256
 8010848:	c400050d 	mvc      	r13
 801084c:	c46d482c 	lsli      	r12, r13, 3
 8010850:	0799      	br      	0x8010782	// 8010782 <__udivdi3+0xce>
 8010852:	eb0200ff 	cmphsi      	r2, 256
 8010856:	3308      	movi      	r3, 8
 8010858:	c4a30c40 	inct      	r5, r3, 0
 801085c:	073f      	br      	0x80106da	// 80106da <__udivdi3+0x26>
 801085e:	eb0d00ff 	cmphsi      	r13, 256
 8010862:	3308      	movi      	r3, 8
 8010864:	c4a30c40 	inct      	r5, r3, 0
 8010868:	07ae      	br      	0x80107c4	// 80107c4 <__udivdi3+0x110>
 801086a:	c5a24046 	lsr      	r6, r2, r13
 801086e:	70d4      	lsl      	r3, r5
 8010870:	6d8c      	or      	r6, r3
 8010872:	c5a14044 	lsr      	r4, r1, r13
 8010876:	4ef0      	lsri      	r7, r6, 16
 8010878:	c4e48023 	divu      	r3, r4, r7
 801087c:	c4a1402c 	lsl      	r12, r1, r5
 8010880:	c5a04041 	lsr      	r1, r0, r13
 8010884:	c4e3842d 	mult      	r13, r3, r7
 8010888:	6c70      	or      	r1, r12
 801088a:	6136      	subu      	r4, r13
 801088c:	c40655ec 	zext      	r12, r6, 15, 0
 8010890:	4490      	lsli      	r4, r4, 16
 8010892:	c601484d 	lsri      	r13, r1, 16
 8010896:	c46c8428 	mult      	r8, r12, r3
 801089a:	6f50      	or      	r13, r4
 801089c:	6634      	cmphs      	r13, r8
 801089e:	7094      	lsl      	r2, r5
 80108a0:	0806      	bt      	0x80108ac	// 80108ac <__udivdi3+0x1f8>
 80108a2:	6358      	addu      	r13, r6
 80108a4:	65b4      	cmphs      	r13, r6
 80108a6:	5b83      	subi      	r4, r3, 1
 80108a8:	088d      	bt      	0x80109c2	// 80109c2 <__udivdi3+0x30e>
 80108aa:	6cd3      	mov      	r3, r4
 80108ac:	6362      	subu      	r13, r8
 80108ae:	c4ed8024 	divu      	r4, r13, r7
 80108b2:	7dd0      	mult      	r7, r4
 80108b4:	635e      	subu      	r13, r7
 80108b6:	c60d482d 	lsli      	r13, r13, 16
 80108ba:	c48c8427 	mult      	r7, r12, r4
 80108be:	c40155ec 	zext      	r12, r1, 15, 0
 80108c2:	6f34      	or      	r12, r13
 80108c4:	65f0      	cmphs      	r12, r7
 80108c6:	0806      	bt      	0x80108d2	// 80108d2 <__udivdi3+0x21e>
 80108c8:	6318      	addu      	r12, r6
 80108ca:	65b0      	cmphs      	r12, r6
 80108cc:	5c23      	subi      	r1, r4, 1
 80108ce:	0875      	bt      	0x80109b8	// 80109b8 <__udivdi3+0x304>
 80108d0:	6d07      	mov      	r4, r1
 80108d2:	4370      	lsli      	r3, r3, 16
 80108d4:	6cd0      	or      	r3, r4
 80108d6:	c40355e1 	zext      	r1, r3, 15, 0
 80108da:	c40255e4 	zext      	r4, r2, 15, 0
 80108de:	c603484d 	lsri      	r13, r3, 16
 80108e2:	4a50      	lsri      	r2, r2, 16
 80108e4:	c4818426 	mult      	r6, r1, r4
 80108e8:	7d34      	mult      	r4, r13
 80108ea:	7c48      	mult      	r1, r2
 80108ec:	7f48      	mult      	r13, r2
 80108ee:	6050      	addu      	r1, r4
 80108f0:	4e50      	lsri      	r2, r6, 16
 80108f2:	6084      	addu      	r2, r1
 80108f4:	6508      	cmphs      	r2, r4
 80108f6:	631e      	subu      	r12, r7
 80108f8:	0804      	bt      	0x8010900	// 8010900 <__udivdi3+0x24c>
 80108fa:	ea210001 	movih      	r1, 1
 80108fe:	6344      	addu      	r13, r1
 8010900:	4a30      	lsri      	r1, r2, 16
 8010902:	6344      	addu      	r13, r1
 8010904:	6770      	cmphs      	r12, r13
 8010906:	0c53      	bf      	0x80109ac	// 80109ac <__udivdi3+0x2f8>
 8010908:	6772      	cmpne      	r12, r13
 801090a:	0c49      	bf      	0x801099c	// 801099c <__udivdi3+0x2e8>
 801090c:	6c0f      	mov      	r0, r3
 801090e:	3100      	movi      	r1, 0
 8010910:	1485      	pop      	r4-r8
 8010912:	7358      	lsl      	r13, r6
 8010914:	c4a1404c 	lsr      	r12, r1, r5
 8010918:	c4c14022 	lsl      	r2, r1, r6
 801091c:	c4c04024 	lsl      	r4, r0, r6
 8010920:	c60d4846 	lsri      	r6, r13, 16
 8010924:	c4a04045 	lsr      	r5, r0, r5
 8010928:	c4cc8020 	divu      	r0, r12, r6
 801092c:	c4c08421 	mult      	r1, r0, r6
 8010930:	c4452423 	or      	r3, r5, r2
 8010934:	6306      	subu      	r12, r1
 8010936:	c40d55e5 	zext      	r5, r13, 15, 0
 801093a:	c60c482c 	lsli      	r12, r12, 16
 801093e:	4b30      	lsri      	r1, r3, 16
 8010940:	c4058422 	mult      	r2, r5, r0
 8010944:	6c70      	or      	r1, r12
 8010946:	6484      	cmphs      	r1, r2
 8010948:	080a      	bt      	0x801095c	// 801095c <__udivdi3+0x2a8>
 801094a:	6074      	addu      	r1, r13
 801094c:	6744      	cmphs      	r1, r13
 801094e:	e5801000 	subi      	r12, r0, 1
 8010952:	0c3f      	bf      	0x80109d0	// 80109d0 <__udivdi3+0x31c>
 8010954:	6484      	cmphs      	r1, r2
 8010956:	083d      	bt      	0x80109d0	// 80109d0 <__udivdi3+0x31c>
 8010958:	2801      	subi      	r0, 2
 801095a:	6074      	addu      	r1, r13
 801095c:	604a      	subu      	r1, r2
 801095e:	c4c1802c 	divu      	r12, r1, r6
 8010962:	c4cc8422 	mult      	r2, r12, r6
 8010966:	5949      	subu      	r2, r1, r2
 8010968:	4250      	lsli      	r2, r2, 16
 801096a:	c40355e3 	zext      	r3, r3, 15, 0
 801096e:	c5858421 	mult      	r1, r5, r12
 8010972:	6c8c      	or      	r2, r3
 8010974:	6448      	cmphs      	r2, r1
 8010976:	080b      	bt      	0x801098c	// 801098c <__udivdi3+0x2d8>
 8010978:	60b4      	addu      	r2, r13
 801097a:	6748      	cmphs      	r2, r13
 801097c:	e46c1000 	subi      	r3, r12, 1
 8010980:	0c26      	bf      	0x80109cc	// 80109cc <__udivdi3+0x318>
 8010982:	6448      	cmphs      	r2, r1
 8010984:	0824      	bt      	0x80109cc	// 80109cc <__udivdi3+0x318>
 8010986:	e58c1001 	subi      	r12, r12, 2
 801098a:	60b4      	addu      	r2, r13
 801098c:	6086      	subu      	r2, r1
 801098e:	4030      	lsli      	r1, r0, 16
 8010990:	6c70      	or      	r1, r12
 8010992:	072a      	br      	0x80107e6	// 80107e6 <__udivdi3+0x132>
 8010994:	6c83      	mov      	r2, r0
 8010996:	0750      	br      	0x8010836	// 8010836 <__udivdi3+0x182>
 8010998:	6c4f      	mov      	r1, r3
 801099a:	06e2      	br      	0x801075e	// 801075e <__udivdi3+0xaa>
 801099c:	4250      	lsli      	r2, r2, 16
 801099e:	c40655e6 	zext      	r6, r6, 15, 0
 80109a2:	c4a04021 	lsl      	r1, r0, r5
 80109a6:	6098      	addu      	r2, r6
 80109a8:	6484      	cmphs      	r1, r2
 80109aa:	0bb1      	bt      	0x801090c	// 801090c <__udivdi3+0x258>
 80109ac:	5b03      	subi      	r0, r3, 1
 80109ae:	3100      	movi      	r1, 0
 80109b0:	1485      	pop      	r4-r8
 80109b2:	6c57      	mov      	r1, r5
 80109b4:	3001      	movi      	r0, 1
 80109b6:	1485      	pop      	r4-r8
 80109b8:	65f0      	cmphs      	r12, r7
 80109ba:	0b8b      	bt      	0x80108d0	// 80108d0 <__udivdi3+0x21c>
 80109bc:	2c01      	subi      	r4, 2
 80109be:	6318      	addu      	r12, r6
 80109c0:	0789      	br      	0x80108d2	// 80108d2 <__udivdi3+0x21e>
 80109c2:	6634      	cmphs      	r13, r8
 80109c4:	0b73      	bt      	0x80108aa	// 80108aa <__udivdi3+0x1f6>
 80109c6:	2b01      	subi      	r3, 2
 80109c8:	6358      	addu      	r13, r6
 80109ca:	0771      	br      	0x80108ac	// 80108ac <__udivdi3+0x1f8>
 80109cc:	6f0f      	mov      	r12, r3
 80109ce:	07df      	br      	0x801098c	// 801098c <__udivdi3+0x2d8>
 80109d0:	6c33      	mov      	r0, r12
 80109d2:	07c5      	br      	0x801095c	// 801095c <__udivdi3+0x2a8>
 80109d4:	e58c1001 	subi      	r12, r12, 2
 80109d8:	60f4      	addu      	r3, r13
 80109da:	071a      	br      	0x801080e	// 801080e <__udivdi3+0x15a>
 80109dc:	2a01      	subi      	r2, 2
 80109de:	6334      	addu      	r12, r13
 80109e0:	06aa      	br      	0x8010734	// 8010734 <__udivdi3+0x80>
 80109e2:	0000      	.short	0x0000
 80109e4:	080151f4 	.long	0x080151f4

080109e8 <__umoddi3>:
 80109e8:	14c6      	push      	r4-r9
 80109ea:	6d4b      	mov      	r5, r2
 80109ec:	6f4f      	mov      	r13, r3
 80109ee:	6d83      	mov      	r6, r0
 80109f0:	6f07      	mov      	r12, r1
 80109f2:	e923004a 	bnez      	r3, 0x8010a86	// 8010a86 <__umoddi3+0x9e>
 80109f6:	6484      	cmphs      	r1, r2
 80109f8:	086b      	bt      	0x8010ace	// 8010ace <__umoddi3+0xe6>
 80109fa:	eb02ffff 	cmphsi      	r2, 65536
 80109fe:	0cc0      	bf      	0x8010b7e	// 8010b7e <__umoddi3+0x196>
 8010a00:	c6e05023 	bmaski      	r3, 24
 8010a04:	648c      	cmphs      	r3, r2
 8010a06:	ea0d0018 	movi      	r13, 24
 8010a0a:	3310      	movi      	r3, 16
 8010a0c:	c5a30c40 	inct      	r13, r3, 0
 8010a10:	0281      	lrw      	r4, 0x80151f4	// 8010d08 <__umoddi3+0x320>
 8010a12:	c5a24043 	lsr      	r3, r2, r13
 8010a16:	d0640023 	ldr.b      	r3, (r4, r3 << 0)
 8010a1a:	634c      	addu      	r13, r3
 8010a1c:	3420      	movi      	r4, 32
 8010a1e:	6136      	subu      	r4, r13
 8010a20:	e904000b 	bez      	r4, 0x8010a36	// 8010a36 <__umoddi3+0x4e>
 8010a24:	7050      	lsl      	r1, r4
 8010a26:	c5a0404d 	lsr      	r13, r0, r13
 8010a2a:	c4824025 	lsl      	r5, r2, r4
 8010a2e:	c42d242c 	or      	r12, r13, r1
 8010a32:	c4804026 	lsl      	r6, r0, r4
 8010a36:	c605484d 	lsri      	r13, r5, 16
 8010a3a:	c5ac8021 	divu      	r1, r12, r13
 8010a3e:	c5a18422 	mult      	r2, r1, r13
 8010a42:	c40555e0 	zext      	r0, r5, 15, 0
 8010a46:	c44c0082 	subu      	r2, r12, r2
 8010a4a:	c4208423 	mult      	r3, r0, r1
 8010a4e:	4250      	lsli      	r2, r2, 16
 8010a50:	4e30      	lsri      	r1, r6, 16
 8010a52:	6c48      	or      	r1, r2
 8010a54:	64c4      	cmphs      	r1, r3
 8010a56:	0808      	bt      	0x8010a66	// 8010a66 <__umoddi3+0x7e>
 8010a58:	6054      	addu      	r1, r5
 8010a5a:	6544      	cmphs      	r1, r5
 8010a5c:	0c05      	bf      	0x8010a66	// 8010a66 <__umoddi3+0x7e>
 8010a5e:	5954      	addu      	r2, r1, r5
 8010a60:	64c4      	cmphs      	r1, r3
 8010a62:	c4220c20 	incf      	r1, r2, 0
 8010a66:	604e      	subu      	r1, r3
 8010a68:	c5a18023 	divu      	r3, r1, r13
 8010a6c:	7f4c      	mult      	r13, r3
 8010a6e:	6076      	subu      	r1, r13
 8010a70:	7c0c      	mult      	r0, r3
 8010a72:	4130      	lsli      	r1, r1, 16
 8010a74:	c40655e3 	zext      	r3, r6, 15, 0
 8010a78:	6cc4      	or      	r3, r1
 8010a7a:	640c      	cmphs      	r3, r0
 8010a7c:	0c69      	bf      	0x8010b4e	// 8010b4e <__umoddi3+0x166>
 8010a7e:	5b01      	subu      	r0, r3, r0
 8010a80:	7011      	lsr      	r0, r4
 8010a82:	3100      	movi      	r1, 0
 8010a84:	1486      	pop      	r4-r9
 8010a86:	64c4      	cmphs      	r1, r3
 8010a88:	0ffe      	bf      	0x8010a84	// 8010a84 <__umoddi3+0x9c>
 8010a8a:	eb03ffff 	cmphsi      	r3, 65536
 8010a8e:	0c6b      	bf      	0x8010b64	// 8010b64 <__umoddi3+0x17c>
 8010a90:	c6e0502d 	bmaski      	r13, 24
 8010a94:	64f4      	cmphs      	r13, r3
 8010a96:	3518      	movi      	r5, 24
 8010a98:	ea0d0010 	movi      	r13, 16
 8010a9c:	c5a50c20 	incf      	r13, r5, 0
 8010aa0:	03a5      	lrw      	r5, 0x80151f4	// 8010d08 <__umoddi3+0x320>
 8010aa2:	c5a34044 	lsr      	r4, r3, r13
 8010aa6:	d0850025 	ldr.b      	r5, (r5, r4 << 0)
 8010aaa:	6174      	addu      	r5, r13
 8010aac:	3420      	movi      	r4, 32
 8010aae:	6116      	subu      	r4, r5
 8010ab0:	e924006d 	bnez      	r4, 0x8010b8a	// 8010b8a <__umoddi3+0x1a2>
 8010ab4:	644c      	cmphs      	r3, r1
 8010ab6:	0c03      	bf      	0x8010abc	// 8010abc <__umoddi3+0xd4>
 8010ab8:	6480      	cmphs      	r0, r2
 8010aba:	0d20      	bf      	0x8010cfa	// 8010cfa <__umoddi3+0x312>
 8010abc:	5889      	subu      	r4, r0, r2
 8010abe:	6500      	cmphs      	r0, r4
 8010ac0:	c461008c 	subu      	r12, r1, r3
 8010ac4:	6443      	mvcv      	r1
 8010ac6:	6306      	subu      	r12, r1
 8010ac8:	6c13      	mov      	r0, r4
 8010aca:	6c73      	mov      	r1, r12
 8010acc:	1486      	pop      	r4-r9
 8010ace:	e9220005 	bnez      	r2, 0x8010ad8	// 8010ad8 <__umoddi3+0xf0>
 8010ad2:	3501      	movi      	r5, 1
 8010ad4:	c4458025 	divu      	r5, r5, r2
 8010ad8:	eb05ffff 	cmphsi      	r5, 65536
 8010adc:	0c4b      	bf      	0x8010b72	// 8010b72 <__umoddi3+0x18a>
 8010ade:	c6e05023 	bmaski      	r3, 24
 8010ae2:	654c      	cmphs      	r3, r5
 8010ae4:	ea0d0018 	movi      	r13, 24
 8010ae8:	3310      	movi      	r3, 16
 8010aea:	c5a30c40 	inct      	r13, r3, 0
 8010aee:	0358      	lrw      	r2, 0x80151f4	// 8010d08 <__umoddi3+0x320>
 8010af0:	c5a54043 	lsr      	r3, r5, r13
 8010af4:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 8010af8:	634c      	addu      	r13, r3
 8010afa:	3420      	movi      	r4, 32
 8010afc:	6136      	subu      	r4, r13
 8010afe:	e92400af 	bnez      	r4, 0x8010c5c	// 8010c5c <__umoddi3+0x274>
 8010b02:	c4a1008c 	subu      	r12, r1, r5
 8010b06:	4df0      	lsri      	r7, r5, 16
 8010b08:	c40555e2 	zext      	r2, r5, 15, 0
 8010b0c:	c4ec8021 	divu      	r1, r12, r7
 8010b10:	c4e18423 	mult      	r3, r1, r7
 8010b14:	630e      	subu      	r12, r3
 8010b16:	c60c482c 	lsli      	r12, r12, 16
 8010b1a:	c4418423 	mult      	r3, r1, r2
 8010b1e:	4e30      	lsri      	r1, r6, 16
 8010b20:	6c70      	or      	r1, r12
 8010b22:	64c4      	cmphs      	r1, r3
 8010b24:	0808      	bt      	0x8010b34	// 8010b34 <__umoddi3+0x14c>
 8010b26:	6054      	addu      	r1, r5
 8010b28:	6544      	cmphs      	r1, r5
 8010b2a:	0c05      	bf      	0x8010b34	// 8010b34 <__umoddi3+0x14c>
 8010b2c:	5914      	addu      	r0, r1, r5
 8010b2e:	64c4      	cmphs      	r1, r3
 8010b30:	c4200c20 	incf      	r1, r0, 0
 8010b34:	604e      	subu      	r1, r3
 8010b36:	c4e18020 	divu      	r0, r1, r7
 8010b3a:	7dc0      	mult      	r7, r0
 8010b3c:	605e      	subu      	r1, r7
 8010b3e:	4130      	lsli      	r1, r1, 16
 8010b40:	c40655e6 	zext      	r6, r6, 15, 0
 8010b44:	7c08      	mult      	r0, r2
 8010b46:	c4c12423 	or      	r3, r1, r6
 8010b4a:	640c      	cmphs      	r3, r0
 8010b4c:	0808      	bt      	0x8010b5c	// 8010b5c <__umoddi3+0x174>
 8010b4e:	60d4      	addu      	r3, r5
 8010b50:	654c      	cmphs      	r3, r5
 8010b52:	0c05      	bf      	0x8010b5c	// 8010b5c <__umoddi3+0x174>
 8010b54:	614c      	addu      	r5, r3
 8010b56:	640c      	cmphs      	r3, r0
 8010b58:	c4650c20 	incf      	r3, r5, 0
 8010b5c:	5b01      	subu      	r0, r3, r0
 8010b5e:	7011      	lsr      	r0, r4
 8010b60:	3100      	movi      	r1, 0
 8010b62:	1486      	pop      	r4-r9
 8010b64:	eb0300ff 	cmphsi      	r3, 256
 8010b68:	c4000505 	mvc      	r5
 8010b6c:	c465482d 	lsli      	r13, r5, 3
 8010b70:	0798      	br      	0x8010aa0	// 8010aa0 <__umoddi3+0xb8>
 8010b72:	eb0500ff 	cmphsi      	r5, 256
 8010b76:	3308      	movi      	r3, 8
 8010b78:	c5a30c40 	inct      	r13, r3, 0
 8010b7c:	07b9      	br      	0x8010aee	// 8010aee <__umoddi3+0x106>
 8010b7e:	eb0200ff 	cmphsi      	r2, 256
 8010b82:	3308      	movi      	r3, 8
 8010b84:	c5a30c40 	inct      	r13, r3, 0
 8010b88:	0744      	br      	0x8010a10	// 8010a10 <__umoddi3+0x28>
 8010b8a:	70d0      	lsl      	r3, r4
 8010b8c:	c4a24047 	lsr      	r7, r2, r5
 8010b90:	6dcc      	or      	r7, r3
 8010b92:	c4a14046 	lsr      	r6, r1, r5
 8010b96:	c481402c 	lsl      	r12, r1, r4
 8010b9a:	c4a04041 	lsr      	r1, r0, r5
 8010b9e:	6c70      	or      	r1, r12
 8010ba0:	c607484c 	lsri      	r12, r7, 16
 8010ba4:	c5868028 	divu      	r8, r6, r12
 8010ba8:	c4824023 	lsl      	r3, r2, r4
 8010bac:	c5888422 	mult      	r2, r8, r12
 8010bb0:	618a      	subu      	r6, r2
 8010bb2:	c40755ed 	zext      	r13, r7, 15, 0
 8010bb6:	46d0      	lsli      	r6, r6, 16
 8010bb8:	4950      	lsri      	r2, r1, 16
 8010bba:	c50d8429 	mult      	r9, r13, r8
 8010bbe:	6c98      	or      	r2, r6
 8010bc0:	6648      	cmphs      	r2, r9
 8010bc2:	7010      	lsl      	r0, r4
 8010bc4:	0807      	bt      	0x8010bd2	// 8010bd2 <__umoddi3+0x1ea>
 8010bc6:	609c      	addu      	r2, r7
 8010bc8:	65c8      	cmphs      	r2, r7
 8010bca:	e4c81000 	subi      	r6, r8, 1
 8010bce:	088a      	bt      	0x8010ce2	// 8010ce2 <__umoddi3+0x2fa>
 8010bd0:	6e1b      	mov      	r8, r6
 8010bd2:	60a6      	subu      	r2, r9
 8010bd4:	c5828026 	divu      	r6, r2, r12
 8010bd8:	7f18      	mult      	r12, r6
 8010bda:	60b2      	subu      	r2, r12
 8010bdc:	4250      	lsli      	r2, r2, 16
 8010bde:	c40155e1 	zext      	r1, r1, 15, 0
 8010be2:	7f58      	mult      	r13, r6
 8010be4:	6c48      	or      	r1, r2
 8010be6:	6744      	cmphs      	r1, r13
 8010be8:	0806      	bt      	0x8010bf4	// 8010bf4 <__umoddi3+0x20c>
 8010bea:	605c      	addu      	r1, r7
 8010bec:	65c4      	cmphs      	r1, r7
 8010bee:	5e43      	subi      	r2, r6, 1
 8010bf0:	0874      	bt      	0x8010cd8	// 8010cd8 <__umoddi3+0x2f0>
 8010bf2:	6d8b      	mov      	r6, r2
 8010bf4:	c6084822 	lsli      	r2, r8, 16
 8010bf8:	6c98      	or      	r2, r6
 8010bfa:	c40255e8 	zext      	r8, r2, 15, 0
 8010bfe:	c603484c 	lsri      	r12, r3, 16
 8010c02:	4a50      	lsri      	r2, r2, 16
 8010c04:	c5a1008d 	subu      	r13, r1, r13
 8010c08:	c40355e1 	zext      	r1, r3, 15, 0
 8010c0c:	c4288426 	mult      	r6, r8, r1
 8010c10:	7c48      	mult      	r1, r2
 8010c12:	7e30      	mult      	r8, r12
 8010c14:	7cb0      	mult      	r2, r12
 8010c16:	6204      	addu      	r8, r1
 8010c18:	c606484c 	lsri      	r12, r6, 16
 8010c1c:	6320      	addu      	r12, r8
 8010c1e:	6470      	cmphs      	r12, r1
 8010c20:	0804      	bt      	0x8010c28	// 8010c28 <__umoddi3+0x240>
 8010c22:	ea210001 	movih      	r1, 1
 8010c26:	6084      	addu      	r2, r1
 8010c28:	c60c4841 	lsri      	r1, r12, 16
 8010c2c:	6048      	addu      	r1, r2
 8010c2e:	6474      	cmphs      	r13, r1
 8010c30:	c60c482c 	lsli      	r12, r12, 16
 8010c34:	c40655e6 	zext      	r6, r6, 15, 0
 8010c38:	6318      	addu      	r12, r6
 8010c3a:	0c46      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2de>
 8010c3c:	6476      	cmpne      	r13, r1
 8010c3e:	0c60      	bf      	0x8010cfe	// 8010cfe <__umoddi3+0x316>
 8010c40:	c42d0081 	subu      	r1, r13, r1
 8010c44:	6cf3      	mov      	r3, r12
 8010c46:	586d      	subu      	r3, r0, r3
 8010c48:	64c0      	cmphs      	r0, r3
 8010c4a:	6743      	mvcv      	r13
 8010c4c:	6076      	subu      	r1, r13
 8010c4e:	c4a14025 	lsl      	r5, r1, r5
 8010c52:	c4834040 	lsr      	r0, r3, r4
 8010c56:	6c14      	or      	r0, r5
 8010c58:	7051      	lsr      	r1, r4
 8010c5a:	1486      	pop      	r4-r9
 8010c5c:	7150      	lsl      	r5, r4
 8010c5e:	c5a14048 	lsr      	r8, r1, r13
 8010c62:	4df0      	lsri      	r7, r5, 16
 8010c64:	c5a0404d 	lsr      	r13, r0, r13
 8010c68:	7050      	lsl      	r1, r4
 8010c6a:	6c74      	or      	r1, r13
 8010c6c:	c4e8802d 	divu      	r13, r8, r7
 8010c70:	c4ed8423 	mult      	r3, r13, r7
 8010c74:	c40555e2 	zext      	r2, r5, 15, 0
 8010c78:	620e      	subu      	r8, r3
 8010c7a:	c5a2842c 	mult      	r12, r2, r13
 8010c7e:	c6084828 	lsli      	r8, r8, 16
 8010c82:	c601484d 	lsri      	r13, r1, 16
 8010c86:	6f60      	or      	r13, r8
 8010c88:	6734      	cmphs      	r13, r12
 8010c8a:	c4804026 	lsl      	r6, r0, r4
 8010c8e:	0804      	bt      	0x8010c96	// 8010c96 <__umoddi3+0x2ae>
 8010c90:	6354      	addu      	r13, r5
 8010c92:	6574      	cmphs      	r13, r5
 8010c94:	082d      	bt      	0x8010cee	// 8010cee <__umoddi3+0x306>
 8010c96:	6372      	subu      	r13, r12
 8010c98:	c4ed8023 	divu      	r3, r13, r7
 8010c9c:	c4e3842c 	mult      	r12, r3, r7
 8010ca0:	6372      	subu      	r13, r12
 8010ca2:	c60d482c 	lsli      	r12, r13, 16
 8010ca6:	c40155e1 	zext      	r1, r1, 15, 0
 8010caa:	7cc8      	mult      	r3, r2
 8010cac:	6f04      	or      	r12, r1
 8010cae:	64f0      	cmphs      	r12, r3
 8010cb0:	0809      	bt      	0x8010cc2	// 8010cc2 <__umoddi3+0x2da>
 8010cb2:	6314      	addu      	r12, r5
 8010cb4:	6570      	cmphs      	r12, r5
 8010cb6:	0c06      	bf      	0x8010cc2	// 8010cc2 <__umoddi3+0x2da>
 8010cb8:	c4ac0021 	addu      	r1, r12, r5
 8010cbc:	64f0      	cmphs      	r12, r3
 8010cbe:	c5810c20 	incf      	r12, r1, 0
 8010cc2:	630e      	subu      	r12, r3
 8010cc4:	0724      	br      	0x8010b0c	// 8010b0c <__umoddi3+0x124>
 8010cc6:	c46c0083 	subu      	r3, r12, r3
 8010cca:	64f0      	cmphs      	r12, r3
 8010ccc:	605e      	subu      	r1, r7
 8010cce:	65c3      	mvcv      	r7
 8010cd0:	605e      	subu      	r1, r7
 8010cd2:	c42d0081 	subu      	r1, r13, r1
 8010cd6:	07b8      	br      	0x8010c46	// 8010c46 <__umoddi3+0x25e>
 8010cd8:	6744      	cmphs      	r1, r13
 8010cda:	0b8c      	bt      	0x8010bf2	// 8010bf2 <__umoddi3+0x20a>
 8010cdc:	2e01      	subi      	r6, 2
 8010cde:	605c      	addu      	r1, r7
 8010ce0:	078a      	br      	0x8010bf4	// 8010bf4 <__umoddi3+0x20c>
 8010ce2:	6648      	cmphs      	r2, r9
 8010ce4:	0b76      	bt      	0x8010bd0	// 8010bd0 <__umoddi3+0x1e8>
 8010ce6:	e5081001 	subi      	r8, r8, 2
 8010cea:	609c      	addu      	r2, r7
 8010cec:	0773      	br      	0x8010bd2	// 8010bd2 <__umoddi3+0x1ea>
 8010cee:	c4ad0023 	addu      	r3, r13, r5
 8010cf2:	6734      	cmphs      	r13, r12
 8010cf4:	c5a30c20 	incf      	r13, r3, 0
 8010cf8:	07cf      	br      	0x8010c96	// 8010c96 <__umoddi3+0x2ae>
 8010cfa:	6d03      	mov      	r4, r0
 8010cfc:	06e6      	br      	0x8010ac8	// 8010ac8 <__umoddi3+0xe0>
 8010cfe:	6700      	cmphs      	r0, r12
 8010d00:	0fe3      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2de>
 8010d02:	6cf3      	mov      	r3, r12
 8010d04:	3100      	movi      	r1, 0
 8010d06:	07a0      	br      	0x8010c46	// 8010c46 <__umoddi3+0x25e>
 8010d08:	080151f4 	.long	0x080151f4

08010d0c <__extendsfdf2>:
 8010d0c:	14d0      	push      	r15
 8010d0e:	1426      	subi      	r14, r14, 24
 8010d10:	1902      	addi      	r1, r14, 8
 8010d12:	1801      	addi      	r0, r14, 4
 8010d14:	f40e2410 	fsts      	fr0, (r14, 0x4)
 8010d18:	e000049c 	bsr      	0x8011650	// 8011650 <__unpack_f>
 8010d1c:	9865      	ld.w      	r3, (r14, 0x14)
 8010d1e:	9824      	ld.w      	r1, (r14, 0x10)
 8010d20:	6f07      	mov      	r12, r1
 8010d22:	4b42      	lsri      	r2, r3, 2
 8010d24:	b840      	st.w      	r2, (r14, 0x0)
 8010d26:	9823      	ld.w      	r1, (r14, 0xc)
 8010d28:	437e      	lsli      	r3, r3, 30
 8010d2a:	6cb3      	mov      	r2, r12
 8010d2c:	9802      	ld.w      	r0, (r14, 0x8)
 8010d2e:	e000040d 	bsr      	0x8011548	// 8011548 <__make_dp>
 8010d32:	1406      	addi      	r14, r14, 24
 8010d34:	1490      	pop      	r15
	...

08010d38 <_fpadd_parts>:
 8010d38:	14c8      	push      	r4-r11
 8010d3a:	1423      	subi      	r14, r14, 12
 8010d3c:	9060      	ld.w      	r3, (r0, 0x0)
 8010d3e:	3501      	movi      	r5, 1
 8010d40:	64d4      	cmphs      	r5, r3
 8010d42:	0871      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010d44:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010d48:	6714      	cmphs      	r5, r12
 8010d4a:	086f      	bt      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d4c:	3b44      	cmpnei      	r3, 4
 8010d4e:	0cef      	bf      	0x8010f2c	// 8010f2c <_fpadd_parts+0x1f4>
 8010d50:	eb4c0004 	cmpnei      	r12, 4
 8010d54:	0c6a      	bf      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d56:	eb4c0002 	cmpnei      	r12, 2
 8010d5a:	0cc7      	bf      	0x8010ee8	// 8010ee8 <_fpadd_parts+0x1b0>
 8010d5c:	3b42      	cmpnei      	r3, 2
 8010d5e:	0c65      	bf      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d60:	9062      	ld.w      	r3, (r0, 0x8)
 8010d62:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010d66:	c583008d 	subu      	r13, r3, r12
 8010d6a:	c40d0208 	abs      	r8, r13
 8010d6e:	eb28003f 	cmplti      	r8, 64
 8010d72:	90c3      	ld.w      	r6, (r0, 0xc)
 8010d74:	90e4      	ld.w      	r7, (r0, 0x10)
 8010d76:	b8c0      	st.w      	r6, (r14, 0x0)
 8010d78:	b8e1      	st.w      	r7, (r14, 0x4)
 8010d7a:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010d7e:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010d82:	0856      	bt      	0x8010e2e	// 8010e2e <_fpadd_parts+0xf6>
 8010d84:	64f1      	cmplt      	r12, r3
 8010d86:	0cc9      	bf      	0x8010f18	// 8010f18 <_fpadd_parts+0x1e0>
 8010d88:	ea0a0000 	movi      	r10, 0
 8010d8c:	ea0b0000 	movi      	r11, 0
 8010d90:	9001      	ld.w      	r0, (r0, 0x4)
 8010d92:	9121      	ld.w      	r1, (r1, 0x4)
 8010d94:	6442      	cmpne      	r0, r1
 8010d96:	0c82      	bf      	0x8010e9a	// 8010e9a <_fpadd_parts+0x162>
 8010d98:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010d9c:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010da0:	e90000b8 	bez      	r0, 0x8010f10	// 8010f10 <_fpadd_parts+0x1d8>
 8010da4:	6730      	cmphs      	r12, r12
 8010da6:	c58a010c 	subc      	r12, r10, r12
 8010daa:	c5ab010d 	subc      	r13, r11, r13
 8010dae:	e98d00c9 	blz      	r13, 0x8010f40	// 8010f40 <_fpadd_parts+0x208>
 8010db2:	3100      	movi      	r1, 0
 8010db4:	b221      	st.w      	r1, (r2, 0x4)
 8010db6:	b262      	st.w      	r3, (r2, 0x8)
 8010db8:	dd822003 	st.w      	r12, (r2, 0xc)
 8010dbc:	dda22004 	st.w      	r13, (r2, 0x10)
 8010dc0:	6c33      	mov      	r0, r12
 8010dc2:	6c77      	mov      	r1, r13
 8010dc4:	3840      	cmpnei      	r0, 0
 8010dc6:	c4210c81 	decf      	r1, r1, 1
 8010dca:	2800      	subi      	r0, 1
 8010dcc:	c7605023 	bmaski      	r3, 28
 8010dd0:	644c      	cmphs      	r3, r1
 8010dd2:	0c71      	bf      	0x8010eb4	// 8010eb4 <_fpadd_parts+0x17c>
 8010dd4:	64c6      	cmpne      	r1, r3
 8010dd6:	0d0d      	bf      	0x8010ff0	// 8010ff0 <_fpadd_parts+0x2b8>
 8010dd8:	9262      	ld.w      	r3, (r2, 0x8)
 8010dda:	3600      	movi      	r6, 0
 8010ddc:	3700      	movi      	r7, 0
 8010dde:	ea0a0000 	movi      	r10, 0
 8010de2:	2b00      	subi      	r3, 1
 8010de4:	2e00      	subi      	r6, 1
 8010de6:	2f00      	subi      	r7, 1
 8010de8:	c7605028 	bmaski      	r8, 28
 8010dec:	e54a1001 	subi      	r10, r10, 2
 8010df0:	0403      	br      	0x8010df6	// 8010df6 <_fpadd_parts+0xbe>
 8010df2:	6606      	cmpne      	r1, r8
 8010df4:	0c8b      	bf      	0x8010f0a	// 8010f0a <_fpadd_parts+0x1d2>
 8010df6:	6511      	cmplt      	r4, r4
 8010df8:	c58c0044 	addc      	r4, r12, r12
 8010dfc:	c5ad0045 	addc      	r5, r13, r13
 8010e00:	6401      	cmplt      	r0, r0
 8010e02:	c4c40040 	addc      	r0, r4, r6
 8010e06:	c4e50041 	addc      	r1, r5, r7
 8010e0a:	6460      	cmphs      	r8, r1
 8010e0c:	6e4f      	mov      	r9, r3
 8010e0e:	6f13      	mov      	r12, r4
 8010e10:	6f57      	mov      	r13, r5
 8010e12:	2b00      	subi      	r3, 1
 8010e14:	0bef      	bt      	0x8010df2	// 8010df2 <_fpadd_parts+0xba>
 8010e16:	3303      	movi      	r3, 3
 8010e18:	b283      	st.w      	r4, (r2, 0xc)
 8010e1a:	b2a4      	st.w      	r5, (r2, 0x10)
 8010e1c:	dd222002 	st.w      	r9, (r2, 0x8)
 8010e20:	b260      	st.w      	r3, (r2, 0x0)
 8010e22:	6c0b      	mov      	r0, r2
 8010e24:	1403      	addi      	r14, r14, 12
 8010e26:	1488      	pop      	r4-r11
 8010e28:	6c07      	mov      	r0, r1
 8010e2a:	1403      	addi      	r14, r14, 12
 8010e2c:	1488      	pop      	r4-r11
 8010e2e:	e96d009a 	blsz      	r13, 0x8010f62	// 8010f62 <_fpadd_parts+0x22a>
 8010e32:	ea0d001f 	movi      	r13, 31
 8010e36:	c42b4826 	lsli      	r6, r11, 1
 8010e3a:	6362      	subu      	r13, r8
 8010e3c:	e588101f 	subi      	r12, r8, 32
 8010e40:	c5a6402d 	lsl      	r13, r6, r13
 8010e44:	c50a4046 	lsr      	r6, r10, r8
 8010e48:	c7ec2880 	btsti      	r12, 31
 8010e4c:	c58b4049 	lsr      	r9, r11, r12
 8010e50:	3400      	movi      	r4, 0
 8010e52:	6db4      	or      	r6, r13
 8010e54:	c4c90c20 	incf      	r6, r9, 0
 8010e58:	6f53      	mov      	r13, r4
 8010e5a:	c5854029 	lsl      	r9, r5, r12
 8010e5e:	c505402c 	lsl      	r12, r5, r8
 8010e62:	c50b4047 	lsr      	r7, r11, r8
 8010e66:	c5a90c20 	incf      	r13, r9, 0
 8010e6a:	c5840c20 	incf      	r12, r4, 0
 8010e6e:	c4e40c20 	incf      	r7, r4, 0
 8010e72:	eb4c0000 	cmpnei      	r12, 0
 8010e76:	c5ad0c81 	decf      	r13, r13, 1
 8010e7a:	e58c1000 	subi      	r12, r12, 1
 8010e7e:	6b28      	and      	r12, r10
 8010e80:	6b6c      	and      	r13, r11
 8010e82:	6f34      	or      	r12, r13
 8010e84:	eb4c0000 	cmpnei      	r12, 0
 8010e88:	9001      	ld.w      	r0, (r0, 0x4)
 8010e8a:	9121      	ld.w      	r1, (r1, 0x4)
 8010e8c:	c400050a 	mvc      	r10
 8010e90:	6442      	cmpne      	r0, r1
 8010e92:	6ed3      	mov      	r11, r4
 8010e94:	6e98      	or      	r10, r6
 8010e96:	6edc      	or      	r11, r7
 8010e98:	0b80      	bt      	0x8010d98	// 8010d98 <_fpadd_parts+0x60>
 8010e9a:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010e9e:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010ea2:	6731      	cmplt      	r12, r12
 8010ea4:	6329      	addc      	r12, r10
 8010ea6:	636d      	addc      	r13, r11
 8010ea8:	b201      	st.w      	r0, (r2, 0x4)
 8010eaa:	b262      	st.w      	r3, (r2, 0x8)
 8010eac:	dd822003 	st.w      	r12, (r2, 0xc)
 8010eb0:	dda22004 	st.w      	r13, (r2, 0x10)
 8010eb4:	3303      	movi      	r3, 3
 8010eb6:	b260      	st.w      	r3, (r2, 0x0)
 8010eb8:	c7805023 	bmaski      	r3, 29
 8010ebc:	674c      	cmphs      	r3, r13
 8010ebe:	0812      	bt      	0x8010ee2	// 8010ee2 <_fpadd_parts+0x1aa>
 8010ec0:	c7ed4823 	lsli      	r3, r13, 31
 8010ec4:	c42c4840 	lsri      	r0, r12, 1
 8010ec8:	6c0c      	or      	r0, r3
 8010eca:	c42d4841 	lsri      	r1, r13, 1
 8010ece:	9262      	ld.w      	r3, (r2, 0x8)
 8010ed0:	e48c2001 	andi      	r4, r12, 1
 8010ed4:	3500      	movi      	r5, 0
 8010ed6:	6c10      	or      	r0, r4
 8010ed8:	6c54      	or      	r1, r5
 8010eda:	2300      	addi      	r3, 1
 8010edc:	b203      	st.w      	r0, (r2, 0xc)
 8010ede:	b224      	st.w      	r1, (r2, 0x10)
 8010ee0:	b262      	st.w      	r3, (r2, 0x8)
 8010ee2:	6c0b      	mov      	r0, r2
 8010ee4:	1403      	addi      	r14, r14, 12
 8010ee6:	1488      	pop      	r4-r11
 8010ee8:	3b42      	cmpnei      	r3, 2
 8010eea:	0b9d      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010eec:	b260      	st.w      	r3, (r2, 0x0)
 8010eee:	9061      	ld.w      	r3, (r0, 0x4)
 8010ef0:	b261      	st.w      	r3, (r2, 0x4)
 8010ef2:	9062      	ld.w      	r3, (r0, 0x8)
 8010ef4:	b262      	st.w      	r3, (r2, 0x8)
 8010ef6:	9063      	ld.w      	r3, (r0, 0xc)
 8010ef8:	b263      	st.w      	r3, (r2, 0xc)
 8010efa:	9064      	ld.w      	r3, (r0, 0x10)
 8010efc:	9121      	ld.w      	r1, (r1, 0x4)
 8010efe:	b264      	st.w      	r3, (r2, 0x10)
 8010f00:	9061      	ld.w      	r3, (r0, 0x4)
 8010f02:	68c4      	and      	r3, r1
 8010f04:	b261      	st.w      	r3, (r2, 0x4)
 8010f06:	6c0b      	mov      	r0, r2
 8010f08:	078e      	br      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f0a:	6428      	cmphs      	r10, r0
 8010f0c:	0b75      	bt      	0x8010df6	// 8010df6 <_fpadd_parts+0xbe>
 8010f0e:	0784      	br      	0x8010e16	// 8010e16 <_fpadd_parts+0xde>
 8010f10:	6730      	cmphs      	r12, r12
 8010f12:	632b      	subc      	r12, r10
 8010f14:	636f      	subc      	r13, r11
 8010f16:	074c      	br      	0x8010dae	// 8010dae <_fpadd_parts+0x76>
 8010f18:	6cf3      	mov      	r3, r12
 8010f1a:	ea0d0000 	movi      	r13, 0
 8010f1e:	ea0c0000 	movi      	r12, 0
 8010f22:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010f26:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010f2a:	0733      	br      	0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010f2c:	eb4c0004 	cmpnei      	r12, 4
 8010f30:	0b7a      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f32:	9041      	ld.w      	r2, (r0, 0x4)
 8010f34:	9161      	ld.w      	r3, (r1, 0x4)
 8010f36:	64ca      	cmpne      	r2, r3
 8010f38:	124b      	lrw      	r2, 0x80151e0	// 8011064 <__subdf3+0x38>
 8010f3a:	c4020c40 	inct      	r0, r2, 0
 8010f3e:	0773      	br      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f40:	ea0a0000 	movi      	r10, 0
 8010f44:	ea0b0000 	movi      	r11, 0
 8010f48:	3101      	movi      	r1, 1
 8010f4a:	6730      	cmphs      	r12, r12
 8010f4c:	c58a010c 	subc      	r12, r10, r12
 8010f50:	c5ab010d 	subc      	r13, r11, r13
 8010f54:	b221      	st.w      	r1, (r2, 0x4)
 8010f56:	b262      	st.w      	r3, (r2, 0x8)
 8010f58:	dd822003 	st.w      	r12, (r2, 0xc)
 8010f5c:	dda22004 	st.w      	r13, (r2, 0x10)
 8010f60:	0730      	br      	0x8010dc0	// 8010dc0 <_fpadd_parts+0x88>
 8010f62:	e90dff17 	bez      	r13, 0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010f66:	98c0      	ld.w      	r6, (r14, 0x0)
 8010f68:	98e1      	ld.w      	r7, (r14, 0x4)
 8010f6a:	ea0d001f 	movi      	r13, 31
 8010f6e:	47c1      	lsli      	r6, r7, 1
 8010f70:	6362      	subu      	r13, r8
 8010f72:	c5a6402d 	lsl      	r13, r6, r13
 8010f76:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010f7a:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010f7e:	e588101f 	subi      	r12, r8, 32
 8010f82:	c50d4046 	lsr      	r6, r13, r8
 8010f86:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010f8a:	c7ec2880 	btsti      	r12, 31
 8010f8e:	3400      	movi      	r4, 0
 8010f90:	c5874049 	lsr      	r9, r7, r12
 8010f94:	6db4      	or      	r6, r13
 8010f96:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010f9a:	c4c90c20 	incf      	r6, r9, 0
 8010f9e:	c50d4047 	lsr      	r7, r13, r8
 8010fa2:	c5854029 	lsl      	r9, r5, r12
 8010fa6:	6f53      	mov      	r13, r4
 8010fa8:	c505402c 	lsl      	r12, r5, r8
 8010fac:	c5a90c20 	incf      	r13, r9, 0
 8010fb0:	c5840c20 	incf      	r12, r4, 0
 8010fb4:	c4e40c20 	incf      	r7, r4, 0
 8010fb8:	60e0      	addu      	r3, r8
 8010fba:	eb4c0000 	cmpnei      	r12, 0
 8010fbe:	c5ad0c81 	decf      	r13, r13, 1
 8010fc2:	e58c1000 	subi      	r12, r12, 1
 8010fc6:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8010fca:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8010fce:	6a30      	and      	r8, r12
 8010fd0:	6a74      	and      	r9, r13
 8010fd2:	6f23      	mov      	r12, r8
 8010fd4:	6f67      	mov      	r13, r9
 8010fd6:	6f34      	or      	r12, r13
 8010fd8:	eb4c0000 	cmpnei      	r12, 0
 8010fdc:	c400050c 	mvc      	r12
 8010fe0:	6f53      	mov      	r13, r4
 8010fe2:	c5862424 	or      	r4, r6, r12
 8010fe6:	c5a72425 	or      	r5, r7, r13
 8010fea:	b880      	st.w      	r4, (r14, 0x0)
 8010fec:	b8a1      	st.w      	r5, (r14, 0x4)
 8010fee:	06d1      	br      	0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010ff0:	3300      	movi      	r3, 0
 8010ff2:	2b01      	subi      	r3, 2
 8010ff4:	640c      	cmphs      	r3, r0
 8010ff6:	0af1      	bt      	0x8010dd8	// 8010dd8 <_fpadd_parts+0xa0>
 8010ff8:	075e      	br      	0x8010eb4	// 8010eb4 <_fpadd_parts+0x17c>
	...

08010ffc <__adddf3>:
 8010ffc:	14d2      	push      	r4-r5, r15
 8010ffe:	1433      	subi      	r14, r14, 76
 8011000:	b800      	st.w      	r0, (r14, 0x0)
 8011002:	b821      	st.w      	r1, (r14, 0x4)
 8011004:	6c3b      	mov      	r0, r14
 8011006:	6d47      	mov      	r5, r1
 8011008:	1904      	addi      	r1, r14, 16
 801100a:	b863      	st.w      	r3, (r14, 0xc)
 801100c:	b842      	st.w      	r2, (r14, 0x8)
 801100e:	e0000433 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011012:	1909      	addi      	r1, r14, 36
 8011014:	1802      	addi      	r0, r14, 8
 8011016:	e000042f 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801101a:	1a0e      	addi      	r2, r14, 56
 801101c:	1909      	addi      	r1, r14, 36
 801101e:	1804      	addi      	r0, r14, 16
 8011020:	e3fffe8c 	bsr      	0x8010d38	// 8010d38 <_fpadd_parts>
 8011024:	e0000360 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011028:	1413      	addi      	r14, r14, 76
 801102a:	1492      	pop      	r4-r5, r15

0801102c <__subdf3>:
 801102c:	14d2      	push      	r4-r5, r15
 801102e:	1433      	subi      	r14, r14, 76
 8011030:	b800      	st.w      	r0, (r14, 0x0)
 8011032:	b821      	st.w      	r1, (r14, 0x4)
 8011034:	6c3b      	mov      	r0, r14
 8011036:	6d47      	mov      	r5, r1
 8011038:	1904      	addi      	r1, r14, 16
 801103a:	b842      	st.w      	r2, (r14, 0x8)
 801103c:	b863      	st.w      	r3, (r14, 0xc)
 801103e:	e000041b 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011042:	1909      	addi      	r1, r14, 36
 8011044:	1802      	addi      	r0, r14, 8
 8011046:	e0000417 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801104a:	986a      	ld.w      	r3, (r14, 0x28)
 801104c:	e4634001 	xori      	r3, r3, 1
 8011050:	1a0e      	addi      	r2, r14, 56
 8011052:	1909      	addi      	r1, r14, 36
 8011054:	1804      	addi      	r0, r14, 16
 8011056:	b86a      	st.w      	r3, (r14, 0x28)
 8011058:	e3fffe70 	bsr      	0x8010d38	// 8010d38 <_fpadd_parts>
 801105c:	e0000344 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011060:	1413      	addi      	r14, r14, 76
 8011062:	1492      	pop      	r4-r5, r15
 8011064:	080151e0 	.long	0x080151e0

08011068 <__muldf3>:
 8011068:	14d8      	push      	r4-r11, r15
 801106a:	1436      	subi      	r14, r14, 88
 801106c:	b803      	st.w      	r0, (r14, 0xc)
 801106e:	b824      	st.w      	r1, (r14, 0x10)
 8011070:	1803      	addi      	r0, r14, 12
 8011072:	1907      	addi      	r1, r14, 28
 8011074:	b866      	st.w      	r3, (r14, 0x18)
 8011076:	b845      	st.w      	r2, (r14, 0x14)
 8011078:	e00003fe 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801107c:	190c      	addi      	r1, r14, 48
 801107e:	1805      	addi      	r0, r14, 20
 8011080:	e00003fa 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011084:	9867      	ld.w      	r3, (r14, 0x1c)
 8011086:	3b01      	cmphsi      	r3, 2
 8011088:	0ca4      	bf      	0x80111d0	// 80111d0 <__muldf3+0x168>
 801108a:	984c      	ld.w      	r2, (r14, 0x30)
 801108c:	3a01      	cmphsi      	r2, 2
 801108e:	0c94      	bf      	0x80111b6	// 80111b6 <__muldf3+0x14e>
 8011090:	3b44      	cmpnei      	r3, 4
 8011092:	0c9d      	bf      	0x80111cc	// 80111cc <__muldf3+0x164>
 8011094:	3a44      	cmpnei      	r2, 4
 8011096:	0c8e      	bf      	0x80111b2	// 80111b2 <__muldf3+0x14a>
 8011098:	3b42      	cmpnei      	r3, 2
 801109a:	0c9b      	bf      	0x80111d0	// 80111d0 <__muldf3+0x168>
 801109c:	3a42      	cmpnei      	r2, 2
 801109e:	0c8c      	bf      	0x80111b6	// 80111b6 <__muldf3+0x14e>
 80110a0:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 80110a4:	d90e200a 	ld.w      	r8, (r14, 0x28)
 80110a8:	3300      	movi      	r3, 0
 80110aa:	6c33      	mov      	r0, r12
 80110ac:	6ca3      	mov      	r2, r8
 80110ae:	6c4f      	mov      	r1, r3
 80110b0:	dd8e2002 	st.w      	r12, (r14, 0x8)
 80110b4:	d96e2010 	ld.w      	r11, (r14, 0x40)
 80110b8:	e00002a6 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110bc:	3300      	movi      	r3, 0
 80110be:	6ca3      	mov      	r2, r8
 80110c0:	6d83      	mov      	r6, r0
 80110c2:	6dc7      	mov      	r7, r1
 80110c4:	6c4f      	mov      	r1, r3
 80110c6:	6c2f      	mov      	r0, r11
 80110c8:	e000029e 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110cc:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 80110d0:	3300      	movi      	r3, 0
 80110d2:	6e03      	mov      	r8, r0
 80110d4:	6e47      	mov      	r9, r1
 80110d6:	6caf      	mov      	r2, r11
 80110d8:	6c4f      	mov      	r1, r3
 80110da:	6c2b      	mov      	r0, r10
 80110dc:	e0000294 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110e0:	d98e2002 	ld.w      	r12, (r14, 0x8)
 80110e4:	3300      	movi      	r3, 0
 80110e6:	b800      	st.w      	r0, (r14, 0x0)
 80110e8:	b821      	st.w      	r1, (r14, 0x4)
 80110ea:	6cb3      	mov      	r2, r12
 80110ec:	6c2b      	mov      	r0, r10
 80110ee:	6c4f      	mov      	r1, r3
 80110f0:	e000028a 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110f4:	6401      	cmplt      	r0, r0
 80110f6:	6021      	addc      	r0, r8
 80110f8:	6065      	addc      	r1, r9
 80110fa:	6644      	cmphs      	r1, r9
 80110fc:	0c80      	bf      	0x80111fc	// 80111fc <__muldf3+0x194>
 80110fe:	6466      	cmpne      	r9, r1
 8011100:	0c7c      	bf      	0x80111f8	// 80111f8 <__muldf3+0x190>
 8011102:	ea080000 	movi      	r8, 0
 8011106:	ea090000 	movi      	r9, 0
 801110a:	3200      	movi      	r2, 0
 801110c:	6cc3      	mov      	r3, r0
 801110e:	6489      	cmplt      	r2, r2
 8011110:	6099      	addc      	r2, r6
 8011112:	60dd      	addc      	r3, r7
 8011114:	65cc      	cmphs      	r3, r7
 8011116:	0c6a      	bf      	0x80111ea	// 80111ea <__muldf3+0x182>
 8011118:	64de      	cmpne      	r7, r3
 801111a:	0c66      	bf      	0x80111e6	// 80111e6 <__muldf3+0x17e>
 801111c:	6f07      	mov      	r12, r1
 801111e:	ea0d0000 	movi      	r13, 0
 8011122:	9800      	ld.w      	r0, (r14, 0x0)
 8011124:	9821      	ld.w      	r1, (r14, 0x4)
 8011126:	6401      	cmplt      	r0, r0
 8011128:	6031      	addc      	r0, r12
 801112a:	6075      	addc      	r1, r13
 801112c:	6621      	cmplt      	r8, r8
 801112e:	6201      	addc      	r8, r0
 8011130:	6245      	addc      	r9, r1
 8011132:	980e      	ld.w      	r0, (r14, 0x38)
 8011134:	9829      	ld.w      	r1, (r14, 0x24)
 8011136:	6040      	addu      	r1, r0
 8011138:	590e      	addi      	r0, r1, 4
 801113a:	b813      	st.w      	r0, (r14, 0x4c)
 801113c:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011140:	980d      	ld.w      	r0, (r14, 0x34)
 8011142:	6432      	cmpne      	r12, r0
 8011144:	c780502a 	bmaski      	r10, 29
 8011148:	c4000500 	mvc      	r0
 801114c:	6668      	cmphs      	r10, r9
 801114e:	b812      	st.w      	r0, (r14, 0x48)
 8011150:	086f      	bt      	0x801122e	// 801122e <__muldf3+0x1c6>
 8011152:	2104      	addi      	r1, 5
 8011154:	ea0c0000 	movi      	r12, 0
 8011158:	ea2d8000 	movih      	r13, 32768
 801115c:	e4082001 	andi      	r0, r8, 1
 8011160:	6ec7      	mov      	r11, r1
 8011162:	e900000a 	bez      	r0, 0x8011176	// 8011176 <__muldf3+0x10e>
 8011166:	431f      	lsli      	r0, r3, 31
 8011168:	4a81      	lsri      	r4, r2, 1
 801116a:	6d00      	or      	r4, r0
 801116c:	4ba1      	lsri      	r5, r3, 1
 801116e:	c5842422 	or      	r2, r4, r12
 8011172:	c5a52423 	or      	r3, r5, r13
 8011176:	c4294840 	lsri      	r0, r9, 1
 801117a:	6428      	cmphs      	r10, r0
 801117c:	c7e94827 	lsli      	r7, r9, 31
 8011180:	c4284846 	lsri      	r6, r8, 1
 8011184:	c4c72428 	or      	r8, r7, r6
 8011188:	6e43      	mov      	r9, r0
 801118a:	2100      	addi      	r1, 1
 801118c:	0fe8      	bf      	0x801115c	// 801115c <__muldf3+0xf4>
 801118e:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 8011192:	e42820ff 	andi      	r1, r8, 255
 8011196:	eb410080 	cmpnei      	r1, 128
 801119a:	0c36      	bf      	0x8011206	// 8011206 <__muldf3+0x19e>
 801119c:	3303      	movi      	r3, 3
 801119e:	dd0e2014 	st.w      	r8, (r14, 0x50)
 80111a2:	dd2e2015 	st.w      	r9, (r14, 0x54)
 80111a6:	b871      	st.w      	r3, (r14, 0x44)
 80111a8:	1811      	addi      	r0, r14, 68
 80111aa:	e000029d 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111ae:	1416      	addi      	r14, r14, 88
 80111b0:	1498      	pop      	r4-r11, r15
 80111b2:	3b42      	cmpnei      	r3, 2
 80111b4:	0c3b      	bf      	0x801122a	// 801122a <__muldf3+0x1c2>
 80111b6:	986d      	ld.w      	r3, (r14, 0x34)
 80111b8:	9848      	ld.w      	r2, (r14, 0x20)
 80111ba:	64ca      	cmpne      	r2, r3
 80111bc:	c4000503 	mvc      	r3
 80111c0:	180c      	addi      	r0, r14, 48
 80111c2:	b86d      	st.w      	r3, (r14, 0x34)
 80111c4:	e0000290 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111c8:	1416      	addi      	r14, r14, 88
 80111ca:	1498      	pop      	r4-r11, r15
 80111cc:	3a42      	cmpnei      	r2, 2
 80111ce:	0c2e      	bf      	0x801122a	// 801122a <__muldf3+0x1c2>
 80111d0:	9848      	ld.w      	r2, (r14, 0x20)
 80111d2:	986d      	ld.w      	r3, (r14, 0x34)
 80111d4:	64ca      	cmpne      	r2, r3
 80111d6:	c4000503 	mvc      	r3
 80111da:	1807      	addi      	r0, r14, 28
 80111dc:	b868      	st.w      	r3, (r14, 0x20)
 80111de:	e0000283 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111e2:	1416      	addi      	r14, r14, 88
 80111e4:	1498      	pop      	r4-r11, r15
 80111e6:	6588      	cmphs      	r2, r6
 80111e8:	0b9a      	bt      	0x801111c	// 801111c <__muldf3+0xb4>
 80111ea:	e5080000 	addi      	r8, r8, 1
 80111ee:	eb480000 	cmpnei      	r8, 0
 80111f2:	c5290c21 	incf      	r9, r9, 1
 80111f6:	0793      	br      	0x801111c	// 801111c <__muldf3+0xb4>
 80111f8:	6600      	cmphs      	r0, r8
 80111fa:	0b84      	bt      	0x8011102	// 8011102 <__muldf3+0x9a>
 80111fc:	ea080000 	movi      	r8, 0
 8011200:	ea090001 	movi      	r9, 1
 8011204:	0783      	br      	0x801110a	// 801110a <__muldf3+0xa2>
 8011206:	e4282100 	andi      	r1, r8, 256
 801120a:	e921ffc9 	bnez      	r1, 0x801119c	// 801119c <__muldf3+0x134>
 801120e:	6c8c      	or      	r2, r3
 8011210:	e902ffc6 	bez      	r2, 0x801119c	// 801119c <__muldf3+0x134>
 8011214:	3280      	movi      	r2, 128
 8011216:	3300      	movi      	r3, 0
 8011218:	3100      	movi      	r1, 0
 801121a:	6489      	cmplt      	r2, r2
 801121c:	60a1      	addc      	r2, r8
 801121e:	60e5      	addc      	r3, r9
 8011220:	29ff      	subi      	r1, 256
 8011222:	c4222028 	and      	r8, r2, r1
 8011226:	6e4f      	mov      	r9, r3
 8011228:	07ba      	br      	0x801119c	// 801119c <__muldf3+0x134>
 801122a:	100f      	lrw      	r0, 0x80151e0	// 8011264 <__muldf3+0x1fc>
 801122c:	07bf      	br      	0x80111aa	// 80111aa <__muldf3+0x142>
 801122e:	c760502c 	bmaski      	r12, 28
 8011232:	6670      	cmphs      	r12, r9
 8011234:	0faf      	bf      	0x8011192	// 8011192 <__muldf3+0x12a>
 8011236:	2102      	addi      	r1, 3
 8011238:	3401      	movi      	r4, 1
 801123a:	3500      	movi      	r5, 0
 801123c:	6da3      	mov      	r6, r8
 801123e:	6de7      	mov      	r7, r9
 8011240:	6c07      	mov      	r0, r1
 8011242:	6621      	cmplt      	r8, r8
 8011244:	6219      	addc      	r8, r6
 8011246:	625d      	addc      	r9, r7
 8011248:	e9a30004 	bhsz      	r3, 0x8011250	// 8011250 <__muldf3+0x1e8>
 801124c:	6e10      	or      	r8, r4
 801124e:	6e54      	or      	r9, r5
 8011250:	6d8b      	mov      	r6, r2
 8011252:	6dcf      	mov      	r7, r3
 8011254:	6489      	cmplt      	r2, r2
 8011256:	6099      	addc      	r2, r6
 8011258:	60dd      	addc      	r3, r7
 801125a:	6670      	cmphs      	r12, r9
 801125c:	2900      	subi      	r1, 1
 801125e:	0bef      	bt      	0x801123c	// 801123c <__muldf3+0x1d4>
 8011260:	b813      	st.w      	r0, (r14, 0x4c)
 8011262:	0798      	br      	0x8011192	// 8011192 <__muldf3+0x12a>
 8011264:	080151e0 	.long	0x080151e0

08011268 <__divdf3>:
 8011268:	14d6      	push      	r4-r9, r15
 801126a:	142e      	subi      	r14, r14, 56
 801126c:	b800      	st.w      	r0, (r14, 0x0)
 801126e:	b821      	st.w      	r1, (r14, 0x4)
 8011270:	6c3b      	mov      	r0, r14
 8011272:	1904      	addi      	r1, r14, 16
 8011274:	b863      	st.w      	r3, (r14, 0xc)
 8011276:	b842      	st.w      	r2, (r14, 0x8)
 8011278:	e00002fe 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801127c:	1909      	addi      	r1, r14, 36
 801127e:	1802      	addi      	r0, r14, 8
 8011280:	e00002fa 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011284:	9864      	ld.w      	r3, (r14, 0x10)
 8011286:	3b01      	cmphsi      	r3, 2
 8011288:	0c51      	bf      	0x801132a	// 801132a <__divdf3+0xc2>
 801128a:	9829      	ld.w      	r1, (r14, 0x24)
 801128c:	3201      	movi      	r2, 1
 801128e:	6448      	cmphs      	r2, r1
 8011290:	0873      	bt      	0x8011376	// 8011376 <__divdf3+0x10e>
 8011292:	9845      	ld.w      	r2, (r14, 0x14)
 8011294:	980a      	ld.w      	r0, (r14, 0x28)
 8011296:	3b44      	cmpnei      	r3, 4
 8011298:	6c81      	xor      	r2, r0
 801129a:	b845      	st.w      	r2, (r14, 0x14)
 801129c:	0c4c      	bf      	0x8011334	// 8011334 <__divdf3+0xcc>
 801129e:	3b42      	cmpnei      	r3, 2
 80112a0:	0c4a      	bf      	0x8011334	// 8011334 <__divdf3+0xcc>
 80112a2:	3944      	cmpnei      	r1, 4
 80112a4:	0c4c      	bf      	0x801133c	// 801133c <__divdf3+0xd4>
 80112a6:	3942      	cmpnei      	r1, 2
 80112a8:	0c63      	bf      	0x801136e	// 801136e <__divdf3+0x106>
 80112aa:	9807      	ld.w      	r0, (r14, 0x1c)
 80112ac:	9828      	ld.w      	r1, (r14, 0x20)
 80112ae:	98cc      	ld.w      	r6, (r14, 0x30)
 80112b0:	98ed      	ld.w      	r7, (r14, 0x34)
 80112b2:	9866      	ld.w      	r3, (r14, 0x18)
 80112b4:	984b      	ld.w      	r2, (r14, 0x2c)
 80112b6:	65c4      	cmphs      	r1, r7
 80112b8:	60ca      	subu      	r3, r2
 80112ba:	b866      	st.w      	r3, (r14, 0x18)
 80112bc:	0c05      	bf      	0x80112c6	// 80112c6 <__divdf3+0x5e>
 80112be:	645e      	cmpne      	r7, r1
 80112c0:	080a      	bt      	0x80112d4	// 80112d4 <__divdf3+0x6c>
 80112c2:	6580      	cmphs      	r0, r6
 80112c4:	0808      	bt      	0x80112d4	// 80112d4 <__divdf3+0x6c>
 80112c6:	6f03      	mov      	r12, r0
 80112c8:	6f47      	mov      	r13, r1
 80112ca:	2b00      	subi      	r3, 1
 80112cc:	6401      	cmplt      	r0, r0
 80112ce:	6031      	addc      	r0, r12
 80112d0:	6075      	addc      	r1, r13
 80112d2:	b866      	st.w      	r3, (r14, 0x18)
 80112d4:	ea0c003d 	movi      	r12, 61
 80112d8:	3400      	movi      	r4, 0
 80112da:	3500      	movi      	r5, 0
 80112dc:	3200      	movi      	r2, 0
 80112de:	ea231000 	movih      	r3, 4096
 80112e2:	65c4      	cmphs      	r1, r7
 80112e4:	0c0a      	bf      	0x80112f8	// 80112f8 <__divdf3+0x90>
 80112e6:	645e      	cmpne      	r7, r1
 80112e8:	0803      	bt      	0x80112ee	// 80112ee <__divdf3+0x86>
 80112ea:	6580      	cmphs      	r0, r6
 80112ec:	0c06      	bf      	0x80112f8	// 80112f8 <__divdf3+0x90>
 80112ee:	6d08      	or      	r4, r2
 80112f0:	6d4c      	or      	r5, r3
 80112f2:	6400      	cmphs      	r0, r0
 80112f4:	601b      	subc      	r0, r6
 80112f6:	605f      	subc      	r1, r7
 80112f8:	c7e34829 	lsli      	r9, r3, 31
 80112fc:	c4224848 	lsri      	r8, r2, 1
 8011300:	c423484d 	lsri      	r13, r3, 1
 8011304:	c5092422 	or      	r2, r9, r8
 8011308:	e58c1000 	subi      	r12, r12, 1
 801130c:	6e03      	mov      	r8, r0
 801130e:	6e47      	mov      	r9, r1
 8011310:	6cf7      	mov      	r3, r13
 8011312:	6401      	cmplt      	r0, r0
 8011314:	6021      	addc      	r0, r8
 8011316:	6065      	addc      	r1, r9
 8011318:	e92cffe5 	bnez      	r12, 0x80112e2	// 80112e2 <__divdf3+0x7a>
 801131c:	e46420ff 	andi      	r3, r4, 255
 8011320:	eb430080 	cmpnei      	r3, 128
 8011324:	0c13      	bf      	0x801134a	// 801134a <__divdf3+0xe2>
 8011326:	b887      	st.w      	r4, (r14, 0x1c)
 8011328:	b8a8      	st.w      	r5, (r14, 0x20)
 801132a:	1804      	addi      	r0, r14, 16
 801132c:	e00001dc 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011330:	140e      	addi      	r14, r14, 56
 8011332:	1496      	pop      	r4-r9, r15
 8011334:	644e      	cmpne      	r3, r1
 8011336:	0bfa      	bt      	0x801132a	// 801132a <__divdf3+0xc2>
 8011338:	1011      	lrw      	r0, 0x80151e0	// 801137c <__divdf3+0x114>
 801133a:	07f9      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801133c:	3300      	movi      	r3, 0
 801133e:	3400      	movi      	r4, 0
 8011340:	b867      	st.w      	r3, (r14, 0x1c)
 8011342:	b888      	st.w      	r4, (r14, 0x20)
 8011344:	b866      	st.w      	r3, (r14, 0x18)
 8011346:	1804      	addi      	r0, r14, 16
 8011348:	07f2      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801134a:	e4642100 	andi      	r3, r4, 256
 801134e:	e923ffec 	bnez      	r3, 0x8011326	// 8011326 <__divdf3+0xbe>
 8011352:	6c04      	or      	r0, r1
 8011354:	e900ffe9 	bez      	r0, 0x8011326	// 8011326 <__divdf3+0xbe>
 8011358:	3280      	movi      	r2, 128
 801135a:	3300      	movi      	r3, 0
 801135c:	3100      	movi      	r1, 0
 801135e:	6489      	cmplt      	r2, r2
 8011360:	6091      	addc      	r2, r4
 8011362:	60d5      	addc      	r3, r5
 8011364:	29ff      	subi      	r1, 256
 8011366:	c4222024 	and      	r4, r2, r1
 801136a:	6d4f      	mov      	r5, r3
 801136c:	07dd      	br      	0x8011326	// 8011326 <__divdf3+0xbe>
 801136e:	3304      	movi      	r3, 4
 8011370:	b864      	st.w      	r3, (r14, 0x10)
 8011372:	1804      	addi      	r0, r14, 16
 8011374:	07dc      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 8011376:	1809      	addi      	r0, r14, 36
 8011378:	07da      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801137a:	0000      	.short	0x0000
 801137c:	080151e0 	.long	0x080151e0

08011380 <__nedf2>:
 8011380:	14d2      	push      	r4-r5, r15
 8011382:	142e      	subi      	r14, r14, 56
 8011384:	b800      	st.w      	r0, (r14, 0x0)
 8011386:	b821      	st.w      	r1, (r14, 0x4)
 8011388:	6c3b      	mov      	r0, r14
 801138a:	6d47      	mov      	r5, r1
 801138c:	1904      	addi      	r1, r14, 16
 801138e:	b863      	st.w      	r3, (r14, 0xc)
 8011390:	b842      	st.w      	r2, (r14, 0x8)
 8011392:	e0000271 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011396:	1802      	addi      	r0, r14, 8
 8011398:	1909      	addi      	r1, r14, 36
 801139a:	e000026d 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801139e:	9864      	ld.w      	r3, (r14, 0x10)
 80113a0:	3001      	movi      	r0, 1
 80113a2:	64c0      	cmphs      	r0, r3
 80113a4:	0808      	bt      	0x80113b4	// 80113b4 <__nedf2+0x34>
 80113a6:	9869      	ld.w      	r3, (r14, 0x24)
 80113a8:	64c0      	cmphs      	r0, r3
 80113aa:	0805      	bt      	0x80113b4	// 80113b4 <__nedf2+0x34>
 80113ac:	1909      	addi      	r1, r14, 36
 80113ae:	1804      	addi      	r0, r14, 16
 80113b0:	e00002d4 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 80113b4:	140e      	addi      	r14, r14, 56
 80113b6:	1492      	pop      	r4-r5, r15

080113b8 <__gtdf2>:
 80113b8:	14d2      	push      	r4-r5, r15
 80113ba:	142e      	subi      	r14, r14, 56
 80113bc:	b800      	st.w      	r0, (r14, 0x0)
 80113be:	b821      	st.w      	r1, (r14, 0x4)
 80113c0:	6c3b      	mov      	r0, r14
 80113c2:	6d47      	mov      	r5, r1
 80113c4:	1904      	addi      	r1, r14, 16
 80113c6:	b842      	st.w      	r2, (r14, 0x8)
 80113c8:	b863      	st.w      	r3, (r14, 0xc)
 80113ca:	e0000255 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80113ce:	1909      	addi      	r1, r14, 36
 80113d0:	1802      	addi      	r0, r14, 8
 80113d2:	e0000251 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80113d6:	9844      	ld.w      	r2, (r14, 0x10)
 80113d8:	3301      	movi      	r3, 1
 80113da:	648c      	cmphs      	r3, r2
 80113dc:	080a      	bt      	0x80113f0	// 80113f0 <__gtdf2+0x38>
 80113de:	9849      	ld.w      	r2, (r14, 0x24)
 80113e0:	648c      	cmphs      	r3, r2
 80113e2:	0807      	bt      	0x80113f0	// 80113f0 <__gtdf2+0x38>
 80113e4:	1909      	addi      	r1, r14, 36
 80113e6:	1804      	addi      	r0, r14, 16
 80113e8:	e00002b8 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 80113ec:	140e      	addi      	r14, r14, 56
 80113ee:	1492      	pop      	r4-r5, r15
 80113f0:	3000      	movi      	r0, 0
 80113f2:	2800      	subi      	r0, 1
 80113f4:	140e      	addi      	r14, r14, 56
 80113f6:	1492      	pop      	r4-r5, r15

080113f8 <__gedf2>:
 80113f8:	14d2      	push      	r4-r5, r15
 80113fa:	142e      	subi      	r14, r14, 56
 80113fc:	b800      	st.w      	r0, (r14, 0x0)
 80113fe:	b821      	st.w      	r1, (r14, 0x4)
 8011400:	6c3b      	mov      	r0, r14
 8011402:	6d47      	mov      	r5, r1
 8011404:	1904      	addi      	r1, r14, 16
 8011406:	b842      	st.w      	r2, (r14, 0x8)
 8011408:	b863      	st.w      	r3, (r14, 0xc)
 801140a:	e0000235 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801140e:	1909      	addi      	r1, r14, 36
 8011410:	1802      	addi      	r0, r14, 8
 8011412:	e0000231 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011416:	9844      	ld.w      	r2, (r14, 0x10)
 8011418:	3301      	movi      	r3, 1
 801141a:	648c      	cmphs      	r3, r2
 801141c:	080a      	bt      	0x8011430	// 8011430 <__gedf2+0x38>
 801141e:	9849      	ld.w      	r2, (r14, 0x24)
 8011420:	648c      	cmphs      	r3, r2
 8011422:	0807      	bt      	0x8011430	// 8011430 <__gedf2+0x38>
 8011424:	1909      	addi      	r1, r14, 36
 8011426:	1804      	addi      	r0, r14, 16
 8011428:	e0000298 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 801142c:	140e      	addi      	r14, r14, 56
 801142e:	1492      	pop      	r4-r5, r15
 8011430:	3000      	movi      	r0, 0
 8011432:	2800      	subi      	r0, 1
 8011434:	140e      	addi      	r14, r14, 56
 8011436:	1492      	pop      	r4-r5, r15

08011438 <__ltdf2>:
 8011438:	14d2      	push      	r4-r5, r15
 801143a:	142e      	subi      	r14, r14, 56
 801143c:	b800      	st.w      	r0, (r14, 0x0)
 801143e:	b821      	st.w      	r1, (r14, 0x4)
 8011440:	6c3b      	mov      	r0, r14
 8011442:	6d47      	mov      	r5, r1
 8011444:	1904      	addi      	r1, r14, 16
 8011446:	b863      	st.w      	r3, (r14, 0xc)
 8011448:	b842      	st.w      	r2, (r14, 0x8)
 801144a:	e0000215 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801144e:	1802      	addi      	r0, r14, 8
 8011450:	1909      	addi      	r1, r14, 36
 8011452:	e0000211 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011456:	9864      	ld.w      	r3, (r14, 0x10)
 8011458:	3001      	movi      	r0, 1
 801145a:	64c0      	cmphs      	r0, r3
 801145c:	0808      	bt      	0x801146c	// 801146c <__ltdf2+0x34>
 801145e:	9869      	ld.w      	r3, (r14, 0x24)
 8011460:	64c0      	cmphs      	r0, r3
 8011462:	0805      	bt      	0x801146c	// 801146c <__ltdf2+0x34>
 8011464:	1909      	addi      	r1, r14, 36
 8011466:	1804      	addi      	r0, r14, 16
 8011468:	e0000278 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 801146c:	140e      	addi      	r14, r14, 56
 801146e:	1492      	pop      	r4-r5, r15

08011470 <__floatsidf>:
 8011470:	14d0      	push      	r15
 8011472:	1425      	subi      	r14, r14, 20
 8011474:	3303      	movi      	r3, 3
 8011476:	b860      	st.w      	r3, (r14, 0x0)
 8011478:	487f      	lsri      	r3, r0, 31
 801147a:	b861      	st.w      	r3, (r14, 0x4)
 801147c:	e9200009 	bnez      	r0, 0x801148e	// 801148e <__floatsidf+0x1e>
 8011480:	3302      	movi      	r3, 2
 8011482:	b860      	st.w      	r3, (r14, 0x0)
 8011484:	6c3b      	mov      	r0, r14
 8011486:	e000012f 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 801148a:	1405      	addi      	r14, r14, 20
 801148c:	1490      	pop      	r15
 801148e:	e9a00008 	bhsz      	r0, 0x801149e	// 801149e <__floatsidf+0x2e>
 8011492:	ea238000 	movih      	r3, 32768
 8011496:	64c2      	cmpne      	r0, r3
 8011498:	0c1c      	bf      	0x80114d0	// 80114d0 <__floatsidf+0x60>
 801149a:	3300      	movi      	r3, 0
 801149c:	5b01      	subu      	r0, r3, r0
 801149e:	c4007c42 	ff1      	r2, r0
 80114a2:	e422001c 	addi      	r1, r2, 29
 80114a6:	ea0c001f 	movi      	r12, 31
 80114aa:	2a02      	subi      	r2, 3
 80114ac:	4861      	lsri      	r3, r0, 1
 80114ae:	6306      	subu      	r12, r1
 80114b0:	c440402d 	lsl      	r13, r0, r2
 80114b4:	3adf      	btsti      	r2, 31
 80114b6:	70f1      	lsr      	r3, r12
 80114b8:	c46d0c20 	incf      	r3, r13, 0
 80114bc:	7004      	lsl      	r0, r1
 80114be:	b864      	st.w      	r3, (r14, 0x10)
 80114c0:	3300      	movi      	r3, 0
 80114c2:	c4030c20 	incf      	r0, r3, 0
 80114c6:	333c      	movi      	r3, 60
 80114c8:	60c6      	subu      	r3, r1
 80114ca:	b803      	st.w      	r0, (r14, 0xc)
 80114cc:	b862      	st.w      	r3, (r14, 0x8)
 80114ce:	07db      	br      	0x8011484	// 8011484 <__floatsidf+0x14>
 80114d0:	3000      	movi      	r0, 0
 80114d2:	ea21c1e0 	movih      	r1, 49632
 80114d6:	07da      	br      	0x801148a	// 801148a <__floatsidf+0x1a>

080114d8 <__fixdfsi>:
 80114d8:	14d0      	push      	r15
 80114da:	1427      	subi      	r14, r14, 28
 80114dc:	b800      	st.w      	r0, (r14, 0x0)
 80114de:	b821      	st.w      	r1, (r14, 0x4)
 80114e0:	6c3b      	mov      	r0, r14
 80114e2:	1902      	addi      	r1, r14, 8
 80114e4:	e00001c8 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80114e8:	9862      	ld.w      	r3, (r14, 0x8)
 80114ea:	3202      	movi      	r2, 2
 80114ec:	64c8      	cmphs      	r2, r3
 80114ee:	082a      	bt      	0x8011542	// 8011542 <__fixdfsi+0x6a>
 80114f0:	3b44      	cmpnei      	r3, 4
 80114f2:	0c06      	bf      	0x80114fe	// 80114fe <__fixdfsi+0x26>
 80114f4:	9804      	ld.w      	r0, (r14, 0x10)
 80114f6:	e9800026 	blz      	r0, 0x8011542	// 8011542 <__fixdfsi+0x6a>
 80114fa:	383e      	cmplti      	r0, 31
 80114fc:	080a      	bt      	0x8011510	// 8011510 <__fixdfsi+0x38>
 80114fe:	9863      	ld.w      	r3, (r14, 0xc)
 8011500:	3b40      	cmpnei      	r3, 0
 8011502:	c4000500 	mvc      	r0
 8011506:	c7c05023 	bmaski      	r3, 31
 801150a:	600c      	addu      	r0, r3
 801150c:	1407      	addi      	r14, r14, 28
 801150e:	1490      	pop      	r15
 8011510:	323c      	movi      	r2, 60
 8011512:	5a21      	subu      	r1, r2, r0
 8011514:	e581101f 	subi      	r12, r1, 32
 8011518:	9866      	ld.w      	r3, (r14, 0x18)
 801151a:	321f      	movi      	r2, 31
 801151c:	c5834040 	lsr      	r0, r3, r12
 8011520:	6086      	subu      	r2, r1
 8011522:	4361      	lsli      	r3, r3, 1
 8011524:	70c8      	lsl      	r3, r2
 8011526:	9845      	ld.w      	r2, (r14, 0x14)
 8011528:	7085      	lsr      	r2, r1
 801152a:	6c8c      	or      	r2, r3
 801152c:	9863      	ld.w      	r3, (r14, 0xc)
 801152e:	c7ec2880 	btsti      	r12, 31
 8011532:	c4020c40 	inct      	r0, r2, 0
 8011536:	e903ffeb 	bez      	r3, 0x801150c	// 801150c <__fixdfsi+0x34>
 801153a:	3300      	movi      	r3, 0
 801153c:	5b01      	subu      	r0, r3, r0
 801153e:	1407      	addi      	r14, r14, 28
 8011540:	1490      	pop      	r15
 8011542:	3000      	movi      	r0, 0
 8011544:	1407      	addi      	r14, r14, 28
 8011546:	1490      	pop      	r15

08011548 <__make_dp>:
 8011548:	1421      	subi      	r14, r14, 4
 801154a:	14d0      	push      	r15
 801154c:	1425      	subi      	r14, r14, 20
 801154e:	b866      	st.w      	r3, (r14, 0x18)
 8011550:	d98e2006 	ld.w      	r12, (r14, 0x18)
 8011554:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 8011558:	b800      	st.w      	r0, (r14, 0x0)
 801155a:	6c3b      	mov      	r0, r14
 801155c:	b821      	st.w      	r1, (r14, 0x4)
 801155e:	b842      	st.w      	r2, (r14, 0x8)
 8011560:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8011564:	ddae2004 	st.w      	r13, (r14, 0x10)
 8011568:	e00000be 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 801156c:	1405      	addi      	r14, r14, 20
 801156e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011572:	1402      	addi      	r14, r14, 8
 8011574:	783c      	jmp      	r15
	...

08011578 <__truncdfsf2>:
 8011578:	14d0      	push      	r15
 801157a:	1427      	subi      	r14, r14, 28
 801157c:	b800      	st.w      	r0, (r14, 0x0)
 801157e:	b821      	st.w      	r1, (r14, 0x4)
 8011580:	6c3b      	mov      	r0, r14
 8011582:	1902      	addi      	r1, r14, 8
 8011584:	e0000178 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011588:	9845      	ld.w      	r2, (r14, 0x14)
 801158a:	4a3e      	lsri      	r1, r2, 30
 801158c:	9866      	ld.w      	r3, (r14, 0x18)
 801158e:	c40257a2 	zext      	r2, r2, 29, 0
 8011592:	4362      	lsli      	r3, r3, 2
 8011594:	6cc4      	or      	r3, r1
 8011596:	e9020004 	bez      	r2, 0x801159e	// 801159e <__truncdfsf2+0x26>
 801159a:	ec630001 	ori      	r3, r3, 1
 801159e:	9844      	ld.w      	r2, (r14, 0x10)
 80115a0:	9823      	ld.w      	r1, (r14, 0xc)
 80115a2:	9802      	ld.w      	r0, (r14, 0x8)
 80115a4:	e0000094 	bsr      	0x80116cc	// 80116cc <__make_fp>
 80115a8:	1407      	addi      	r14, r14, 28
 80115aa:	1490      	pop      	r15

080115ac <__floatunsidf>:
 80115ac:	14d1      	push      	r4, r15
 80115ae:	1425      	subi      	r14, r14, 20
 80115b0:	3100      	movi      	r1, 0
 80115b2:	b821      	st.w      	r1, (r14, 0x4)
 80115b4:	e9000020 	bez      	r0, 0x80115f4	// 80115f4 <__floatunsidf+0x48>
 80115b8:	c4007c42 	ff1      	r2, r0
 80115bc:	e582001c 	addi      	r12, r2, 29
 80115c0:	3303      	movi      	r3, 3
 80115c2:	ea0d001f 	movi      	r13, 31
 80115c6:	2a02      	subi      	r2, 3
 80115c8:	b860      	st.w      	r3, (r14, 0x0)
 80115ca:	6372      	subu      	r13, r12
 80115cc:	4861      	lsri      	r3, r0, 1
 80115ce:	c4404024 	lsl      	r4, r0, r2
 80115d2:	3adf      	btsti      	r2, 31
 80115d4:	70f5      	lsr      	r3, r13
 80115d6:	c4640c20 	incf      	r3, r4, 0
 80115da:	7030      	lsl      	r0, r12
 80115dc:	c4010c20 	incf      	r0, r1, 0
 80115e0:	b864      	st.w      	r3, (r14, 0x10)
 80115e2:	333c      	movi      	r3, 60
 80115e4:	b803      	st.w      	r0, (r14, 0xc)
 80115e6:	60f2      	subu      	r3, r12
 80115e8:	6c3b      	mov      	r0, r14
 80115ea:	b862      	st.w      	r3, (r14, 0x8)
 80115ec:	e000007c 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80115f0:	1405      	addi      	r14, r14, 20
 80115f2:	1491      	pop      	r4, r15
 80115f4:	3302      	movi      	r3, 2
 80115f6:	6c3b      	mov      	r0, r14
 80115f8:	b860      	st.w      	r3, (r14, 0x0)
 80115fa:	e0000075 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80115fe:	1405      	addi      	r14, r14, 20
 8011600:	1491      	pop      	r4, r15
	...

08011604 <__muldi3>:
 8011604:	14c3      	push      	r4-r6
 8011606:	c602484d 	lsri      	r13, r2, 16
 801160a:	c40055ec 	zext      	r12, r0, 15, 0
 801160e:	4890      	lsri      	r4, r0, 16
 8011610:	c40255e5 	zext      	r5, r2, 15, 0
 8011614:	c4ac8426 	mult      	r6, r12, r5
 8011618:	7d50      	mult      	r5, r4
 801161a:	7f34      	mult      	r12, r13
 801161c:	7d34      	mult      	r4, r13
 801161e:	c4ac002d 	addu      	r13, r12, r5
 8011622:	c606484c 	lsri      	r12, r6, 16
 8011626:	6334      	addu      	r12, r13
 8011628:	6570      	cmphs      	r12, r5
 801162a:	0804      	bt      	0x8011632	// 8011632 <__muldi3+0x2e>
 801162c:	ea2d0001 	movih      	r13, 1
 8011630:	6134      	addu      	r4, r13
 8011632:	c60c484d 	lsri      	r13, r12, 16
 8011636:	7cc0      	mult      	r3, r0
 8011638:	7c48      	mult      	r1, r2
 801163a:	6134      	addu      	r4, r13
 801163c:	c60c482c 	lsli      	r12, r12, 16
 8011640:	c40655e6 	zext      	r6, r6, 15, 0
 8011644:	604c      	addu      	r1, r3
 8011646:	c4cc0020 	addu      	r0, r12, r6
 801164a:	6050      	addu      	r1, r4
 801164c:	1483      	pop      	r4-r6
	...

08011650 <__unpack_f>:
 8011650:	8841      	ld.h      	r2, (r0, 0x2)
 8011652:	9060      	ld.w      	r3, (r0, 0x0)
 8011654:	c4e255c2 	zext      	r2, r2, 14, 7
 8011658:	8003      	ld.b      	r0, (r0, 0x3)
 801165a:	4807      	lsri      	r0, r0, 7
 801165c:	c40356c3 	zext      	r3, r3, 22, 0
 8011660:	b101      	st.w      	r0, (r1, 0x4)
 8011662:	e9220013 	bnez      	r2, 0x8011688	// 8011688 <__unpack_f+0x38>
 8011666:	e903001c 	bez      	r3, 0x801169e	// 801169e <__unpack_f+0x4e>
 801166a:	3203      	movi      	r2, 3
 801166c:	b140      	st.w      	r2, (r1, 0x0)
 801166e:	3200      	movi      	r2, 0
 8011670:	4367      	lsli      	r3, r3, 7
 8011672:	2a7e      	subi      	r2, 127
 8011674:	c7a0502c 	bmaski      	r12, 30
 8011678:	60cc      	addu      	r3, r3
 801167a:	64f0      	cmphs      	r12, r3
 801167c:	6c0b      	mov      	r0, r2
 801167e:	2a00      	subi      	r2, 1
 8011680:	0bfc      	bt      	0x8011678	// 8011678 <__unpack_f+0x28>
 8011682:	b102      	st.w      	r0, (r1, 0x8)
 8011684:	b163      	st.w      	r3, (r1, 0xc)
 8011686:	783c      	jmp      	r15
 8011688:	eb4200ff 	cmpnei      	r2, 255
 801168c:	0c0c      	bf      	0x80116a4	// 80116a4 <__unpack_f+0x54>
 801168e:	2a7e      	subi      	r2, 127
 8011690:	4367      	lsli      	r3, r3, 7
 8011692:	b142      	st.w      	r2, (r1, 0x8)
 8011694:	3bbe      	bseti      	r3, 30
 8011696:	3203      	movi      	r2, 3
 8011698:	b140      	st.w      	r2, (r1, 0x0)
 801169a:	b163      	st.w      	r3, (r1, 0xc)
 801169c:	783c      	jmp      	r15
 801169e:	3302      	movi      	r3, 2
 80116a0:	b160      	st.w      	r3, (r1, 0x0)
 80116a2:	783c      	jmp      	r15
 80116a4:	e903000f 	bez      	r3, 0x80116c2	// 80116c2 <__unpack_f+0x72>
 80116a8:	ea220040 	movih      	r2, 64
 80116ac:	688c      	and      	r2, r3
 80116ae:	3a40      	cmpnei      	r2, 0
 80116b0:	3001      	movi      	r0, 1
 80116b2:	c4400c40 	inct      	r2, r0, 0
 80116b6:	b140      	st.w      	r2, (r1, 0x0)
 80116b8:	4367      	lsli      	r3, r3, 7
 80116ba:	1044      	lrw      	r2, 0xdfffff80	// 80116c8 <__unpack_f+0x78>
 80116bc:	68c8      	and      	r3, r2
 80116be:	b163      	st.w      	r3, (r1, 0xc)
 80116c0:	07ee      	br      	0x801169c	// 801169c <__unpack_f+0x4c>
 80116c2:	3304      	movi      	r3, 4
 80116c4:	b160      	st.w      	r3, (r1, 0x0)
 80116c6:	07eb      	br      	0x801169c	// 801169c <__unpack_f+0x4c>
 80116c8:	dfffff80 	.long	0xdfffff80

080116cc <__make_fp>:
 80116cc:	14d0      	push      	r15
 80116ce:	1424      	subi      	r14, r14, 16
 80116d0:	b800      	st.w      	r0, (r14, 0x0)
 80116d2:	6c3b      	mov      	r0, r14
 80116d4:	b821      	st.w      	r1, (r14, 0x4)
 80116d6:	b842      	st.w      	r2, (r14, 0x8)
 80116d8:	b863      	st.w      	r3, (r14, 0xc)
 80116da:	e00001a1 	bsr      	0x8011a1c	// 8011a1c <__pack_f>
 80116de:	1404      	addi      	r14, r14, 16
 80116e0:	1490      	pop      	r15
	...

080116e4 <__pack_d>:
 80116e4:	14c5      	push      	r4-r8
 80116e6:	9020      	ld.w      	r1, (r0, 0x0)
 80116e8:	3901      	cmphsi      	r1, 2
 80116ea:	9043      	ld.w      	r2, (r0, 0xc)
 80116ec:	9064      	ld.w      	r3, (r0, 0x10)
 80116ee:	d9a02001 	ld.w      	r13, (r0, 0x4)
 80116f2:	0c47      	bf      	0x8011780	// 8011780 <__pack_d+0x9c>
 80116f4:	3944      	cmpnei      	r1, 4
 80116f6:	0c40      	bf      	0x8011776	// 8011776 <__pack_d+0x92>
 80116f8:	3942      	cmpnei      	r1, 2
 80116fa:	0c28      	bf      	0x801174a	// 801174a <__pack_d+0x66>
 80116fc:	c4622421 	or      	r1, r2, r3
 8011700:	e9010025 	bez      	r1, 0x801174a	// 801174a <__pack_d+0x66>
 8011704:	9022      	ld.w      	r1, (r0, 0x8)
 8011706:	ea0003fd 	movi      	r0, 1021
 801170a:	6c02      	nor      	r0, r0
 801170c:	6405      	cmplt      	r1, r0
 801170e:	0855      	bt      	0x80117b8	// 80117b8 <__pack_d+0xd4>
 8011710:	eb2103ff 	cmplti      	r1, 1024
 8011714:	0c31      	bf      	0x8011776	// 8011776 <__pack_d+0x92>
 8011716:	e40220ff 	andi      	r0, r2, 255
 801171a:	eb400080 	cmpnei      	r0, 128
 801171e:	0c43      	bf      	0x80117a4	// 80117a4 <__pack_d+0xc0>
 8011720:	347f      	movi      	r4, 127
 8011722:	3500      	movi      	r5, 0
 8011724:	6489      	cmplt      	r2, r2
 8011726:	6091      	addc      	r2, r4
 8011728:	60d5      	addc      	r3, r5
 801172a:	c7805020 	bmaski      	r0, 29
 801172e:	64c0      	cmphs      	r0, r3
 8011730:	0c19      	bf      	0x8011762	// 8011762 <__pack_d+0x7e>
 8011732:	e58103fe 	addi      	r12, r1, 1023
 8011736:	4b28      	lsri      	r1, r3, 8
 8011738:	4398      	lsli      	r4, r3, 24
 801173a:	4a08      	lsri      	r0, r2, 8
 801173c:	c4015663 	zext      	r3, r1, 19, 0
 8011740:	6c4f      	mov      	r1, r3
 8011742:	6c10      	or      	r0, r4
 8011744:	e46c27ff 	andi      	r3, r12, 2047
 8011748:	0404      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 801174a:	3300      	movi      	r3, 0
 801174c:	3000      	movi      	r0, 0
 801174e:	3100      	movi      	r1, 0
 8011750:	3200      	movi      	r2, 0
 8011752:	c4415e60 	ins      	r2, r1, 19, 0
 8011756:	c4435d54 	ins      	r2, r3, 30, 20
 801175a:	c44d5c1f 	ins      	r2, r13, 31, 31
 801175e:	6c4b      	mov      	r1, r2
 8011760:	1485      	pop      	r4-r8
 8011762:	439f      	lsli      	r4, r3, 31
 8011764:	c422484c 	lsri      	r12, r2, 1
 8011768:	4b01      	lsri      	r0, r3, 1
 801176a:	c5842422 	or      	r2, r4, r12
 801176e:	6cc3      	mov      	r3, r0
 8011770:	e58103ff 	addi      	r12, r1, 1024
 8011774:	07e1      	br      	0x8011736	// 8011736 <__pack_d+0x52>
 8011776:	ea0307ff 	movi      	r3, 2047
 801177a:	3000      	movi      	r0, 0
 801177c:	3100      	movi      	r1, 0
 801177e:	07e9      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 8011780:	c703482c 	lsli      	r12, r3, 24
 8011784:	4a48      	lsri      	r2, r2, 8
 8011786:	c44c2420 	or      	r0, r12, r2
 801178a:	c5035741 	zext      	r1, r3, 26, 8
 801178e:	3200      	movi      	r2, 0
 8011790:	ea230008 	movih      	r3, 8
 8011794:	6c08      	or      	r0, r2
 8011796:	6c4c      	or      	r1, r3
 8011798:	c4015663 	zext      	r3, r1, 19, 0
 801179c:	6c4f      	mov      	r1, r3
 801179e:	ea0307ff 	movi      	r3, 2047
 80117a2:	07d7      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 80117a4:	e4022100 	andi      	r0, r2, 256
 80117a8:	e900ffc1 	bez      	r0, 0x801172a	// 801172a <__pack_d+0x46>
 80117ac:	3480      	movi      	r4, 128
 80117ae:	3500      	movi      	r5, 0
 80117b0:	6489      	cmplt      	r2, r2
 80117b2:	6091      	addc      	r2, r4
 80117b4:	60d5      	addc      	r3, r5
 80117b6:	07ba      	br      	0x801172a	// 801172a <__pack_d+0x46>
 80117b8:	5825      	subu      	r1, r0, r1
 80117ba:	eb210038 	cmplti      	r1, 57
 80117be:	0fc6      	bf      	0x801174a	// 801174a <__pack_d+0x66>
 80117c0:	341f      	movi      	r4, 31
 80117c2:	c423482c 	lsli      	r12, r3, 1
 80117c6:	6106      	subu      	r4, r1
 80117c8:	e401101f 	subi      	r0, r1, 32
 80117cc:	7310      	lsl      	r12, r4
 80117ce:	c4224046 	lsr      	r6, r2, r1
 80117d2:	38df      	btsti      	r0, 31
 80117d4:	c4034045 	lsr      	r5, r3, r0
 80117d8:	ea080000 	movi      	r8, 0
 80117dc:	6db0      	or      	r6, r12
 80117de:	ea0c0001 	movi      	r12, 1
 80117e2:	c4c50c20 	incf      	r6, r5, 0
 80117e6:	c40c4020 	lsl      	r0, r12, r0
 80117ea:	6d63      	mov      	r5, r8
 80117ec:	c42c4024 	lsl      	r4, r12, r1
 80117f0:	c4234047 	lsr      	r7, r3, r1
 80117f4:	c4a00c20 	incf      	r5, r0, 0
 80117f8:	c4880c20 	incf      	r4, r8, 0
 80117fc:	c4e80c20 	incf      	r7, r8, 0
 8011800:	3c40      	cmpnei      	r4, 0
 8011802:	c4a50c81 	decf      	r5, r5, 1
 8011806:	2c00      	subi      	r4, 1
 8011808:	6890      	and      	r2, r4
 801180a:	68d4      	and      	r3, r5
 801180c:	6c8c      	or      	r2, r3
 801180e:	3a40      	cmpnei      	r2, 0
 8011810:	c4000502 	mvc      	r2
 8011814:	6ce3      	mov      	r3, r8
 8011816:	6d88      	or      	r6, r2
 8011818:	6dcc      	or      	r7, r3
 801181a:	e46620ff 	andi      	r3, r6, 255
 801181e:	eb430080 	cmpnei      	r3, 128
 8011822:	0814      	bt      	0x801184a	// 801184a <__pack_d+0x166>
 8011824:	e4662100 	andi      	r3, r6, 256
 8011828:	e9230023 	bnez      	r3, 0x801186e	// 801186e <__pack_d+0x18a>
 801182c:	4758      	lsli      	r2, r7, 24
 801182e:	4f28      	lsri      	r1, r7, 8
 8011830:	4e08      	lsri      	r0, r6, 8
 8011832:	6c08      	or      	r0, r2
 8011834:	c4015662 	zext      	r2, r1, 19, 0
 8011838:	6c4b      	mov      	r1, r2
 801183a:	c7605022 	bmaski      	r2, 28
 801183e:	65c8      	cmphs      	r2, r7
 8011840:	0c02      	bf      	0x8011844	// 8011844 <__pack_d+0x160>
 8011842:	6f0f      	mov      	r12, r3
 8011844:	e46c2001 	andi      	r3, r12, 1
 8011848:	0784      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 801184a:	327f      	movi      	r2, 127
 801184c:	3300      	movi      	r3, 0
 801184e:	6599      	cmplt      	r6, r6
 8011850:	6189      	addc      	r6, r2
 8011852:	61cd      	addc      	r7, r3
 8011854:	4778      	lsli      	r3, r7, 24
 8011856:	4f28      	lsri      	r1, r7, 8
 8011858:	4e08      	lsri      	r0, r6, 8
 801185a:	6c0c      	or      	r0, r3
 801185c:	c4015663 	zext      	r3, r1, 19, 0
 8011860:	6c4f      	mov      	r1, r3
 8011862:	c7605023 	bmaski      	r3, 28
 8011866:	65cc      	cmphs      	r3, r7
 8011868:	0fee      	bf      	0x8011844	// 8011844 <__pack_d+0x160>
 801186a:	6f23      	mov      	r12, r8
 801186c:	07ec      	br      	0x8011844	// 8011844 <__pack_d+0x160>
 801186e:	3280      	movi      	r2, 128
 8011870:	07ee      	br      	0x801184c	// 801184c <__pack_d+0x168>
	...

08011874 <__unpack_d>:
 8011874:	1421      	subi      	r14, r14, 4
 8011876:	dd6e2000 	st.w      	r11, (r14, 0x0)
 801187a:	8863      	ld.h      	r3, (r0, 0x6)
 801187c:	8047      	ld.b      	r2, (r0, 0x7)
 801187e:	c48355c3 	zext      	r3, r3, 14, 4
 8011882:	d9802001 	ld.w      	r12, (r0, 0x4)
 8011886:	4a47      	lsri      	r2, r2, 7
 8011888:	d9a02000 	ld.w      	r13, (r0, 0x0)
 801188c:	c40c566c 	zext      	r12, r12, 19, 0
 8011890:	b141      	st.w      	r2, (r1, 0x4)
 8011892:	e9230025 	bnez      	r3, 0x80118dc	// 80118dc <__unpack_d+0x68>
 8011896:	c58d2423 	or      	r3, r13, r12
 801189a:	e903003c 	bez      	r3, 0x8011912	// 8011912 <__unpack_d+0x9e>
 801189e:	c70d4840 	lsri      	r0, r13, 24
 80118a2:	c50c4823 	lsli      	r3, r12, 8
 80118a6:	6cc0      	or      	r3, r0
 80118a8:	3003      	movi      	r0, 3
 80118aa:	c50d4822 	lsli      	r2, r13, 8
 80118ae:	b100      	st.w      	r0, (r1, 0x0)
 80118b0:	c760502d 	bmaski      	r13, 28
 80118b4:	ea0003fe 	movi      	r0, 1022
 80118b8:	6c02      	nor      	r0, r0
 80118ba:	6ecb      	mov      	r11, r2
 80118bc:	6f0f      	mov      	r12, r3
 80118be:	6489      	cmplt      	r2, r2
 80118c0:	60ad      	addc      	r2, r11
 80118c2:	60f1      	addc      	r3, r12
 80118c4:	64f4      	cmphs      	r13, r3
 80118c6:	6f03      	mov      	r12, r0
 80118c8:	2800      	subi      	r0, 1
 80118ca:	0bf8      	bt      	0x80118ba	// 80118ba <__unpack_d+0x46>
 80118cc:	dd812002 	st.w      	r12, (r1, 0x8)
 80118d0:	b143      	st.w      	r2, (r1, 0xc)
 80118d2:	b164      	st.w      	r3, (r1, 0x10)
 80118d4:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80118d8:	1401      	addi      	r14, r14, 4
 80118da:	783c      	jmp      	r15
 80118dc:	eb4307ff 	cmpnei      	r3, 2047
 80118e0:	0c1f      	bf      	0x801191e	// 801191e <__unpack_d+0xaa>
 80118e2:	e46313fe 	subi      	r3, r3, 1023
 80118e6:	b162      	st.w      	r3, (r1, 0x8)
 80118e8:	3303      	movi      	r3, 3
 80118ea:	c70d4840 	lsri      	r0, r13, 24
 80118ee:	b160      	st.w      	r3, (r1, 0x0)
 80118f0:	c50c4823 	lsli      	r3, r12, 8
 80118f4:	c50d4822 	lsli      	r2, r13, 8
 80118f8:	6cc0      	or      	r3, r0
 80118fa:	ea0c0000 	movi      	r12, 0
 80118fe:	ea2d1000 	movih      	r13, 4096
 8011902:	6cb0      	or      	r2, r12
 8011904:	6cf4      	or      	r3, r13
 8011906:	b143      	st.w      	r2, (r1, 0xc)
 8011908:	b164      	st.w      	r3, (r1, 0x10)
 801190a:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801190e:	1401      	addi      	r14, r14, 4
 8011910:	783c      	jmp      	r15
 8011912:	3302      	movi      	r3, 2
 8011914:	b160      	st.w      	r3, (r1, 0x0)
 8011916:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801191a:	1401      	addi      	r14, r14, 4
 801191c:	783c      	jmp      	r15
 801191e:	c58d2423 	or      	r3, r13, r12
 8011922:	e9030018 	bez      	r3, 0x8011952	// 8011952 <__unpack_d+0xde>
 8011926:	ea230008 	movih      	r3, 8
 801192a:	68f0      	and      	r3, r12
 801192c:	3b40      	cmpnei      	r3, 0
 801192e:	3201      	movi      	r2, 1
 8011930:	c4620c40 	inct      	r3, r2, 0
 8011934:	b160      	st.w      	r3, (r1, 0x0)
 8011936:	c50c482c 	lsli      	r12, r12, 8
 801193a:	c70d4843 	lsri      	r3, r13, 24
 801193e:	6f0c      	or      	r12, r3
 8011940:	c50d482d 	lsli      	r13, r13, 8
 8011944:	c76c282c 	bclri      	r12, r12, 27
 8011948:	dda12003 	st.w      	r13, (r1, 0xc)
 801194c:	dd812004 	st.w      	r12, (r1, 0x10)
 8011950:	07dd      	br      	0x801190a	// 801190a <__unpack_d+0x96>
 8011952:	3304      	movi      	r3, 4
 8011954:	b160      	st.w      	r3, (r1, 0x0)
 8011956:	07da      	br      	0x801190a	// 801190a <__unpack_d+0x96>

08011958 <__fpcmp_parts_d>:
 8011958:	9040      	ld.w      	r2, (r0, 0x0)
 801195a:	3301      	movi      	r3, 1
 801195c:	648c      	cmphs      	r3, r2
 801195e:	0830      	bt      	0x80119be	// 80119be <__fpcmp_parts_d+0x66>
 8011960:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011964:	670c      	cmphs      	r3, r12
 8011966:	082c      	bt      	0x80119be	// 80119be <__fpcmp_parts_d+0x66>
 8011968:	3a44      	cmpnei      	r2, 4
 801196a:	0c1f      	bf      	0x80119a8	// 80119a8 <__fpcmp_parts_d+0x50>
 801196c:	eb4c0004 	cmpnei      	r12, 4
 8011970:	0c14      	bf      	0x8011998	// 8011998 <__fpcmp_parts_d+0x40>
 8011972:	3a42      	cmpnei      	r2, 2
 8011974:	0c0f      	bf      	0x8011992	// 8011992 <__fpcmp_parts_d+0x3a>
 8011976:	eb4c0002 	cmpnei      	r12, 2
 801197a:	0c1a      	bf      	0x80119ae	// 80119ae <__fpcmp_parts_d+0x56>
 801197c:	9041      	ld.w      	r2, (r0, 0x4)
 801197e:	d9812001 	ld.w      	r12, (r1, 0x4)
 8011982:	670a      	cmpne      	r2, r12
 8011984:	0c1f      	bf      	0x80119c2	// 80119c2 <__fpcmp_parts_d+0x6a>
 8011986:	3000      	movi      	r0, 0
 8011988:	2800      	subi      	r0, 1
 801198a:	3a40      	cmpnei      	r2, 0
 801198c:	c4030c20 	incf      	r0, r3, 0
 8011990:	783c      	jmp      	r15
 8011992:	eb4c0002 	cmpnei      	r12, 2
 8011996:	0c2a      	bf      	0x80119ea	// 80119ea <__fpcmp_parts_d+0x92>
 8011998:	9141      	ld.w      	r2, (r1, 0x4)
 801199a:	3300      	movi      	r3, 0
 801199c:	2b00      	subi      	r3, 1
 801199e:	3a40      	cmpnei      	r2, 0
 80119a0:	3001      	movi      	r0, 1
 80119a2:	c4030c20 	incf      	r0, r3, 0
 80119a6:	783c      	jmp      	r15
 80119a8:	eb4c0004 	cmpnei      	r12, 4
 80119ac:	0c21      	bf      	0x80119ee	// 80119ee <__fpcmp_parts_d+0x96>
 80119ae:	9061      	ld.w      	r3, (r0, 0x4)
 80119b0:	3000      	movi      	r0, 0
 80119b2:	3b40      	cmpnei      	r3, 0
 80119b4:	2800      	subi      	r0, 1
 80119b6:	3301      	movi      	r3, 1
 80119b8:	c4030c20 	incf      	r0, r3, 0
 80119bc:	783c      	jmp      	r15
 80119be:	6c0f      	mov      	r0, r3
 80119c0:	783c      	jmp      	r15
 80119c2:	d9a02002 	ld.w      	r13, (r0, 0x8)
 80119c6:	d9812002 	ld.w      	r12, (r1, 0x8)
 80119ca:	6771      	cmplt      	r12, r13
 80119cc:	0bdd      	bt      	0x8011986	// 8011986 <__fpcmp_parts_d+0x2e>
 80119ce:	6735      	cmplt      	r13, r12
 80119d0:	0c13      	bf      	0x80119f6	// 80119f6 <__fpcmp_parts_d+0x9e>
 80119d2:	3000      	movi      	r0, 0
 80119d4:	2800      	subi      	r0, 1
 80119d6:	3a40      	cmpnei      	r2, 0
 80119d8:	c4030c40 	inct      	r0, r3, 0
 80119dc:	07da      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119de:	644c      	cmphs      	r3, r1
 80119e0:	0fdd      	bf      	0x801199a	// 801199a <__fpcmp_parts_d+0x42>
 80119e2:	64c6      	cmpne      	r1, r3
 80119e4:	0803      	bt      	0x80119ea	// 80119ea <__fpcmp_parts_d+0x92>
 80119e6:	6430      	cmphs      	r12, r0
 80119e8:	0fd9      	bf      	0x801199a	// 801199a <__fpcmp_parts_d+0x42>
 80119ea:	3000      	movi      	r0, 0
 80119ec:	07d2      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119ee:	9161      	ld.w      	r3, (r1, 0x4)
 80119f0:	9001      	ld.w      	r0, (r0, 0x4)
 80119f2:	5b01      	subu      	r0, r3, r0
 80119f4:	07ce      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119f6:	9064      	ld.w      	r3, (r0, 0x10)
 80119f8:	d9802003 	ld.w      	r12, (r0, 0xc)
 80119fc:	9103      	ld.w      	r0, (r1, 0xc)
 80119fe:	9124      	ld.w      	r1, (r1, 0x10)
 8011a00:	64c4      	cmphs      	r1, r3
 8011a02:	0c05      	bf      	0x8011a0c	// 8011a0c <__fpcmp_parts_d+0xb4>
 8011a04:	644e      	cmpne      	r3, r1
 8011a06:	0bec      	bt      	0x80119de	// 80119de <__fpcmp_parts_d+0x86>
 8011a08:	6700      	cmphs      	r0, r12
 8011a0a:	0bea      	bt      	0x80119de	// 80119de <__fpcmp_parts_d+0x86>
 8011a0c:	3000      	movi      	r0, 0
 8011a0e:	2800      	subi      	r0, 1
 8011a10:	3a40      	cmpnei      	r2, 0
 8011a12:	3301      	movi      	r3, 1
 8011a14:	c4030c20 	incf      	r0, r3, 0
 8011a18:	07bc      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
	...

08011a1c <__pack_f>:
 8011a1c:	9040      	ld.w      	r2, (r0, 0x0)
 8011a1e:	3a01      	cmphsi      	r2, 2
 8011a20:	9063      	ld.w      	r3, (r0, 0xc)
 8011a22:	9021      	ld.w      	r1, (r0, 0x4)
 8011a24:	0c2b      	bf      	0x8011a7a	// 8011a7a <__pack_f+0x5e>
 8011a26:	3a44      	cmpnei      	r2, 4
 8011a28:	0c23      	bf      	0x8011a6e	// 8011a6e <__pack_f+0x52>
 8011a2a:	3a42      	cmpnei      	r2, 2
 8011a2c:	0c24      	bf      	0x8011a74	// 8011a74 <__pack_f+0x58>
 8011a2e:	e9030021 	bez      	r3, 0x8011a70	// 8011a70 <__pack_f+0x54>
 8011a32:	9042      	ld.w      	r2, (r0, 0x8)
 8011a34:	3000      	movi      	r0, 0
 8011a36:	287d      	subi      	r0, 126
 8011a38:	6409      	cmplt      	r2, r0
 8011a3a:	082f      	bt      	0x8011a98	// 8011a98 <__pack_f+0x7c>
 8011a3c:	eb22007f 	cmplti      	r2, 128
 8011a40:	0c17      	bf      	0x8011a6e	// 8011a6e <__pack_f+0x52>
 8011a42:	e403207f 	andi      	r0, r3, 127
 8011a46:	eb400040 	cmpnei      	r0, 64
 8011a4a:	0c1e      	bf      	0x8011a86	// 8011a86 <__pack_f+0x6a>
 8011a4c:	233e      	addi      	r3, 63
 8011a4e:	e9830022 	blz      	r3, 0x8011a92	// 8011a92 <__pack_f+0x76>
 8011a52:	227e      	addi      	r2, 127
 8011a54:	c4e357a0 	zext      	r0, r3, 29, 7
 8011a58:	74c8      	zextb      	r3, r2
 8011a5a:	3200      	movi      	r2, 0
 8011a5c:	c4405ec0 	ins      	r2, r0, 22, 0
 8011a60:	c4435cf7 	ins      	r2, r3, 30, 23
 8011a64:	c4415c1f 	ins      	r2, r1, 31, 31
 8011a68:	f4021b60 	fmtvrl      	fr0, r2
 8011a6c:	783c      	jmp      	r15
 8011a6e:	33ff      	movi      	r3, 255
 8011a70:	3000      	movi      	r0, 0
 8011a72:	07f4      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a74:	3300      	movi      	r3, 0
 8011a76:	6c0f      	mov      	r0, r3
 8011a78:	07f1      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a7a:	c4e35783 	zext      	r3, r3, 28, 7
 8011a7e:	c6c32840 	bseti      	r0, r3, 22
 8011a82:	33ff      	movi      	r3, 255
 8011a84:	07eb      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a86:	e4032080 	andi      	r0, r3, 128
 8011a8a:	e900ffe2 	bez      	r0, 0x8011a4e	// 8011a4e <__pack_f+0x32>
 8011a8e:	233f      	addi      	r3, 64
 8011a90:	07df      	br      	0x8011a4e	// 8011a4e <__pack_f+0x32>
 8011a92:	4b61      	lsri      	r3, r3, 1
 8011a94:	227f      	addi      	r2, 128
 8011a96:	07df      	br      	0x8011a54	// 8011a54 <__pack_f+0x38>
 8011a98:	5849      	subu      	r2, r0, r2
 8011a9a:	3a39      	cmplti      	r2, 26
 8011a9c:	0fec      	bf      	0x8011a74	// 8011a74 <__pack_f+0x58>
 8011a9e:	3001      	movi      	r0, 1
 8011aa0:	c443404c 	lsr      	r12, r3, r2
 8011aa4:	c4404022 	lsl      	r2, r0, r2
 8011aa8:	2a00      	subi      	r2, 1
 8011aaa:	68c8      	and      	r3, r2
 8011aac:	3b40      	cmpnei      	r3, 0
 8011aae:	c4000503 	mvc      	r3
 8011ab2:	6cf0      	or      	r3, r12
 8011ab4:	e443207f 	andi      	r2, r3, 127
 8011ab8:	eb420040 	cmpnei      	r2, 64
 8011abc:	080e      	bt      	0x8011ad8	// 8011ad8 <__pack_f+0xbc>
 8011abe:	e4432080 	andi      	r2, r3, 128
 8011ac2:	e9020003 	bez      	r2, 0x8011ac8	// 8011ac8 <__pack_f+0xac>
 8011ac6:	233f      	addi      	r3, 64
 8011ac8:	c7a05022 	bmaski      	r2, 30
 8011acc:	64c8      	cmphs      	r2, r3
 8011ace:	6483      	mvcv      	r2
 8011ad0:	c4e357a0 	zext      	r0, r3, 29, 7
 8011ad4:	74c8      	zextb      	r3, r2
 8011ad6:	07c2      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011ad8:	233e      	addi      	r3, 63
 8011ada:	07f7      	br      	0x8011ac8	// 8011ac8 <__pack_f+0xac>

08011adc <__GI_putchar>:
 8011adc:	14d0      	push      	r15
 8011ade:	1063      	lrw      	r3, 0x20000120	// 8011ae8 <__GI_putchar+0xc>
 8011ae0:	9320      	ld.w      	r1, (r3, 0x0)
 8011ae2:	e000009f 	bsr      	0x8011c20	// 8011c20 <__GI_putc>
 8011ae6:	1490      	pop      	r15
 8011ae8:	20000120 	.long	0x20000120

08011aec <__GI_puts>:
 8011aec:	14d1      	push      	r4, r15
 8011aee:	1085      	lrw      	r4, 0x20000120	// 8011b00 <__GI_puts+0x14>
 8011af0:	9420      	ld.w      	r1, (r4, 0x0)
 8011af2:	e0000009 	bsr      	0x8011b04	// 8011b04 <__GI_fputs>
 8011af6:	9420      	ld.w      	r1, (r4, 0x0)
 8011af8:	300a      	movi      	r0, 10
 8011afa:	e0001ae5 	bsr      	0x80150c4	// 80150c4 <fputc>
 8011afe:	1491      	pop      	r4, r15
 8011b00:	20000120 	.long	0x20000120

08011b04 <__GI_fputs>:
 8011b04:	14d5      	push      	r4-r8, r15
 8011b06:	6d03      	mov      	r4, r0
 8011b08:	6d87      	mov      	r6, r1
 8011b0a:	e9010018 	bez      	r1, 0x8011b3a	// 8011b3a <__GI_fputs+0x36>
 8011b0e:	e5010017 	addi      	r8, r1, 24
 8011b12:	6c23      	mov      	r0, r8
 8011b14:	e0000080 	bsr      	0x8011c14	// 8011c14 <__GI_os_critical_enter>
 8011b18:	8400      	ld.b      	r0, (r4, 0x0)
 8011b1a:	e9000014 	bez      	r0, 0x8011b42	// 8011b42 <__GI_fputs+0x3e>
 8011b1e:	3500      	movi      	r5, 0
 8011b20:	6dd7      	mov      	r7, r5
 8011b22:	2f00      	subi      	r7, 1
 8011b24:	0406      	br      	0x8011b30	// 8011b30 <__GI_fputs+0x2c>
 8011b26:	2400      	addi      	r4, 1
 8011b28:	8400      	ld.b      	r0, (r4, 0x0)
 8011b2a:	2500      	addi      	r5, 1
 8011b2c:	e900000c 	bez      	r0, 0x8011b44	// 8011b44 <__GI_fputs+0x40>
 8011b30:	6c5b      	mov      	r1, r6
 8011b32:	e0001ac9 	bsr      	0x80150c4	// 80150c4 <fputc>
 8011b36:	65c2      	cmpne      	r0, r7
 8011b38:	0bf7      	bt      	0x8011b26	// 8011b26 <__GI_fputs+0x22>
 8011b3a:	3500      	movi      	r5, 0
 8011b3c:	2d00      	subi      	r5, 1
 8011b3e:	6c17      	mov      	r0, r5
 8011b40:	1495      	pop      	r4-r8, r15
 8011b42:	6d43      	mov      	r5, r0
 8011b44:	6c23      	mov      	r0, r8
 8011b46:	e0000069 	bsr      	0x8011c18	// 8011c18 <__GI_os_critical_exit>
 8011b4a:	6c17      	mov      	r0, r5
 8011b4c:	1495      	pop      	r4-r8, r15
	...

08011b50 <__strlen_fast>:
 8011b50:	6c43      	mov      	r1, r0
 8011b52:	e4002003 	andi      	r0, r0, 3
 8011b56:	e9000009 	bez      	r0, 0x8011b68	// 8011b68 <__strlen_fast+0x18>
 8011b5a:	3000      	movi      	r0, 0
 8011b5c:	8140      	ld.b      	r2, (r1, 0x0)
 8011b5e:	e9020017 	bez      	r2, 0x8011b8c	// 8011b8c <__strlen_fast+0x3c>
 8011b62:	2100      	addi      	r1, 1
 8011b64:	2000      	addi      	r0, 1
 8011b66:	07fb      	br      	0x8011b5c	// 8011b5c <__strlen_fast+0xc>
 8011b68:	9140      	ld.w      	r2, (r1, 0x0)
 8011b6a:	680b      	tstnbz      	r2
 8011b6c:	0c04      	bf      	0x8011b74	// 8011b74 <__strlen_fast+0x24>
 8011b6e:	2103      	addi      	r1, 4
 8011b70:	2003      	addi      	r0, 4
 8011b72:	07fb      	br      	0x8011b68	// 8011b68 <__strlen_fast+0x18>
 8011b74:	c4027103 	xtrb3      	r3, r2
 8011b78:	0c0a      	bf      	0x8011b8c	// 8011b8c <__strlen_fast+0x3c>
 8011b7a:	2000      	addi      	r0, 1
 8011b7c:	c4027083 	xtrb2      	r3, r2
 8011b80:	0c06      	bf      	0x8011b8c	// 8011b8c <__strlen_fast+0x3c>
 8011b82:	2000      	addi      	r0, 1
 8011b84:	c4027043 	xtrb1      	r3, r2
 8011b88:	0c02      	bf      	0x8011b8c	// 8011b8c <__strlen_fast+0x3c>
 8011b8a:	2000      	addi      	r0, 1
 8011b8c:	783c      	jmp      	r15
	...

08011b90 <__memcpy_fast>:
 8011b90:	14c1      	push      	r4
 8011b92:	6f03      	mov      	r12, r0
 8011b94:	c401242d 	or      	r13, r1, r0
 8011b98:	e48d2003 	andi      	r4, r13, 3
 8011b9c:	e904000e 	bez      	r4, 0x8011bb8	// 8011bb8 <__memcpy_fast+0x28>
 8011ba0:	e902000b 	bez      	r2, 0x8011bb6	// 8011bb6 <__memcpy_fast+0x26>
 8011ba4:	8160      	ld.b      	r3, (r1, 0x0)
 8011ba6:	2100      	addi      	r1, 1
 8011ba8:	2a00      	subi      	r2, 1
 8011baa:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011bae:	e58c0000 	addi      	r12, r12, 1
 8011bb2:	e922fff9 	bnez      	r2, 0x8011ba4	// 8011ba4 <__memcpy_fast+0x14>
 8011bb6:	1481      	pop      	r4
 8011bb8:	3a2f      	cmplti      	r2, 16
 8011bba:	0815      	bt      	0x8011be4	// 8011be4 <__memcpy_fast+0x54>
 8011bbc:	d9a12000 	ld.w      	r13, (r1, 0x0)
 8011bc0:	9161      	ld.w      	r3, (r1, 0x4)
 8011bc2:	9182      	ld.w      	r4, (r1, 0x8)
 8011bc4:	ddac2000 	st.w      	r13, (r12, 0x0)
 8011bc8:	d9a12003 	ld.w      	r13, (r1, 0xc)
 8011bcc:	dc6c2001 	st.w      	r3, (r12, 0x4)
 8011bd0:	dc8c2002 	st.w      	r4, (r12, 0x8)
 8011bd4:	ddac2003 	st.w      	r13, (r12, 0xc)
 8011bd8:	2a0f      	subi      	r2, 16
 8011bda:	210f      	addi      	r1, 16
 8011bdc:	e58c000f 	addi      	r12, r12, 16
 8011be0:	3a2f      	cmplti      	r2, 16
 8011be2:	0fed      	bf      	0x8011bbc	// 8011bbc <__memcpy_fast+0x2c>
 8011be4:	3a23      	cmplti      	r2, 4
 8011be6:	080a      	bt      	0x8011bfa	// 8011bfa <__memcpy_fast+0x6a>
 8011be8:	9160      	ld.w      	r3, (r1, 0x0)
 8011bea:	2a03      	subi      	r2, 4
 8011bec:	2103      	addi      	r1, 4
 8011bee:	dc6c2000 	st.w      	r3, (r12, 0x0)
 8011bf2:	e58c0003 	addi      	r12, r12, 4
 8011bf6:	3a23      	cmplti      	r2, 4
 8011bf8:	0ff8      	bf      	0x8011be8	// 8011be8 <__memcpy_fast+0x58>
 8011bfa:	e902ffde 	bez      	r2, 0x8011bb6	// 8011bb6 <__memcpy_fast+0x26>
 8011bfe:	8160      	ld.b      	r3, (r1, 0x0)
 8011c00:	2100      	addi      	r1, 1
 8011c02:	2a00      	subi      	r2, 1
 8011c04:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011c08:	e58c0000 	addi      	r12, r12, 1
 8011c0c:	07f7      	br      	0x8011bfa	// 8011bfa <__memcpy_fast+0x6a>
	...

08011c10 <__GI_os_critical_open>:
 8011c10:	3000      	movi      	r0, 0
 8011c12:	783c      	jmp      	r15

08011c14 <__GI_os_critical_enter>:
 8011c14:	3000      	movi      	r0, 0
 8011c16:	783c      	jmp      	r15

08011c18 <__GI_os_critical_exit>:
 8011c18:	3000      	movi      	r0, 0
 8011c1a:	783c      	jmp      	r15

08011c1c <__GI_os_critical_close>:
 8011c1c:	3000      	movi      	r0, 0
 8011c1e:	783c      	jmp      	r15

08011c20 <__GI_putc>:
 8011c20:	14d0      	push      	r15
 8011c22:	e0001a51 	bsr      	0x80150c4	// 80150c4 <fputc>
 8011c26:	1490      	pop      	r15

08011c28 <num2char>:
 * g：		整数位数
 * l：		小数位数
 * chr：	单位
 */
void num2char(uint8_t *str, double number, uint8_t g, uint8_t l, char *chr)
{
 8011c28:	ebe00058 	push      	r4-r11, r15, r16-r17
 8011c2c:	6d83      	mov      	r6, r0
 8011c2e:	6e47      	mov      	r9, r1
 8011c30:	6d4b      	mov      	r5, r2
 8011c32:	6ecf      	mov      	r11, r3
 8011c34:	d90e200c 	ld.w      	r8, (r14, 0x30)
 8011c38:	d8ee002c 	ld.b      	r7, (r14, 0x2c)
	assert(str != NULL);
 8011c3c:	e900006f 	bez      	r0, 0x8011d1a	// 8011d1a <num2char+0xf2>
	assert(chr != NULL);
 8011c40:	e9080067 	bez      	r8, 0x8011d0e	// 8011d0e <num2char+0xe6>
	
    uint8_t i;
    int temp = number/1;
 8011c44:	6c07      	mov      	r0, r1
 8011c46:	6c4b      	mov      	r1, r2
 8011c48:	e3fffc48 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
    double t2 = 0.0;
    for (i = 1; i<=g; i++)
 8011c4c:	e90b0025 	bez      	r11, 0x8011c96	// 8011c96 <num2char+0x6e>
 8011c50:	3301      	movi      	r3, 1
    {
        if (temp==0)
            str[g-i] = table[0];
        else
            str[g-i] = table[temp%10];
 8011c52:	ea920036 	lrw      	r18, 0x8015360	// 8011d28 <num2char+0x100>
 8011c56:	310a      	movi      	r1, 10
            str[g-i] = table[0];
 8011c58:	ea0d0030 	movi      	r13, 48
 8011c5c:	040b      	br      	0x8011c72	// 8011c72 <num2char+0x4a>
 8011c5e:	c46b0082 	subu      	r2, r11, r3
    for (i = 1; i<=g; i++)
 8011c62:	2300      	addi      	r3, 1
 8011c64:	74cc      	zextb      	r3, r3
 8011c66:	64ec      	cmphs      	r11, r3
            str[g-i] = table[0];
 8011c68:	d446002d 	str.b      	r13, (r6, r2 << 0)
        temp = temp/10;
 8011c6c:	c4208040 	divs      	r0, r0, r1
    for (i = 1; i<=g; i++)
 8011c70:	0c13      	bf      	0x8011c96	// 8011c96 <num2char+0x6e>
        if (temp==0)
 8011c72:	e900fff6 	bez      	r0, 0x8011c5e	// 8011c5e <num2char+0x36>
            str[g-i] = table[temp%10];
 8011c76:	c46b008c 	subu      	r12, r11, r3
 8011c7a:	c4208042 	divs      	r2, r0, r1
    for (i = 1; i<=g; i++)
 8011c7e:	2300      	addi      	r3, 1
            str[g-i] = table[temp%10];
 8011c80:	7c84      	mult      	r2, r1
    for (i = 1; i<=g; i++)
 8011c82:	74cc      	zextb      	r3, r3
            str[g-i] = table[temp%10];
 8011c84:	5849      	subu      	r2, r0, r2
    for (i = 1; i<=g; i++)
 8011c86:	64ec      	cmphs      	r11, r3
            str[g-i] = table[temp%10];
 8011c88:	d0520022 	ldr.b      	r2, (r18, r2 << 0)
 8011c8c:	d5860022 	str.b      	r2, (r6, r12 << 0)
        temp = temp/10;
 8011c90:	c4208040 	divs      	r0, r0, r1
    for (i = 1; i<=g; i++)
 8011c94:	0bef      	bt      	0x8011c72	// 8011c72 <num2char+0x4a>
    }
	if(0 == l)
 8011c96:	e9070031 	bez      	r7, 0x8011cf8	// 8011cf8 <num2char+0xd0>
		goto end;
    *(str+g) = '.';
 8011c9a:	332e      	movi      	r3, 46
 8011c9c:	d5660023 	str.b      	r3, (r6, r11 << 0)
 8011ca0:	3401      	movi      	r4, 1
 8011ca2:	ea8a0022 	lrw      	r10, 0x8015360	// 8011d28 <num2char+0x100>
    temp = 0;
    t2 = number;
    for(i=1; i<=l; i++)
    {
        temp = t2*10;
        str[g+i] = table[temp%10];
 8011ca6:	ea10000a 	movi      	r16, 10
        temp = t2*10;
 8011caa:	ea234024 	movih      	r3, 16420
 8011cae:	3200      	movi      	r2, 0
 8011cb0:	6c27      	mov      	r0, r9
 8011cb2:	6c57      	mov      	r1, r5
 8011cb4:	e3fff9da 	bsr      	0x8011068	// 8011068 <__muldf3>
 8011cb8:	6e43      	mov      	r9, r0
 8011cba:	6d47      	mov      	r5, r1
 8011cbc:	e3fffc0e 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
        str[g+i] = table[temp%10];
 8011cc0:	c4860031 	addu      	r17, r6, r4
 8011cc4:	c6008043 	divs      	r3, r0, r16
    for(i=1; i<=l; i++)
 8011cc8:	2400      	addi      	r4, 1
        str[g+i] = table[temp%10];
 8011cca:	c6038423 	mult      	r3, r3, r16
    for(i=1; i<=l; i++)
 8011cce:	7510      	zextb      	r4, r4
        str[g+i] = table[temp%10];
 8011cd0:	600e      	subu      	r0, r3
    for(i=1; i<=l; i++)
 8011cd2:	651c      	cmphs      	r7, r4
        str[g+i] = table[temp%10];
 8011cd4:	d00a0023 	ldr.b      	r3, (r10, r0 << 0)
 8011cd8:	d5710023 	str.b      	r3, (r17, r11 << 0)
    for(i=1; i<=l; i++)
 8011cdc:	0be7      	bt      	0x8011caa	// 8011caa <num2char+0x82>
        t2 = t2*10;
    }
	//加上单位
	memcpy(str+g+l+1,chr,strlen(chr)+1);
 8011cde:	6c23      	mov      	r0, r8
 8011ce0:	2700      	addi      	r7, 1
 8011ce2:	e3ffff37 	bsr      	0x8011b50	// 8011b50 <__strlen_fast>
 8011ce6:	62dc      	addu      	r11, r7
 8011ce8:	5842      	addi      	r2, r0, 1
 8011cea:	6c63      	mov      	r1, r8
 8011cec:	c5660020 	addu      	r0, r6, r11
 8011cf0:	e3ffff50 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
	return ;
	end:
	//没有冒号
	memcpy(str+g+l,chr,strlen(chr)+1);
}
 8011cf4:	ebc00058 	pop      	r4-r11, r15, r16-r17
	memcpy(str+g+l,chr,strlen(chr)+1);
 8011cf8:	6c23      	mov      	r0, r8
 8011cfa:	e3ffff2b 	bsr      	0x8011b50	// 8011b50 <__strlen_fast>
 8011cfe:	5842      	addi      	r2, r0, 1
 8011d00:	6c63      	mov      	r1, r8
 8011d02:	c5660020 	addu      	r0, r6, r11
 8011d06:	e3ffff45 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
}
 8011d0a:	ebc00058 	pop      	r4-r11, r15, r16-r17
	assert(chr != NULL);
 8011d0e:	1068      	lrw      	r3, 0x8015354	// 8011d2c <num2char+0x104>
 8011d10:	1048      	lrw      	r2, 0x8015318	// 8011d30 <num2char+0x108>
 8011d12:	3131      	movi      	r1, 49
 8011d14:	1008      	lrw      	r0, 0x8015348	// 8011d34 <num2char+0x10c>
 8011d16:	e00019ff 	bsr      	0x8015114	// 8015114 <__assert_fail>
	assert(str != NULL);
 8011d1a:	1068      	lrw      	r3, 0x801533c	// 8011d38 <num2char+0x110>
 8011d1c:	1045      	lrw      	r2, 0x8015318	// 8011d30 <num2char+0x108>
 8011d1e:	3130      	movi      	r1, 48
 8011d20:	1005      	lrw      	r0, 0x8015348	// 8011d34 <num2char+0x10c>
 8011d22:	e00019f9 	bsr      	0x8015114	// 8015114 <__assert_fail>
 8011d26:	0000      	.short	0x0000
 8011d28:	08015360 	.long	0x08015360
 8011d2c:	08015354 	.long	0x08015354
 8011d30:	08015318 	.long	0x08015318
 8011d34:	08015348 	.long	0x08015348
 8011d38:	0801533c 	.long	0x0801533c

08011d3c <time2string>:


void time2string(uint8_t *str, uint8_t Hour, uint8_t Min, uint8_t Sec)
{
 8011d3c:	14d0      	push      	r15
	assert(str != NULL);
 8011d3e:	e900006d 	bez      	r0, 0x8011e18	// 8011e18 <time2string+0xdc>
	assert(Hour <= 999);
	assert(Min <= 59);
 8011d42:	ea0c003b 	movi      	r12, 59
 8011d46:	64b0      	cmphs      	r12, r2
 8011d48:	0c62      	bf      	0x8011e0c	// 8011e0c <time2string+0xd0>
	assert(Sec <= 59);
 8011d4a:	64f0      	cmphs      	r12, r3
 8011d4c:	0c5a      	bf      	0x8011e00	// 8011e00 <time2string+0xc4>
 8011d4e:	e5800001 	addi      	r12, r0, 2
 8011d52:	e6601000 	subi      	r19, r0, 1
    for (i = 1; i<=hour_len; i++)
    {
        if (temp==0)
            dst_str[hour_len-i] = table[0];
        else
            dst_str[hour_len-i] = table[temp%10];
 8011d56:	ea950034 	lrw      	r21, 0x8015360	// 8011e24 <time2string+0xe8>
 8011d5a:	ea12000a 	movi      	r18, 10
            dst_str[hour_len-i] = table[0];
 8011d5e:	ea140030 	movi      	r20, 48
        if (temp==0)
 8011d62:	e9210035 	bnez      	r1, 0x8011dcc	// 8011dcc <time2string+0x90>
            dst_str[hour_len-i] = table[0];
 8011d66:	de8c0000 	st.b      	r20, (r12, 0x0)
 8011d6a:	e58c1000 	subi      	r12, r12, 1
    for (i = 1; i<=hour_len; i++)
 8011d6e:	c5930480 	cmpne      	r19, r12
        temp = temp/10;
 8011d72:	c6418041 	divs      	r1, r1, r18
    for (i = 1; i<=hour_len; i++)
 8011d76:	0bf6      	bt      	0x8011d62	// 8011d62 <time2string+0x26>
    }
	
	dst_str+=3;
    *dst_str++ = ':';
 8011d78:	313a      	movi      	r1, 58
 8011d7a:	a023      	st.b      	r1, (r0, 0x3)
	
	//Min
	temp = Min/1;
	for (i = 1; i<=min_len; i++)
    {
        if (temp==0)
 8011d7c:	e9020033 	bez      	r2, 0x8011de2	// 8011de2 <time2string+0xa6>
            dst_str[min_len-i] = table[0];
        else
            dst_str[min_len-i] = table[temp%10];
 8011d80:	c6428041 	divs      	r1, r2, r18
 8011d84:	ea8c0028 	lrw      	r12, 0x8015360	// 8011e24 <time2string+0xe8>
 8011d88:	c6418432 	mult      	r18, r1, r18
 8011d8c:	c6420092 	subu      	r18, r2, r18
 8011d90:	d24c0022 	ldr.b      	r2, (r12, r18 << 0)
 8011d94:	a045      	st.b      	r2, (r0, 0x5)
        if (temp==0)
 8011d96:	e9010028 	bez      	r1, 0x8011de6	// 8011de6 <time2string+0xaa>
            dst_str[min_len-i] = table[temp%10];
 8011d9a:	d02c0022 	ldr.b      	r2, (r12, r1 << 0)
 8011d9e:	a044      	st.b      	r2, (r0, 0x4)
        temp = temp/10;
    }
	dst_str+=2;
	
	//加1是因为":"占位了
    *dst_str++ = ':';
 8011da0:	323a      	movi      	r2, 58
 8011da2:	a046      	st.b      	r2, (r0, 0x6)
	
	//Sec
	temp = Sec/1;
	for (i = 1; i<=sec_len; i++)
    {
        if (temp==0)
 8011da4:	e9030027 	bez      	r3, 0x8011df2	// 8011df2 <time2string+0xb6>
            dst_str[sec_len-i] = table[0];
        else
            dst_str[sec_len-i] = table[temp%10];
 8011da8:	320a      	movi      	r2, 10
 8011daa:	c4438041 	divs      	r1, r3, r2
 8011dae:	ea8c001e 	lrw      	r12, 0x8015360	// 8011e24 <time2string+0xe8>
 8011db2:	7c84      	mult      	r2, r1
 8011db4:	60ca      	subu      	r3, r2
 8011db6:	d06c0023 	ldr.b      	r3, (r12, r3 << 0)
 8011dba:	a068      	st.b      	r3, (r0, 0x8)
        if (temp==0)
 8011dbc:	e901001d 	bez      	r1, 0x8011df6	// 8011df6 <time2string+0xba>
            dst_str[sec_len-i] = table[temp%10];
 8011dc0:	d02c0023 	ldr.b      	r3, (r12, r1 << 0)
 8011dc4:	a067      	st.b      	r3, (r0, 0x7)
        temp = temp/10;
    }
	dst_str+=2;
	
	//加2是因为两个":"占位了
    *dst_str++ = '\0';
 8011dc6:	3300      	movi      	r3, 0
 8011dc8:	a069      	st.b      	r3, (r0, 0x9)
}
 8011dca:	1490      	pop      	r15
            dst_str[hour_len-i] = table[temp%10];
 8011dcc:	c641804d 	divs      	r13, r1, r18
 8011dd0:	c64d842d 	mult      	r13, r13, r18
 8011dd4:	c5a1008d 	subu      	r13, r1, r13
 8011dd8:	d1b5002d 	ldr.b      	r13, (r21, r13 << 0)
 8011ddc:	ddac0000 	st.b      	r13, (r12, 0x0)
 8011de0:	07c5      	br      	0x8011d6a	// 8011d6a <time2string+0x2e>
            dst_str[min_len-i] = table[0];
 8011de2:	3230      	movi      	r2, 48
 8011de4:	a045      	st.b      	r2, (r0, 0x5)
 8011de6:	3230      	movi      	r2, 48
 8011de8:	a044      	st.b      	r2, (r0, 0x4)
    *dst_str++ = ':';
 8011dea:	323a      	movi      	r2, 58
 8011dec:	a046      	st.b      	r2, (r0, 0x6)
        if (temp==0)
 8011dee:	e923ffdd 	bnez      	r3, 0x8011da8	// 8011da8 <time2string+0x6c>
            dst_str[sec_len-i] = table[0];
 8011df2:	3330      	movi      	r3, 48
 8011df4:	a068      	st.b      	r3, (r0, 0x8)
 8011df6:	3330      	movi      	r3, 48
 8011df8:	a067      	st.b      	r3, (r0, 0x7)
    *dst_str++ = '\0';
 8011dfa:	3300      	movi      	r3, 0
 8011dfc:	a069      	st.b      	r3, (r0, 0x9)
}
 8011dfe:	1490      	pop      	r15
	assert(Sec <= 59);
 8011e00:	106a      	lrw      	r3, 0x8015378	// 8011e28 <time2string+0xec>
 8011e02:	104b      	lrw      	r2, 0x8015324	// 8011e2c <time2string+0xf0>
 8011e04:	3157      	movi      	r1, 87
 8011e06:	100b      	lrw      	r0, 0x8015348	// 8011e30 <time2string+0xf4>
 8011e08:	e0001986 	bsr      	0x8015114	// 8015114 <__assert_fail>
	assert(Min <= 59);
 8011e0c:	106a      	lrw      	r3, 0x801536c	// 8011e34 <time2string+0xf8>
 8011e0e:	1048      	lrw      	r2, 0x8015324	// 8011e2c <time2string+0xf0>
 8011e10:	3156      	movi      	r1, 86
 8011e12:	1008      	lrw      	r0, 0x8015348	// 8011e30 <time2string+0xf4>
 8011e14:	e0001980 	bsr      	0x8015114	// 8015114 <__assert_fail>
	assert(str != NULL);
 8011e18:	1068      	lrw      	r3, 0x801533c	// 8011e38 <time2string+0xfc>
 8011e1a:	1045      	lrw      	r2, 0x8015324	// 8011e2c <time2string+0xf0>
 8011e1c:	3154      	movi      	r1, 84
 8011e1e:	1005      	lrw      	r0, 0x8015348	// 8011e30 <time2string+0xf4>
 8011e20:	e000197a 	bsr      	0x8015114	// 8015114 <__assert_fail>
 8011e24:	08015360 	.long	0x08015360
 8011e28:	08015378 	.long	0x08015378
 8011e2c:	08015324 	.long	0x08015324
 8011e30:	08015348 	.long	0x08015348
 8011e34:	0801536c 	.long	0x0801536c
 8011e38:	0801533c 	.long	0x0801533c

08011e3c <Write_Flash>:
	}
	
}

void Write_Flash(INA226_VALUE *ina226_value)
{
 8011e3c:	14d1      	push      	r4, r15
	uint16_t state;
	state = HAL_FLASH_Write(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
 8011e3e:	e4200013 	addi      	r1, r0, 20
{
 8011e42:	6d03      	mov      	r4, r0
	state = HAL_FLASH_Write(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
 8011e44:	3208      	movi      	r2, 8
 8011e46:	ea200008 	movih      	r0, 8
 8011e4a:	e0000baf 	bsr      	0x80135a8	// 80135a8 <HAL_FLASH_Write>
	if(state == HAL_ERROR)
 8011e4e:	7401      	zexth      	r0, r0
 8011e50:	3841      	cmpnei      	r0, 1
 8011e52:	0c11      	bf      	0x8011e74	// 8011e74 <Write_Flash+0x38>
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
	*/ 
	state = HAL_FLASH_Write(Fash_Addr+20, (uint8_t *)&ina226_value->mAh, sizeof(ina226_value->mAh)/sizeof(uint8_t));
 8011e54:	3204      	movi      	r2, 4
 8011e56:	e4240023 	addi      	r1, r4, 36
 8011e5a:	c6405020 	bmaski      	r0, 19
 8011e5e:	2014      	addi      	r0, 21
 8011e60:	e0000ba4 	bsr      	0x80135a8	// 80135a8 <HAL_FLASH_Write>
	if(state == HAL_ERROR)
 8011e64:	7401      	zexth      	r0, r0
 8011e66:	3841      	cmpnei      	r0, 1
 8011e68:	0c02      	bf      	0x8011e6c	// 8011e6c <Write_Flash+0x30>
	{
		printf("write FLASH er...\r\n");
	}
}
 8011e6a:	1491      	pop      	r4, r15
		printf("write FLASH er...\r\n");
 8011e6c:	1004      	lrw      	r0, 0x8015304	// 8011e7c <Write_Flash+0x40>
 8011e6e:	e3fffe3f 	bsr      	0x8011aec	// 8011aec <__GI_puts>
}
 8011e72:	1491      	pop      	r4, r15
		printf("write FLASH er...\r\n");
 8011e74:	1002      	lrw      	r0, 0x8015304	// 8011e7c <Write_Flash+0x40>
 8011e76:	e3fffe3b 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 8011e7a:	07ed      	br      	0x8011e54	// 8011e54 <Write_Flash+0x18>
 8011e7c:	08015304 	.long	0x08015304

08011e80 <Read_Flash>:


void Read_Flash(INA226_VALUE *ina226_value)
{
 8011e80:	14d1      	push      	r4, r15
	uint16_t state;
	state = HAL_FLASH_Read(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
 8011e82:	e4200013 	addi      	r1, r0, 20
{
 8011e86:	6d03      	mov      	r4, r0
	state = HAL_FLASH_Read(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
 8011e88:	3208      	movi      	r2, 8
 8011e8a:	ea200008 	movih      	r0, 8
 8011e8e:	e0000b55 	bsr      	0x8013538	// 8013538 <HAL_FLASH_Read>
	if(state == HAL_ERROR)
 8011e92:	7401      	zexth      	r0, r0
 8011e94:	3841      	cmpnei      	r0, 1
 8011e96:	0c11      	bf      	0x8011eb8	// 8011eb8 <Read_Flash+0x38>
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
	*/
	state = HAL_FLASH_Read(Fash_Addr+20, (uint8_t *)&ina226_value->mAh, sizeof(ina226_value->mAh)/sizeof(uint8_t));
 8011e98:	3204      	movi      	r2, 4
 8011e9a:	e4240023 	addi      	r1, r4, 36
 8011e9e:	c6405020 	bmaski      	r0, 19
 8011ea2:	2014      	addi      	r0, 21
 8011ea4:	e0000b4a 	bsr      	0x8013538	// 8013538 <HAL_FLASH_Read>
	if(state == HAL_ERROR)
 8011ea8:	7401      	zexth      	r0, r0
 8011eaa:	3841      	cmpnei      	r0, 1
 8011eac:	0c02      	bf      	0x8011eb0	// 8011eb0 <Read_Flash+0x30>
	{
		printf("write FLASH er...\r\n");
	}
}
 8011eae:	1491      	pop      	r4, r15
		printf("write FLASH er...\r\n");
 8011eb0:	1004      	lrw      	r0, 0x8015304	// 8011ec0 <Read_Flash+0x40>
 8011eb2:	e3fffe1d 	bsr      	0x8011aec	// 8011aec <__GI_puts>
}
 8011eb6:	1491      	pop      	r4, r15
		printf("write FLASH er...\r\n");
 8011eb8:	1002      	lrw      	r0, 0x8015304	// 8011ec0 <Read_Flash+0x40>
 8011eba:	e3fffe19 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 8011ebe:	07ed      	br      	0x8011e98	// 8011e98 <Read_Flash+0x18>
 8011ec0:	08015304 	.long	0x08015304

08011ec4 <OLED_Show>:

void OLED_Show(INA226_VALUE *ina226_value)
{
 8011ec4:	14d3      	push      	r4-r6, r15
 8011ec6:	1421      	subi      	r14, r14, 4
 8011ec8:	f40e2408 	fsts      	fr8, (r14, 0x0)
 8011ecc:	142c      	subi      	r14, r14, 48
	uint8_t string[40] = {0};
	num2char(string,ina226_value->Bus_V/1000,2,3,"V");
 8011ece:	ea23447a 	movih      	r3, 17530
 8011ed2:	f4002000 	flds      	fr0, (r0, 0x0)
 8011ed6:	f4031b68 	fmtvrl      	fr8, r3
	uint8_t string[40] = {0};
 8011eda:	3400      	movi      	r4, 0
	num2char(string,ina226_value->Bus_V/1000,2,3,"V");
 8011edc:	f5000300 	fdivs      	fr0, fr0, fr8
{
 8011ee0:	6d43      	mov      	r5, r0
	uint8_t string[40] = {0};
 8011ee2:	b882      	st.w      	r4, (r14, 0x8)
 8011ee4:	b883      	st.w      	r4, (r14, 0xc)
 8011ee6:	b884      	st.w      	r4, (r14, 0x10)
 8011ee8:	b885      	st.w      	r4, (r14, 0x14)
 8011eea:	b886      	st.w      	r4, (r14, 0x18)
 8011eec:	b887      	st.w      	r4, (r14, 0x1c)
 8011eee:	b888      	st.w      	r4, (r14, 0x20)
 8011ef0:	b889      	st.w      	r4, (r14, 0x24)
 8011ef2:	b88a      	st.w      	r4, (r14, 0x28)
 8011ef4:	b88b      	st.w      	r4, (r14, 0x2c)
	num2char(string,ina226_value->Bus_V/1000,2,3,"V");
 8011ef6:	e3fff70b 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8011efa:	6f47      	mov      	r13, r1
 8011efc:	3603      	movi      	r6, 3
 8011efe:	1170      	lrw      	r3, 0x80152f4	// 8011fbc <OLED_Show+0xf8>
 8011f00:	6cb7      	mov      	r2, r13
 8011f02:	b861      	st.w      	r3, (r14, 0x4)
 8011f04:	6c43      	mov      	r1, r0
 8011f06:	b8c0      	st.w      	r6, (r14, 0x0)
 8011f08:	1802      	addi      	r0, r14, 8
 8011f0a:	3302      	movi      	r3, 2
 8011f0c:	e3fffe8e 	bsr      	0x8011c28	// 8011c28 <num2char>
	OLED_ShowString(0,0,string,16);
 8011f10:	1a02      	addi      	r2, r14, 8
 8011f12:	3310      	movi      	r3, 16
 8011f14:	6c53      	mov      	r1, r4
 8011f16:	6c13      	mov      	r0, r4
 8011f18:	e0000424 	bsr      	0x8012760	// 8012760 <OLED_ShowString>
	
	num2char(string,ina226_value->Current/1000,1,3,"A");
 8011f1c:	f4052020 	flds      	fr0, (r5, 0x8)
 8011f20:	f5000300 	fdivs      	fr0, fr0, fr8
 8011f24:	e3fff6f4 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8011f28:	6f47      	mov      	r13, r1
 8011f2a:	1166      	lrw      	r3, 0x80152f8	// 8011fc0 <OLED_Show+0xfc>
 8011f2c:	6cb7      	mov      	r2, r13
 8011f2e:	b861      	st.w      	r3, (r14, 0x4)
 8011f30:	6c43      	mov      	r1, r0
 8011f32:	b8c0      	st.w      	r6, (r14, 0x0)
 8011f34:	1802      	addi      	r0, r14, 8
 8011f36:	3301      	movi      	r3, 1
 8011f38:	e3fffe78 	bsr      	0x8011c28	// 8011c28 <num2char>
	//printf(" string:  %s %d  %d ",string,ina226_value->Current,ina226_value->Current/1000);
	OLED_ShowString(68,0,string,16);
 8011f3c:	1a02      	addi      	r2, r14, 8
 8011f3e:	3310      	movi      	r3, 16
 8011f40:	6c53      	mov      	r1, r4
 8011f42:	3044      	movi      	r0, 68
 8011f44:	e000040e 	bsr      	0x8012760	// 8012760 <OLED_ShowString>
	
	num2char(string,ina226_value->Power,2,3,"W");
 8011f48:	f4052030 	flds      	fr0, (r5, 0xc)
 8011f4c:	e3fff6e0 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8011f50:	6f47      	mov      	r13, r1
 8011f52:	107d      	lrw      	r3, 0x80152fc	// 8011fc4 <OLED_Show+0x100>
 8011f54:	6cb7      	mov      	r2, r13
 8011f56:	b861      	st.w      	r3, (r14, 0x4)
 8011f58:	6c43      	mov      	r1, r0
 8011f5a:	b8c0      	st.w      	r6, (r14, 0x0)
 8011f5c:	1802      	addi      	r0, r14, 8
 8011f5e:	3302      	movi      	r3, 2
 8011f60:	e3fffe64 	bsr      	0x8011c28	// 8011c28 <num2char>
	OLED_ShowString(0,2,string,12);
 8011f64:	1a02      	addi      	r2, r14, 8
 8011f66:	6c13      	mov      	r0, r4
 8011f68:	330c      	movi      	r3, 12
 8011f6a:	3102      	movi      	r1, 2
 8011f6c:	e00003fa 	bsr      	0x8012760	// 8012760 <OLED_ShowString>
	
	
	time2string(string,INA226_Value.Time.Hour, INA226_Value.Time.Min, INA226_Value.Time.Sec);
 8011f70:	1036      	lrw      	r1, 0x20003210	// 8011fc8 <OLED_Show+0x104>
 8011f72:	1802      	addi      	r0, r14, 8
 8011f74:	817e      	ld.b      	r3, (r1, 0x1e)
 8011f76:	815d      	ld.b      	r2, (r1, 0x1d)
 8011f78:	813c      	ld.b      	r1, (r1, 0x1c)
 8011f7a:	e3fffee1 	bsr      	0x8011d3c	// 8011d3c <time2string>
	OLED_ShowString(0,3,string,12);
 8011f7e:	1a02      	addi      	r2, r14, 8
 8011f80:	330c      	movi      	r3, 12
 8011f82:	6c5b      	mov      	r1, r6
 8011f84:	6c13      	mov      	r0, r4
 8011f86:	e00003ed 	bsr      	0x8012760	// 8012760 <OLED_ShowString>
	
	
	num2char(string,ina226_value->mAh,4,0,"mAh");
 8011f8a:	f4052090 	flds      	fr0, (r5, 0x24)
 8011f8e:	e3fff6bf 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8011f92:	6f47      	mov      	r13, r1
 8011f94:	106e      	lrw      	r3, 0x8015300	// 8011fcc <OLED_Show+0x108>
 8011f96:	6cb7      	mov      	r2, r13
 8011f98:	b861      	st.w      	r3, (r14, 0x4)
 8011f9a:	6c43      	mov      	r1, r0
 8011f9c:	b880      	st.w      	r4, (r14, 0x0)
 8011f9e:	1802      	addi      	r0, r14, 8
 8011fa0:	3304      	movi      	r3, 4
 8011fa2:	e3fffe43 	bsr      	0x8011c28	// 8011c28 <num2char>
	//printf("%s ",string);
	OLED_ShowString(60,2,string,12);
 8011fa6:	330c      	movi      	r3, 12
 8011fa8:	1a02      	addi      	r2, r14, 8
 8011faa:	3102      	movi      	r1, 2
 8011fac:	303c      	movi      	r0, 60
 8011fae:	e00003d9 	bsr      	0x8012760	// 8012760 <OLED_ShowString>
	
}
 8011fb2:	140c      	addi      	r14, r14, 48
 8011fb4:	f40e2008 	flds      	fr8, (r14, 0x0)
 8011fb8:	1401      	addi      	r14, r14, 4
 8011fba:	1493      	pop      	r4-r6, r15
 8011fbc:	080152f4 	.long	0x080152f4
 8011fc0:	080152f8 	.long	0x080152f8
 8011fc4:	080152fc 	.long	0x080152fc
 8011fc8:	20003210 	.long	0x20003210
 8011fcc:	08015300 	.long	0x08015300

08011fd0 <main>:
{
 8011fd0:	14d8      	push      	r4-r11, r15
	SystemClock_Config(CPU_CLK_240M);
 8011fd2:	3002      	movi      	r0, 2
 8011fd4:	e00006d8 	bsr      	0x8012d84	// 8012d84 <SystemClock_Config>
	printf("enter main\r\n");
 8011fd8:	1115      	lrw      	r0, 0x8015330	// 80120ac <main+0xdc>
 8011fda:	e3fffd89 	bsr      	0x8011aec	// 8011aec <__GI_puts>
	HAL_Init();
 8011fde:	e0000849 	bsr      	0x8013070	// 8013070 <HAL_Init>
	Read_Flash(&INA226_Value);
 8011fe2:	1114      	lrw      	r0, 0x20003210	// 80120b0 <main+0xe0>
 8011fe4:	e3ffff4e 	bsr      	0x8011e80	// 8011e80 <Read_Flash>
	HAL_Delay(100);
 8011fe8:	3064      	movi      	r0, 100
 8011fea:	e000070b 	bsr      	0x8012e00	// 8012e00 <HAL_Delay>
	GPIO_Init();
 8011fee:	e000025f 	bsr      	0x80124ac	// 80124ac <GPIO_Init>
	OLED_Init();
 8011ff2:	e00003d5 	bsr      	0x801279c	// 801279c <OLED_Init>
	INA226_Init();
 8011ff6:	e00005cd 	bsr      	0x8012b90	// 8012b90 <INA226_Init>
	ADC_Init(ADC_4,1000);
 8011ffa:	ea0103e8 	movi      	r1, 1000
 8011ffe:	3003      	movi      	r0, 3
 8012000:	e000021e 	bsr      	0x801243c	// 801243c <ADC_Init>
	ADC_Init(ADC_VOL,1000);
 8012004:	ea0103e8 	movi      	r1, 1000
 8012008:	3005      	movi      	r0, 5
 801200a:	e0000219 	bsr      	0x801243c	// 801243c <ADC_Init>
	ADC_Init(ADC_TEMP,1000);
 801200e:	ea0103e8 	movi      	r1, 1000
 8012012:	3004      	movi      	r0, 4
 8012014:	e0000214 	bsr      	0x801243c	// 801243c <ADC_Init>
	TIM_Init_Us(TIM0,100000);
 8012018:	ea0186a0 	movi      	r1, 34464
 801201c:	39b0      	bseti      	r1, 16
 801201e:	3000      	movi      	r0, 0
 8012020:	e000028a 	bsr      	0x8012534	// 8012534 <TIM_Init_Us>
	HAL_TIM_Base_Start_IT(&htim[TIM0]);
 8012024:	1104      	lrw      	r0, 0x20001b84	// 80120b4 <main+0xe4>
 8012026:	e0000bb5 	bsr      	0x8013790	// 8013790 <HAL_TIM_Base_Start_IT>
 801202a:	ea03033e 	movi      	r3, 830
  \brief   No Operation
  \details No Operation does nothing. This instruction can be used for code alignment purposes.
 */
__ALWAYS_STATIC_INLINE void __NOP(void)
{
    __ASM volatile("nop");
 801202e:	6c03      	mov      	r0, r0
 8012030:	e823ffff 	bnezad      	r3, 0x801202e	// 801202e <main+0x5e>
 8012034:	10bf      	lrw      	r5, 0x20003210	// 80120b0 <main+0xe0>
	OLED_Clear();
 8012036:	e00002cd 	bsr      	0x80125d0	// 80125d0 <OLED_Clear>
 801203a:	ea8a0020 	lrw      	r10, 0x20000160	// 80120b8 <main+0xe8>
 801203e:	1180      	lrw      	r4, 0x20001b81	// 80120bc <main+0xec>
		Get_INA226_All_Value(&INA226_Value);
 8012040:	6e57      	mov      	r9, r5
			Show_Flage = 0;
 8012042:	ea080000 	movi      	r8, 0
			INA226_Value.Time.All_Sec = 0;
 8012046:	3600      	movi      	r6, 0
 8012048:	3700      	movi      	r7, 0
			INA226_Value.Power_All = 0;
 801204a:	ea0b0000 	movi      	r11, 0
 801204e:	040a      	br      	0x8012062	// 8012062 <main+0x92>
		if(1 == key_flag)
 8012050:	8460      	ld.b      	r3, (r4, 0x0)
 8012052:	3b41      	cmpnei      	r3, 1
 8012054:	0c19      	bf      	0x8012086	// 8012086 <main+0xb6>
		}else if(2 == key_flag)
 8012056:	8460      	ld.b      	r3, (r4, 0x0)
 8012058:	3b42      	cmpnei      	r3, 2
 801205a:	0c25      	bf      	0x80120a4	// 80120a4 <main+0xd4>
		HAL_Delay(54);
 801205c:	3036      	movi      	r0, 54
 801205e:	e00006d1 	bsr      	0x8012e00	// 8012e00 <HAL_Delay>
		Get_INA226_All_Value(&INA226_Value);
 8012062:	6c27      	mov      	r0, r9
 8012064:	e000055e 	bsr      	0x8012b20	// 8012b20 <Get_INA226_All_Value>
		if(1 == Show_Flage)
 8012068:	d86a0000 	ld.b      	r3, (r10, 0x0)
 801206c:	e903fff2 	bez      	r3, 0x8012050	// 8012050 <main+0x80>
			Write_Flash(&INA226_Value);
 8012070:	6c27      	mov      	r0, r9
 8012072:	e3fffee5 	bsr      	0x8011e3c	// 8011e3c <Write_Flash>
			OLED_Show(&INA226_Value);
 8012076:	6c27      	mov      	r0, r9
 8012078:	e3ffff26 	bsr      	0x8011ec4	// 8011ec4 <OLED_Show>
		if(1 == key_flag)
 801207c:	8460      	ld.b      	r3, (r4, 0x0)
 801207e:	3b41      	cmpnei      	r3, 1
			Show_Flage = 0;
 8012080:	dd0a0000 	st.b      	r8, (r10, 0x0)
		if(1 == key_flag)
 8012084:	0be9      	bt      	0x8012056	// 8012056 <main+0x86>
			INA226_Value.Time.All_Sec = 0;
 8012086:	b5c5      	st.w      	r6, (r5, 0x14)
 8012088:	b5e6      	st.w      	r7, (r5, 0x18)
			INA226_Value.Time.Hour = 0;
 801208a:	dd05001c 	st.b      	r8, (r5, 0x1c)
			INA226_Value.Time.Min = 0;
 801208e:	dd05001d 	st.b      	r8, (r5, 0x1d)
			INA226_Value.Time.Sec = 0;
 8012092:	dd05001e 	st.b      	r8, (r5, 0x1e)
			INA226_Value.Power_All = 0;
 8012096:	dd652008 	st.w      	r11, (r5, 0x20)
			INA226_Value.mAh = 0;
 801209a:	dd652009 	st.w      	r11, (r5, 0x24)
			key_flag = 0;
 801209e:	dd040000 	st.b      	r8, (r4, 0x0)
 80120a2:	07dd      	br      	0x801205c	// 801205c <main+0x8c>
			key_flag = 0;
 80120a4:	dd040000 	st.b      	r8, (r4, 0x0)
 80120a8:	07da      	br      	0x801205c	// 801205c <main+0x8c>
 80120aa:	0000      	.short	0x0000
 80120ac:	08015330 	.long	0x08015330
 80120b0:	20003210 	.long	0x20003210
 80120b4:	20001b84 	.long	0x20001b84
 80120b8:	20000160 	.long	0x20000160
 80120bc:	20001b81 	.long	0x20001b81

080120c0 <HAL_TIM_Callback>:



//可以理解成定时器服务函数
void HAL_TIM_Callback(TIM_HandleTypeDef *htim)
{
 80120c0:	1426      	subi      	r14, r14, 24
 80120c2:	b880      	st.w      	r4, (r14, 0x0)
 80120c4:	b8a1      	st.w      	r5, (r14, 0x4)
 80120c6:	b8c2      	st.w      	r6, (r14, 0x8)
 80120c8:	dd0e2003 	st.w      	r8, (r14, 0xc)
 80120cc:	dd2e2004 	st.w      	r9, (r14, 0x10)
 80120d0:	ddee2005 	st.w      	r15, (r14, 0x14)
 80120d4:	1421      	subi      	r14, r14, 4
 80120d6:	f40e2408 	fsts      	fr8, (r14, 0x0)
		else
			adc_num--;
		HAL_PWM_Duty_Set(&hpwm[PWM_CHANNEL_0], PWM_CHANNEL_0, adc_num);
		*/
	}
	else if (htim->Instance == TIM0)
 80120da:	90a0      	ld.w      	r5, (r0, 0x0)
 80120dc:	e9250038 	bnez      	r5, 0x801214c	// 801214c <HAL_TIM_Callback+0x8c>
	{	
		time_num++;
 80120e0:	11db      	lrw      	r6, 0x20001b80	// 80121cc <HAL_TIM_Callback+0x10c>
		if(INA226_Value.Current > 1)
 80120e2:	ea223f80 	movih      	r2, 16256
 80120e6:	119b      	lrw      	r4, 0x20003210	// 80121d0 <HAL_TIM_Callback+0x110>
		time_num++;
 80120e8:	8660      	ld.b      	r3, (r6, 0x0)
		if(INA226_Value.Current > 1)
 80120ea:	f4021b60 	fmtvrl      	fr0, r2
 80120ee:	f4042028 	flds      	fr8, (r4, 0x8)
		time_num++;
 80120f2:	2300      	addi      	r3, 1
		if(INA226_Value.Current > 1)
 80120f4:	f50001a0 	fcmplts      	fr0, fr8
		time_num++;
 80120f8:	74cc      	zextb      	r3, r3
 80120fa:	a660      	st.b      	r3, (r6, 0x0)
		{//计算时间
			
			if(time_num >= 10)
 80120fc:	3209      	movi      	r2, 9
		if(INA226_Value.Current > 1)
 80120fe:	0c63      	bf      	0x80121c4	// 80121c4 <HAL_TIM_Callback+0x104>
			if(time_num >= 10)
 8012100:	64c8      	cmphs      	r2, r3
 8012102:	0c33      	bf      	0x8012168	// 8012168 <HAL_TIM_Callback+0xa8>
				time_num = 0;
			}
		
			//INA226_Value.Power_All += INA226_Value.Power;
			
			INA226_Value.mAh = INA226_Value.Current/ (3600*10) + INA226_Value.mAh;
 8012104:	1154      	lrw      	r2, 0x470ca000	// 80121d4 <HAL_TIM_Callback+0x114>
 8012106:	f4021b62 	fmtvrl      	fr2, r2
 801210a:	f4042090 	flds      	fr0, (r4, 0x24)
 801210e:	f4480301 	fdivs      	fr1, fr8, fr2
 8012112:	f4010001 	fadds      	fr1, fr1, fr0
			
			INA226_Value.Wh += (INA226_Value.Current / 1000) * (INA226_Value.Bus_V / 1000) / (3600*10);
 8012116:	ea22447a 	movih      	r2, 17530
			INA226_Value.mAh = INA226_Value.Current/ (3600*10) + INA226_Value.mAh;
 801211a:	f4042491 	fsts      	fr1, (r4, 0x24)
			INA226_Value.Wh += (INA226_Value.Current / 1000) * (INA226_Value.Bus_V / 1000) / (3600*10);
 801211e:	f4042000 	flds      	fr0, (r4, 0x0)
 8012122:	f4021b61 	fmtvrl      	fr1, r2
 8012126:	f4200300 	fdivs      	fr0, fr0, fr1
 801212a:	f4280308 	fdivs      	fr8, fr8, fr1
 801212e:	f5000200 	fmuls      	fr0, fr0, fr8
 8012132:	f40420a1 	flds      	fr1, (r4, 0x28)
 8012136:	f4400300 	fdivs      	fr0, fr0, fr2
 801213a:	f4200000 	fadds      	fr0, fr0, fr1
 801213e:	f40424a0 	fsts      	fr0, (r4, 0x28)
		{
			if(time_num >= 10)
				time_num = 0;
		}
		
		if(0 == time_num )
 8012142:	e9230005 	bnez      	r3, 0x801214c	// 801214c <HAL_TIM_Callback+0x8c>
			Show_Flage = 1;
 8012146:	1165      	lrw      	r3, 0x20000160	// 80121d8 <HAL_TIM_Callback+0x118>
 8012148:	3201      	movi      	r2, 1
 801214a:	a340      	st.b      	r2, (r3, 0x0)
		
	}

	
}
 801214c:	f40e2008 	flds      	fr8, (r14, 0x0)
 8012150:	1401      	addi      	r14, r14, 4
 8012152:	d9ee2005 	ld.w      	r15, (r14, 0x14)
 8012156:	d92e2004 	ld.w      	r9, (r14, 0x10)
 801215a:	d90e2003 	ld.w      	r8, (r14, 0xc)
 801215e:	98c2      	ld.w      	r6, (r14, 0x8)
 8012160:	98a1      	ld.w      	r5, (r14, 0x4)
 8012162:	9880      	ld.w      	r4, (r14, 0x0)
 8012164:	1406      	addi      	r14, r14, 24
 8012166:	783c      	jmp      	r15
				INA226_Value.Time.All_Sec++;
 8012168:	d9042005 	ld.w      	r8, (r4, 0x14)
 801216c:	d9242006 	ld.w      	r9, (r4, 0x18)
 8012170:	e5080000 	addi      	r8, r8, 1
 8012174:	eb480000 	cmpnei      	r8, 0
 8012178:	c5290c21 	incf      	r9, r9, 1
 801217c:	dd042005 	st.w      	r8, (r4, 0x14)
 8012180:	dd242006 	st.w      	r9, (r4, 0x18)
				INA226_Value.Time.Hour = INA226_Value.Time.All_Sec/(60*60);
 8012184:	ea020e10 	movi      	r2, 3600
 8012188:	3300      	movi      	r3, 0
 801218a:	6c23      	mov      	r0, r8
 801218c:	6c67      	mov      	r1, r9
 801218e:	e3fff293 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8012192:	a41c      	st.b      	r0, (r4, 0x1c)
				INA226_Value.Time.Min = (INA226_Value.Time.All_Sec%(60*60))/60;
 8012194:	ea020e10 	movi      	r2, 3600
 8012198:	3300      	movi      	r3, 0
 801219a:	6c23      	mov      	r0, r8
 801219c:	6c67      	mov      	r1, r9
 801219e:	e3fff425 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 80121a2:	323c      	movi      	r2, 60
 80121a4:	3300      	movi      	r3, 0
 80121a6:	6e03      	mov      	r8, r0
 80121a8:	6e47      	mov      	r9, r1
 80121aa:	e3fff285 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 80121ae:	a41d      	st.b      	r0, (r4, 0x1d)
				INA226_Value.Time.Sec = (INA226_Value.Time.All_Sec%(60*60))%60;
 80121b0:	3300      	movi      	r3, 0
 80121b2:	323c      	movi      	r2, 60
 80121b4:	6c23      	mov      	r0, r8
 80121b6:	6c67      	mov      	r1, r9
 80121b8:	e3fff418 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 80121bc:	a41e      	st.b      	r0, (r4, 0x1e)
				time_num = 0;
 80121be:	a6a0      	st.b      	r5, (r6, 0x0)
 80121c0:	6cd7      	mov      	r3, r5
 80121c2:	07a1      	br      	0x8012104	// 8012104 <HAL_TIM_Callback+0x44>
			if(time_num >= 10)
 80121c4:	64c8      	cmphs      	r2, r3
 80121c6:	0bbe      	bt      	0x8012142	// 8012142 <HAL_TIM_Callback+0x82>
				time_num = 0;
 80121c8:	a6a0      	st.b      	r5, (r6, 0x0)
 80121ca:	07be      	br      	0x8012146	// 8012146 <HAL_TIM_Callback+0x86>
 80121cc:	20001b80 	.long	0x20001b80
 80121d0:	20003210 	.long	0x20003210
 80121d4:	470ca000 	.long	0x470ca000
 80121d8:	20000160 	.long	0x20000160

080121dc <HAL_MspInit>:
#include "wm_hal.h"

void HAL_MspInit(void)
{

}
 80121dc:	783c      	jmp      	r15
	...

080121e0 <HAL_TIM_Base_MspInit>:
	//HAL_GPIO_DeInit(GPIOB, GPIO_PIN_2);
	//HAL_GPIO_DeInit(GPIOB, GPIO_PIN_3);
}

void HAL_TIM_Base_MspInit(TIM_HandleTypeDef* htim_base)
{
 80121e0:	14d0      	push      	r15
	__HAL_RCC_TIM_CLK_ENABLE();
 80121e2:	ea224000 	movih      	r2, 16384
 80121e6:	e4420dff 	addi      	r2, r2, 3584
	HAL_NVIC_SetPriority(TIM_IRQn, 0);
 80121ea:	3100      	movi      	r1, 0
	__HAL_RCC_TIM_CLK_ENABLE();
 80121ec:	9260      	ld.w      	r3, (r2, 0x0)
 80121ee:	ec630400 	ori      	r3, r3, 1024
 80121f2:	b260      	st.w      	r3, (r2, 0x0)
	HAL_NVIC_SetPriority(TIM_IRQn, 0);
 80121f4:	301e      	movi      	r0, 30
 80121f6:	e0000611 	bsr      	0x8012e18	// 8012e18 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(TIM_IRQn);
 80121fa:	301e      	movi      	r0, 30
 80121fc:	e0000628 	bsr      	0x8012e4c	// 8012e4c <HAL_NVIC_EnableIRQ>
}
 8012200:	1490      	pop      	r15
	...

08012204 <HAL_ADC_MspInit>:
	HAL_GPIO_DeInit(GPIOB, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5);
}


void HAL_ADC_MspInit(ADC_HandleTypeDef* hadc)
{
 8012204:	14d0      	push      	r15
	if (hadc->Instance == ADC)
 8012206:	9040      	ld.w      	r2, (r0, 0x0)
 8012208:	ea234001 	movih      	r3, 16385
 801220c:	3ba9      	bseti      	r3, 9
 801220e:	64ca      	cmpne      	r2, r3
 8012210:	0c02      	bf      	0x8012214	// 8012214 <HAL_ADC_MspInit+0x10>
		
		// 如果用到中断方式需要使能中断
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
		HAL_NVIC_EnableIRQ(ADC_IRQn);
	}
}
 8012212:	1490      	pop      	r15
		__HAL_RCC_ADC_CLK_ENABLE();
 8012214:	ea234000 	movih      	r3, 16384
 8012218:	e4630dff 	addi      	r3, r3, 3584
 801221c:	9340      	ld.w      	r2, (r3, 0x0)
 801221e:	ec421000 	ori      	r2, r2, 4096
 8012222:	b340      	st.w      	r2, (r3, 0x0)
		__HAL_RCC_GPIO_CLK_ENABLE();
 8012224:	9340      	ld.w      	r2, (r3, 0x0)
 8012226:	ec420800 	ori      	r2, r2, 2048
 801222a:	b340      	st.w      	r2, (r3, 0x0)
		if (hadc->Init.channel == ADC_CHANNEL_0)
 801222c:	9061      	ld.w      	r3, (r0, 0x4)
 801222e:	e903002d 	bez      	r3, 0x8012288	// 8012288 <HAL_ADC_MspInit+0x84>
		else if (hadc->Init.channel == ADC_CHANNEL_1)
 8012232:	eb430100 	cmpnei      	r3, 256
 8012236:	0c41      	bf      	0x80122b8	// 80122b8 <HAL_ADC_MspInit+0xb4>
		else if (hadc->Init.channel == ADC_CHANNEL_2)
 8012238:	eb430200 	cmpnei      	r3, 512
 801223c:	0c4d      	bf      	0x80122d6	// 80122d6 <HAL_ADC_MspInit+0xd2>
		else if (hadc->Init.channel == ADC_CHANNEL_3)
 801223e:	eb430300 	cmpnei      	r3, 768
 8012242:	0c39      	bf      	0x80122b4	// 80122b4 <HAL_ADC_MspInit+0xb0>
		else if (hadc->Init.channel == ADC_CHANNEL_0_1)
 8012244:	eb430800 	cmpnei      	r3, 2048
 8012248:	0c56      	bf      	0x80122f4	// 80122f4 <HAL_ADC_MspInit+0xf0>
		else if (hadc->Init.channel == ADC_CHANNEL_2_3)
 801224a:	eb430900 	cmpnei      	r3, 2304
 801224e:	082b      	bt      	0x80122a4	// 80122a4 <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
 8012250:	1171      	lrw      	r3, 0x40011200	// 8012314 <HAL_ADC_MspInit+0x110>
 8012252:	9344      	ld.w      	r2, (r3, 0x10)
 8012254:	3a83      	bclri      	r2, 3
 8012256:	b344      	st.w      	r2, (r3, 0x10)
 8012258:	9342      	ld.w      	r2, (r3, 0x8)
 801225a:	3a83      	bclri      	r2, 3
 801225c:	b342      	st.w      	r2, (r3, 0x8)
 801225e:	9343      	ld.w      	r2, (r3, 0xc)
 8012260:	ec420008 	ori      	r2, r2, 8
 8012264:	b343      	st.w      	r2, (r3, 0xc)
 8012266:	9347      	ld.w      	r2, (r3, 0x1c)
 8012268:	3a83      	bclri      	r2, 3
 801226a:	b347      	st.w      	r2, (r3, 0x1c)
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 801226c:	9344      	ld.w      	r2, (r3, 0x10)
 801226e:	3a82      	bclri      	r2, 2
 8012270:	b344      	st.w      	r2, (r3, 0x10)
 8012272:	9342      	ld.w      	r2, (r3, 0x8)
 8012274:	3a82      	bclri      	r2, 2
 8012276:	b342      	st.w      	r2, (r3, 0x8)
 8012278:	9343      	ld.w      	r2, (r3, 0xc)
 801227a:	ec420004 	ori      	r2, r2, 4
 801227e:	b343      	st.w      	r2, (r3, 0xc)
 8012280:	9347      	ld.w      	r2, (r3, 0x1c)
 8012282:	3a82      	bclri      	r2, 2
 8012284:	b347      	st.w      	r2, (r3, 0x1c)
 8012286:	040f      	br      	0x80122a4	// 80122a4 <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
 8012288:	1163      	lrw      	r3, 0x40011200	// 8012314 <HAL_ADC_MspInit+0x110>
 801228a:	9344      	ld.w      	r2, (r3, 0x10)
 801228c:	3a81      	bclri      	r2, 1
 801228e:	b344      	st.w      	r2, (r3, 0x10)
 8012290:	9342      	ld.w      	r2, (r3, 0x8)
 8012292:	3a81      	bclri      	r2, 1
 8012294:	b342      	st.w      	r2, (r3, 0x8)
 8012296:	9343      	ld.w      	r2, (r3, 0xc)
 8012298:	ec420002 	ori      	r2, r2, 2
 801229c:	b343      	st.w      	r2, (r3, 0xc)
 801229e:	9347      	ld.w      	r2, (r3, 0x1c)
 80122a0:	3a81      	bclri      	r2, 1
 80122a2:	b347      	st.w      	r2, (r3, 0x1c)
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
 80122a4:	3100      	movi      	r1, 0
 80122a6:	300b      	movi      	r0, 11
 80122a8:	e00005b8 	bsr      	0x8012e18	// 8012e18 <HAL_NVIC_SetPriority>
		HAL_NVIC_EnableIRQ(ADC_IRQn);
 80122ac:	300b      	movi      	r0, 11
 80122ae:	e00005cf 	bsr      	0x8012e4c	// 8012e4c <HAL_NVIC_EnableIRQ>
}
 80122b2:	1490      	pop      	r15
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 80122b4:	1078      	lrw      	r3, 0x40011200	// 8012314 <HAL_ADC_MspInit+0x110>
 80122b6:	07db      	br      	0x801226c	// 801226c <HAL_ADC_MspInit+0x68>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
 80122b8:	1077      	lrw      	r3, 0x40011200	// 8012314 <HAL_ADC_MspInit+0x110>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
 80122ba:	9344      	ld.w      	r2, (r3, 0x10)
 80122bc:	3a84      	bclri      	r2, 4
 80122be:	b344      	st.w      	r2, (r3, 0x10)
 80122c0:	9342      	ld.w      	r2, (r3, 0x8)
 80122c2:	3a84      	bclri      	r2, 4
 80122c4:	b342      	st.w      	r2, (r3, 0x8)
 80122c6:	9343      	ld.w      	r2, (r3, 0xc)
 80122c8:	ec420010 	ori      	r2, r2, 16
 80122cc:	b343      	st.w      	r2, (r3, 0xc)
 80122ce:	9347      	ld.w      	r2, (r3, 0x1c)
 80122d0:	3a84      	bclri      	r2, 4
 80122d2:	b347      	st.w      	r2, (r3, 0x1c)
 80122d4:	07e8      	br      	0x80122a4	// 80122a4 <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
 80122d6:	1070      	lrw      	r3, 0x40011200	// 8012314 <HAL_ADC_MspInit+0x110>
 80122d8:	9344      	ld.w      	r2, (r3, 0x10)
 80122da:	3a83      	bclri      	r2, 3
 80122dc:	b344      	st.w      	r2, (r3, 0x10)
 80122de:	9342      	ld.w      	r2, (r3, 0x8)
 80122e0:	3a83      	bclri      	r2, 3
 80122e2:	b342      	st.w      	r2, (r3, 0x8)
 80122e4:	9343      	ld.w      	r2, (r3, 0xc)
 80122e6:	ec420008 	ori      	r2, r2, 8
 80122ea:	b343      	st.w      	r2, (r3, 0xc)
 80122ec:	9347      	ld.w      	r2, (r3, 0x1c)
 80122ee:	3a83      	bclri      	r2, 3
 80122f0:	b347      	st.w      	r2, (r3, 0x1c)
 80122f2:	07d9      	br      	0x80122a4	// 80122a4 <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
 80122f4:	1068      	lrw      	r3, 0x40011200	// 8012314 <HAL_ADC_MspInit+0x110>
 80122f6:	9344      	ld.w      	r2, (r3, 0x10)
 80122f8:	3a81      	bclri      	r2, 1
 80122fa:	b344      	st.w      	r2, (r3, 0x10)
 80122fc:	9342      	ld.w      	r2, (r3, 0x8)
 80122fe:	3a81      	bclri      	r2, 1
 8012300:	b342      	st.w      	r2, (r3, 0x8)
 8012302:	9343      	ld.w      	r2, (r3, 0xc)
 8012304:	ec420002 	ori      	r2, r2, 2
 8012308:	b343      	st.w      	r2, (r3, 0xc)
 801230a:	9347      	ld.w      	r2, (r3, 0x1c)
 801230c:	3a81      	bclri      	r2, 1
 801230e:	b347      	st.w      	r2, (r3, 0x1c)
 8012310:	07d5      	br      	0x80122ba	// 80122ba <HAL_ADC_MspInit+0xb6>
 8012312:	0000      	.short	0x0000
 8012314:	40011200 	.long	0x40011200

08012318 <CORET_IRQHandler>:

#include "wm_hal.h"

__attribute__((isr)) void CORET_IRQHandler(void)
{
 8012318:	1460      	nie
 801231a:	1462      	ipush
 801231c:	142e      	subi      	r14, r14, 56
 801231e:	d64e1c2d 	stm      	r18-r31, (r14)
 8012322:	1428      	subi      	r14, r14, 32
 8012324:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012328:	14d0      	push      	r15
	uint32_t temp;
	
	temp = (*(volatile unsigned int *) (0xE000E010));
 801232a:	1068      	lrw      	r3, 0xe000e000	// 8012348 <CORET_IRQHandler+0x30>
 801232c:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 801232e:	e000055b 	bsr      	0x8012de4	// 8012de4 <HAL_IncTick>
}
 8012332:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8012336:	1401      	addi      	r14, r14, 4
 8012338:	f4ee3000 	fldms      	fr0-fr7, (r14)
 801233c:	1408      	addi      	r14, r14, 32
 801233e:	d24e1c2d 	ldm      	r18-r31, (r14)
 8012342:	140e      	addi      	r14, r14, 56
 8012344:	1463      	ipop
 8012346:	1461      	nir
 8012348:	e000e000 	.long	0xe000e000

0801234c <GPIOA_IRQHandler>:

__attribute__((isr)) void GPIOA_IRQHandler(void)
{
 801234c:	1460      	nie
 801234e:	1462      	ipush
 8012350:	142e      	subi      	r14, r14, 56
 8012352:	d64e1c2d 	stm      	r18-r31, (r14)
 8012356:	1428      	subi      	r14, r14, 32
 8012358:	f4ee3400 	fstms      	fr0-fr7, (r14)
 	//HAL_GPIO_EXTI_IRQHandler(GPIOA, GPIO_PIN_0);
}
 801235c:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8012360:	1408      	addi      	r14, r14, 32
 8012362:	d24e1c2d 	ldm      	r18-r31, (r14)
 8012366:	140e      	addi      	r14, r14, 56
 8012368:	1463      	ipop
 801236a:	1461      	nir

0801236c <GPIOB_IRQHandler>:

__attribute__((isr)) void GPIOB_IRQHandler(void)
{
 801236c:	1460      	nie
 801236e:	1462      	ipush
 8012370:	142e      	subi      	r14, r14, 56
 8012372:	d64e1c2d 	stm      	r18-r31, (r14)
 8012376:	1428      	subi      	r14, r14, 32
 8012378:	f4ee3400 	fstms      	fr0-fr7, (r14)
 801237c:	14d0      	push      	r15
	HAL_GPIO_EXTI_IRQHandler(GPIOB, GPIO_PIN_18);
 801237e:	ea210004 	movih      	r1, 4
 8012382:	100a      	lrw      	r0, 0x40011400	// 80123a8 <GPIOB_IRQHandler+0x3c>
 8012384:	e0000668 	bsr      	0x8013054	// 8013054 <HAL_GPIO_EXTI_IRQHandler>
	HAL_GPIO_EXTI_IRQHandler(GPIOB, GPIO_PIN_26);
 8012388:	ea210400 	movih      	r1, 1024
 801238c:	1007      	lrw      	r0, 0x40011400	// 80123a8 <GPIOB_IRQHandler+0x3c>
 801238e:	e0000663 	bsr      	0x8013054	// 8013054 <HAL_GPIO_EXTI_IRQHandler>
}
 8012392:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8012396:	1401      	addi      	r14, r14, 4
 8012398:	f4ee3000 	fldms      	fr0-fr7, (r14)
 801239c:	1408      	addi      	r14, r14, 32
 801239e:	d24e1c2d 	ldm      	r18-r31, (r14)
 80123a2:	140e      	addi      	r14, r14, 56
 80123a4:	1463      	ipop
 80123a6:	1461      	nir
 80123a8:	40011400 	.long	0x40011400

080123ac <TIM0_5_IRQHandler>:


extern TIM_HandleTypeDef htim[6];

__attribute__((isr)) void TIM0_5_IRQHandler(void)
{
 80123ac:	1460      	nie
 80123ae:	1462      	ipush
 80123b0:	142e      	subi      	r14, r14, 56
 80123b2:	d64e1c2d 	stm      	r18-r31, (r14)
 80123b6:	1428      	subi      	r14, r14, 32
 80123b8:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80123bc:	14d1      	push      	r4, r15
	HAL_TIM_IRQHandler(&htim[0]);
 80123be:	108b      	lrw      	r4, 0x20001b84	// 80123e8 <TIM0_5_IRQHandler+0x3c>
 80123c0:	6c13      	mov      	r0, r4
 80123c2:	e0000a07 	bsr      	0x80137d0	// 80137d0 <HAL_TIM_IRQHandler>
	HAL_TIM_IRQHandler(&htim[1]);
 80123c6:	e4040017 	addi      	r0, r4, 24
 80123ca:	e0000a03 	bsr      	0x80137d0	// 80137d0 <HAL_TIM_IRQHandler>
}
 80123ce:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 80123d2:	9880      	ld.w      	r4, (r14, 0x0)
 80123d4:	1402      	addi      	r14, r14, 8
 80123d6:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80123da:	1408      	addi      	r14, r14, 32
 80123dc:	d24e1c2d 	ldm      	r18-r31, (r14)
 80123e0:	140e      	addi      	r14, r14, 56
 80123e2:	1463      	ipop
 80123e4:	1461      	nir
 80123e6:	0000      	.short	0x0000
 80123e8:	20001b84 	.long	0x20001b84

080123ec <ADC_IRQHandler>:

extern ADC_HandleTypeDef hadc[6];

__attribute__((isr)) void ADC_IRQHandler(void)
{
 80123ec:	1460      	nie
 80123ee:	1462      	ipush
 80123f0:	142e      	subi      	r14, r14, 56
 80123f2:	d64e1c2d 	stm      	r18-r31, (r14)
 80123f6:	1428      	subi      	r14, r14, 32
 80123f8:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80123fc:	14d1      	push      	r4, r15
 	HAL_ADC_IRQHandler(&hadc[1]);
 80123fe:	108b      	lrw      	r4, 0x20003258	// 8012428 <ADC_IRQHandler+0x3c>
 8012400:	6c13      	mov      	r0, r4
 8012402:	e000044f 	bsr      	0x8012ca0	// 8012ca0 <HAL_ADC_IRQHandler>
	HAL_ADC_IRQHandler(&hadc[5]);
 8012406:	e404006f 	addi      	r0, r4, 112
 801240a:	e000044b 	bsr      	0x8012ca0	// 8012ca0 <HAL_ADC_IRQHandler>
 801240e:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 8012412:	9880      	ld.w      	r4, (r14, 0x0)
 8012414:	1402      	addi      	r14, r14, 8
 8012416:	f4ee3000 	fldms      	fr0-fr7, (r14)
 801241a:	1408      	addi      	r14, r14, 32
 801241c:	d24e1c2d 	ldm      	r18-r31, (r14)
 8012420:	140e      	addi      	r14, r14, 56
 8012422:	1463      	ipop
 8012424:	1461      	nir
 8012426:	0000      	.short	0x0000
 8012428:	20003258 	.long	0x20003258

0801242c <Error_Handler_Adc>:
#include "adc.h"
 


void Error_Handler_Adc(void)
{
 801242c:	14d1      	push      	r4, r15
	while (1)
	{
		printf("Error_Handler adc\r\n");
 801242e:	1083      	lrw      	r4, 0x80153e8	// 8012438 <Error_Handler_Adc+0xc>
 8012430:	6c13      	mov      	r0, r4
 8012432:	e3fffb5d 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 8012436:	07fd      	br      	0x8012430	// 8012430 <Error_Handler_Adc+0x4>
 8012438:	080153e8 	.long	0x080153e8

0801243c <ADC_Init>:
	}
}


void ADC_Init(uint32_t adc_num, uint32_t freq)
{
 801243c:	14d0      	push      	r15
	#define ADC_CHANNEL_OFFSET	ADC_ANA_CR_CH_OFFSET
*/

	uint32_t ADC_CHANNEL;
	 /* 307hz ~ 2khz */
	switch(adc_num)
 801243e:	3805      	cmphsi      	r0, 6
 8012440:	082a      	bt      	0x8012494	// 8012494 <ADC_Init+0x58>
 8012442:	1063      	lrw      	r3, 0x8015384	// 801244c <ADC_Init+0x10>
 8012444:	d0030883 	ldr.w      	r3, (r3, r0 << 2)
 8012448:	780c      	jmp      	r3
 801244a:	0000      	.short	0x0000
 801244c:	08015384 	.long	0x08015384
	{
		case 0: ADC_CHANNEL = ADC_CHANNEL_0; break; 	//PA1
		case 1: ADC_CHANNEL = ADC_CHANNEL_1; break;		//PA4
		case 2: ADC_CHANNEL = ADC_CHANNEL_2; break;		//PA3
 8012450:	ea020200 	movi      	r2, 512
		case 4: ADC_CHANNEL = ADC_CHANNEL_TEMP; break;
		case 5: ADC_CHANNEL = ADC_CHANNEL_VOL; break;
		default : printf("adc init ADC_CHANNEL err, The number of channels is not between 0 and 3 \r\n");return; break;
	}
	
	hadc[adc_num].Instance = ADC;
 8012454:	1073      	lrw      	r3, 0x2000323c	// 80124a0 <ADC_Init+0x64>
 8012456:	ea0c001c 	movi      	r12, 28
 801245a:	7c30      	mult      	r0, r12
 801245c:	ea2c4001 	movih      	r12, 16385
 8012460:	c52c284c 	bseti      	r12, r12, 9
 8012464:	d403082c 	str.w      	r12, (r3, r0 << 0)
	hadc[adc_num].Init.channel = ADC_CHANNEL;
 8012468:	600c      	addu      	r0, r3
 801246a:	b041      	st.w      	r2, (r0, 0x4)
	hadc[adc_num].Init.freq = freq;
 801246c:	b022      	st.w      	r1, (r0, 0x8)
	
	if (HAL_ADC_Init(&hadc[adc_num]) != HAL_OK)
 801246e:	e00003a9 	bsr      	0x8012bc0	// 8012bc0 <HAL_ADC_Init>
 8012472:	e9200015 	bnez      	r0, 0x801249c	// 801249c <ADC_Init+0x60>
	{
		Error_Handler_Adc();
	}
}
 8012476:	1490      	pop      	r15
		case 3: ADC_CHANNEL = ADC_CHANNEL_3; break;		//PA2
 8012478:	ea020300 	movi      	r2, 768
 801247c:	07ec      	br      	0x8012454	// 8012454 <ADC_Init+0x18>
		case 4: ADC_CHANNEL = ADC_CHANNEL_TEMP; break;
 801247e:	ea020c00 	movi      	r2, 3072
 8012482:	07e9      	br      	0x8012454	// 8012454 <ADC_Init+0x18>
		case 5: ADC_CHANNEL = ADC_CHANNEL_VOL; break;
 8012484:	ea020d00 	movi      	r2, 3328
 8012488:	07e6      	br      	0x8012454	// 8012454 <ADC_Init+0x18>
		case 0: ADC_CHANNEL = ADC_CHANNEL_0; break; 	//PA1
 801248a:	6c83      	mov      	r2, r0
 801248c:	07e4      	br      	0x8012454	// 8012454 <ADC_Init+0x18>
		case 1: ADC_CHANNEL = ADC_CHANNEL_1; break;		//PA4
 801248e:	ea020100 	movi      	r2, 256
 8012492:	07e1      	br      	0x8012454	// 8012454 <ADC_Init+0x18>
		default : printf("adc init ADC_CHANNEL err, The number of channels is not between 0 and 3 \r\n");return; break;
 8012494:	1004      	lrw      	r0, 0x801539c	// 80124a4 <ADC_Init+0x68>
 8012496:	e3fffb2b 	bsr      	0x8011aec	// 8011aec <__GI_puts>
}
 801249a:	1490      	pop      	r15
		Error_Handler_Adc();
 801249c:	e3ffffc8 	bsr      	0x801242c	// 801242c <Error_Handler_Adc>
 80124a0:	2000323c 	.long	0x2000323c
 80124a4:	0801539c 	.long	0x0801539c

080124a8 <HAL_ADC_ConvCpltCallback>:

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	
}
 80124a8:	783c      	jmp      	r15
	...

080124ac <GPIO_Init>:
//KEY
volatile uint8_t key_flag = 0;


void GPIO_Init(void)
{
 80124ac:	14d1      	push      	r4, r15
 80124ae:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	
	__HAL_RCC_GPIO_CLK_ENABLE();
 80124b0:	ea224000 	movih      	r2, 16384
 80124b4:	e4420dff 	addi      	r2, r2, 3584
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 80124b8:	3400      	movi      	r4, 0
 80124ba:	b880      	st.w      	r4, (r14, 0x0)
 80124bc:	b881      	st.w      	r4, (r14, 0x4)
 80124be:	b882      	st.w      	r4, (r14, 0x8)
	__HAL_RCC_GPIO_CLK_ENABLE();
 80124c0:	9260      	ld.w      	r3, (r2, 0x0)
 80124c2:	ec630800 	ori      	r3, r3, 2048
 80124c6:	b260      	st.w      	r3, (r2, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
	*/
	
	GPIO_InitStruct.Pin = GPIO_PIN_18 | GPIO_PIN_26;
 80124c8:	ea230404 	movih      	r3, 1028
 80124cc:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
 80124ce:	3388      	movi      	r3, 136
 80124d0:	b861      	st.w      	r3, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80124d2:	6c7b      	mov      	r1, r14
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 80124d4:	3313      	movi      	r3, 19
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80124d6:	1007      	lrw      	r0, 0x40011400	// 80124f0 <GPIO_Init+0x44>
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 80124d8:	b862      	st.w      	r3, (r14, 0x8)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80124da:	e00004c9 	bsr      	0x8012e6c	// 8012e6c <HAL_GPIO_Init>
	
	
	HAL_NVIC_SetPriority(GPIOB_IRQn,0);
 80124de:	6c53      	mov      	r1, r4
 80124e0:	300f      	movi      	r0, 15
 80124e2:	e000049b 	bsr      	0x8012e18	// 8012e18 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(GPIOB_IRQn);
 80124e6:	300f      	movi      	r0, 15
 80124e8:	e00004b2 	bsr      	0x8012e4c	// 8012e4c <HAL_NVIC_EnableIRQ>

}
 80124ec:	1403      	addi      	r14, r14, 12
 80124ee:	1491      	pop      	r4, r15
 80124f0:	40011400 	.long	0x40011400

080124f4 <HAL_GPIO_EXTI_Callback>:

void HAL_GPIO_EXTI_Callback(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
	if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_18))
 80124f4:	106a      	lrw      	r3, 0x40011400	// 801251c <HAL_GPIO_EXTI_Callback+0x28>
 80124f6:	64c2      	cmpne      	r0, r3
 80124f8:	0c02      	bf      	0x80124fc	// 80124fc <HAL_GPIO_EXTI_Callback+0x8>
	}
	else if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_26))
	{
		key_flag = 2;
	}
}
 80124fa:	783c      	jmp      	r15
	if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_18))
 80124fc:	ea230004 	movih      	r3, 4
 8012500:	64c6      	cmpne      	r1, r3
 8012502:	0c09      	bf      	0x8012514	// 8012514 <HAL_GPIO_EXTI_Callback+0x20>
	else if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_26))
 8012504:	ea230400 	movih      	r3, 1024
 8012508:	64c6      	cmpne      	r1, r3
 801250a:	0bf8      	bt      	0x80124fa	// 80124fa <HAL_GPIO_EXTI_Callback+0x6>
		key_flag = 2;
 801250c:	1065      	lrw      	r3, 0x20001b81	// 8012520 <HAL_GPIO_EXTI_Callback+0x2c>
 801250e:	3202      	movi      	r2, 2
 8012510:	a340      	st.b      	r2, (r3, 0x0)
}
 8012512:	07f4      	br      	0x80124fa	// 80124fa <HAL_GPIO_EXTI_Callback+0x6>
		key_flag = 1;
 8012514:	1063      	lrw      	r3, 0x20001b81	// 8012520 <HAL_GPIO_EXTI_Callback+0x2c>
 8012516:	3201      	movi      	r2, 1
 8012518:	a340      	st.b      	r2, (r3, 0x0)
 801251a:	07f0      	br      	0x80124fa	// 80124fa <HAL_GPIO_EXTI_Callback+0x6>
 801251c:	40011400 	.long	0x40011400
 8012520:	20001b81 	.long	0x20001b81

08012524 <Error_Handler_Time>:

TIM_HandleTypeDef htim[6] = {0};


void Error_Handler_Time(void)
{
 8012524:	14d1      	push      	r4, r15
	while (1)
	{
		printf("Error_Handler Time\r\n");
 8012526:	1083      	lrw      	r4, 0x80153fc	// 8012530 <Error_Handler_Time+0xc>
 8012528:	6c13      	mov      	r0, r4
 801252a:	e3fffae1 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 801252e:	07fd      	br      	0x8012528	// 8012528 <Error_Handler_Time+0x4>
 8012530:	080153fc 	.long	0x080153fc

08012534 <TIM_Init_Us>:
	}
}


void TIM_Init_Us(uint32_t TIM_NUM,uint32_t time)
{
 8012534:	14d0      	push      	r15
	htim[TIM_NUM].Instance = TIM_NUM;
 8012536:	3218      	movi      	r2, 24
 8012538:	7c80      	mult      	r2, r0
 801253a:	1068      	lrw      	r3, 0x20001b84	// 8012558 <TIM_Init_Us+0x24>
 801253c:	d4620820 	str.w      	r0, (r2, r3 << 0)
	htim[TIM_NUM].Init.Unit = TIM_UNIT_US;
 8012540:	5b08      	addu      	r0, r3, r2
 8012542:	3300      	movi      	r3, 0
 8012544:	b061      	st.w      	r3, (r0, 0x4)
	htim[TIM_NUM].Init.Period = time;  //定时时间
 8012546:	b023      	st.w      	r1, (r0, 0xc)
	htim[TIM_NUM].Init.AutoReload = TIM_AUTORELOAD_PRELOAD_ENABLE;
 8012548:	b062      	st.w      	r3, (r0, 0x8)
	if (HAL_TIM_Base_Init(&htim[TIM_NUM]) != HAL_OK)
 801254a:	e00008df 	bsr      	0x8013708	// 8013708 <HAL_TIM_Base_Init>
 801254e:	e9200003 	bnez      	r0, 0x8012554	// 8012554 <TIM_Init_Us+0x20>
	{
		Error_Handler_Time();
	}
}
 8012552:	1490      	pop      	r15
		Error_Handler_Time();
 8012554:	e3ffffe8 	bsr      	0x8012524	// 8012524 <Error_Handler_Time>
 8012558:	20001b84 	.long	0x20001b84

0801255c <I2C_Init>:
#include "iic.h"

I2C_HandleTypeDef hi2c[2];

void I2C_Init(uint32_t num)
{
 801255c:	14d1      	push      	r4, r15
 801255e:	6d03      	mov      	r4, r0
	if(num == OLED_NUM)
 8012560:	e900000a 	bez      	r0, 0x8012574	// 8012574 <I2C_Init+0x18>
		printf("OLED GPIO INIT\r\n");
		hi2c[num].SCL_Port = GPIOA;
		hi2c[num].SCL_Pin = GPIO_PIN_1;
		hi2c[num].SDA_Port = GPIOA;
		hi2c[num].SDA_Pin = GPIO_PIN_4;
	}else if(num == INA226_NUM)
 8012564:	3841      	cmpnei      	r0, 1
 8012566:	0c18      	bf      	0x8012596	// 8012596 <I2C_Init+0x3a>
		hi2c[num].SCL_Pin = GPIO_PIN_14;
		hi2c[num].SDA_Port = GPIOB;
		hi2c[num].SDA_Pin = GPIO_PIN_15;
	}

	HAL_I2C_Init(&hi2c[num]);
 8012568:	1075      	lrw      	r3, 0x200032e4	// 80125bc <I2C_Init+0x60>
 801256a:	4404      	lsli      	r0, r4, 4
 801256c:	600c      	addu      	r0, r3
 801256e:	e000061f 	bsr      	0x80131ac	// 80131ac <HAL_I2C_Init>
 8012572:	1491      	pop      	r4, r15
		printf("OLED GPIO INIT\r\n");
 8012574:	1013      	lrw      	r0, 0x8015410	// 80125c0 <I2C_Init+0x64>
 8012576:	e3fffabb 	bsr      	0x8011aec	// 8011aec <__GI_puts>
		hi2c[num].SCL_Port = GPIOA;
 801257a:	1071      	lrw      	r3, 0x200032e4	// 80125bc <I2C_Init+0x60>
 801257c:	1052      	lrw      	r2, 0x40011200	// 80125c4 <I2C_Init+0x68>
 801257e:	b340      	st.w      	r2, (r3, 0x0)
		hi2c[num].SCL_Pin = GPIO_PIN_1;
 8012580:	3102      	movi      	r1, 2
		hi2c[num].SDA_Port = GPIOA;
 8012582:	b342      	st.w      	r2, (r3, 0x8)
		hi2c[num].SDA_Pin = GPIO_PIN_4;
 8012584:	3210      	movi      	r2, 16
		hi2c[num].SCL_Pin = GPIO_PIN_1;
 8012586:	b321      	st.w      	r1, (r3, 0x4)
		hi2c[num].SDA_Pin = GPIO_PIN_4;
 8012588:	b343      	st.w      	r2, (r3, 0xc)
	HAL_I2C_Init(&hi2c[num]);
 801258a:	4404      	lsli      	r0, r4, 4
 801258c:	106c      	lrw      	r3, 0x200032e4	// 80125bc <I2C_Init+0x60>
 801258e:	600c      	addu      	r0, r3
 8012590:	e000060e 	bsr      	0x80131ac	// 80131ac <HAL_I2C_Init>
 8012594:	1491      	pop      	r4, r15
		printf("INA226 GPIO INIT\r\n");
 8012596:	100d      	lrw      	r0, 0x8015420	// 80125c8 <I2C_Init+0x6c>
 8012598:	e3fffaaa 	bsr      	0x8011aec	// 8011aec <__GI_puts>
		hi2c[num].SCL_Port = GPIOB;
 801259c:	1068      	lrw      	r3, 0x200032e4	// 80125bc <I2C_Init+0x60>
 801259e:	104c      	lrw      	r2, 0x40011400	// 80125cc <I2C_Init+0x70>
 80125a0:	b344      	st.w      	r2, (r3, 0x10)
		hi2c[num].SCL_Pin = GPIO_PIN_14;
 80125a2:	ea014000 	movi      	r1, 16384
		hi2c[num].SDA_Port = GPIOB;
 80125a6:	b346      	st.w      	r2, (r3, 0x18)
		hi2c[num].SDA_Pin = GPIO_PIN_15;
 80125a8:	ea028000 	movi      	r2, 32768
		hi2c[num].SCL_Pin = GPIO_PIN_14;
 80125ac:	b325      	st.w      	r1, (r3, 0x14)
		hi2c[num].SDA_Pin = GPIO_PIN_15;
 80125ae:	b347      	st.w      	r2, (r3, 0x1c)
	HAL_I2C_Init(&hi2c[num]);
 80125b0:	4404      	lsli      	r0, r4, 4
 80125b2:	1063      	lrw      	r3, 0x200032e4	// 80125bc <I2C_Init+0x60>
 80125b4:	600c      	addu      	r0, r3
 80125b6:	e00005fb 	bsr      	0x80131ac	// 80131ac <HAL_I2C_Init>
 80125ba:	1491      	pop      	r4, r15
 80125bc:	200032e4 	.long	0x200032e4
 80125c0:	08015410 	.long	0x08015410
 80125c4:	40011200 	.long	0x40011200
 80125c8:	08015420 	.long	0x08015420
 80125cc:	40011400 	.long	0x40011400

080125d0 <OLED_Clear>:
	} //更新显示
}

//清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!	  
void OLED_Clear(void)  
{  
 80125d0:	14d5      	push      	r4-r8, r15
 80125d2:	1422      	subi      	r14, r14, 8
 80125d4:	ea0800b0 	movi      	r8, 176
	uint8_t i,n;		    
	uint8_t buf[1];
	for(i=0;i<8;i++)  
	{  
		buf[0] = 0xb0+i;
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 80125d8:	3601      	movi      	r6, 1
 80125da:	10ba      	lrw      	r5, 0x200032e4	// 8012640 <OLED_Clear+0x70>
		buf[0] = 0x00;
 80125dc:	3700      	movi      	r7, 0
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 80125de:	1b01      	addi      	r3, r14, 4
 80125e0:	3200      	movi      	r2, 0
 80125e2:	3178      	movi      	r1, 120
 80125e4:	b8c0      	st.w      	r6, (r14, 0x0)
 80125e6:	6c17      	mov      	r0, r5
		buf[0] = 0xb0+i;
 80125e8:	dd0e0004 	st.b      	r8, (r14, 0x4)
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 80125ec:	e0000602 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
 80125f0:	1b01      	addi      	r3, r14, 4
 80125f2:	3200      	movi      	r2, 0
 80125f4:	3178      	movi      	r1, 120
 80125f6:	b8c0      	st.w      	r6, (r14, 0x0)
 80125f8:	6c17      	mov      	r0, r5
		buf[0] = 0x00;
 80125fa:	dcee0004 	st.b      	r7, (r14, 0x4)
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
 80125fe:	e00005f9 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
		buf[0] = 0x10;
 8012602:	3310      	movi      	r3, 16
 8012604:	dc6e0004 	st.b      	r3, (r14, 0x4)
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
 8012608:	b8c0      	st.w      	r6, (r14, 0x0)
 801260a:	1b01      	addi      	r3, r14, 4
 801260c:	3200      	movi      	r2, 0
 801260e:	3178      	movi      	r1, 120
 8012610:	6c17      	mov      	r0, r5
 8012612:	e00005ef 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
 8012616:	3480      	movi      	r4, 128
		
		for(n=0;n<128;n++)
		{
			buf[0] = 0x00;
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, buf, 1);	//设置显示位置—列高地址 
 8012618:	b8c0      	st.w      	r6, (r14, 0x0)
 801261a:	1b01      	addi      	r3, r14, 4
 801261c:	3240      	movi      	r2, 64
 801261e:	3178      	movi      	r1, 120
 8012620:	6c17      	mov      	r0, r5
 8012622:	2c00      	subi      	r4, 1
			buf[0] = 0x00;
 8012624:	dcee0004 	st.b      	r7, (r14, 0x4)
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, buf, 1);	//设置显示位置—列高地址 
 8012628:	e00005e4 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
		for(n=0;n<128;n++)
 801262c:	e924fff6 	bnez      	r4, 0x8012618	// 8012618 <OLED_Clear+0x48>
 8012630:	e5080000 	addi      	r8, r8, 1
 8012634:	7620      	zextb      	r8, r8
	for(i=0;i<8;i++)  
 8012636:	eb4800b8 	cmpnei      	r8, 184
 801263a:	0bd2      	bt      	0x80125de	// 80125de <OLED_Clear+0xe>
		}
	}
}
 801263c:	1402      	addi      	r14, r14, 8
 801263e:	1495      	pop      	r4-r8, r15
 8012640:	200032e4 	.long	0x200032e4

08012644 <OLED_Set_Pos>:

void OLED_Set_Pos(unsigned char x, unsigned char y) 
{
 8012644:	14d3      	push      	r4-r6, r15
 8012646:	1422      	subi      	r14, r14, 8
	uint8_t buf[1];
	
	buf[0] = 0xb0+y;
 8012648:	294f      	subi      	r1, 80
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 801264a:	10b3      	lrw      	r5, 0x200032e4	// 8012694 <OLED_Set_Pos+0x50>
 801264c:	3601      	movi      	r6, 1
{
 801264e:	6d03      	mov      	r4, r0
	buf[0] = 0xb0+y;
 8012650:	dc2e0004 	st.b      	r1, (r14, 0x4)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 8012654:	1b01      	addi      	r3, r14, 4
 8012656:	b8c0      	st.w      	r6, (r14, 0x0)
 8012658:	3200      	movi      	r2, 0
 801265a:	3178      	movi      	r1, 120
 801265c:	6c17      	mov      	r0, r5
 801265e:	e00005c9 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf[0] = ((x&0xf0)>>4)|0x10;
 8012662:	4c64      	lsri      	r3, r4, 4
 8012664:	ec630010 	ori      	r3, r3, 16
 8012668:	dc6e0004 	st.b      	r3, (r14, 0x4)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
 801266c:	b8c0      	st.w      	r6, (r14, 0x0)
 801266e:	1b01      	addi      	r3, r14, 4
 8012670:	3200      	movi      	r2, 0
 8012672:	3178      	movi      	r1, 120
 8012674:	6c17      	mov      	r0, r5
 8012676:	e00005bd 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf[0] = (x&0x0f);
 801267a:	e484200f 	andi      	r4, r4, 15
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
 801267e:	b8c0      	st.w      	r6, (r14, 0x0)
 8012680:	1b01      	addi      	r3, r14, 4
 8012682:	3200      	movi      	r2, 0
 8012684:	3178      	movi      	r1, 120
 8012686:	6c17      	mov      	r0, r5
	buf[0] = (x&0x0f);
 8012688:	dc8e0004 	st.b      	r4, (r14, 0x4)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
 801268c:	e00005b2 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
} 
 8012690:	1402      	addi      	r14, r14, 8
 8012692:	1493      	pop      	r4-r6, r15
 8012694:	200032e4 	.long	0x200032e4

08012698 <OLED_ShowChar>:
//x:0~127
//y:0~31
//mode:0,反白显示;1,正常显示				 
//size:选择字体 16/12 
void OLED_ShowChar(uint8_t x,uint8_t y,uint8_t chr,uint8_t Char_Size)
{      	
 8012698:	ebe00038 	push      	r4-r11, r15, r16
 801269c:	1421      	subi      	r14, r14, 4
	unsigned char c=0,i=0;	
		c=chr-' ';//得到偏移后的值			
 801269e:	2a1f      	subi      	r2, 32
 80126a0:	7588      	zextb      	r6, r2
		if(x>Max_Column-1){x=0;y=y+2;}
 80126a2:	7482      	sextb      	r2, r0
{      	
 80126a4:	6e43      	mov      	r9, r0
 80126a6:	6e07      	mov      	r8, r1
		if(x>Max_Column-1){x=0;y=y+2;}
 80126a8:	e982004f 	blz      	r2, 0x8012746	// 8012746 <OLED_ShowChar+0xae>
		if(Char_Size == 16)
 80126ac:	3b50      	cmpnei      	r3, 16
			{
			OLED_Set_Pos(x,y);	
 80126ae:	6c63      	mov      	r1, r8
 80126b0:	6c27      	mov      	r0, r9
		if(Char_Size == 16)
 80126b2:	0c1a      	bf      	0x80126e6	// 80126e6 <OLED_ShowChar+0x4e>
			OLED_Set_Pos(x,y+1);
			for(i=0;i<8;i++)
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F8X16[c*16+i+8], 1);	
			}
			else {	
				OLED_Set_Pos(x,y);
 80126b4:	e3ffffc8 	bsr      	0x8012644	// 8012644 <OLED_Set_Pos>
 80126b8:	749b      	sexth      	r2, r6
 80126ba:	5aa8      	addu      	r5, r2, r2
 80126bc:	6094      	addu      	r2, r5
 80126be:	6088      	addu      	r2, r2
 80126c0:	11a5      	lrw      	r5, 0x20000164	// 8012754 <OLED_ShowChar+0xbc>
 80126c2:	5d88      	addu      	r4, r5, r2
 80126c4:	2205      	addi      	r2, 6
 80126c6:	6148      	addu      	r5, r2
				for(i=0;i<6;i++)
				HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F6x8[c][i], 1);	//设置显示位置—列高地址
 80126c8:	3701      	movi      	r7, 1
 80126ca:	11c4      	lrw      	r6, 0x200032e4	// 8012758 <OLED_ShowChar+0xc0>
 80126cc:	6cd3      	mov      	r3, r4
 80126ce:	b8e0      	st.w      	r7, (r14, 0x0)
 80126d0:	3240      	movi      	r2, 64
 80126d2:	3178      	movi      	r1, 120
 80126d4:	6c1b      	mov      	r0, r6
 80126d6:	2400      	addi      	r4, 1
 80126d8:	e000058c 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
				for(i=0;i<6;i++)
 80126dc:	6552      	cmpne      	r4, r5
 80126de:	0bf7      	bt      	0x80126cc	// 80126cc <OLED_ShowChar+0x34>
				
			}
}
 80126e0:	1401      	addi      	r14, r14, 4
 80126e2:	ebc00038 	pop      	r4-r11, r15, r16
 80126e6:	46c4      	lsli      	r6, r6, 4
 80126e8:	10fd      	lrw      	r7, 0x2000038c	// 801275c <OLED_ShowChar+0xc4>
 80126ea:	5e9e      	addi      	r4, r6, 8
			OLED_Set_Pos(x,y);	
 80126ec:	e3ffffac 	bsr      	0x8012644	// 8012644 <OLED_Set_Pos>
 80126f0:	5fb8      	addu      	r5, r7, r6
 80126f2:	c4870030 	addu      	r16, r7, r4
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F8X16[c*16+i], 1);	
 80126f6:	ea0b0001 	movi      	r11, 1
 80126fa:	ea8a0018 	lrw      	r10, 0x200032e4	// 8012758 <OLED_ShowChar+0xc0>
 80126fe:	6cd7      	mov      	r3, r5
 8012700:	dd6e2000 	st.w      	r11, (r14, 0x0)
 8012704:	3240      	movi      	r2, 64
 8012706:	3178      	movi      	r1, 120
 8012708:	6c2b      	mov      	r0, r10
 801270a:	2500      	addi      	r5, 1
 801270c:	e0000572 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
			for(i=0;i<8;i++)
 8012710:	c4b00480 	cmpne      	r16, r5
 8012714:	0bf5      	bt      	0x80126fe	// 80126fe <OLED_ShowChar+0x66>
			OLED_Set_Pos(x,y+1);
 8012716:	e4280000 	addi      	r1, r8, 1
 801271a:	7444      	zextb      	r1, r1
 801271c:	6c27      	mov      	r0, r9
 801271e:	260f      	addi      	r6, 16
 8012720:	611c      	addu      	r4, r7
 8012722:	619c      	addu      	r6, r7
 8012724:	e3ffff90 	bsr      	0x8012644	// 8012644 <OLED_Set_Pos>
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F8X16[c*16+i+8], 1);	
 8012728:	3701      	movi      	r7, 1
 801272a:	10ac      	lrw      	r5, 0x200032e4	// 8012758 <OLED_ShowChar+0xc0>
 801272c:	6cd3      	mov      	r3, r4
 801272e:	b8e0      	st.w      	r7, (r14, 0x0)
 8012730:	3240      	movi      	r2, 64
 8012732:	3178      	movi      	r1, 120
 8012734:	6c17      	mov      	r0, r5
 8012736:	2400      	addi      	r4, 1
 8012738:	e000055c 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
			for(i=0;i<8;i++)
 801273c:	651a      	cmpne      	r6, r4
 801273e:	0bf7      	bt      	0x801272c	// 801272c <OLED_ShowChar+0x94>
}
 8012740:	1401      	addi      	r14, r14, 4
 8012742:	ebc00038 	pop      	r4-r11, r15, r16
		if(x>Max_Column-1){x=0;y=y+2;}
 8012746:	e5010001 	addi      	r8, r1, 2
 801274a:	7620      	zextb      	r8, r8
 801274c:	ea090000 	movi      	r9, 0
 8012750:	07ae      	br      	0x80126ac	// 80126ac <OLED_ShowChar+0x14>
 8012752:	0000      	.short	0x0000
 8012754:	20000164 	.long	0x20000164
 8012758:	200032e4 	.long	0x200032e4
 801275c:	2000038c 	.long	0x2000038c

08012760 <OLED_ShowString>:

//显示一个字符号串
void OLED_ShowString(uint8_t x,uint8_t y,uint8_t *chr,uint8_t Char_Size)
{
 8012760:	14d6      	push      	r4-r9, r15
 8012762:	6dcb      	mov      	r7, r2
	unsigned char j=0;
	while (chr[j]!='\0')
 8012764:	8240      	ld.b      	r2, (r2, 0x0)
{
 8012766:	6d03      	mov      	r4, r0
 8012768:	6d87      	mov      	r6, r1
 801276a:	6e0f      	mov      	r8, r3
	while (chr[j]!='\0')
 801276c:	e9020017 	bez      	r2, 0x801279a	// 801279a <OLED_ShowString+0x3a>
 8012770:	3500      	movi      	r5, 0
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
			x+=8;
		if(x>120){x=0;y+=2;}
 8012772:	ea090078 	movi      	r9, 120
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
 8012776:	6c13      	mov      	r0, r4
			x+=8;
 8012778:	2407      	addi      	r4, 8
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
 801277a:	6ce3      	mov      	r3, r8
 801277c:	6c5b      	mov      	r1, r6
			x+=8;
 801277e:	7510      	zextb      	r4, r4
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
 8012780:	e3ffff8c 	bsr      	0x8012698	// 8012698 <OLED_ShowChar>
		if(x>120){x=0;y+=2;}
 8012784:	6524      	cmphs      	r9, r4
 8012786:	0804      	bt      	0x801278e	// 801278e <OLED_ShowString+0x2e>
 8012788:	2601      	addi      	r6, 2
 801278a:	7598      	zextb      	r6, r6
 801278c:	3400      	movi      	r4, 0
			j++;
 801278e:	2500      	addi      	r5, 1
 8012790:	7554      	zextb      	r5, r5
	while (chr[j]!='\0')
 8012792:	d0a70022 	ldr.b      	r2, (r7, r5 << 0)
 8012796:	e922fff0 	bnez      	r2, 0x8012776	// 8012776 <OLED_ShowString+0x16>
	}
}
 801279a:	1496      	pop      	r4-r9, r15

0801279c <OLED_Init>:
	}					
}

//初始化SSD1306					    
void OLED_Init(void)
{ 	
 801279c:	14d2      	push      	r4-r5, r15
 801279e:	1422      	subi      	r14, r14, 8
	
	I2C_Init(OLED_NUM);
 80127a0:	3000      	movi      	r0, 0
 80127a2:	e3fffedd 	bsr      	0x801255c	// 801255c <I2C_Init>
	uint8_t buf;// = {0xAE,0X40,0XB0,0xC8,0x81,0xff,0xa1,0xa6,0xa8,0x1f,0xd3,0x00,0xd5,0xf0,0xd9,0x22,0xda,0x02,0xdb,0x49,0x8d,0x14,0xaf};
	HAL_Delay(100);
 80127a6:	3064      	movi      	r0, 100
 80127a8:	e000032c 	bsr      	0x8012e00	// 8012e00 <HAL_Delay>
	//addr common  data
	buf = 0xAE;
 80127ac:	3300      	movi      	r3, 0
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//关闭显示
 80127ae:	0395      	lrw      	r4, 0x200032e4	// 80129d4 <OLED_Init+0x238>
 80127b0:	3501      	movi      	r5, 1
	buf = 0xAE;
 80127b2:	2b51      	subi      	r3, 82
 80127b4:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//关闭显示
 80127b8:	b8a0      	st.w      	r5, (r14, 0x0)
 80127ba:	e46e0006 	addi      	r3, r14, 7
 80127be:	3200      	movi      	r2, 0
 80127c0:	3178      	movi      	r1, 120
 80127c2:	6c13      	mov      	r0, r4
 80127c4:	e0000516 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x40;
 80127c8:	3340      	movi      	r3, 64
 80127ca:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80127ce:	b8a0      	st.w      	r5, (r14, 0x0)
 80127d0:	e46e0006 	addi      	r3, r14, 7
 80127d4:	3200      	movi      	r2, 0
 80127d6:	3178      	movi      	r1, 120
 80127d8:	6c13      	mov      	r0, r4
 80127da:	e000050b 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xb0;
 80127de:	3300      	movi      	r3, 0
 80127e0:	2b4f      	subi      	r3, 80
 80127e2:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80127e6:	b8a0      	st.w      	r5, (r14, 0x0)
 80127e8:	e46e0006 	addi      	r3, r14, 7
 80127ec:	3200      	movi      	r2, 0
 80127ee:	3178      	movi      	r1, 120
 80127f0:	6c13      	mov      	r0, r4
 80127f2:	e00004ff 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xc8;
 80127f6:	3300      	movi      	r3, 0
 80127f8:	2b37      	subi      	r3, 56
 80127fa:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//---set low column address
 80127fe:	b8a0      	st.w      	r5, (r14, 0x0)
 8012800:	e46e0006 	addi      	r3, r14, 7
 8012804:	3200      	movi      	r2, 0
 8012806:	3178      	movi      	r1, 120
 8012808:	6c13      	mov      	r0, r4
 801280a:	e00004f3 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x81;
 801280e:	3300      	movi      	r3, 0
 8012810:	2b7e      	subi      	r3, 127
 8012812:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8012816:	b8a0      	st.w      	r5, (r14, 0x0)
 8012818:	e46e0006 	addi      	r3, r14, 7
 801281c:	3200      	movi      	r2, 0
 801281e:	3178      	movi      	r1, 120
 8012820:	6c13      	mov      	r0, r4
 8012822:	e00004e7 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xff;
 8012826:	3300      	movi      	r3, 0
 8012828:	2b00      	subi      	r3, 1
 801282a:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 801282e:	b8a0      	st.w      	r5, (r14, 0x0)
 8012830:	e46e0006 	addi      	r3, r14, 7
 8012834:	3200      	movi      	r2, 0
 8012836:	3178      	movi      	r1, 120
 8012838:	6c13      	mov      	r0, r4
 801283a:	e00004db 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xa1;
 801283e:	3300      	movi      	r3, 0
 8012840:	2b5e      	subi      	r3, 95
 8012842:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//-not offset
 8012846:	b8a0      	st.w      	r5, (r14, 0x0)
 8012848:	e46e0006 	addi      	r3, r14, 7
 801284c:	3200      	movi      	r2, 0
 801284e:	3178      	movi      	r1, 120
 8012850:	6c13      	mov      	r0, r4
 8012852:	e00004cf 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xa6;
 8012856:	3300      	movi      	r3, 0
 8012858:	2b59      	subi      	r3, 90
 801285a:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 801285e:	b8a0      	st.w      	r5, (r14, 0x0)
 8012860:	e46e0006 	addi      	r3, r14, 7
 8012864:	3200      	movi      	r2, 0
 8012866:	3178      	movi      	r1, 120
 8012868:	6c13      	mov      	r0, r4
 801286a:	e00004c3 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xa8;
 801286e:	3300      	movi      	r3, 0
 8012870:	2b57      	subi      	r3, 88
 8012872:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//设置驱动路数
 8012876:	b8a0      	st.w      	r5, (r14, 0x0)
 8012878:	e46e0006 	addi      	r3, r14, 7
 801287c:	3200      	movi      	r2, 0
 801287e:	3178      	movi      	r1, 120
 8012880:	6c13      	mov      	r0, r4
 8012882:	e00004b7 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x1f;
 8012886:	331f      	movi      	r3, 31
 8012888:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 801288c:	b8a0      	st.w      	r5, (r14, 0x0)
 801288e:	e46e0006 	addi      	r3, r14, 7
 8012892:	3200      	movi      	r2, 0
 8012894:	3178      	movi      	r1, 120
 8012896:	6c13      	mov      	r0, r4
 8012898:	e00004ac 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xd3;
 801289c:	3300      	movi      	r3, 0
 801289e:	2b2c      	subi      	r3, 45
 80128a0:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80128a4:	b8a0      	st.w      	r5, (r14, 0x0)
 80128a6:	e46e0006 	addi      	r3, r14, 7
 80128aa:	3200      	movi      	r2, 0
 80128ac:	3178      	movi      	r1, 120
 80128ae:	6c13      	mov      	r0, r4
 80128b0:	e00004a0 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x00;
 80128b4:	3300      	movi      	r3, 0
 80128b6:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80128ba:	b8a0      	st.w      	r5, (r14, 0x0)
 80128bc:	e46e0006 	addi      	r3, r14, 7
 80128c0:	3200      	movi      	r2, 0
 80128c2:	3178      	movi      	r1, 120
 80128c4:	6c13      	mov      	r0, r4
 80128c6:	e0000495 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xd5;	
 80128ca:	3300      	movi      	r3, 0
 80128cc:	2b2a      	subi      	r3, 43
 80128ce:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80128d2:	b8a0      	st.w      	r5, (r14, 0x0)
 80128d4:	e46e0006 	addi      	r3, r14, 7
 80128d8:	3200      	movi      	r2, 0
 80128da:	3178      	movi      	r1, 120
 80128dc:	6c13      	mov      	r0, r4
 80128de:	e0000489 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xf0;
 80128e2:	3300      	movi      	r3, 0
 80128e4:	2b0f      	subi      	r3, 16
 80128e6:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80128ea:	b8a0      	st.w      	r5, (r14, 0x0)
 80128ec:	e46e0006 	addi      	r3, r14, 7
 80128f0:	3200      	movi      	r2, 0
 80128f2:	3178      	movi      	r1, 120
 80128f4:	6c13      	mov      	r0, r4
 80128f6:	e000047d 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xd9;
 80128fa:	3300      	movi      	r3, 0
 80128fc:	2b26      	subi      	r3, 39
 80128fe:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8012902:	b8a0      	st.w      	r5, (r14, 0x0)
 8012904:	e46e0006 	addi      	r3, r14, 7
 8012908:	3200      	movi      	r2, 0
 801290a:	3178      	movi      	r1, 120
 801290c:	6c13      	mov      	r0, r4
 801290e:	e0000471 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x22;
 8012912:	3322      	movi      	r3, 34
 8012914:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8012918:	b8a0      	st.w      	r5, (r14, 0x0)
 801291a:	e46e0006 	addi      	r3, r14, 7
 801291e:	3200      	movi      	r2, 0
 8012920:	3178      	movi      	r1, 120
 8012922:	6c13      	mov      	r0, r4
 8012924:	e0000466 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xda;
 8012928:	3300      	movi      	r3, 0
 801292a:	2b25      	subi      	r3, 38
 801292c:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8012930:	b8a0      	st.w      	r5, (r14, 0x0)
 8012932:	e46e0006 	addi      	r3, r14, 7
 8012936:	3200      	movi      	r2, 0
 8012938:	3178      	movi      	r1, 120
 801293a:	6c13      	mov      	r0, r4
 801293c:	e000045a 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x02;
 8012940:	3302      	movi      	r3, 2
 8012942:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8012946:	b8a0      	st.w      	r5, (r14, 0x0)
 8012948:	e46e0006 	addi      	r3, r14, 7
 801294c:	3200      	movi      	r2, 0
 801294e:	3178      	movi      	r1, 120
 8012950:	6c13      	mov      	r0, r4
 8012952:	e000044f 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x8d;
 8012956:	3300      	movi      	r3, 0
 8012958:	2b72      	subi      	r3, 115
 801295a:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 801295e:	b8a0      	st.w      	r5, (r14, 0x0)
 8012960:	e46e0006 	addi      	r3, r14, 7
 8012964:	3200      	movi      	r2, 0
 8012966:	3178      	movi      	r1, 120
 8012968:	6c13      	mov      	r0, r4
 801296a:	e0000443 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x14;
 801296e:	3314      	movi      	r3, 20
 8012970:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8012974:	b8a0      	st.w      	r5, (r14, 0x0)
 8012976:	e46e0006 	addi      	r3, r14, 7
 801297a:	3200      	movi      	r2, 0
 801297c:	3178      	movi      	r1, 120
 801297e:	6c13      	mov      	r0, r4
 8012980:	e0000438 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xdb;
 8012984:	3300      	movi      	r3, 0
 8012986:	2b24      	subi      	r3, 37
 8012988:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 801298c:	b8a0      	st.w      	r5, (r14, 0x0)
 801298e:	e46e0006 	addi      	r3, r14, 7
 8012992:	3200      	movi      	r2, 0
 8012994:	3178      	movi      	r1, 120
 8012996:	6c13      	mov      	r0, r4
 8012998:	e000042c 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0x49;
 801299c:	3349      	movi      	r3, 73
 801299e:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);	
 80129a2:	b8a0      	st.w      	r5, (r14, 0x0)
 80129a4:	e46e0006 	addi      	r3, r14, 7
 80129a8:	3200      	movi      	r2, 0
 80129aa:	3178      	movi      	r1, 120
 80129ac:	6c13      	mov      	r0, r4
 80129ae:	e0000421 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	buf = 0xaf;
 80129b2:	3300      	movi      	r3, 0
 80129b4:	2b50      	subi      	r3, 81
 80129b6:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);	
 80129ba:	3200      	movi      	r2, 0
 80129bc:	e46e0006 	addi      	r3, r14, 7
 80129c0:	3178      	movi      	r1, 120
 80129c2:	b8a0      	st.w      	r5, (r14, 0x0)
 80129c4:	6c13      	mov      	r0, r4
 80129c6:	e0000415 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	
	OLED_Clear();
 80129ca:	e3fffe03 	bsr      	0x80125d0	// 80125d0 <OLED_Clear>
}  
 80129ce:	1402      	addi      	r14, r14, 8
 80129d0:	1492      	pop      	r4-r5, r15
 80129d2:	0000      	.short	0x0000
 80129d4:	200032e4 	.long	0x200032e4

080129d8 <INA226_Read2Byte>:
#include "ina226.h"
#include "iic.h"


uint16_t INA226_Read2Byte(uint8_t dev_addr, uint8_t reg_addr)
{
 80129d8:	14d0      	push      	r15
 80129da:	1422      	subi      	r14, r14, 8
	uint8_t reg_data_8[2] = {0};
 80129dc:	3300      	movi      	r3, 0
 80129de:	dc6e1002 	st.h      	r3, (r14, 0x4)
	uint16_t reg_data_16 = 0xffff;
	uint8_t state = 0;
	state = HAL_I2C_Read(&hi2c[INA226_NUM], dev_addr, reg_addr, reg_data_8, 2);
 80129e2:	3302      	movi      	r3, 2
 80129e4:	b860      	st.w      	r3, (r14, 0x0)
 80129e6:	6c87      	mov      	r2, r1
 80129e8:	1b01      	addi      	r3, r14, 4
 80129ea:	6c43      	mov      	r1, r0
 80129ec:	1009      	lrw      	r0, 0x200032f4	// 8012a10 <INA226_Read2Byte+0x38>
 80129ee:	e0000439 	bsr      	0x8013260	// 8013260 <HAL_I2C_Read>
	if(state == HAL_ERROR)
 80129f2:	7400      	zextb      	r0, r0
 80129f4:	3841      	cmpnei      	r0, 1
 80129f6:	0c09      	bf      	0x8012a08	// 8012a08 <INA226_Read2Byte+0x30>
	{
		printf("IIC read ERROR \r\n");
	}
	reg_data_16 = reg_data_8[0];
	reg_data_16=(reg_data_16<<8)&0xFF00;
 80129f8:	d86e0004 	ld.b      	r3, (r14, 0x4)
 80129fc:	4368      	lsli      	r3, r3, 8
	reg_data_16|=reg_data_8[1];
 80129fe:	d80e0005 	ld.b      	r0, (r14, 0x5)
	return reg_data_16;
}
 8012a02:	6c0c      	or      	r0, r3
 8012a04:	1402      	addi      	r14, r14, 8
 8012a06:	1490      	pop      	r15
		printf("IIC read ERROR \r\n");
 8012a08:	1003      	lrw      	r0, 0x8015434	// 8012a14 <INA226_Read2Byte+0x3c>
 8012a0a:	e3fff871 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 8012a0e:	07f5      	br      	0x80129f8	// 80129f8 <INA226_Read2Byte+0x20>
 8012a10:	200032f4 	.long	0x200032f4
 8012a14:	08015434 	.long	0x08015434

08012a18 <INA226_Write2Byte>:

uint8_t INA226_Write2Byte(uint8_t dev_addr, uint8_t reg_addr,uint16_t reg_data)
{       
 8012a18:	14d0      	push      	r15
 8012a1a:	1422      	subi      	r14, r14, 8
	uint8_t state = 0;
	uint8_t temp[2] = {0};
	temp[0] = (uint8_t)((reg_data&0xFF00)>>8);
 8012a1c:	4a68      	lsri      	r3, r2, 8
 8012a1e:	dc6e0004 	st.b      	r3, (r14, 0x4)
	temp[1] = (uint8_t)reg_data&0x00FF;
	state = HAL_I2C_Write(&hi2c[INA226_NUM], dev_addr, reg_addr, temp, 2);	
 8012a22:	3302      	movi      	r3, 2
	temp[1] = (uint8_t)reg_data&0x00FF;
 8012a24:	dc4e0005 	st.b      	r2, (r14, 0x5)
	state = HAL_I2C_Write(&hi2c[INA226_NUM], dev_addr, reg_addr, temp, 2);	
 8012a28:	b860      	st.w      	r3, (r14, 0x0)
 8012a2a:	6c87      	mov      	r2, r1
 8012a2c:	1b01      	addi      	r3, r14, 4
 8012a2e:	6c43      	mov      	r1, r0
 8012a30:	1008      	lrw      	r0, 0x200032f4	// 8012a50 <INA226_Write2Byte+0x38>
 8012a32:	e00003df 	bsr      	0x80131f0	// 80131f0 <HAL_I2C_Write>
	if(state == HAL_ERROR)
 8012a36:	7400      	zextb      	r0, r0
 8012a38:	3841      	cmpnei      	r0, 1
 8012a3a:	0c04      	bf      	0x8012a42	// 8012a42 <INA226_Write2Byte+0x2a>
	{
		printf("IIC write ERROR \r\n");
	}

	return 1;
}
 8012a3c:	3001      	movi      	r0, 1
 8012a3e:	1402      	addi      	r14, r14, 8
 8012a40:	1490      	pop      	r15
		printf("IIC write ERROR \r\n");
 8012a42:	1005      	lrw      	r0, 0x8015448	// 8012a54 <INA226_Write2Byte+0x3c>
 8012a44:	e3fff854 	bsr      	0x8011aec	// 8011aec <__GI_puts>
}
 8012a48:	3001      	movi      	r0, 1
 8012a4a:	1402      	addi      	r14, r14, 8
 8012a4c:	1490      	pop      	r15
 8012a4e:	0000      	.short	0x0000
 8012a50:	200032f4 	.long	0x200032f4
 8012a54:	08015448 	.long	0x08015448

08012a58 <Get_Shunt_voltage>:
	return Value;
}
 
//获取分流电压
float Get_Shunt_voltage()//mV
{
 8012a58:	14d0      	push      	r15
	temp = INA226_Read2Byte(dev_addr, Shunt_V_Reg);
 8012a5a:	3101      	movi      	r1, 1
 8012a5c:	3081      	movi      	r0, 129
 8012a5e:	e3ffffbd 	bsr      	0x80129d8	// 80129d8 <INA226_Read2Byte>
 8012a62:	74c3      	sexth      	r3, r0
	if(temp&0x8000)	temp = ~(temp - 1);	
 8012a64:	e9a30005 	bhsz      	r3, 0x8012a6e	// 8012a6e <Get_Shunt_voltage+0x16>
 8012a68:	3300      	movi      	r3, 0
 8012a6a:	60c2      	subu      	r3, r0
 8012a6c:	74cf      	sexth      	r3, r3
	float Value;
	Value = INA226_GetShuntVoltage(INA226_READ_ADDR)*INA226_VAL_LSB*0.001;//如需矫正电流分流参数请将这里改为2.5
 8012a6e:	74cd      	zexth      	r3, r3
 8012a70:	f4031b60 	fmtvrl      	fr0, r3
 8012a74:	ea234020 	movih      	r3, 16416
 8012a78:	f4031b61 	fmtvrl      	fr1, r3
 8012a7c:	f4001a00 	fsitos      	fr0, fr0
 8012a80:	f4200200 	fmuls      	fr0, fr0, fr1
 8012a84:	e3fff144 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012a88:	1044      	lrw      	r2, 0xd2f1a9fc	// 8012a98 <Get_Shunt_voltage+0x40>
 8012a8a:	1065      	lrw      	r3, 0x3f50624d	// 8012a9c <Get_Shunt_voltage+0x44>
 8012a8c:	e3fff2ee 	bsr      	0x8011068	// 8011068 <__muldf3>
 8012a90:	e3fff574 	bsr      	0x8011578	// 8011578 <__truncdfsf2>
	return Value;
}
 8012a94:	1490      	pop      	r15
 8012a96:	0000      	.short	0x0000
 8012a98:	d2f1a9fc 	.long	0xd2f1a9fc
 8012a9c:	3f50624d 	.long	0x3f50624d

08012aa0 <Get_Power>:
	return Current;
}

//获取功率= 总线电压 * 电流
float Get_Power()//W
{
 8012aa0:	14d0      	push      	r15
 8012aa2:	1421      	subi      	r14, r14, 4
 8012aa4:	f40e2408 	fsts      	fr8, (r14, 0x0)
 8012aa8:	1421      	subi      	r14, r14, 4
	temp = INA226_Read2Byte(dev_addr, Bus_V_Reg);
 8012aaa:	3102      	movi      	r1, 2
 8012aac:	3081      	movi      	r0, 129
 8012aae:	e3ffff95 	bsr      	0x80129d8	// 80129d8 <INA226_Read2Byte>
	Value = INA226_GetVoltage(INA226_READ_ADDR)*Voltage_LSB;
 8012ab2:	f4001b60 	fmtvrl      	fr0, r0
 8012ab6:	ea233fa0 	movih      	r3, 16288
 8012aba:	f4031b68 	fmtvrl      	fr8, r3
 8012abe:	f4001a00 	fsitos      	fr0, fr0
	temp = INA226_Read2Byte(dev_addr, Current_Reg);
 8012ac2:	3104      	movi      	r1, 4
 8012ac4:	3081      	movi      	r0, 129
	Value = INA226_GetVoltage(INA226_READ_ADDR)*Voltage_LSB;
 8012ac6:	f5000208 	fmuls      	fr8, fr0, fr8
	temp = INA226_Read2Byte(dev_addr, Current_Reg);
 8012aca:	e3ffff87 	bsr      	0x80129d8	// 80129d8 <INA226_Read2Byte>
 8012ace:	b800      	st.w      	r0, (r14, 0x0)
	if(temp&0x8000)	temp = ~(temp - 1);	
 8012ad0:	d86e1000 	ld.h      	r3, (r14, 0x0)
 8012ad4:	74cf      	sexth      	r3, r3
 8012ad6:	e9a30006 	bhsz      	r3, 0x8012ae2	// 8012ae2 <Get_Power+0x42>
 8012ada:	3300      	movi      	r3, 0
 8012adc:	60c2      	subu      	r3, r0
 8012ade:	74cd      	zexth      	r3, r3
 8012ae0:	b860      	st.w      	r3, (r14, 0x0)
	Current = INA226_GetShunt_Current(INA226_READ_ADDR)* CURRENT_LSB;
 8012ae2:	f40e2000 	flds      	fr0, (r14, 0x0)
 8012ae6:	106e      	lrw      	r3, 0x3dcccccd	// 8012b1c <Get_Power+0x7c>
 8012ae8:	f4001a01 	fsitos      	fr1, fr0
 8012aec:	f4031b60 	fmtvrl      	fr0, r3
 8012af0:	f4010201 	fmuls      	fr1, fr1, fr0
	float mA = 0;
	float Power = 0.0;
	mV = Get_Voltage();			//mV
	mA= Get_Shunt_Current();	//mA
	mA = (int)mA;
	Power = (mV/1000) * (mA/1000); 	//mV*mA
 8012af4:	ea23447a 	movih      	r3, 17530
	mA = (int)mA;
 8012af8:	f4011821 	fstosi.rz      	fr1, fr1
	Power = (mV/1000) * (mA/1000); 	//mV*mA
 8012afc:	f4031b60 	fmtvrl      	fr0, r3
	mA = (int)mA;
 8012b00:	f4011a01 	fsitos      	fr1, fr1
	Power = (mV/1000) * (mA/1000); 	//mV*mA
 8012b04:	f4010301 	fdivs      	fr1, fr1, fr0
 8012b08:	f4080300 	fdivs      	fr0, fr8, fr0
	return Power;
}
 8012b0c:	f4010200 	fmuls      	fr0, fr1, fr0
 8012b10:	1401      	addi      	r14, r14, 4
 8012b12:	f40e2008 	flds      	fr8, (r14, 0x0)
 8012b16:	1401      	addi      	r14, r14, 4
 8012b18:	1490      	pop      	r15
 8012b1a:	0000      	.short	0x0000
 8012b1c:	3dcccccd 	.long	0x3dcccccd

08012b20 <Get_INA226_All_Value>:
	return Power;
}


void Get_INA226_All_Value(INA226_VALUE *ina226_value)
{
 8012b20:	14d1      	push      	r4, r15
 8012b22:	1421      	subi      	r14, r14, 4
 8012b24:	6d03      	mov      	r4, r0
	temp = INA226_Read2Byte(dev_addr, Bus_V_Reg);
 8012b26:	3102      	movi      	r1, 2
 8012b28:	3081      	movi      	r0, 129
 8012b2a:	e3ffff57 	bsr      	0x80129d8	// 80129d8 <INA226_Read2Byte>
	Value = INA226_GetVoltage(INA226_READ_ADDR)*Voltage_LSB;
 8012b2e:	f4001b60 	fmtvrl      	fr0, r0
 8012b32:	ea233fa0 	movih      	r3, 16288
 8012b36:	f4031b61 	fmtvrl      	fr1, r3
 8012b3a:	f4001a00 	fsitos      	fr0, fr0
 8012b3e:	f4200200 	fmuls      	fr0, fr0, fr1
	ina226_value->Bus_V = Get_Voltage();  			//mv
 8012b42:	f4042400 	fsts      	fr0, (r4, 0x0)
	ina226_value->Shunt_V = Get_Shunt_voltage();	//uv
 8012b46:	e3ffff89 	bsr      	0x8012a58	// 8012a58 <Get_Shunt_voltage>
 8012b4a:	f4042410 	fsts      	fr0, (r4, 0x4)
	temp = INA226_Read2Byte(dev_addr, Current_Reg);
 8012b4e:	3104      	movi      	r1, 4
 8012b50:	3081      	movi      	r0, 129
 8012b52:	e3ffff43 	bsr      	0x80129d8	// 80129d8 <INA226_Read2Byte>
 8012b56:	b800      	st.w      	r0, (r14, 0x0)
	if(temp&0x8000)	temp = ~(temp - 1);	
 8012b58:	d86e1000 	ld.h      	r3, (r14, 0x0)
 8012b5c:	74cf      	sexth      	r3, r3
 8012b5e:	e9a30006 	bhsz      	r3, 0x8012b6a	// 8012b6a <Get_INA226_All_Value+0x4a>
 8012b62:	3300      	movi      	r3, 0
 8012b64:	60c2      	subu      	r3, r0
 8012b66:	74cd      	zexth      	r3, r3
 8012b68:	b860      	st.w      	r3, (r14, 0x0)
	Current = INA226_GetShunt_Current(INA226_READ_ADDR)* CURRENT_LSB;
 8012b6a:	f40e2000 	flds      	fr0, (r14, 0x0)
 8012b6e:	1068      	lrw      	r3, 0x3dcccccd	// 8012b8c <Get_INA226_All_Value+0x6c>
 8012b70:	f4031b61 	fmtvrl      	fr1, r3
 8012b74:	f4001a00 	fsitos      	fr0, fr0
 8012b78:	f4200200 	fmuls      	fr0, fr0, fr1
	ina226_value->Current = Get_Shunt_Current();	//ma	
 8012b7c:	f4042420 	fsts      	fr0, (r4, 0x8)
	ina226_value->Power = Get_Power();				//mw
 8012b80:	e3ffff90 	bsr      	0x8012aa0	// 8012aa0 <Get_Power>
 8012b84:	f4042430 	fsts      	fr0, (r4, 0xc)
}
 8012b88:	1401      	addi      	r14, r14, 4
 8012b8a:	1491      	pop      	r4, r15
 8012b8c:	3dcccccd 	.long	0x3dcccccd

08012b90 <INA226_Init>:
 
 
void INA226_Init(void)
{
 8012b90:	14d0      	push      	r15
	
	I2C_Init(INA226_NUM);
 8012b92:	3001      	movi      	r0, 1
 8012b94:	e3fffce4 	bsr      	0x801255c	// 801255c <I2C_Init>
	INA226_Write2Byte(INA226_WRITE_ADDR, Config_Reg, 0x8000);		//重新启动
 8012b98:	ea028000 	movi      	r2, 32768
 8012b9c:	3100      	movi      	r1, 0
 8012b9e:	3080      	movi      	r0, 128
 8012ba0:	e3ffff3c 	bsr      	0x8012a18	// 8012a18 <INA226_Write2Byte>
	//0b0100101001001111,204us,256次测量 204*256 = 53ms
	//0x484f设置转换时间204us,求平均值次数128，采样时间为204*128 = 26ms，
	//0x452716次平均,1.1ms,1.1ms,连续测量分流电压和总线电压
	INA226_Write2Byte(INA226_WRITE_ADDR, Config_Reg, 0b0100101001001111);		
 8012ba4:	ea024a4f 	movi      	r2, 19023
 8012ba8:	3100      	movi      	r1, 0
 8012baa:	3080      	movi      	r0, 128
 8012bac:	e3ffff36 	bsr      	0x8012a18	// 8012a18 <INA226_Write2Byte>
	INA226_Write2Byte(INA226_WRITE_ADDR, Calib_Reg, CAL);		//设置分辨率
 8012bb0:	ea020800 	movi      	r2, 2048
 8012bb4:	3105      	movi      	r1, 5
 8012bb6:	3080      	movi      	r0, 128
 8012bb8:	e3ffff30 	bsr      	0x8012a18	// 8012a18 <INA226_Write2Byte>
	/*
	I2C_Init(INA226_NUM);
	INA226_Write2Byte(Config_Reg, 0x4527);//0100_010_100_100_111 
	INA226_Write2Byte(Calib_Reg, 0x0A00);
	*/
}
 8012bbc:	1490      	pop      	r15
	...

08012bc0 <HAL_ADC_Init>:
	}
	return value;
}

HAL_StatusTypeDef HAL_ADC_Init(ADC_HandleTypeDef* hadc)
{
 8012bc0:	14d1      	push      	r4, r15
 8012bc2:	1423      	subi      	r14, r14, 12
 8012bc4:	6d03      	mov      	r4, r0
	uint32_t div;
	wm_sys_clk sysclk;
	
	if (hadc == NULL)
 8012bc6:	e9000064 	bez      	r0, 0x8012c8e	// 8012c8e <HAL_ADC_Init+0xce>
	
	assert_param(IS_ADC_ALL_INSTANCE(hadc->Instance));
	assert_param(IS_ADC_CHANNEL(hadc->Init.channel));
	assert_param(IS_ADC_FREQUENCY(hadc->Init.freq));
	
	hadc->Lock = HAL_UNLOCKED;
 8012bca:	3300      	movi      	r3, 0
 8012bcc:	b065      	st.w      	r3, (r0, 0x14)
	
	HAL_ADC_MspInit(hadc);
 8012bce:	e3fffb1b 	bsr      	0x8012204	// 8012204 <HAL_ADC_MspInit>
	
	SystemClock_Get(&sysclk);
 8012bd2:	6c3b      	mov      	r0, r14
 8012bd4:	e000008a 	bsr      	0x8012ce8	// 8012ce8 <SystemClock_Get>
	div = sysclk.apbclk * 1000000 / (hadc->Init.freq) / 512;
 8012bd8:	9860      	ld.w      	r3, (r14, 0x0)
 8012bda:	ea00f424 	movi      	r0, 62500
 8012bde:	c4804900 	rotli      	r0, r0, 4
 8012be2:	7cc0      	mult      	r3, r0
 8012be4:	9402      	ld.w      	r0, (r4, 0x8)
	MODIFY_REG(RCC->CLK_SEL, RCC_CLK_SEL_ADC_DIV, ((div & 0xFF) << RCC_CLK_SEL_ADC_DIV_Pos));
 8012be6:	ea224000 	movih      	r2, 16384
 8012bea:	e4420dff 	addi      	r2, r2, 3584
	div = sysclk.apbclk * 1000000 / (hadc->Init.freq) / 512;
 8012bee:	c4038023 	divu      	r3, r3, r0
	MODIFY_REG(RCC->CLK_SEL, RCC_CLK_SEL_ADC_DIV, ((div & 0xFF) << RCC_CLK_SEL_ADC_DIV_Pos));
 8012bf2:	4b61      	lsri      	r3, r3, 1
 8012bf4:	ea00ff00 	movi      	r0, 65280
 8012bf8:	9225      	ld.w      	r1, (r2, 0x14)
 8012bfa:	68c0      	and      	r3, r0
 8012bfc:	ea00ff00 	movi      	r0, 65280
 8012c00:	6c02      	nor      	r0, r0
 8012c02:	6840      	and      	r1, r0
 8012c04:	6cc4      	or      	r3, r1
 8012c06:	b265      	st.w      	r3, (r2, 0x14)
	SET_BIT(RCC->CLK_DIV, RCC_CLK_DIV_FREQ_EN);
 8012c08:	9264      	ld.w      	r3, (r2, 0x10)
 8012c0a:	3bbf      	bseti      	r3, 31
 8012c0c:	b264      	st.w      	r3, (r2, 0x10)
	
	MODIFY_REG(hadc->Instance->ADC_CR, ADC_ADC_CR_DMAEN | ADC_ADC_CR_SWITCHTIME | ADC_ADC_CR_INITTIME, 
 8012c0e:	9440      	ld.w      	r2, (r4, 0x0)
 8012c10:	1121      	lrw      	r1, 0xc00c00fc	// 8012c94 <HAL_ADC_Init+0xd4>
 8012c12:	9264      	ld.w      	r3, (r2, 0x10)
 8012c14:	68c4      	and      	r3, r1
 8012c16:	1121      	lrw      	r1, 0x5005002	// 8012c98 <HAL_ADC_Init+0xd8>
 8012c18:	6cc4      	or      	r3, r1
 8012c1a:	b264      	st.w      	r3, (r2, 0x10)
	(0x50 << ADC_ADC_CR_SWITCHTIME_Pos) | (0x50 << ADC_ADC_CR_INITTIME_Pos) | ADC_ADC_CR_ADCIE);
	
	MODIFY_REG(hadc->Instance->PGA_CR,  ADC_PGA_CR_GAIN | ADC_PGA_CR_BPREF | ADC_PGA_CR_BP,   ADC_PGA_CR_CHOPEN | ADC_PGA_CR_PGAEN);
 8012c1c:	9262      	ld.w      	r3, (r2, 0x8)
 8012c1e:	ea0101ff 	movi      	r1, 511
 8012c22:	6c46      	nor      	r1, r1
 8012c24:	68c4      	and      	r3, r1
 8012c26:	ec630003 	ori      	r3, r3, 3
 8012c2a:	b262      	st.w      	r3, (r2, 0x8)
	//MODIFY_REG(hadc->Instance->PGA_CR, ADC_PGA_CR_BPREF  | ADC_PGA_CR_GAIN |ADC_PGA_CR_BP,  ADC_PGA_CR_CHOPEN | ADC_PGA_CR_PGAEN);
	//printf("PGA_CR: %x  %x   %x\r\n",READ_REG(hadc->Instance->PGA_CR),  
	//(((READ_REG(hadc->Instance->PGA_CR)) & (~(ADC_PGA_CR_BPREF | ADC_PGA_CR_BP))) | (ADC_PGA_CR_GAIN | ADC_PGA_CR_CHOPEN | ADC_PGA_CR_PGAEN)),
	//ADC_PGA_CR_GAIN);
	// 校验计算offset
	MODIFY_REG(hadc->Instance->ANA_CR, ADC_ANA_CR_CH | ADC_ANA_CR_PD, ADC_ANA_CR_RST | ADC_ANA_CR_LDOEN | ADC_ANA_CR_CH_OFFSET );
 8012c2c:	9261      	ld.w      	r3, (r2, 0x4)
 8012c2e:	ea010f07 	movi      	r1, 3847
 8012c32:	6c46      	nor      	r1, r1
 8012c34:	68c4      	and      	r3, r1
 8012c36:	ec630e03 	ori      	r3, r3, 3587
 8012c3a:	b261      	st.w      	r3, (r2, 0x4)
 8012c3c:	3104      	movi      	r1, 4
	while (1)
	{
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
		{
			count++;
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8012c3e:	3001      	movi      	r0, 1
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
 8012c40:	9265      	ld.w      	r3, (r2, 0x14)
 8012c42:	e4632001 	andi      	r3, r3, 1
 8012c46:	e903fffd 	bez      	r3, 0x8012c40	// 8012c40 <HAL_ADC_Init+0x80>
 8012c4a:	2900      	subi      	r1, 1
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8012c4c:	b205      	st.w      	r0, (r2, 0x14)
			if(count == 4)
 8012c4e:	e921fff9 	bnez      	r1, 0x8012c40	// 8012c40 <HAL_ADC_Init+0x80>
	value = ADC->DR;
 8012c52:	ea234001 	movih      	r3, 16385
 8012c56:	3ba9      	bseti      	r3, 9
	if (value & 0x20000)
 8012c58:	ea210002 	movih      	r1, 2
	value = ADC->DR;
 8012c5c:	9360      	ld.w      	r3, (r3, 0x0)
	if (value & 0x20000)
 8012c5e:	684c      	and      	r1, r3
 8012c60:	e9210012 	bnez      	r1, 0x8012c84	// 8012c84 <HAL_ADC_Init+0xc4>
	value = value & 0x3FFFC;
 8012c64:	c6205021 	bmaski      	r1, 18
 8012c68:	2902      	subi      	r1, 3
 8012c6a:	68c4      	and      	r3, r1
		value |= 0x20000;
 8012c6c:	3bb1      	bseti      	r3, 17
	__HAL_ADC_DISABLE(hadc);
 8012c6e:	3100      	movi      	r1, 0
	hadc->offset = _Get_Result();
 8012c70:	b466      	st.w      	r3, (r4, 0x18)
	__HAL_ADC_DISABLE(hadc);
 8012c72:	2907      	subi      	r1, 8
 8012c74:	9261      	ld.w      	r3, (r2, 0x4)
 8012c76:	68c4      	and      	r3, r1
 8012c78:	ec630004 	ori      	r3, r3, 4
	return HAL_OK;
 8012c7c:	3000      	movi      	r0, 0
	__HAL_ADC_DISABLE(hadc);
 8012c7e:	b261      	st.w      	r3, (r2, 0x4)
}
 8012c80:	1403      	addi      	r14, r14, 12
 8012c82:	1491      	pop      	r4, r15
		value &= 0x1FFFF;
 8012c84:	c6005021 	bmaski      	r1, 17
 8012c88:	2902      	subi      	r1, 3
 8012c8a:	68c4      	and      	r3, r1
 8012c8c:	07f1      	br      	0x8012c6e	// 8012c6e <HAL_ADC_Init+0xae>
		return HAL_ERROR;
 8012c8e:	3001      	movi      	r0, 1
}
 8012c90:	1403      	addi      	r14, r14, 12
 8012c92:	1491      	pop      	r4, r15
 8012c94:	c00c00fc 	.long	0xc00c00fc
 8012c98:	05005002 	.long	0x05005002

08012c9c <HAL_ADC_CompareCallback>:
}

__attribute__((weak)) void HAL_ADC_CompareCallback(ADC_HandleTypeDef* hadc)
{
	UNUSED(hadc);
}
 8012c9c:	783c      	jmp      	r15
	...

08012ca0 <HAL_ADC_IRQHandler>:

void HAL_ADC_IRQHandler(ADC_HandleTypeDef* hadc)
{
 8012ca0:	14d1      	push      	r4, r15
	assert_param(IS_ADC_ALL_INSTANCE(hadc->Instance));
	
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_ADCIE))
 8012ca2:	9060      	ld.w      	r3, (r0, 0x0)
{
 8012ca4:	6d03      	mov      	r4, r0
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_ADCIE))
 8012ca6:	9344      	ld.w      	r2, (r3, 0x10)
 8012ca8:	e4422002 	andi      	r2, r2, 2
 8012cac:	e9020007 	bez      	r2, 0x8012cba	// 8012cba <HAL_ADC_IRQHandler+0x1a>
	{
		if (__HAL_ADC_GET_FLAG(hadc, ADC_IF_ADC))
 8012cb0:	9345      	ld.w      	r2, (r3, 0x14)
 8012cb2:	e4422001 	andi      	r2, r2, 1
 8012cb6:	e9220013 	bnez      	r2, 0x8012cdc	// 8012cdc <HAL_ADC_IRQHandler+0x3c>
		{
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
			HAL_ADC_ConvCpltCallback(hadc);
		}
	}
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_CMPIE))
 8012cba:	9344      	ld.w      	r2, (r3, 0x10)
 8012cbc:	e4422020 	andi      	r2, r2, 32
 8012cc0:	e9020007 	bez      	r2, 0x8012cce	// 8012cce <HAL_ADC_IRQHandler+0x2e>
	{
		if (__HAL_ADC_GET_FLAG(hadc, ADC_IF_CMP))
 8012cc4:	9345      	ld.w      	r2, (r3, 0x14)
 8012cc6:	e4422002 	andi      	r2, r2, 2
 8012cca:	e9220003 	bnez      	r2, 0x8012cd0	// 8012cd0 <HAL_ADC_IRQHandler+0x30>
		{
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_CMP);
			HAL_ADC_CompareCallback(hadc);
		}
	}
}
 8012cce:	1491      	pop      	r4, r15
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_CMP);
 8012cd0:	3202      	movi      	r2, 2
 8012cd2:	b345      	st.w      	r2, (r3, 0x14)
			HAL_ADC_CompareCallback(hadc);
 8012cd4:	6c13      	mov      	r0, r4
 8012cd6:	e3ffffe3 	bsr      	0x8012c9c	// 8012c9c <HAL_ADC_CompareCallback>
}
 8012cda:	1491      	pop      	r4, r15
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8012cdc:	3201      	movi      	r2, 1
 8012cde:	b345      	st.w      	r2, (r3, 0x14)
			HAL_ADC_ConvCpltCallback(hadc);
 8012ce0:	e3fffbe4 	bsr      	0x80124a8	// 80124a8 <HAL_ADC_ConvCpltCallback>
 8012ce4:	9460      	ld.w      	r3, (r4, 0x0)
 8012ce6:	07ea      	br      	0x8012cba	// 8012cba <HAL_ADC_IRQHandler+0x1a>

08012ce8 <SystemClock_Get>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 8012ce8:	ea234000 	movih      	r3, 16384
 8012cec:	e4630dff 	addi      	r3, r3, 3584
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8012cf0:	ea0101e0 	movi      	r1, 480
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8012cf4:	9344      	ld.w      	r2, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8012cf6:	74c8      	zextb      	r3, r2
 8012cf8:	c4618043 	divs      	r3, r1, r3
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8012cfc:	c50255ec 	zext      	r12, r2, 15, 8
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8012d00:	c60256e2 	zext      	r2, r2, 23, 16
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8012d04:	b061      	st.w      	r3, (r0, 0x4)
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8012d06:	c5818041 	divs      	r1, r1, r12
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8012d0a:	c4438023 	divu      	r3, r3, r2
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8012d0e:	b022      	st.w      	r1, (r0, 0x8)
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8012d10:	b060      	st.w      	r3, (r0, 0x0)
}
 8012d12:	783c      	jmp      	r15

08012d14 <HAL_InitTick>:
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8012d14:	ea234000 	movih      	r3, 16384
 8012d18:	e4630dff 	addi      	r3, r3, 3584


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 8012d1c:	6f03      	mov      	r12, r0
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8012d1e:	9364      	ld.w      	r3, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8012d20:	748c      	zextb      	r2, r3
 8012d22:	ea0301e0 	movi      	r3, 480
 8012d26:	c4438043 	divs      	r3, r3, r2
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 8012d2a:	ea02f424 	movi      	r2, 62500
 8012d2e:	c4824902 	rotli      	r2, r2, 4
 8012d32:	7cc8      	mult      	r3, r2
 8012d34:	ea0203e8 	movi      	r2, 1000
 8012d38:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8012d3c:	104f      	lrw      	r2, 0xe000e010	// 8012d78 <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8012d3e:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8012d40:	b261      	st.w      	r3, (r2, 0x4)
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8012d42:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8012d44:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8012d46:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8012d48:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8012d4a:	104d      	lrw      	r2, 0xe000e100	// 8012d7c <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8012d4c:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8012d50:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8012d54:	ea0dff00 	movi      	r13, 65280
 8012d58:	6f76      	nor      	r13, r13
 8012d5a:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8012d5c:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8012d60:	6cc4      	or      	r3, r1
 8012d62:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012d66:	ea230200 	movih      	r3, 512
 8012d6a:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012d6c:	dc622050 	st.w      	r3, (r2, 0x140)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
 8012d70:	1064      	lrw      	r3, 0x20003308	// 8012d80 <HAL_InitTick+0x6c>
 8012d72:	dd832000 	st.w      	r12, (r3, 0x0)
	return HAL_OK;
}
 8012d76:	783c      	jmp      	r15
 8012d78:	e000e010 	.long	0xe000e010
 8012d7c:	e000e100 	.long	0xe000e100
 8012d80:	20003308 	.long	0x20003308

08012d84 <SystemClock_Config>:
{
 8012d84:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8012d86:	5867      	subi      	r3, r0, 2
 8012d88:	eb0300ee 	cmphsi      	r3, 239
 8012d8c:	0826      	bt      	0x8012dd8	// 8012dd8 <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 8012d8e:	ea224000 	movih      	r2, 16384
 8012d92:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8012d96:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8012d9a:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8012d9c:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8012d9e:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8012da2:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8012da4:	330f      	movi      	r3, 15
 8012da6:	b262      	st.w      	r3, (r2, 0x8)
	RegValue = READ_REG(RCC->CLK_DIV);
 8012da8:	9264      	ld.w      	r3, (r2, 0x10)
	RegValue &= 0xFF000000;
 8012daa:	ea22ff00 	movih      	r2, 65280
 8012dae:	68c8      	and      	r3, r2
	if(cpuDiv > 12)
 8012db0:	320c      	movi      	r2, 12
 8012db2:	6408      	cmphs      	r2, r0
	RegValue |= 0x80000000;
 8012db4:	3bbf      	bseti      	r3, 31
	if(cpuDiv > 12)
 8012db6:	0c12      	bf      	0x8012dda	// 8012dda <SystemClock_Config+0x56>
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8012db8:	c4028022 	divu      	r2, r2, r0
 8012dbc:	4250      	lsli      	r2, r2, 16
 8012dbe:	ea010300 	movi      	r1, 768
 8012dc2:	6c0c      	or      	r0, r3
 8012dc4:	6c08      	or      	r0, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8012dc6:	ea234000 	movih      	r3, 16384
 8012dca:	e4630dff 	addi      	r3, r3, 3584
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8012dce:	6c04      	or      	r0, r1
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8012dd0:	b304      	st.w      	r0, (r3, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 8012dd2:	3007      	movi      	r0, 7
 8012dd4:	e3ffffa0 	bsr      	0x8012d14	// 8012d14 <HAL_InitTick>
}
 8012dd8:	1490      	pop      	r15
		wlanDiv = cpuDiv/4;
 8012dda:	4822      	lsri      	r1, r0, 2
 8012ddc:	4128      	lsli      	r1, r1, 8
 8012dde:	ea220001 	movih      	r2, 1
 8012de2:	07f0      	br      	0x8012dc2	// 8012dc2 <SystemClock_Config+0x3e>

08012de4 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
	uwTick += 1;
 8012de4:	1043      	lrw      	r2, 0x20003304	// 8012df0 <HAL_IncTick+0xc>
 8012de6:	9260      	ld.w      	r3, (r2, 0x0)
 8012de8:	2300      	addi      	r3, 1
 8012dea:	b260      	st.w      	r3, (r2, 0x0)
}
 8012dec:	783c      	jmp      	r15
 8012dee:	0000      	.short	0x0000
 8012df0:	20003304 	.long	0x20003304

08012df4 <HAL_GetTick>:

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
	return uwTick;
 8012df4:	1062      	lrw      	r3, 0x20003304	// 8012dfc <HAL_GetTick+0x8>
 8012df6:	9300      	ld.w      	r0, (r3, 0x0)
}
 8012df8:	783c      	jmp      	r15
 8012dfa:	0000      	.short	0x0000
 8012dfc:	20003304 	.long	0x20003304

08012e00 <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 8012e00:	14d2      	push      	r4-r5, r15
 8012e02:	6d43      	mov      	r5, r0
	uint32_t tickstart = HAL_GetTick();
 8012e04:	e3fffff8 	bsr      	0x8012df4	// 8012df4 <HAL_GetTick>
 8012e08:	6d03      	mov      	r4, r0
	uint32_t wait = Delay;

	while ((HAL_GetTick() - tickstart) < wait)
 8012e0a:	e3fffff5 	bsr      	0x8012df4	// 8012df4 <HAL_GetTick>
 8012e0e:	6012      	subu      	r0, r4
 8012e10:	6540      	cmphs      	r0, r5
 8012e12:	0ffc      	bf      	0x8012e0a	// 8012e0a <HAL_Delay+0xa>
	{
	}
}
 8012e14:	1492      	pop      	r4-r5, r15
	...

08012e18 <HAL_NVIC_SetPriority>:

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8012e18:	c4002822 	bclri      	r2, r0, 0
 8012e1c:	3a81      	bclri      	r2, 1
 8012e1e:	106b      	lrw      	r3, 0xe000e100	// 8012e48 <HAL_NVIC_SetPriority+0x30>
 8012e20:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8012e22:	e4002003 	andi      	r0, r0, 3
 8012e26:	4003      	lsli      	r0, r0, 3
 8012e28:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8012e2a:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8012e2c:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8012e30:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8012e32:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8012e36:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8012e3a:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8012e3e:	6cc0      	or      	r3, r0
 8012e40:	dc6220c0 	st.w      	r3, (r2, 0x300)
	NVIC_SetPriority(IRQn, Priority);
}
 8012e44:	783c      	jmp      	r15
 8012e46:	0000      	.short	0x0000
 8012e48:	e000e100 	.long	0xe000e100

08012e4c <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012e4c:	e440201f 	andi      	r2, r0, 31
 8012e50:	3301      	movi      	r3, 1
 8012e52:	c4a054c0 	zext      	r0, r0, 6, 5
 8012e56:	70c8      	lsl      	r3, r2
 8012e58:	4002      	lsli      	r0, r0, 2
 8012e5a:	1044      	lrw      	r2, 0xe000e100	// 8012e68 <HAL_NVIC_EnableIRQ+0x1c>
 8012e5c:	6008      	addu      	r0, r2
 8012e5e:	b060      	st.w      	r3, (r0, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012e60:	dc602050 	st.w      	r3, (r0, 0x140)
	/* Check the parameters */
	assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

	/* Enable interrupt */
	NVIC_EnableIRQ(IRQn);
}
 8012e64:	783c      	jmp      	r15
 8012e66:	0000      	.short	0x0000
 8012e68:	e000e100 	.long	0xe000e100

08012e6c <HAL_GPIO_Init>:
	
	assert_param(IS_GPIO_ALL_INSTANCE(GPIOx));
	assert_param(IS_GPIO_PIN(GPIO_Init->Pin));
	assert_param(IS_GPIO_MODE(GPIO_Init->Mode));

	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8012e6c:	d9812000 	ld.w      	r12, (r1, 0x0)
 8012e70:	e90c0044 	bez      	r12, 0x8012ef8	// 8012ef8 <HAL_GPIO_Init+0x8c>
 8012e74:	3200      	movi      	r2, 0
	{
		ioposition = (0x01 << position);
 8012e76:	ea140001 	movi      	r20, 1
			{
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
			}
			
			switch (GPIO_Init->Mode)
 8012e7a:	ea96001f 	lrw      	r22, 0x801545c	// 8012ef4 <HAL_GPIO_Init+0x88>
 8012e7e:	0406      	br      	0x8012e8a	// 8012e8a <HAL_GPIO_Init+0x1e>
			{
				SET_BIT(GPIOx->IE, ioposition);
			}
		}
		
		position++;
 8012e80:	2200      	addi      	r2, 1
	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8012e82:	c44c4043 	lsr      	r3, r12, r2
 8012e86:	e9030039 	bez      	r3, 0x8012ef8	// 8012ef8 <HAL_GPIO_Init+0x8c>
		ioposition = (0x01 << position);
 8012e8a:	c4544023 	lsl      	r3, r20, r2
		iocurrent = (uint32_t)(GPIO_Init->Pin) & ioposition;
 8012e8e:	c583202d 	and      	r13, r3, r12
		if (iocurrent == ioposition)
 8012e92:	674e      	cmpne      	r3, r13
 8012e94:	0bf6      	bt      	0x8012e80	// 8012e80 <HAL_GPIO_Init+0x14>
			switch (GPIO_Init->Mode)
 8012e96:	da612001 	ld.w      	r19, (r1, 0x4)
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8012e9a:	da402004 	ld.w      	r18, (r0, 0x10)
 8012e9e:	c463248d 	nor      	r13, r3, r3
			switch (GPIO_Init->Mode)
 8012ea2:	eb530002 	cmpnei      	r19, 2
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8012ea6:	c5b22032 	and      	r18, r18, r13
 8012eaa:	de402004 	st.w      	r18, (r0, 0x10)
			switch (GPIO_Init->Mode)
 8012eae:	0c44      	bf      	0x8012f36	// 8012f36 <HAL_GPIO_Init+0xca>
 8012eb0:	eb130002 	cmphsi      	r19, 3
 8012eb4:	0823      	bt      	0x8012efa	// 8012efa <HAL_GPIO_Init+0x8e>
 8012eb6:	eb530001 	cmpnei      	r19, 1
 8012eba:	08a3      	bt      	0x8013000	// 8013000 <HAL_GPIO_Init+0x194>
 8012ebc:	ea120000 	movi      	r18, 0
 8012ec0:	e6521085 	subi      	r18, r18, 134
					CLEAR_BIT(GPIOx->DIR, ioposition);
 8012ec4:	daa02002 	ld.w      	r21, (r0, 0x8)
 8012ec8:	c6ad2035 	and      	r21, r13, r21
 8012ecc:	dea02002 	st.w      	r21, (r0, 0x8)
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8012ed0:	daa12002 	ld.w      	r21, (r1, 0x8)
 8012ed4:	eb550012 	cmpnei      	r21, 18
 8012ed8:	0c1b      	bf      	0x8012f0e	// 8012f0e <HAL_GPIO_Init+0xa2>
			else if (GPIO_Init->Pull == GPIO_PULLUP)
 8012eda:	eb550013 	cmpnei      	r21, 19
 8012ede:	0c37      	bf      	0x8012f4c	// 8012f4c <HAL_GPIO_Init+0xe0>
			else if(GPIO_Init->Pull == GPIO_PULLDOWN)
 8012ee0:	eb550014 	cmpnei      	r21, 20
 8012ee4:	0c91      	bf      	0x8013006	// 8013006 <HAL_GPIO_Init+0x19a>
			switch (GPIO_Init->Mode)
 8012ee6:	eb120004 	cmphsi      	r18, 5
 8012eea:	0821      	bt      	0x8012f2c	// 8012f2c <HAL_GPIO_Init+0xc0>
 8012eec:	d2560892 	ldr.w      	r18, (r22, r18 << 2)
 8012ef0:	e8d20000 	jmp      	r18
 8012ef4:	0801545c 	.long	0x0801545c
	}
}
 8012ef8:	783c      	jmp      	r15
			switch (GPIO_Init->Mode)
 8012efa:	e6531086 	subi      	r18, r19, 135
 8012efe:	eb120004 	cmphsi      	r18, 5
 8012f02:	0fe1      	bf      	0x8012ec4	// 8012ec4 <HAL_GPIO_Init+0x58>
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8012f04:	daa12002 	ld.w      	r21, (r1, 0x8)
 8012f08:	eb550012 	cmpnei      	r21, 18
 8012f0c:	0be7      	bt      	0x8012eda	// 8012eda <HAL_GPIO_Init+0x6e>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8012f0e:	daa02003 	ld.w      	r21, (r0, 0xc)
 8012f12:	c6a32435 	or      	r21, r3, r21
 8012f16:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8012f1a:	daa02007 	ld.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8012f1e:	eb120004 	cmphsi      	r18, 5
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8012f22:	c6ad2035 	and      	r21, r13, r21
 8012f26:	dea02007 	st.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8012f2a:	0fe1      	bf      	0x8012eec	// 8012eec <HAL_GPIO_Init+0x80>
			if ((GPIO_Init->Mode & EXTI_MODE) == EXTI_MODE)
 8012f2c:	e6732080 	andi      	r19, r19, 128
 8012f30:	e913ffa8 	bez      	r19, 0x8012e80	// 8012e80 <HAL_GPIO_Init+0x14>
 8012f34:	0423      	br      	0x8012f7a	// 8012f7a <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->DIR, ioposition);
 8012f36:	da402002 	ld.w      	r18, (r0, 0x8)
 8012f3a:	c6432432 	or      	r18, r3, r18
 8012f3e:	de402002 	st.w      	r18, (r0, 0x8)
 8012f42:	ea120000 	movi      	r18, 0
 8012f46:	e6521084 	subi      	r18, r18, 133
					break;
 8012f4a:	07c3      	br      	0x8012ed0	// 8012ed0 <HAL_GPIO_Init+0x64>
					CLEAR_BIT(GPIOx->PULLUP_EN, ioposition);
 8012f4c:	daa02003 	ld.w      	r21, (r0, 0xc)
 8012f50:	c6ad2035 	and      	r21, r13, r21
 8012f54:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8012f58:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8012f5c:	c6ad2035 	and      	r21, r13, r21
 8012f60:	dea02007 	st.w      	r21, (r0, 0x1c)
 8012f64:	07c1      	br      	0x8012ee6	// 8012ee6 <HAL_GPIO_Init+0x7a>
					SET_BIT(GPIOx->IS, ioposition);
 8012f66:	d9a02008 	ld.w      	r13, (r0, 0x20)
 8012f6a:	6f4c      	or      	r13, r3
 8012f6c:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IEV, ioposition);
 8012f70:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8012f74:	6f4c      	or      	r13, r3
 8012f76:	dda0200a 	st.w      	r13, (r0, 0x28)
				SET_BIT(GPIOx->IE, ioposition);
 8012f7a:	d9a0200b 	ld.w      	r13, (r0, 0x2c)
 8012f7e:	6cf4      	or      	r3, r13
 8012f80:	b06b      	st.w      	r3, (r0, 0x2c)
 8012f82:	077f      	br      	0x8012e80	// 8012e80 <HAL_GPIO_Init+0x14>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8012f84:	da402008 	ld.w      	r18, (r0, 0x20)
 8012f88:	c64d202d 	and      	r13, r13, r18
 8012f8c:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IBE, ioposition);
 8012f90:	d9a02009 	ld.w      	r13, (r0, 0x24)
 8012f94:	6f4c      	or      	r13, r3
 8012f96:	dda02009 	st.w      	r13, (r0, 0x24)
					break;
 8012f9a:	07f0      	br      	0x8012f7a	// 8012f7a <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8012f9c:	da402008 	ld.w      	r18, (r0, 0x20)
 8012fa0:	c64d2032 	and      	r18, r13, r18
 8012fa4:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8012fa8:	da402009 	ld.w      	r18, (r0, 0x24)
 8012fac:	c64d2032 	and      	r18, r13, r18
 8012fb0:	de402009 	st.w      	r18, (r0, 0x24)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8012fb4:	da40200a 	ld.w      	r18, (r0, 0x28)
 8012fb8:	c64d202d 	and      	r13, r13, r18
 8012fbc:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8012fc0:	07dd      	br      	0x8012f7a	// 8012f7a <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8012fc2:	da402008 	ld.w      	r18, (r0, 0x20)
 8012fc6:	c64d2032 	and      	r18, r13, r18
 8012fca:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8012fce:	da402009 	ld.w      	r18, (r0, 0x24)
 8012fd2:	c64d202d 	and      	r13, r13, r18
 8012fd6:	dda02009 	st.w      	r13, (r0, 0x24)
					SET_BIT(GPIOx->IEV, ioposition);
 8012fda:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8012fde:	6f4c      	or      	r13, r3
 8012fe0:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8012fe4:	07cb      	br      	0x8012f7a	// 8012f7a <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->IS, ioposition);
 8012fe6:	da402008 	ld.w      	r18, (r0, 0x20)
 8012fea:	c6432432 	or      	r18, r3, r18
 8012fee:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8012ff2:	da40200a 	ld.w      	r18, (r0, 0x28)
 8012ff6:	c64d202d 	and      	r13, r13, r18
 8012ffa:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8012ffe:	07be      	br      	0x8012f7a	// 8012f7a <HAL_GPIO_Init+0x10e>
 8013000:	e6531086 	subi      	r18, r19, 135
 8013004:	0766      	br      	0x8012ed0	// 8012ed0 <HAL_GPIO_Init+0x64>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8013006:	daa02003 	ld.w      	r21, (r0, 0xc)
 801300a:	c6a32435 	or      	r21, r3, r21
 801300e:	dea02003 	st.w      	r21, (r0, 0xc)
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8013012:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8013016:	c6a32435 	or      	r21, r3, r21
 801301a:	dea02007 	st.w      	r21, (r0, 0x1c)
 801301e:	0764      	br      	0x8012ee6	// 8012ee6 <HAL_GPIO_Init+0x7a>

08013020 <HAL_GPIO_ReadPin>:
{
	GPIO_PinState bitstatus;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));

	if ((GPIOx->DATA & GPIO_Pin) != GPIO_PIN_RESET)
 8013020:	9060      	ld.w      	r3, (r0, 0x0)
 8013022:	684c      	and      	r1, r3
 8013024:	3940      	cmpnei      	r1, 0
	else
	{
		bitstatus = GPIO_PIN_RESET;
	}
	return bitstatus;
}
 8013026:	c4000500 	mvc      	r0
 801302a:	783c      	jmp      	r15

0801302c <HAL_GPIO_WritePin>:
	uint32_t data_en;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	assert_param(IS_GPIO_PIN_ACTION(PinState));

	data_en = READ_REG(GPIOx->DATA_B_EN);
 801302c:	d9802001 	ld.w      	r12, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8013030:	9061      	ld.w      	r3, (r0, 0x4)
 8013032:	6cc4      	or      	r3, r1
 8013034:	b061      	st.w      	r3, (r0, 0x4)
	if (PinState != GPIO_PIN_RESET)
	{
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8013036:	9060      	ld.w      	r3, (r0, 0x0)
	if (PinState != GPIO_PIN_RESET)
 8013038:	e9220008 	bnez      	r2, 0x8013048	// 8013048 <HAL_GPIO_WritePin+0x1c>
	}
	else
	{
		CLEAR_BIT(GPIOx->DATA, GPIO_Pin);
 801303c:	c4232041 	andn      	r1, r3, r1
 8013040:	b020      	st.w      	r1, (r0, 0x0)
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8013042:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8013046:	783c      	jmp      	r15
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8013048:	6c4c      	or      	r1, r3
 801304a:	b020      	st.w      	r1, (r0, 0x0)
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 801304c:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8013050:	783c      	jmp      	r15
	...

08013054 <HAL_GPIO_EXTI_IRQHandler>:
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
}

void HAL_GPIO_EXTI_IRQHandler(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
 8013054:	14d0      	push      	r15
	if ((GPIOx->MIS & GPIO_Pin) != 0)
 8013056:	906d      	ld.w      	r3, (r0, 0x34)
 8013058:	68c4      	and      	r3, r1
{
 801305a:	6c87      	mov      	r2, r1
	if ((GPIOx->MIS & GPIO_Pin) != 0)
 801305c:	e9230003 	bnez      	r3, 0x8013062	// 8013062 <HAL_GPIO_EXTI_IRQHandler+0xe>
	{
		SET_BIT(GPIOx->IC, GPIO_Pin);
		HAL_GPIO_EXTI_Callback(GPIOx, GPIO_Pin);
	}
}
 8013060:	1490      	pop      	r15
		SET_BIT(GPIOx->IC, GPIO_Pin);
 8013062:	906e      	ld.w      	r3, (r0, 0x38)
 8013064:	6c8c      	or      	r2, r3
 8013066:	b04e      	st.w      	r2, (r0, 0x38)
		HAL_GPIO_EXTI_Callback(GPIOx, GPIO_Pin);
 8013068:	e3fffa46 	bsr      	0x80124f4	// 80124f4 <HAL_GPIO_EXTI_Callback>
}
 801306c:	1490      	pop      	r15
	...

08013070 <HAL_Init>:
#include "wm_hal.h"

HAL_StatusTypeDef HAL_Init(void)
{
 8013070:	14d0      	push      	r15
	HAL_MspInit();
 8013072:	e3fff8b5 	bsr      	0x80121dc	// 80121dc <HAL_MspInit>
	return HAL_OK;
}
 8013076:	3000      	movi      	r0, 0
 8013078:	1490      	pop      	r15
	...

0801307c <I2C_Start>:
		__NOP();
	}
}

static void I2C_Start(I2C_HandleTypeDef *hi2c)
{	
 801307c:	14d1      	push      	r4, r15
 801307e:	6d03      	mov      	r4, r0
	I2C_SCL_H(hi2c);
 8013080:	9021      	ld.w      	r1, (r0, 0x4)
 8013082:	3201      	movi      	r2, 1
 8013084:	9000      	ld.w      	r0, (r0, 0x0)
 8013086:	e3ffffd3 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
	I2C_SDA_H(hi2c);
 801308a:	3201      	movi      	r2, 1
 801308c:	9423      	ld.w      	r1, (r4, 0xc)
 801308e:	9402      	ld.w      	r0, (r4, 0x8)
 8013090:	e3ffffce 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013094:	332d      	movi      	r3, 45
 8013096:	6c03      	mov      	r0, r0
 8013098:	e823ffff 	bnezad      	r3, 0x8013096	// 8013096 <I2C_Start+0x1a>
	delay_us();
	
	I2C_SDA_L(hi2c);
 801309c:	3200      	movi      	r2, 0
 801309e:	9423      	ld.w      	r1, (r4, 0xc)
 80130a0:	9402      	ld.w      	r0, (r4, 0x8)
 80130a2:	e3ffffc5 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 80130a6:	332d      	movi      	r3, 45
 80130a8:	6c03      	mov      	r0, r0
 80130aa:	e823ffff 	bnezad      	r3, 0x80130a8	// 80130a8 <I2C_Start+0x2c>
	delay_us();
	
	I2C_SCL_L(hi2c);
 80130ae:	3200      	movi      	r2, 0
 80130b0:	9421      	ld.w      	r1, (r4, 0x4)
 80130b2:	9400      	ld.w      	r0, (r4, 0x0)
 80130b4:	e3ffffbc 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 80130b8:	332d      	movi      	r3, 45
 80130ba:	6c03      	mov      	r0, r0
 80130bc:	e823ffff 	bnezad      	r3, 0x80130ba	// 80130ba <I2C_Start+0x3e>
	delay_us();
}
 80130c0:	1491      	pop      	r4, r15
	...

080130c4 <I2C_Write_Byte>:

	return ack;
}

static void I2C_Write_Byte(I2C_HandleTypeDef *hi2c, uint8_t data)
{
 80130c4:	14d3      	push      	r4-r6, r15
 80130c6:	6d43      	mov      	r5, r0
 80130c8:	6d07      	mov      	r4, r1
 80130ca:	3608      	movi      	r6, 8
	int i;
	
	for (i = 0; i < 8; i ++)
	{
		if (data & 0x80)
 80130cc:	74d2      	sextb      	r3, r4
 80130ce:	e983001f 	blz      	r3, 0x801310c	// 801310c <I2C_Write_Byte+0x48>
		{
			I2C_SDA_H(hi2c);
		}
		else
		{
			I2C_SDA_L(hi2c);
 80130d2:	3200      	movi      	r2, 0
 80130d4:	9523      	ld.w      	r1, (r5, 0xc)
 80130d6:	9502      	ld.w      	r0, (r5, 0x8)
 80130d8:	e3ffffaa 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
		}
		I2C_SCL_H(hi2c);
 80130dc:	3201      	movi      	r2, 1
 80130de:	9521      	ld.w      	r1, (r5, 0x4)
 80130e0:	9500      	ld.w      	r0, (r5, 0x0)
 80130e2:	e3ffffa5 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 80130e6:	332d      	movi      	r3, 45
 80130e8:	6c03      	mov      	r0, r0
 80130ea:	e823ffff 	bnezad      	r3, 0x80130e8	// 80130e8 <I2C_Write_Byte+0x24>
		delay_us();
		I2C_SCL_L(hi2c);
 80130ee:	3200      	movi      	r2, 0
 80130f0:	9521      	ld.w      	r1, (r5, 0x4)
 80130f2:	9500      	ld.w      	r0, (r5, 0x0)
 80130f4:	e3ffff9c 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 80130f8:	332d      	movi      	r3, 45
 80130fa:	6c03      	mov      	r0, r0
 80130fc:	e823ffff 	bnezad      	r3, 0x80130fa	// 80130fa <I2C_Write_Byte+0x36>
		delay_us();
		data <<= 1;
 8013100:	6110      	addu      	r4, r4
 8013102:	2e00      	subi      	r6, 1
 8013104:	7510      	zextb      	r4, r4
	for (i = 0; i < 8; i ++)
 8013106:	e926ffe3 	bnez      	r6, 0x80130cc	// 80130cc <I2C_Write_Byte+0x8>
	}
}
 801310a:	1493      	pop      	r4-r6, r15
			I2C_SDA_H(hi2c);
 801310c:	3201      	movi      	r2, 1
 801310e:	9523      	ld.w      	r1, (r5, 0xc)
 8013110:	9502      	ld.w      	r0, (r5, 0x8)
 8013112:	e3ffff8d 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013116:	07e3      	br      	0x80130dc	// 80130dc <I2C_Write_Byte+0x18>

08013118 <I2C_Stop>:
{
 8013118:	14d1      	push      	r4, r15
 801311a:	6d03      	mov      	r4, r0
	I2C_SDA_L(hi2c);
 801311c:	9023      	ld.w      	r1, (r0, 0xc)
 801311e:	3200      	movi      	r2, 0
 8013120:	9002      	ld.w      	r0, (r0, 0x8)
 8013122:	e3ffff85 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
	I2C_SCL_H(hi2c);
 8013126:	3201      	movi      	r2, 1
 8013128:	9421      	ld.w      	r1, (r4, 0x4)
 801312a:	9400      	ld.w      	r0, (r4, 0x0)
 801312c:	e3ffff80 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013130:	332d      	movi      	r3, 45
 8013132:	6c03      	mov      	r0, r0
 8013134:	e823ffff 	bnezad      	r3, 0x8013132	// 8013132 <I2C_Stop+0x1a>
	I2C_SDA_H(hi2c);
 8013138:	3201      	movi      	r2, 1
 801313a:	9423      	ld.w      	r1, (r4, 0xc)
 801313c:	9402      	ld.w      	r0, (r4, 0x8)
 801313e:	e3ffff77 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013142:	332d      	movi      	r3, 45
 8013144:	6c03      	mov      	r0, r0
 8013146:	e823ffff 	bnezad      	r3, 0x8013144	// 8013144 <I2C_Stop+0x2c>
}
 801314a:	1491      	pop      	r4, r15

0801314c <I2C_Wait_Ack>:
{
 801314c:	14d2      	push      	r4-r5, r15
	I2C_SDA_H(hi2c);
 801314e:	9023      	ld.w      	r1, (r0, 0xc)
{
 8013150:	6d03      	mov      	r4, r0
	I2C_SDA_H(hi2c);
 8013152:	3201      	movi      	r2, 1
 8013154:	9002      	ld.w      	r0, (r0, 0x8)
 8013156:	e3ffff6b 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 801315a:	332d      	movi      	r3, 45
 801315c:	6c03      	mov      	r0, r0
 801315e:	e823ffff 	bnezad      	r3, 0x801315c	// 801315c <I2C_Wait_Ack+0x10>
	I2C_SDA_IN(hi2c);
 8013162:	9442      	ld.w      	r2, (r4, 0x8)
 8013164:	9463      	ld.w      	r3, (r4, 0xc)
 8013166:	9222      	ld.w      	r1, (r2, 0x8)
 8013168:	c4612043 	andn      	r3, r1, r3
 801316c:	b262      	st.w      	r3, (r2, 0x8)
	I2C_SCL_H(hi2c);
 801316e:	9421      	ld.w      	r1, (r4, 0x4)
 8013170:	3201      	movi      	r2, 1
 8013172:	9400      	ld.w      	r0, (r4, 0x0)
 8013174:	e3ffff5c 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013178:	332d      	movi      	r3, 45
 801317a:	6c03      	mov      	r0, r0
 801317c:	e823ffff 	bnezad      	r3, 0x801317a	// 801317a <I2C_Wait_Ack+0x2e>
	ack = I2C_SDA_GET(hi2c);
 8013180:	9423      	ld.w      	r1, (r4, 0xc)
 8013182:	9402      	ld.w      	r0, (r4, 0x8)
 8013184:	e3ffff4e 	bsr      	0x8013020	// 8013020 <HAL_GPIO_ReadPin>
 8013188:	7540      	zextb      	r5, r0
	I2C_SCL_L(hi2c);
 801318a:	3200      	movi      	r2, 0
 801318c:	9421      	ld.w      	r1, (r4, 0x4)
 801318e:	9400      	ld.w      	r0, (r4, 0x0)
 8013190:	e3ffff4e 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013194:	332d      	movi      	r3, 45
 8013196:	6c03      	mov      	r0, r0
 8013198:	e823ffff 	bnezad      	r3, 0x8013196	// 8013196 <I2C_Wait_Ack+0x4a>
	I2C_SDA_OUT(hi2c);
 801319c:	9442      	ld.w      	r2, (r4, 0x8)
 801319e:	9423      	ld.w      	r1, (r4, 0xc)
 80131a0:	9262      	ld.w      	r3, (r2, 0x8)
 80131a2:	6cc4      	or      	r3, r1
}
 80131a4:	6c17      	mov      	r0, r5
	I2C_SDA_OUT(hi2c);
 80131a6:	b262      	st.w      	r3, (r2, 0x8)
}
 80131a8:	1492      	pop      	r4-r5, r15
	...

080131ac <HAL_I2C_Init>:

	return temp;
}

HAL_StatusTypeDef HAL_I2C_Init(I2C_HandleTypeDef *hi2c)
{
 80131ac:	14d3      	push      	r4-r6, r15
 80131ae:	1423      	subi      	r14, r14, 12
 80131b0:	6d03      	mov      	r4, r0
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	
	GPIO_InitStruct.Pin = hi2c->SCL_Pin;
 80131b2:	9061      	ld.w      	r3, (r0, 0x4)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 80131b4:	3602      	movi      	r6, 2
	GPIO_InitStruct.Pull = GPIO_PULLUP;//GPIO_PULLUP;
 80131b6:	3513      	movi      	r5, 19
	HAL_GPIO_Init(hi2c->SCL_Port, &GPIO_InitStruct);
 80131b8:	6c7b      	mov      	r1, r14
 80131ba:	9000      	ld.w      	r0, (r0, 0x0)
	GPIO_InitStruct.Pin = hi2c->SCL_Pin;
 80131bc:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 80131be:	b8c1      	st.w      	r6, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;//GPIO_PULLUP;
 80131c0:	b8a2      	st.w      	r5, (r14, 0x8)
	HAL_GPIO_Init(hi2c->SCL_Port, &GPIO_InitStruct);
 80131c2:	e3fffe55 	bsr      	0x8012e6c	// 8012e6c <HAL_GPIO_Init>
	
	GPIO_InitStruct.Pin = hi2c->SDA_Pin;
 80131c6:	9463      	ld.w      	r3, (r4, 0xc)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;//GPIO_PULLUP;//GPIO_NOPULL;
	HAL_GPIO_Init(hi2c->SDA_Port, &GPIO_InitStruct);
 80131c8:	6c7b      	mov      	r1, r14
 80131ca:	9402      	ld.w      	r0, (r4, 0x8)
	GPIO_InitStruct.Pin = hi2c->SDA_Pin;
 80131cc:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 80131ce:	b8c1      	st.w      	r6, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;//GPIO_PULLUP;//GPIO_NOPULL;
 80131d0:	b8a2      	st.w      	r5, (r14, 0x8)
	HAL_GPIO_Init(hi2c->SDA_Port, &GPIO_InitStruct);
 80131d2:	e3fffe4d 	bsr      	0x8012e6c	// 8012e6c <HAL_GPIO_Init>
	
	HAL_GPIO_WritePin(hi2c->SCL_Port, hi2c->SCL_Pin, GPIO_PIN_SET);
 80131d6:	9421      	ld.w      	r1, (r4, 0x4)
 80131d8:	9400      	ld.w      	r0, (r4, 0x0)
 80131da:	3201      	movi      	r2, 1
 80131dc:	e3ffff28 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
	HAL_GPIO_WritePin(hi2c->SDA_Port, hi2c->SDA_Pin, GPIO_PIN_SET);
 80131e0:	9402      	ld.w      	r0, (r4, 0x8)
 80131e2:	3201      	movi      	r2, 1
 80131e4:	9423      	ld.w      	r1, (r4, 0xc)
 80131e6:	e3ffff23 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
	
	return HAL_OK;
}
 80131ea:	3000      	movi      	r0, 0
 80131ec:	1403      	addi      	r14, r14, 12
 80131ee:	1493      	pop      	r4-r6, r15

080131f0 <HAL_I2C_Write>:
	
	return HAL_OK;
}

HAL_StatusTypeDef HAL_I2C_Write(I2C_HandleTypeDef *hi2c, uint8_t DevAddress, uint8_t MemAddress, uint8_t *pData, uint16_t Size)
{
 80131f0:	14d5      	push      	r4-r8, r15
 80131f2:	6d43      	mov      	r5, r0
 80131f4:	6dc7      	mov      	r7, r1
 80131f6:	6e0b      	mov      	r8, r2
 80131f8:	6d0f      	mov      	r4, r3
 80131fa:	d8ce100c 	ld.h      	r6, (r14, 0x18)
	uint32_t i, ret = HAL_ERROR;
	
	I2C_Start(hi2c);
 80131fe:	e3ffff3f 	bsr      	0x801307c	// 801307c <I2C_Start>
	I2C_Write_Byte(hi2c, (DevAddress & 0xFE));
 8013202:	6c17      	mov      	r0, r5
 8013204:	e42720fe 	andi      	r1, r7, 254
 8013208:	e3ffff5e 	bsr      	0x80130c4	// 80130c4 <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 801320c:	6c17      	mov      	r0, r5
 801320e:	e3ffff9f 	bsr      	0x801314c	// 801314c <I2C_Wait_Ack>
 8013212:	e9000008 	bez      	r0, 0x8013222	// 8013222 <HAL_I2C_Write+0x32>
			goto OUT;
		}
	}
	ret = HAL_OK;
OUT:
	I2C_Stop(hi2c);
 8013216:	6c17      	mov      	r0, r5
	uint32_t i, ret = HAL_ERROR;
 8013218:	3401      	movi      	r4, 1
	I2C_Stop(hi2c);
 801321a:	e3ffff7f 	bsr      	0x8013118	// 8013118 <I2C_Stop>
	return ret;
}
 801321e:	6c13      	mov      	r0, r4
 8013220:	1495      	pop      	r4-r8, r15
	I2C_Write_Byte(hi2c, MemAddress);
 8013222:	6c17      	mov      	r0, r5
 8013224:	6c63      	mov      	r1, r8
 8013226:	e3ffff4f 	bsr      	0x80130c4	// 80130c4 <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 801322a:	6c17      	mov      	r0, r5
 801322c:	e3ffff90 	bsr      	0x801314c	// 801314c <I2C_Wait_Ack>
 8013230:	e920fff3 	bnez      	r0, 0x8013216	// 8013216 <HAL_I2C_Write+0x26>
	for (i = 0; i < Size; i++)
 8013234:	e906000f 	bez      	r6, 0x8013252	// 8013252 <HAL_I2C_Write+0x62>
 8013238:	6190      	addu      	r6, r4
		I2C_Write_Byte(hi2c, pData[i]);
 801323a:	6c17      	mov      	r0, r5
 801323c:	8420      	ld.b      	r1, (r4, 0x0)
 801323e:	e3ffff43 	bsr      	0x80130c4	// 80130c4 <I2C_Write_Byte>
		if (I2C_Wait_Ack(hi2c))
 8013242:	6c17      	mov      	r0, r5
 8013244:	e3ffff84 	bsr      	0x801314c	// 801314c <I2C_Wait_Ack>
 8013248:	e920ffe7 	bnez      	r0, 0x8013216	// 8013216 <HAL_I2C_Write+0x26>
 801324c:	2400      	addi      	r4, 1
	for (i = 0; i < Size; i++)
 801324e:	6592      	cmpne      	r4, r6
 8013250:	0bf5      	bt      	0x801323a	// 801323a <HAL_I2C_Write+0x4a>
	I2C_Stop(hi2c);
 8013252:	6c17      	mov      	r0, r5
	ret = HAL_OK;
 8013254:	3400      	movi      	r4, 0
	I2C_Stop(hi2c);
 8013256:	e3ffff61 	bsr      	0x8013118	// 8013118 <I2C_Stop>
}
 801325a:	6c13      	mov      	r0, r4
 801325c:	1495      	pop      	r4-r8, r15
	...

08013260 <HAL_I2C_Read>:

HAL_StatusTypeDef HAL_I2C_Read(I2C_HandleTypeDef *hi2c, uint8_t DevAddress, uint8_t MemAddress, uint8_t *pData, uint16_t Size)
{
 8013260:	14d7      	push      	r4-r10, r15
 8013262:	6d03      	mov      	r4, r0
 8013264:	6d47      	mov      	r5, r1
 8013266:	6d8b      	mov      	r6, r2
 8013268:	6dcf      	mov      	r7, r3
 801326a:	d90e1010 	ld.h      	r8, (r14, 0x20)
	uint32_t i, ret = HAL_ERROR;
	
	I2C_Start(hi2c);
 801326e:	e3ffff07 	bsr      	0x801307c	// 801307c <I2C_Start>
	I2C_Write_Byte(hi2c, (DevAddress & 0xFE));
 8013272:	6c13      	mov      	r0, r4
 8013274:	e42520fe 	andi      	r1, r5, 254
 8013278:	e3ffff26 	bsr      	0x80130c4	// 80130c4 <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 801327c:	6c13      	mov      	r0, r4
 801327e:	e3ffff67 	bsr      	0x801314c	// 801314c <I2C_Wait_Ack>
 8013282:	e900000d 	bez      	r0, 0x801329c	// 801329c <HAL_I2C_Read+0x3c>
 8013286:	9462      	ld.w      	r3, (r4, 0x8)
 8013288:	9443      	ld.w      	r2, (r4, 0xc)
	uint32_t i, ret = HAL_ERROR;
 801328a:	3501      	movi      	r5, 1
			I2C_Ack(hi2c);
		}
	}
	ret = HAL_OK;
OUT:
	I2C_SDA_OUT(hi2c);
 801328c:	9322      	ld.w      	r1, (r3, 0x8)
 801328e:	6c84      	or      	r2, r1
	I2C_Stop(hi2c);
 8013290:	6c13      	mov      	r0, r4
	I2C_SDA_OUT(hi2c);
 8013292:	b342      	st.w      	r2, (r3, 0x8)
	I2C_Stop(hi2c);
 8013294:	e3ffff42 	bsr      	0x8013118	// 8013118 <I2C_Stop>
	return ret;
}
 8013298:	6c17      	mov      	r0, r5
 801329a:	1497      	pop      	r4-r10, r15
	I2C_Write_Byte(hi2c, MemAddress);
 801329c:	6c13      	mov      	r0, r4
 801329e:	6c5b      	mov      	r1, r6
 80132a0:	e3ffff12 	bsr      	0x80130c4	// 80130c4 <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 80132a4:	6c13      	mov      	r0, r4
 80132a6:	e3ffff53 	bsr      	0x801314c	// 801314c <I2C_Wait_Ack>
 80132aa:	e920ffee 	bnez      	r0, 0x8013286	// 8013286 <HAL_I2C_Read+0x26>
	I2C_Start(hi2c);
 80132ae:	6c13      	mov      	r0, r4
 80132b0:	e3fffee6 	bsr      	0x801307c	// 801307c <I2C_Start>
	I2C_Write_Byte(hi2c, (DevAddress | 0x01));
 80132b4:	ec250001 	ori      	r1, r5, 1
 80132b8:	6c13      	mov      	r0, r4
 80132ba:	e3ffff05 	bsr      	0x80130c4	// 80130c4 <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 80132be:	6c13      	mov      	r0, r4
 80132c0:	e3ffff46 	bsr      	0x801314c	// 801314c <I2C_Wait_Ack>
 80132c4:	9462      	ld.w      	r3, (r4, 0x8)
 80132c6:	e920006e 	bnez      	r0, 0x80133a2	// 80133a2 <HAL_I2C_Read+0x142>
	I2C_SDA_IN(hi2c);
 80132ca:	9322      	ld.w      	r1, (r3, 0x8)
 80132cc:	9443      	ld.w      	r2, (r4, 0xc)
 80132ce:	6849      	andn      	r1, r2
 80132d0:	b322      	st.w      	r1, (r3, 0x8)
	for (i = 0; i < Size; i++)
 80132d2:	6d63      	mov      	r5, r8
 80132d4:	e908ffdc 	bez      	r8, 0x801328c	// 801328c <HAL_I2C_Read+0x2c>
 80132d8:	e5281000 	subi      	r9, r8, 1
 80132dc:	6d83      	mov      	r6, r0
	uint8_t i, temp = 0;
 80132de:	3500      	movi      	r5, 0
 80132e0:	ea0a0008 	movi      	r10, 8
		I2C_SCL_H(hi2c);
 80132e4:	3201      	movi      	r2, 1
 80132e6:	9421      	ld.w      	r1, (r4, 0x4)
 80132e8:	9400      	ld.w      	r0, (r4, 0x0)
 80132ea:	e3fffea1 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 80132ee:	332d      	movi      	r3, 45
 80132f0:	6c03      	mov      	r0, r0
 80132f2:	e823ffff 	bnezad      	r3, 0x80132f0	// 80132f0 <HAL_I2C_Read+0x90>
		temp <<= 1;
 80132f6:	6154      	addu      	r5, r5
		if (I2C_SDA_GET(hi2c))
 80132f8:	9423      	ld.w      	r1, (r4, 0xc)
 80132fa:	9402      	ld.w      	r0, (r4, 0x8)
		temp <<= 1;
 80132fc:	7554      	zextb      	r5, r5
		if (I2C_SDA_GET(hi2c))
 80132fe:	e3fffe91 	bsr      	0x8013020	// 8013020 <HAL_GPIO_ReadPin>
 8013302:	e9000004 	bez      	r0, 0x801330a	// 801330a <HAL_I2C_Read+0xaa>
			temp |= 0x01;
 8013306:	eca50001 	ori      	r5, r5, 1
		I2C_SCL_L(hi2c);
 801330a:	3200      	movi      	r2, 0
 801330c:	9421      	ld.w      	r1, (r4, 0x4)
 801330e:	9400      	ld.w      	r0, (r4, 0x0)
 8013310:	e3fffe8e 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013314:	332d      	movi      	r3, 45
 8013316:	6c03      	mov      	r0, r0
 8013318:	e823ffff 	bnezad      	r3, 0x8013316	// 8013316 <HAL_I2C_Read+0xb6>
 801331c:	e54a1000 	subi      	r10, r10, 1
 8013320:	76a8      	zextb      	r10, r10
	for (i = 0; i < 8; i++)
 8013322:	e92affe1 	bnez      	r10, 0x80132e4	// 80132e4 <HAL_I2C_Read+0x84>
		pData[i] = I2C_Read_Byte(hi2c);
 8013326:	a7a0      	st.b      	r5, (r7, 0x0)
	I2C_SDA_OUT(hi2c);
 8013328:	9402      	ld.w      	r0, (r4, 0x8)
 801332a:	9423      	ld.w      	r1, (r4, 0xc)
 801332c:	9062      	ld.w      	r3, (r0, 0x8)
		if (i == (Size - 1))
 801332e:	665a      	cmpne      	r6, r9
	I2C_SDA_OUT(hi2c);
 8013330:	6cc4      	or      	r3, r1
 8013332:	b062      	st.w      	r3, (r0, 0x8)
		if (i == (Size - 1))
 8013334:	0c21      	bf      	0x8013376	// 8013376 <HAL_I2C_Read+0x116>
	I2C_SDA_L(hi2c);
 8013336:	6cab      	mov      	r2, r10
 8013338:	e3fffe7a 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
	I2C_SCL_H(hi2c);
 801333c:	3201      	movi      	r2, 1
 801333e:	9421      	ld.w      	r1, (r4, 0x4)
 8013340:	9400      	ld.w      	r0, (r4, 0x0)
 8013342:	e3fffe75 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013346:	332d      	movi      	r3, 45
 8013348:	6c03      	mov      	r0, r0
 801334a:	e823ffff 	bnezad      	r3, 0x8013348	// 8013348 <HAL_I2C_Read+0xe8>
	I2C_SCL_L(hi2c);
 801334e:	3200      	movi      	r2, 0
 8013350:	9421      	ld.w      	r1, (r4, 0x4)
 8013352:	9400      	ld.w      	r0, (r4, 0x0)
 8013354:	e3fffe6c 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013358:	332d      	movi      	r3, 45
 801335a:	6c03      	mov      	r0, r0
 801335c:	e823ffff 	bnezad      	r3, 0x801335a	// 801335a <HAL_I2C_Read+0xfa>
	I2C_SDA_IN(hi2c);
 8013360:	9462      	ld.w      	r3, (r4, 0x8)
	for (i = 0; i < Size; i++)
 8013362:	2600      	addi      	r6, 1
	I2C_SDA_IN(hi2c);
 8013364:	9322      	ld.w      	r1, (r3, 0x8)
 8013366:	9443      	ld.w      	r2, (r4, 0xc)
	for (i = 0; i < Size; i++)
 8013368:	661a      	cmpne      	r6, r8
	I2C_SDA_IN(hi2c);
 801336a:	6849      	andn      	r1, r2
 801336c:	b322      	st.w      	r1, (r3, 0x8)
 801336e:	2700      	addi      	r7, 1
	for (i = 0; i < Size; i++)
 8013370:	0bb7      	bt      	0x80132de	// 80132de <HAL_I2C_Read+0x7e>
	ret = HAL_OK;
 8013372:	3500      	movi      	r5, 0
 8013374:	078c      	br      	0x801328c	// 801328c <HAL_I2C_Read+0x2c>
	I2C_SDA_H(hi2c);
 8013376:	3201      	movi      	r2, 1
 8013378:	e3fffe5a 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
	I2C_SCL_H(hi2c);
 801337c:	3201      	movi      	r2, 1
 801337e:	9421      	ld.w      	r1, (r4, 0x4)
 8013380:	9400      	ld.w      	r0, (r4, 0x0)
 8013382:	e3fffe55 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013386:	332d      	movi      	r3, 45
 8013388:	6c03      	mov      	r0, r0
 801338a:	e823ffff 	bnezad      	r3, 0x8013388	// 8013388 <HAL_I2C_Read+0x128>
	I2C_SCL_L(hi2c);
 801338e:	3200      	movi      	r2, 0
 8013390:	9421      	ld.w      	r1, (r4, 0x4)
 8013392:	9400      	ld.w      	r0, (r4, 0x0)
 8013394:	e3fffe4c 	bsr      	0x801302c	// 801302c <HAL_GPIO_WritePin>
 8013398:	332d      	movi      	r3, 45
 801339a:	6c03      	mov      	r0, r0
 801339c:	e823ffff 	bnezad      	r3, 0x801339a	// 801339a <HAL_I2C_Read+0x13a>
 80133a0:	07e0      	br      	0x8013360	// 8013360 <HAL_I2C_Read+0x100>
 80133a2:	9443      	ld.w      	r2, (r4, 0xc)
	uint32_t i, ret = HAL_ERROR;
 80133a4:	3501      	movi      	r5, 1
 80133a6:	0773      	br      	0x801328c	// 801328c <HAL_I2C_Read+0x2c>

080133a8 <__readByCMD.constprop.0>:
{
    int i = 0;
    int word = sz / 4;
    int byte = sz % 4;
    unsigned long addr_read;
	if (!(FLASH->FLASH_CR&0x1))/*non-QIO mode, only single line command can be used*/
 80133a8:	ea022000 	movi      	r2, 8192
 80133ac:	3abe      	bseti      	r2, 30
    int byte = sz % 4;
 80133ae:	e6412003 	andi      	r18, r1, 3
	if (!(FLASH->FLASH_CR&0x1))/*non-QIO mode, only single line command can be used*/
 80133b2:	9262      	ld.w      	r3, (r2, 0x8)
 80133b4:	e4632001 	andi      	r3, r3, 1
 80133b8:	e923001a 	bnez      	r3, 0x80133ec	// 80133ec <__readByCMD.constprop.0+0x44>
        FLASH->CMD_INFO = 0x8000C003 | (((sz - 1) & 0x3FF) << 16);
        FLASH->ADDR = addr & 0x1FFFFFF;
        FLASH->CMD_START = FLASH_CMD_START_CMD;
        break;
    case 0x0B:
        if((FLASH->FLASH_CR & 0x2) == 0x2)
 80133bc:	9262      	ld.w      	r3, (r2, 0x8)
 80133be:	e4632002 	andi      	r3, r3, 2
 80133c2:	e923004e 	bnez      	r3, 0x801345e	// 801345e <__readByCMD.constprop.0+0xb6>
        {
            FLASH->CMD_INFO = 0xB400C00B | (((sz - 1) & 0x3FF) << 16);
        }
        else
        {
            FLASH->CMD_INFO = 0xBC00C00B | (((sz - 1) & 0x3FF) << 16);
 80133c6:	5963      	subi      	r3, r1, 1
 80133c8:	ea2c03ff 	movih      	r12, 1023
 80133cc:	4370      	lsli      	r3, r3, 16
 80133ce:	68f0      	and      	r3, r12
 80133d0:	ea8c002b 	lrw      	r12, 0xbc00c00b	// 801347c <__readByCMD.constprop.0+0xd4>
 80133d4:	6cf0      	or      	r3, r12
 80133d6:	b260      	st.w      	r3, (r2, 0x0)
        }
        FLASH->ADDR = addr & 0x1FFFFFF;
 80133d8:	ea032000 	movi      	r3, 8192
 80133dc:	3bbe      	bseti      	r3, 30
 80133de:	c4005700 	zext      	r0, r0, 24, 0
        FLASH->CMD_START = FLASH_CMD_START_CMD;
 80133e2:	ea020100 	movi      	r2, 256
        FLASH->ADDR = addr & 0x1FFFFFF;
 80133e6:	b304      	st.w      	r0, (r3, 0x10)
        FLASH->CMD_START = FLASH_CMD_START_CMD;
 80133e8:	b341      	st.w      	r2, (r3, 0x4)
 80133ea:	0410      	br      	0x801340a	// 801340a <__readByCMD.constprop.0+0x62>
        FLASH->ADDR = addr & 0x1FFFFFF;
        FLASH->CMD_START = FLASH_CMD_START_CMD;
        break;

    case 0xEB:
        FLASH->CMD_INFO = 0xEC00C0EB | (((sz - 1) & 0x3FF) << 16);
 80133ec:	5963      	subi      	r3, r1, 1
 80133ee:	ea2c03ff 	movih      	r12, 1023
 80133f2:	4370      	lsli      	r3, r3, 16
 80133f4:	68f0      	and      	r3, r12
 80133f6:	ea8c0023 	lrw      	r12, 0xec00c0eb	// 8013480 <__readByCMD.constprop.0+0xd8>
 80133fa:	6cf0      	or      	r3, r12
 80133fc:	b260      	st.w      	r3, (r2, 0x0)
        FLASH->ADDR = addr & 0x1FFFFFF;
 80133fe:	c4005700 	zext      	r0, r0, 24, 0
        FLASH->CMD_START = FLASH_CMD_START_CMD;
 8013402:	ea030100 	movi      	r3, 256
        FLASH->ADDR = addr & 0x1FFFFFF;
 8013406:	b204      	st.w      	r0, (r2, 0x10)
        FLASH->CMD_START = FLASH_CMD_START_CMD;
 8013408:	b261      	st.w      	r3, (r2, 0x4)
    int word = sz / 4;
 801340a:	4922      	lsri      	r1, r1, 2
    }

    //	printf("delay delay delay delay\n");
    //	dumpUint32("readByCMD RSA_BASE", RSA_BASE, sz/4);
    addr_read = RSA_BASE;
    for(i = 0; i < word; i ++)
 801340c:	e9010033 	bez      	r1, 0x8013472	// 8013472 <__readByCMD.constprop.0+0xca>
 8013410:	3000      	movi      	r0, 0
 8013412:	ea224000 	movih      	r2, 16384
 8013416:	ea8c001c 	lrw      	r12, 0x20001c14	// 8013484 <__readByCMD.constprop.0+0xdc>
 801341a:	ea23c000 	movih      	r3, 49152
 801341e:	60c8      	addu      	r3, r2
 8013420:	2000      	addi      	r0, 1
 8013422:	60f0      	addu      	r3, r12
 8013424:	6406      	cmpne      	r1, r0
    {
        M32(buf) = M32(addr_read);
 8013426:	d002880d 	ldbi.w      	r13, (r2)
 801342a:	dda32000 	st.w      	r13, (r3, 0x0)
    for(i = 0; i < word; i ++)
 801342e:	0bf6      	bt      	0x801341a	// 801341a <__readByCMD.constprop.0+0x72>
 8013430:	4122      	lsli      	r1, r1, 2
 8013432:	ea234000 	movih      	r3, 16384
 8013436:	6304      	addu      	r12, r1
 8013438:	604c      	addu      	r1, r3
        buf += 4;
        addr_read += 4;
    }

    if(byte > 0)
 801343a:	e9120010 	bez      	r18, 0x801345a	// 801345a <__readByCMD.constprop.0+0xb2>
    {
        M32(buf) = M32(addr_read);
 801343e:	9160      	ld.w      	r3, (r1, 0x0)
 8013440:	e6521000 	subi      	r18, r18, 1
 8013444:	dc6c2000 	st.w      	r3, (r12, 0x0)
        buf += 3;							//point last byte
        byte = 4 - byte;
        while(byte)
        {
            *buf = 0;
 8013448:	3200      	movi      	r2, 0
        buf += 3;							//point last byte
 801344a:	e46c0002 	addi      	r3, r12, 3
 801344e:	c64c002c 	addu      	r12, r12, r18
            *buf = 0;
 8013452:	a340      	st.b      	r2, (r3, 0x0)
            buf --;
 8013454:	2b00      	subi      	r3, 1
        while(byte)
 8013456:	670e      	cmpne      	r3, r12
 8013458:	0bfd      	bt      	0x8013452	// 8013452 <__readByCMD.constprop.0+0xaa>
            byte --;
        }
    }
    return 0;
}
 801345a:	3000      	movi      	r0, 0
 801345c:	783c      	jmp      	r15
            FLASH->CMD_INFO = 0xB400C00B | (((sz - 1) & 0x3FF) << 16);
 801345e:	5963      	subi      	r3, r1, 1
 8013460:	ea2c03ff 	movih      	r12, 1023
 8013464:	4370      	lsli      	r3, r3, 16
 8013466:	68f0      	and      	r3, r12
 8013468:	ea8c0008 	lrw      	r12, 0xb400c00b	// 8013488 <__readByCMD.constprop.0+0xe0>
 801346c:	6cf0      	or      	r3, r12
 801346e:	b260      	st.w      	r3, (r2, 0x0)
 8013470:	07b4      	br      	0x80133d8	// 80133d8 <__readByCMD.constprop.0+0x30>
    for(i = 0; i < word; i ++)
 8013472:	ea8c0005 	lrw      	r12, 0x20001c14	// 8013484 <__readByCMD.constprop.0+0xdc>
 8013476:	ea214000 	movih      	r1, 16384
 801347a:	07e0      	br      	0x801343a	// 801343a <__readByCMD.constprop.0+0x92>
 801347c:	bc00c00b 	.long	0xbc00c00b
 8013480:	ec00c0eb 	.long	0xec00c0eb
 8013484:	20001c14 	.long	0x20001c14
 8013488:	b400c00b 	.long	0xb400c00b

0801348c <flashRead>:

static int flashRead(unsigned long addr, unsigned char *buf, unsigned long sz)
{
 801348c:	14d7      	push      	r4-r10, r15
    int i = 0;
    int page_offset = addr & (INSIDE_FLS_PAGE_SIZE - 1);

    static char cache[INSIDE_FLS_PAGE_SIZE] = {0};
	
    flash_addr = addr & ~(INSIDE_FLS_PAGE_SIZE - 1);
 801348e:	3300      	movi      	r3, 0
 8013490:	2bff      	subi      	r3, 256
    int page_offset = addr & (INSIDE_FLS_PAGE_SIZE - 1);
 8013492:	e52020ff 	andi      	r9, r0, 255
    flash_addr = addr & ~(INSIDE_FLS_PAGE_SIZE - 1);
 8013496:	c4602027 	and      	r7, r0, r3
    __readByCMD(0xEB, flash_addr, (unsigned char *)cache, INSIDE_FLS_PAGE_SIZE);
    if (sz > INSIDE_FLS_PAGE_SIZE - page_offset)
 801349a:	ea050100 	movi      	r5, 256
{
 801349e:	6e0b      	mov      	r8, r2
 80134a0:	6d07      	mov      	r4, r1
    __readByCMD(0xEB, flash_addr, (unsigned char *)cache, INSIDE_FLS_PAGE_SIZE);
 80134a2:	6c1f      	mov      	r0, r7
 80134a4:	ea010100 	movi      	r1, 256
    if (sz > INSIDE_FLS_PAGE_SIZE - page_offset)
 80134a8:	6166      	subu      	r5, r9
    __readByCMD(0xEB, flash_addr, (unsigned char *)cache, INSIDE_FLS_PAGE_SIZE);
 80134aa:	e3ffff7f 	bsr      	0x80133a8	// 80133a8 <__readByCMD.constprop.0>
    if (sz > INSIDE_FLS_PAGE_SIZE - page_offset)
 80134ae:	6614      	cmphs      	r5, r8
 80134b0:	0836      	bt      	0x801351c	// 801351c <flashRead+0x90>
    {
        memcpy(buf, cache + page_offset, INSIDE_FLS_PAGE_SIZE - page_offset);
 80134b2:	11c1      	lrw      	r6, 0x20001c14	// 8013534 <flashRead+0xa8>
 80134b4:	6c97      	mov      	r2, r5
 80134b6:	6c13      	mov      	r0, r4
        buf += INSIDE_FLS_PAGE_SIZE - page_offset;
        flash_addr 	+= INSIDE_FLS_PAGE_SIZE;

        sz_pagenum = (sz - (INSIDE_FLS_PAGE_SIZE - page_offset)) / INSIDE_FLS_PAGE_SIZE;
 80134b8:	6224      	addu      	r8, r9
        memcpy(buf, cache + page_offset, INSIDE_FLS_PAGE_SIZE - page_offset);
 80134ba:	c5260021 	addu      	r1, r6, r9
 80134be:	e3fff369 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
        sz_pagenum = (sz - (INSIDE_FLS_PAGE_SIZE - page_offset)) / INSIDE_FLS_PAGE_SIZE;
 80134c2:	e46810ff 	subi      	r3, r8, 256
 80134c6:	4b68      	lsri      	r3, r3, 8
        buf += INSIDE_FLS_PAGE_SIZE - page_offset;
 80134c8:	6114      	addu      	r4, r5
        sz_remain = (sz - (INSIDE_FLS_PAGE_SIZE - page_offset)) % INSIDE_FLS_PAGE_SIZE;
 80134ca:	e50820ff 	andi      	r8, r8, 255
        flash_addr 	+= INSIDE_FLS_PAGE_SIZE;
 80134ce:	e4a700ff 	addi      	r5, r7, 256
        for (i = 0; i < sz_pagenum; i++)
 80134d2:	e903002e 	bez      	r3, 0x801352e	// 801352e <flashRead+0xa2>
 80134d6:	c503482a 	lsli      	r10, r3, 8
 80134da:	c5440029 	addu      	r9, r4, r10
        {

            __readByCMD(0xEB, flash_addr, (unsigned char *)cache, INSIDE_FLS_PAGE_SIZE);
 80134de:	ea010100 	movi      	r1, 256
 80134e2:	6c17      	mov      	r0, r5
 80134e4:	e3ffff62 	bsr      	0x80133a8	// 80133a8 <__readByCMD.constprop.0>
            memcpy(buf, cache, INSIDE_FLS_PAGE_SIZE);
 80134e8:	6c13      	mov      	r0, r4
 80134ea:	ea020100 	movi      	r2, 256
 80134ee:	6c5b      	mov      	r1, r6
            buf 		+= INSIDE_FLS_PAGE_SIZE;
 80134f0:	24ff      	addi      	r4, 256
            memcpy(buf, cache, INSIDE_FLS_PAGE_SIZE);
 80134f2:	e3fff34f 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
        for (i = 0; i < sz_pagenum; i++)
 80134f6:	6652      	cmpne      	r4, r9
            flash_addr 	+= INSIDE_FLS_PAGE_SIZE;
 80134f8:	25ff      	addi      	r5, 256
        for (i = 0; i < sz_pagenum; i++)
 80134fa:	0bf2      	bt      	0x80134de	// 80134de <flashRead+0x52>
 80134fc:	c5470025 	addu      	r5, r7, r10
 8013500:	25ff      	addi      	r5, 256
        }

        if (sz_remain)
 8013502:	e9080014 	bez      	r8, 0x801352a	// 801352a <flashRead+0x9e>
        {
            __readByCMD(0xEB, flash_addr, (unsigned char *)cache, sz_remain);
 8013506:	6c63      	mov      	r1, r8
 8013508:	6c17      	mov      	r0, r5
 801350a:	e3ffff4f 	bsr      	0x80133a8	// 80133a8 <__readByCMD.constprop.0>
            memcpy(buf, cache, sz_remain);
 801350e:	6ca3      	mov      	r2, r8
 8013510:	1029      	lrw      	r1, 0x20001c14	// 8013534 <flashRead+0xa8>
 8013512:	6c27      	mov      	r0, r9
 8013514:	e3fff33e 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
    {
        memcpy(buf, cache + page_offset, sz);
    }

    return 0;
}
 8013518:	3000      	movi      	r0, 0
 801351a:	1497      	pop      	r4-r10, r15
        memcpy(buf, cache + page_offset, sz);
 801351c:	1066      	lrw      	r3, 0x20001c14	// 8013534 <flashRead+0xa8>
 801351e:	6ca3      	mov      	r2, r8
 8013520:	c4690021 	addu      	r1, r9, r3
 8013524:	6c13      	mov      	r0, r4
 8013526:	e3fff335 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
}
 801352a:	3000      	movi      	r0, 0
 801352c:	1497      	pop      	r4-r10, r15
        buf += INSIDE_FLS_PAGE_SIZE - page_offset;
 801352e:	6e53      	mov      	r9, r4
 8013530:	07e9      	br      	0x8013502	// 8013502 <flashRead+0x76>
 8013532:	0000      	.short	0x0000
 8013534:	20001c14 	.long	0x20001c14

08013538 <HAL_FLASH_Read>:
 * @retval         HAL_ERROR	    if read fail
 *
 * @note           None
 */
HAL_StatusTypeDef HAL_FLASH_Read(uint32_t addr, uint8_t *buf, uint32_t len)
{
 8013538:	14d2      	push      	r4-r5, r15
    FLASH->CMD_INFO = 0x2c09F;
 801353a:	ea032000 	movi      	r3, 8192
 801353e:	3bbe      	bseti      	r3, 30
 8013540:	ea0cc09f 	movi      	r12, 49311
 8013544:	c62c284c 	bseti      	r12, r12, 17
 8013548:	dd832000 	st.w      	r12, (r3, 0x0)
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 801354c:	ea0c0100 	movi      	r12, 256
 8013550:	dd832001 	st.w      	r12, (r3, 0x4)
    return M32(RSA_BASE);
 8013554:	ea234000 	movih      	r3, 16384
    FLASH->CMD_INFO = 0x2c09F;
 8013558:	3400      	movi      	r4, 0
    return M32(RSA_BASE);
 801355a:	9360      	ld.w      	r3, (r3, 0x0)
    density = ((read_first_value() & 0xFFFFFF) >> 16) & 0xFF;
 801355c:	4b70      	lsri      	r3, r3, 16
    if (density && (density <= 0x21))  /*just limit to (1<<33UL) Byte*/
 801355e:	e5831000 	subi      	r12, r3, 1
 8013562:	7730      	zextb      	r12, r12
 8013564:	eb0c0020 	cmphsi      	r12, 33
 8013568:	0815      	bt      	0x8013592	// 8013592 <HAL_FLASH_Read+0x5a>
        return (1 << density);
 801356a:	e46320ff 	andi      	r3, r3, 255
 801356e:	ea0c0001 	movi      	r12, 1
    int err;

    if (((addr & (INSIDE_FLS_BASE_ADDR - 1)) >=  getFlashDensity()) || (len == 0) || (buf == NULL))
 8013572:	c400574d 	zext      	r13, r0, 26, 0
        return (1 << density);
 8013576:	c46c4023 	lsl      	r3, r12, r3
    if (((addr & (INSIDE_FLS_BASE_ADDR - 1)) >=  getFlashDensity()) || (len == 0) || (buf == NULL))
 801357a:	64f4      	cmphs      	r13, r3
 801357c:	080b      	bt      	0x8013592	// 8013592 <HAL_FLASH_Read+0x5a>
 801357e:	e902000a 	bez      	r2, 0x8013592	// 8013592 <HAL_FLASH_Read+0x5a>
 8013582:	e9010008 	bez      	r1, 0x8013592	// 8013592 <HAL_FLASH_Read+0x5a>
    {
        return HAL_ERROR;
    }

    __HAL_LOCK(&pFlash);
 8013586:	10a8      	lrw      	r5, 0x2000330c	// 80135a4 <HAL_FLASH_Read+0x6c>
 8013588:	9560      	ld.w      	r3, (r5, 0x0)
 801358a:	3b41      	cmpnei      	r3, 1
 801358c:	0805      	bt      	0x8013596	// 8013596 <HAL_FLASH_Read+0x5e>
 801358e:	3002      	movi      	r0, 2
    flashRead(addr, buf, len);

    err = HAL_OK;
    __HAL_UNLOCK(&pFlash);
    return err;
}
 8013590:	1492      	pop      	r4-r5, r15
        return HAL_ERROR;
 8013592:	3001      	movi      	r0, 1
}
 8013594:	1492      	pop      	r4-r5, r15
    __HAL_LOCK(&pFlash);
 8013596:	dd852000 	st.w      	r12, (r5, 0x0)
    flashRead(addr, buf, len);
 801359a:	e3ffff79 	bsr      	0x801348c	// 801348c <flashRead>
    return err;
 801359e:	6c13      	mov      	r0, r4
    __HAL_UNLOCK(&pFlash);
 80135a0:	b580      	st.w      	r4, (r5, 0x0)
}
 80135a2:	1492      	pop      	r4-r5, r15
 80135a4:	2000330c 	.long	0x2000330c

080135a8 <HAL_FLASH_Write>:
 * @retval         HAL_ERROR	    	if argument is invalid
 *
 * @note           None
 */
HAL_StatusTypeDef HAL_FLASH_Write(uint32_t addr, uint8_t *buf, uint32_t len)
{
 80135a8:	ebe00058 	push      	r4-r11, r15, r16-r17
 80135ac:	1422      	subi      	r14, r14, 8
    FLASH->CMD_INFO = 0x2c09F;
 80135ae:	ea052000 	movi      	r5, 8192
 80135b2:	3dbe      	bseti      	r5, 30
 80135b4:	ea03c09f 	movi      	r3, 49311
 80135b8:	3bb1      	bseti      	r3, 17
 80135ba:	b560      	st.w      	r3, (r5, 0x0)
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 80135bc:	ea060100 	movi      	r6, 256
    return M32(RSA_BASE);
 80135c0:	ea234000 	movih      	r3, 16384
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 80135c4:	b5c1      	st.w      	r6, (r5, 0x4)
    return M32(RSA_BASE);
 80135c6:	9360      	ld.w      	r3, (r3, 0x0)
    density = ((read_first_value() & 0xFFFFFF) >> 16) & 0xFF;
 80135c8:	4b70      	lsri      	r3, r3, 16
{
 80135ca:	c4024830 	lsli      	r16, r2, 0
    if (density && (density <= 0x21))  /*just limit to (1<<33UL) Byte*/
 80135ce:	5b43      	subi      	r2, r3, 1
 80135d0:	7488      	zextb      	r2, r2
 80135d2:	eb020020 	cmphsi      	r2, 33
{
 80135d6:	c4014831 	lsli      	r17, r1, 0
    if (density && (density <= 0x21))  /*just limit to (1<<33UL) Byte*/
 80135da:	0884      	bt      	0x80136e2	// 80136e2 <HAL_FLASH_Write+0x13a>
        return (1 << density);
 80135dc:	e44320ff 	andi      	r2, r3, 255
 80135e0:	3301      	movi      	r3, 1
    unsigned int secoff;
    unsigned int secremain;
    unsigned int i;
    unsigned int offaddr;

    if (((addr & (INSIDE_FLS_BASE_ADDR - 1)) >=  getFlashDensity()) || (len == 0) || (buf == NULL))
 80135e2:	c4005747 	zext      	r7, r0, 26, 0
        return (1 << density);
 80135e6:	c4434022 	lsl      	r2, r3, r2
    if (((addr & (INSIDE_FLS_BASE_ADDR - 1)) >=  getFlashDensity()) || (len == 0) || (buf == NULL))
 80135ea:	649c      	cmphs      	r7, r2
 80135ec:	0877      	bt      	0x80136da	// 80136da <HAL_FLASH_Write+0x132>
 80135ee:	e9100076 	bez      	r16, 0x80136da	// 80136da <HAL_FLASH_Write+0x132>
 80135f2:	e9010074 	bez      	r1, 0x80136da	// 80136da <HAL_FLASH_Write+0x132>
    {
        return HAL_ERROR;
    }

    __HAL_LOCK(&pFlash);
 80135f6:	ea8d0042 	lrw      	r13, 0x2000330c	// 80136fc <HAL_FLASH_Write+0x154>
 80135fa:	d84d2000 	ld.w      	r2, (r13, 0x0)
 80135fe:	3a41      	cmpnei      	r2, 1
 8013600:	0c6c      	bf      	0x80136d8	// 80136d8 <HAL_FLASH_Write+0x130>

    offaddr = addr & (INSIDE_FLS_BASE_ADDR - 1);			
    secpos = offaddr / INSIDE_FLS_SECTOR_SIZE;				
    secoff = (offaddr % INSIDE_FLS_SECTOR_SIZE);			
 8013602:	e4802fff 	andi      	r4, r0, 4095
    secremain = INSIDE_FLS_SECTOR_SIZE - secoff;    
 8013606:	ea0b1000 	movi      	r11, 4096
    __HAL_LOCK(&pFlash);
 801360a:	dc6d2000 	st.w      	r3, (r13, 0x0)
    secremain = INSIDE_FLS_SECTOR_SIZE - secoff;    
 801360e:	62d2      	subu      	r11, r4
 8013610:	ea03fffe 	movi      	r3, 65534
 8013614:	c5634903 	rotli      	r3, r3, 11
 8013618:	ea88003a 	lrw      	r8, 0x20001d14	// 8013700 <HAL_FLASH_Write+0x158>
 801361c:	fa0bcd2b 	min.u32      	r11, r11, r16
 8013620:	69cc      	and      	r7, r3
    {
        secremain = len;								
    }
    while (1)
    {
        flashRead(secpos * INSIDE_FLS_SECTOR_SIZE, cache, INSIDE_FLS_SECTOR_SIZE);
 8013622:	c4084832 	lsli      	r18, r8, 0
	FLASH->CMD_INFO = 0x6;
 8013626:	ea090006 	movi      	r9, 6
    FLASH->CMD_INFO = cmd | ((sz - 1) << 16);
 801362a:	ea8a0037 	lrw      	r10, 0x80ff9002	// 8013704 <HAL_FLASH_Write+0x15c>
        flashRead(secpos * INSIDE_FLS_SECTOR_SIZE, cache, INSIDE_FLS_SECTOR_SIZE);
 801362e:	c4124821 	lsli      	r1, r18, 0
 8013632:	ea021000 	movi      	r2, 4096
 8013636:	6c1f      	mov      	r0, r7
 8013638:	ddae2001 	st.w      	r13, (r14, 0x4)
 801363c:	de4e2000 	st.w      	r18, (r14, 0x0)
 8013640:	e3ffff26 	bsr      	0x801348c	// 801348c <flashRead>
    FLASH->CMD_INFO = cmd;
 8013644:	ea238000 	movih      	r3, 32768
 8013648:	e463081f 	addi      	r3, r3, 2080
	FLASH->CMD_INFO = 0x6;
 801364c:	dd252000 	st.w      	r9, (r5, 0x0)
	FLASH->CMD_START = FLASH_CMD_START_CMD;
 8013650:	b5c1      	st.w      	r6, (r5, 0x4)
    FLASH->CMD_INFO = cmd;
 8013652:	b560      	st.w      	r3, (r5, 0x0)
    FLASH->ADDR = (addr & 0x1FFFFFF);
 8013654:	c4075703 	zext      	r3, r7, 24, 0
 8013658:	b564      	st.w      	r3, (r5, 0x10)

        eraseSector(secpos * INSIDE_FLS_SECTOR_SIZE);
        for (i = 0; i < secremain; i++) 
 801365a:	da4e2000 	ld.w      	r18, (r14, 0x0)
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 801365e:	b5c1      	st.w      	r6, (r5, 0x4)
        for (i = 0; i < secremain; i++) 
 8013660:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8013664:	e90b000e 	bez      	r11, 0x8013680	// 8013680 <HAL_FLASH_Write+0xd8>
 8013668:	c4114823 	lsli      	r3, r17, 0
 801366c:	c4880022 	addu      	r2, r8, r4
 8013670:	c5710021 	addu      	r1, r17, r11
        {
            cache[i + secoff] = buf[i];
 8013674:	d0038000 	ldbi.b      	r0, (r3)
        for (i = 0; i < secremain; i++) 
 8013678:	644e      	cmpne      	r3, r1
            cache[i + secoff] = buf[i];
 801367a:	d4028000 	stbi.b      	r0, (r2)
        for (i = 0; i < secremain; i++) 
 801367e:	0bfb      	bt      	0x8013674	// 8013674 <HAL_FLASH_Write+0xcc>
 8013680:	e6670fff 	addi      	r19, r7, 4096
 8013684:	6f1f      	mov      	r12, r7
 8013686:	c4ec0082 	subu      	r2, r12, r7
 801368a:	60a0      	addu      	r2, r8
    base_addr = RSA_BASE;
 801368c:	ea214000 	movih      	r1, 16384
 8013690:	3340      	movi      	r3, 64
        M32(base_addr) = *((unsigned long *)buf);
 8013692:	d0028800 	ldbi.w      	r0, (r2)
 8013696:	d4018800 	stbi.w      	r0, (r1)
    while(size)
 801369a:	e823fffc 	bnezad      	r3, 0x8013692	// 8013692 <HAL_FLASH_Write+0xea>
    FLASH->ADDR = (addr & 0x1FFFFFF);
 801369e:	c40c5703 	zext      	r3, r12, 24, 0
 80136a2:	e58c00ff 	addi      	r12, r12, 256
        }
        for (i = 0; i < (INSIDE_FLS_SECTOR_SIZE / INSIDE_FLS_PAGE_SIZE); i++)
 80136a6:	c5930480 	cmpne      	r19, r12
	FLASH->CMD_INFO = 0x6;
 80136aa:	dd252000 	st.w      	r9, (r5, 0x0)
	FLASH->CMD_START = FLASH_CMD_START_CMD;
 80136ae:	b5c1      	st.w      	r6, (r5, 0x4)
    FLASH->CMD_INFO = cmd | ((sz - 1) << 16);
 80136b0:	dd452000 	st.w      	r10, (r5, 0x0)
    FLASH->ADDR = (addr & 0x1FFFFFF);
 80136b4:	b564      	st.w      	r3, (r5, 0x10)
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 80136b6:	b5c1      	st.w      	r6, (r5, 0x4)
        for (i = 0; i < (INSIDE_FLS_SECTOR_SIZE / INSIDE_FLS_PAGE_SIZE); i++)
 80136b8:	0be7      	bt      	0x8013686	// 8013686 <HAL_FLASH_Write+0xde>
        {
            programPage(secpos * INSIDE_FLS_SECTOR_SIZE + i * INSIDE_FLS_PAGE_SIZE, INSIDE_FLS_PAGE_SIZE, &cache[i * INSIDE_FLS_PAGE_SIZE]);	
        }
        if(len == secremain)
 80136ba:	c5700480 	cmpne      	r16, r11
 80136be:	0c17      	bf      	0x80136ec	// 80136ec <HAL_FLASH_Write+0x144>
        else                    
        {
            secpos++;           
            secoff = 0;         
            buf += secremain;   
            len -= secremain;
 80136c0:	c5700090 	subu      	r16, r16, r11
            buf += secremain;   
 80136c4:	c5710031 	addu      	r17, r17, r11
 80136c8:	ea0b1000 	movi      	r11, 4096
 80136cc:	3400      	movi      	r4, 0
 80136ce:	f970cd2b 	min.u32      	r11, r16, r11
 80136d2:	c4134827 	lsli      	r7, r19, 0
 80136d6:	07ac      	br      	0x801362e	// 801362e <HAL_FLASH_Write+0x86>
    __HAL_LOCK(&pFlash);
 80136d8:	3302      	movi      	r3, 2
        }
    }

    __HAL_UNLOCK(&pFlash);
    return HAL_OK;
}
 80136da:	6c0f      	mov      	r0, r3
 80136dc:	1402      	addi      	r14, r14, 8
 80136de:	ebc00058 	pop      	r4-r11, r15, r16-r17
        return HAL_ERROR;
 80136e2:	3301      	movi      	r3, 1
}
 80136e4:	6c0f      	mov      	r0, r3
 80136e6:	1402      	addi      	r14, r14, 8
 80136e8:	ebc00058 	pop      	r4-r11, r15, r16-r17
    __HAL_UNLOCK(&pFlash);
 80136ec:	3300      	movi      	r3, 0
}
 80136ee:	6c0f      	mov      	r0, r3
    __HAL_UNLOCK(&pFlash);
 80136f0:	dc6d2000 	st.w      	r3, (r13, 0x0)
}
 80136f4:	1402      	addi      	r14, r14, 8
 80136f6:	ebc00058 	pop      	r4-r11, r15, r16-r17
 80136fa:	0000      	.short	0x0000
 80136fc:	2000330c 	.long	0x2000330c
 8013700:	20001d14 	.long	0x20001d14
 8013704:	80ff9002 	.long	0x80ff9002

08013708 <HAL_TIM_Base_Init>:
#include "wm_tim.h"

HAL_StatusTypeDef HAL_TIM_Base_Init(TIM_HandleTypeDef *htim)
{
 8013708:	14d1      	push      	r4, r15
 801370a:	1423      	subi      	r14, r14, 12
 801370c:	6d03      	mov      	r4, r0
	uint32_t offset = 0;
	wm_sys_clk sysclk;
	
	if (htim == NULL)
 801370e:	e900003a 	bez      	r0, 0x8013782	// 8013782 <HAL_TIM_Base_Init+0x7a>
	
	assert_param(IS_TIM_INSTANCE(htim->Instance));
	assert_param(IS_TIM_UNIT(htim->Init.unit));
	assert_param(IS_TIM_AUTORELOAD(htim->Init.AutoReload));
	
	if (htim->State == HAL_TIM_STATE_RESET)
 8013712:	9065      	ld.w      	r3, (r0, 0x14)
 8013714:	e9030033 	bez      	r3, 0x801377a	// 801377a <HAL_TIM_Base_Init+0x72>
	{
		htim->Lock = HAL_UNLOCKED;
		HAL_TIM_Base_MspInit(htim);
	}
	htim->State = HAL_TIM_STATE_BUSY;
 8013718:	3302      	movi      	r3, 2
 801371a:	b465      	st.w      	r3, (r4, 0x14)
	
	SystemClock_Get(&sysclk);
 801371c:	6c3b      	mov      	r0, r14
 801371e:	e3fffae5 	bsr      	0x8012ce8	// 8012ce8 <SystemClock_Get>
	WRITE_REG(TIM->TMR_CONFIG, sysclk.apbclk-1);
 8013722:	9860      	ld.w      	r3, (r14, 0x0)
 8013724:	ea8d0019 	lrw      	r13, 0x40011800	// 8013788 <HAL_TIM_Base_Init+0x80>
 8013728:	2b00      	subi      	r3, 1
 801372a:	dc6d2000 	st.w      	r3, (r13, 0x0)
	offset = htim->Instance - TIM0;
 801372e:	9440      	ld.w      	r2, (r4, 0x0)
	MODIFY_REG(TIM->CR, (TIM_CR_TIM_MODE(offset) | TIM_CR_TIM_UNIT(offset)), 
 8013730:	3005      	movi      	r0, 5
 8013732:	7c08      	mult      	r0, r2
 8013734:	e6400000 	addi      	r18, r0, 1
 8013738:	ea0c0001 	movi      	r12, 1
 801373c:	c64c4023 	lsl      	r3, r12, r18
 8013740:	c40c4033 	lsl      	r19, r12, r0
 8013744:	d82d2001 	ld.w      	r1, (r13, 0x4)
 8013748:	c6632423 	or      	r3, r3, r19
 801374c:	c4612043 	andn      	r3, r1, r3
 8013750:	9422      	ld.w      	r1, (r4, 0x8)
 8013752:	c6414021 	lsl      	r1, r1, r18
 8013756:	da442001 	ld.w      	r18, (r4, 0x4)
 801375a:	c4124020 	lsl      	r0, r18, r0
 801375e:	6c40      	or      	r1, r0
 8013760:	6cc4      	or      	r3, r1
 8013762:	dc6d2001 	st.w      	r3, (r13, 0x4)
				((htim->Init.AutoReload << TIM_CR_TIM_MODE_Pos(offset)) | (htim->Init.Unit << TIM_CR_TIM_UNIT_Pos(offset))));
					
	WRITE_REG(*(uint32_t *)(&(TIM->TIM0_PRD) + offset), htim->Init.Period);
 8013766:	4242      	lsli      	r2, r2, 2
 8013768:	1069      	lrw      	r3, 0x40011808	// 801378c <HAL_TIM_Base_Init+0x84>
 801376a:	608c      	addu      	r2, r3
	htim->State = HAL_TIM_STATE_READY;
	
	return HAL_OK;
 801376c:	3000      	movi      	r0, 0
	WRITE_REG(*(uint32_t *)(&(TIM->TIM0_PRD) + offset), htim->Init.Period);
 801376e:	9463      	ld.w      	r3, (r4, 0xc)
 8013770:	b260      	st.w      	r3, (r2, 0x0)
	htim->State = HAL_TIM_STATE_READY;
 8013772:	dd842005 	st.w      	r12, (r4, 0x14)
}
 8013776:	1403      	addi      	r14, r14, 12
 8013778:	1491      	pop      	r4, r15
		htim->Lock = HAL_UNLOCKED;
 801377a:	b064      	st.w      	r3, (r0, 0x10)
		HAL_TIM_Base_MspInit(htim);
 801377c:	e3fff532 	bsr      	0x80121e0	// 80121e0 <HAL_TIM_Base_MspInit>
 8013780:	07cc      	br      	0x8013718	// 8013718 <HAL_TIM_Base_Init+0x10>
		return HAL_ERROR;
 8013782:	3001      	movi      	r0, 1
}
 8013784:	1403      	addi      	r14, r14, 12
 8013786:	1491      	pop      	r4, r15
 8013788:	40011800 	.long	0x40011800
 801378c:	40011808 	.long	0x40011808

08013790 <HAL_TIM_Base_Start_IT>:

HAL_StatusTypeDef HAL_TIM_Base_Start_IT(TIM_HandleTypeDef *htim)
{
	assert_param(IS_TIM_INSTANCE(htim->Instance));
	
	if (htim->State != HAL_TIM_STATE_READY)
 8013790:	9065      	ld.w      	r3, (r0, 0x14)
 8013792:	3b41      	cmpnei      	r3, 1
 8013794:	0c03      	bf      	0x801379a	// 801379a <HAL_TIM_Base_Start_IT+0xa>
	{
		return HAL_ERROR;
 8013796:	3001      	movi      	r0, 1
	htim->State = HAL_TIM_STATE_BUSY;
	__HAL_TIM_ENABLE_IT(htim);
	__HAL_TIM_ENABLE(htim);
	
	return HAL_OK;
}
 8013798:	783c      	jmp      	r15
	htim->State = HAL_TIM_STATE_BUSY;
 801379a:	3202      	movi      	r2, 2
 801379c:	b045      	st.w      	r2, (r0, 0x14)
	__HAL_TIM_ENABLE_IT(htim);
 801379e:	3105      	movi      	r1, 5
 80137a0:	9040      	ld.w      	r2, (r0, 0x0)
 80137a2:	ea8c000b 	lrw      	r12, 0x40011800	// 80137cc <HAL_TIM_Base_Start_IT+0x3c>
 80137a6:	7c84      	mult      	r2, r1
 80137a8:	5a2a      	addi      	r1, r2, 3
 80137aa:	d9ac2001 	ld.w      	r13, (r12, 0x4)
 80137ae:	c4234021 	lsl      	r1, r3, r1
 80137b2:	6c74      	or      	r1, r13
 80137b4:	dc2c2001 	st.w      	r1, (r12, 0x4)
	__HAL_TIM_ENABLE(htim);
 80137b8:	2201      	addi      	r2, 2
 80137ba:	d82c2001 	ld.w      	r1, (r12, 0x4)
 80137be:	70c8      	lsl      	r3, r2
 80137c0:	6cc4      	or      	r3, r1
	return HAL_OK;
 80137c2:	3000      	movi      	r0, 0
	__HAL_TIM_ENABLE(htim);
 80137c4:	dc6c2001 	st.w      	r3, (r12, 0x4)
}
 80137c8:	783c      	jmp      	r15
 80137ca:	0000      	.short	0x0000
 80137cc:	40011800 	.long	0x40011800

080137d0 <HAL_TIM_IRQHandler>:
{
	UNUSED(htim);
}

void HAL_TIM_IRQHandler(TIM_HandleTypeDef *htim)
{
 80137d0:	14d0      	push      	r15
	if (__HAL_TIM_GET_FLAG(htim) != RESET)
 80137d2:	9060      	ld.w      	r3, (r0, 0x0)
 80137d4:	3205      	movi      	r2, 5
 80137d6:	7cc8      	mult      	r3, r2
 80137d8:	ea8c000b 	lrw      	r12, 0x40011800	// 8013804 <HAL_TIM_IRQHandler+0x34>
 80137dc:	3201      	movi      	r2, 1
 80137de:	2303      	addi      	r3, 4
 80137e0:	c4624023 	lsl      	r3, r2, r3
 80137e4:	d82c2001 	ld.w      	r1, (r12, 0x4)
 80137e8:	c4612022 	and      	r2, r1, r3
 80137ec:	648e      	cmpne      	r3, r2
 80137ee:	0c02      	bf      	0x80137f2	// 80137f2 <HAL_TIM_IRQHandler+0x22>
	{
		__HAL_TIM_CLEAR_IT(htim);
		HAL_TIM_Callback(htim);
	}
}
 80137f0:	1490      	pop      	r15
		__HAL_TIM_CLEAR_IT(htim);
 80137f2:	d84c2001 	ld.w      	r2, (r12, 0x4)
 80137f6:	6cc8      	or      	r3, r2
 80137f8:	dc6c2001 	st.w      	r3, (r12, 0x4)
		HAL_TIM_Callback(htim);
 80137fc:	e3fff462 	bsr      	0x80120c0	// 80120c0 <HAL_TIM_Callback>
}
 8013800:	1490      	pop      	r15
 8013802:	0000      	.short	0x0000
 8013804:	40011800 	.long	0x40011800

08013808 <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8013808:	106a      	lrw      	r3, 0xe000e100	// 8013830 <board_init+0x28>
 801380a:	ea210001 	movih      	r1, 1
 801380e:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8013812:	dc232060 	st.w      	r1, (r3, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 8013816:	1068      	lrw      	r3, 0x40010600	// 8013834 <board_init+0x2c>
 8013818:	ea21000b 	movih      	r1, 11
 801381c:	2113      	addi      	r1, 20
 801381e:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8013820:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 8013822:	31c3      	movi      	r1, 195
 8013824:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 8013826:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 8013828:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 801382a:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 801382c:	783c      	jmp      	r15
 801382e:	0000      	.short	0x0000
 8013830:	e000e100 	.long	0xe000e100
 8013834:	40010600 	.long	0x40010600

08013838 <SystemInit>:
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 8013838:	106a      	lrw      	r3, 0x20000000	// 8013860 <SystemInit+0x28>
 801383a:	c0036421 	mtcr      	r3, cr<1, 0>
    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 801383e:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 8013842:	ec630010 	ori      	r3, r3, 16
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8013846:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 801384a:	1047      	lrw      	r2, 0xe000e100	// 8013864 <SystemInit+0x2c>
 801384c:	3300      	movi      	r3, 0
 801384e:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 8013852:	2b00      	subi      	r3, 1
 8013854:	dc622060 	st.w      	r3, (r2, 0x180)
    __ASM volatile("psrset ee, ie");
 8013858:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 801385c:	783c      	jmp      	r15
 801385e:	0000      	.short	0x0000
 8013860:	20000000 	.long	0x20000000
 8013864:	e000e100 	.long	0xe000e100

08013868 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8013868:	14d4      	push      	r4-r7, r15
 801386a:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 801386c:	c0006021 	mfcr      	r1, cr<0, 0>
 8013870:	4930      	lsri      	r1, r1, 16
 8013872:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8013874:	1018      	lrw      	r0, 0x8015470	// 80138d4 <trap_c+0x6c>
 8013876:	e0000c35 	bsr      	0x80150e0	// 80150e0 <wm_printf>
    printf("\n");
 801387a:	300a      	movi      	r0, 10
 801387c:	e3fff130 	bsr      	0x8011adc	// 8011adc <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8013880:	9540      	ld.w      	r2, (r5, 0x0)
 8013882:	3100      	movi      	r1, 0
 8013884:	1015      	lrw      	r0, 0x8015484	// 80138d8 <trap_c+0x70>
 8013886:	e0000c2d 	bsr      	0x80150e0	// 80150e0 <wm_printf>
    for (i = 0; i < 16; i++) {
 801388a:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 801388c:	10f3      	lrw      	r7, 0x8015484	// 80138d8 <trap_c+0x70>

        if ((i % 5) == 4) {
 801388e:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8013890:	2400      	addi      	r4, 1
 8013892:	3c50      	cmpnei      	r4, 16
 8013894:	0c13      	bf      	0x80138ba	// 80138ba <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8013896:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 801389a:	6c53      	mov      	r1, r4
 801389c:	6c1f      	mov      	r0, r7
 801389e:	e0000c21 	bsr      	0x80150e0	// 80150e0 <wm_printf>
        if ((i % 5) == 4) {
 80138a2:	c4c48043 	divs      	r3, r4, r6
 80138a6:	7cd8      	mult      	r3, r6
 80138a8:	5c6d      	subu      	r3, r4, r3
 80138aa:	3b44      	cmpnei      	r3, 4
 80138ac:	0bf2      	bt      	0x8013890	// 8013890 <trap_c+0x28>
            printf("\n");
 80138ae:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 80138b0:	2400      	addi      	r4, 1
            printf("\n");
 80138b2:	e3fff115 	bsr      	0x8011adc	// 8011adc <__GI_putchar>
    for (i = 0; i < 16; i++) {
 80138b6:	3c50      	cmpnei      	r4, 16
 80138b8:	0bef      	bt      	0x8013896	// 8013896 <trap_c+0x2e>
        }
    }

    printf("\n");
 80138ba:	300a      	movi      	r0, 10
 80138bc:	e3fff110 	bsr      	0x8011adc	// 8011adc <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 80138c0:	9530      	ld.w      	r1, (r5, 0x40)
 80138c2:	1007      	lrw      	r0, 0x8015490	// 80138dc <trap_c+0x74>
 80138c4:	e0000c0e 	bsr      	0x80150e0	// 80150e0 <wm_printf>
    printf("epc : %8x\n", regs[17]);
 80138c8:	9531      	ld.w      	r1, (r5, 0x44)
 80138ca:	1006      	lrw      	r0, 0x801549c	// 80138e0 <trap_c+0x78>
 80138cc:	e0000c0a 	bsr      	0x80150e0	// 80150e0 <wm_printf>
 80138d0:	0400      	br      	0x80138d0	// 80138d0 <trap_c+0x68>
 80138d2:	0000      	.short	0x0000
 80138d4:	08015470 	.long	0x08015470
 80138d8:	08015484 	.long	0x08015484
 80138dc:	08015490 	.long	0x08015490
 80138e0:	0801549c 	.long	0x0801549c

080138e4 <_out_uart>:
#include "wm_regs.h"
#include "wm_hal.h"

int sendchar(int ch)
{
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 80138e4:	1044      	lrw      	r2, 0x40010600	// 80138f4 <_out_uart+0x10>
 80138e6:	9267      	ld.w      	r3, (r2, 0x1c)
 80138e8:	e463203f 	andi      	r3, r3, 63
 80138ec:	3b1f      	cmphsi      	r3, 32
 80138ee:	0bfc      	bt      	0x80138e6	// 80138e6 <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80138f0:	b208      	st.w      	r0, (r2, 0x20)
}

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 80138f2:	783c      	jmp      	r15
 80138f4:	40010600 	.long	0x40010600

080138f8 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 80138f8:	783c      	jmp      	r15
	...

080138fc <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 80138fc:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013900:	6e4f      	mov      	r9, r3
 8013902:	da0e200e 	ld.w      	r16, (r14, 0x38)
 8013906:	986b      	ld.w      	r3, (r14, 0x2c)
 8013908:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 801390c:	e4702003 	andi      	r3, r16, 3
{
 8013910:	6dc3      	mov      	r7, r0
 8013912:	6e07      	mov      	r8, r1
 8013914:	6e8b      	mov      	r10, r2
 8013916:	98ac      	ld.w      	r5, (r14, 0x30)
 8013918:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 801391c:	e9230010 	bnez      	r3, 0x801393c	// 801393c <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 8013920:	66d4      	cmphs      	r5, r11
 8013922:	080d      	bt      	0x801393c	// 801393c <_out_rev+0x40>
 8013924:	c4ab0086 	subu      	r6, r11, r5
 8013928:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 801392a:	5a82      	addi      	r4, r2, 1
 801392c:	6ce7      	mov      	r3, r9
 801392e:	6c63      	mov      	r1, r8
 8013930:	3020      	movi      	r0, 32
 8013932:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 8013934:	6592      	cmpne      	r4, r6
 8013936:	6c93      	mov      	r2, r4
 8013938:	0bf9      	bt      	0x801392a	// 801392a <_out_rev+0x2e>
 801393a:	0402      	br      	0x801393e	// 801393e <_out_rev+0x42>
 801393c:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 801393e:	e905002a 	bez      	r5, 0x8013992	// 8013992 <_out_rev+0x96>
 8013942:	5dc3      	subi      	r6, r5, 1
 8013944:	c4114823 	lsli      	r3, r17, 0
 8013948:	60d8      	addu      	r3, r6
 801394a:	6d8f      	mov      	r6, r3
 801394c:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 801394e:	e6240000 	addi      	r17, r4, 1
 8013952:	6c93      	mov      	r2, r4
 8013954:	8600      	ld.b      	r0, (r6, 0x0)
 8013956:	6ce7      	mov      	r3, r9
 8013958:	6c63      	mov      	r1, r8
 801395a:	c4114824 	lsli      	r4, r17, 0
 801395e:	7bdd      	jsr      	r7
  while (len) {
 8013960:	6552      	cmpne      	r4, r5
 8013962:	2e00      	subi      	r6, 1
 8013964:	0bf5      	bt      	0x801394e	// 801394e <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 8013966:	e6102002 	andi      	r16, r16, 2
 801396a:	e9100011 	bez      	r16, 0x801398c	// 801398c <_out_rev+0x90>
    while (idx - start_idx < width) {
 801396e:	c5450083 	subu      	r3, r5, r10
 8013972:	66cc      	cmphs      	r3, r11
 8013974:	080c      	bt      	0x801398c	// 801398c <_out_rev+0x90>
 8013976:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 8013978:	2500      	addi      	r5, 1
 801397a:	6ce7      	mov      	r3, r9
 801397c:	6c63      	mov      	r1, r8
 801397e:	3020      	movi      	r0, 32
 8013980:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 8013982:	c5450083 	subu      	r3, r5, r10
 8013986:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8013988:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 801398a:	0ff7      	bf      	0x8013978	// 8013978 <_out_rev+0x7c>
    }
  }

  return idx;
}
 801398c:	6c17      	mov      	r0, r5
 801398e:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 8013992:	6d53      	mov      	r5, r4
 8013994:	07e9      	br      	0x8013966	// 8013966 <_out_rev+0x6a>
	...

08013998 <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013998:	14d1      	push      	r4, r15
 801399a:	1424      	subi      	r14, r14, 16
 801399c:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 80139a0:	da8e200c 	ld.w      	r20, (r14, 0x30)
 80139a4:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 80139a8:	e5b42002 	andi      	r13, r20, 2
{
 80139ac:	dace2006 	ld.w      	r22, (r14, 0x18)
 80139b0:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 80139b4:	da6e200a 	ld.w      	r19, (r14, 0x28)
 80139b8:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 80139bc:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 80139c0:	e92d0039 	bnez      	r13, 0x8013a32	// 8013a32 <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80139c4:	e9320071 	bnez      	r18, 0x8013aa6	// 8013aa6 <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80139c8:	c66c0420 	cmphs      	r12, r19
 80139cc:	0833      	bt      	0x8013a32	// 8013a32 <_ntoa_format+0x9a>
 80139ce:	eb0c001f 	cmphsi      	r12, 32
 80139d2:	e7142001 	andi      	r24, r20, 1
 80139d6:	082e      	bt      	0x8013a32	// 8013a32 <_ntoa_format+0x9a>
 80139d8:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 80139dc:	ea150030 	movi      	r21, 48
 80139e0:	0406      	br      	0x80139ec	// 80139ec <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80139e2:	eb4c0020 	cmpnei      	r12, 32
 80139e6:	e5ad0000 	addi      	r13, r13, 1
 80139ea:	0c08      	bf      	0x80139fa	// 80139fa <_ntoa_format+0x62>
      buf[len++] = '0';
 80139ec:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80139f0:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 80139f4:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80139f8:	0ff5      	bf      	0x80139e2	// 80139e2 <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80139fa:	e918001c 	bez      	r24, 0x8013a32	// 8013a32 <_ntoa_format+0x9a>
 80139fe:	c64c0420 	cmphs      	r12, r18
 8013a02:	0818      	bt      	0x8013a32	// 8013a32 <_ntoa_format+0x9a>
 8013a04:	ea0d001f 	movi      	r13, 31
 8013a08:	6734      	cmphs      	r13, r12
 8013a0a:	0c62      	bf      	0x8013ace	// 8013ace <_ntoa_format+0x136>
 8013a0c:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8013a10:	ea150030 	movi      	r21, 48
 8013a14:	0406      	br      	0x8013a20	// 8013a20 <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013a16:	eb4c0020 	cmpnei      	r12, 32
 8013a1a:	e5ad0000 	addi      	r13, r13, 1
 8013a1e:	0c58      	bf      	0x8013ace	// 8013ace <_ntoa_format+0x136>
      buf[len++] = '0';
 8013a20:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013a24:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 8013a28:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013a2c:	0bf5      	bt      	0x8013a16	// 8013a16 <_ntoa_format+0x7e>
      buf[len++] = '0';
 8013a2e:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 8013a32:	e5b42010 	andi      	r13, r20, 16
 8013a36:	e90d0019 	bez      	r13, 0x8013a68	// 8013a68 <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8013a3a:	e5b42400 	andi      	r13, r20, 1024
 8013a3e:	e92d0004 	bnez      	r13, 0x8013a46	// 8013a46 <_ntoa_format+0xae>
 8013a42:	e92c004e 	bnez      	r12, 0x8013ade	// 8013ade <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013a46:	c4194824 	lsli      	r4, r25, 0
 8013a4a:	3c50      	cmpnei      	r4, 16
 8013a4c:	0c74      	bf      	0x8013b34	// 8013b34 <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013a4e:	c4194824 	lsli      	r4, r25, 0
 8013a52:	3c42      	cmpnei      	r4, 2
 8013a54:	0c7e      	bf      	0x8013b50	// 8013b50 <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8013a56:	eb0c001f 	cmphsi      	r12, 32
 8013a5a:	081a      	bt      	0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
      buf[len++] = '0';
 8013a5c:	ea0d0030 	movi      	r13, 48
 8013a60:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013a64:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8013a68:	eb0c001f 	cmphsi      	r12, 32
 8013a6c:	0811      	bt      	0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
    if (negative) {
 8013a6e:	e9370048 	bnez      	r23, 0x8013afe	// 8013afe <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 8013a72:	e5b42004 	andi      	r13, r20, 4
 8013a76:	e92d0056 	bnez      	r13, 0x8013b22	// 8013b22 <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 8013a7a:	e5b42008 	andi      	r13, r20, 8
 8013a7e:	e90d0008 	bez      	r13, 0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
      buf[len++] = ' ';
 8013a82:	ea0d0020 	movi      	r13, 32
 8013a86:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013a8a:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013a8e:	de8e2003 	st.w      	r20, (r14, 0xc)
 8013a92:	de4e2002 	st.w      	r18, (r14, 0x8)
 8013a96:	dd8e2001 	st.w      	r12, (r14, 0x4)
 8013a9a:	dece2000 	st.w      	r22, (r14, 0x0)
 8013a9e:	e3ffff2f 	bsr      	0x80138fc	// 80138fc <_out_rev>
}
 8013aa2:	1404      	addi      	r14, r14, 16
 8013aa4:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8013aa6:	e7142001 	andi      	r24, r20, 1
 8013aaa:	e9180031 	bez      	r24, 0x8013b0c	// 8013b0c <_ntoa_format+0x174>
 8013aae:	e9370037 	bnez      	r23, 0x8013b1c	// 8013b1c <_ntoa_format+0x184>
 8013ab2:	e5b4200c 	andi      	r13, r20, 12
 8013ab6:	e92d0033 	bnez      	r13, 0x8013b1c	// 8013b1c <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013aba:	c66c0420 	cmphs      	r12, r19
 8013abe:	0ba0      	bt      	0x80139fe	// 80139fe <_ntoa_format+0x66>
 8013ac0:	ea0d001f 	movi      	r13, 31
 8013ac4:	6734      	cmphs      	r13, r12
 8013ac6:	0b89      	bt      	0x80139d8	// 80139d8 <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013ac8:	c64c0420 	cmphs      	r12, r18
 8013acc:	0bb3      	bt      	0x8013a32	// 8013a32 <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 8013ace:	e5b42010 	andi      	r13, r20, 16
 8013ad2:	e90dffde 	bez      	r13, 0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8013ad6:	e5b42400 	andi      	r13, r20, 1024
 8013ada:	e92dffb6 	bnez      	r13, 0x8013a46	// 8013a46 <_ntoa_format+0xae>
 8013ade:	c5930480 	cmpne      	r19, r12
 8013ae2:	0c04      	bf      	0x8013aea	// 8013aea <_ntoa_format+0x152>
 8013ae4:	c64c0480 	cmpne      	r12, r18
 8013ae8:	0baf      	bt      	0x8013a46	// 8013a46 <_ntoa_format+0xae>
      len--;
 8013aea:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 8013aee:	e90d0046 	bez      	r13, 0x8013b7a	// 8013b7a <_ntoa_format+0x1e2>
 8013af2:	c4194824 	lsli      	r4, r25, 0
 8013af6:	3c50      	cmpnei      	r4, 16
 8013af8:	0c1c      	bf      	0x8013b30	// 8013b30 <_ntoa_format+0x198>
 8013afa:	6f37      	mov      	r12, r13
 8013afc:	07a9      	br      	0x8013a4e	// 8013a4e <_ntoa_format+0xb6>
      buf[len++] = '-';
 8013afe:	ea0d002d 	movi      	r13, 45
 8013b02:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013b06:	e58c0000 	addi      	r12, r12, 1
 8013b0a:	07c2      	br      	0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b0c:	c66c0420 	cmphs      	r12, r19
 8013b10:	0b91      	bt      	0x8013a32	// 8013a32 <_ntoa_format+0x9a>
 8013b12:	ea0d001f 	movi      	r13, 31
 8013b16:	6734      	cmphs      	r13, r12
 8013b18:	0b60      	bt      	0x80139d8	// 80139d8 <_ntoa_format+0x40>
 8013b1a:	078c      	br      	0x8013a32	// 8013a32 <_ntoa_format+0x9a>
      width--;
 8013b1c:	e6521000 	subi      	r18, r18, 1
 8013b20:	07cd      	br      	0x8013aba	// 8013aba <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8013b22:	ea0d002b 	movi      	r13, 43
 8013b26:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013b2a:	e58c0000 	addi      	r12, r12, 1
 8013b2e:	07b0      	br      	0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
        len--;
 8013b30:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b34:	e5b42020 	andi      	r13, r20, 32
 8013b38:	e92d0016 	bnez      	r13, 0x8013b64	// 8013b64 <_ntoa_format+0x1cc>
 8013b3c:	eb0c001f 	cmphsi      	r12, 32
 8013b40:	0ba7      	bt      	0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
      buf[len++] = 'x';
 8013b42:	ea0d0078 	movi      	r13, 120
 8013b46:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013b4a:	e58c0000 	addi      	r12, r12, 1
 8013b4e:	0784      	br      	0x8013a56	// 8013a56 <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b50:	eb0c001f 	cmphsi      	r12, 32
 8013b54:	0b9d      	bt      	0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
      buf[len++] = 'b';
 8013b56:	ea0d0062 	movi      	r13, 98
 8013b5a:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013b5e:	e58c0000 	addi      	r12, r12, 1
 8013b62:	077a      	br      	0x8013a56	// 8013a56 <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b64:	ea0d001f 	movi      	r13, 31
 8013b68:	6734      	cmphs      	r13, r12
 8013b6a:	0f92      	bf      	0x8013a8e	// 8013a8e <_ntoa_format+0xf6>
      buf[len++] = 'X';
 8013b6c:	ea0d0058 	movi      	r13, 88
 8013b70:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013b74:	e58c0000 	addi      	r12, r12, 1
 8013b78:	076f      	br      	0x8013a56	// 8013a56 <_ntoa_format+0xbe>
 8013b7a:	6f37      	mov      	r12, r13
 8013b7c:	0765      	br      	0x8013a46	// 8013a46 <_ntoa_format+0xae>
	...

08013b80 <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013b80:	14d3      	push      	r4-r6, r15
 8013b82:	142f      	subi      	r14, r14, 60
 8013b84:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 8013b88:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 8013b8c:	6d77      	mov      	r5, r13
 8013b8e:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 8013b92:	da8e2015 	ld.w      	r20, (r14, 0x54)
 8013b96:	6db7      	mov      	r6, r13
 8013b98:	db0e2018 	ld.w      	r24, (r14, 0x60)
 8013b9c:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8013ba0:	e92c000a 	bnez      	r12, 0x8013bb4	// 8013bb4 <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 8013ba4:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8013ba8:	e7182400 	andi      	r24, r24, 1024
 8013bac:	e9380043 	bnez      	r24, 0x8013c32	// 8013c32 <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 8013bb0:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013bb4:	e5b82020 	andi      	r13, r24, 32
 8013bb8:	eb4d0000 	cmpnei      	r13, 0
 8013bbc:	ea170041 	movi      	r23, 65
 8013bc0:	ea0d0061 	movi      	r13, 97
 8013bc4:	c6ed0c20 	incf      	r23, r13, 0
 8013bc8:	e72e001b 	addi      	r25, r14, 28
 8013bcc:	c4194832 	lsli      	r18, r25, 0
 8013bd0:	ea150000 	movi      	r21, 0
 8013bd4:	e6f71009 	subi      	r23, r23, 10
 8013bd8:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 8013bdc:	c68c802d 	divu      	r13, r12, r20
 8013be0:	c68d8436 	mult      	r22, r13, r20
 8013be4:	c6cc008c 	subu      	r12, r12, r22
 8013be8:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013bea:	eb0c0009 	cmphsi      	r12, 10
 8013bee:	e6b50000 	addi      	r21, r21, 1
 8013bf2:	081c      	bt      	0x8013c2a	// 8013c2a <_ntoa_long+0xaa>
 8013bf4:	e58c002f 	addi      	r12, r12, 48
 8013bf8:	7730      	zextb      	r12, r12
 8013bfa:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 8013bfe:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013c00:	e90d0006 	bez      	r13, 0x8013c0c	// 8013c0c <_ntoa_long+0x8c>
 8013c04:	e6520000 	addi      	r18, r18, 1
 8013c08:	e833ffea 	bnezad      	r19, 0x8013bdc	// 8013bdc <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8013c0c:	df0e2006 	st.w      	r24, (r14, 0x18)
 8013c10:	b8c5      	st.w      	r6, (r14, 0x14)
 8013c12:	b8a4      	st.w      	r5, (r14, 0x10)
 8013c14:	de8e2003 	st.w      	r20, (r14, 0xc)
 8013c18:	b882      	st.w      	r4, (r14, 0x8)
 8013c1a:	deae2001 	st.w      	r21, (r14, 0x4)
 8013c1e:	df2e2000 	st.w      	r25, (r14, 0x0)
 8013c22:	e3fffebb 	bsr      	0x8013998	// 8013998 <_ntoa_format>
}
 8013c26:	140f      	addi      	r14, r14, 60
 8013c28:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013c2a:	c6ec002c 	addu      	r12, r12, r23
 8013c2e:	7730      	zextb      	r12, r12
 8013c30:	07e5      	br      	0x8013bfa	// 8013bfa <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 8013c32:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 8013c36:	c40c4835 	lsli      	r21, r12, 0
 8013c3a:	e72e001b 	addi      	r25, r14, 28
 8013c3e:	07e7      	br      	0x8013c0c	// 8013c0c <_ntoa_long+0x8c>

08013c40 <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013c40:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013c44:	1435      	subi      	r14, r14, 84
 8013c46:	c4034831 	lsli      	r17, r3, 0
 8013c4a:	d96e2020 	ld.w      	r11, (r14, 0x80)
 8013c4e:	9965      	ld.w      	r3, (r14, 0x94)
 8013c50:	da0e2021 	ld.w      	r16, (r14, 0x84)
 8013c54:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8013c56:	c60b2424 	or      	r4, r11, r16
{
 8013c5a:	9966      	ld.w      	r3, (r14, 0x98)
 8013c5c:	b86c      	st.w      	r3, (r14, 0x30)
 8013c5e:	d86e0088 	ld.b      	r3, (r14, 0x88)
 8013c62:	b807      	st.w      	r0, (r14, 0x1c)
 8013c64:	b828      	st.w      	r1, (r14, 0x20)
 8013c66:	b849      	st.w      	r2, (r14, 0x24)
 8013c68:	99c3      	ld.w      	r6, (r14, 0x8c)
 8013c6a:	99e4      	ld.w      	r7, (r14, 0x90)
 8013c6c:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 8013c70:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 8013c72:	e9240009 	bnez      	r4, 0x8013c84	// 8013c84 <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8013c76:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 8013c7a:	c48a2823 	bclri      	r3, r10, 4
 8013c7e:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 8013c80:	e9220033 	bnez      	r2, 0x8013ce6	// 8013ce6 <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013c84:	e46a2020 	andi      	r3, r10, 32
 8013c88:	3b40      	cmpnei      	r3, 0
 8013c8a:	ea080041 	movi      	r8, 65
 8013c8e:	3361      	movi      	r3, 97
 8013c90:	c5030c20 	incf      	r8, r3, 0
 8013c94:	e52e0033 	addi      	r9, r14, 52
 8013c98:	6d67      	mov      	r5, r9
 8013c9a:	3400      	movi      	r4, 0
 8013c9c:	e5081009 	subi      	r8, r8, 10
 8013ca0:	0415      	br      	0x8013cca	// 8013cca <_ntoa_long_long+0x8a>
 8013ca2:	202f      	addi      	r0, 48
 8013ca4:	7400      	zextb      	r0, r0
 8013ca6:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 8013ca8:	c4104821 	lsli      	r1, r16, 0
 8013cac:	6c2f      	mov      	r0, r11
 8013cae:	6c9b      	mov      	r2, r6
 8013cb0:	6cdf      	mov      	r3, r7
 8013cb2:	e3ffe501 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8013cb6:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013cba:	6c40      	or      	r1, r0
      value /= base;
 8013cbc:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013cbe:	e9010016 	bez      	r1, 0x8013cea	// 8013cea <_ntoa_long_long+0xaa>
 8013cc2:	eb440020 	cmpnei      	r4, 32
 8013cc6:	2500      	addi      	r5, 1
 8013cc8:	0c11      	bf      	0x8013cea	// 8013cea <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 8013cca:	6c9b      	mov      	r2, r6
 8013ccc:	6cdf      	mov      	r3, r7
 8013cce:	6c2f      	mov      	r0, r11
 8013cd0:	c4104821 	lsli      	r1, r16, 0
 8013cd4:	e3ffe68a 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 8013cd8:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013cda:	3809      	cmphsi      	r0, 10
 8013cdc:	2400      	addi      	r4, 1
 8013cde:	0fe2      	bf      	0x8013ca2	// 8013ca2 <_ntoa_long_long+0x62>
 8013ce0:	6020      	addu      	r0, r8
 8013ce2:	7400      	zextb      	r0, r0
 8013ce4:	07e1      	br      	0x8013ca6	// 8013ca6 <_ntoa_long_long+0x66>
 8013ce6:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8013cea:	986c      	ld.w      	r3, (r14, 0x30)
 8013cec:	b865      	st.w      	r3, (r14, 0x14)
 8013cee:	986b      	ld.w      	r3, (r14, 0x2c)
 8013cf0:	b864      	st.w      	r3, (r14, 0x10)
 8013cf2:	986a      	ld.w      	r3, (r14, 0x28)
 8013cf4:	b862      	st.w      	r3, (r14, 0x8)
 8013cf6:	dd4e2006 	st.w      	r10, (r14, 0x18)
 8013cfa:	b8c3      	st.w      	r6, (r14, 0xc)
 8013cfc:	b881      	st.w      	r4, (r14, 0x4)
 8013cfe:	dd2e2000 	st.w      	r9, (r14, 0x0)
 8013d02:	c4114823 	lsli      	r3, r17, 0
 8013d06:	9849      	ld.w      	r2, (r14, 0x24)
 8013d08:	9828      	ld.w      	r1, (r14, 0x20)
 8013d0a:	9807      	ld.w      	r0, (r14, 0x1c)
 8013d0c:	e3fffe46 	bsr      	0x8013998	// 8013998 <_ntoa_format>
}
 8013d10:	1415      	addi      	r14, r14, 84
 8013d12:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

08013d18 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013d18:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013d1c:	1435      	subi      	r14, r14, 84
 8013d1e:	6ecf      	mov      	r11, r3
 8013d20:	9962      	ld.w      	r3, (r14, 0x88)
 8013d22:	6e4f      	mov      	r9, r3
 8013d24:	9963      	ld.w      	r3, (r14, 0x8c)
 8013d26:	9980      	ld.w      	r4, (r14, 0x80)
 8013d28:	99a1      	ld.w      	r5, (r14, 0x84)
 8013d2a:	b865      	st.w      	r3, (r14, 0x14)
 8013d2c:	9964      	ld.w      	r3, (r14, 0x90)
 8013d2e:	6d83      	mov      	r6, r0
 8013d30:	6dc7      	mov      	r7, r1
 8013d32:	6e8b      	mov      	r10, r2
 8013d34:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 8013d36:	6c93      	mov      	r2, r4
 8013d38:	6cd7      	mov      	r3, r5
 8013d3a:	6c13      	mov      	r0, r4
 8013d3c:	6c57      	mov      	r1, r5
 8013d3e:	e3ffeb21 	bsr      	0x8011380	// 8011380 <__nedf2>
 8013d42:	e920010c 	bnez      	r0, 0x8013f5a	// 8013f5a <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 8013d46:	3200      	movi      	r2, 0
 8013d48:	ea23fff0 	movih      	r3, 65520
 8013d4c:	2a00      	subi      	r2, 1
 8013d4e:	2b00      	subi      	r3, 1
 8013d50:	6c13      	mov      	r0, r4
 8013d52:	9921      	ld.w      	r1, (r14, 0x84)
 8013d54:	e3ffeb72 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8013d58:	e980011b 	blz      	r0, 0x8013f8e	// 8013f8e <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 8013d5c:	3200      	movi      	r2, 0
 8013d5e:	ea237ff0 	movih      	r3, 32752
 8013d62:	2a00      	subi      	r2, 1
 8013d64:	2b00      	subi      	r3, 1
 8013d66:	6c13      	mov      	r0, r4
 8013d68:	9921      	ld.w      	r1, (r14, 0x84)
 8013d6a:	e3ffeb27 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8013d6e:	e960001d 	blsz      	r0, 0x8013da8	// 8013da8 <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8013d72:	9806      	ld.w      	r0, (r14, 0x18)
 8013d74:	e4402004 	andi      	r2, r0, 4
 8013d78:	3a40      	cmpnei      	r2, 0
 8013d7a:	0137      	lrw      	r1, 0x80156d0	// 8014098 <_ftoa+0x380>
 8013d7c:	0177      	lrw      	r3, 0x80156c8	// 801409c <_ftoa+0x384>
 8013d7e:	c4610c20 	incf      	r3, r1, 0
 8013d82:	3a40      	cmpnei      	r2, 0
 8013d84:	3103      	movi      	r1, 3
 8013d86:	3204      	movi      	r2, 4
 8013d88:	c4410c20 	incf      	r2, r1, 0
 8013d8c:	9825      	ld.w      	r1, (r14, 0x14)
 8013d8e:	b803      	st.w      	r0, (r14, 0xc)
 8013d90:	b822      	st.w      	r1, (r14, 0x8)
 8013d92:	b841      	st.w      	r2, (r14, 0x4)
 8013d94:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013d96:	6cef      	mov      	r3, r11
 8013d98:	6cab      	mov      	r2, r10
 8013d9a:	6c5f      	mov      	r1, r7
 8013d9c:	6c1b      	mov      	r0, r6
 8013d9e:	e3fffdaf 	bsr      	0x80138fc	// 80138fc <_out_rev>
}
 8013da2:	1415      	addi      	r14, r14, 84
 8013da4:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8013da8:	3200      	movi      	r2, 0
 8013daa:	0261      	lrw      	r3, 0x41cdcd65	// 80140a0 <_ftoa+0x388>
 8013dac:	6c13      	mov      	r0, r4
 8013dae:	9921      	ld.w      	r1, (r14, 0x84)
 8013db0:	e3ffeb04 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8013db4:	e94000dc 	bhz      	r0, 0x8013f6c	// 8013f6c <_ftoa+0x254>
 8013db8:	3200      	movi      	r2, 0
 8013dba:	0264      	lrw      	r3, 0xc1cdcd65	// 80140a4 <_ftoa+0x38c>
 8013dbc:	6c13      	mov      	r0, r4
 8013dbe:	9921      	ld.w      	r1, (r14, 0x84)
 8013dc0:	e3ffeb3c 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8013dc4:	e98000d4 	blz      	r0, 0x8013f6c	// 8013f6c <_ftoa+0x254>
  if (value < 0) {
 8013dc8:	3200      	movi      	r2, 0
 8013dca:	6ccb      	mov      	r3, r2
 8013dcc:	6c13      	mov      	r0, r4
 8013dce:	9921      	ld.w      	r1, (r14, 0x84)
 8013dd0:	e3ffeb34 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8013dd4:	e98001b0 	blz      	r0, 0x8014134	// 8014134 <_ftoa+0x41c>
  bool negative = false;
 8013dd8:	3300      	movi      	r3, 0
 8013dda:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 8013ddc:	9866      	ld.w      	r3, (r14, 0x18)
 8013dde:	e5a32400 	andi      	r13, r3, 1024
 8013de2:	e92d0136 	bnez      	r13, 0x801404e	// 801404e <_ftoa+0x336>
 8013de6:	026e      	lrw      	r3, 0x412e8480	// 80140a8 <_ftoa+0x390>
 8013de8:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8013dec:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8013dee:	ea080006 	movi      	r8, 6
 8013df2:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 8013df6:	6c57      	mov      	r1, r5
 8013df8:	6c13      	mov      	r0, r4
 8013dfa:	de8e200b 	st.w      	r20, (r14, 0x2c)
 8013dfe:	ddae200a 	st.w      	r13, (r14, 0x28)
 8013e02:	e3ffeb6b 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 8013e06:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 8013e08:	e3ffeb34 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8013e0c:	6c83      	mov      	r2, r0
 8013e0e:	6cc7      	mov      	r3, r1
 8013e10:	6c13      	mov      	r0, r4
 8013e12:	6c57      	mov      	r1, r5
 8013e14:	e3ffe90c 	bsr      	0x801102c	// 801102c <__subdf3>
 8013e18:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013e1c:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8013e20:	6cb3      	mov      	r2, r12
 8013e22:	9868      	ld.w      	r3, (r14, 0x20)
 8013e24:	e3ffe922 	bsr      	0x8011068	// 8011068 <__muldf3>
 8013e28:	c4014831 	lsli      	r17, r1, 0
 8013e2c:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 8013e30:	e3ffe426 	bsr      	0x801067c	// 801067c <__fixunsdfsi>
 8013e34:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 8013e36:	e3ffebbb 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 8013e3a:	6c83      	mov      	r2, r0
 8013e3c:	6cc7      	mov      	r3, r1
 8013e3e:	c4104820 	lsli      	r0, r16, 0
 8013e42:	c4114821 	lsli      	r1, r17, 0
 8013e46:	e3ffe8f3 	bsr      	0x801102c	// 801102c <__subdf3>
  if (diff > 0.5) {
 8013e4a:	3200      	movi      	r2, 0
 8013e4c:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 8013e50:	c4004830 	lsli      	r16, r0, 0
 8013e54:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 8013e58:	e3ffeab0 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8013e5c:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8013e60:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 8013e64:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 8013e68:	e96000d3 	blsz      	r0, 0x801400e	// 801400e <_ftoa+0x2f6>
    ++frac;
 8013e6c:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 8013e70:	c4124820 	lsli      	r0, r18, 0
 8013e74:	de8e2009 	st.w      	r20, (r14, 0x24)
 8013e78:	c40d4831 	lsli      	r17, r13, 0
 8013e7c:	c4124830 	lsli      	r16, r18, 0
 8013e80:	e3ffeb96 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 8013e84:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013e88:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8013e8c:	6cf7      	mov      	r3, r13
 8013e8e:	6cb3      	mov      	r2, r12
 8013e90:	e3ffeab4 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 8013e94:	c4104832 	lsli      	r18, r16, 0
 8013e98:	c411482d 	lsli      	r13, r17, 0
 8013e9c:	da8e2009 	ld.w      	r20, (r14, 0x24)
 8013ea0:	e9a0011f 	bhsz      	r0, 0x80140de	// 80140de <_ftoa+0x3c6>
  if (prec == 0U) {
 8013ea4:	e928007e 	bnez      	r8, 0x8013fa0	// 8013fa0 <_ftoa+0x288>
    diff = value - (double)whole;
 8013ea8:	6c27      	mov      	r0, r9
 8013eaa:	c4144831 	lsli      	r17, r20, 0
 8013eae:	c40d4830 	lsli      	r16, r13, 0
 8013eb2:	e3ffeadf 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8013eb6:	6c83      	mov      	r2, r0
 8013eb8:	6cc7      	mov      	r3, r1
 8013eba:	6c13      	mov      	r0, r4
 8013ebc:	6c57      	mov      	r1, r5
 8013ebe:	e3ffe8b7 	bsr      	0x801102c	// 801102c <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8013ec2:	6ca3      	mov      	r2, r8
 8013ec4:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 8013ec8:	6d03      	mov      	r4, r0
 8013eca:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8013ecc:	e3ffeab6 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8013ed0:	c410482d 	lsli      	r13, r16, 0
 8013ed4:	c4114834 	lsli      	r20, r17, 0
 8013ed8:	e98000f5 	blz      	r0, 0x80140c2	// 80140c2 <_ftoa+0x3aa>
 8013edc:	e4692001 	andi      	r3, r9, 1
      ++whole;
 8013ee0:	3b40      	cmpnei      	r3, 0
 8013ee2:	c4690c20 	incf      	r3, r9, 0
 8013ee6:	c4690c41 	inct      	r3, r9, 1
 8013eea:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013eec:	eb4d0020 	cmpnei      	r13, 32
 8013ef0:	0c81      	bf      	0x8013ff2	// 8013ff2 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 8013ef2:	300a      	movi      	r0, 10
 8013ef4:	c4098043 	divs      	r3, r9, r0
 8013ef8:	6d27      	mov      	r4, r9
 8013efa:	c4038421 	mult      	r1, r3, r0
 8013efe:	5c25      	subu      	r1, r4, r1
 8013f00:	212f      	addi      	r1, 48
 8013f02:	e44d0000 	addi      	r2, r13, 1
 8013f06:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 8013f0a:	e9030013 	bez      	r3, 0x8013f30	// 8013f30 <_ftoa+0x218>
 8013f0e:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013f12:	eb420020 	cmpnei      	r2, 32
 8013f16:	0c6e      	bf      	0x8013ff2	// 8013ff2 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 8013f18:	c4038041 	divs      	r1, r3, r0
 8013f1c:	c401842d 	mult      	r13, r1, r0
 8013f20:	60f6      	subu      	r3, r13
 8013f22:	232f      	addi      	r3, 48
 8013f24:	d40c8003 	stbi.b      	r3, (r12)
 8013f28:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 8013f2a:	6cc7      	mov      	r3, r1
 8013f2c:	e921fff3 	bnez      	r1, 0x8013f12	// 8013f12 <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8013f30:	9866      	ld.w      	r3, (r14, 0x18)
 8013f32:	e4632003 	andi      	r3, r3, 3
 8013f36:	3b41      	cmpnei      	r3, 1
 8013f38:	0cda      	bf      	0x80140ec	// 80140ec <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013f3a:	eb420020 	cmpnei      	r2, 32
 8013f3e:	0d27      	bf      	0x801418c	// 801418c <_ftoa+0x474>
    if (negative) {
 8013f40:	986c      	ld.w      	r3, (r14, 0x30)
 8013f42:	e92300bb 	bnez      	r3, 0x80140b8	// 80140b8 <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 8013f46:	9866      	ld.w      	r3, (r14, 0x18)
 8013f48:	e4632004 	andi      	r3, r3, 4
 8013f4c:	e9030116 	bez      	r3, 0x8014178	// 8014178 <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8013f50:	312b      	movi      	r1, 43
 8013f52:	5a62      	addi      	r3, r2, 1
 8013f54:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8013f58:	0453      	br      	0x8013ffe	// 8013ffe <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 8013f5a:	9866      	ld.w      	r3, (r14, 0x18)
 8013f5c:	b863      	st.w      	r3, (r14, 0xc)
 8013f5e:	9865      	ld.w      	r3, (r14, 0x14)
 8013f60:	b862      	st.w      	r3, (r14, 0x8)
 8013f62:	3303      	movi      	r3, 3
 8013f64:	b861      	st.w      	r3, (r14, 0x4)
 8013f66:	1272      	lrw      	r3, 0x80156d4	// 80140ac <_ftoa+0x394>
 8013f68:	b860      	st.w      	r3, (r14, 0x0)
 8013f6a:	0716      	br      	0x8013d96	// 8013d96 <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8013f6c:	9866      	ld.w      	r3, (r14, 0x18)
 8013f6e:	b864      	st.w      	r3, (r14, 0x10)
 8013f70:	9865      	ld.w      	r3, (r14, 0x14)
 8013f72:	b863      	st.w      	r3, (r14, 0xc)
 8013f74:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8013f78:	b880      	st.w      	r4, (r14, 0x0)
 8013f7a:	b8a1      	st.w      	r5, (r14, 0x4)
 8013f7c:	6cef      	mov      	r3, r11
 8013f7e:	6cab      	mov      	r2, r10
 8013f80:	6c5f      	mov      	r1, r7
 8013f82:	6c1b      	mov      	r0, r6
 8013f84:	e0000116 	bsr      	0x80141b0	// 80141b0 <_etoa>
}
 8013f88:	1415      	addi      	r14, r14, 84
 8013f8a:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 8013f8e:	9866      	ld.w      	r3, (r14, 0x18)
 8013f90:	b863      	st.w      	r3, (r14, 0xc)
 8013f92:	9865      	ld.w      	r3, (r14, 0x14)
 8013f94:	b862      	st.w      	r3, (r14, 0x8)
 8013f96:	3304      	movi      	r3, 4
 8013f98:	b861      	st.w      	r3, (r14, 0x4)
 8013f9a:	1266      	lrw      	r3, 0x80156d8	// 80140b0 <_ftoa+0x398>
 8013f9c:	b860      	st.w      	r3, (r14, 0x0)
 8013f9e:	06fc      	br      	0x8013d96	// 8013d96 <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013fa0:	eb4d0020 	cmpnei      	r13, 32
 8013fa4:	0c27      	bf      	0x8013ff2	// 8013ff2 <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 8013fa6:	300a      	movi      	r0, 10
 8013fa8:	c4128023 	divu      	r3, r18, r0
 8013fac:	c4038421 	mult      	r1, r3, r0
 8013fb0:	c4320092 	subu      	r18, r18, r1
 8013fb4:	e652002f 	addi      	r18, r18, 48
      --count;
 8013fb8:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8013fbc:	e44d0000 	addi      	r2, r13, 1
 8013fc0:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 8013fc4:	e90300c3 	bez      	r3, 0x801414a	// 801414a <_ftoa+0x432>
 8013fc8:	c454002d 	addu      	r13, r20, r2
 8013fcc:	0410      	br      	0x8013fec	// 8013fec <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 8013fce:	c4038021 	divu      	r1, r3, r0
 8013fd2:	c4018432 	mult      	r18, r1, r0
 8013fd6:	c6430083 	subu      	r3, r3, r18
 8013fda:	232f      	addi      	r3, 48
 8013fdc:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 8013fe0:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8013fe4:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 8013fe6:	6cc7      	mov      	r3, r1
 8013fe8:	e90100b1 	bez      	r1, 0x801414a	// 801414a <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013fec:	eb420020 	cmpnei      	r2, 32
 8013ff0:	0bef      	bt      	0x8013fce	// 8013fce <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8013ff2:	9866      	ld.w      	r3, (r14, 0x18)
 8013ff4:	e4632003 	andi      	r3, r3, 3
 8013ff8:	3b41      	cmpnei      	r3, 1
 8013ffa:	0c78      	bf      	0x80140ea	// 80140ea <_ftoa+0x3d2>
 8013ffc:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013ffe:	9846      	ld.w      	r2, (r14, 0x18)
 8014000:	b843      	st.w      	r2, (r14, 0xc)
 8014002:	9845      	ld.w      	r2, (r14, 0x14)
 8014004:	b842      	st.w      	r2, (r14, 0x8)
 8014006:	b861      	st.w      	r3, (r14, 0x4)
 8014008:	de8e2000 	st.w      	r20, (r14, 0x0)
 801400c:	06c5      	br      	0x8013d96	// 8013d96 <_ftoa+0x7e>
  else if (diff < 0.5) {
 801400e:	3200      	movi      	r2, 0
 8014010:	ea233fe0 	movih      	r3, 16352
 8014014:	c4104820 	lsli      	r0, r16, 0
 8014018:	c4114821 	lsli      	r1, r17, 0
 801401c:	de8e200a 	st.w      	r20, (r14, 0x28)
 8014020:	de4e2009 	st.w      	r18, (r14, 0x24)
 8014024:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8014028:	e3ffea08 	bsr      	0x8011438	// 8011438 <__ltdf2>
 801402c:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 8014030:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8014034:	da8e200a 	ld.w      	r20, (r14, 0x28)
 8014038:	e980ff36 	blz      	r0, 0x8013ea4	// 8013ea4 <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 801403c:	e9120006 	bez      	r18, 0x8014048	// 8014048 <_ftoa+0x330>
 8014040:	e4722001 	andi      	r3, r18, 1
 8014044:	e903ff30 	bez      	r3, 0x8013ea4	// 8013ea4 <_ftoa+0x18c>
    ++frac;
 8014048:	e6520000 	addi      	r18, r18, 1
 801404c:	072c      	br      	0x8013ea4	// 8013ea4 <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801404e:	6ce7      	mov      	r3, r9
 8014050:	3b09      	cmphsi      	r3, 10
 8014052:	0c9f      	bf      	0x8014190	// 8014190 <_ftoa+0x478>
    buf[len++] = '0';
 8014054:	e68e0033 	addi      	r20, r14, 52
 8014058:	3030      	movi      	r0, 48
 801405a:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 801405e:	e5091000 	subi      	r8, r9, 1
 8014062:	e44e0034 	addi      	r2, r14, 53
 8014066:	e4291008 	subi      	r1, r9, 9
 801406a:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 801406e:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8014070:	6476      	cmpne      	r13, r1
 8014072:	0c09      	bf      	0x8014084	// 8014084 <_ftoa+0x36c>
    buf[len++] = '0';
 8014074:	e5ad0000 	addi      	r13, r13, 1
 8014078:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 801407c:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8014080:	e823fff8 	bnezad      	r3, 0x8014070	// 8014070 <_ftoa+0x358>
 8014084:	104c      	lrw      	r2, 0x80156e0	// 80140b4 <_ftoa+0x39c>
 8014086:	c4684823 	lsli      	r3, r8, 3
 801408a:	60c8      	addu      	r3, r2
 801408c:	9340      	ld.w      	r2, (r3, 0x0)
 801408e:	9361      	ld.w      	r3, (r3, 0x4)
 8014090:	b847      	st.w      	r2, (r14, 0x1c)
 8014092:	b868      	st.w      	r3, (r14, 0x20)
 8014094:	06b1      	br      	0x8013df6	// 8013df6 <_ftoa+0xde>
 8014096:	0000      	.short	0x0000
 8014098:	080156d0 	.long	0x080156d0
 801409c:	080156c8 	.long	0x080156c8
 80140a0:	41cdcd65 	.long	0x41cdcd65
 80140a4:	c1cdcd65 	.long	0xc1cdcd65
 80140a8:	412e8480 	.long	0x412e8480
 80140ac:	080156d4 	.long	0x080156d4
 80140b0:	080156d8 	.long	0x080156d8
 80140b4:	080156e0 	.long	0x080156e0
      buf[len++] = '-';
 80140b8:	312d      	movi      	r1, 45
 80140ba:	5a62      	addi      	r3, r2, 1
 80140bc:	d4540021 	str.b      	r1, (r20, r2 << 0)
 80140c0:	079f      	br      	0x8013ffe	// 8013ffe <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 80140c2:	6ca3      	mov      	r2, r8
 80140c4:	ea233fe0 	movih      	r3, 16352
 80140c8:	6c13      	mov      	r0, r4
 80140ca:	6c57      	mov      	r1, r5
 80140cc:	e3ffe976 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 80140d0:	c410482d 	lsli      	r13, r16, 0
 80140d4:	c4114834 	lsli      	r20, r17, 0
 80140d8:	e960ff0a 	blsz      	r0, 0x8013eec	// 8013eec <_ftoa+0x1d4>
 80140dc:	0700      	br      	0x8013edc	// 8013edc <_ftoa+0x1c4>
      ++whole;
 80140de:	6ce7      	mov      	r3, r9
 80140e0:	2300      	addi      	r3, 1
 80140e2:	6e4f      	mov      	r9, r3
      frac = 0;
 80140e4:	ea120000 	movi      	r18, 0
 80140e8:	06de      	br      	0x8013ea4	// 8013ea4 <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80140ea:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80140ec:	9865      	ld.w      	r3, (r14, 0x14)
 80140ee:	e903ff26 	bez      	r3, 0x8013f3a	// 8013f3a <_ftoa+0x222>
 80140f2:	986c      	ld.w      	r3, (r14, 0x30)
 80140f4:	e9230007 	bnez      	r3, 0x8014102	// 8014102 <_ftoa+0x3ea>
 80140f8:	9866      	ld.w      	r3, (r14, 0x18)
 80140fa:	e463200c 	andi      	r3, r3, 12
 80140fe:	e9030005 	bez      	r3, 0x8014108	// 8014108 <_ftoa+0x3f0>
      width--;
 8014102:	9865      	ld.w      	r3, (r14, 0x14)
 8014104:	2b00      	subi      	r3, 1
 8014106:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8014108:	9865      	ld.w      	r3, (r14, 0x14)
 801410a:	64c8      	cmphs      	r2, r3
 801410c:	0b17      	bt      	0x8013f3a	// 8013f3a <_ftoa+0x222>
 801410e:	eb420020 	cmpnei      	r2, 32
 8014112:	0c3d      	bf      	0x801418c	// 801418c <_ftoa+0x474>
 8014114:	c4540021 	addu      	r1, r20, r2
 8014118:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 801411a:	3230      	movi      	r2, 48
 801411c:	0405      	br      	0x8014126	// 8014126 <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801411e:	eb430020 	cmpnei      	r3, 32
 8014122:	2100      	addi      	r1, 1
 8014124:	0f6d      	bf      	0x8013ffe	// 8013ffe <_ftoa+0x2e6>
      buf[len++] = '0';
 8014126:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8014128:	9805      	ld.w      	r0, (r14, 0x14)
 801412a:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 801412c:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801412e:	0bf8      	bt      	0x801411e	// 801411e <_ftoa+0x406>
      buf[len++] = '0';
 8014130:	9845      	ld.w      	r2, (r14, 0x14)
 8014132:	0704      	br      	0x8013f3a	// 8013f3a <_ftoa+0x222>
    value = 0 - value;
 8014134:	6c93      	mov      	r2, r4
 8014136:	9961      	ld.w      	r3, (r14, 0x84)
 8014138:	3000      	movi      	r0, 0
 801413a:	3100      	movi      	r1, 0
 801413c:	e3ffe778 	bsr      	0x801102c	// 801102c <__subdf3>
    negative = true;
 8014140:	3301      	movi      	r3, 1
    value = 0 - value;
 8014142:	6d03      	mov      	r4, r0
 8014144:	6d47      	mov      	r5, r1
    negative = true;
 8014146:	b86c      	st.w      	r3, (r14, 0x30)
 8014148:	064a      	br      	0x8013ddc	// 8013ddc <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801414a:	eb420020 	cmpnei      	r2, 32
 801414e:	0f52      	bf      	0x8013ff2	// 8013ff2 <_ftoa+0x2da>
 8014150:	e90c000e 	bez      	r12, 0x801416c	// 801416c <_ftoa+0x454>
 8014154:	c4540023 	addu      	r3, r20, r2
 8014158:	6308      	addu      	r12, r2
      buf[len++] = '0';
 801415a:	3130      	movi      	r1, 48
 801415c:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801415e:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 8014162:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8014164:	0f47      	bf      	0x8013ff2	// 8013ff2 <_ftoa+0x2da>
 8014166:	670a      	cmpne      	r2, r12
 8014168:	2300      	addi      	r3, 1
 801416a:	0bf9      	bt      	0x801415c	// 801415c <_ftoa+0x444>
      buf[len++] = '.';
 801416c:	332e      	movi      	r3, 46
 801416e:	e5a20000 	addi      	r13, r2, 1
 8014172:	d4540023 	str.b      	r3, (r20, r2 << 0)
 8014176:	06bb      	br      	0x8013eec	// 8013eec <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 8014178:	9866      	ld.w      	r3, (r14, 0x18)
 801417a:	e4632008 	andi      	r3, r3, 8
 801417e:	e9030007 	bez      	r3, 0x801418c	// 801418c <_ftoa+0x474>
      buf[len++] = ' ';
 8014182:	3120      	movi      	r1, 32
 8014184:	5a62      	addi      	r3, r2, 1
 8014186:	d4540021 	str.b      	r1, (r20, r2 << 0)
 801418a:	073a      	br      	0x8013ffe	// 8013ffe <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 801418c:	6ccb      	mov      	r3, r2
 801418e:	0738      	br      	0x8013ffe	// 8013ffe <_ftoa+0x2e6>
 8014190:	1047      	lrw      	r2, 0x80156e0	// 80141ac <_ftoa+0x494>
 8014192:	4363      	lsli      	r3, r3, 3
 8014194:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8014196:	6e27      	mov      	r8, r9
 8014198:	9340      	ld.w      	r2, (r3, 0x0)
 801419a:	9361      	ld.w      	r3, (r3, 0x4)
 801419c:	b847      	st.w      	r2, (r14, 0x1c)
 801419e:	b868      	st.w      	r3, (r14, 0x20)
 80141a0:	ea0d0000 	movi      	r13, 0
 80141a4:	e68e0033 	addi      	r20, r14, 52
 80141a8:	0627      	br      	0x8013df6	// 8013df6 <_ftoa+0xde>
 80141aa:	0000      	.short	0x0000
 80141ac:	080156e0 	.long	0x080156e0

080141b0 <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 80141b0:	ebe00058 	push      	r4-r11, r15, r16-r17
 80141b4:	1434      	subi      	r14, r14, 80
 80141b6:	6e0f      	mov      	r8, r3
 80141b8:	9961      	ld.w      	r3, (r14, 0x84)
 80141ba:	b867      	st.w      	r3, (r14, 0x1c)
 80141bc:	9962      	ld.w      	r3, (r14, 0x88)
 80141be:	98bf      	ld.w      	r5, (r14, 0x7c)
 80141c0:	9980      	ld.w      	r4, (r14, 0x80)
 80141c2:	b868      	st.w      	r3, (r14, 0x20)
 80141c4:	9963      	ld.w      	r3, (r14, 0x8c)
 80141c6:	b866      	st.w      	r3, (r14, 0x18)
 80141c8:	6d83      	mov      	r6, r0
 80141ca:	6dc7      	mov      	r7, r1
 80141cc:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 80141ce:	6cd3      	mov      	r3, r4
 80141d0:	6c97      	mov      	r2, r5
 80141d2:	6c17      	mov      	r0, r5
 80141d4:	6c53      	mov      	r1, r4
 80141d6:	e3ffe8d5 	bsr      	0x8011380	// 8011380 <__nedf2>
 80141da:	6e43      	mov      	r9, r0
 80141dc:	e92001d7 	bnez      	r0, 0x801458a	// 801458a <_etoa+0x3da>
 80141e0:	3200      	movi      	r2, 0
 80141e2:	ea237ff0 	movih      	r3, 32752
 80141e6:	2a00      	subi      	r2, 1
 80141e8:	2b00      	subi      	r3, 1
 80141ea:	6c17      	mov      	r0, r5
 80141ec:	6c53      	mov      	r1, r4
 80141ee:	e3ffe8e5 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 80141f2:	e94001cc 	bhz      	r0, 0x801458a	// 801458a <_etoa+0x3da>
 80141f6:	3200      	movi      	r2, 0
 80141f8:	ea23fff0 	movih      	r3, 65520
 80141fc:	2a00      	subi      	r2, 1
 80141fe:	2b00      	subi      	r3, 1
 8014200:	6c17      	mov      	r0, r5
 8014202:	6c53      	mov      	r1, r4
 8014204:	e3ffe91a 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8014208:	e98001c1 	blz      	r0, 0x801458a	// 801458a <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 801420c:	6ca7      	mov      	r2, r9
 801420e:	6ce7      	mov      	r3, r9
 8014210:	6c17      	mov      	r0, r5
 8014212:	6c53      	mov      	r1, r4
 8014214:	e3ffe912 	bsr      	0x8011438	// 8011438 <__ltdf2>
    value = -value;
 8014218:	6e97      	mov      	r10, r5
  if (negative) {
 801421a:	e9800208 	blz      	r0, 0x801462a	// 801462a <_etoa+0x47a>
 801421e:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 8014220:	9866      	ld.w      	r3, (r14, 0x18)
 8014222:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014226:	3b40      	cmpnei      	r3, 0
 8014228:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 801422a:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 801422c:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014230:	3306      	movi      	r3, 6
 8014232:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014236:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801423a:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 801423c:	dd4e200a 	st.w      	r10, (r14, 0x28)
 8014240:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014244:	e3ffe916 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8014248:	0145      	lrw      	r2, 0x509f79fb	// 80145b0 <_etoa+0x400>
 801424a:	0164      	lrw      	r3, 0x3fd34413	// 80145b4 <_etoa+0x404>
 801424c:	e3ffe70e 	bsr      	0x8011068	// 8011068 <__muldf3>
 8014250:	0145      	lrw      	r2, 0x8b60c8b3	// 80145b8 <_etoa+0x408>
 8014252:	0164      	lrw      	r3, 0x3fc68a28	// 80145bc <_etoa+0x40c>
 8014254:	e3ffe6d4 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8014258:	d98e200a 	ld.w      	r12, (r14, 0x28)
 801425c:	da6e2009 	ld.w      	r19, (r14, 0x24)
 8014260:	c40c4836 	lsli      	r22, r12, 0
 8014264:	c4135677 	zext      	r23, r19, 19, 0
 8014268:	ea140000 	movi      	r20, 0
 801426c:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014270:	c4004831 	lsli      	r17, r0, 0
 8014274:	c4014830 	lsli      	r16, r1, 0
 8014278:	3200      	movi      	r2, 0
 801427a:	c6962420 	or      	r0, r22, r20
 801427e:	c6b72421 	or      	r1, r23, r21
 8014282:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8014286:	dd8e2012 	st.w      	r12, (r14, 0x48)
 801428a:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801428e:	de8e200f 	st.w      	r20, (r14, 0x3c)
 8014292:	deae2010 	st.w      	r21, (r14, 0x40)
 8014296:	e3ffe6cb 	bsr      	0x801102c	// 801102c <__subdf3>
 801429a:	0155      	lrw      	r2, 0x636f4361	// 80145c0 <_etoa+0x410>
 801429c:	0175      	lrw      	r3, 0x3fd287a7	// 80145c4 <_etoa+0x414>
 801429e:	e3ffe6e5 	bsr      	0x8011068	// 8011068 <__muldf3>
 80142a2:	6c83      	mov      	r2, r0
 80142a4:	6cc7      	mov      	r3, r1
 80142a6:	c4114820 	lsli      	r0, r17, 0
 80142aa:	c4104821 	lsli      	r1, r16, 0
 80142ae:	e3ffe6a7 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 80142b2:	e3ffe913 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 80142b6:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 80142b8:	e3ffe8dc 	bsr      	0x8011470	// 8011470 <__floatsidf>
 80142bc:	015c      	lrw      	r2, 0x979a371	// 80145c8 <_etoa+0x418>
 80142be:	017b      	lrw      	r3, 0x400a934f	// 80145cc <_etoa+0x41c>
 80142c0:	c4004831 	lsli      	r17, r0, 0
 80142c4:	c4014830 	lsli      	r16, r1, 0
 80142c8:	e3ffe6d0 	bsr      	0x8011068	// 8011068 <__muldf3>
 80142cc:	3200      	movi      	r2, 0
 80142ce:	ea233fe0 	movih      	r3, 16352
 80142d2:	e3ffe695 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 80142d6:	e3ffe901 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 80142da:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 80142dc:	0242      	lrw      	r2, 0xbbb55516	// 80145d0 <_etoa+0x420>
 80142de:	0261      	lrw      	r3, 0x40026bb1	// 80145d4 <_etoa+0x424>
 80142e0:	c4114820 	lsli      	r0, r17, 0
 80142e4:	c4104821 	lsli      	r1, r16, 0
 80142e8:	e3ffe6c0 	bsr      	0x8011068	// 8011068 <__muldf3>
 80142ec:	c4004831 	lsli      	r17, r0, 0
 80142f0:	980a      	ld.w      	r0, (r14, 0x28)
 80142f2:	c4014830 	lsli      	r16, r1, 0
 80142f6:	e3ffe8bd 	bsr      	0x8011470	// 8011470 <__floatsidf>
 80142fa:	0247      	lrw      	r2, 0xfefa39ef	// 80145d8 <_etoa+0x428>
 80142fc:	0267      	lrw      	r3, 0x3fe62e42	// 80145dc <_etoa+0x42c>
 80142fe:	e3ffe6b5 	bsr      	0x8011068	// 8011068 <__muldf3>
 8014302:	6c83      	mov      	r2, r0
 8014304:	6cc7      	mov      	r3, r1
 8014306:	c4114820 	lsli      	r0, r17, 0
 801430a:	c4104821 	lsli      	r1, r16, 0
 801430e:	e3ffe68f 	bsr      	0x801102c	// 801102c <__subdf3>
  const double z2 = z * z;
 8014312:	6c83      	mov      	r2, r0
 8014314:	6cc7      	mov      	r3, r1
 8014316:	b80c      	st.w      	r0, (r14, 0x30)
 8014318:	b82b      	st.w      	r1, (r14, 0x2c)
 801431a:	e3ffe6a7 	bsr      	0x8011068	// 8011068 <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 801431e:	da4e200c 	ld.w      	r18, (r14, 0x30)
 8014322:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8014326:	c4124822 	lsli      	r2, r18, 0
 801432a:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 801432c:	c4004831 	lsli      	r17, r0, 0
 8014330:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8014334:	c4124820 	lsli      	r0, r18, 0
 8014338:	6c77      	mov      	r1, r13
 801433a:	de4e200e 	st.w      	r18, (r14, 0x38)
 801433e:	ddae200d 	st.w      	r13, (r14, 0x34)
 8014342:	e3ffe65d 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 8014346:	b80c      	st.w      	r0, (r14, 0x30)
 8014348:	b82b      	st.w      	r1, (r14, 0x2c)
 801434a:	3200      	movi      	r2, 0
 801434c:	ea23402c 	movih      	r3, 16428
 8014350:	c4114820 	lsli      	r0, r17, 0
 8014354:	c4104821 	lsli      	r1, r16, 0
 8014358:	e3ffe788 	bsr      	0x8011268	// 8011268 <__divdf3>
 801435c:	3200      	movi      	r2, 0
 801435e:	ea234024 	movih      	r3, 16420
 8014362:	e3ffe64d 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 8014366:	6c83      	mov      	r2, r0
 8014368:	6cc7      	mov      	r3, r1
 801436a:	c4114820 	lsli      	r0, r17, 0
 801436e:	c4104821 	lsli      	r1, r16, 0
 8014372:	e3ffe77b 	bsr      	0x8011268	// 8011268 <__divdf3>
 8014376:	3200      	movi      	r2, 0
 8014378:	ea234018 	movih      	r3, 16408
 801437c:	e3ffe640 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 8014380:	6c83      	mov      	r2, r0
 8014382:	6cc7      	mov      	r3, r1
 8014384:	c4114820 	lsli      	r0, r17, 0
 8014388:	c4104821 	lsli      	r1, r16, 0
 801438c:	e3ffe76e 	bsr      	0x8011268	// 8011268 <__divdf3>
 8014390:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8014394:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8014398:	c4124822 	lsli      	r2, r18, 0
 801439c:	6cf7      	mov      	r3, r13
 801439e:	c4004831 	lsli      	r17, r0, 0
 80143a2:	c4014830 	lsli      	r16, r1, 0
 80143a6:	3000      	movi      	r0, 0
 80143a8:	ea214000 	movih      	r1, 16384
 80143ac:	e3ffe640 	bsr      	0x801102c	// 801102c <__subdf3>
 80143b0:	6c83      	mov      	r2, r0
 80143b2:	6cc7      	mov      	r3, r1
 80143b4:	c4114820 	lsli      	r0, r17, 0
 80143b8:	c4104821 	lsli      	r1, r16, 0
 80143bc:	e3ffe620 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 80143c0:	daee200c 	ld.w      	r23, (r14, 0x30)
 80143c4:	dace200b 	ld.w      	r22, (r14, 0x2c)
 80143c8:	6c83      	mov      	r2, r0
 80143ca:	6cc7      	mov      	r3, r1
 80143cc:	c4174820 	lsli      	r0, r23, 0
 80143d0:	c4164821 	lsli      	r1, r22, 0
 80143d4:	e3ffe74a 	bsr      	0x8011268	// 8011268 <__divdf3>
 80143d8:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 80143dc:	daae2010 	ld.w      	r21, (r14, 0x40)
 80143e0:	c4144822 	lsli      	r2, r20, 0
 80143e4:	c4154823 	lsli      	r3, r21, 0
 80143e8:	e3ffe60a 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 80143ec:	984a      	ld.w      	r2, (r14, 0x28)
 80143ee:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 80143f2:	4374      	lsli      	r3, r3, 20
 80143f4:	3200      	movi      	r2, 0
 80143f6:	e3ffe639 	bsr      	0x8011068	// 8011068 <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 80143fa:	d98e2012 	ld.w      	r12, (r14, 0x48)
 80143fe:	da6e2011 	ld.w      	r19, (r14, 0x44)
 8014402:	6c83      	mov      	r2, r0
 8014404:	c4004830 	lsli      	r16, r0, 0
 8014408:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 801440a:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 801440e:	6c33      	mov      	r0, r12
 8014410:	c4134821 	lsli      	r1, r19, 0
 8014414:	e3ffe812 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8014418:	c4104832 	lsli      	r18, r16, 0
 801441c:	e9a00012 	bhsz      	r0, 0x8014440	// 8014440 <_etoa+0x290>
    expval--;
 8014420:	9869      	ld.w      	r3, (r14, 0x24)
 8014422:	2b00      	subi      	r3, 1
 8014424:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 8014426:	c4114821 	lsli      	r1, r17, 0
 801442a:	3200      	movi      	r2, 0
 801442c:	ea234024 	movih      	r3, 16420
 8014430:	c4104820 	lsli      	r0, r16, 0
 8014434:	e3ffe71a 	bsr      	0x8011268	// 8011268 <__divdf3>
 8014438:	c4004832 	lsli      	r18, r0, 0
 801443c:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8014440:	9849      	ld.w      	r2, (r14, 0x24)
 8014442:	e4620062 	addi      	r3, r2, 99
 8014446:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 801444a:	9866      	ld.w      	r3, (r14, 0x18)
 801444c:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8014450:	c4000510 	mvc      	r16
 8014454:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8014458:	e9030027 	bez      	r3, 0x80144a6	// 80144a6 <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 801445c:	1341      	lrw      	r2, 0xeb1c432d	// 80145e0 <_etoa+0x430>
 801445e:	1362      	lrw      	r3, 0x3f1a36e2	// 80145e4 <_etoa+0x434>
 8014460:	6c2b      	mov      	r0, r10
 8014462:	6c67      	mov      	r1, r9
 8014464:	de4e200a 	st.w      	r18, (r14, 0x28)
 8014468:	e3ffe7c8 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 801446c:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8014470:	e98000cd 	blz      	r0, 0x801460a	// 801460a <_etoa+0x45a>
 8014474:	3200      	movi      	r2, 0
 8014476:	127d      	lrw      	r3, 0x412e8480	// 80145e8 <_etoa+0x438>
 8014478:	6c2b      	mov      	r0, r10
 801447a:	6c67      	mov      	r1, r9
 801447c:	e3ffe7de 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8014480:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8014484:	e9a000c3 	bhsz      	r0, 0x801460a	// 801460a <_etoa+0x45a>
      if ((int)prec > expval) {
 8014488:	9849      	ld.w      	r2, (r14, 0x24)
 801448a:	9867      	ld.w      	r3, (r14, 0x1c)
 801448c:	64c9      	cmplt      	r2, r3
 801448e:	0cd4      	bf      	0x8014636	// 8014636 <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 8014490:	60ca      	subu      	r3, r2
 8014492:	2b00      	subi      	r3, 1
 8014494:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8014496:	9866      	ld.w      	r3, (r14, 0x18)
 8014498:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 801449c:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 80144a0:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 80144a2:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 80144a6:	9848      	ld.w      	r2, (r14, 0x20)
 80144a8:	c602008c 	subu      	r12, r2, r16
 80144ac:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 80144b0:	9846      	ld.w      	r2, (r14, 0x18)
 80144b2:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 80144b6:	3300      	movi      	r3, 0
 80144b8:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 80144bc:	b84a      	st.w      	r2, (r14, 0x28)
 80144be:	e9020006 	bez      	r2, 0x80144ca	// 80144ca <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 80144c2:	eb500000 	cmpnei      	r16, 0
 80144c6:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 80144ca:	9869      	ld.w      	r3, (r14, 0x24)
 80144cc:	e9230090 	bnez      	r3, 0x80145ec	// 80145ec <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 80144d0:	3200      	movi      	r2, 0
 80144d2:	6ccb      	mov      	r3, r2
 80144d4:	6c17      	mov      	r0, r5
 80144d6:	6c53      	mov      	r1, r4
 80144d8:	c40c4831 	lsli      	r17, r12, 0
 80144dc:	e3ffe7ae 	bsr      	0x8011438	// 8011438 <__ltdf2>
 80144e0:	c411482c 	lsli      	r12, r17, 0
 80144e4:	e980009e 	blz      	r0, 0x8014620	// 8014620 <_etoa+0x470>
 80144e8:	da2e2006 	ld.w      	r17, (r14, 0x18)
 80144ec:	98a7      	ld.w      	r5, (r14, 0x1c)
 80144ee:	c5712823 	bclri      	r3, r17, 11
 80144f2:	b864      	st.w      	r3, (r14, 0x10)
 80144f4:	dd2e2001 	st.w      	r9, (r14, 0x4)
 80144f8:	dd8e2003 	st.w      	r12, (r14, 0xc)
 80144fc:	b8a2      	st.w      	r5, (r14, 0x8)
 80144fe:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8014502:	6ce3      	mov      	r3, r8
 8014504:	6caf      	mov      	r2, r11
 8014506:	6c5f      	mov      	r1, r7
 8014508:	6c1b      	mov      	r0, r6
 801450a:	e3fffc07 	bsr      	0x8013d18	// 8013d18 <_ftoa>
 801450e:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 8014510:	6e57      	mov      	r9, r5
 8014512:	e925004b 	bnez      	r5, 0x80145a8	// 80145a8 <_etoa+0x3f8>
 8014516:	e9100049 	bez      	r16, 0x80145a8	// 80145a8 <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 801451a:	e4712020 	andi      	r3, r17, 32
 801451e:	3b40      	cmpnei      	r3, 0
 8014520:	6c83      	mov      	r2, r0
 8014522:	ea0c0065 	movi      	r12, 101
 8014526:	58a2      	addi      	r5, r0, 1
 8014528:	3045      	movi      	r0, 69
 801452a:	c40c0c20 	incf      	r0, r12, 0
 801452e:	6ce3      	mov      	r3, r8
 8014530:	6c5f      	mov      	r1, r7
 8014532:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8014534:	3305      	movi      	r3, 5
 8014536:	9849      	ld.w      	r2, (r14, 0x24)
 8014538:	b865      	st.w      	r3, (r14, 0x14)
 801453a:	330a      	movi      	r3, 10
 801453c:	b862      	st.w      	r3, (r14, 0x8)
 801453e:	4a7f      	lsri      	r3, r2, 31
 8014540:	b861      	st.w      	r3, (r14, 0x4)
 8014542:	e6101000 	subi      	r16, r16, 1
 8014546:	c4020203 	abs      	r3, r2
 801454a:	b860      	st.w      	r3, (r14, 0x0)
 801454c:	de0e2004 	st.w      	r16, (r14, 0x10)
 8014550:	6ce3      	mov      	r3, r8
 8014552:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8014556:	6c97      	mov      	r2, r5
 8014558:	6c5f      	mov      	r1, r7
 801455a:	6c1b      	mov      	r0, r6
 801455c:	e3fffb12 	bsr      	0x8013b80	// 8013b80 <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 8014560:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8014562:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 8014564:	e9030022 	bez      	r3, 0x80145a8	// 80145a8 <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 8014568:	c5600083 	subu      	r3, r0, r11
 801456c:	98a8      	ld.w      	r5, (r14, 0x20)
 801456e:	654c      	cmphs      	r3, r5
 8014570:	081c      	bt      	0x80145a8	// 80145a8 <_etoa+0x3f8>
 8014572:	6c83      	mov      	r2, r0
 8014574:	2400      	addi      	r4, 1
 8014576:	6ce3      	mov      	r3, r8
 8014578:	6c5f      	mov      	r1, r7
 801457a:	3020      	movi      	r0, 32
 801457c:	7bd9      	jsr      	r6
 801457e:	c5640083 	subu      	r3, r4, r11
 8014582:	654c      	cmphs      	r3, r5
 8014584:	6c93      	mov      	r2, r4
 8014586:	0ff7      	bf      	0x8014574	// 8014574 <_etoa+0x3c4>
 8014588:	0410      	br      	0x80145a8	// 80145a8 <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 801458a:	9866      	ld.w      	r3, (r14, 0x18)
 801458c:	b864      	st.w      	r3, (r14, 0x10)
 801458e:	9868      	ld.w      	r3, (r14, 0x20)
 8014590:	b863      	st.w      	r3, (r14, 0xc)
 8014592:	9867      	ld.w      	r3, (r14, 0x1c)
 8014594:	b862      	st.w      	r3, (r14, 0x8)
 8014596:	b881      	st.w      	r4, (r14, 0x4)
 8014598:	b8a0      	st.w      	r5, (r14, 0x0)
 801459a:	6ce3      	mov      	r3, r8
 801459c:	6caf      	mov      	r2, r11
 801459e:	6c5f      	mov      	r1, r7
 80145a0:	6c1b      	mov      	r0, r6
 80145a2:	e3fffbbb 	bsr      	0x8013d18	// 8013d18 <_ftoa>
 80145a6:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 80145a8:	6c13      	mov      	r0, r4
 80145aa:	1414      	addi      	r14, r14, 80
 80145ac:	ebc00058 	pop      	r4-r11, r15, r16-r17
 80145b0:	509f79fb 	.long	0x509f79fb
 80145b4:	3fd34413 	.long	0x3fd34413
 80145b8:	8b60c8b3 	.long	0x8b60c8b3
 80145bc:	3fc68a28 	.long	0x3fc68a28
 80145c0:	636f4361 	.long	0x636f4361
 80145c4:	3fd287a7 	.long	0x3fd287a7
 80145c8:	0979a371 	.long	0x0979a371
 80145cc:	400a934f 	.long	0x400a934f
 80145d0:	bbb55516 	.long	0xbbb55516
 80145d4:	40026bb1 	.long	0x40026bb1
 80145d8:	fefa39ef 	.long	0xfefa39ef
 80145dc:	3fe62e42 	.long	0x3fe62e42
 80145e0:	eb1c432d 	.long	0xeb1c432d
 80145e4:	3f1a36e2 	.long	0x3f1a36e2
 80145e8:	412e8480 	.long	0x412e8480
    value /= conv.F;
 80145ec:	6c2b      	mov      	r0, r10
 80145ee:	6c67      	mov      	r1, r9
 80145f0:	c4124822 	lsli      	r2, r18, 0
 80145f4:	c4114823 	lsli      	r3, r17, 0
 80145f8:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 80145fc:	e3ffe636 	bsr      	0x8011268	// 8011268 <__divdf3>
 8014600:	6e83      	mov      	r10, r0
 8014602:	6e47      	mov      	r9, r1
 8014604:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 8014608:	0764      	br      	0x80144d0	// 80144d0 <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 801460a:	9847      	ld.w      	r2, (r14, 0x1c)
 801460c:	e902ff4d 	bez      	r2, 0x80144a6	// 80144a6 <_etoa+0x2f6>
        --prec;
 8014610:	9873      	ld.w      	r3, (r14, 0x4c)
 8014612:	3b40      	cmpnei      	r3, 0
 8014614:	c4620c20 	incf      	r3, r2, 0
 8014618:	c4620d01 	dect      	r3, r2, 1
 801461c:	b867      	st.w      	r3, (r14, 0x1c)
 801461e:	0744      	br      	0x80144a6	// 80144a6 <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8014620:	ea238000 	movih      	r3, 32768
 8014624:	60e4      	addu      	r3, r9
 8014626:	6e4f      	mov      	r9, r3
 8014628:	0760      	br      	0x80144e8	// 80144e8 <_etoa+0x338>
    value = -value;
 801462a:	ea238000 	movih      	r3, 32768
 801462e:	c4640029 	addu      	r9, r4, r3
 8014632:	e800fdf7 	br      	0x8014220	// 8014220 <_etoa+0x70>
      if ((int)prec > expval) {
 8014636:	3300      	movi      	r3, 0
 8014638:	072e      	br      	0x8014494	// 8014494 <_etoa+0x2e4>
	...

0801463c <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 801463c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014640:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 8014642:	3940      	cmpnei      	r1, 0
 8014644:	10cf      	lrw      	r6, 0x80138f8	// 8014680 <_vsnprintf+0x44>
{
 8014646:	6e07      	mov      	r8, r1
 8014648:	6dcb      	mov      	r7, r2
 801464a:	6d4f      	mov      	r5, r3
 801464c:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 801464e:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 8014652:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 8014656:	ea89000c 	lrw      	r9, 0x80154a8	// 8014684 <_vsnprintf+0x48>
  while (*format)
 801465a:	8500      	ld.b      	r0, (r5, 0x0)
 801465c:	e900006f 	bez      	r0, 0x801473a	// 801473a <_vsnprintf+0xfe>
    if (*format != '%') {
 8014660:	eb400025 	cmpnei      	r0, 37
 8014664:	0860      	bt      	0x8014724	// 8014724 <_vsnprintf+0xe8>
      format++;
 8014666:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 8014668:	3100      	movi      	r1, 0
      switch (*format) {
 801466a:	8200      	ld.b      	r0, (r2, 0x0)
 801466c:	e460101f 	subi      	r3, r0, 32
 8014670:	74cc      	zextb      	r3, r3
 8014672:	3b10      	cmphsi      	r3, 17
 8014674:	6d4b      	mov      	r5, r2
 8014676:	081d      	bt      	0x80146b0	// 80146b0 <_vsnprintf+0x74>
 8014678:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 801467c:	780c      	jmp      	r3
 801467e:	0000      	.short	0x0000
 8014680:	080138f8 	.long	0x080138f8
 8014684:	080154a8 	.long	0x080154a8
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 8014688:	ec210001 	ori      	r1, r1, 1
 801468c:	2200      	addi      	r2, 1
 801468e:	07ee      	br      	0x801466a	// 801466a <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 8014690:	ec210008 	ori      	r1, r1, 8
 8014694:	2200      	addi      	r2, 1
 8014696:	07ea      	br      	0x801466a	// 801466a <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 8014698:	ec210010 	ori      	r1, r1, 16
 801469c:	2200      	addi      	r2, 1
 801469e:	07e6      	br      	0x801466a	// 801466a <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 80146a0:	ec210004 	ori      	r1, r1, 4
 80146a4:	2200      	addi      	r2, 1
 80146a6:	07e2      	br      	0x801466a	// 801466a <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 80146a8:	ec210002 	ori      	r1, r1, 2
 80146ac:	2200      	addi      	r2, 1
 80146ae:	07de      	br      	0x801466a	// 801466a <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 80146b0:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 80146b4:	74cc      	zextb      	r3, r3
 80146b6:	3b09      	cmphsi      	r3, 10
 80146b8:	0c5b      	bf      	0x801476e	// 801476e <_vsnprintf+0x132>
    else if (*format == '*') {
 80146ba:	eb40002a 	cmpnei      	r0, 42
 80146be:	e84003c3 	bf      	0x8014e44	// 8014e44 <_vsnprintf+0x808>
    width = 0U;
 80146c2:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 80146c6:	eb40002e 	cmpnei      	r0, 46
 80146ca:	0c65      	bf      	0x8014794	// 8014794 <_vsnprintf+0x158>
    precision = 0U;
 80146cc:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 80146d0:	e4601067 	subi      	r3, r0, 104
 80146d4:	74cc      	zextb      	r3, r3
 80146d6:	3b12      	cmphsi      	r3, 19
 80146d8:	080c      	bt      	0x80146f0	// 80146f0 <_vsnprintf+0xb4>
 80146da:	1043      	lrw      	r2, 0x80154ec	// 80146e4 <_vsnprintf+0xa8>
 80146dc:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 80146e0:	780c      	jmp      	r3
 80146e2:	0000      	.short	0x0000
 80146e4:	080154ec 	.long	0x080154ec
 80146e8:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 80146ea:	ec210100 	ori      	r1, r1, 256
        format++;
 80146ee:	2500      	addi      	r5, 1
    switch (*format) {
 80146f0:	e4601024 	subi      	r3, r0, 37
 80146f4:	74cc      	zextb      	r3, r3
 80146f6:	eb030053 	cmphsi      	r3, 84
 80146fa:	0815      	bt      	0x8014724	// 8014724 <_vsnprintf+0xe8>
 80146fc:	1042      	lrw      	r2, 0x8015538	// 8014704 <_vsnprintf+0xc8>
 80146fe:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8014702:	780c      	jmp      	r3
 8014704:	08015538 	.long	0x08015538
        if (*format == 'l') {
 8014708:	8501      	ld.b      	r0, (r5, 0x1)
 801470a:	eb40006c 	cmpnei      	r0, 108
 801470e:	e84003ac 	bf      	0x8014e66	// 8014e66 <_vsnprintf+0x82a>
    switch (*format) {
 8014712:	e4601024 	subi      	r3, r0, 37
 8014716:	74cc      	zextb      	r3, r3
 8014718:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 801471c:	ec210100 	ori      	r1, r1, 256
        format++;
 8014720:	2500      	addi      	r5, 1
    switch (*format) {
 8014722:	0fed      	bf      	0x80146fc	// 80146fc <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 8014724:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 8014726:	6caf      	mov      	r2, r11
 8014728:	6cdf      	mov      	r3, r7
 801472a:	6c63      	mov      	r1, r8
 801472c:	7bd9      	jsr      	r6
  while (*format)
 801472e:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 8014730:	e54b0000 	addi      	r10, r11, 1
 8014734:	6eeb      	mov      	r11, r10
  while (*format)
 8014736:	e920ff95 	bnez      	r0, 0x8014660	// 8014660 <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 801473a:	65ec      	cmphs      	r11, r7
 801473c:	e8400381 	bf      	0x8014e3e	// 8014e3e <_vsnprintf+0x802>
 8014740:	5f43      	subi      	r2, r7, 1
 8014742:	6cdf      	mov      	r3, r7
 8014744:	6c63      	mov      	r1, r8
 8014746:	3000      	movi      	r0, 0
 8014748:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 801474a:	6c2f      	mov      	r0, r11
 801474c:	1416      	addi      	r14, r14, 88
 801474e:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 8014752:	8501      	ld.b      	r0, (r5, 0x1)
 8014754:	eb400068 	cmpnei      	r0, 104
 8014758:	e8400381 	bf      	0x8014e5a	// 8014e5a <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 801475c:	ec210080 	ori      	r1, r1, 128
        format++;
 8014760:	2500      	addi      	r5, 1
 8014762:	07c7      	br      	0x80146f0	// 80146f0 <_vsnprintf+0xb4>
 8014764:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8014766:	ec210200 	ori      	r1, r1, 512
        format++;
 801476a:	2500      	addi      	r5, 1
        break;
 801476c:	07c2      	br      	0x80146f0	// 80146f0 <_vsnprintf+0xb4>
 801476e:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8014772:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 8014776:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8014778:	2500      	addi      	r5, 1
 801477a:	f9b18440 	mula.32.l      	r0, r17, r13
 801477e:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 8014782:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8014784:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8014788:	74cc      	zextb      	r3, r3
 801478a:	64c8      	cmphs      	r2, r3
 801478c:	0bf6      	bt      	0x8014778	// 8014778 <_vsnprintf+0x13c>
    if (*format == '.') {
 801478e:	eb40002e 	cmpnei      	r0, 46
 8014792:	0b9d      	bt      	0x80146cc	// 80146cc <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 8014794:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 8014796:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 801479a:	74cc      	zextb      	r3, r3
 801479c:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 801479e:	ec210400 	ori      	r1, r1, 1024
      format++;
 80147a2:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 80147a4:	0813      	bt      	0x80147ca	// 80147ca <_vsnprintf+0x18e>
 80147a6:	6d4b      	mov      	r5, r2
 80147a8:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80147ac:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 80147b0:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80147b2:	2500      	addi      	r5, 1
 80147b4:	fa4a8440 	mula.32.l      	r0, r10, r18
 80147b8:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 80147bc:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 80147be:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 80147c2:	74cc      	zextb      	r3, r3
 80147c4:	64c8      	cmphs      	r2, r3
 80147c6:	0bf6      	bt      	0x80147b2	// 80147b2 <_vsnprintf+0x176>
 80147c8:	0784      	br      	0x80146d0	// 80146d0 <_vsnprintf+0x94>
      else if (*format == '*') {
 80147ca:	eb40002a 	cmpnei      	r0, 42
 80147ce:	e84003e2 	bf      	0x8014f92	// 8014f92 <_vsnprintf+0x956>
      format++;
 80147d2:	6d4b      	mov      	r5, r2
 80147d4:	077c      	br      	0x80146cc	// 80146cc <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 80147d6:	5c6e      	addi      	r3, r4, 4
 80147d8:	3000      	movi      	r0, 0
 80147da:	dac42000 	ld.w      	r22, (r4, 0x0)
 80147de:	b869      	st.w      	r3, (r14, 0x24)
 80147e0:	6d03      	mov      	r4, r0
            h = bit / 100;
 80147e2:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 80147e6:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 80147ea:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 80147ee:	ea15002e 	movi      	r21, 46
 80147f2:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 80147f6:	c4164043 	lsr      	r3, r22, r0
 80147fa:	74cc      	zextb      	r3, r3
            h = bit / 100;
 80147fc:	c6838022 	divu      	r2, r3, r20
 8014800:	7748      	zextb      	r13, r2
            if (h)
 8014802:	e90d0306 	bez      	r13, 0x8014e0e	// 8014e0e <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 8014806:	c6828422 	mult      	r2, r2, r20
 801480a:	60ca      	subu      	r3, r2
 801480c:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 801480e:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 8014812:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 8014816:	e5840000 	addi      	r12, r4, 1
 801481a:	e5ad002f 	addi      	r13, r13, 48
 801481e:	7730      	zextb      	r12, r12
 8014820:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 8014824:	e92202fe 	bnez      	r2, 0x8014e20	// 8014e20 <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 8014828:	1a0c      	addi      	r2, r14, 48
 801482a:	2401      	addi      	r4, 2
 801482c:	7510      	zextb      	r4, r4
 801482e:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 8014832:	c6638022 	divu      	r2, r3, r19
 8014836:	c6628422 	mult      	r2, r2, r19
 801483a:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 801483c:	1a0c      	addi      	r2, r14, 48
 801483e:	e5840000 	addi      	r12, r4, 1
 8014842:	232f      	addi      	r3, 48
 8014844:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8014848:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 801484a:	2401      	addi      	r4, 2
 801484c:	7510      	zextb      	r4, r4
 801484e:	d5820035 	str.b      	r21, (r2, r12 << 0)
 8014852:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 8014854:	e832ffd1 	bnezad      	r18, 0x80147f6	// 80147f6 <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8014858:	e46e002e 	addi      	r3, r14, 47
 801485c:	3200      	movi      	r2, 0
 801485e:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8014862:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8014864:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8014868:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 801486a:	3a40      	cmpnei      	r2, 0
 801486c:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8014870:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8014872:	6c83      	mov      	r2, r0
 8014874:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014878:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 801487c:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 801487e:	b86b      	st.w      	r3, (r14, 0x2c)
 8014880:	e9230333 	bnez      	r3, 0x8014ee6	// 8014ee6 <_vsnprintf+0x8aa>
          while (l++ < width) {
 8014884:	c6220420 	cmphs      	r2, r17
 8014888:	6ccb      	mov      	r3, r2
 801488a:	2300      	addi      	r3, 1
 801488c:	e86003ff 	bt      	0x801508a	// 801508a <_vsnprintf+0xa4e>
 8014890:	c5710023 	addu      	r3, r17, r11
 8014894:	5b89      	subu      	r4, r3, r2
 8014896:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014898:	e56b0000 	addi      	r11, r11, 1
 801489c:	6cdf      	mov      	r3, r7
 801489e:	6c63      	mov      	r1, r8
 80148a0:	3020      	movi      	r0, 32
 80148a2:	7bd9      	jsr      	r6
          while (l++ < width) {
 80148a4:	66d2      	cmpne      	r4, r11
 80148a6:	6caf      	mov      	r2, r11
 80148a8:	0bf8      	bt      	0x8014898	// 8014898 <_vsnprintf+0x25c>
 80148aa:	e4710000 	addi      	r3, r17, 1
 80148ae:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80148b0:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80148b4:	e9000030 	bez      	r0, 0x8014914	// 8014914 <_vsnprintf+0x2d8>
 80148b8:	6caf      	mov      	r2, r11
 80148ba:	e60e002f 	addi      	r16, r14, 48
 80148be:	d96e200a 	ld.w      	r11, (r14, 0x28)
 80148c2:	0402      	br      	0x80148c6	// 80148c6 <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 80148c4:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80148c6:	e90b0007 	bez      	r11, 0x80148d4	// 80148d4 <_vsnprintf+0x298>
 80148ca:	e46a1000 	subi      	r3, r10, 1
 80148ce:	e90a034a 	bez      	r10, 0x8014f62	// 8014f62 <_vsnprintf+0x926>
 80148d2:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 80148d4:	e6100000 	addi      	r16, r16, 1
 80148d8:	6cdf      	mov      	r3, r7
 80148da:	6c63      	mov      	r1, r8
 80148dc:	5a82      	addi      	r4, r2, 1
 80148de:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80148e0:	d8100000 	ld.b      	r0, (r16, 0x0)
 80148e4:	e920fff0 	bnez      	r0, 0x80148c4	// 80148c4 <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 80148e8:	986b      	ld.w      	r3, (r14, 0x2c)
 80148ea:	e90302a5 	bez      	r3, 0x8014e34	// 8014e34 <_vsnprintf+0x7f8>
          while (l++ < width) {
 80148ee:	9868      	ld.w      	r3, (r14, 0x20)
 80148f0:	c6230420 	cmphs      	r3, r17
 80148f4:	e86002a0 	bt      	0x8014e34	// 8014e34 <_vsnprintf+0x7f8>
 80148f8:	c4910020 	addu      	r0, r17, r4
 80148fc:	c460008a 	subu      	r10, r0, r3
 8014900:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8014902:	e5620000 	addi      	r11, r2, 1
 8014906:	6cdf      	mov      	r3, r7
 8014908:	6c63      	mov      	r1, r8
 801490a:	3020      	movi      	r0, 32
 801490c:	7bd9      	jsr      	r6
          while (l++ < width) {
 801490e:	66ea      	cmpne      	r10, r11
 8014910:	6caf      	mov      	r2, r11
 8014912:	0bf8      	bt      	0x8014902	// 8014902 <_vsnprintf+0x2c6>
        format++;
 8014914:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014916:	9889      	ld.w      	r4, (r14, 0x24)
 8014918:	06a1      	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 801491a:	da042000 	ld.w      	r16, (r4, 0x0)
 801491e:	5c6e      	addi      	r3, r4, 4
 8014920:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 8014922:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 8014926:	3300      	movi      	r3, 0
 8014928:	2b00      	subi      	r3, 1
 801492a:	eb4a0000 	cmpnei      	r10, 0
 801492e:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 8014932:	c4104824 	lsli      	r4, r16, 0
 8014936:	e9200006 	bnez      	r0, 0x8014942	// 8014942 <_vsnprintf+0x306>
 801493a:	0408      	br      	0x801494a	// 801494a <_vsnprintf+0x30e>
 801493c:	2b00      	subi      	r3, 1
 801493e:	e9030006 	bez      	r3, 0x801494a	// 801494a <_vsnprintf+0x30e>
 8014942:	2400      	addi      	r4, 1
 8014944:	8440      	ld.b      	r2, (r4, 0x0)
 8014946:	e922fffb 	bnez      	r2, 0x801493c	// 801493c <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 801494a:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 801494e:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 8014952:	f944cd23 	min.u32      	r3, r4, r10
 8014956:	3a40      	cmpnei      	r2, 0
 8014958:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 801495c:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 8014960:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 8014962:	b86a      	st.w      	r3, (r14, 0x28)
 8014964:	e9230287 	bnez      	r3, 0x8014e72	// 8014e72 <_vsnprintf+0x836>
          while (l++ < width) {
 8014968:	c6240420 	cmphs      	r4, r17
 801496c:	5c62      	addi      	r3, r4, 1
 801496e:	e860039c 	bt      	0x80150a6	// 80150a6 <_vsnprintf+0xa6a>
 8014972:	c5710023 	addu      	r3, r17, r11
 8014976:	5b91      	subu      	r4, r3, r4
 8014978:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 801497a:	e5620000 	addi      	r11, r2, 1
 801497e:	6cdf      	mov      	r3, r7
 8014980:	6c63      	mov      	r1, r8
 8014982:	3020      	movi      	r0, 32
 8014984:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014986:	66d2      	cmpne      	r4, r11
 8014988:	6caf      	mov      	r2, r11
 801498a:	0bf8      	bt      	0x801497a	// 801497a <_vsnprintf+0x33e>
 801498c:	c40b4832 	lsli      	r18, r11, 0
 8014990:	e4910000 	addi      	r4, r17, 1
 8014994:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014998:	e9000391 	bez      	r0, 0x80150ba	// 80150ba <_vsnprintf+0xa7e>
 801499c:	b88b      	st.w      	r4, (r14, 0x2c)
 801499e:	c4124822 	lsli      	r2, r18, 0
 80149a2:	d96e2009 	ld.w      	r11, (r14, 0x24)
 80149a6:	0402      	br      	0x80149aa	// 80149aa <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 80149a8:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80149aa:	e90b0007 	bez      	r11, 0x80149b8	// 80149b8 <_vsnprintf+0x37c>
 80149ae:	e46a1000 	subi      	r3, r10, 1
 80149b2:	e90a02d2 	bez      	r10, 0x8014f56	// 8014f56 <_vsnprintf+0x91a>
 80149b6:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 80149b8:	e6100000 	addi      	r16, r16, 1
 80149bc:	6cdf      	mov      	r3, r7
 80149be:	6c63      	mov      	r1, r8
 80149c0:	5a82      	addi      	r4, r2, 1
 80149c2:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80149c4:	d8100000 	ld.b      	r0, (r16, 0x0)
 80149c8:	e920fff0 	bnez      	r0, 0x80149a8	// 80149a8 <_vsnprintf+0x36c>
 80149cc:	6ed3      	mov      	r11, r4
 80149ce:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 80149d0:	986a      	ld.w      	r3, (r14, 0x28)
 80149d2:	e9030012 	bez      	r3, 0x80149f6	// 80149f6 <_vsnprintf+0x3ba>
          while (l++ < width) {
 80149d6:	c6240420 	cmphs      	r4, r17
 80149da:	080e      	bt      	0x80149f6	// 80149f6 <_vsnprintf+0x3ba>
 80149dc:	c5710020 	addu      	r0, r17, r11
 80149e0:	5891      	subu      	r4, r0, r4
 80149e2:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80149e4:	e56b0000 	addi      	r11, r11, 1
 80149e8:	6cdf      	mov      	r3, r7
 80149ea:	6c63      	mov      	r1, r8
 80149ec:	3020      	movi      	r0, 32
 80149ee:	7bd9      	jsr      	r6
          while (l++ < width) {
 80149f0:	66d2      	cmpne      	r4, r11
 80149f2:	6caf      	mov      	r2, r11
 80149f4:	0bf8      	bt      	0x80149e4	// 80149e4 <_vsnprintf+0x3a8>
        format++;
 80149f6:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 80149f8:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 80149fa:	0630      	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80149fc:	3308      	movi      	r3, 8
 80149fe:	b864      	st.w      	r3, (r14, 0x10)
 8014a00:	3310      	movi      	r3, 16
 8014a02:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 8014a04:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014a08:	3300      	movi      	r3, 0
 8014a0a:	b825      	st.w      	r1, (r14, 0x14)
 8014a0c:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014a10:	b861      	st.w      	r3, (r14, 0x4)
 8014a12:	9460      	ld.w      	r3, (r4, 0x0)
 8014a14:	b860      	st.w      	r3, (r14, 0x0)
 8014a16:	6caf      	mov      	r2, r11
 8014a18:	6cdf      	mov      	r3, r7
 8014a1a:	6c63      	mov      	r1, r8
 8014a1c:	6c1b      	mov      	r0, r6
 8014a1e:	e6040003 	addi      	r16, r4, 4
 8014a22:	e3fff8af 	bsr      	0x8013b80	// 8013b80 <_ntoa_long>
 8014a26:	6ec3      	mov      	r11, r0
        format++;
 8014a28:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014a2a:	c4104824 	lsli      	r4, r16, 0
        break;
 8014a2e:	0616      	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 8014a30:	e4212002 	andi      	r1, r1, 2
 8014a34:	e9210227 	bnez      	r1, 0x8014e82	// 8014e82 <_vsnprintf+0x846>
          while (l++ < width) {
 8014a38:	3301      	movi      	r3, 1
 8014a3a:	c6230420 	cmphs      	r3, r17
 8014a3e:	e860032f 	bt      	0x801509c	// 801509c <_vsnprintf+0xa60>
 8014a42:	e60b1000 	subi      	r16, r11, 1
 8014a46:	c6300030 	addu      	r16, r16, r17
 8014a4a:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014a4c:	e5420000 	addi      	r10, r2, 1
 8014a50:	6cdf      	mov      	r3, r7
 8014a52:	6c63      	mov      	r1, r8
 8014a54:	3020      	movi      	r0, 32
 8014a56:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014a58:	c5500480 	cmpne      	r16, r10
 8014a5c:	6cab      	mov      	r2, r10
 8014a5e:	0bf7      	bt      	0x8014a4c	// 8014a4c <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014a60:	8400      	ld.b      	r0, (r4, 0x0)
 8014a62:	e6040003 	addi      	r16, r4, 4
 8014a66:	6cdf      	mov      	r3, r7
 8014a68:	6cab      	mov      	r2, r10
 8014a6a:	6c63      	mov      	r1, r8
 8014a6c:	e56a0000 	addi      	r11, r10, 1
 8014a70:	7bd9      	jsr      	r6
 8014a72:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014a76:	2500      	addi      	r5, 1
        break;
 8014a78:	e800fdf1 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 8014a7c:	eb400078 	cmpnei      	r0, 120
 8014a80:	e8400277 	bf      	0x8014f6e	// 8014f6e <_vsnprintf+0x932>
 8014a84:	eb400058 	cmpnei      	r0, 88
 8014a88:	e8400275 	bf      	0x8014f72	// 8014f72 <_vsnprintf+0x936>
        else if (*format == 'o') {
 8014a8c:	eb40006f 	cmpnei      	r0, 111
 8014a90:	e8400232 	bf      	0x8014ef4	// 8014ef4 <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 8014a94:	eb400062 	cmpnei      	r0, 98
 8014a98:	e84002d5 	bf      	0x8015042	// 8015042 <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 8014a9c:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8014aa0:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 8014aa4:	e8600232 	bt      	0x8014f08	// 8014f08 <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 8014aa8:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 8014aac:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 8014aae:	e9010236 	bez      	r1, 0x8014f1a	// 8014f1a <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 8014ab2:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 8014ab4:	eb400069 	cmpnei      	r0, 105
 8014ab8:	e8400231 	bf      	0x8014f1a	// 8014f1a <_vsnprintf+0x8de>
 8014abc:	eb400064 	cmpnei      	r0, 100
 8014ac0:	e840022d 	bf      	0x8014f1a	// 8014f1a <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 8014ac4:	e4232200 	andi      	r1, r3, 512
 8014ac8:	e9210276 	bnez      	r1, 0x8014fb4	// 8014fb4 <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 8014acc:	e4032100 	andi      	r0, r3, 256
 8014ad0:	e92002a2 	bnez      	r0, 0x8015014	// 8015014 <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8014ad4:	e4232040 	andi      	r1, r3, 64
 8014ad8:	e92102cf 	bnez      	r1, 0x8015076	// 8015076 <_vsnprintf+0xa3a>
 8014adc:	e4232080 	andi      	r1, r3, 128
 8014ae0:	e92102b3 	bnez      	r1, 0x8015046	// 8015046 <_vsnprintf+0xa0a>
 8014ae4:	9420      	ld.w      	r1, (r4, 0x0)
 8014ae6:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 8014ae8:	b865      	st.w      	r3, (r14, 0x14)
 8014aea:	3300      	movi      	r3, 0
 8014aec:	de2e2004 	st.w      	r17, (r14, 0x10)
 8014af0:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014af4:	b842      	st.w      	r2, (r14, 0x8)
 8014af6:	b861      	st.w      	r3, (r14, 0x4)
 8014af8:	b820      	st.w      	r1, (r14, 0x0)
 8014afa:	6caf      	mov      	r2, r11
 8014afc:	6cdf      	mov      	r3, r7
 8014afe:	6c63      	mov      	r1, r8
 8014b00:	6c1b      	mov      	r0, r6
 8014b02:	e3fff83f 	bsr      	0x8013b80	// 8013b80 <_ntoa_long>
 8014b06:	6ec3      	mov      	r11, r0
        format++;
 8014b08:	2500      	addi      	r5, 1
 8014b0a:	e800fda8 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8014b0e:	eb400046 	cmpnei      	r0, 70
 8014b12:	e840023c 	bf      	0x8014f8a	// 8014f8a <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014b16:	b824      	st.w      	r1, (r14, 0x10)
 8014b18:	de2e2003 	st.w      	r17, (r14, 0xc)
 8014b1c:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8014b20:	e6040007 	addi      	r16, r4, 8
 8014b24:	9460      	ld.w      	r3, (r4, 0x0)
 8014b26:	9481      	ld.w      	r4, (r4, 0x4)
 8014b28:	b860      	st.w      	r3, (r14, 0x0)
 8014b2a:	b881      	st.w      	r4, (r14, 0x4)
 8014b2c:	6caf      	mov      	r2, r11
 8014b2e:	6cdf      	mov      	r3, r7
 8014b30:	6c63      	mov      	r1, r8
 8014b32:	6c1b      	mov      	r0, r6
 8014b34:	e3fff8f2 	bsr      	0x8013d18	// 8013d18 <_ftoa>
 8014b38:	6ec3      	mov      	r11, r0
        format++;
 8014b3a:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014b3c:	c4104824 	lsli      	r4, r16, 0
        break;
 8014b40:	e800fd8d 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 8014b44:	6caf      	mov      	r2, r11
 8014b46:	e54b0000 	addi      	r10, r11, 1
 8014b4a:	6cdf      	mov      	r3, r7
 8014b4c:	6c63      	mov      	r1, r8
 8014b4e:	3025      	movi      	r0, 37
 8014b50:	7bd9      	jsr      	r6
        format++;
 8014b52:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 8014b54:	6eeb      	mov      	r11, r10
        break;
 8014b56:	e800fd82 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 8014b5a:	5c6e      	addi      	r3, r4, 4
 8014b5c:	dac42000 	ld.w      	r22, (r4, 0x0)
 8014b60:	b869      	st.w      	r3, (r14, 0x24)
 8014b62:	e716000f 	addi      	r24, r22, 16
 8014b66:	3400      	movi      	r4, 0
                if (h > 9)
 8014b68:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 8014b6c:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 8014b70:	ea0c0000 	movi      	r12, 0
 8014b74:	da562000 	ld.w      	r18, (r22, 0x0)
 8014b78:	6c33      	mov      	r0, r12
 8014b7a:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 8014b7e:	c5924043 	lsr      	r3, r18, r12
 8014b82:	74cc      	zextb      	r3, r3
                h = m >> 4;
 8014b84:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 8014b86:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 8014b8a:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 8014b8e:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 8014b92:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 8014b96:	092e      	bt      	0x8014df2	// 8014df2 <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 8014b98:	e6ae002f 	addi      	r21, r14, 48
 8014b9c:	2236      	addi      	r2, 55
 8014b9e:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 8014ba2:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 8014ba6:	e4930000 	addi      	r4, r19, 1
 8014baa:	7510      	zextb      	r4, r4
                if (l > 9)
 8014bac:	091e      	bt      	0x8014de8	// 8014de8 <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 8014bae:	1a0c      	addi      	r2, r14, 48
 8014bb0:	2336      	addi      	r3, 55
 8014bb2:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 8014bb6:	e4602001 	andi      	r3, r0, 1
 8014bba:	e9030007 	bez      	r3, 0x8014bc8	// 8014bc8 <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 8014bbe:	1a0c      	addi      	r2, r14, 48
 8014bc0:	5c62      	addi      	r3, r4, 1
 8014bc2:	d4820037 	str.b      	r23, (r2, r4 << 0)
 8014bc6:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 8014bc8:	2000      	addi      	r0, 1
 8014bca:	7400      	zextb      	r0, r0
 8014bcc:	e58c0007 	addi      	r12, r12, 8
 8014bd0:	e82dffd7 	bnezad      	r13, 0x8014b7e	// 8014b7e <_vsnprintf+0x542>
            inuint++;
 8014bd4:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 8014bd8:	c6d80480 	cmpne      	r24, r22
 8014bdc:	0bca      	bt      	0x8014b70	// 8014b70 <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 8014bde:	e46e002e 	addi      	r3, r14, 47
 8014be2:	3200      	movi      	r2, 0
 8014be4:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8014be8:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8014bea:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8014bee:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8014bf0:	3a40      	cmpnei      	r2, 0
 8014bf2:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8014bf6:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8014bf8:	6c83      	mov      	r2, r0
 8014bfa:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014bfe:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8014c02:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014c04:	b86b      	st.w      	r3, (r14, 0x2c)
 8014c06:	e923015a 	bnez      	r3, 0x8014eba	// 8014eba <_vsnprintf+0x87e>
          while (l++ < width) {
 8014c0a:	c6220420 	cmphs      	r2, r17
 8014c0e:	6ccb      	mov      	r3, r2
 8014c10:	2300      	addi      	r3, 1
 8014c12:	e8600239 	bt      	0x8015084	// 8015084 <_vsnprintf+0xa48>
 8014c16:	c5710023 	addu      	r3, r17, r11
 8014c1a:	5b89      	subu      	r4, r3, r2
 8014c1c:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014c1e:	e56b0000 	addi      	r11, r11, 1
 8014c22:	6cdf      	mov      	r3, r7
 8014c24:	6c63      	mov      	r1, r8
 8014c26:	3020      	movi      	r0, 32
 8014c28:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014c2a:	66d2      	cmpne      	r4, r11
 8014c2c:	6caf      	mov      	r2, r11
 8014c2e:	0bf8      	bt      	0x8014c1e	// 8014c1e <_vsnprintf+0x5e2>
 8014c30:	e4710000 	addi      	r3, r17, 1
 8014c34:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014c36:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014c3a:	e900fe6d 	bez      	r0, 0x8014914	// 8014914 <_vsnprintf+0x2d8>
 8014c3e:	6caf      	mov      	r2, r11
 8014c40:	e60e002f 	addi      	r16, r14, 48
 8014c44:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014c48:	0402      	br      	0x8014c4c	// 8014c4c <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 8014c4a:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014c4c:	e90b0007 	bez      	r11, 0x8014c5a	// 8014c5a <_vsnprintf+0x61e>
 8014c50:	e46a1000 	subi      	r3, r10, 1
 8014c54:	e90a0185 	bez      	r10, 0x8014f5e	// 8014f5e <_vsnprintf+0x922>
 8014c58:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014c5a:	e6100000 	addi      	r16, r16, 1
 8014c5e:	6cdf      	mov      	r3, r7
 8014c60:	6c63      	mov      	r1, r8
 8014c62:	5a82      	addi      	r4, r2, 1
 8014c64:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014c66:	d8100000 	ld.b      	r0, (r16, 0x0)
 8014c6a:	e920fff0 	bnez      	r0, 0x8014c4a	// 8014c4a <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 8014c6e:	986b      	ld.w      	r3, (r14, 0x2c)
 8014c70:	e90300e2 	bez      	r3, 0x8014e34	// 8014e34 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8014c74:	9868      	ld.w      	r3, (r14, 0x20)
 8014c76:	c6230420 	cmphs      	r3, r17
 8014c7a:	08dd      	bt      	0x8014e34	// 8014e34 <_vsnprintf+0x7f8>
 8014c7c:	c4910020 	addu      	r0, r17, r4
 8014c80:	c460008a 	subu      	r10, r0, r3
 8014c84:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8014c86:	e5620000 	addi      	r11, r2, 1
 8014c8a:	6cdf      	mov      	r3, r7
 8014c8c:	6c63      	mov      	r1, r8
 8014c8e:	3020      	movi      	r0, 32
 8014c90:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014c92:	66ea      	cmpne      	r10, r11
 8014c94:	6caf      	mov      	r2, r11
 8014c96:	0bf8      	bt      	0x8014c86	// 8014c86 <_vsnprintf+0x64a>
        format++;
 8014c98:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014c9a:	9889      	ld.w      	r4, (r14, 0x24)
 8014c9c:	e800fcdf 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8014ca0:	5c6e      	addi      	r3, r4, 4
 8014ca2:	b869      	st.w      	r3, (r14, 0x24)
 8014ca4:	da642000 	ld.w      	r19, (r4, 0x0)
 8014ca8:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 8014caa:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 8014cae:	ea15002d 	movi      	r21, 45
 8014cb2:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8014cb6:	d8730000 	ld.b      	r3, (r19, 0x0)
 8014cba:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 8014cbc:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 8014cc0:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8014cc4:	089d      	bt      	0x8014dfe	// 8014dfe <_vsnprintf+0x7c2>
        if (lbit > 9)
 8014cc6:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 8014cca:	2036      	addi      	r0, 55
 8014ccc:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8014cce:	089d      	bt      	0x8014e08	// 8014e08 <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 8014cd0:	2336      	addi      	r3, 55
 8014cd2:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 8014cd4:	dea20002 	st.b      	r21, (r2, 0x2)
 8014cd8:	e6730000 	addi      	r19, r19, 1
 8014cdc:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 8014cde:	e832ffec 	bnezad      	r18, 0x8014cb6	// 8014cb6 <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 8014ce2:	3300      	movi      	r3, 0
 8014ce4:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 8014ce8:	e4612400 	andi      	r3, r1, 1024
 8014cec:	b86a      	st.w      	r3, (r14, 0x28)
 8014cee:	e90300f3 	bez      	r3, 0x8014ed4	// 8014ed4 <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 8014cf2:	ea100011 	movi      	r16, 17
 8014cf6:	fa0acd23 	min.u32      	r3, r10, r16
 8014cfa:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014cfc:	e4612002 	andi      	r3, r1, 2
 8014d00:	b86b      	st.w      	r3, (r14, 0x2c)
 8014d02:	e92300e2 	bnez      	r3, 0x8014ec6	// 8014ec6 <_vsnprintf+0x88a>
          while (l++ < width) {
 8014d06:	9848      	ld.w      	r2, (r14, 0x20)
 8014d08:	c6220420 	cmphs      	r2, r17
 8014d0c:	6ccb      	mov      	r3, r2
 8014d0e:	2300      	addi      	r3, 1
 8014d10:	09c9      	bt      	0x80150a2	// 80150a2 <_vsnprintf+0xa66>
 8014d12:	c5710023 	addu      	r3, r17, r11
 8014d16:	c4430090 	subu      	r16, r3, r2
 8014d1a:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014d1c:	e56b0000 	addi      	r11, r11, 1
 8014d20:	6cdf      	mov      	r3, r7
 8014d22:	6c63      	mov      	r1, r8
 8014d24:	3020      	movi      	r0, 32
 8014d26:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014d28:	c60b0480 	cmpne      	r11, r16
 8014d2c:	6caf      	mov      	r2, r11
 8014d2e:	0bf7      	bt      	0x8014d1c	// 8014d1c <_vsnprintf+0x6e0>
 8014d30:	e4710000 	addi      	r3, r17, 1
 8014d34:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014d36:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014d3a:	e900fded 	bez      	r0, 0x8014914	// 8014914 <_vsnprintf+0x2d8>
 8014d3e:	6caf      	mov      	r2, r11
 8014d40:	1c0c      	addi      	r4, r14, 48
 8014d42:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014d46:	0403      	br      	0x8014d4c	// 8014d4c <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 8014d48:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014d4c:	e90b0007 	bez      	r11, 0x8014d5a	// 8014d5a <_vsnprintf+0x71e>
 8014d50:	e46a1000 	subi      	r3, r10, 1
 8014d54:	e90a010a 	bez      	r10, 0x8014f68	// 8014f68 <_vsnprintf+0x92c>
 8014d58:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014d5a:	2400      	addi      	r4, 1
 8014d5c:	6cdf      	mov      	r3, r7
 8014d5e:	6c63      	mov      	r1, r8
 8014d60:	e6020000 	addi      	r16, r2, 1
 8014d64:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014d66:	8400      	ld.b      	r0, (r4, 0x0)
 8014d68:	e920fff0 	bnez      	r0, 0x8014d48	// 8014d48 <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 8014d6c:	986b      	ld.w      	r3, (r14, 0x2c)
 8014d6e:	e90300b6 	bez      	r3, 0x8014eda	// 8014eda <_vsnprintf+0x89e>
          while (l++ < width) {
 8014d72:	9868      	ld.w      	r3, (r14, 0x20)
 8014d74:	c6230420 	cmphs      	r3, r17
 8014d78:	08b1      	bt      	0x8014eda	// 8014eda <_vsnprintf+0x89e>
 8014d7a:	c6110020 	addu      	r0, r17, r16
 8014d7e:	588d      	subu      	r4, r0, r3
 8014d80:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 8014d84:	e5620000 	addi      	r11, r2, 1
 8014d88:	6cdf      	mov      	r3, r7
 8014d8a:	6c63      	mov      	r1, r8
 8014d8c:	3020      	movi      	r0, 32
 8014d8e:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014d90:	652e      	cmpne      	r11, r4
 8014d92:	6caf      	mov      	r2, r11
 8014d94:	0bf8      	bt      	0x8014d84	// 8014d84 <_vsnprintf+0x748>
        format++;
 8014d96:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014d98:	9889      	ld.w      	r4, (r14, 0x24)
 8014d9a:	e800fc60 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 8014d9e:	e46020df 	andi      	r3, r0, 223
 8014da2:	eb430047 	cmpnei      	r3, 71
 8014da6:	0805      	bt      	0x8014db0	// 8014db0 <_vsnprintf+0x774>
 8014da8:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 8014dac:	e40020fd 	andi      	r0, r0, 253
 8014db0:	eb400045 	cmpnei      	r0, 69
 8014db4:	0803      	bt      	0x8014dba	// 8014dba <_vsnprintf+0x77e>
 8014db6:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014dba:	b824      	st.w      	r1, (r14, 0x10)
 8014dbc:	de2e2003 	st.w      	r17, (r14, 0xc)
 8014dc0:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8014dc4:	e6040007 	addi      	r16, r4, 8
 8014dc8:	9460      	ld.w      	r3, (r4, 0x0)
 8014dca:	9481      	ld.w      	r4, (r4, 0x4)
 8014dcc:	b860      	st.w      	r3, (r14, 0x0)
 8014dce:	b881      	st.w      	r4, (r14, 0x4)
 8014dd0:	6caf      	mov      	r2, r11
 8014dd2:	6cdf      	mov      	r3, r7
 8014dd4:	6c63      	mov      	r1, r8
 8014dd6:	6c1b      	mov      	r0, r6
 8014dd8:	e3fff9ec 	bsr      	0x80141b0	// 80141b0 <_etoa>
 8014ddc:	6ec3      	mov      	r11, r0
        format++;
 8014dde:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014de0:	c4104824 	lsli      	r4, r16, 0
        break;
 8014de4:	e800fc3b 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 8014de8:	1a0c      	addi      	r2, r14, 48
 8014dea:	232f      	addi      	r3, 48
 8014dec:	d6620023 	str.b      	r3, (r2, r19 << 0)
 8014df0:	06e3      	br      	0x8014bb6	// 8014bb6 <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 8014df2:	e6ae002f 	addi      	r21, r14, 48
 8014df6:	222f      	addi      	r2, 48
 8014df8:	d4950022 	str.b      	r2, (r21, r4 << 0)
 8014dfc:	06d3      	br      	0x8014ba2	// 8014ba2 <_vsnprintf+0x566>
        if (lbit > 9)
 8014dfe:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 8014e02:	202f      	addi      	r0, 48
 8014e04:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8014e06:	0f65      	bf      	0x8014cd0	// 8014cd0 <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 8014e08:	232f      	addi      	r3, 48
 8014e0a:	a261      	st.b      	r3, (r2, 0x1)
 8014e0c:	0764      	br      	0x8014cd4	// 8014cd4 <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 8014e0e:	c6828422 	mult      	r2, r2, r20
 8014e12:	60ca      	subu      	r3, r2
 8014e14:	74cc      	zextb      	r3, r3
 8014e16:	c6638022 	divu      	r2, r3, r19
            if (m)
 8014e1a:	e902fd0c 	bez      	r2, 0x8014832	// 8014832 <_vsnprintf+0x1f6>
 8014e1e:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 8014e20:	e5ae002f 	addi      	r13, r14, 48
 8014e24:	e48c0000 	addi      	r4, r12, 1
 8014e28:	222f      	addi      	r2, 48
 8014e2a:	7510      	zextb      	r4, r4
 8014e2c:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 8014e30:	e800fd01 	br      	0x8014832	// 8014832 <_vsnprintf+0x1f6>
          while (l++ < width) {
 8014e34:	6ed3      	mov      	r11, r4
        format++;
 8014e36:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014e38:	9889      	ld.w      	r4, (r14, 0x24)
 8014e3a:	e800fc10 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
 8014e3e:	6caf      	mov      	r2, r11
 8014e40:	e800fc81 	br      	0x8014742	// 8014742 <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 8014e44:	9400      	ld.w      	r0, (r4, 0x0)
 8014e46:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 8014e48:	e98000af 	blz      	r0, 0x8014fa6	// 8014fa6 <_vsnprintf+0x96a>
        width = (unsigned int)w;
 8014e4c:	c4004831 	lsli      	r17, r0, 0
 8014e50:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 8014e52:	6d0f      	mov      	r4, r3
      format++;
 8014e54:	5aa2      	addi      	r5, r2, 1
 8014e56:	e800fc38 	br      	0x80146c6	// 80146c6 <_vsnprintf+0x8a>
 8014e5a:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 8014e5c:	ec2100c0 	ori      	r1, r1, 192
          format++;
 8014e60:	2501      	addi      	r5, 2
 8014e62:	e800fc47 	br      	0x80146f0	// 80146f0 <_vsnprintf+0xb4>
 8014e66:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 8014e68:	ec210300 	ori      	r1, r1, 768
          format++;
 8014e6c:	2501      	addi      	r5, 2
 8014e6e:	e800fc41 	br      	0x80146f0	// 80146f0 <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014e72:	e900fdb2 	bez      	r0, 0x80149d6	// 80149d6 <_vsnprintf+0x39a>
 8014e76:	6caf      	mov      	r2, r11
 8014e78:	b88b      	st.w      	r4, (r14, 0x2c)
 8014e7a:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8014e7e:	e800fd96 	br      	0x80149aa	// 80149aa <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014e82:	6cdf      	mov      	r3, r7
 8014e84:	6caf      	mov      	r2, r11
 8014e86:	6c63      	mov      	r1, r8
 8014e88:	8400      	ld.b      	r0, (r4, 0x0)
 8014e8a:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014e8c:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014e90:	e6040003 	addi      	r16, r4, 4
 8014e94:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 8014e98:	0cfc      	bf      	0x8015090	// 8015090 <_vsnprintf+0xa54>
 8014e9a:	c571002b 	addu      	r11, r17, r11
 8014e9e:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 8014ea0:	5a82      	addi      	r4, r2, 1
 8014ea2:	6cdf      	mov      	r3, r7
 8014ea4:	6c63      	mov      	r1, r8
 8014ea6:	3020      	movi      	r0, 32
 8014ea8:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014eaa:	652e      	cmpne      	r11, r4
 8014eac:	6c93      	mov      	r2, r4
 8014eae:	0bf9      	bt      	0x8014ea0	// 8014ea0 <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014eb0:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014eb4:	2500      	addi      	r5, 1
 8014eb6:	e800fbd2 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014eba:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014ebe:	e920fec0 	bnez      	r0, 0x8014c3e	// 8014c3e <_vsnprintf+0x602>
 8014ec2:	6d2f      	mov      	r4, r11
 8014ec4:	06d8      	br      	0x8014c74	// 8014c74 <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014ec6:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014eca:	e920ff3a 	bnez      	r0, 0x8014d3e	// 8014d3e <_vsnprintf+0x702>
 8014ece:	c40b4830 	lsli      	r16, r11, 0
 8014ed2:	0750      	br      	0x8014d72	// 8014d72 <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 8014ed4:	3311      	movi      	r3, 17
 8014ed6:	b868      	st.w      	r3, (r14, 0x20)
 8014ed8:	0712      	br      	0x8014cfc	// 8014cfc <_vsnprintf+0x6c0>
          while (l++ < width) {
 8014eda:	c410482b 	lsli      	r11, r16, 0
        format++;
 8014ede:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014ee0:	9889      	ld.w      	r4, (r14, 0x24)
 8014ee2:	e800fbbc 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014ee6:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014eea:	e920fce7 	bnez      	r0, 0x80148b8	// 80148b8 <_vsnprintf+0x27c>
 8014eee:	6d2f      	mov      	r4, r11
 8014ef0:	e800fcff 	br      	0x80148ee	// 80148ee <_vsnprintf+0x2b2>
          base =  8U;
 8014ef4:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8014ef6:	c4412823 	bclri      	r3, r1, 2
 8014efa:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8014efc:	e4212400 	andi      	r1, r1, 1024
 8014f00:	e901fdda 	bez      	r1, 0x8014ab4	// 8014ab4 <_vsnprintf+0x478>
 8014f04:	e800fdd7 	br      	0x8014ab2	// 8014ab2 <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 8014f08:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8014f0c:	6c4f      	mov      	r1, r3
          base = 10U;
 8014f0e:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 8014f10:	0bf3      	bt      	0x8014ef6	// 8014ef6 <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 8014f12:	e4232400 	andi      	r1, r3, 1024
 8014f16:	e921fdce 	bnez      	r1, 0x8014ab2	// 8014ab2 <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 8014f1a:	e4232200 	andi      	r1, r3, 512
 8014f1e:	e9210066 	bnez      	r1, 0x8014fea	// 8014fea <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 8014f22:	e4032100 	andi      	r0, r3, 256
 8014f26:	e9200099 	bnez      	r0, 0x8015058	// 8015058 <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8014f2a:	e4232040 	andi      	r1, r3, 64
 8014f2e:	e92100a8 	bnez      	r1, 0x801507e	// 801507e <_vsnprintf+0xa42>
 8014f32:	e4232080 	andi      	r1, r3, 128
 8014f36:	e921008c 	bnez      	r1, 0x801504e	// 801504e <_vsnprintf+0xa12>
 8014f3a:	9420      	ld.w      	r1, (r4, 0x0)
 8014f3c:	491f      	lsri      	r0, r1, 31
 8014f3e:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014f40:	b865      	st.w      	r3, (r14, 0x14)
 8014f42:	de2e2004 	st.w      	r17, (r14, 0x10)
 8014f46:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014f4a:	b842      	st.w      	r2, (r14, 0x8)
 8014f4c:	b801      	st.w      	r0, (r14, 0x4)
 8014f4e:	c4010201 	abs      	r1, r1
 8014f52:	e800fdd3 	br      	0x8014af8	// 8014af8 <_vsnprintf+0x4bc>
 8014f56:	988b      	ld.w      	r4, (r14, 0x2c)
 8014f58:	6ecb      	mov      	r11, r2
 8014f5a:	e800fd3b 	br      	0x80149d0	// 80149d0 <_vsnprintf+0x394>
 8014f5e:	6d0b      	mov      	r4, r2
 8014f60:	0687      	br      	0x8014c6e	// 8014c6e <_vsnprintf+0x632>
 8014f62:	6d0b      	mov      	r4, r2
 8014f64:	e800fcc2 	br      	0x80148e8	// 80148e8 <_vsnprintf+0x2ac>
 8014f68:	c4024830 	lsli      	r16, r2, 0
 8014f6c:	0700      	br      	0x8014d6c	// 8014d6c <_vsnprintf+0x730>
          base = 16U;
 8014f6e:	3210      	movi      	r2, 16
 8014f70:	07c3      	br      	0x8014ef6	// 8014ef6 <_vsnprintf+0x8ba>
 8014f72:	c4412823 	bclri      	r3, r1, 2
 8014f76:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8014f78:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8014f7c:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 8014f80:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 8014f82:	e921fd98 	bnez      	r1, 0x8014ab2	// 8014ab2 <_vsnprintf+0x476>
 8014f86:	e800fd9f 	br      	0x8014ac4	// 8014ac4 <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8014f8a:	ec210020 	ori      	r1, r1, 32
 8014f8e:	e800fdc4 	br      	0x8014b16	// 8014b16 <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 8014f92:	d9a42000 	ld.w      	r13, (r4, 0x0)
 8014f96:	3300      	movi      	r3, 0
 8014f98:	8502      	ld.b      	r0, (r5, 0x2)
 8014f9a:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 8014f9e:	2403      	addi      	r4, 4
        format++;
 8014fa0:	2501      	addi      	r5, 2
 8014fa2:	e800fb97 	br      	0x80146d0	// 80146d0 <_vsnprintf+0x94>
        width = (unsigned int)-w;
 8014fa6:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 8014faa:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 8014fae:	c40c0091 	subu      	r17, r12, r0
 8014fb2:	074f      	br      	0x8014e50	// 8014e50 <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8014fb4:	b867      	st.w      	r3, (r14, 0x1c)
 8014fb6:	3300      	movi      	r3, 0
 8014fb8:	de2e2006 	st.w      	r17, (r14, 0x18)
 8014fbc:	dd4e2005 	st.w      	r10, (r14, 0x14)
 8014fc0:	b843      	st.w      	r2, (r14, 0xc)
 8014fc2:	b864      	st.w      	r3, (r14, 0x10)
 8014fc4:	b862      	st.w      	r3, (r14, 0x8)
 8014fc6:	e6040007 	addi      	r16, r4, 8
 8014fca:	9460      	ld.w      	r3, (r4, 0x0)
 8014fcc:	9481      	ld.w      	r4, (r4, 0x4)
 8014fce:	b860      	st.w      	r3, (r14, 0x0)
 8014fd0:	b881      	st.w      	r4, (r14, 0x4)
 8014fd2:	6caf      	mov      	r2, r11
 8014fd4:	6cdf      	mov      	r3, r7
 8014fd6:	6c63      	mov      	r1, r8
 8014fd8:	6c1b      	mov      	r0, r6
 8014fda:	e3fff633 	bsr      	0x8013c40	// 8013c40 <_ntoa_long_long>
 8014fde:	6ec3      	mov      	r11, r0
 8014fe0:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014fe4:	2500      	addi      	r5, 1
 8014fe6:	e800fb3a 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 8014fea:	9421      	ld.w      	r1, (r4, 0x4)
 8014fec:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014fee:	b867      	st.w      	r3, (r14, 0x1c)
 8014ff0:	3300      	movi      	r3, 0
 8014ff2:	b864      	st.w      	r3, (r14, 0x10)
 8014ff4:	497f      	lsri      	r3, r1, 31
 8014ff6:	b843      	st.w      	r2, (r14, 0xc)
 8014ff8:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 8014ffa:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014ffe:	de2e2006 	st.w      	r17, (r14, 0x18)
 8015002:	dd4e2005 	st.w      	r10, (r14, 0x14)
 8015006:	6c83      	mov      	r2, r0
 8015008:	6cc7      	mov      	r3, r1
 801500a:	e9810053 	blz      	r1, 0x80150b0	// 80150b0 <_vsnprintf+0xa74>
 801500e:	b840      	st.w      	r2, (r14, 0x0)
 8015010:	b861      	st.w      	r3, (r14, 0x4)
 8015012:	07e0      	br      	0x8014fd2	// 8014fd2 <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 8015014:	b865      	st.w      	r3, (r14, 0x14)
 8015016:	de2e2004 	st.w      	r17, (r14, 0x10)
 801501a:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801501e:	b842      	st.w      	r2, (r14, 0x8)
 8015020:	b821      	st.w      	r1, (r14, 0x4)
 8015022:	9460      	ld.w      	r3, (r4, 0x0)
 8015024:	e6040003 	addi      	r16, r4, 4
 8015028:	b860      	st.w      	r3, (r14, 0x0)
 801502a:	6caf      	mov      	r2, r11
 801502c:	6cdf      	mov      	r3, r7
 801502e:	6c63      	mov      	r1, r8
 8015030:	6c1b      	mov      	r0, r6
 8015032:	e3fff5a7 	bsr      	0x8013b80	// 8013b80 <_ntoa_long>
 8015036:	6ec3      	mov      	r11, r0
 8015038:	c4104824 	lsli      	r4, r16, 0
        format++;
 801503c:	2500      	addi      	r5, 1
 801503e:	e800fb0e 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
          base =  2U;
 8015042:	3202      	movi      	r2, 2
 8015044:	0759      	br      	0x8014ef6	// 8014ef6 <_vsnprintf+0x8ba>
 8015046:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8015048:	2403      	addi      	r4, 4
 801504a:	e800fd4f 	br      	0x8014ae8	// 8014ae8 <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801504e:	d8245000 	ld.hs      	r1, (r4, 0x0)
 8015052:	491f      	lsri      	r0, r1, 31
 8015054:	2403      	addi      	r4, 4
 8015056:	0775      	br      	0x8014f40	// 8014f40 <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 8015058:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801505a:	b865      	st.w      	r3, (r14, 0x14)
 801505c:	497f      	lsri      	r3, r1, 31
 801505e:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 8015062:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8015066:	de2e2004 	st.w      	r17, (r14, 0x10)
 801506a:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801506e:	b842      	st.w      	r2, (r14, 0x8)
 8015070:	b861      	st.w      	r3, (r14, 0x4)
 8015072:	b820      	st.w      	r1, (r14, 0x0)
 8015074:	07db      	br      	0x801502a	// 801502a <_vsnprintf+0x9ee>
 8015076:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8015078:	2403      	addi      	r4, 4
 801507a:	e800fd37 	br      	0x8014ae8	// 8014ae8 <_vsnprintf+0x4ac>
 801507e:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8015080:	2403      	addi      	r4, 4
 8015082:	075f      	br      	0x8014f40	// 8014f40 <_vsnprintf+0x904>
          while (l++ < width) {
 8015084:	b868      	st.w      	r3, (r14, 0x20)
 8015086:	e800fdd8 	br      	0x8014c36	// 8014c36 <_vsnprintf+0x5fa>
          while (l++ < width) {
 801508a:	b868      	st.w      	r3, (r14, 0x20)
 801508c:	e800fc12 	br      	0x80148b0	// 80148b0 <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8015090:	c4104824 	lsli      	r4, r16, 0
 8015094:	6eeb      	mov      	r11, r10
        format++;
 8015096:	2500      	addi      	r5, 1
 8015098:	e800fae1 	br      	0x801465a	// 801465a <_vsnprintf+0x1e>
          while (l++ < width) {
 801509c:	6eaf      	mov      	r10, r11
 801509e:	e800fce1 	br      	0x8014a60	// 8014a60 <_vsnprintf+0x424>
          while (l++ < width) {
 80150a2:	b868      	st.w      	r3, (r14, 0x20)
 80150a4:	0649      	br      	0x8014d36	// 8014d36 <_vsnprintf+0x6fa>
          while (l++ < width) {
 80150a6:	6d0f      	mov      	r4, r3
 80150a8:	c40b4832 	lsli      	r18, r11, 0
 80150ac:	e800fc76 	br      	0x8014998	// 8014998 <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80150b0:	3000      	movi      	r0, 0
 80150b2:	3100      	movi      	r1, 0
 80150b4:	f840c462 	sub.64      	r2, r0, r2
 80150b8:	07ab      	br      	0x801500e	// 801500e <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80150ba:	c412482b 	lsli      	r11, r18, 0
 80150be:	e800fc9c 	br      	0x80149f6	// 80149f6 <_vsnprintf+0x3ba>
	...

080150c4 <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 80150c4:	1046      	lrw      	r2, 0x40010600	// 80150dc <fputc+0x18>
 80150c6:	9267      	ld.w      	r3, (r2, 0x1c)
 80150c8:	e463203f 	andi      	r3, r3, 63
 80150cc:	3b1f      	cmphsi      	r3, 32
 80150ce:	0bfc      	bt      	0x80150c6	// 80150c6 <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80150d0:	e40020ff 	andi      	r0, r0, 255
 80150d4:	b208      	st.w      	r0, (r2, 0x20)
}
 80150d6:	3000      	movi      	r0, 0
 80150d8:	783c      	jmp      	r15
 80150da:	0000      	.short	0x0000
 80150dc:	40010600 	.long	0x40010600

080150e0 <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 80150e0:	1424      	subi      	r14, r14, 16
 80150e2:	b863      	st.w      	r3, (r14, 0xc)
 80150e4:	b842      	st.w      	r2, (r14, 0x8)
 80150e6:	b821      	st.w      	r1, (r14, 0x4)
 80150e8:	b800      	st.w      	r0, (r14, 0x0)
 80150ea:	14d0      	push      	r15
 80150ec:	1421      	subi      	r14, r14, 4
 80150ee:	9862      	ld.w      	r3, (r14, 0x8)
 80150f0:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 80150f2:	1b03      	addi      	r3, r14, 12
 80150f4:	b860      	st.w      	r3, (r14, 0x0)
 80150f6:	6ccb      	mov      	r3, r2
 80150f8:	3200      	movi      	r2, 0
 80150fa:	2a00      	subi      	r2, 1
 80150fc:	6c4f      	mov      	r1, r3
 80150fe:	1005      	lrw      	r0, 0x80138e4	// 8015110 <wm_printf+0x30>
 8015100:	e3fffa9e 	bsr      	0x801463c	// 801463c <_vsnprintf>
	va_end(args);

	return length;
}
 8015104:	1401      	addi      	r14, r14, 4
 8015106:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 801510a:	1405      	addi      	r14, r14, 20
 801510c:	783c      	jmp      	r15
 801510e:	0000      	.short	0x0000
 8015110:	080138e4 	.long	0x080138e4

08015114 <__assert_fail>:

__attribute__((weak)) void __assert_fail(const char *file,
	int line,
	const char *func,
	const char *failedexpr)
{
 8015114:	14d0      	push      	r15
 8015116:	1422      	subi      	r14, r14, 8
 8015118:	6f07      	mov      	r12, r1
 801511a:	6c4f      	mov      	r1, r3
    wm_printf("assertion \"%s\" failed: file \"%s\", line %d%s%s\r\n",
 801511c:	e902000b 	bez      	r2, 0x8015132	// 8015132 <__assert_fail+0x1e>
 8015120:	1066      	lrw      	r3, 0x8015688	// 8015138 <__assert_fail+0x24>
 8015122:	b841      	st.w      	r2, (r14, 0x4)
 8015124:	b860      	st.w      	r3, (r14, 0x0)
 8015126:	6c83      	mov      	r2, r0
 8015128:	6cf3      	mov      	r3, r12
 801512a:	1005      	lrw      	r0, 0x8015698	// 801513c <__assert_fail+0x28>
 801512c:	e3ffffda 	bsr      	0x80150e0	// 80150e0 <wm_printf>
 8015130:	0400      	br      	0x8015130	// 8015130 <__assert_fail+0x1c>
 8015132:	1064      	lrw      	r3, 0x8015768	// 8015140 <__assert_fail+0x2c>
 8015134:	6c8f      	mov      	r2, r3
 8015136:	07f6      	br      	0x8015122	// 8015122 <__assert_fail+0xe>
 8015138:	08015688 	.long	0x08015688
 801513c:	08015698 	.long	0x08015698
 8015140:	08015768 	.long	0x08015768

08015144 <vTaskSwitchContext>:

#endif /* configUSE_APPLICATION_TASK_TAG */
/*-----------------------------------------------------------*/

void vTaskSwitchContext( void )
{
 8015144:	14d0      	push      	r15
    if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
 8015146:	1160      	lrw      	r3, 0x20003204	// 80151c4 <vTaskSwitchContext+0x80>
 8015148:	9360      	ld.w      	r3, (r3, 0x0)
 801514a:	e9230034 	bnez      	r3, 0x80151b2	// 80151b2 <vTaskSwitchContext+0x6e>
         * switch. */
        xYieldPending = pdTRUE;
    }
    else
    {
        xYieldPending = pdFALSE;
 801514e:	105f      	lrw      	r2, 0x2000320c	// 80151c8 <vTaskSwitchContext+0x84>
            }
        #endif

        /* Select a new task to run using either the generic C or port
         * optimised asm code. */
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 8015150:	ea8d001f 	lrw      	r13, 0x20003208	// 80151cc <vTaskSwitchContext+0x88>
 8015154:	3114      	movi      	r1, 20
        xYieldPending = pdFALSE;
 8015156:	b260      	st.w      	r3, (r2, 0x0)
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 8015158:	d86d2000 	ld.w      	r3, (r13, 0x0)
 801515c:	c4238420 	mult      	r0, r3, r1
 8015160:	105c      	lrw      	r2, 0x20002d18	// 80151d0 <vTaskSwitchContext+0x8c>
 8015162:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 8015166:	e900000a 	bez      	r0, 0x801517a	// 801517a <vTaskSwitchContext+0x36>
 801516a:	0411      	br      	0x801518c	// 801518c <vTaskSwitchContext+0x48>
 801516c:	2b00      	subi      	r3, 1
 801516e:	c4238420 	mult      	r0, r3, r1
 8015172:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 8015176:	e920000b 	bnez      	r0, 0x801518c	// 801518c <vTaskSwitchContext+0x48>
 801517a:	e923fff9 	bnez      	r3, 0x801516c	// 801516c <vTaskSwitchContext+0x28>
 801517e:	ea020be7 	movi      	r2, 3047
 8015182:	1035      	lrw      	r1, 0x8015730	// 80151d4 <vTaskSwitchContext+0x90>
 8015184:	1015      	lrw      	r0, 0x8015758	// 80151d8 <vTaskSwitchContext+0x94>
 8015186:	e3ffffad 	bsr      	0x80150e0	// 80150e0 <wm_printf>
 801518a:	0400      	br      	0x801518a	// 801518a <vTaskSwitchContext+0x46>
 801518c:	3014      	movi      	r0, 20
 801518e:	7c0c      	mult      	r0, r3
 8015190:	c402002c 	addu      	r12, r2, r0
 8015194:	2007      	addi      	r0, 8
 8015196:	d82c2001 	ld.w      	r1, (r12, 0x4)
 801519a:	6080      	addu      	r2, r0
 801519c:	9121      	ld.w      	r1, (r1, 0x4)
 801519e:	6486      	cmpne      	r1, r2
 80151a0:	dc2c2001 	st.w      	r1, (r12, 0x4)
 80151a4:	0c0b      	bf      	0x80151ba	// 80151ba <vTaskSwitchContext+0x76>
 80151a6:	104e      	lrw      	r2, 0x20002d14	// 80151dc <vTaskSwitchContext+0x98>
 80151a8:	9123      	ld.w      	r1, (r1, 0xc)
 80151aa:	b220      	st.w      	r1, (r2, 0x0)
 80151ac:	dc6d2000 	st.w      	r3, (r13, 0x0)
                 * for additional information. */
                _impure_ptr = &( pxCurrentTCB->xNewLib_reent );
            }
        #endif /* configUSE_NEWLIB_REENTRANT */
    }
}
 80151b0:	1490      	pop      	r15
        xYieldPending = pdTRUE;
 80151b2:	1066      	lrw      	r3, 0x2000320c	// 80151c8 <vTaskSwitchContext+0x84>
 80151b4:	3201      	movi      	r2, 1
 80151b6:	b340      	st.w      	r2, (r3, 0x0)
}
 80151b8:	1490      	pop      	r15
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 80151ba:	9121      	ld.w      	r1, (r1, 0x4)
 80151bc:	dc2c2001 	st.w      	r1, (r12, 0x4)
 80151c0:	07f3      	br      	0x80151a6	// 80151a6 <vTaskSwitchContext+0x62>
 80151c2:	0000      	.short	0x0000
 80151c4:	20003204 	.long	0x20003204
 80151c8:	2000320c 	.long	0x2000320c
 80151cc:	20003208 	.long	0x20003208
 80151d0:	20002d18 	.long	0x20002d18
 80151d4:	08015730 	.long	0x08015730
 80151d8:	08015758 	.long	0x08015758
 80151dc:	20002d14 	.long	0x20002d14
