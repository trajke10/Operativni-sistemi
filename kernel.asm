
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	81813103          	ld	sp,-2024(sp) # 8000c818 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7f1060ef          	jal	ra,8000700c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <trap>:
.extern timerHandler
.global trap
.align 4

trap:
j interruptSupervisor
    80001000:	0280006f          	j	80001028 <interruptSupervisor>
j timer
    80001004:	1240006f          	j	80001128 <timer>
addi a0,a0,0
    80001008:	00050513          	mv	a0,a0
addi a0,a0,0
    8000100c:	00050513          	mv	a0,a0
addi a0,a0,0
    80001010:	00050513          	mv	a0,a0
addi a0,a0,0
    80001014:	00050513          	mv	a0,a0
addi a0,a0,0
    80001018:	00050513          	mv	a0,a0
addi a0,a0,0
    8000101c:	00050513          	mv	a0,a0
addi a0,a0,0
    80001020:	00050513          	mv	a0,a0
j consoleHandle
    80001024:	20c0006f          	j	80001230 <consoleHandle>

0000000080001028 <interruptSupervisor>:

interruptSupervisor:
    addi sp,sp,-256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr
    8000102c:	00113423          	sd	ra,8(sp)
    80001030:	00213823          	sd	sp,16(sp)
    80001034:	00313c23          	sd	gp,24(sp)
    80001038:	02413023          	sd	tp,32(sp)
    8000103c:	02513423          	sd	t0,40(sp)
    80001040:	02613823          	sd	t1,48(sp)
    80001044:	02713c23          	sd	t2,56(sp)
    80001048:	04813023          	sd	s0,64(sp)
    8000104c:	04913423          	sd	s1,72(sp)
    80001050:	04b13c23          	sd	a1,88(sp)
    80001054:	06c13023          	sd	a2,96(sp)
    80001058:	06d13423          	sd	a3,104(sp)
    8000105c:	06e13823          	sd	a4,112(sp)
    80001060:	06f13c23          	sd	a5,120(sp)
    80001064:	09013023          	sd	a6,128(sp)
    80001068:	09113423          	sd	a7,136(sp)
    8000106c:	09213823          	sd	s2,144(sp)
    80001070:	09313c23          	sd	s3,152(sp)
    80001074:	0b413023          	sd	s4,160(sp)
    80001078:	0b513423          	sd	s5,168(sp)
    8000107c:	0b613823          	sd	s6,176(sp)
    80001080:	0b713c23          	sd	s7,184(sp)
    80001084:	0d813023          	sd	s8,192(sp)
    80001088:	0d913423          	sd	s9,200(sp)
    8000108c:	0da13823          	sd	s10,208(sp)
    80001090:	0db13c23          	sd	s11,216(sp)
    80001094:	0fc13023          	sd	t3,224(sp)
    80001098:	0fd13423          	sd	t4,232(sp)
    8000109c:	0fe13823          	sd	t5,240(sp)
    800010a0:	0ff13c23          	sd	t6,248(sp)

    call interruptHandler
    800010a4:	7b8020ef          	jal	ra,8000385c <interruptHandler>

    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    800010a8:	00813083          	ld	ra,8(sp)
    800010ac:	01013103          	ld	sp,16(sp)
    800010b0:	01813183          	ld	gp,24(sp)
    800010b4:	02013203          	ld	tp,32(sp)
    800010b8:	02813283          	ld	t0,40(sp)
    800010bc:	03013303          	ld	t1,48(sp)
    800010c0:	03813383          	ld	t2,56(sp)
    800010c4:	04013403          	ld	s0,64(sp)
    800010c8:	04813483          	ld	s1,72(sp)
    800010cc:	05813583          	ld	a1,88(sp)
    800010d0:	06013603          	ld	a2,96(sp)
    800010d4:	06813683          	ld	a3,104(sp)
    800010d8:	07013703          	ld	a4,112(sp)
    800010dc:	07813783          	ld	a5,120(sp)
    800010e0:	08013803          	ld	a6,128(sp)
    800010e4:	08813883          	ld	a7,136(sp)
    800010e8:	09013903          	ld	s2,144(sp)
    800010ec:	09813983          	ld	s3,152(sp)
    800010f0:	0a013a03          	ld	s4,160(sp)
    800010f4:	0a813a83          	ld	s5,168(sp)
    800010f8:	0b013b03          	ld	s6,176(sp)
    800010fc:	0b813b83          	ld	s7,184(sp)
    80001100:	0c013c03          	ld	s8,192(sp)
    80001104:	0c813c83          	ld	s9,200(sp)
    80001108:	0d013d03          	ld	s10,208(sp)
    8000110c:	0d813d83          	ld	s11,216(sp)
    80001110:	0e013e03          	ld	t3,224(sp)
    80001114:	0e813e83          	ld	t4,232(sp)
    80001118:	0f013f03          	ld	t5,240(sp)
    8000111c:	0f813f83          	ld	t6,248(sp)
    addi sp,sp,256
    80001120:	10010113          	addi	sp,sp,256

    sret
    80001124:	10200073          	sret

0000000080001128 <timer>:

timer:
    addi sp,sp,-256
    80001128:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr
    8000112c:	00113423          	sd	ra,8(sp)
    80001130:	00213823          	sd	sp,16(sp)
    80001134:	00313c23          	sd	gp,24(sp)
    80001138:	02413023          	sd	tp,32(sp)
    8000113c:	02513423          	sd	t0,40(sp)
    80001140:	02613823          	sd	t1,48(sp)
    80001144:	02713c23          	sd	t2,56(sp)
    80001148:	04813023          	sd	s0,64(sp)
    8000114c:	04913423          	sd	s1,72(sp)
    80001150:	04a13823          	sd	a0,80(sp)
    80001154:	04b13c23          	sd	a1,88(sp)
    80001158:	06c13023          	sd	a2,96(sp)
    8000115c:	06d13423          	sd	a3,104(sp)
    80001160:	06e13823          	sd	a4,112(sp)
    80001164:	06f13c23          	sd	a5,120(sp)
    80001168:	09013023          	sd	a6,128(sp)
    8000116c:	09113423          	sd	a7,136(sp)
    80001170:	09213823          	sd	s2,144(sp)
    80001174:	09313c23          	sd	s3,152(sp)
    80001178:	0b413023          	sd	s4,160(sp)
    8000117c:	0b513423          	sd	s5,168(sp)
    80001180:	0b613823          	sd	s6,176(sp)
    80001184:	0b713c23          	sd	s7,184(sp)
    80001188:	0d813023          	sd	s8,192(sp)
    8000118c:	0d913423          	sd	s9,200(sp)
    80001190:	0da13823          	sd	s10,208(sp)
    80001194:	0db13c23          	sd	s11,216(sp)
    80001198:	0fc13023          	sd	t3,224(sp)
    8000119c:	0fd13423          	sd	t4,232(sp)
    800011a0:	0fe13823          	sd	t5,240(sp)
    800011a4:	0ff13c23          	sd	t6,248(sp)

    call timerHandler
    800011a8:	2d9020ef          	jal	ra,80003c80 <timerHandler>

    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    800011ac:	00813083          	ld	ra,8(sp)
    800011b0:	01013103          	ld	sp,16(sp)
    800011b4:	01813183          	ld	gp,24(sp)
    800011b8:	02013203          	ld	tp,32(sp)
    800011bc:	02813283          	ld	t0,40(sp)
    800011c0:	03013303          	ld	t1,48(sp)
    800011c4:	03813383          	ld	t2,56(sp)
    800011c8:	04013403          	ld	s0,64(sp)
    800011cc:	04813483          	ld	s1,72(sp)
    800011d0:	05013503          	ld	a0,80(sp)
    800011d4:	05813583          	ld	a1,88(sp)
    800011d8:	06013603          	ld	a2,96(sp)
    800011dc:	06813683          	ld	a3,104(sp)
    800011e0:	07013703          	ld	a4,112(sp)
    800011e4:	07813783          	ld	a5,120(sp)
    800011e8:	08013803          	ld	a6,128(sp)
    800011ec:	08813883          	ld	a7,136(sp)
    800011f0:	09013903          	ld	s2,144(sp)
    800011f4:	09813983          	ld	s3,152(sp)
    800011f8:	0a013a03          	ld	s4,160(sp)
    800011fc:	0a813a83          	ld	s5,168(sp)
    80001200:	0b013b03          	ld	s6,176(sp)
    80001204:	0b813b83          	ld	s7,184(sp)
    80001208:	0c013c03          	ld	s8,192(sp)
    8000120c:	0c813c83          	ld	s9,200(sp)
    80001210:	0d013d03          	ld	s10,208(sp)
    80001214:	0d813d83          	ld	s11,216(sp)
    80001218:	0e013e03          	ld	t3,224(sp)
    8000121c:	0e813e83          	ld	t4,232(sp)
    80001220:	0f013f03          	ld	t5,240(sp)
    80001224:	0f813f83          	ld	t6,248(sp)
    addi sp,sp,256
    80001228:	10010113          	addi	sp,sp,256

    sret
    8000122c:	10200073          	sret

0000000080001230 <consoleHandle>:

consoleHandle:
    addi sp,sp,-256
    80001230:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr
    80001234:	00113423          	sd	ra,8(sp)
    80001238:	00213823          	sd	sp,16(sp)
    8000123c:	00313c23          	sd	gp,24(sp)
    80001240:	02413023          	sd	tp,32(sp)
    80001244:	02513423          	sd	t0,40(sp)
    80001248:	02613823          	sd	t1,48(sp)
    8000124c:	02713c23          	sd	t2,56(sp)
    80001250:	04813023          	sd	s0,64(sp)
    80001254:	04913423          	sd	s1,72(sp)
    80001258:	04a13823          	sd	a0,80(sp)
    8000125c:	04b13c23          	sd	a1,88(sp)
    80001260:	06c13023          	sd	a2,96(sp)
    80001264:	06d13423          	sd	a3,104(sp)
    80001268:	06e13823          	sd	a4,112(sp)
    8000126c:	06f13c23          	sd	a5,120(sp)
    80001270:	09013023          	sd	a6,128(sp)
    80001274:	09113423          	sd	a7,136(sp)
    80001278:	09213823          	sd	s2,144(sp)
    8000127c:	09313c23          	sd	s3,152(sp)
    80001280:	0b413023          	sd	s4,160(sp)
    80001284:	0b513423          	sd	s5,168(sp)
    80001288:	0b613823          	sd	s6,176(sp)
    8000128c:	0b713c23          	sd	s7,184(sp)
    80001290:	0d813023          	sd	s8,192(sp)
    80001294:	0d913423          	sd	s9,200(sp)
    80001298:	0da13823          	sd	s10,208(sp)
    8000129c:	0db13c23          	sd	s11,216(sp)
    800012a0:	0fc13023          	sd	t3,224(sp)
    800012a4:	0fd13423          	sd	t4,232(sp)
    800012a8:	0fe13823          	sd	t5,240(sp)
    800012ac:	0ff13c23          	sd	t6,248(sp)

    call consoleHandler
    800012b0:	14d020ef          	jal	ra,80003bfc <consoleHandler>

    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    800012b4:	00813083          	ld	ra,8(sp)
    800012b8:	01013103          	ld	sp,16(sp)
    800012bc:	01813183          	ld	gp,24(sp)
    800012c0:	02013203          	ld	tp,32(sp)
    800012c4:	02813283          	ld	t0,40(sp)
    800012c8:	03013303          	ld	t1,48(sp)
    800012cc:	03813383          	ld	t2,56(sp)
    800012d0:	04013403          	ld	s0,64(sp)
    800012d4:	04813483          	ld	s1,72(sp)
    800012d8:	05013503          	ld	a0,80(sp)
    800012dc:	05813583          	ld	a1,88(sp)
    800012e0:	06013603          	ld	a2,96(sp)
    800012e4:	06813683          	ld	a3,104(sp)
    800012e8:	07013703          	ld	a4,112(sp)
    800012ec:	07813783          	ld	a5,120(sp)
    800012f0:	08013803          	ld	a6,128(sp)
    800012f4:	08813883          	ld	a7,136(sp)
    800012f8:	09013903          	ld	s2,144(sp)
    800012fc:	09813983          	ld	s3,152(sp)
    80001300:	0a013a03          	ld	s4,160(sp)
    80001304:	0a813a83          	ld	s5,168(sp)
    80001308:	0b013b03          	ld	s6,176(sp)
    8000130c:	0b813b83          	ld	s7,184(sp)
    80001310:	0c013c03          	ld	s8,192(sp)
    80001314:	0c813c83          	ld	s9,200(sp)
    80001318:	0d013d03          	ld	s10,208(sp)
    8000131c:	0d813d83          	ld	s11,216(sp)
    80001320:	0e013e03          	ld	t3,224(sp)
    80001324:	0e813e83          	ld	t4,232(sp)
    80001328:	0f013f03          	ld	t5,240(sp)
    8000132c:	0f813f83          	ld	t6,248(sp)
    addi sp,sp,256
    80001330:	10010113          	addi	sp,sp,256

    80001334:	10200073          	sret

0000000080001338 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001338:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    8000133c:	00b29a63          	bne	t0,a1,80001350 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001340:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001344:	fe029ae3          	bnez	t0,80001338 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001348:	00000513          	li	a0,0
    jr ra                  # Return.
    8000134c:	00008067          	ret

0000000080001350 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001350:	00100513          	li	a0,1
    80001354:	00008067          	ret

0000000080001358 <pushRegisters>:
.global pushRegisters
.global popRegisters

pushRegisters:
    addi sp,sp,-256
    80001358:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index,\index*8(sp)
    .endr
    8000135c:	00313c23          	sd	gp,24(sp)
    80001360:	02413023          	sd	tp,32(sp)
    80001364:	02513423          	sd	t0,40(sp)
    80001368:	02613823          	sd	t1,48(sp)
    8000136c:	02713c23          	sd	t2,56(sp)
    80001370:	04813023          	sd	s0,64(sp)
    80001374:	04913423          	sd	s1,72(sp)
    80001378:	04a13823          	sd	a0,80(sp)
    8000137c:	04b13c23          	sd	a1,88(sp)
    80001380:	06c13023          	sd	a2,96(sp)
    80001384:	06d13423          	sd	a3,104(sp)
    80001388:	06e13823          	sd	a4,112(sp)
    8000138c:	06f13c23          	sd	a5,120(sp)
    80001390:	09013023          	sd	a6,128(sp)
    80001394:	09113423          	sd	a7,136(sp)
    80001398:	09213823          	sd	s2,144(sp)
    8000139c:	09313c23          	sd	s3,152(sp)
    800013a0:	0b413023          	sd	s4,160(sp)
    800013a4:	0b513423          	sd	s5,168(sp)
    800013a8:	0b613823          	sd	s6,176(sp)
    800013ac:	0b713c23          	sd	s7,184(sp)
    800013b0:	0d813023          	sd	s8,192(sp)
    800013b4:	0d913423          	sd	s9,200(sp)
    800013b8:	0da13823          	sd	s10,208(sp)
    800013bc:	0db13c23          	sd	s11,216(sp)
    800013c0:	0fc13023          	sd	t3,224(sp)
    800013c4:	0fd13423          	sd	t4,232(sp)
    800013c8:	0fe13823          	sd	t5,240(sp)
    800013cc:	0ff13c23          	sd	t6,248(sp)
    ret
    800013d0:	00008067          	ret

00000000800013d4 <popRegisters>:

popRegisters:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index,\index*8(sp)
    .endr
    800013d4:	01813183          	ld	gp,24(sp)
    800013d8:	02013203          	ld	tp,32(sp)
    800013dc:	02813283          	ld	t0,40(sp)
    800013e0:	03013303          	ld	t1,48(sp)
    800013e4:	03813383          	ld	t2,56(sp)
    800013e8:	04013403          	ld	s0,64(sp)
    800013ec:	04813483          	ld	s1,72(sp)
    800013f0:	05013503          	ld	a0,80(sp)
    800013f4:	05813583          	ld	a1,88(sp)
    800013f8:	06013603          	ld	a2,96(sp)
    800013fc:	06813683          	ld	a3,104(sp)
    80001400:	07013703          	ld	a4,112(sp)
    80001404:	07813783          	ld	a5,120(sp)
    80001408:	08013803          	ld	a6,128(sp)
    8000140c:	08813883          	ld	a7,136(sp)
    80001410:	09013903          	ld	s2,144(sp)
    80001414:	09813983          	ld	s3,152(sp)
    80001418:	0a013a03          	ld	s4,160(sp)
    8000141c:	0a813a83          	ld	s5,168(sp)
    80001420:	0b013b03          	ld	s6,176(sp)
    80001424:	0b813b83          	ld	s7,184(sp)
    80001428:	0c013c03          	ld	s8,192(sp)
    8000142c:	0c813c83          	ld	s9,200(sp)
    80001430:	0d013d03          	ld	s10,208(sp)
    80001434:	0d813d83          	ld	s11,216(sp)
    80001438:	0e013e03          	ld	t3,224(sp)
    8000143c:	0e813e83          	ld	t4,232(sp)
    80001440:	0f013f03          	ld	t5,240(sp)
    80001444:	0f813f83          	ld	t6,248(sp)
    addi sp,sp,256
    80001448:	10010113          	addi	sp,sp,256
    8000144c:	00008067          	ret

0000000080001450 <_Z9mem_allocm>:
#include "../lib/hw.h"
#include "../h/syscall_c.hpp"

void *mem_alloc(size_t size) {
    80001450:	ff010113          	addi	sp,sp,-16
    80001454:	00813423          	sd	s0,8(sp)
    80001458:	01010413          	addi	s0,sp,16
    size_t numOfBlocks=size/MEM_BLOCK_SIZE;
    8000145c:	00655793          	srli	a5,a0,0x6
    if(size%MEM_BLOCK_SIZE) numOfBlocks++;
    80001460:	03f57513          	andi	a0,a0,63
    80001464:	00050463          	beqz	a0,8000146c <_Z9mem_allocm+0x1c>
    80001468:	00178793          	addi	a5,a5,1
    uint64 code=0x01;
    __asm__ volatile("mv a1, %0" : : "r"(numOfBlocks));
    8000146c:	00078593          	mv	a1,a5
    __asm__ volatile("mv a0, %0" : : "r"(code));
    80001470:	00100793          	li	a5,1
    80001474:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001478:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    8000147c:	00050513          	mv	a0,a0
    return (void*) ret;
}
    80001480:	00813403          	ld	s0,8(sp)
    80001484:	01010113          	addi	sp,sp,16
    80001488:	00008067          	ret

000000008000148c <_Z8mem_freePv>:

int mem_free(void* addr) {
    8000148c:	ff010113          	addi	sp,sp,-16
    80001490:	00813423          	sd	s0,8(sp)
    80001494:	01010413          	addi	s0,sp,16
    uint64 code=0x02;
    __asm__ volatile("mv a1, %0" : : "r"(addr));
    80001498:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r"(code));
    8000149c:	00200793          	li	a5,2
    800014a0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800014a4:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800014a8:	00050513          	mv	a0,a0
    return (int)ret;
}
    800014ac:	0005051b          	sext.w	a0,a0
    800014b0:	00813403          	ld	s0,8(sp)
    800014b4:	01010113          	addi	sp,sp,16
    800014b8:	00008067          	ret

00000000800014bc <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(
        thread_t * handle,
        void(*start_routine)(void*),
        void* arg){
    800014bc:	ff010113          	addi	sp,sp,-16
    800014c0:	00813423          	sd	s0,8(sp)
    800014c4:	01010413          	addi	s0,sp,16
    uint64 code=0x11;
    __asm__ volatile("mv a3,%0": :"r"(arg));
    800014c8:	00060693          	mv	a3,a2
    __asm__ volatile("mv a2,%0": :"r"(start_routine));
    800014cc:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1,%0": :"r"(handle));
    800014d0:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0,%0": :"r"(code));
    800014d4:	01100793          	li	a5,17
    800014d8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800014dc:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0,a0": "=r"(ret));
    800014e0:	00050513          	mv	a0,a0
    return (int)ret;
}
    800014e4:	0005051b          	sext.w	a0,a0
    800014e8:	00813403          	ld	s0,8(sp)
    800014ec:	01010113          	addi	sp,sp,16
    800014f0:	00008067          	ret

00000000800014f4 <_Z11thread_exitv>:

int thread_exit(){
    800014f4:	ff010113          	addi	sp,sp,-16
    800014f8:	00813423          	sd	s0,8(sp)
    800014fc:	01010413          	addi	s0,sp,16
    uint64 code=0x12;
    __asm__ volatile("mv a0,%0": :"r"(code));
    80001500:	01200793          	li	a5,18
    80001504:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001508:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    8000150c:	00050513          	mv	a0,a0
    return (int) ret;
}
    80001510:	0005051b          	sext.w	a0,a0
    80001514:	00813403          	ld	s0,8(sp)
    80001518:	01010113          	addi	sp,sp,16
    8000151c:	00008067          	ret

0000000080001520 <_Z15thread_dispatchv>:

void thread_dispatch(){
    80001520:	ff010113          	addi	sp,sp,-16
    80001524:	00813423          	sd	s0,8(sp)
    80001528:	01010413          	addi	s0,sp,16
    uint64 code=0x13;
    __asm__ volatile("mv a0,%0": :"r"(code));
    8000152c:	01300793          	li	a5,19
    80001530:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001534:	00000073          	ecall
}
    80001538:	00813403          	ld	s0,8(sp)
    8000153c:	01010113          	addi	sp,sp,16
    80001540:	00008067          	ret

0000000080001544 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle){
    80001544:	ff010113          	addi	sp,sp,-16
    80001548:	00813423          	sd	s0,8(sp)
    8000154c:	01010413          	addi	s0,sp,16
    uint64 code=0x14;
    __asm__ volatile("mv a1,%0": :"r"(handle));
    80001550:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0,%0": :"r"(code));
    80001554:	01400793          	li	a5,20
    80001558:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000155c:	00000073          	ecall
}
    80001560:	00813403          	ld	s0,8(sp)
    80001564:	01010113          	addi	sp,sp,16
    80001568:	00008067          	ret

000000008000156c <_Z8sem_openPP3Semj>:

int sem_open(sem_t* handle, unsigned init){
    8000156c:	ff010113          	addi	sp,sp,-16
    80001570:	00813423          	sd	s0,8(sp)
    80001574:	01010413          	addi	s0,sp,16
    uint64 code=0x21;
    __asm__ volatile("mv a2,%0": :"r"(init));
    80001578:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1,%0": :"r"(handle));
    8000157c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0,%0": :"r"(code));
    80001580:	02100793          	li	a5,33
    80001584:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001588:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    8000158c:	00050513          	mv	a0,a0
    return (int)ret;
}
    80001590:	0005051b          	sext.w	a0,a0
    80001594:	00813403          	ld	s0,8(sp)
    80001598:	01010113          	addi	sp,sp,16
    8000159c:	00008067          	ret

00000000800015a0 <_Z9sem_closeP3Sem>:
int sem_close(sem_t handle){
    800015a0:	ff010113          	addi	sp,sp,-16
    800015a4:	00813423          	sd	s0,8(sp)
    800015a8:	01010413          	addi	s0,sp,16
    uint64 code=0x22;
    __asm__ volatile("mv a1,%0": :"r"(handle));
    800015ac:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0,%0": :"r"(code));
    800015b0:	02200793          	li	a5,34
    800015b4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800015b8:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    800015bc:	00050513          	mv	a0,a0
    return (int)ret;
}
    800015c0:	0005051b          	sext.w	a0,a0
    800015c4:	00813403          	ld	s0,8(sp)
    800015c8:	01010113          	addi	sp,sp,16
    800015cc:	00008067          	ret

00000000800015d0 <_Z8sem_waitP3Sem>:
int sem_wait(sem_t id){
    800015d0:	ff010113          	addi	sp,sp,-16
    800015d4:	00813423          	sd	s0,8(sp)
    800015d8:	01010413          	addi	s0,sp,16
    uint64 code=0x23;
    __asm__ volatile("mv a1,%0": :"r"(id));
    800015dc:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0,%0": :"r"(code));
    800015e0:	02300793          	li	a5,35
    800015e4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800015e8:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    800015ec:	00050513          	mv	a0,a0
    return (int)ret;
}
    800015f0:	0005051b          	sext.w	a0,a0
    800015f4:	00813403          	ld	s0,8(sp)
    800015f8:	01010113          	addi	sp,sp,16
    800015fc:	00008067          	ret

0000000080001600 <_Z10sem_signalP3Sem>:

int sem_signal(sem_t id){
    80001600:	ff010113          	addi	sp,sp,-16
    80001604:	00813423          	sd	s0,8(sp)
    80001608:	01010413          	addi	s0,sp,16
    uint64 code=0x24;
    __asm__ volatile("mv a1,%0": :"r"(id));
    8000160c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0,%0": :"r"(code));
    80001610:	02400793          	li	a5,36
    80001614:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001618:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    8000161c:	00050513          	mv	a0,a0
    return (int)ret;
}
    80001620:	0005051b          	sext.w	a0,a0
    80001624:	00813403          	ld	s0,8(sp)
    80001628:	01010113          	addi	sp,sp,16
    8000162c:	00008067          	ret

0000000080001630 <_Z10time_sleepm>:

int time_sleep(time_t t){
    80001630:	ff010113          	addi	sp,sp,-16
    80001634:	00813423          	sd	s0,8(sp)
    80001638:	01010413          	addi	s0,sp,16
    uint64 code=0x31;
    __asm__ volatile("mv a1,%0": :"r"(t));
    8000163c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0,%0": :"r"(code));
    80001640:	03100793          	li	a5,49
    80001644:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001648:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    8000164c:	00050513          	mv	a0,a0
    return (int)ret;
}
    80001650:	0005051b          	sext.w	a0,a0
    80001654:	00813403          	ld	s0,8(sp)
    80001658:	01010113          	addi	sp,sp,16
    8000165c:	00008067          	ret

0000000080001660 <_Z18changeToUserRegimev>:

void changeToUserRegime(){
    80001660:	ff010113          	addi	sp,sp,-16
    80001664:	00813423          	sd	s0,8(sp)
    80001668:	01010413          	addi	s0,sp,16
    uint64 code=0x50;
    __asm__ volatile("mv a0,%0": :"r"(code));
    8000166c:	05000793          	li	a5,80
    80001670:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001674:	00000073          	ecall
    uint64 a=0x50;
    return;
}
    80001678:	00813403          	ld	s0,8(sp)
    8000167c:	01010113          	addi	sp,sp,16
    80001680:	00008067          	ret

0000000080001684 <_Z4getcv>:

char getc(){
    80001684:	ff010113          	addi	sp,sp,-16
    80001688:	00813423          	sd	s0,8(sp)
    8000168c:	01010413          	addi	s0,sp,16
    uint64 code=0x41;
    __asm__ volatile("mv a0,%0": :"r"(code));
    80001690:	04100793          	li	a5,65
    80001694:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001698:	00000073          	ecall
    int ret=0;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    8000169c:	00050513          	mv	a0,a0
    return (char)ret;
}
    800016a0:	0ff57513          	andi	a0,a0,255
    800016a4:	00813403          	ld	s0,8(sp)
    800016a8:	01010113          	addi	sp,sp,16
    800016ac:	00008067          	ret

00000000800016b0 <_Z4putcc>:
void putc(char c){
    800016b0:	ff010113          	addi	sp,sp,-16
    800016b4:	00813423          	sd	s0,8(sp)
    800016b8:	01010413          	addi	s0,sp,16
    uint64 code=0x42;
    __asm__ volatile("mv a1,%0": :"r"(c));
    800016bc:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0,%0": :"r"(code));
    800016c0:	04200793          	li	a5,66
    800016c4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800016c8:	00000073          	ecall
}
    800016cc:	00813403          	ld	s0,8(sp)
    800016d0:	01010113          	addi	sp,sp,16
    800016d4:	00008067          	ret

00000000800016d8 <_ZN3Sem5blockEv>:
    }
    if(!id || id->closed) return -1;
    return 0;
}

void Sem::block() {
    800016d8:	fd010113          	addi	sp,sp,-48
    800016dc:	02113423          	sd	ra,40(sp)
    800016e0:	02813023          	sd	s0,32(sp)
    800016e4:	00913c23          	sd	s1,24(sp)
    800016e8:	01213823          	sd	s2,16(sp)
    800016ec:	01313423          	sd	s3,8(sp)
    800016f0:	03010413          	addi	s0,sp,48
    800016f4:	00050493          	mv	s1,a0
    TCB *t=TCB::running;
    800016f8:	0000b797          	auipc	a5,0xb
    800016fc:	1387b783          	ld	a5,312(a5) # 8000c830 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001700:	0007b903          	ld	s2,0(a5)
public:
    void* mem_alloc(size_t);
    int mem_free(void*);
    static MemAlloc& getAllocator(){
        static MemAlloc instance;
        if(!instance.flag){
    80001704:	0000b797          	auipc	a5,0xb
    80001708:	1847c783          	lbu	a5,388(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    8000170c:	04078a63          	beqz	a5,80001760 <_ZN3Sem5blockEv+0x88>
    Elem* newElem=(Elem*)MemAlloc::getAllocator().mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80001710:	00100593          	li	a1,1
    80001714:	0000b517          	auipc	a0,0xb
    80001718:	16c50513          	addi	a0,a0,364 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    8000171c:	00002097          	auipc	ra,0x2
    80001720:	e50080e7          	jalr	-432(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    newElem->thread=t;
    80001724:	01253023          	sd	s2,0(a0)
    newElem->next= nullptr;
    80001728:	00053423          	sd	zero,8(a0)
    if(!headBlocked){
    8000172c:	0084b783          	ld	a5,8(s1)
    80001730:	08078663          	beqz	a5,800017bc <_ZN3Sem5blockEv+0xe4>
        headBlocked=newElem;
    }else{
        newElem->next=headBlocked;
    80001734:	00f53423          	sd	a5,8(a0)
        headBlocked= newElem;
    80001738:	00a4b423          	sd	a0,8(s1)
    static void contextSwitch(Context* a,Context* b);
    static void wrapper();
public:
    static uint64 timeSliceCnt; // koliko se tekuca nit vec izvrsava
    static TCB* running;
    void setBlocked(bool b) {blocked=b;}
    8000173c:	00100793          	li	a5,1
    80001740:	02f90ca3          	sb	a5,57(s2)
    }
    t->setBlocked(true);
}
    80001744:	02813083          	ld	ra,40(sp)
    80001748:	02013403          	ld	s0,32(sp)
    8000174c:	01813483          	ld	s1,24(sp)
    80001750:	01013903          	ld	s2,16(sp)
    80001754:	00813983          	ld	s3,8(sp)
    80001758:	03010113          	addi	sp,sp,48
    8000175c:	00008067          	ret
            instance.flag=true;
    80001760:	0000b797          	auipc	a5,0xb
    80001764:	12078793          	addi	a5,a5,288 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80001768:	00100713          	li	a4,1
    8000176c:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80001770:	0000b697          	auipc	a3,0xb
    80001774:	0806b683          	ld	a3,128(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001778:	0006b703          	ld	a4,0(a3)
    8000177c:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80001780:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80001784:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80001788:	0000b717          	auipc	a4,0xb
    8000178c:	0b073703          	ld	a4,176(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001790:	00073503          	ld	a0,0(a4)
    80001794:	0006b703          	ld	a4,0(a3)
    80001798:	40e50533          	sub	a0,a0,a4
    8000179c:	40355513          	srai	a0,a0,0x3
    800017a0:	0007b983          	ld	s3,0(a5)
    800017a4:	00a9bc23          	sd	a0,24(s3)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    800017a8:	fe050513          	addi	a0,a0,-32
    800017ac:	00002097          	auipc	ra,0x2
    800017b0:	da4080e7          	jalr	-604(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800017b4:	00a9b823          	sd	a0,16(s3)
    800017b8:	f59ff06f          	j	80001710 <_ZN3Sem5blockEv+0x38>
        headBlocked=newElem;
    800017bc:	00a4b423          	sd	a0,8(s1)
    800017c0:	f7dff06f          	j	8000173c <_ZN3Sem5blockEv+0x64>

00000000800017c4 <_ZN3Sem9_sem_waitEPS_>:
    if(!id) return -1;
    800017c4:	06050063          	beqz	a0,80001824 <_ZN3Sem9_sem_waitEPS_+0x60>
int Sem::_sem_wait(Sem *id) {
    800017c8:	fe010113          	addi	sp,sp,-32
    800017cc:	00113c23          	sd	ra,24(sp)
    800017d0:	00813823          	sd	s0,16(sp)
    800017d4:	00913423          	sd	s1,8(sp)
    800017d8:	02010413          	addi	s0,sp,32
    800017dc:	00050493          	mv	s1,a0
    if(id->value--<=0){
    800017e0:	00052783          	lw	a5,0(a0)
    800017e4:	fff7871b          	addiw	a4,a5,-1
    800017e8:	00e52023          	sw	a4,0(a0)
    800017ec:	02f05263          	blez	a5,80001810 <_ZN3Sem9_sem_waitEPS_+0x4c>
    if(!id || id->closed) return -1;
    800017f0:	0044c783          	lbu	a5,4(s1)
    800017f4:	02079c63          	bnez	a5,8000182c <_ZN3Sem9_sem_waitEPS_+0x68>
    return 0;
    800017f8:	00000513          	li	a0,0
}
    800017fc:	01813083          	ld	ra,24(sp)
    80001800:	01013403          	ld	s0,16(sp)
    80001804:	00813483          	ld	s1,8(sp)
    80001808:	02010113          	addi	sp,sp,32
    8000180c:	00008067          	ret
        id->block();
    80001810:	00000097          	auipc	ra,0x0
    80001814:	ec8080e7          	jalr	-312(ra) # 800016d8 <_ZN3Sem5blockEv>
        TCB::_thread_dispatch();
    80001818:	00001097          	auipc	ra,0x1
    8000181c:	3fc080e7          	jalr	1020(ra) # 80002c14 <_ZN3TCB16_thread_dispatchEv>
    80001820:	fd1ff06f          	j	800017f0 <_ZN3Sem9_sem_waitEPS_+0x2c>
    if(!id) return -1;
    80001824:	fff00513          	li	a0,-1
}
    80001828:	00008067          	ret
    if(!id || id->closed) return -1;
    8000182c:	fff00513          	li	a0,-1
    80001830:	fcdff06f          	j	800017fc <_ZN3Sem9_sem_waitEPS_+0x38>

0000000080001834 <_ZN3Sem7unblockEv>:
        id->unblock();
    }
    return 0;
}

void Sem::unblock() {
    80001834:	fe010113          	addi	sp,sp,-32
    80001838:	00113c23          	sd	ra,24(sp)
    8000183c:	00813823          	sd	s0,16(sp)
    80001840:	00913423          	sd	s1,8(sp)
    80001844:	01213023          	sd	s2,0(sp)
    80001848:	02010413          	addi	s0,sp,32
    Elem* elem=headBlocked;
    8000184c:	00853483          	ld	s1,8(a0)
    headBlocked=headBlocked->next;
    80001850:	0084b783          	ld	a5,8(s1)
    80001854:	00f53423          	sd	a5,8(a0)
    elem->thread->setBlocked(false);
    80001858:	0004b783          	ld	a5,0(s1)
    8000185c:	02078ca3          	sb	zero,57(a5)
    Scheduler::put(elem->thread);
    80001860:	0004b503          	ld	a0,0(s1)
    80001864:	00001097          	auipc	ra,0x1
    80001868:	81c080e7          	jalr	-2020(ra) # 80002080 <_ZN9Scheduler3putEP3TCB>
        if(!instance.flag){
    8000186c:	0000b797          	auipc	a5,0xb
    80001870:	01c7c783          	lbu	a5,28(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80001874:	02078863          	beqz	a5,800018a4 <_ZN3Sem7unblockEv+0x70>
    MemAlloc::getAllocator().mem_free(elem);
    80001878:	00048593          	mv	a1,s1
    8000187c:	0000b517          	auipc	a0,0xb
    80001880:	00450513          	addi	a0,a0,4 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80001884:	00002097          	auipc	ra,0x2
    80001888:	ecc080e7          	jalr	-308(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
}
    8000188c:	01813083          	ld	ra,24(sp)
    80001890:	01013403          	ld	s0,16(sp)
    80001894:	00813483          	ld	s1,8(sp)
    80001898:	00013903          	ld	s2,0(sp)
    8000189c:	02010113          	addi	sp,sp,32
    800018a0:	00008067          	ret
            instance.flag=true;
    800018a4:	0000b797          	auipc	a5,0xb
    800018a8:	fdc78793          	addi	a5,a5,-36 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800018ac:	00100713          	li	a4,1
    800018b0:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    800018b4:	0000b697          	auipc	a3,0xb
    800018b8:	f3c6b683          	ld	a3,-196(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800018bc:	0006b703          	ld	a4,0(a3)
    800018c0:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    800018c4:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    800018c8:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    800018cc:	0000b717          	auipc	a4,0xb
    800018d0:	f6c73703          	ld	a4,-148(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    800018d4:	00073503          	ld	a0,0(a4)
    800018d8:	0006b703          	ld	a4,0(a3)
    800018dc:	40e50533          	sub	a0,a0,a4
    800018e0:	40355513          	srai	a0,a0,0x3
    800018e4:	0007b903          	ld	s2,0(a5)
    800018e8:	00a93c23          	sd	a0,24(s2)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    800018ec:	fe050513          	addi	a0,a0,-32
    800018f0:	00002097          	auipc	ra,0x2
    800018f4:	c60080e7          	jalr	-928(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800018f8:	00a93823          	sd	a0,16(s2)
    800018fc:	f7dff06f          	j	80001878 <_ZN3Sem7unblockEv+0x44>

0000000080001900 <_ZN3Sem11_sem_signalEPS_>:
    if(!id) return -1;
    80001900:	04050663          	beqz	a0,8000194c <_ZN3Sem11_sem_signalEPS_+0x4c>
    if(++id->value<=0){
    80001904:	00052783          	lw	a5,0(a0)
    80001908:	0017879b          	addiw	a5,a5,1
    8000190c:	0007871b          	sext.w	a4,a5
    80001910:	00f52023          	sw	a5,0(a0)
    80001914:	00e05663          	blez	a4,80001920 <_ZN3Sem11_sem_signalEPS_+0x20>
    return 0;
    80001918:	00000513          	li	a0,0
}
    8000191c:	00008067          	ret
int Sem::_sem_signal(Sem *id) {
    80001920:	ff010113          	addi	sp,sp,-16
    80001924:	00113423          	sd	ra,8(sp)
    80001928:	00813023          	sd	s0,0(sp)
    8000192c:	01010413          	addi	s0,sp,16
        id->unblock();
    80001930:	00000097          	auipc	ra,0x0
    80001934:	f04080e7          	jalr	-252(ra) # 80001834 <_ZN3Sem7unblockEv>
    return 0;
    80001938:	00000513          	li	a0,0
}
    8000193c:	00813083          	ld	ra,8(sp)
    80001940:	00013403          	ld	s0,0(sp)
    80001944:	01010113          	addi	sp,sp,16
    80001948:	00008067          	ret
    if(!id) return -1;
    8000194c:	fff00513          	li	a0,-1
    80001950:	00008067          	ret

0000000080001954 <_ZN3Sem10unblockAllEv>:

void Sem::unblockAll() {
    80001954:	fd010113          	addi	sp,sp,-48
    80001958:	02113423          	sd	ra,40(sp)
    8000195c:	02813023          	sd	s0,32(sp)
    80001960:	00913c23          	sd	s1,24(sp)
    80001964:	01213823          	sd	s2,16(sp)
    80001968:	01313423          	sd	s3,8(sp)
    8000196c:	03010413          	addi	s0,sp,48
    80001970:	00050493          	mv	s1,a0
    80001974:	0700006f          	j	800019e4 <_ZN3Sem10unblockAllEv+0x90>
            instance.flag=true;
    80001978:	0000b797          	auipc	a5,0xb
    8000197c:	f0878793          	addi	a5,a5,-248 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80001980:	00100713          	li	a4,1
    80001984:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80001988:	0000b697          	auipc	a3,0xb
    8000198c:	e686b683          	ld	a3,-408(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001990:	0006b703          	ld	a4,0(a3)
    80001994:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80001998:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    8000199c:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    800019a0:	0000b717          	auipc	a4,0xb
    800019a4:	e9873703          	ld	a4,-360(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    800019a8:	00073503          	ld	a0,0(a4)
    800019ac:	0006b703          	ld	a4,0(a3)
    800019b0:	40e50533          	sub	a0,a0,a4
    800019b4:	40355513          	srai	a0,a0,0x3
    800019b8:	0007b983          	ld	s3,0(a5)
    800019bc:	00a9bc23          	sd	a0,24(s3)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    800019c0:	fe050513          	addi	a0,a0,-32
    800019c4:	00002097          	auipc	ra,0x2
    800019c8:	b8c080e7          	jalr	-1140(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800019cc:	00a9b823          	sd	a0,16(s3)
    while(headBlocked){
        headBlocked->thread->setBlocked(false);
        Scheduler::put(headBlocked->thread);
        Elem* old=headBlocked;
        headBlocked=headBlocked->next;
        MemAlloc::getAllocator().mem_free(old);
    800019d0:	00090593          	mv	a1,s2
    800019d4:	0000b517          	auipc	a0,0xb
    800019d8:	eac50513          	addi	a0,a0,-340 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800019dc:	00002097          	auipc	ra,0x2
    800019e0:	d74080e7          	jalr	-652(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
    while(headBlocked){
    800019e4:	0084b783          	ld	a5,8(s1)
    800019e8:	02078c63          	beqz	a5,80001a20 <_ZN3Sem10unblockAllEv+0xcc>
        headBlocked->thread->setBlocked(false);
    800019ec:	0007b783          	ld	a5,0(a5)
    800019f0:	02078ca3          	sb	zero,57(a5)
        Scheduler::put(headBlocked->thread);
    800019f4:	0084b783          	ld	a5,8(s1)
    800019f8:	0007b503          	ld	a0,0(a5)
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	684080e7          	jalr	1668(ra) # 80002080 <_ZN9Scheduler3putEP3TCB>
        Elem* old=headBlocked;
    80001a04:	0084b903          	ld	s2,8(s1)
        headBlocked=headBlocked->next;
    80001a08:	00893783          	ld	a5,8(s2)
    80001a0c:	00f4b423          	sd	a5,8(s1)
        if(!instance.flag){
    80001a10:	0000b797          	auipc	a5,0xb
    80001a14:	e787c783          	lbu	a5,-392(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80001a18:	fa079ce3          	bnez	a5,800019d0 <_ZN3Sem10unblockAllEv+0x7c>
    80001a1c:	f5dff06f          	j	80001978 <_ZN3Sem10unblockAllEv+0x24>
    }
}
    80001a20:	02813083          	ld	ra,40(sp)
    80001a24:	02013403          	ld	s0,32(sp)
    80001a28:	01813483          	ld	s1,24(sp)
    80001a2c:	01013903          	ld	s2,16(sp)
    80001a30:	00813983          	ld	s3,8(sp)
    80001a34:	03010113          	addi	sp,sp,48
    80001a38:	00008067          	ret

0000000080001a3c <_ZN3Sem10_sem_closeEPS_>:
    if(!handle) return -1;
    80001a3c:	0c050263          	beqz	a0,80001b00 <_ZN3Sem10_sem_closeEPS_+0xc4>
int Sem::_sem_close(Sem*handle) {
    80001a40:	fe010113          	addi	sp,sp,-32
    80001a44:	00113c23          	sd	ra,24(sp)
    80001a48:	00813823          	sd	s0,16(sp)
    80001a4c:	00913423          	sd	s1,8(sp)
    80001a50:	01213023          	sd	s2,0(sp)
    80001a54:	02010413          	addi	s0,sp,32
    80001a58:	00050493          	mv	s1,a0
    handle->unblockAll();
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	ef8080e7          	jalr	-264(ra) # 80001954 <_ZN3Sem10unblockAllEv>
    handle->closed=true;
    80001a64:	00100793          	li	a5,1
    80001a68:	00f48223          	sb	a5,4(s1)
    80001a6c:	0000b797          	auipc	a5,0xb
    80001a70:	e1c7c783          	lbu	a5,-484(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80001a74:	02078863          	beqz	a5,80001aa4 <_ZN3Sem10_sem_closeEPS_+0x68>
    int status=MemAlloc::getAllocator().mem_free(handle);
    80001a78:	00048593          	mv	a1,s1
    80001a7c:	0000b517          	auipc	a0,0xb
    80001a80:	e0450513          	addi	a0,a0,-508 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80001a84:	00002097          	auipc	ra,0x2
    80001a88:	ccc080e7          	jalr	-820(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
}
    80001a8c:	01813083          	ld	ra,24(sp)
    80001a90:	01013403          	ld	s0,16(sp)
    80001a94:	00813483          	ld	s1,8(sp)
    80001a98:	00013903          	ld	s2,0(sp)
    80001a9c:	02010113          	addi	sp,sp,32
    80001aa0:	00008067          	ret
            instance.flag=true;
    80001aa4:	0000b797          	auipc	a5,0xb
    80001aa8:	ddc78793          	addi	a5,a5,-548 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80001aac:	00100713          	li	a4,1
    80001ab0:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80001ab4:	0000b697          	auipc	a3,0xb
    80001ab8:	d3c6b683          	ld	a3,-708(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001abc:	0006b703          	ld	a4,0(a3)
    80001ac0:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80001ac4:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80001ac8:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80001acc:	0000b717          	auipc	a4,0xb
    80001ad0:	d6c73703          	ld	a4,-660(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001ad4:	00073503          	ld	a0,0(a4)
    80001ad8:	0006b703          	ld	a4,0(a3)
    80001adc:	40e50533          	sub	a0,a0,a4
    80001ae0:	40355513          	srai	a0,a0,0x3
    80001ae4:	0007b903          	ld	s2,0(a5)
    80001ae8:	00a93c23          	sd	a0,24(s2)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80001aec:	fe050513          	addi	a0,a0,-32
    80001af0:	00002097          	auipc	ra,0x2
    80001af4:	a60080e7          	jalr	-1440(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80001af8:	00a93823          	sd	a0,16(s2)
    80001afc:	f7dff06f          	j	80001a78 <_ZN3Sem10_sem_closeEPS_+0x3c>
    if(!handle) return -1;
    80001b00:	fff00513          	li	a0,-1
}
    80001b04:	00008067          	ret

0000000080001b08 <_ZN3SemD1Ev>:

Sem::~Sem() {
    80001b08:	fe010113          	addi	sp,sp,-32
    80001b0c:	00113c23          	sd	ra,24(sp)
    80001b10:	00813823          	sd	s0,16(sp)
    80001b14:	00913423          	sd	s1,8(sp)
    80001b18:	02010413          	addi	s0,sp,32
    80001b1c:	00050493          	mv	s1,a0
    while(headBlocked){
    80001b20:	0084b503          	ld	a0,8(s1)
    80001b24:	02050463          	beqz	a0,80001b4c <_ZN3SemD1Ev+0x44>
        Elem* old=headBlocked;
        old->thread->setBlocked(false);
    80001b28:	00053783          	ld	a5,0(a0)
    80001b2c:	02078ca3          	sb	zero,57(a5)
        headBlocked=headBlocked->next;
    80001b30:	0084b783          	ld	a5,8(s1)
    80001b34:	0087b783          	ld	a5,8(a5)
    80001b38:	00f4b423          	sd	a5,8(s1)
        delete old;
    80001b3c:	fe0502e3          	beqz	a0,80001b20 <_ZN3SemD1Ev+0x18>
    80001b40:	00001097          	auipc	ra,0x1
    80001b44:	be0080e7          	jalr	-1056(ra) # 80002720 <_ZdlPv>
    80001b48:	fd9ff06f          	j	80001b20 <_ZN3SemD1Ev+0x18>
    }
}
    80001b4c:	01813083          	ld	ra,24(sp)
    80001b50:	01013403          	ld	s0,16(sp)
    80001b54:	00813483          	ld	s1,8(sp)
    80001b58:	02010113          	addi	sp,sp,32
    80001b5c:	00008067          	ret

0000000080001b60 <_ZN3Sem9_sem_openEPPS_j>:
int Sem::_sem_open(Sem **handle, unsigned init) {
    80001b60:	fc010113          	addi	sp,sp,-64
    80001b64:	02113c23          	sd	ra,56(sp)
    80001b68:	02813823          	sd	s0,48(sp)
    80001b6c:	02913423          	sd	s1,40(sp)
    80001b70:	03213023          	sd	s2,32(sp)
    80001b74:	01313c23          	sd	s3,24(sp)
    80001b78:	04010413          	addi	s0,sp,64
    80001b7c:	00050993          	mv	s3,a0
    80001b80:	00058913          	mv	s2,a1
        if(!instance.flag){
    80001b84:	0000b797          	auipc	a5,0xb
    80001b88:	d047c783          	lbu	a5,-764(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80001b8c:	06078663          	beqz	a5,80001bf8 <_ZN3Sem9_sem_openEPPS_j+0x98>
    Sem* s=(Sem*)MemAlloc::getAllocator().mem_alloc((sizeof(Sem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80001b90:	00100593          	li	a1,1
    80001b94:	0000b517          	auipc	a0,0xb
    80001b98:	cec50513          	addi	a0,a0,-788 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80001b9c:	00002097          	auipc	ra,0x2
    80001ba0:	9d0080e7          	jalr	-1584(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    80001ba4:	00050493          	mv	s1,a0
    if(!s)return -1;
    80001ba8:	0a050663          	beqz	a0,80001c54 <_ZN3Sem9_sem_openEPPS_j+0xf4>
        //Elem(TCB *t):thread(t),next(nullptr){}
    };
    int value;
    bool closed=false;
    Elem* headBlocked= nullptr;
    Sem(int val):value(val){}
    80001bac:	fd242023          	sw	s2,-64(s0)
    80001bb0:	fc040223          	sb	zero,-60(s0)
    80001bb4:	fc043423          	sd	zero,-56(s0)
    *s=Sem((int)init);
    80001bb8:	fc043783          	ld	a5,-64(s0)
    80001bbc:	00f53023          	sd	a5,0(a0)
    80001bc0:	fc843783          	ld	a5,-56(s0)
    80001bc4:	00f53423          	sd	a5,8(a0)
    80001bc8:	fc040513          	addi	a0,s0,-64
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	f3c080e7          	jalr	-196(ra) # 80001b08 <_ZN3SemD1Ev>
    *handle=s;
    80001bd4:	0099b023          	sd	s1,0(s3)
    return 0;
    80001bd8:	00000513          	li	a0,0
}
    80001bdc:	03813083          	ld	ra,56(sp)
    80001be0:	03013403          	ld	s0,48(sp)
    80001be4:	02813483          	ld	s1,40(sp)
    80001be8:	02013903          	ld	s2,32(sp)
    80001bec:	01813983          	ld	s3,24(sp)
    80001bf0:	04010113          	addi	sp,sp,64
    80001bf4:	00008067          	ret
            instance.flag=true;
    80001bf8:	0000b717          	auipc	a4,0xb
    80001bfc:	c8870713          	addi	a4,a4,-888 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80001c00:	00100793          	li	a5,1
    80001c04:	00f70423          	sb	a5,8(a4)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80001c08:	0000b697          	auipc	a3,0xb
    80001c0c:	be86b683          	ld	a3,-1048(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001c10:	0006b783          	ld	a5,0(a3)
    80001c14:	00f73023          	sd	a5,0(a4)
            instance.headFree->next= nullptr;
    80001c18:	0007b423          	sd	zero,8(a5)
            instance.headFree->prev= nullptr;
    80001c1c:	0007b023          	sd	zero,0(a5)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80001c20:	0000b797          	auipc	a5,0xb
    80001c24:	c187b783          	ld	a5,-1000(a5) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001c28:	0007b783          	ld	a5,0(a5)
    80001c2c:	0006b503          	ld	a0,0(a3)
    80001c30:	40a787b3          	sub	a5,a5,a0
    80001c34:	4037d793          	srai	a5,a5,0x3
    80001c38:	00073483          	ld	s1,0(a4)
    80001c3c:	00f4bc23          	sd	a5,24(s1)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80001c40:	fe078513          	addi	a0,a5,-32
    80001c44:	00002097          	auipc	ra,0x2
    80001c48:	90c080e7          	jalr	-1780(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80001c4c:	00a4b823          	sd	a0,16(s1)
    80001c50:	f41ff06f          	j	80001b90 <_ZN3Sem9_sem_openEPPS_j+0x30>
    if(!s)return -1;
    80001c54:	fff00513          	li	a0,-1
    80001c58:	f85ff06f          	j	80001bdc <_ZN3Sem9_sem_openEPPS_j+0x7c>

0000000080001c5c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80001c5c:	fe010113          	addi	sp,sp,-32
    80001c60:	00113c23          	sd	ra,24(sp)
    80001c64:	00813823          	sd	s0,16(sp)
    80001c68:	00913423          	sd	s1,8(sp)
    80001c6c:	02010413          	addi	s0,sp,32
    80001c70:	00050493          	mv	s1,a0
    LOCK();
    80001c74:	00100613          	li	a2,1
    80001c78:	00000593          	li	a1,0
    80001c7c:	0000b517          	auipc	a0,0xb
    80001c80:	c1450513          	addi	a0,a0,-1004 # 8000c890 <lockPrint>
    80001c84:	fffff097          	auipc	ra,0xfffff
    80001c88:	6b4080e7          	jalr	1716(ra) # 80001338 <copy_and_swap>
    80001c8c:	00050863          	beqz	a0,80001c9c <_Z11printStringPKc+0x40>
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	890080e7          	jalr	-1904(ra) # 80001520 <_Z15thread_dispatchv>
    80001c98:	fddff06f          	j	80001c74 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001c9c:	0004c503          	lbu	a0,0(s1)
    80001ca0:	00050a63          	beqz	a0,80001cb4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	a0c080e7          	jalr	-1524(ra) # 800016b0 <_Z4putcc>
        string++;
    80001cac:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001cb0:	fedff06f          	j	80001c9c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80001cb4:	00000613          	li	a2,0
    80001cb8:	00100593          	li	a1,1
    80001cbc:	0000b517          	auipc	a0,0xb
    80001cc0:	bd450513          	addi	a0,a0,-1068 # 8000c890 <lockPrint>
    80001cc4:	fffff097          	auipc	ra,0xfffff
    80001cc8:	674080e7          	jalr	1652(ra) # 80001338 <copy_and_swap>
    80001ccc:	fe0514e3          	bnez	a0,80001cb4 <_Z11printStringPKc+0x58>
}
    80001cd0:	01813083          	ld	ra,24(sp)
    80001cd4:	01013403          	ld	s0,16(sp)
    80001cd8:	00813483          	ld	s1,8(sp)
    80001cdc:	02010113          	addi	sp,sp,32
    80001ce0:	00008067          	ret

0000000080001ce4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001ce4:	fd010113          	addi	sp,sp,-48
    80001ce8:	02113423          	sd	ra,40(sp)
    80001cec:	02813023          	sd	s0,32(sp)
    80001cf0:	00913c23          	sd	s1,24(sp)
    80001cf4:	01213823          	sd	s2,16(sp)
    80001cf8:	01313423          	sd	s3,8(sp)
    80001cfc:	01413023          	sd	s4,0(sp)
    80001d00:	03010413          	addi	s0,sp,48
    80001d04:	00050993          	mv	s3,a0
    80001d08:	00058a13          	mv	s4,a1
    LOCK();
    80001d0c:	00100613          	li	a2,1
    80001d10:	00000593          	li	a1,0
    80001d14:	0000b517          	auipc	a0,0xb
    80001d18:	b7c50513          	addi	a0,a0,-1156 # 8000c890 <lockPrint>
    80001d1c:	fffff097          	auipc	ra,0xfffff
    80001d20:	61c080e7          	jalr	1564(ra) # 80001338 <copy_and_swap>
    80001d24:	00050863          	beqz	a0,80001d34 <_Z9getStringPci+0x50>
    80001d28:	fffff097          	auipc	ra,0xfffff
    80001d2c:	7f8080e7          	jalr	2040(ra) # 80001520 <_Z15thread_dispatchv>
    80001d30:	fddff06f          	j	80001d0c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80001d34:	00000913          	li	s2,0
    80001d38:	00090493          	mv	s1,s2
    80001d3c:	0019091b          	addiw	s2,s2,1
    80001d40:	03495a63          	bge	s2,s4,80001d74 <_Z9getStringPci+0x90>
        cc = getc();
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	940080e7          	jalr	-1728(ra) # 80001684 <_Z4getcv>
        if(cc < 1)
    80001d4c:	02050463          	beqz	a0,80001d74 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80001d50:	009984b3          	add	s1,s3,s1
    80001d54:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001d58:	00a00793          	li	a5,10
    80001d5c:	00f50a63          	beq	a0,a5,80001d70 <_Z9getStringPci+0x8c>
    80001d60:	00d00793          	li	a5,13
    80001d64:	fcf51ae3          	bne	a0,a5,80001d38 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80001d68:	00090493          	mv	s1,s2
    80001d6c:	0080006f          	j	80001d74 <_Z9getStringPci+0x90>
    80001d70:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80001d74:	009984b3          	add	s1,s3,s1
    80001d78:	00048023          	sb	zero,0(s1)
    UNLOCK();
    80001d7c:	00000613          	li	a2,0
    80001d80:	00100593          	li	a1,1
    80001d84:	0000b517          	auipc	a0,0xb
    80001d88:	b0c50513          	addi	a0,a0,-1268 # 8000c890 <lockPrint>
    80001d8c:	fffff097          	auipc	ra,0xfffff
    80001d90:	5ac080e7          	jalr	1452(ra) # 80001338 <copy_and_swap>
    80001d94:	fe0514e3          	bnez	a0,80001d7c <_Z9getStringPci+0x98>
    return buf;
}
    80001d98:	00098513          	mv	a0,s3
    80001d9c:	02813083          	ld	ra,40(sp)
    80001da0:	02013403          	ld	s0,32(sp)
    80001da4:	01813483          	ld	s1,24(sp)
    80001da8:	01013903          	ld	s2,16(sp)
    80001dac:	00813983          	ld	s3,8(sp)
    80001db0:	00013a03          	ld	s4,0(sp)
    80001db4:	03010113          	addi	sp,sp,48
    80001db8:	00008067          	ret

0000000080001dbc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001dbc:	ff010113          	addi	sp,sp,-16
    80001dc0:	00813423          	sd	s0,8(sp)
    80001dc4:	01010413          	addi	s0,sp,16
    80001dc8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001dcc:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001dd0:	0006c603          	lbu	a2,0(a3)
    80001dd4:	fd06071b          	addiw	a4,a2,-48
    80001dd8:	0ff77713          	andi	a4,a4,255
    80001ddc:	00900793          	li	a5,9
    80001de0:	02e7e063          	bltu	a5,a4,80001e00 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001de4:	0025179b          	slliw	a5,a0,0x2
    80001de8:	00a787bb          	addw	a5,a5,a0
    80001dec:	0017979b          	slliw	a5,a5,0x1
    80001df0:	00168693          	addi	a3,a3,1
    80001df4:	00c787bb          	addw	a5,a5,a2
    80001df8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001dfc:	fd5ff06f          	j	80001dd0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001e00:	00813403          	ld	s0,8(sp)
    80001e04:	01010113          	addi	sp,sp,16
    80001e08:	00008067          	ret

0000000080001e0c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001e0c:	fc010113          	addi	sp,sp,-64
    80001e10:	02113c23          	sd	ra,56(sp)
    80001e14:	02813823          	sd	s0,48(sp)
    80001e18:	02913423          	sd	s1,40(sp)
    80001e1c:	03213023          	sd	s2,32(sp)
    80001e20:	01313c23          	sd	s3,24(sp)
    80001e24:	04010413          	addi	s0,sp,64
    80001e28:	00050493          	mv	s1,a0
    80001e2c:	00058913          	mv	s2,a1
    80001e30:	00060993          	mv	s3,a2
    LOCK();
    80001e34:	00100613          	li	a2,1
    80001e38:	00000593          	li	a1,0
    80001e3c:	0000b517          	auipc	a0,0xb
    80001e40:	a5450513          	addi	a0,a0,-1452 # 8000c890 <lockPrint>
    80001e44:	fffff097          	auipc	ra,0xfffff
    80001e48:	4f4080e7          	jalr	1268(ra) # 80001338 <copy_and_swap>
    80001e4c:	00050863          	beqz	a0,80001e5c <_Z8printIntiii+0x50>
    80001e50:	fffff097          	auipc	ra,0xfffff
    80001e54:	6d0080e7          	jalr	1744(ra) # 80001520 <_Z15thread_dispatchv>
    80001e58:	fddff06f          	j	80001e34 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001e5c:	00098463          	beqz	s3,80001e64 <_Z8printIntiii+0x58>
    80001e60:	0804c463          	bltz	s1,80001ee8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001e64:	0004851b          	sext.w	a0,s1
    neg = 0;
    80001e68:	00000593          	li	a1,0
    }

    i = 0;
    80001e6c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001e70:	0009079b          	sext.w	a5,s2
    80001e74:	0325773b          	remuw	a4,a0,s2
    80001e78:	00048613          	mv	a2,s1
    80001e7c:	0014849b          	addiw	s1,s1,1
    80001e80:	02071693          	slli	a3,a4,0x20
    80001e84:	0206d693          	srli	a3,a3,0x20
    80001e88:	0000a717          	auipc	a4,0xa
    80001e8c:	71870713          	addi	a4,a4,1816 # 8000c5a0 <digits>
    80001e90:	00d70733          	add	a4,a4,a3
    80001e94:	00074683          	lbu	a3,0(a4)
    80001e98:	fd040713          	addi	a4,s0,-48
    80001e9c:	00c70733          	add	a4,a4,a2
    80001ea0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001ea4:	0005071b          	sext.w	a4,a0
    80001ea8:	0325553b          	divuw	a0,a0,s2
    80001eac:	fcf772e3          	bgeu	a4,a5,80001e70 <_Z8printIntiii+0x64>
    if(neg)
    80001eb0:	00058c63          	beqz	a1,80001ec8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80001eb4:	fd040793          	addi	a5,s0,-48
    80001eb8:	009784b3          	add	s1,a5,s1
    80001ebc:	02d00793          	li	a5,45
    80001ec0:	fef48823          	sb	a5,-16(s1)
    80001ec4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001ec8:	fff4849b          	addiw	s1,s1,-1
    80001ecc:	0204c463          	bltz	s1,80001ef4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80001ed0:	fd040793          	addi	a5,s0,-48
    80001ed4:	009787b3          	add	a5,a5,s1
    80001ed8:	ff07c503          	lbu	a0,-16(a5)
    80001edc:	fffff097          	auipc	ra,0xfffff
    80001ee0:	7d4080e7          	jalr	2004(ra) # 800016b0 <_Z4putcc>
    80001ee4:	fe5ff06f          	j	80001ec8 <_Z8printIntiii+0xbc>
        x = -xx;
    80001ee8:	4090053b          	negw	a0,s1
        neg = 1;
    80001eec:	00100593          	li	a1,1
        x = -xx;
    80001ef0:	f7dff06f          	j	80001e6c <_Z8printIntiii+0x60>

    UNLOCK();
    80001ef4:	00000613          	li	a2,0
    80001ef8:	00100593          	li	a1,1
    80001efc:	0000b517          	auipc	a0,0xb
    80001f00:	99450513          	addi	a0,a0,-1644 # 8000c890 <lockPrint>
    80001f04:	fffff097          	auipc	ra,0xfffff
    80001f08:	434080e7          	jalr	1076(ra) # 80001338 <copy_and_swap>
    80001f0c:	fe0514e3          	bnez	a0,80001ef4 <_Z8printIntiii+0xe8>
    80001f10:	03813083          	ld	ra,56(sp)
    80001f14:	03013403          	ld	s0,48(sp)
    80001f18:	02813483          	ld	s1,40(sp)
    80001f1c:	02013903          	ld	s2,32(sp)
    80001f20:	01813983          	ld	s3,24(sp)
    80001f24:	04010113          	addi	sp,sp,64
    80001f28:	00008067          	ret

0000000080001f2c <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "../test/System_Mode_test.hpp"

#endif

void userMain() {
    80001f2c:	fe010113          	addi	sp,sp,-32
    80001f30:	00113c23          	sd	ra,24(sp)
    80001f34:	00813823          	sd	s0,16(sp)
    80001f38:	00913423          	sd	s1,8(sp)
    80001f3c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80001f40:	00008517          	auipc	a0,0x8
    80001f44:	0e050513          	addi	a0,a0,224 # 8000a020 <CONSOLE_STATUS+0x10>
    80001f48:	00000097          	auipc	ra,0x0
    80001f4c:	d14080e7          	jalr	-748(ra) # 80001c5c <_Z11printStringPKc>
    int test = getc() - '0';
    80001f50:	fffff097          	auipc	ra,0xfffff
    80001f54:	734080e7          	jalr	1844(ra) # 80001684 <_Z4getcv>
    80001f58:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80001f5c:	fffff097          	auipc	ra,0xfffff
    80001f60:	728080e7          	jalr	1832(ra) # 80001684 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80001f64:	00700793          	li	a5,7
    80001f68:	1097e263          	bltu	a5,s1,8000206c <_Z8userMainv+0x140>
    80001f6c:	00249493          	slli	s1,s1,0x2
    80001f70:	00008717          	auipc	a4,0x8
    80001f74:	30870713          	addi	a4,a4,776 # 8000a278 <CONSOLE_STATUS+0x268>
    80001f78:	00e484b3          	add	s1,s1,a4
    80001f7c:	0004a783          	lw	a5,0(s1)
    80001f80:	00e787b3          	add	a5,a5,a4
    80001f84:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80001f88:	00004097          	auipc	ra,0x4
    80001f8c:	8c0080e7          	jalr	-1856(ra) # 80005848 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80001f90:	00008517          	auipc	a0,0x8
    80001f94:	0b050513          	addi	a0,a0,176 # 8000a040 <CONSOLE_STATUS+0x30>
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	cc4080e7          	jalr	-828(ra) # 80001c5c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80001fa0:	01813083          	ld	ra,24(sp)
    80001fa4:	01013403          	ld	s0,16(sp)
    80001fa8:	00813483          	ld	s1,8(sp)
    80001fac:	02010113          	addi	sp,sp,32
    80001fb0:	00008067          	ret
            Threads_CPP_API_test();
    80001fb4:	00002097          	auipc	ra,0x2
    80001fb8:	774080e7          	jalr	1908(ra) # 80004728 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80001fbc:	00008517          	auipc	a0,0x8
    80001fc0:	0c450513          	addi	a0,a0,196 # 8000a080 <CONSOLE_STATUS+0x70>
    80001fc4:	00000097          	auipc	ra,0x0
    80001fc8:	c98080e7          	jalr	-872(ra) # 80001c5c <_Z11printStringPKc>
            break;
    80001fcc:	fd5ff06f          	j	80001fa0 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80001fd0:	00002097          	auipc	ra,0x2
    80001fd4:	fac080e7          	jalr	-84(ra) # 80003f7c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80001fd8:	00008517          	auipc	a0,0x8
    80001fdc:	0e850513          	addi	a0,a0,232 # 8000a0c0 <CONSOLE_STATUS+0xb0>
    80001fe0:	00000097          	auipc	ra,0x0
    80001fe4:	c7c080e7          	jalr	-900(ra) # 80001c5c <_Z11printStringPKc>
            break;
    80001fe8:	fb9ff06f          	j	80001fa0 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80001fec:	00004097          	auipc	ra,0x4
    80001ff0:	bb0080e7          	jalr	-1104(ra) # 80005b9c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80001ff4:	00008517          	auipc	a0,0x8
    80001ff8:	11c50513          	addi	a0,a0,284 # 8000a110 <CONSOLE_STATUS+0x100>
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	c60080e7          	jalr	-928(ra) # 80001c5c <_Z11printStringPKc>
            break;
    80002004:	f9dff06f          	j	80001fa0 <_Z8userMainv+0x74>
            testSleeping();
    80002008:	00004097          	auipc	ra,0x4
    8000200c:	674080e7          	jalr	1652(ra) # 8000667c <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80002010:	00008517          	auipc	a0,0x8
    80002014:	15850513          	addi	a0,a0,344 # 8000a168 <CONSOLE_STATUS+0x158>
    80002018:	00000097          	auipc	ra,0x0
    8000201c:	c44080e7          	jalr	-956(ra) # 80001c5c <_Z11printStringPKc>
            break;
    80002020:	f81ff06f          	j	80001fa0 <_Z8userMainv+0x74>
            testConsumerProducer();
    80002024:	00003097          	auipc	ra,0x3
    80002028:	bc4080e7          	jalr	-1084(ra) # 80004be8 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    8000202c:	00008517          	auipc	a0,0x8
    80002030:	16c50513          	addi	a0,a0,364 # 8000a198 <CONSOLE_STATUS+0x188>
    80002034:	00000097          	auipc	ra,0x0
    80002038:	c28080e7          	jalr	-984(ra) # 80001c5c <_Z11printStringPKc>
            break;
    8000203c:	f65ff06f          	j	80001fa0 <_Z8userMainv+0x74>
            System_Mode_test();
    80002040:	00005097          	auipc	ra,0x5
    80002044:	bb0080e7          	jalr	-1104(ra) # 80006bf0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80002048:	00008517          	auipc	a0,0x8
    8000204c:	19050513          	addi	a0,a0,400 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80002050:	00000097          	auipc	ra,0x0
    80002054:	c0c080e7          	jalr	-1012(ra) # 80001c5c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80002058:	00008517          	auipc	a0,0x8
    8000205c:	1a050513          	addi	a0,a0,416 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80002060:	00000097          	auipc	ra,0x0
    80002064:	bfc080e7          	jalr	-1028(ra) # 80001c5c <_Z11printStringPKc>
            break;
    80002068:	f39ff06f          	j	80001fa0 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000206c:	00008517          	auipc	a0,0x8
    80002070:	1e450513          	addi	a0,a0,484 # 8000a250 <CONSOLE_STATUS+0x240>
    80002074:	00000097          	auipc	ra,0x0
    80002078:	be8080e7          	jalr	-1048(ra) # 80001c5c <_Z11printStringPKc>
    8000207c:	f25ff06f          	j	80001fa0 <_Z8userMainv+0x74>

0000000080002080 <_ZN9Scheduler3putEP3TCB>:

#include "../h/Scheduler.h"

Elem* Scheduler::head=nullptr;

void Scheduler::put(TCB *t) {
    80002080:	fe010113          	addi	sp,sp,-32
    80002084:	00113c23          	sd	ra,24(sp)
    80002088:	00813823          	sd	s0,16(sp)
    8000208c:	00913423          	sd	s1,8(sp)
    80002090:	01213023          	sd	s2,0(sp)
    80002094:	02010413          	addi	s0,sp,32
    80002098:	00050493          	mv	s1,a0
        if(!instance.flag){
    8000209c:	0000a797          	auipc	a5,0xa
    800020a0:	7ec7c783          	lbu	a5,2028(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    800020a4:	04078a63          	beqz	a5,800020f8 <_ZN9Scheduler3putEP3TCB+0x78>
    Elem* novi=(Elem*)MemAlloc::getAllocator().mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    800020a8:	00100593          	li	a1,1
    800020ac:	0000a517          	auipc	a0,0xa
    800020b0:	7d450513          	addi	a0,a0,2004 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800020b4:	00001097          	auipc	ra,0x1
    800020b8:	4b8080e7          	jalr	1208(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    novi->thread=t;
    800020bc:	00953023          	sd	s1,0(a0)
    novi->next=nullptr;
    800020c0:	00053423          	sd	zero,8(a0)
    if(!head){
    800020c4:	0000a797          	auipc	a5,0xa
    800020c8:	7d47b783          	ld	a5,2004(a5) # 8000c898 <_ZN9Scheduler4headE>
    800020cc:	08078463          	beqz	a5,80002154 <_ZN9Scheduler3putEP3TCB+0xd4>
        head=novi;
    }else{
        Elem* tek;
        for(tek=head;tek->next;tek=tek->next);
    800020d0:	00078713          	mv	a4,a5
    800020d4:	0087b783          	ld	a5,8(a5)
    800020d8:	fe079ce3          	bnez	a5,800020d0 <_ZN9Scheduler3putEP3TCB+0x50>
        tek->next=novi;
    800020dc:	00a73423          	sd	a0,8(a4)
    }
}
    800020e0:	01813083          	ld	ra,24(sp)
    800020e4:	01013403          	ld	s0,16(sp)
    800020e8:	00813483          	ld	s1,8(sp)
    800020ec:	00013903          	ld	s2,0(sp)
    800020f0:	02010113          	addi	sp,sp,32
    800020f4:	00008067          	ret
            instance.flag=true;
    800020f8:	0000a797          	auipc	a5,0xa
    800020fc:	78878793          	addi	a5,a5,1928 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002100:	00100713          	li	a4,1
    80002104:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80002108:	0000a697          	auipc	a3,0xa
    8000210c:	6e86b683          	ld	a3,1768(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002110:	0006b703          	ld	a4,0(a3)
    80002114:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80002118:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    8000211c:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80002120:	0000a717          	auipc	a4,0xa
    80002124:	71873703          	ld	a4,1816(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002128:	00073503          	ld	a0,0(a4)
    8000212c:	0006b703          	ld	a4,0(a3)
    80002130:	40e50533          	sub	a0,a0,a4
    80002134:	40355513          	srai	a0,a0,0x3
    80002138:	0007b903          	ld	s2,0(a5)
    8000213c:	00a93c23          	sd	a0,24(s2)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80002140:	fe050513          	addi	a0,a0,-32
    80002144:	00001097          	auipc	ra,0x1
    80002148:	40c080e7          	jalr	1036(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    8000214c:	00a93823          	sd	a0,16(s2)
    80002150:	f59ff06f          	j	800020a8 <_ZN9Scheduler3putEP3TCB+0x28>
        head=novi;
    80002154:	0000a797          	auipc	a5,0xa
    80002158:	74a7b223          	sd	a0,1860(a5) # 8000c898 <_ZN9Scheduler4headE>
    8000215c:	f85ff06f          	j	800020e0 <_ZN9Scheduler3putEP3TCB+0x60>

0000000080002160 <_ZN9Scheduler3getEv>:

TCB *Scheduler::get() {
    80002160:	fd010113          	addi	sp,sp,-48
    80002164:	02113423          	sd	ra,40(sp)
    80002168:	02813023          	sd	s0,32(sp)
    8000216c:	00913c23          	sd	s1,24(sp)
    80002170:	01213823          	sd	s2,16(sp)
    80002174:	01313423          	sd	s3,8(sp)
    80002178:	03010413          	addi	s0,sp,48
    TCB* ret=nullptr;
    if(head){
    8000217c:	0000a497          	auipc	s1,0xa
    80002180:	71c4b483          	ld	s1,1820(s1) # 8000c898 <_ZN9Scheduler4headE>
    80002184:	0a048863          	beqz	s1,80002234 <_ZN9Scheduler3getEv+0xd4>
        ret=head->thread;
    80002188:	0004b903          	ld	s2,0(s1)
        Elem* stari=head;
        head=head->next;
    8000218c:	0084b783          	ld	a5,8(s1)
    80002190:	0000a717          	auipc	a4,0xa
    80002194:	70f73423          	sd	a5,1800(a4) # 8000c898 <_ZN9Scheduler4headE>
        if(!instance.flag){
    80002198:	0000a797          	auipc	a5,0xa
    8000219c:	6f07c783          	lbu	a5,1776(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    800021a0:	02078c63          	beqz	a5,800021d8 <_ZN9Scheduler3getEv+0x78>
        MemAlloc::getAllocator().mem_free(stari);
    800021a4:	00048593          	mv	a1,s1
    800021a8:	0000a517          	auipc	a0,0xa
    800021ac:	6d850513          	addi	a0,a0,1752 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800021b0:	00001097          	auipc	ra,0x1
    800021b4:	5a0080e7          	jalr	1440(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
    }
    return ret;
}
    800021b8:	00090513          	mv	a0,s2
    800021bc:	02813083          	ld	ra,40(sp)
    800021c0:	02013403          	ld	s0,32(sp)
    800021c4:	01813483          	ld	s1,24(sp)
    800021c8:	01013903          	ld	s2,16(sp)
    800021cc:	00813983          	ld	s3,8(sp)
    800021d0:	03010113          	addi	sp,sp,48
    800021d4:	00008067          	ret
            instance.flag=true;
    800021d8:	0000a797          	auipc	a5,0xa
    800021dc:	6a878793          	addi	a5,a5,1704 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800021e0:	00100713          	li	a4,1
    800021e4:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    800021e8:	0000a697          	auipc	a3,0xa
    800021ec:	6086b683          	ld	a3,1544(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800021f0:	0006b703          	ld	a4,0(a3)
    800021f4:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    800021f8:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    800021fc:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80002200:	0000a717          	auipc	a4,0xa
    80002204:	63873703          	ld	a4,1592(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002208:	00073503          	ld	a0,0(a4)
    8000220c:	0006b703          	ld	a4,0(a3)
    80002210:	40e50533          	sub	a0,a0,a4
    80002214:	40355513          	srai	a0,a0,0x3
    80002218:	0007b983          	ld	s3,0(a5)
    8000221c:	00a9bc23          	sd	a0,24(s3)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80002220:	fe050513          	addi	a0,a0,-32
    80002224:	00001097          	auipc	ra,0x1
    80002228:	32c080e7          	jalr	812(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    8000222c:	00a9b823          	sd	a0,16(s3)
    80002230:	f75ff06f          	j	800021a4 <_ZN9Scheduler3getEv+0x44>
    TCB* ret=nullptr;
    80002234:	00048913          	mv	s2,s1
    return ret;
    80002238:	f81ff06f          	j	800021b8 <_ZN9Scheduler3getEv+0x58>

000000008000223c <_ZN9SchedulerD1Ev>:

Scheduler::~Scheduler() {
    8000223c:	fe010113          	addi	sp,sp,-32
    80002240:	00113c23          	sd	ra,24(sp)
    80002244:	00813823          	sd	s0,16(sp)
    80002248:	00913423          	sd	s1,8(sp)
    8000224c:	02010413          	addi	s0,sp,32
    80002250:	0100006f          	j	80002260 <_ZN9SchedulerD1Ev+0x24>
    while (head) {
        Elem *stari = head;
        head = head->next;
        delete stari->thread;
    80002254:	00000097          	auipc	ra,0x0
    80002258:	4cc080e7          	jalr	1228(ra) # 80002720 <_ZdlPv>
        delete stari;
    8000225c:	02049463          	bnez	s1,80002284 <_ZN9SchedulerD1Ev+0x48>
    while (head) {
    80002260:	0000a497          	auipc	s1,0xa
    80002264:	6384b483          	ld	s1,1592(s1) # 8000c898 <_ZN9Scheduler4headE>
    80002268:	02048663          	beqz	s1,80002294 <_ZN9SchedulerD1Ev+0x58>
        head = head->next;
    8000226c:	0084b783          	ld	a5,8(s1)
    80002270:	0000a717          	auipc	a4,0xa
    80002274:	62f73423          	sd	a5,1576(a4) # 8000c898 <_ZN9Scheduler4headE>
        delete stari->thread;
    80002278:	0004b503          	ld	a0,0(s1)
    8000227c:	fc051ce3          	bnez	a0,80002254 <_ZN9SchedulerD1Ev+0x18>
    80002280:	fddff06f          	j	8000225c <_ZN9SchedulerD1Ev+0x20>
        delete stari;
    80002284:	00048513          	mv	a0,s1
    80002288:	00000097          	auipc	ra,0x0
    8000228c:	498080e7          	jalr	1176(ra) # 80002720 <_ZdlPv>
    80002290:	fd1ff06f          	j	80002260 <_ZN9SchedulerD1Ev+0x24>
    }
    80002294:	01813083          	ld	ra,24(sp)
    80002298:	01013403          	ld	s0,16(sp)
    8000229c:	00813483          	ld	s1,8(sp)
    800022a0:	02010113          	addi	sp,sp,32
    800022a4:	00008067          	ret

00000000800022a8 <_Z9userMainWPv>:
extern "C" void trap();
void userMain();
extern "C" void idleJob(void*);
static bool finishedA=false;

void userMainW(void* arg){
    800022a8:	ff010113          	addi	sp,sp,-16
    800022ac:	00113423          	sd	ra,8(sp)
    800022b0:	00813023          	sd	s0,0(sp)
    800022b4:	01010413          	addi	s0,sp,16
    userMain();
    800022b8:	00000097          	auipc	ra,0x0
    800022bc:	c74080e7          	jalr	-908(ra) # 80001f2c <_Z8userMainv>
}
    800022c0:	00813083          	ld	ra,8(sp)
    800022c4:	00013403          	ld	s0,0(sp)
    800022c8:	01010113          	addi	sp,sp,16
    800022cc:	00008067          	ret

00000000800022d0 <putJob>:

extern "C" void putJob(void* arg){
    800022d0:	ff010113          	addi	sp,sp,-16
    800022d4:	00113423          	sd	ra,8(sp)
    800022d8:	00813023          	sd	s0,0(sp)
    800022dc:	01010413          	addi	s0,sp,16
    800022e0:	0240006f          	j	80002304 <putJob+0x34>
    while(true){
        while((*(char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT){
            char c=Con::getConsoleInstance().getcO();
    800022e4:	00001097          	auipc	ra,0x1
    800022e8:	0a4080e7          	jalr	164(ra) # 80003388 <_ZN3Con18getConsoleInstanceEv>
    800022ec:	00001097          	auipc	ra,0x1
    800022f0:	044080e7          	jalr	68(ra) # 80003330 <_ZN3Con5getcOEv>
            *(char*)CONSOLE_TX_DATA=c;
    800022f4:	0000a797          	auipc	a5,0xa
    800022f8:	5147b783          	ld	a5,1300(a5) # 8000c808 <_GLOBAL_OFFSET_TABLE_+0x38>
    800022fc:	0007b783          	ld	a5,0(a5)
    80002300:	00a78023          	sb	a0,0(a5)
        while((*(char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT){
    80002304:	0000a797          	auipc	a5,0xa
    80002308:	4e47b783          	ld	a5,1252(a5) # 8000c7e8 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000230c:	0007b783          	ld	a5,0(a5)
    80002310:	0007c783          	lbu	a5,0(a5)
    80002314:	0207f793          	andi	a5,a5,32
    80002318:	fc0796e3          	bnez	a5,800022e4 <putJob+0x14>
        }
        TCB::_thread_dispatch();
    8000231c:	00001097          	auipc	ra,0x1
    80002320:	8f8080e7          	jalr	-1800(ra) # 80002c14 <_ZN3TCB16_thread_dispatchEv>
    }
    80002324:	fe1ff06f          	j	80002304 <putJob+0x34>

0000000080002328 <main>:
            finishedA=true;
        }
    }
};

int main() {
    80002328:	fd010113          	addi	sp,sp,-48
    8000232c:	02113423          	sd	ra,40(sp)
    80002330:	02813023          	sd	s0,32(sp)
    80002334:	03010413          	addi	s0,sp,48
    __asm__ volatile("csrw stvec, %[vector]": :[vector]"r"(&trap));
    80002338:	0000a797          	auipc	a5,0xa
    8000233c:	4f07b783          	ld	a5,1264(a5) # 8000c828 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002340:	10579073          	csrw	stvec,a5
    __asm__ volatile("csrs stvec,0x01");
    80002344:	1050e073          	csrsi	stvec,1
    thread_t nit1,nit2,nit3;
    thread_t putThread;
    void*arg= nullptr;
    thread_create(&nit1,nullptr,arg);
    80002348:	00000613          	li	a2,0
    8000234c:	00000593          	li	a1,0
    80002350:	fe840513          	addi	a0,s0,-24
    80002354:	fffff097          	auipc	ra,0xfffff
    80002358:	168080e7          	jalr	360(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2,idleJob,arg);
    8000235c:	00000613          	li	a2,0
    80002360:	0000a597          	auipc	a1,0xa
    80002364:	4985b583          	ld	a1,1176(a1) # 8000c7f8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002368:	fe040513          	addi	a0,s0,-32
    8000236c:	fffff097          	auipc	ra,0xfffff
    80002370:	150080e7          	jalr	336(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&putThread,putJob,arg);
    80002374:	00000613          	li	a2,0
    80002378:	00000597          	auipc	a1,0x0
    8000237c:	f5858593          	addi	a1,a1,-168 # 800022d0 <putJob>
    80002380:	fd040513          	addi	a0,s0,-48
    80002384:	fffff097          	auipc	ra,0xfffff
    80002388:	138080e7          	jalr	312(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running=nit1;
    8000238c:	0000a797          	auipc	a5,0xa
    80002390:	4a47b783          	ld	a5,1188(a5) # 8000c830 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002394:	fe843703          	ld	a4,-24(s0)
    80002398:	00e7b023          	sd	a4,0(a5)
    changeToUserRegime();
    8000239c:	fffff097          	auipc	ra,0xfffff
    800023a0:	2c4080e7          	jalr	708(ra) # 80001660 <_Z18changeToUserRegimev>
    thread_create(&nit3,userMainW,nullptr);
    800023a4:	00000613          	li	a2,0
    800023a8:	00000597          	auipc	a1,0x0
    800023ac:	f0058593          	addi	a1,a1,-256 # 800022a8 <_Z9userMainWPv>
    800023b0:	fd840513          	addi	a0,s0,-40
    800023b4:	fffff097          	auipc	ra,0xfffff
    800023b8:	108080e7          	jalr	264(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(nit3);
    800023bc:	fd843503          	ld	a0,-40(s0)
    800023c0:	fffff097          	auipc	ra,0xfffff
    800023c4:	184080e7          	jalr	388(ra) # 80001544 <_Z11thread_joinP3TCB>
    //PT* nit3=new PT(5);
    //nit3->start();
    //while(!finishedA){}
    //nit3->terminate();
    MemAlloc::getAllocator().mem_free(nit1);
    800023c8:	00000097          	auipc	ra,0x0
    800023cc:	064080e7          	jalr	100(ra) # 8000242c <_ZN8MemAlloc12getAllocatorEv>
    800023d0:	fe843583          	ld	a1,-24(s0)
    800023d4:	00001097          	auipc	ra,0x1
    800023d8:	37c080e7          	jalr	892(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
    MemAlloc::getAllocator().mem_free(nit2);
    800023dc:	00000097          	auipc	ra,0x0
    800023e0:	050080e7          	jalr	80(ra) # 8000242c <_ZN8MemAlloc12getAllocatorEv>
    800023e4:	fe043583          	ld	a1,-32(s0)
    800023e8:	00001097          	auipc	ra,0x1
    800023ec:	368080e7          	jalr	872(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
    MemAlloc::getAllocator().mem_free(nit3);
    800023f0:	00000097          	auipc	ra,0x0
    800023f4:	03c080e7          	jalr	60(ra) # 8000242c <_ZN8MemAlloc12getAllocatorEv>
    800023f8:	fd843583          	ld	a1,-40(s0)
    800023fc:	00001097          	auipc	ra,0x1
    80002400:	354080e7          	jalr	852(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
    MemAlloc::getAllocator().mem_free(putThread);
    80002404:	00000097          	auipc	ra,0x0
    80002408:	028080e7          	jalr	40(ra) # 8000242c <_ZN8MemAlloc12getAllocatorEv>
    8000240c:	fd043583          	ld	a1,-48(s0)
    80002410:	00001097          	auipc	ra,0x1
    80002414:	340080e7          	jalr	832(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
    return 0;
    80002418:	00000513          	li	a0,0
    8000241c:	02813083          	ld	ra,40(sp)
    80002420:	02013403          	ld	s0,32(sp)
    80002424:	03010113          	addi	sp,sp,48
    80002428:	00008067          	ret

000000008000242c <_ZN8MemAlloc12getAllocatorEv>:
        if(!instance.flag){
    8000242c:	0000a797          	auipc	a5,0xa
    80002430:	45c7c783          	lbu	a5,1116(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80002434:	00078863          	beqz	a5,80002444 <_ZN8MemAlloc12getAllocatorEv+0x18>
        }
        return instance;
    }
    80002438:	0000a517          	auipc	a0,0xa
    8000243c:	44850513          	addi	a0,a0,1096 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002440:	00008067          	ret
    static MemAlloc& getAllocator(){
    80002444:	fe010113          	addi	sp,sp,-32
    80002448:	00113c23          	sd	ra,24(sp)
    8000244c:	00813823          	sd	s0,16(sp)
    80002450:	00913423          	sd	s1,8(sp)
    80002454:	02010413          	addi	s0,sp,32
            instance.flag=true;
    80002458:	0000a797          	auipc	a5,0xa
    8000245c:	42878793          	addi	a5,a5,1064 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002460:	00100713          	li	a4,1
    80002464:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80002468:	0000a697          	auipc	a3,0xa
    8000246c:	3886b683          	ld	a3,904(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002470:	0006b703          	ld	a4,0(a3)
    80002474:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80002478:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    8000247c:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80002480:	0000a717          	auipc	a4,0xa
    80002484:	3b873703          	ld	a4,952(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002488:	00073503          	ld	a0,0(a4)
    8000248c:	0006b703          	ld	a4,0(a3)
    80002490:	40e50533          	sub	a0,a0,a4
    80002494:	40355513          	srai	a0,a0,0x3
    80002498:	0007b483          	ld	s1,0(a5)
    8000249c:	00a4bc23          	sd	a0,24(s1)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    800024a0:	fe050513          	addi	a0,a0,-32
    800024a4:	00001097          	auipc	ra,0x1
    800024a8:	0ac080e7          	jalr	172(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800024ac:	00a4b823          	sd	a0,16(s1)
    }
    800024b0:	0000a517          	auipc	a0,0xa
    800024b4:	3d050513          	addi	a0,a0,976 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800024b8:	01813083          	ld	ra,24(sp)
    800024bc:	01013403          	ld	s0,16(sp)
    800024c0:	00813483          	ld	s1,8(sp)
    800024c4:	02010113          	addi	sp,sp,32
    800024c8:	00008067          	ret

00000000800024cc <_ZN3BufC1Ev>:
// Created by os on 8/16/23.
//

#include "../h/Buf.h"

Buf:: Buf(){
    800024cc:	fe010113          	addi	sp,sp,-32
    800024d0:	00113c23          	sd	ra,24(sp)
    800024d4:	00813823          	sd	s0,16(sp)
    800024d8:	00913423          	sd	s1,8(sp)
    800024dc:	01213023          	sd	s2,0(sp)
    800024e0:	02010413          	addi	s0,sp,32
    800024e4:	00050493          	mv	s1,a0
    800024e8:	00052023          	sw	zero,0(a0)
    800024ec:	00052223          	sw	zero,4(a0)
        if(!instance.flag){
    800024f0:	0000a797          	auipc	a5,0xa
    800024f4:	3987c783          	lbu	a5,920(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    800024f8:	04078c63          	beqz	a5,80002550 <_ZN3BufC1Ev+0x84>
    buf=(char*)MemAlloc::getAllocator().mem_alloc(BUFF_SIZE/MEM_BLOCK_SIZE);
    800024fc:	02000593          	li	a1,32
    80002500:	0000a517          	auipc	a0,0xa
    80002504:	38050513          	addi	a0,a0,896 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002508:	00001097          	auipc	ra,0x1
    8000250c:	064080e7          	jalr	100(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    80002510:	00a4b423          	sd	a0,8(s1)
    Sem::_sem_open(&itemAvailable,0);
    80002514:	00000593          	li	a1,0
    80002518:	01048513          	addi	a0,s1,16
    8000251c:	fffff097          	auipc	ra,0xfffff
    80002520:	644080e7          	jalr	1604(ra) # 80001b60 <_ZN3Sem9_sem_openEPPS_j>
    Sem::_sem_open(&spaceAvailable,2048);
    80002524:	000015b7          	lui	a1,0x1
    80002528:	80058593          	addi	a1,a1,-2048 # 800 <_entry-0x7ffff800>
    8000252c:	01848513          	addi	a0,s1,24
    80002530:	fffff097          	auipc	ra,0xfffff
    80002534:	630080e7          	jalr	1584(ra) # 80001b60 <_ZN3Sem9_sem_openEPPS_j>
}
    80002538:	01813083          	ld	ra,24(sp)
    8000253c:	01013403          	ld	s0,16(sp)
    80002540:	00813483          	ld	s1,8(sp)
    80002544:	00013903          	ld	s2,0(sp)
    80002548:	02010113          	addi	sp,sp,32
    8000254c:	00008067          	ret
            instance.flag=true;
    80002550:	0000a797          	auipc	a5,0xa
    80002554:	33078793          	addi	a5,a5,816 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002558:	00100713          	li	a4,1
    8000255c:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80002560:	0000a697          	auipc	a3,0xa
    80002564:	2906b683          	ld	a3,656(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002568:	0006b703          	ld	a4,0(a3)
    8000256c:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80002570:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80002574:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80002578:	0000a717          	auipc	a4,0xa
    8000257c:	2c073703          	ld	a4,704(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002580:	00073503          	ld	a0,0(a4)
    80002584:	0006b703          	ld	a4,0(a3)
    80002588:	40e50533          	sub	a0,a0,a4
    8000258c:	40355513          	srai	a0,a0,0x3
    80002590:	0007b903          	ld	s2,0(a5)
    80002594:	00a93c23          	sd	a0,24(s2)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80002598:	fe050513          	addi	a0,a0,-32
    8000259c:	00001097          	auipc	ra,0x1
    800025a0:	fb4080e7          	jalr	-76(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800025a4:	00a93823          	sd	a0,16(s2)
    800025a8:	f55ff06f          	j	800024fc <_ZN3BufC1Ev+0x30>

00000000800025ac <_ZN3Buf3putEc>:

void Buf::put(char c){
    800025ac:	fe010113          	addi	sp,sp,-32
    800025b0:	00113c23          	sd	ra,24(sp)
    800025b4:	00813823          	sd	s0,16(sp)
    800025b8:	00913423          	sd	s1,8(sp)
    800025bc:	01213023          	sd	s2,0(sp)
    800025c0:	02010413          	addi	s0,sp,32
    800025c4:	00050493          	mv	s1,a0
    800025c8:	00058913          	mv	s2,a1
    Sem::_sem_wait(spaceAvailable);
    800025cc:	01853503          	ld	a0,24(a0)
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	1f4080e7          	jalr	500(ra) # 800017c4 <_ZN3Sem9_sem_waitEPS_>
    buf[tail]=c;
    800025d8:	0084b783          	ld	a5,8(s1)
    800025dc:	0044a703          	lw	a4,4(s1)
    800025e0:	00e787b3          	add	a5,a5,a4
    800025e4:	01278023          	sb	s2,0(a5)
    tail=(tail+1)%BUFF_SIZE;
    800025e8:	0044a783          	lw	a5,4(s1)
    800025ec:	0017879b          	addiw	a5,a5,1
    800025f0:	41f7d71b          	sraiw	a4,a5,0x1f
    800025f4:	0157571b          	srliw	a4,a4,0x15
    800025f8:	00e787bb          	addw	a5,a5,a4
    800025fc:	7ff7f793          	andi	a5,a5,2047
    80002600:	40e787bb          	subw	a5,a5,a4
    80002604:	00f4a223          	sw	a5,4(s1)
    Sem::_sem_signal(itemAvailable);
    80002608:	0104b503          	ld	a0,16(s1)
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	2f4080e7          	jalr	756(ra) # 80001900 <_ZN3Sem11_sem_signalEPS_>
}
    80002614:	01813083          	ld	ra,24(sp)
    80002618:	01013403          	ld	s0,16(sp)
    8000261c:	00813483          	ld	s1,8(sp)
    80002620:	00013903          	ld	s2,0(sp)
    80002624:	02010113          	addi	sp,sp,32
    80002628:	00008067          	ret

000000008000262c <_ZN3Buf3getEv>:

char Buf::get(){
    8000262c:	fe010113          	addi	sp,sp,-32
    80002630:	00113c23          	sd	ra,24(sp)
    80002634:	00813823          	sd	s0,16(sp)
    80002638:	00913423          	sd	s1,8(sp)
    8000263c:	01213023          	sd	s2,0(sp)
    80002640:	02010413          	addi	s0,sp,32
    80002644:	00050493          	mv	s1,a0
    Sem::_sem_wait(itemAvailable);
    80002648:	01053503          	ld	a0,16(a0)
    8000264c:	fffff097          	auipc	ra,0xfffff
    80002650:	178080e7          	jalr	376(ra) # 800017c4 <_ZN3Sem9_sem_waitEPS_>
    char c=buf[head];
    80002654:	0084b703          	ld	a4,8(s1)
    80002658:	0004a783          	lw	a5,0(s1)
    8000265c:	00f70733          	add	a4,a4,a5
    80002660:	00074903          	lbu	s2,0(a4)
    head=(head+1)%BUFF_SIZE;
    80002664:	0017879b          	addiw	a5,a5,1
    80002668:	41f7d71b          	sraiw	a4,a5,0x1f
    8000266c:	0157571b          	srliw	a4,a4,0x15
    80002670:	00e787bb          	addw	a5,a5,a4
    80002674:	7ff7f793          	andi	a5,a5,2047
    80002678:	40e787bb          	subw	a5,a5,a4
    8000267c:	00f4a023          	sw	a5,0(s1)
    Sem::_sem_signal(spaceAvailable);
    80002680:	0184b503          	ld	a0,24(s1)
    80002684:	fffff097          	auipc	ra,0xfffff
    80002688:	27c080e7          	jalr	636(ra) # 80001900 <_ZN3Sem11_sem_signalEPS_>
    return c;
}
    8000268c:	00090513          	mv	a0,s2
    80002690:	01813083          	ld	ra,24(sp)
    80002694:	01013403          	ld	s0,16(sp)
    80002698:	00813483          	ld	s1,8(sp)
    8000269c:	00013903          	ld	s2,0(sp)
    800026a0:	02010113          	addi	sp,sp,32
    800026a4:	00008067          	ret

00000000800026a8 <_ZN6ThreadD1Ev>:

void Thread::dispatch() {
    thread_dispatch();
}

Thread::~Thread() {
    800026a8:	ff010113          	addi	sp,sp,-16
    800026ac:	00813423          	sd	s0,8(sp)
    800026b0:	01010413          	addi	s0,sp,16
    myHandle= nullptr;
}
    800026b4:	00813403          	ld	s0,8(sp)
    800026b8:	01010113          	addi	sp,sp,16
    800026bc:	00008067          	ret

00000000800026c0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    800026c0:	ff010113          	addi	sp,sp,-16
    800026c4:	00113423          	sd	ra,8(sp)
    800026c8:	00813023          	sd	s0,0(sp)
    800026cc:	01010413          	addi	s0,sp,16
    800026d0:	0000a797          	auipc	a5,0xa
    800026d4:	f2078793          	addi	a5,a5,-224 # 8000c5f0 <_ZTV9Semaphore+0x10>
    800026d8:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800026dc:	00853503          	ld	a0,8(a0)
    800026e0:	fffff097          	auipc	ra,0xfffff
    800026e4:	ec0080e7          	jalr	-320(ra) # 800015a0 <_Z9sem_closeP3Sem>
}
    800026e8:	00813083          	ld	ra,8(sp)
    800026ec:	00013403          	ld	s0,0(sp)
    800026f0:	01010113          	addi	sp,sp,16
    800026f4:	00008067          	ret

00000000800026f8 <_Znwm>:
void* operator new (size_t sz){
    800026f8:	ff010113          	addi	sp,sp,-16
    800026fc:	00113423          	sd	ra,8(sp)
    80002700:	00813023          	sd	s0,0(sp)
    80002704:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	d48080e7          	jalr	-696(ra) # 80001450 <_Z9mem_allocm>
}
    80002710:	00813083          	ld	ra,8(sp)
    80002714:	00013403          	ld	s0,0(sp)
    80002718:	01010113          	addi	sp,sp,16
    8000271c:	00008067          	ret

0000000080002720 <_ZdlPv>:
void operator delete(void* addr){
    80002720:	ff010113          	addi	sp,sp,-16
    80002724:	00113423          	sd	ra,8(sp)
    80002728:	00813023          	sd	s0,0(sp)
    8000272c:	01010413          	addi	s0,sp,16
    mem_free(addr);
    80002730:	fffff097          	auipc	ra,0xfffff
    80002734:	d5c080e7          	jalr	-676(ra) # 8000148c <_Z8mem_freePv>
}
    80002738:	00813083          	ld	ra,8(sp)
    8000273c:	00013403          	ld	s0,0(sp)
    80002740:	01010113          	addi	sp,sp,16
    80002744:	00008067          	ret

0000000080002748 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002748:	ff010113          	addi	sp,sp,-16
    8000274c:	00113423          	sd	ra,8(sp)
    80002750:	00813023          	sd	s0,0(sp)
    80002754:	01010413          	addi	s0,sp,16
}
    80002758:	00000097          	auipc	ra,0x0
    8000275c:	fc8080e7          	jalr	-56(ra) # 80002720 <_ZdlPv>
    80002760:	00813083          	ld	ra,8(sp)
    80002764:	00013403          	ld	s0,0(sp)
    80002768:	01010113          	addi	sp,sp,16
    8000276c:	00008067          	ret

0000000080002770 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002770:	fe010113          	addi	sp,sp,-32
    80002774:	00113c23          	sd	ra,24(sp)
    80002778:	00813823          	sd	s0,16(sp)
    8000277c:	00913423          	sd	s1,8(sp)
    80002780:	02010413          	addi	s0,sp,32
    80002784:	00050493          	mv	s1,a0
}
    80002788:	00000097          	auipc	ra,0x0
    8000278c:	f38080e7          	jalr	-200(ra) # 800026c0 <_ZN9SemaphoreD1Ev>
    80002790:	00048513          	mv	a0,s1
    80002794:	00000097          	auipc	ra,0x0
    80002798:	f8c080e7          	jalr	-116(ra) # 80002720 <_ZdlPv>
    8000279c:	01813083          	ld	ra,24(sp)
    800027a0:	01013403          	ld	s0,16(sp)
    800027a4:	00813483          	ld	s1,8(sp)
    800027a8:	02010113          	addi	sp,sp,32
    800027ac:	00008067          	ret

00000000800027b0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800027b0:	ff010113          	addi	sp,sp,-16
    800027b4:	00813423          	sd	s0,8(sp)
    800027b8:	01010413          	addi	s0,sp,16
    800027bc:	0000a797          	auipc	a5,0xa
    800027c0:	e0c78793          	addi	a5,a5,-500 # 8000c5c8 <_ZTV6Thread+0x10>
    800027c4:	00f53023          	sd	a5,0(a0)
    this->body=body;
    800027c8:	00b53823          	sd	a1,16(a0)
    this->arg=arg;
    800027cc:	00c53c23          	sd	a2,24(a0)
}
    800027d0:	00813403          	ld	s0,8(sp)
    800027d4:	01010113          	addi	sp,sp,16
    800027d8:	00008067          	ret

00000000800027dc <_ZN6Thread5startEv>:
int Thread::start() {
    800027dc:	ff010113          	addi	sp,sp,-16
    800027e0:	00113423          	sd	ra,8(sp)
    800027e4:	00813023          	sd	s0,0(sp)
    800027e8:	01010413          	addi	s0,sp,16
    thread_create(&myHandle,body,arg);
    800027ec:	01853603          	ld	a2,24(a0)
    800027f0:	01053583          	ld	a1,16(a0)
    800027f4:	00850513          	addi	a0,a0,8
    800027f8:	fffff097          	auipc	ra,0xfffff
    800027fc:	cc4080e7          	jalr	-828(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
}
    80002800:	00000513          	li	a0,0
    80002804:	00813083          	ld	ra,8(sp)
    80002808:	00013403          	ld	s0,0(sp)
    8000280c:	01010113          	addi	sp,sp,16
    80002810:	00008067          	ret

0000000080002814 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002814:	ff010113          	addi	sp,sp,-16
    80002818:	00113423          	sd	ra,8(sp)
    8000281c:	00813023          	sd	s0,0(sp)
    80002820:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002824:	00853503          	ld	a0,8(a0)
    80002828:	fffff097          	auipc	ra,0xfffff
    8000282c:	d1c080e7          	jalr	-740(ra) # 80001544 <_Z11thread_joinP3TCB>
}
    80002830:	00813083          	ld	ra,8(sp)
    80002834:	00013403          	ld	s0,0(sp)
    80002838:	01010113          	addi	sp,sp,16
    8000283c:	00008067          	ret

0000000080002840 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002840:	ff010113          	addi	sp,sp,-16
    80002844:	00113423          	sd	ra,8(sp)
    80002848:	00813023          	sd	s0,0(sp)
    8000284c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002850:	fffff097          	auipc	ra,0xfffff
    80002854:	cd0080e7          	jalr	-816(ra) # 80001520 <_Z15thread_dispatchv>
}
    80002858:	00813083          	ld	ra,8(sp)
    8000285c:	00013403          	ld	s0,0(sp)
    80002860:	01010113          	addi	sp,sp,16
    80002864:	00008067          	ret

0000000080002868 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002868:	ff010113          	addi	sp,sp,-16
    8000286c:	00813423          	sd	s0,8(sp)
    80002870:	01010413          	addi	s0,sp,16
    80002874:	0000a797          	auipc	a5,0xa
    80002878:	d5478793          	addi	a5,a5,-684 # 8000c5c8 <_ZTV6Thread+0x10>
    8000287c:	00f53023          	sd	a5,0(a0)
   this->body=wrapper;
    80002880:	00000797          	auipc	a5,0x0
    80002884:	1e078793          	addi	a5,a5,480 # 80002a60 <_ZN6Thread7wrapperEPv>
    80002888:	00f53823          	sd	a5,16(a0)
   this->arg=this;
    8000288c:	00a53c23          	sd	a0,24(a0)
}
    80002890:	00813403          	ld	s0,8(sp)
    80002894:	01010113          	addi	sp,sp,16
    80002898:	00008067          	ret

000000008000289c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    8000289c:	ff010113          	addi	sp,sp,-16
    800028a0:	00113423          	sd	ra,8(sp)
    800028a4:	00813023          	sd	s0,0(sp)
    800028a8:	01010413          	addi	s0,sp,16
    return time_sleep(t);
    800028ac:	fffff097          	auipc	ra,0xfffff
    800028b0:	d84080e7          	jalr	-636(ra) # 80001630 <_Z10time_sleepm>
}
    800028b4:	00813083          	ld	ra,8(sp)
    800028b8:	00013403          	ld	s0,0(sp)
    800028bc:	01010113          	addi	sp,sp,16
    800028c0:	00008067          	ret

00000000800028c4 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(){
    this->period=period;
}

void PeriodicThread::run() {
    800028c4:	fe010113          	addi	sp,sp,-32
    800028c8:	00113c23          	sd	ra,24(sp)
    800028cc:	00813823          	sd	s0,16(sp)
    800028d0:	00913423          	sd	s1,8(sp)
    800028d4:	02010413          	addi	s0,sp,32
    800028d8:	00050493          	mv	s1,a0
    while(period){
    800028dc:	0204b783          	ld	a5,32(s1)
    800028e0:	02078263          	beqz	a5,80002904 <_ZN14PeriodicThread3runEv+0x40>
        periodicActivation();
    800028e4:	0004b783          	ld	a5,0(s1)
    800028e8:	0187b783          	ld	a5,24(a5)
    800028ec:	00048513          	mv	a0,s1
    800028f0:	000780e7          	jalr	a5
        sleep(period);
    800028f4:	0204b503          	ld	a0,32(s1)
    800028f8:	00000097          	auipc	ra,0x0
    800028fc:	fa4080e7          	jalr	-92(ra) # 8000289c <_ZN6Thread5sleepEm>
    while(period){
    80002900:	fddff06f          	j	800028dc <_ZN14PeriodicThread3runEv+0x18>
    }
}
    80002904:	01813083          	ld	ra,24(sp)
    80002908:	01013403          	ld	s0,16(sp)
    8000290c:	00813483          	ld	s1,8(sp)
    80002910:	02010113          	addi	sp,sp,32
    80002914:	00008067          	ret

0000000080002918 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002918:	ff010113          	addi	sp,sp,-16
    8000291c:	00113423          	sd	ra,8(sp)
    80002920:	00813023          	sd	s0,0(sp)
    80002924:	01010413          	addi	s0,sp,16
    80002928:	0000a797          	auipc	a5,0xa
    8000292c:	cc878793          	addi	a5,a5,-824 # 8000c5f0 <_ZTV9Semaphore+0x10>
    80002930:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle,init);
    80002934:	00850513          	addi	a0,a0,8
    80002938:	fffff097          	auipc	ra,0xfffff
    8000293c:	c34080e7          	jalr	-972(ra) # 8000156c <_Z8sem_openPP3Semj>
}
    80002940:	00813083          	ld	ra,8(sp)
    80002944:	00013403          	ld	s0,0(sp)
    80002948:	01010113          	addi	sp,sp,16
    8000294c:	00008067          	ret

0000000080002950 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002950:	ff010113          	addi	sp,sp,-16
    80002954:	00113423          	sd	ra,8(sp)
    80002958:	00813023          	sd	s0,0(sp)
    8000295c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002960:	00853503          	ld	a0,8(a0)
    80002964:	fffff097          	auipc	ra,0xfffff
    80002968:	c6c080e7          	jalr	-916(ra) # 800015d0 <_Z8sem_waitP3Sem>
}
    8000296c:	00813083          	ld	ra,8(sp)
    80002970:	00013403          	ld	s0,0(sp)
    80002974:	01010113          	addi	sp,sp,16
    80002978:	00008067          	ret

000000008000297c <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    8000297c:	ff010113          	addi	sp,sp,-16
    80002980:	00113423          	sd	ra,8(sp)
    80002984:	00813023          	sd	s0,0(sp)
    80002988:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000298c:	00853503          	ld	a0,8(a0)
    80002990:	fffff097          	auipc	ra,0xfffff
    80002994:	c70080e7          	jalr	-912(ra) # 80001600 <_Z10sem_signalP3Sem>
}
    80002998:	00813083          	ld	ra,8(sp)
    8000299c:	00013403          	ld	s0,0(sp)
    800029a0:	01010113          	addi	sp,sp,16
    800029a4:	00008067          	ret

00000000800029a8 <_ZN7Console4getcEv>:
char Console::getc() {return _SYSCALL_CPP_HPP::getc();}
    800029a8:	ff010113          	addi	sp,sp,-16
    800029ac:	00113423          	sd	ra,8(sp)
    800029b0:	00813023          	sd	s0,0(sp)
    800029b4:	01010413          	addi	s0,sp,16
    800029b8:	fffff097          	auipc	ra,0xfffff
    800029bc:	ccc080e7          	jalr	-820(ra) # 80001684 <_Z4getcv>
    800029c0:	00813083          	ld	ra,8(sp)
    800029c4:	00013403          	ld	s0,0(sp)
    800029c8:	01010113          	addi	sp,sp,16
    800029cc:	00008067          	ret

00000000800029d0 <_ZN7Console4putcEc>:
void Console::putc(char c) {return _SYSCALL_CPP_HPP::putc(c);}
    800029d0:	ff010113          	addi	sp,sp,-16
    800029d4:	00113423          	sd	ra,8(sp)
    800029d8:	00813023          	sd	s0,0(sp)
    800029dc:	01010413          	addi	s0,sp,16
    800029e0:	fffff097          	auipc	ra,0xfffff
    800029e4:	cd0080e7          	jalr	-816(ra) # 800016b0 <_Z4putcc>
    800029e8:	00813083          	ld	ra,8(sp)
    800029ec:	00013403          	ld	s0,0(sp)
    800029f0:	01010113          	addi	sp,sp,16
    800029f4:	00008067          	ret

00000000800029f8 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(){
    800029f8:	fe010113          	addi	sp,sp,-32
    800029fc:	00113c23          	sd	ra,24(sp)
    80002a00:	00813823          	sd	s0,16(sp)
    80002a04:	00913423          	sd	s1,8(sp)
    80002a08:	01213023          	sd	s2,0(sp)
    80002a0c:	02010413          	addi	s0,sp,32
    80002a10:	00050493          	mv	s1,a0
    80002a14:	00058913          	mv	s2,a1
    80002a18:	00000097          	auipc	ra,0x0
    80002a1c:	e50080e7          	jalr	-432(ra) # 80002868 <_ZN6ThreadC1Ev>
    80002a20:	0000a797          	auipc	a5,0xa
    80002a24:	bf078793          	addi	a5,a5,-1040 # 8000c610 <_ZTV14PeriodicThread+0x10>
    80002a28:	00f4b023          	sd	a5,0(s1)
    this->period=period;
    80002a2c:	0324b023          	sd	s2,32(s1)
}
    80002a30:	01813083          	ld	ra,24(sp)
    80002a34:	01013403          	ld	s0,16(sp)
    80002a38:	00813483          	ld	s1,8(sp)
    80002a3c:	00013903          	ld	s2,0(sp)
    80002a40:	02010113          	addi	sp,sp,32
    80002a44:	00008067          	ret

0000000080002a48 <_ZN6Thread3runEv>:
    static void dispatch();
    static int sleep(time_t t);

protected:
    Thread();
    virtual void run() {};
    80002a48:	ff010113          	addi	sp,sp,-16
    80002a4c:	00813423          	sd	s0,8(sp)
    80002a50:	01010413          	addi	s0,sp,16
    80002a54:	00813403          	ld	s0,8(sp)
    80002a58:	01010113          	addi	sp,sp,16
    80002a5c:	00008067          	ret

0000000080002a60 <_ZN6Thread7wrapperEPv>:

private:
    static void wrapper(void* t){
    80002a60:	ff010113          	addi	sp,sp,-16
    80002a64:	00113423          	sd	ra,8(sp)
    80002a68:	00813023          	sd	s0,0(sp)
    80002a6c:	01010413          	addi	s0,sp,16
        ((Thread*)t)->run();
    80002a70:	00053783          	ld	a5,0(a0)
    80002a74:	0107b783          	ld	a5,16(a5)
    80002a78:	000780e7          	jalr	a5
    }
    80002a7c:	00813083          	ld	ra,8(sp)
    80002a80:	00013403          	ld	s0,0(sp)
    80002a84:	01010113          	addi	sp,sp,16
    80002a88:	00008067          	ret

0000000080002a8c <_ZN14PeriodicThread18periodicActivationEv>:
    virtual ~PeriodicThread(){period=0;}
    PeriodicThread(time_t period);

protected:
    void run() override;
    virtual void periodicActivation(){};
    80002a8c:	ff010113          	addi	sp,sp,-16
    80002a90:	00813423          	sd	s0,8(sp)
    80002a94:	01010413          	addi	s0,sp,16
    80002a98:	00813403          	ld	s0,8(sp)
    80002a9c:	01010113          	addi	sp,sp,16
    80002aa0:	00008067          	ret

0000000080002aa4 <_ZN14PeriodicThreadD1Ev>:
    virtual ~PeriodicThread(){period=0;}
    80002aa4:	ff010113          	addi	sp,sp,-16
    80002aa8:	00813423          	sd	s0,8(sp)
    80002aac:	01010413          	addi	s0,sp,16
    80002ab0:	0000a797          	auipc	a5,0xa
    80002ab4:	b6078793          	addi	a5,a5,-1184 # 8000c610 <_ZTV14PeriodicThread+0x10>
    80002ab8:	00f53023          	sd	a5,0(a0)
    80002abc:	02053023          	sd	zero,32(a0)
    80002ac0:	00813403          	ld	s0,8(sp)
    80002ac4:	01010113          	addi	sp,sp,16
    80002ac8:	00008067          	ret

0000000080002acc <_ZN14PeriodicThreadD0Ev>:
    80002acc:	ff010113          	addi	sp,sp,-16
    80002ad0:	00113423          	sd	ra,8(sp)
    80002ad4:	00813023          	sd	s0,0(sp)
    80002ad8:	01010413          	addi	s0,sp,16
    80002adc:	0000a717          	auipc	a4,0xa
    80002ae0:	b3470713          	addi	a4,a4,-1228 # 8000c610 <_ZTV14PeriodicThread+0x10>
    80002ae4:	00e53023          	sd	a4,0(a0)
    80002ae8:	02053023          	sd	zero,32(a0)
    80002aec:	00000097          	auipc	ra,0x0
    80002af0:	c34080e7          	jalr	-972(ra) # 80002720 <_ZdlPv>
    80002af4:	00813083          	ld	ra,8(sp)
    80002af8:	00013403          	ld	s0,0(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZN3TCB7wrapperEv>:
        handle->addBlockedElem(TCB::running);
        _thread_dispatch();
    }
}

void TCB::wrapper() {
    80002b04:	fe010113          	addi	sp,sp,-32
    80002b08:	00113c23          	sd	ra,24(sp)
    80002b0c:	00813823          	sd	s0,16(sp)
    80002b10:	00913423          	sd	s1,8(sp)
    80002b14:	02010413          	addi	s0,sp,32
    if(TCB::running->job!=putJob)
    80002b18:	0000a797          	auipc	a5,0xa
    80002b1c:	d887b783          	ld	a5,-632(a5) # 8000c8a0 <_ZN3TCB7runningE>
    80002b20:	0287b703          	ld	a4,40(a5)
    80002b24:	0000a797          	auipc	a5,0xa
    80002b28:	cbc7b783          	ld	a5,-836(a5) # 8000c7e0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002b2c:	00f70663          	beq	a4,a5,80002b38 <_ZN3TCB7wrapperEv+0x34>
        RiscVReg::popSppSpie();
    80002b30:	00001097          	auipc	ra,0x1
    80002b34:	d0c080e7          	jalr	-756(ra) # 8000383c <_ZN8RiscVReg10popSppSpieEv>
    TCB::running->job(TCB::running->arg);
    80002b38:	0000a497          	auipc	s1,0xa
    80002b3c:	d6848493          	addi	s1,s1,-664 # 8000c8a0 <_ZN3TCB7runningE>
    80002b40:	0004b783          	ld	a5,0(s1)
    80002b44:	0287b703          	ld	a4,40(a5)
    80002b48:	0307b503          	ld	a0,48(a5)
    80002b4c:	000700e7          	jalr	a4
    for(BlockedElem* tmp=TCB::running->blockedHead;tmp;tmp=tmp->next){
    80002b50:	0004b783          	ld	a5,0(s1)
    80002b54:	0407b483          	ld	s1,64(a5)
    80002b58:	02048663          	beqz	s1,80002b84 <_ZN3TCB7wrapperEv+0x80>
        tmp->thread->blocked=false;
    80002b5c:	0004b783          	ld	a5,0(s1)
    80002b60:	02078ca3          	sb	zero,57(a5)
        Scheduler::put(tmp->thread);
    80002b64:	0004b503          	ld	a0,0(s1)
    80002b68:	fffff097          	auipc	ra,0xfffff
    80002b6c:	518080e7          	jalr	1304(ra) # 80002080 <_ZN9Scheduler3putEP3TCB>
        delete tmp;
    80002b70:	00048513          	mv	a0,s1
    80002b74:	00000097          	auipc	ra,0x0
    80002b78:	bac080e7          	jalr	-1108(ra) # 80002720 <_ZdlPv>
    for(BlockedElem* tmp=TCB::running->blockedHead;tmp;tmp=tmp->next){
    80002b7c:	0084b483          	ld	s1,8(s1)
    80002b80:	fd9ff06f          	j	80002b58 <_ZN3TCB7wrapperEv+0x54>
    }//obavestavanje svih onih niti koje su cekale i njihovo stavljanje u rasporedjivac
    thread_exit();
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	970080e7          	jalr	-1680(ra) # 800014f4 <_Z11thread_exitv>
}
    80002b8c:	01813083          	ld	ra,24(sp)
    80002b90:	01013403          	ld	s0,16(sp)
    80002b94:	00813483          	ld	s1,8(sp)
    80002b98:	02010113          	addi	sp,sp,32
    80002b9c:	00008067          	ret

0000000080002ba0 <idleJob>:
        while (!Scheduler::head) {}
    80002ba0:	0000a797          	auipc	a5,0xa
    80002ba4:	c607b783          	ld	a5,-928(a5) # 8000c800 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002ba8:	0007b783          	ld	a5,0(a5)
    80002bac:	fe078ae3          	beqz	a5,80002ba0 <idleJob>
extern "C" void idleJob(void* arg){
    80002bb0:	ff010113          	addi	sp,sp,-16
    80002bb4:	00113423          	sd	ra,8(sp)
    80002bb8:	00813023          	sd	s0,0(sp)
    80002bbc:	01010413          	addi	s0,sp,16
        thread_dispatch();
    80002bc0:	fffff097          	auipc	ra,0xfffff
    80002bc4:	960080e7          	jalr	-1696(ra) # 80001520 <_Z15thread_dispatchv>
        while (!Scheduler::head) {}
    80002bc8:	0000a797          	auipc	a5,0xa
    80002bcc:	c387b783          	ld	a5,-968(a5) # 8000c800 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002bd0:	0007b783          	ld	a5,0(a5)
    80002bd4:	fe0796e3          	bnez	a5,80002bc0 <idleJob+0x20>
    80002bd8:	ff1ff06f          	j	80002bc8 <idleJob+0x28>

0000000080002bdc <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
void TCB::contextSwitch(TCB::Context *a, TCB::Context *b) {
    80002bdc:	ff010113          	addi	sp,sp,-16
    80002be0:	00813423          	sd	s0,8(sp)
    80002be4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv %0, ra": "=r"(a->ra));
    80002be8:	00008793          	mv	a5,ra
    80002bec:	00f53023          	sd	a5,0(a0)
    __asm__ volatile("mv %0, sp": "=r"(a->sp));
    80002bf0:	00010793          	mv	a5,sp
    80002bf4:	00f53423          	sd	a5,8(a0)
    __asm__ volatile("mv ra, %0": :"r"(b->ra));
    80002bf8:	0005b783          	ld	a5,0(a1)
    80002bfc:	00078093          	mv	ra,a5
    __asm__ volatile("mv sp, %0": :"r"(b->sp));
    80002c00:	0085b783          	ld	a5,8(a1)
    80002c04:	00078113          	mv	sp,a5
}
    80002c08:	00813403          	ld	s0,8(sp)
    80002c0c:	01010113          	addi	sp,sp,16
    80002c10:	00008067          	ret

0000000080002c14 <_ZN3TCB16_thread_dispatchEv>:
void TCB::_thread_dispatch() {
    80002c14:	fe010113          	addi	sp,sp,-32
    80002c18:	00113c23          	sd	ra,24(sp)
    80002c1c:	00813823          	sd	s0,16(sp)
    80002c20:	00913423          	sd	s1,8(sp)
    80002c24:	01213023          	sd	s2,0(sp)
    80002c28:	02010413          	addi	s0,sp,32
    TCB* old=TCB::running;
    80002c2c:	0000a497          	auipc	s1,0xa
    80002c30:	c744b483          	ld	s1,-908(s1) # 8000c8a0 <_ZN3TCB7runningE>
    if(!old->finished && !old->blocked && old->timeSlice && !old->sleepTime) Scheduler::put(old);
    80002c34:	0384c783          	lbu	a5,56(s1)
    80002c38:	00079e63          	bnez	a5,80002c54 <_ZN3TCB16_thread_dispatchEv+0x40>
    80002c3c:	0394c783          	lbu	a5,57(s1)
    80002c40:	00079a63          	bnez	a5,80002c54 <_ZN3TCB16_thread_dispatchEv+0x40>
    80002c44:	0104b783          	ld	a5,16(s1)
    80002c48:	00078663          	beqz	a5,80002c54 <_ZN3TCB16_thread_dispatchEv+0x40>
    80002c4c:	0184b783          	ld	a5,24(s1)
    80002c50:	04078263          	beqz	a5,80002c94 <_ZN3TCB16_thread_dispatchEv+0x80>
    if(old->finished){
    80002c54:	0384c783          	lbu	a5,56(s1)
    80002c58:	04079663          	bnez	a5,80002ca4 <_ZN3TCB16_thread_dispatchEv+0x90>
    running=Scheduler::get();
    80002c5c:	fffff097          	auipc	ra,0xfffff
    80002c60:	504080e7          	jalr	1284(ra) # 80002160 <_ZN9Scheduler3getEv>
    80002c64:	00050593          	mv	a1,a0
    80002c68:	0000a797          	auipc	a5,0xa
    80002c6c:	c2a7bc23          	sd	a0,-968(a5) # 8000c8a0 <_ZN3TCB7runningE>
    contextSwitch(&old->context,&running->context);
    80002c70:	00048513          	mv	a0,s1
    80002c74:	00000097          	auipc	ra,0x0
    80002c78:	f68080e7          	jalr	-152(ra) # 80002bdc <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002c7c:	01813083          	ld	ra,24(sp)
    80002c80:	01013403          	ld	s0,16(sp)
    80002c84:	00813483          	ld	s1,8(sp)
    80002c88:	00013903          	ld	s2,0(sp)
    80002c8c:	02010113          	addi	sp,sp,32
    80002c90:	00008067          	ret
    if(!old->finished && !old->blocked && old->timeSlice && !old->sleepTime) Scheduler::put(old);
    80002c94:	00048513          	mv	a0,s1
    80002c98:	fffff097          	auipc	ra,0xfffff
    80002c9c:	3e8080e7          	jalr	1000(ra) # 80002080 <_ZN9Scheduler3putEP3TCB>
    80002ca0:	fb5ff06f          	j	80002c54 <_ZN3TCB16_thread_dispatchEv+0x40>
        if(!instance.flag){
    80002ca4:	0000a797          	auipc	a5,0xa
    80002ca8:	be47c783          	lbu	a5,-1052(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80002cac:	00078e63          	beqz	a5,80002cc8 <_ZN3TCB16_thread_dispatchEv+0xb4>
        MemAlloc::getAllocator().mem_free(old->stack);
    80002cb0:	0204b583          	ld	a1,32(s1)
    80002cb4:	0000a517          	auipc	a0,0xa
    80002cb8:	bcc50513          	addi	a0,a0,-1076 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002cbc:	00001097          	auipc	ra,0x1
    80002cc0:	a94080e7          	jalr	-1388(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
    80002cc4:	f99ff06f          	j	80002c5c <_ZN3TCB16_thread_dispatchEv+0x48>
            instance.flag=true;
    80002cc8:	0000a797          	auipc	a5,0xa
    80002ccc:	bb878793          	addi	a5,a5,-1096 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002cd0:	00100713          	li	a4,1
    80002cd4:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80002cd8:	0000a697          	auipc	a3,0xa
    80002cdc:	b186b683          	ld	a3,-1256(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002ce0:	0006b703          	ld	a4,0(a3)
    80002ce4:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80002ce8:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80002cec:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80002cf0:	0000a717          	auipc	a4,0xa
    80002cf4:	b4873703          	ld	a4,-1208(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002cf8:	00073503          	ld	a0,0(a4)
    80002cfc:	0006b703          	ld	a4,0(a3)
    80002d00:	40e50533          	sub	a0,a0,a4
    80002d04:	40355513          	srai	a0,a0,0x3
    80002d08:	0007b903          	ld	s2,0(a5)
    80002d0c:	00a93c23          	sd	a0,24(s2)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80002d10:	fe050513          	addi	a0,a0,-32
    80002d14:	00001097          	auipc	ra,0x1
    80002d18:	83c080e7          	jalr	-1988(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80002d1c:	00a93823          	sd	a0,16(s2)
    80002d20:	f91ff06f          	j	80002cb0 <_ZN3TCB16_thread_dispatchEv+0x9c>

0000000080002d24 <_ZN3TCB12_thread_exitEv>:
int TCB::_thread_exit() {
    80002d24:	ff010113          	addi	sp,sp,-16
    80002d28:	00113423          	sd	ra,8(sp)
    80002d2c:	00813023          	sd	s0,0(sp)
    80002d30:	01010413          	addi	s0,sp,16
    old->finished=true;
    80002d34:	0000a797          	auipc	a5,0xa
    80002d38:	b6c7b783          	ld	a5,-1172(a5) # 8000c8a0 <_ZN3TCB7runningE>
    80002d3c:	00100713          	li	a4,1
    80002d40:	02e78c23          	sb	a4,56(a5)
    _thread_dispatch();
    80002d44:	00000097          	auipc	ra,0x0
    80002d48:	ed0080e7          	jalr	-304(ra) # 80002c14 <_ZN3TCB16_thread_dispatchEv>
}
    80002d4c:	fff00513          	li	a0,-1
    80002d50:	00813083          	ld	ra,8(sp)
    80002d54:	00013403          	ld	s0,0(sp)
    80002d58:	01010113          	addi	sp,sp,16
    80002d5c:	00008067          	ret

0000000080002d60 <_ZN3TCBC1EPFvPvES0_S0_>:
TCB::TCB(void (*start_routine)(void *), void *arg, void* stack) {
    80002d60:	ff010113          	addi	sp,sp,-16
    80002d64:	00813423          	sd	s0,8(sp)
    80002d68:	01010413          	addi	s0,sp,16
    80002d6c:	00200793          	li	a5,2
    80002d70:	00f53823          	sd	a5,16(a0)
    80002d74:	00053c23          	sd	zero,24(a0)
    80002d78:	02050c23          	sb	zero,56(a0)
    80002d7c:	02050ca3          	sb	zero,57(a0)
    80002d80:	04053023          	sd	zero,64(a0)
    job=start_routine;
    80002d84:	02b53423          	sd	a1,40(a0)
    this->arg=arg;
    80002d88:	02c53823          	sd	a2,48(a0)
    this->stack=(uint64 *)stack;
    80002d8c:	02d53023          	sd	a3,32(a0)
}
    80002d90:	00813403          	ld	s0,8(sp)
    80002d94:	01010113          	addi	sp,sp,16
    80002d98:	00008067          	ret

0000000080002d9c <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>:
int TCB::_thread_create (TCB **instance, void (*start_routine)(void *), void *arg,void* stack) {
    80002d9c:	f7010113          	addi	sp,sp,-144
    80002da0:	08113423          	sd	ra,136(sp)
    80002da4:	08813023          	sd	s0,128(sp)
    80002da8:	06913c23          	sd	s1,120(sp)
    80002dac:	07213823          	sd	s2,112(sp)
    80002db0:	07313423          	sd	s3,104(sp)
    80002db4:	07413023          	sd	s4,96(sp)
    80002db8:	05513c23          	sd	s5,88(sp)
    80002dbc:	09010413          	addi	s0,sp,144
    80002dc0:	00050a13          	mv	s4,a0
    80002dc4:	00058993          	mv	s3,a1
    80002dc8:	00060a93          	mv	s5,a2
    80002dcc:	00068913          	mv	s2,a3
        if(!instance.flag){
    80002dd0:	0000a797          	auipc	a5,0xa
    80002dd4:	ab87c783          	lbu	a5,-1352(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80002dd8:	0c078a63          	beqz	a5,80002eac <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0x110>
    TCB* t=(TCB*)MemAlloc::getAllocator().mem_alloc((sizeof(TCB)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80002ddc:	00200593          	li	a1,2
    80002de0:	0000a517          	auipc	a0,0xa
    80002de4:	aa050513          	addi	a0,a0,-1376 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002de8:	00000097          	auipc	ra,0x0
    80002dec:	784080e7          	jalr	1924(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    80002df0:	00050493          	mv	s1,a0
    if(!t) return -1;
    80002df4:	10050a63          	beqz	a0,80002f08 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0x16c>
    *t=TCB(start_routine,arg,stack);
    80002df8:	00090693          	mv	a3,s2
    80002dfc:	000a8613          	mv	a2,s5
    80002e00:	00098593          	mv	a1,s3
    80002e04:	f7840513          	addi	a0,s0,-136
    80002e08:	00000097          	auipc	ra,0x0
    80002e0c:	f58080e7          	jalr	-168(ra) # 80002d60 <_ZN3TCBC1EPFvPvES0_S0_>
    80002e10:	f8043883          	ld	a7,-128(s0)
    80002e14:	f8843803          	ld	a6,-120(s0)
    80002e18:	f9043503          	ld	a0,-112(s0)
    80002e1c:	f9843583          	ld	a1,-104(s0)
    80002e20:	fa043603          	ld	a2,-96(s0)
    80002e24:	fa843683          	ld	a3,-88(s0)
    80002e28:	fb043703          	ld	a4,-80(s0)
    80002e2c:	fb843783          	ld	a5,-72(s0)
    80002e30:	f7843303          	ld	t1,-136(s0)
    80002e34:	0064b023          	sd	t1,0(s1)
    80002e38:	0114b423          	sd	a7,8(s1)
    80002e3c:	0104b823          	sd	a6,16(s1)
    80002e40:	00a4bc23          	sd	a0,24(s1)
    80002e44:	02b4b023          	sd	a1,32(s1)
    80002e48:	02c4b423          	sd	a2,40(s1)
    80002e4c:	02d4b823          	sd	a3,48(s1)
    80002e50:	02e4bc23          	sd	a4,56(s1)
    80002e54:	04f4b023          	sd	a5,64(s1)
    *instance=t;
    80002e58:	009a3023          	sd	s1,0(s4)
    if(start_routine){
    80002e5c:	0a098a63          	beqz	s3,80002f10 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0x174>
        Scheduler::put(t);
    80002e60:	00048513          	mv	a0,s1
    80002e64:	fffff097          	auipc	ra,0xfffff
    80002e68:	21c080e7          	jalr	540(ra) # 80002080 <_ZN9Scheduler3putEP3TCB>
        t->context.ra=(uint64)wrapper; //da odmah krene na izvrsavanje tela, po prvom "vadjenju" iz reda
    80002e6c:	00000797          	auipc	a5,0x0
    80002e70:	c9878793          	addi	a5,a5,-872 # 80002b04 <_ZN3TCB7wrapperEv>
    80002e74:	00f4b023          	sd	a5,0(s1)
        t->context.sp=(uint64)((uint8*)stack+DEFAULT_STACK_SIZE*8);
    80002e78:	000086b7          	lui	a3,0x8
    80002e7c:	00d906b3          	add	a3,s2,a3
    80002e80:	00d4b423          	sd	a3,8(s1)
    return 0;
    80002e84:	00000513          	li	a0,0
}
    80002e88:	08813083          	ld	ra,136(sp)
    80002e8c:	08013403          	ld	s0,128(sp)
    80002e90:	07813483          	ld	s1,120(sp)
    80002e94:	07013903          	ld	s2,112(sp)
    80002e98:	06813983          	ld	s3,104(sp)
    80002e9c:	06013a03          	ld	s4,96(sp)
    80002ea0:	05813a83          	ld	s5,88(sp)
    80002ea4:	09010113          	addi	sp,sp,144
    80002ea8:	00008067          	ret
            instance.flag=true;
    80002eac:	0000a717          	auipc	a4,0xa
    80002eb0:	9d470713          	addi	a4,a4,-1580 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002eb4:	00100793          	li	a5,1
    80002eb8:	00f70423          	sb	a5,8(a4)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80002ebc:	0000a697          	auipc	a3,0xa
    80002ec0:	9346b683          	ld	a3,-1740(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002ec4:	0006b783          	ld	a5,0(a3)
    80002ec8:	00f73023          	sd	a5,0(a4)
            instance.headFree->next= nullptr;
    80002ecc:	0007b423          	sd	zero,8(a5)
            instance.headFree->prev= nullptr;
    80002ed0:	0007b023          	sd	zero,0(a5)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80002ed4:	0000a797          	auipc	a5,0xa
    80002ed8:	9647b783          	ld	a5,-1692(a5) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002edc:	0007b783          	ld	a5,0(a5)
    80002ee0:	0006b503          	ld	a0,0(a3)
    80002ee4:	40a787b3          	sub	a5,a5,a0
    80002ee8:	4037d793          	srai	a5,a5,0x3
    80002eec:	00073483          	ld	s1,0(a4)
    80002ef0:	00f4bc23          	sd	a5,24(s1)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80002ef4:	fe078513          	addi	a0,a5,-32
    80002ef8:	00000097          	auipc	ra,0x0
    80002efc:	658080e7          	jalr	1624(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80002f00:	00a4b823          	sd	a0,16(s1)
    80002f04:	ed9ff06f          	j	80002ddc <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0x40>
    if(!t) return -1;
    80002f08:	fff00513          	li	a0,-1
    80002f0c:	f7dff06f          	j	80002e88 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xec>
    return 0;
    80002f10:	00000513          	li	a0,0
    80002f14:	f75ff06f          	j	80002e88 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xec>

0000000080002f18 <_ZN3TCB14addBlockedElemEPS_>:

void TCB::addBlockedElem(TCB *t) {
    80002f18:	fd010113          	addi	sp,sp,-48
    80002f1c:	02113423          	sd	ra,40(sp)
    80002f20:	02813023          	sd	s0,32(sp)
    80002f24:	00913c23          	sd	s1,24(sp)
    80002f28:	01213823          	sd	s2,16(sp)
    80002f2c:	01313423          	sd	s3,8(sp)
    80002f30:	03010413          	addi	s0,sp,48
    80002f34:	00050493          	mv	s1,a0
    80002f38:	00058913          	mv	s2,a1
        if(!instance.flag){
    80002f3c:	0000a797          	auipc	a5,0xa
    80002f40:	94c7c783          	lbu	a5,-1716(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80002f44:	04078a63          	beqz	a5,80002f98 <_ZN3TCB14addBlockedElemEPS_+0x80>
    BlockedElem *newElem = (BlockedElem*)MemAlloc::getAllocator().mem_alloc((sizeof(BlockedElem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80002f48:	00100593          	li	a1,1
    80002f4c:	0000a517          	auipc	a0,0xa
    80002f50:	93450513          	addi	a0,a0,-1740 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002f54:	00000097          	auipc	ra,0x0
    80002f58:	618080e7          	jalr	1560(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    newElem->next= nullptr;
    80002f5c:	00053423          	sd	zero,8(a0)
    newElem->prev= nullptr;
    80002f60:	00053823          	sd	zero,16(a0)
    newElem->thread=t;
    80002f64:	01253023          	sd	s2,0(a0)
    if (!this->blockedHead) {
    80002f68:	0404b783          	ld	a5,64(s1)
    80002f6c:	08078463          	beqz	a5,80002ff4 <_ZN3TCB14addBlockedElemEPS_+0xdc>
        this->blockedHead = newElem;
    } else {
        newElem->next = this->blockedHead;
    80002f70:	00f53423          	sd	a5,8(a0)
        this->blockedHead->prev=newElem;
    80002f74:	00a7b823          	sd	a0,16(a5)
        this->blockedHead = newElem;
    80002f78:	04a4b023          	sd	a0,64(s1)
    }
}
    80002f7c:	02813083          	ld	ra,40(sp)
    80002f80:	02013403          	ld	s0,32(sp)
    80002f84:	01813483          	ld	s1,24(sp)
    80002f88:	01013903          	ld	s2,16(sp)
    80002f8c:	00813983          	ld	s3,8(sp)
    80002f90:	03010113          	addi	sp,sp,48
    80002f94:	00008067          	ret
            instance.flag=true;
    80002f98:	0000a797          	auipc	a5,0xa
    80002f9c:	8e878793          	addi	a5,a5,-1816 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80002fa0:	00100713          	li	a4,1
    80002fa4:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80002fa8:	0000a697          	auipc	a3,0xa
    80002fac:	8486b683          	ld	a3,-1976(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002fb0:	0006b703          	ld	a4,0(a3)
    80002fb4:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80002fb8:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80002fbc:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80002fc0:	0000a717          	auipc	a4,0xa
    80002fc4:	87873703          	ld	a4,-1928(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002fc8:	00073503          	ld	a0,0(a4)
    80002fcc:	0006b703          	ld	a4,0(a3)
    80002fd0:	40e50533          	sub	a0,a0,a4
    80002fd4:	40355513          	srai	a0,a0,0x3
    80002fd8:	0007b983          	ld	s3,0(a5)
    80002fdc:	00a9bc23          	sd	a0,24(s3)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80002fe0:	fe050513          	addi	a0,a0,-32
    80002fe4:	00000097          	auipc	ra,0x0
    80002fe8:	56c080e7          	jalr	1388(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80002fec:	00a9b823          	sd	a0,16(s3)
    80002ff0:	f59ff06f          	j	80002f48 <_ZN3TCB14addBlockedElemEPS_+0x30>
        this->blockedHead = newElem;
    80002ff4:	04a4b023          	sd	a0,64(s1)
    80002ff8:	f85ff06f          	j	80002f7c <_ZN3TCB14addBlockedElemEPS_+0x64>

0000000080002ffc <_ZN3TCB12_thread_joinEPS_>:
    if(handle && !handle->finished){
    80002ffc:	00050663          	beqz	a0,80003008 <_ZN3TCB12_thread_joinEPS_+0xc>
    80003000:	03854783          	lbu	a5,56(a0)
    80003004:	00078463          	beqz	a5,8000300c <_ZN3TCB12_thread_joinEPS_+0x10>
    80003008:	00008067          	ret
void TCB::_thread_join(TCB* handle) {
    8000300c:	ff010113          	addi	sp,sp,-16
    80003010:	00113423          	sd	ra,8(sp)
    80003014:	00813023          	sd	s0,0(sp)
    80003018:	01010413          	addi	s0,sp,16
        TCB::running->blocked=true;
    8000301c:	0000a597          	auipc	a1,0xa
    80003020:	8845b583          	ld	a1,-1916(a1) # 8000c8a0 <_ZN3TCB7runningE>
    80003024:	00100793          	li	a5,1
    80003028:	02f58ca3          	sb	a5,57(a1)
        handle->addBlockedElem(TCB::running);
    8000302c:	00000097          	auipc	ra,0x0
    80003030:	eec080e7          	jalr	-276(ra) # 80002f18 <_ZN3TCB14addBlockedElemEPS_>
        _thread_dispatch();
    80003034:	00000097          	auipc	ra,0x0
    80003038:	be0080e7          	jalr	-1056(ra) # 80002c14 <_ZN3TCB16_thread_dispatchEv>
}
    8000303c:	00813083          	ld	ra,8(sp)
    80003040:	00013403          	ld	s0,0(sp)
    80003044:	01010113          	addi	sp,sp,16
    80003048:	00008067          	ret

000000008000304c <_ZN3TCB14addSleepedElemEPS_>:

void TCB::addSleepedElem(TCB *t) {
    8000304c:	fe010113          	addi	sp,sp,-32
    80003050:	00113c23          	sd	ra,24(sp)
    80003054:	00813823          	sd	s0,16(sp)
    80003058:	00913423          	sd	s1,8(sp)
    8000305c:	01213023          	sd	s2,0(sp)
    80003060:	02010413          	addi	s0,sp,32
    80003064:	00050493          	mv	s1,a0
        if(!instance.flag){
    80003068:	0000a797          	auipc	a5,0xa
    8000306c:	8207c783          	lbu	a5,-2016(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80003070:	02078e63          	beqz	a5,800030ac <_ZN3TCB14addSleepedElemEPS_+0x60>
    BlockedElem *newElem = (BlockedElem*)MemAlloc::getAllocator().mem_alloc((sizeof(BlockedElem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80003074:	00100593          	li	a1,1
    80003078:	0000a517          	auipc	a0,0xa
    8000307c:	80850513          	addi	a0,a0,-2040 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80003080:	00000097          	auipc	ra,0x0
    80003084:	4ec080e7          	jalr	1260(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    newElem->next= nullptr;
    80003088:	00053423          	sd	zero,8(a0)
    newElem->prev= nullptr;
    8000308c:	00053823          	sd	zero,16(a0)
    newElem->thread=t;
    80003090:	00953023          	sd	s1,0(a0)
    if(!sleepHead){
    80003094:	0000a797          	auipc	a5,0xa
    80003098:	8147b783          	ld	a5,-2028(a5) # 8000c8a8 <_ZN3TCB9sleepHeadE>
    8000309c:	06079863          	bnez	a5,8000310c <_ZN3TCB14addSleepedElemEPS_+0xc0>
        sleepHead=newElem;
    800030a0:	0000a797          	auipc	a5,0xa
    800030a4:	80a7b423          	sd	a0,-2040(a5) # 8000c8a8 <_ZN3TCB9sleepHeadE>
    800030a8:	0a00006f          	j	80003148 <_ZN3TCB14addSleepedElemEPS_+0xfc>
            instance.flag=true;
    800030ac:	00009797          	auipc	a5,0x9
    800030b0:	7d478793          	addi	a5,a5,2004 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800030b4:	00100713          	li	a4,1
    800030b8:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    800030bc:	00009697          	auipc	a3,0x9
    800030c0:	7346b683          	ld	a3,1844(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800030c4:	0006b703          	ld	a4,0(a3)
    800030c8:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    800030cc:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    800030d0:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    800030d4:	00009717          	auipc	a4,0x9
    800030d8:	76473703          	ld	a4,1892(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    800030dc:	00073503          	ld	a0,0(a4)
    800030e0:	0006b703          	ld	a4,0(a3)
    800030e4:	40e50533          	sub	a0,a0,a4
    800030e8:	40355513          	srai	a0,a0,0x3
    800030ec:	0007b903          	ld	s2,0(a5)
    800030f0:	00a93c23          	sd	a0,24(s2)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    800030f4:	fe050513          	addi	a0,a0,-32
    800030f8:	00000097          	auipc	ra,0x0
    800030fc:	458080e7          	jalr	1112(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80003100:	00a93823          	sd	a0,16(s2)
    80003104:	f71ff06f          	j	80003074 <_ZN3TCB14addSleepedElemEPS_+0x28>
    }else{
        BlockedElem* tmp=sleepHead;
        while(t->sleepTime > tmp->thread->sleepTime && tmp->next){
            tmp=tmp->next;
    80003108:	00070793          	mv	a5,a4
        while(t->sleepTime > tmp->thread->sleepTime && tmp->next){
    8000310c:	0184b603          	ld	a2,24(s1)
    80003110:	0007b703          	ld	a4,0(a5)
    80003114:	01873683          	ld	a3,24(a4)
    80003118:	00c6f663          	bgeu	a3,a2,80003124 <_ZN3TCB14addSleepedElemEPS_+0xd8>
    8000311c:	0087b703          	ld	a4,8(a5)
    80003120:	fe0714e3          	bnez	a4,80003108 <_ZN3TCB14addSleepedElemEPS_+0xbc>
        }
        if(tmp->next || t->sleepTime < tmp->thread->sleepTime ) {
    80003124:	0087b703          	ld	a4,8(a5)
    80003128:	02070c63          	beqz	a4,80003160 <_ZN3TCB14addSleepedElemEPS_+0x114>
            newElem->prev = tmp->prev;
    8000312c:	0107b703          	ld	a4,16(a5)
    80003130:	00e53823          	sd	a4,16(a0)
            newElem->next = tmp;
    80003134:	00f53423          	sd	a5,8(a0)
            tmp->prev = newElem;
    80003138:	00a7b823          	sd	a0,16(a5)
            if (newElem->prev) newElem->prev->next = newElem;
    8000313c:	01053783          	ld	a5,16(a0)
    80003140:	02078a63          	beqz	a5,80003174 <_ZN3TCB14addSleepedElemEPS_+0x128>
    80003144:	00a7b423          	sd	a0,8(a5)
            newElem->next=tmp->next;
            newElem->prev=tmp;
            tmp->next=newElem;
        } // lista je uredjena po rastucem redosledu spavanja
    }
}
    80003148:	01813083          	ld	ra,24(sp)
    8000314c:	01013403          	ld	s0,16(sp)
    80003150:	00813483          	ld	s1,8(sp)
    80003154:	00013903          	ld	s2,0(sp)
    80003158:	02010113          	addi	sp,sp,32
    8000315c:	00008067          	ret
        if(tmp->next || t->sleepTime < tmp->thread->sleepTime ) {
    80003160:	fcd666e3          	bltu	a2,a3,8000312c <_ZN3TCB14addSleepedElemEPS_+0xe0>
            newElem->next=tmp->next;
    80003164:	00e53423          	sd	a4,8(a0)
            newElem->prev=tmp;
    80003168:	00f53823          	sd	a5,16(a0)
            tmp->next=newElem;
    8000316c:	00a7b423          	sd	a0,8(a5)
}
    80003170:	fd9ff06f          	j	80003148 <_ZN3TCB14addSleepedElemEPS_+0xfc>
            else sleepHead=newElem;
    80003174:	00009797          	auipc	a5,0x9
    80003178:	72a7ba23          	sd	a0,1844(a5) # 8000c8a8 <_ZN3TCB9sleepHeadE>
    8000317c:	fcdff06f          	j	80003148 <_ZN3TCB14addSleepedElemEPS_+0xfc>

0000000080003180 <_ZN3TCB11_time_sleepEm>:

int TCB::_time_sleep(time_t time) {
    if(time==0) return 0;
    80003180:	00051663          	bnez	a0,8000318c <_ZN3TCB11_time_sleepEm+0xc>
    TCB::running->sleepTime=time;
    addSleepedElem(TCB::running);
    _thread_dispatch();
    return 0;
}
    80003184:	00000513          	li	a0,0
    80003188:	00008067          	ret
int TCB::_time_sleep(time_t time) {
    8000318c:	ff010113          	addi	sp,sp,-16
    80003190:	00113423          	sd	ra,8(sp)
    80003194:	00813023          	sd	s0,0(sp)
    80003198:	01010413          	addi	s0,sp,16
    8000319c:	00050793          	mv	a5,a0
    TCB::running->sleepTime=time;
    800031a0:	00009517          	auipc	a0,0x9
    800031a4:	70053503          	ld	a0,1792(a0) # 8000c8a0 <_ZN3TCB7runningE>
    800031a8:	00f53c23          	sd	a5,24(a0)
    addSleepedElem(TCB::running);
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	ea0080e7          	jalr	-352(ra) # 8000304c <_ZN3TCB14addSleepedElemEPS_>
    _thread_dispatch();
    800031b4:	00000097          	auipc	ra,0x0
    800031b8:	a60080e7          	jalr	-1440(ra) # 80002c14 <_ZN3TCB16_thread_dispatchEv>
}
    800031bc:	00000513          	li	a0,0
    800031c0:	00813083          	ld	ra,8(sp)
    800031c4:	00013403          	ld	s0,0(sp)
    800031c8:	01010113          	addi	sp,sp,16
    800031cc:	00008067          	ret

00000000800031d0 <_ZN3TCB24removeElemsFromSleepListEv>:

void TCB::removeElemsFromSleepList() {
    while(sleepHead && sleepHead->thread->getSleepTime()==0){
    800031d0:	00009797          	auipc	a5,0x9
    800031d4:	6d87b783          	ld	a5,1752(a5) # 8000c8a8 <_ZN3TCB9sleepHeadE>
    800031d8:	0e078e63          	beqz	a5,800032d4 <_ZN3TCB24removeElemsFromSleepListEv+0x104>
    800031dc:	0007b503          	ld	a0,0(a5)
    size_t getTimeSlice() const {return timeSlice;}
    //~TCB(){if(stack) delete stack;}

    static BlockedElem* sleepHead;
    void decSleepTime(){sleepTime--;}
    size_t getSleepTime(){return sleepTime;}
    800031e0:	01853783          	ld	a5,24(a0)
    800031e4:	0e079863          	bnez	a5,800032d4 <_ZN3TCB24removeElemsFromSleepListEv+0x104>
void TCB::removeElemsFromSleepList() {
    800031e8:	fe010113          	addi	sp,sp,-32
    800031ec:	00113c23          	sd	ra,24(sp)
    800031f0:	00813823          	sd	s0,16(sp)
    800031f4:	00913423          	sd	s1,8(sp)
    800031f8:	01213023          	sd	s2,0(sp)
    800031fc:	02010413          	addi	s0,sp,32
    80003200:	0880006f          	j	80003288 <_ZN3TCB24removeElemsFromSleepListEv+0xb8>
            instance.flag=true;
    80003204:	00009797          	auipc	a5,0x9
    80003208:	67c78793          	addi	a5,a5,1660 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    8000320c:	00100713          	li	a4,1
    80003210:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80003214:	00009697          	auipc	a3,0x9
    80003218:	5dc6b683          	ld	a3,1500(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000321c:	0006b703          	ld	a4,0(a3)
    80003220:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80003224:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80003228:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    8000322c:	00009717          	auipc	a4,0x9
    80003230:	60c73703          	ld	a4,1548(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003234:	00073503          	ld	a0,0(a4)
    80003238:	0006b703          	ld	a4,0(a3)
    8000323c:	40e50533          	sub	a0,a0,a4
    80003240:	40355513          	srai	a0,a0,0x3
    80003244:	0007b903          	ld	s2,0(a5)
    80003248:	00a93c23          	sd	a0,24(s2)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    8000324c:	fe050513          	addi	a0,a0,-32
    80003250:	00000097          	auipc	ra,0x0
    80003254:	300080e7          	jalr	768(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80003258:	00a93823          	sd	a0,16(s2)
        Scheduler::put(sleepHead->thread);
        BlockedElem* old=sleepHead;
        sleepHead=sleepHead->next;
        if(sleepHead) sleepHead->prev= nullptr;
        MemAlloc::getAllocator().mem_free(old);
    8000325c:	00048593          	mv	a1,s1
    80003260:	00009517          	auipc	a0,0x9
    80003264:	62050513          	addi	a0,a0,1568 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80003268:	00000097          	auipc	ra,0x0
    8000326c:	4e8080e7          	jalr	1256(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
    while(sleepHead && sleepHead->thread->getSleepTime()==0){
    80003270:	00009797          	auipc	a5,0x9
    80003274:	6387b783          	ld	a5,1592(a5) # 8000c8a8 <_ZN3TCB9sleepHeadE>
    80003278:	04078263          	beqz	a5,800032bc <_ZN3TCB24removeElemsFromSleepListEv+0xec>
    8000327c:	0007b503          	ld	a0,0(a5)
    80003280:	01853783          	ld	a5,24(a0)
    80003284:	02079c63          	bnez	a5,800032bc <_ZN3TCB24removeElemsFromSleepListEv+0xec>
        Scheduler::put(sleepHead->thread);
    80003288:	fffff097          	auipc	ra,0xfffff
    8000328c:	df8080e7          	jalr	-520(ra) # 80002080 <_ZN9Scheduler3putEP3TCB>
        BlockedElem* old=sleepHead;
    80003290:	00009717          	auipc	a4,0x9
    80003294:	61070713          	addi	a4,a4,1552 # 8000c8a0 <_ZN3TCB7runningE>
    80003298:	00873483          	ld	s1,8(a4)
        sleepHead=sleepHead->next;
    8000329c:	0084b783          	ld	a5,8(s1)
    800032a0:	00f73423          	sd	a5,8(a4)
        if(sleepHead) sleepHead->prev= nullptr;
    800032a4:	00078463          	beqz	a5,800032ac <_ZN3TCB24removeElemsFromSleepListEv+0xdc>
    800032a8:	0007b823          	sd	zero,16(a5)
        if(!instance.flag){
    800032ac:	00009797          	auipc	a5,0x9
    800032b0:	5dc7c783          	lbu	a5,1500(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    800032b4:	fa0794e3          	bnez	a5,8000325c <_ZN3TCB24removeElemsFromSleepListEv+0x8c>
    800032b8:	f4dff06f          	j	80003204 <_ZN3TCB24removeElemsFromSleepListEv+0x34>
    }
}
    800032bc:	01813083          	ld	ra,24(sp)
    800032c0:	01013403          	ld	s0,16(sp)
    800032c4:	00813483          	ld	s1,8(sp)
    800032c8:	00013903          	ld	s2,0(sp)
    800032cc:	02010113          	addi	sp,sp,32
    800032d0:	00008067          	ret
    800032d4:	00008067          	ret

00000000800032d8 <_ZN3Con5putcOEc>:
//
// Created by os on 8/16/23.
//
#include "../h/Con.h"

void Con::putcO(char c){outputBuf->put(c);}
    800032d8:	ff010113          	addi	sp,sp,-16
    800032dc:	00113423          	sd	ra,8(sp)
    800032e0:	00813023          	sd	s0,0(sp)
    800032e4:	01010413          	addi	s0,sp,16
    800032e8:	00853503          	ld	a0,8(a0)
    800032ec:	fffff097          	auipc	ra,0xfffff
    800032f0:	2c0080e7          	jalr	704(ra) # 800025ac <_ZN3Buf3putEc>
    800032f4:	00813083          	ld	ra,8(sp)
    800032f8:	00013403          	ld	s0,0(sp)
    800032fc:	01010113          	addi	sp,sp,16
    80003300:	00008067          	ret

0000000080003304 <_ZN3Con5putcIEc>:
void Con::putcI(char c){inputBuf->put(c);}
    80003304:	ff010113          	addi	sp,sp,-16
    80003308:	00113423          	sd	ra,8(sp)
    8000330c:	00813023          	sd	s0,0(sp)
    80003310:	01010413          	addi	s0,sp,16
    80003314:	00053503          	ld	a0,0(a0)
    80003318:	fffff097          	auipc	ra,0xfffff
    8000331c:	294080e7          	jalr	660(ra) # 800025ac <_ZN3Buf3putEc>
    80003320:	00813083          	ld	ra,8(sp)
    80003324:	00013403          	ld	s0,0(sp)
    80003328:	01010113          	addi	sp,sp,16
    8000332c:	00008067          	ret

0000000080003330 <_ZN3Con5getcOEv>:
char Con::getcO(){ return outputBuf->get();}
    80003330:	ff010113          	addi	sp,sp,-16
    80003334:	00113423          	sd	ra,8(sp)
    80003338:	00813023          	sd	s0,0(sp)
    8000333c:	01010413          	addi	s0,sp,16
    80003340:	00853503          	ld	a0,8(a0)
    80003344:	fffff097          	auipc	ra,0xfffff
    80003348:	2e8080e7          	jalr	744(ra) # 8000262c <_ZN3Buf3getEv>
    8000334c:	00813083          	ld	ra,8(sp)
    80003350:	00013403          	ld	s0,0(sp)
    80003354:	01010113          	addi	sp,sp,16
    80003358:	00008067          	ret

000000008000335c <_ZN3Con5getcIEv>:
char Con::getcI(){ return inputBuf->get();}
    8000335c:	ff010113          	addi	sp,sp,-16
    80003360:	00113423          	sd	ra,8(sp)
    80003364:	00813023          	sd	s0,0(sp)
    80003368:	01010413          	addi	s0,sp,16
    8000336c:	00053503          	ld	a0,0(a0)
    80003370:	fffff097          	auipc	ra,0xfffff
    80003374:	2bc080e7          	jalr	700(ra) # 8000262c <_ZN3Buf3getEv>
    80003378:	00813083          	ld	ra,8(sp)
    8000337c:	00013403          	ld	s0,0(sp)
    80003380:	01010113          	addi	sp,sp,16
    80003384:	00008067          	ret

0000000080003388 <_ZN3Con18getConsoleInstanceEv>:
Con& Con::getConsoleInstance(){
    static Con instance;
    if(first){
    80003388:	00009797          	auipc	a5,0x9
    8000338c:	2b07c783          	lbu	a5,688(a5) # 8000c638 <_ZL5first>
    80003390:	00079863          	bnez	a5,800033a0 <_ZN3Con18getConsoleInstanceEv+0x18>
        instance.outputBuf=(Buf*)MemAlloc::getAllocator().mem_alloc((sizeof(Buf)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
        *instance.inputBuf=Buf();
        *instance.outputBuf=Buf();
    }
    return instance;
}
    80003394:	00009517          	auipc	a0,0x9
    80003398:	52450513          	addi	a0,a0,1316 # 8000c8b8 <_ZZN3Con18getConsoleInstanceEvE8instance>
    8000339c:	00008067          	ret
Con& Con::getConsoleInstance(){
    800033a0:	fc010113          	addi	sp,sp,-64
    800033a4:	02113c23          	sd	ra,56(sp)
    800033a8:	02813823          	sd	s0,48(sp)
    800033ac:	02913423          	sd	s1,40(sp)
    800033b0:	03213023          	sd	s2,32(sp)
    800033b4:	04010413          	addi	s0,sp,64
        first=false;
    800033b8:	00009797          	auipc	a5,0x9
    800033bc:	28078023          	sb	zero,640(a5) # 8000c638 <_ZL5first>
    800033c0:	00009797          	auipc	a5,0x9
    800033c4:	4c87c783          	lbu	a5,1224(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    800033c8:	0c078863          	beqz	a5,80003498 <_ZN3Con18getConsoleInstanceEv+0x110>
        instance.inputBuf= (Buf*)MemAlloc::getAllocator().mem_alloc((sizeof(Buf)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    800033cc:	00100593          	li	a1,1
    800033d0:	00009517          	auipc	a0,0x9
    800033d4:	4b050513          	addi	a0,a0,1200 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800033d8:	00000097          	auipc	ra,0x0
    800033dc:	194080e7          	jalr	404(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    800033e0:	00009797          	auipc	a5,0x9
    800033e4:	4ca7bc23          	sd	a0,1240(a5) # 8000c8b8 <_ZZN3Con18getConsoleInstanceEvE8instance>
    800033e8:	00009797          	auipc	a5,0x9
    800033ec:	4a07c783          	lbu	a5,1184(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    800033f0:	10078263          	beqz	a5,800034f4 <_ZN3Con18getConsoleInstanceEv+0x16c>
        instance.outputBuf=(Buf*)MemAlloc::getAllocator().mem_alloc((sizeof(Buf)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    800033f4:	00100593          	li	a1,1
    800033f8:	00009517          	auipc	a0,0x9
    800033fc:	48850513          	addi	a0,a0,1160 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80003400:	00000097          	auipc	ra,0x0
    80003404:	16c080e7          	jalr	364(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    80003408:	00009497          	auipc	s1,0x9
    8000340c:	4b048493          	addi	s1,s1,1200 # 8000c8b8 <_ZZN3Con18getConsoleInstanceEvE8instance>
    80003410:	00a4b423          	sd	a0,8(s1)
        *instance.inputBuf=Buf();
    80003414:	fc040913          	addi	s2,s0,-64
    80003418:	00090513          	mv	a0,s2
    8000341c:	fffff097          	auipc	ra,0xfffff
    80003420:	0b0080e7          	jalr	176(ra) # 800024cc <_ZN3BufC1Ev>
    80003424:	0004b783          	ld	a5,0(s1)
    80003428:	fc843603          	ld	a2,-56(s0)
    8000342c:	fd043683          	ld	a3,-48(s0)
    80003430:	fd843703          	ld	a4,-40(s0)
    80003434:	fc043583          	ld	a1,-64(s0)
    80003438:	00b7b023          	sd	a1,0(a5)
    8000343c:	00c7b423          	sd	a2,8(a5)
    80003440:	00d7b823          	sd	a3,16(a5)
    80003444:	00e7bc23          	sd	a4,24(a5)
        *instance.outputBuf=Buf();
    80003448:	00090513          	mv	a0,s2
    8000344c:	fffff097          	auipc	ra,0xfffff
    80003450:	080080e7          	jalr	128(ra) # 800024cc <_ZN3BufC1Ev>
    80003454:	0084b783          	ld	a5,8(s1)
    80003458:	fc843603          	ld	a2,-56(s0)
    8000345c:	fd043683          	ld	a3,-48(s0)
    80003460:	fd843703          	ld	a4,-40(s0)
    80003464:	fc043583          	ld	a1,-64(s0)
    80003468:	00b7b023          	sd	a1,0(a5)
    8000346c:	00c7b423          	sd	a2,8(a5)
    80003470:	00d7b823          	sd	a3,16(a5)
    80003474:	00e7bc23          	sd	a4,24(a5)
}
    80003478:	00009517          	auipc	a0,0x9
    8000347c:	44050513          	addi	a0,a0,1088 # 8000c8b8 <_ZZN3Con18getConsoleInstanceEvE8instance>
    80003480:	03813083          	ld	ra,56(sp)
    80003484:	03013403          	ld	s0,48(sp)
    80003488:	02813483          	ld	s1,40(sp)
    8000348c:	02013903          	ld	s2,32(sp)
    80003490:	04010113          	addi	sp,sp,64
    80003494:	00008067          	ret
            instance.flag=true;
    80003498:	00009797          	auipc	a5,0x9
    8000349c:	3e878793          	addi	a5,a5,1000 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800034a0:	00100713          	li	a4,1
    800034a4:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    800034a8:	00009697          	auipc	a3,0x9
    800034ac:	3486b683          	ld	a3,840(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800034b0:	0006b703          	ld	a4,0(a3)
    800034b4:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    800034b8:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    800034bc:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    800034c0:	00009717          	auipc	a4,0x9
    800034c4:	37873703          	ld	a4,888(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    800034c8:	00073503          	ld	a0,0(a4)
    800034cc:	0006b703          	ld	a4,0(a3)
    800034d0:	40e50533          	sub	a0,a0,a4
    800034d4:	40355513          	srai	a0,a0,0x3
    800034d8:	0007b483          	ld	s1,0(a5)
    800034dc:	00a4bc23          	sd	a0,24(s1)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    800034e0:	fe050513          	addi	a0,a0,-32
    800034e4:	00000097          	auipc	ra,0x0
    800034e8:	06c080e7          	jalr	108(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800034ec:	00a4b823          	sd	a0,16(s1)
    800034f0:	eddff06f          	j	800033cc <_ZN3Con18getConsoleInstanceEv+0x44>
            instance.flag=true;
    800034f4:	00009797          	auipc	a5,0x9
    800034f8:	38c78793          	addi	a5,a5,908 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800034fc:	00100713          	li	a4,1
    80003500:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80003504:	00009697          	auipc	a3,0x9
    80003508:	2ec6b683          	ld	a3,748(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000350c:	0006b703          	ld	a4,0(a3)
    80003510:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80003514:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80003518:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    8000351c:	00009717          	auipc	a4,0x9
    80003520:	31c73703          	ld	a4,796(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003524:	00073503          	ld	a0,0(a4)
    80003528:	0006b703          	ld	a4,0(a3)
    8000352c:	40e50533          	sub	a0,a0,a4
    80003530:	40355513          	srai	a0,a0,0x3
    80003534:	0007b483          	ld	s1,0(a5)
    80003538:	00a4bc23          	sd	a0,24(s1)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    8000353c:	fe050513          	addi	a0,a0,-32
    80003540:	00000097          	auipc	ra,0x0
    80003544:	010080e7          	jalr	16(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80003548:	00a4b823          	sd	a0,16(s1)
    8000354c:	ea9ff06f          	j	800033f4 <_ZN3Con18getConsoleInstanceEv+0x6c>

0000000080003550 <_ZN8MemAlloc13bytesToBlocksEm>:
        seg->next=seg->next->next;
        if(seg->next) seg->next->prev=seg;
    }
}

size_t MemAlloc::bytesToBlocks(size_t s) {
    80003550:	ff010113          	addi	sp,sp,-16
    80003554:	00813423          	sd	s0,8(sp)
    80003558:	01010413          	addi	s0,sp,16
    return s/MEM_BLOCK_SIZE;
}
    8000355c:	00655513          	srli	a0,a0,0x6
    80003560:	00813403          	ld	s0,8(sp)
    80003564:	01010113          	addi	sp,sp,16
    80003568:	00008067          	ret

000000008000356c <_ZN8MemAlloc9mem_allocEm>:
void* MemAlloc::mem_alloc(size_t sz) {
    8000356c:	fd010113          	addi	sp,sp,-48
    80003570:	02113423          	sd	ra,40(sp)
    80003574:	02813023          	sd	s0,32(sp)
    80003578:	00913c23          	sd	s1,24(sp)
    8000357c:	01213823          	sd	s2,16(sp)
    80003580:	01313423          	sd	s3,8(sp)
    80003584:	01413023          	sd	s4,0(sp)
    80003588:	03010413          	addi	s0,sp,48
    8000358c:	00050a13          	mv	s4,a0
    80003590:	00058913          	mv	s2,a1
    for(FreeSeg* tmp=headFree;tmp;tmp=tmp->next) {
    80003594:	00053483          	ld	s1,0(a0)
    80003598:	08048063          	beqz	s1,80003618 <_ZN8MemAlloc9mem_allocEm+0xac>
        if (tmp->szBl < sz) continue;
    8000359c:	0104b783          	ld	a5,16(s1)
    800035a0:	0927ee63          	bltu	a5,s2,8000363c <_ZN8MemAlloc9mem_allocEm+0xd0>
        if (tmp->szBl == sz) {
    800035a4:	0b278063          	beq	a5,s2,80003644 <_ZN8MemAlloc9mem_allocEm+0xd8>
            FreeSeg *newSeg = (FreeSeg *) ((uint8 *) tmp + sz * MEM_BLOCK_SIZE + sizeof(FreeSeg));
    800035a8:	00691793          	slli	a5,s2,0x6
    800035ac:	02078993          	addi	s3,a5,32
    800035b0:	013489b3          	add	s3,s1,s3
            newSeg->next = tmp->next;
    800035b4:	0084b703          	ld	a4,8(s1)
    800035b8:	00e9b423          	sd	a4,8(s3)
            newSeg->prev = tmp->prev;
    800035bc:	0004b703          	ld	a4,0(s1)
    800035c0:	00e9b023          	sd	a4,0(s3)
            newSeg->szBy = tmp->szBy - sz * MEM_BLOCK_SIZE - sizeof(FreeSeg);
    800035c4:	0184b503          	ld	a0,24(s1)
    800035c8:	40f50533          	sub	a0,a0,a5
    800035cc:	fe050793          	addi	a5,a0,-32
    800035d0:	00f9bc23          	sd	a5,24(s3)
            newSeg->szBl = bytesToBlocks(newSeg->szBy - sizeof(FreeSeg));
    800035d4:	fc050513          	addi	a0,a0,-64
    800035d8:	00000097          	auipc	ra,0x0
    800035dc:	f78080e7          	jalr	-136(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800035e0:	00a9b823          	sd	a0,16(s3)
            if (tmp->prev) tmp->prev->next = newSeg;
    800035e4:	0004b783          	ld	a5,0(s1)
    800035e8:	00078463          	beqz	a5,800035f0 <_ZN8MemAlloc9mem_allocEm+0x84>
    800035ec:	0137b423          	sd	s3,8(a5)
            if (tmp->next) tmp->next->prev = newSeg;
    800035f0:	0084b783          	ld	a5,8(s1)
    800035f4:	00078463          	beqz	a5,800035fc <_ZN8MemAlloc9mem_allocEm+0x90>
    800035f8:	0137b023          	sd	s3,0(a5)
            if (tmp == headFree) headFree = newSeg;
    800035fc:	000a3783          	ld	a5,0(s4)
    80003600:	06978c63          	beq	a5,s1,80003678 <_ZN8MemAlloc9mem_allocEm+0x10c>
        tmp->szBy = sz * MEM_BLOCK_SIZE + sizeof(FreeSeg);
    80003604:	00691793          	slli	a5,s2,0x6
    80003608:	02078793          	addi	a5,a5,32
    8000360c:	00f4bc23          	sd	a5,24(s1)
        tmp->szBl = sz;
    80003610:	0124b823          	sd	s2,16(s1)
        ret = (uint8 *) tmp + sizeof(FreeSeg);
    80003614:	02048493          	addi	s1,s1,32
}
    80003618:	00048513          	mv	a0,s1
    8000361c:	02813083          	ld	ra,40(sp)
    80003620:	02013403          	ld	s0,32(sp)
    80003624:	01813483          	ld	s1,24(sp)
    80003628:	01013903          	ld	s2,16(sp)
    8000362c:	00813983          	ld	s3,8(sp)
    80003630:	00013a03          	ld	s4,0(sp)
    80003634:	03010113          	addi	sp,sp,48
    80003638:	00008067          	ret
    for(FreeSeg* tmp=headFree;tmp;tmp=tmp->next) {
    8000363c:	0084b483          	ld	s1,8(s1)
    80003640:	f59ff06f          	j	80003598 <_ZN8MemAlloc9mem_allocEm+0x2c>
            if (tmp->prev) tmp->prev->next = tmp->next;
    80003644:	0004b783          	ld	a5,0(s1)
    80003648:	00078663          	beqz	a5,80003654 <_ZN8MemAlloc9mem_allocEm+0xe8>
    8000364c:	0084b703          	ld	a4,8(s1)
    80003650:	00e7b423          	sd	a4,8(a5)
            if (tmp->next) tmp->next->prev = tmp->prev;
    80003654:	0084b783          	ld	a5,8(s1)
    80003658:	00078663          	beqz	a5,80003664 <_ZN8MemAlloc9mem_allocEm+0xf8>
    8000365c:	0004b703          	ld	a4,0(s1)
    80003660:	00e7b023          	sd	a4,0(a5)
            if (tmp == headFree) headFree = headFree->next;
    80003664:	000a3783          	ld	a5,0(s4)
    80003668:	f8979ee3          	bne	a5,s1,80003604 <_ZN8MemAlloc9mem_allocEm+0x98>
    8000366c:	0087b783          	ld	a5,8(a5)
    80003670:	00fa3023          	sd	a5,0(s4)
    80003674:	f91ff06f          	j	80003604 <_ZN8MemAlloc9mem_allocEm+0x98>
            if (tmp == headFree) headFree = newSeg;
    80003678:	013a3023          	sd	s3,0(s4)
    8000367c:	f89ff06f          	j	80003604 <_ZN8MemAlloc9mem_allocEm+0x98>

0000000080003680 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE>:
void MemAlloc::tryToMerge(FreeSeg* seg) {
    80003680:	fe010113          	addi	sp,sp,-32
    80003684:	00113c23          	sd	ra,24(sp)
    80003688:	00813823          	sd	s0,16(sp)
    8000368c:	00913423          	sd	s1,8(sp)
    80003690:	01213023          	sd	s2,0(sp)
    80003694:	02010413          	addi	s0,sp,32
    80003698:	00058493          	mv	s1,a1
    if(seg->prev && (uint8 *)seg->prev+seg->prev->szBy==(uint8 *)seg) {
    8000369c:	0005b783          	ld	a5,0(a1)
    800036a0:	00078863          	beqz	a5,800036b0 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE+0x30>
    800036a4:	0187b703          	ld	a4,24(a5)
    800036a8:	00e786b3          	add	a3,a5,a4
    800036ac:	02b68863          	beq	a3,a1,800036dc <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE+0x5c>
    if(seg->next && (uint8 *)seg+seg->szBy==(uint8 *)seg->next) {
    800036b0:	0084b903          	ld	s2,8(s1)
    800036b4:	00090863          	beqz	s2,800036c4 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE+0x44>
    800036b8:	0184b503          	ld	a0,24(s1)
    800036bc:	00a487b3          	add	a5,s1,a0
    800036c0:	06f90063          	beq	s2,a5,80003720 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE+0xa0>
}
    800036c4:	01813083          	ld	ra,24(sp)
    800036c8:	01013403          	ld	s0,16(sp)
    800036cc:	00813483          	ld	s1,8(sp)
    800036d0:	00013903          	ld	s2,0(sp)
    800036d4:	02010113          	addi	sp,sp,32
    800036d8:	00008067          	ret
        seg->prev->szBy+=seg->szBy;
    800036dc:	0185b683          	ld	a3,24(a1)
    800036e0:	00d70733          	add	a4,a4,a3
    800036e4:	00e7bc23          	sd	a4,24(a5)
        seg->prev->szBl=bytesToBlocks(seg->prev->szBy-sizeof(FreeSeg));
    800036e8:	0005b903          	ld	s2,0(a1)
    800036ec:	01893503          	ld	a0,24(s2)
    800036f0:	fe050513          	addi	a0,a0,-32
    800036f4:	00000097          	auipc	ra,0x0
    800036f8:	e5c080e7          	jalr	-420(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800036fc:	00a93823          	sd	a0,16(s2)
        seg->prev->next=seg->next;
    80003700:	0004b703          	ld	a4,0(s1)
    80003704:	0084b783          	ld	a5,8(s1)
    80003708:	00f73423          	sd	a5,8(a4)
        if(seg->next) seg->next->prev=seg->prev;
    8000370c:	00078663          	beqz	a5,80003718 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE+0x98>
    80003710:	0004b703          	ld	a4,0(s1)
    80003714:	00e7b023          	sd	a4,0(a5)
        seg=seg->prev;
    80003718:	0004b483          	ld	s1,0(s1)
    8000371c:	f95ff06f          	j	800036b0 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE+0x30>
        seg->szBy += seg->next->szBy;
    80003720:	01893783          	ld	a5,24(s2)
    80003724:	00f50533          	add	a0,a0,a5
    80003728:	00a4bc23          	sd	a0,24(s1)
        seg->szBl=bytesToBlocks(seg->szBy-sizeof(FreeSeg));
    8000372c:	fe050513          	addi	a0,a0,-32
    80003730:	00000097          	auipc	ra,0x0
    80003734:	e20080e7          	jalr	-480(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80003738:	00a4b823          	sd	a0,16(s1)
        seg->next=seg->next->next;
    8000373c:	00893783          	ld	a5,8(s2)
    80003740:	00f4b423          	sd	a5,8(s1)
        if(seg->next) seg->next->prev=seg;
    80003744:	f80780e3          	beqz	a5,800036c4 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE+0x44>
    80003748:	0097b023          	sd	s1,0(a5)
}
    8000374c:	f79ff06f          	j	800036c4 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE+0x44>

0000000080003750 <_ZN8MemAlloc8mem_freeEPv>:
    if(addr<HEAP_START_ADDR || addr>=HEAP_END_ADDR) return -1; //uopste ne pripada dinamickoj zoni
    80003750:	00009797          	auipc	a5,0x9
    80003754:	0a07b783          	ld	a5,160(a5) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003758:	0007b783          	ld	a5,0(a5)
    8000375c:	0cf5e863          	bltu	a1,a5,8000382c <_ZN8MemAlloc8mem_freeEPv+0xdc>
    80003760:	00058713          	mv	a4,a1
    80003764:	00009797          	auipc	a5,0x9
    80003768:	0d47b783          	ld	a5,212(a5) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000376c:	0007b783          	ld	a5,0(a5)
    80003770:	0cf5f263          	bgeu	a1,a5,80003834 <_ZN8MemAlloc8mem_freeEPv+0xe4>
    for(FreeSeg* tmp=headFree;tmp;tmp=tmp->next){
    80003774:	00053603          	ld	a2,0(a0)
    80003778:	00060793          	mv	a5,a2
    8000377c:	0080006f          	j	80003784 <_ZN8MemAlloc8mem_freeEPv+0x34>
    80003780:	0087b783          	ld	a5,8(a5)
    80003784:	00078e63          	beqz	a5,800037a0 <_ZN8MemAlloc8mem_freeEPv+0x50>
        if((uint8*)addr>=(uint8*)tmp && (uint8*)addr<(uint8*)tmp+tmp->szBy)
    80003788:	fef76ce3          	bltu	a4,a5,80003780 <_ZN8MemAlloc8mem_freeEPv+0x30>
    8000378c:	0187b683          	ld	a3,24(a5)
    80003790:	00d786b3          	add	a3,a5,a3
    80003794:	fed776e3          	bgeu	a4,a3,80003780 <_ZN8MemAlloc8mem_freeEPv+0x30>
            return -2; // nije alociran da bi se dealocirao
    80003798:	ffe00513          	li	a0,-2
}
    8000379c:	00008067          	ret
    FreeSeg* newSeg=(FreeSeg*)((uint8 *)addr-sizeof(FreeSeg));
    800037a0:	fe070593          	addi	a1,a4,-32
    if(!headFree) {
    800037a4:	04060063          	beqz	a2,800037e4 <_ZN8MemAlloc8mem_freeEPv+0x94>
int MemAlloc::mem_free(void *addr){
    800037a8:	ff010113          	addi	sp,sp,-16
    800037ac:	00113423          	sd	ra,8(sp)
    800037b0:	00813023          	sd	s0,0(sp)
    800037b4:	01010413          	addi	s0,sp,16
    if(newSeg<headFree){
    800037b8:	04c5f263          	bgeu	a1,a2,800037fc <_ZN8MemAlloc8mem_freeEPv+0xac>
        newSeg->next=headFree;
    800037bc:	fec73423          	sd	a2,-24(a4)
        headFree->prev=newSeg;
    800037c0:	00b63023          	sd	a1,0(a2)
        headFree=newSeg;
    800037c4:	00b53023          	sd	a1,0(a0)
    tryToMerge(newSeg);
    800037c8:	00000097          	auipc	ra,0x0
    800037cc:	eb8080e7          	jalr	-328(ra) # 80003680 <_ZN8MemAlloc10tryToMergeEPNS_7FreeSegE>
    return 0;
    800037d0:	00000513          	li	a0,0
}
    800037d4:	00813083          	ld	ra,8(sp)
    800037d8:	00013403          	ld	s0,0(sp)
    800037dc:	01010113          	addi	sp,sp,16
    800037e0:	00008067          	ret
        headFree=newSeg;
    800037e4:	00b53023          	sd	a1,0(a0)
        headFree->next= nullptr;
    800037e8:	0005b423          	sd	zero,8(a1)
        headFree->prev= nullptr;
    800037ec:	00053783          	ld	a5,0(a0)
    800037f0:	0007b023          	sd	zero,0(a5)
        return 0;
    800037f4:	00000513          	li	a0,0
    800037f8:	00008067          	ret
        for (tmp = headFree; tmp->next ; tmp = tmp->next){
    800037fc:	00060793          	mv	a5,a2
    80003800:	00863603          	ld	a2,8(a2)
    80003804:	00060663          	beqz	a2,80003810 <_ZN8MemAlloc8mem_freeEPv+0xc0>
            if((uint8 *) newSeg > (uint8*) tmp &&
    80003808:	feb7fae3          	bgeu	a5,a1,800037fc <_ZN8MemAlloc8mem_freeEPv+0xac>
    8000380c:	fec5f8e3          	bgeu	a1,a2,800037fc <_ZN8MemAlloc8mem_freeEPv+0xac>
        newSeg->next = tmp->next;
    80003810:	fec73423          	sd	a2,-24(a4)
        newSeg->prev = tmp;
    80003814:	fef73023          	sd	a5,-32(a4)
        tmp->next = newSeg;
    80003818:	00b7b423          	sd	a1,8(a5)
        if (newSeg->next) newSeg->next->prev = newSeg;
    8000381c:	fe873783          	ld	a5,-24(a4)
    80003820:	fa0784e3          	beqz	a5,800037c8 <_ZN8MemAlloc8mem_freeEPv+0x78>
    80003824:	00b7b023          	sd	a1,0(a5)
    80003828:	fa1ff06f          	j	800037c8 <_ZN8MemAlloc8mem_freeEPv+0x78>
    if(addr<HEAP_START_ADDR || addr>=HEAP_END_ADDR) return -1; //uopste ne pripada dinamickoj zoni
    8000382c:	fff00513          	li	a0,-1
    80003830:	00008067          	ret
    80003834:	fff00513          	li	a0,-1
    80003838:	00008067          	ret

000000008000383c <_ZN8RiscVReg10popSppSpieEv>:
//

#include "../h/RiscVReg.h"
#include "../h/printing.hpp"

void RiscVReg::popSppSpie(){
    8000383c:	ff010113          	addi	sp,sp,-16
    80003840:	00813423          	sd	s0,8(sp)
    80003844:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80003848:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    8000384c:	10200073          	sret
}
    80003850:	00813403          	ld	s0,8(sp)
    80003854:	01010113          	addi	sp,sp,16
    80003858:	00008067          	ret

000000008000385c <interruptHandler>:

extern "C" void interruptHandler(){
    8000385c:	fc010113          	addi	sp,sp,-64
    80003860:	02113c23          	sd	ra,56(sp)
    80003864:	02813823          	sd	s0,48(sp)
    80003868:	02913423          	sd	s1,40(sp)
    8000386c:	03213023          	sd	s2,32(sp)
    80003870:	01313c23          	sd	s3,24(sp)
    80003874:	01413823          	sd	s4,16(sp)
    80003878:	01513423          	sd	s5,8(sp)
    8000387c:	01613023          	sd	s6,0(sp)
    80003880:	04010413          	addi	s0,sp,64
    uint64 a1,a2,a3,a4;
    uint64 code;
    __asm__ volatile("mv %0, a0":"=r"(code));
    80003884:	00050793          	mv	a5,a0
    __asm__ volatile("ld %0, 14*8(s0)" : "=r" (a4));
    80003888:	07043703          	ld	a4,112(s0)
    __asm__ volatile("ld %0, 13*8(s0)" : "=r" (a3));
    8000388c:	06843a83          	ld	s5,104(s0)
    __asm__ volatile("ld %0, 12*8(s0)" : "=r" (a2));
    80003890:	06043983          	ld	s3,96(s0)
    __asm__ volatile("ld %0, 11*8(s0)" : "=r" (a1));
    80003894:	05843903          	ld	s2,88(s0)
    static void popSppSpie();
};

inline uint64 RiscVReg::read_scause() {
    uint64 ret;
    __asm__ volatile("csrr %0, scause" : "=r" (ret));
    80003898:	14202573          	csrr	a0,scause
    uint64 scauseV=RiscVReg::read_scause();
    uint64 sepcVar;
    __asm__ volatile("csrr %0, sepc" : "=r" (sepcVar));
    8000389c:	141024f3          	csrr	s1,sepc
    if(scauseV==0x08 || scauseV==0x09) { //sistemski poziv
    800038a0:	ff850613          	addi	a2,a0,-8
    800038a4:	00100713          	li	a4,1
    800038a8:	32c76863          	bltu	a4,a2,80003bd8 <interruptHandler+0x37c>
    return ret;
}

inline uint64 RiscVReg::read_sstatus() {
    uint64 ret;
    __asm__ volatile("csrr %0, sstatus" : "=r" (ret));
    800038ac:	10002a73          	csrr	s4,sstatus

        uint64 statusVar = RiscVReg::read_sstatus();

        if (code == 0x01) { //mem_alloc
    800038b0:	08e78463          	beq	a5,a4,80003938 <interruptHandler+0xdc>
            uint64 n = a1;
            void *addr = MemAlloc::getAllocator().mem_alloc((size_t) n);
            __asm__ volatile("mv a0, %0" : : "r" (addr));
        }else if (code == 0x02) { //mem_free
    800038b4:	00200713          	li	a4,2
    800038b8:	10e78063          	beq	a5,a4,800039b8 <interruptHandler+0x15c>
            uint64 addr = a1;
            int status = MemAlloc::getAllocator().mem_free((void *) addr);
            __asm__ volatile("mv a0, %0" : : "r" (status));
        }else if (code == 0x11) { //thread_create
    800038bc:	01100713          	li	a4,17
    800038c0:	16e78e63          	beq	a5,a4,80003a3c <interruptHandler+0x1e0>
            arg = (void *) a3;
            if(body) stack_space=MemAlloc::getAllocator().mem_alloc((DEFAULT_STACK_SIZE*8+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
            //stack_space = (void *) a4;
            int status = TCB::_thread_create(handle, body, arg, stack_space);
            __asm__ volatile("mv a0, %0": :"r"(status));
        }else if (code == 0x12) { //thread_exit
    800038c4:	01200713          	li	a4,18
    800038c8:	24e78463          	beq	a5,a4,80003b10 <interruptHandler+0x2b4>
            int status = TCB::_thread_exit();
            __asm__ volatile("mv a0, %0": :"r"(status));
        }else if (code == 0x13) { //thread_dispatch
    800038cc:	01300713          	li	a4,19
    800038d0:	24e78863          	beq	a5,a4,80003b20 <interruptHandler+0x2c4>
            TCB::_thread_dispatch();
        }else if (code == 0x14) { //thread_join
    800038d4:	01400713          	li	a4,20
    800038d8:	24e78a63          	beq	a5,a4,80003b2c <interruptHandler+0x2d0>
            TCB *handle = (TCB *) a1;
            TCB::_thread_join(handle);
        }else if(code==0x21) { //sem_open
    800038dc:	02100713          	li	a4,33
    800038e0:	24e78e63          	beq	a5,a4,80003b3c <interruptHandler+0x2e0>
            sem_t * handle=(sem_t*)a1;
            unsigned init=(unsigned)a2;
            int ret=Sem::_sem_open(handle,init);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x22) { //sem_close
    800038e4:	02200713          	li	a4,34
    800038e8:	26e78663          	beq	a5,a4,80003b54 <interruptHandler+0x2f8>
            sem_t handle = (sem_t) a1;
            int ret = Sem::_sem_close(handle);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x23) { //sem_wait
    800038ec:	02300713          	li	a4,35
    800038f0:	26e78c63          	beq	a5,a4,80003b68 <interruptHandler+0x30c>
            sem_t id = (sem_t) a1;
            int ret = Sem::_sem_wait(id);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x24) { //sem_signal
    800038f4:	02400713          	li	a4,36
    800038f8:	28e78263          	beq	a5,a4,80003b7c <interruptHandler+0x320>
            sem_t id=(sem_t)a1;
            int ret = Sem::_sem_signal(id);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x31){ // time_sleep
    800038fc:	03100713          	li	a4,49
    80003900:	28e78863          	beq	a5,a4,80003b90 <interruptHandler+0x334>
            time_t time=a1;
            int ret=TCB::_time_sleep(time);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x41){ //getc
    80003904:	04100713          	li	a4,65
    80003908:	28e78e63          	beq	a5,a4,80003ba4 <interruptHandler+0x348>
            //int c=__getc();
            char c=Con::getConsoleInstance().getcI();
            __asm__ volatile("mv a0, %0": :"r"(c));
        }else if(code==0x42){ //putc
    8000390c:	04200713          	li	a4,66
    80003910:	2ae78663          	beq	a5,a4,80003bbc <interruptHandler+0x360>
            char c=(char)a1;
            Con::getConsoleInstance().putcO(c);
            //__putc((char)c);
        }else if(code==0x50){
    80003914:	05000713          	li	a4,80
    80003918:	16e79263          	bne	a5,a4,80003a7c <interruptHandler+0x220>
    return ret;
}

inline void RiscVReg::write_sstatus(uint64 arg) {
    __asm__ volatile("csrw sstatus, %0" : : "r" (arg));
    8000391c:	100a1073          	csrw	sstatus,s4
            RiscVReg::write_sstatus(statusVar); //restauracija statusnog registra
            uint64 mask=1<<8;
            __asm__ volatile("csrc sstatus, %0" : :"r"(mask)); //podmecem vrednost da se vrati u korisnicki rezim
    80003920:	10000793          	li	a5,256
    80003924:	1007b073          	csrc	sstatus,a5
            sepcVar+=4; //jer ecall cuva pc koji ukazuje opet na nju
    80003928:	00448493          	addi	s1,s1,4
            __asm__ volatile("csrw sepc, %0" : : "r" (sepcVar));
    8000392c:	14149073          	csrw	sepc,s1
}

inline void RiscVReg::clear_ssip(){
    __asm__ volatile("csrc sip, 0x02");
    80003930:	14417073          	csrci	sip,2
            RiscVReg::clear_ssip();//oznacavamo da je sistemski poziv opsluzen
            return;
    80003934:	1580006f          	j	80003a8c <interruptHandler+0x230>
        if(!instance.flag){
    80003938:	00009797          	auipc	a5,0x9
    8000393c:	f507c783          	lbu	a5,-176(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80003940:	02078063          	beqz	a5,80003960 <interruptHandler+0x104>
            void *addr = MemAlloc::getAllocator().mem_alloc((size_t) n);
    80003944:	00090593          	mv	a1,s2
    80003948:	00009517          	auipc	a0,0x9
    8000394c:	f3850513          	addi	a0,a0,-200 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80003950:	00000097          	auipc	ra,0x0
    80003954:	c1c080e7          	jalr	-996(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
            __asm__ volatile("mv a0, %0" : : "r" (addr));
    80003958:	00050513          	mv	a0,a0
    8000395c:	1200006f          	j	80003a7c <interruptHandler+0x220>
            instance.flag=true;
    80003960:	00009797          	auipc	a5,0x9
    80003964:	f2078793          	addi	a5,a5,-224 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80003968:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    8000396c:	00009697          	auipc	a3,0x9
    80003970:	e846b683          	ld	a3,-380(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003974:	0006b703          	ld	a4,0(a3)
    80003978:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    8000397c:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80003980:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80003984:	00009717          	auipc	a4,0x9
    80003988:	eb473703          	ld	a4,-332(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000398c:	00073503          	ld	a0,0(a4)
    80003990:	0006b703          	ld	a4,0(a3)
    80003994:	40e50533          	sub	a0,a0,a4
    80003998:	40355513          	srai	a0,a0,0x3
    8000399c:	0007b983          	ld	s3,0(a5)
    800039a0:	00a9bc23          	sd	a0,24(s3)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    800039a4:	fe050513          	addi	a0,a0,-32
    800039a8:	00000097          	auipc	ra,0x0
    800039ac:	ba8080e7          	jalr	-1112(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    800039b0:	00a9b823          	sd	a0,16(s3)
    800039b4:	f91ff06f          	j	80003944 <interruptHandler+0xe8>
        if(!instance.flag){
    800039b8:	00009797          	auipc	a5,0x9
    800039bc:	ed07c783          	lbu	a5,-304(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    800039c0:	02078063          	beqz	a5,800039e0 <interruptHandler+0x184>
            int status = MemAlloc::getAllocator().mem_free((void *) addr);
    800039c4:	00090593          	mv	a1,s2
    800039c8:	00009517          	auipc	a0,0x9
    800039cc:	eb850513          	addi	a0,a0,-328 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800039d0:	00000097          	auipc	ra,0x0
    800039d4:	d80080e7          	jalr	-640(ra) # 80003750 <_ZN8MemAlloc8mem_freeEPv>
            __asm__ volatile("mv a0, %0" : : "r" (status));
    800039d8:	00050513          	mv	a0,a0
    800039dc:	0a00006f          	j	80003a7c <interruptHandler+0x220>
            instance.flag=true;
    800039e0:	00009797          	auipc	a5,0x9
    800039e4:	ea078793          	addi	a5,a5,-352 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    800039e8:	00100713          	li	a4,1
    800039ec:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    800039f0:	00009697          	auipc	a3,0x9
    800039f4:	e006b683          	ld	a3,-512(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800039f8:	0006b703          	ld	a4,0(a3)
    800039fc:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80003a00:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80003a04:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80003a08:	00009717          	auipc	a4,0x9
    80003a0c:	e3073703          	ld	a4,-464(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003a10:	00073503          	ld	a0,0(a4)
    80003a14:	0006b703          	ld	a4,0(a3)
    80003a18:	40e50533          	sub	a0,a0,a4
    80003a1c:	40355513          	srai	a0,a0,0x3
    80003a20:	0007b983          	ld	s3,0(a5)
    80003a24:	00a9bc23          	sd	a0,24(s3)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80003a28:	fe050513          	addi	a0,a0,-32
    80003a2c:	00000097          	auipc	ra,0x0
    80003a30:	b24080e7          	jalr	-1244(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80003a34:	00a9b823          	sd	a0,16(s3)
    80003a38:	f8dff06f          	j	800039c4 <interruptHandler+0x168>
            if(body) stack_space=MemAlloc::getAllocator().mem_alloc((DEFAULT_STACK_SIZE*8+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80003a3c:	02098463          	beqz	s3,80003a64 <interruptHandler+0x208>
        if(!instance.flag){
    80003a40:	00009797          	auipc	a5,0x9
    80003a44:	e487c783          	lbu	a5,-440(a5) # 8000c888 <_ZZN8MemAlloc12getAllocatorEvE8instance+0x8>
    80003a48:	06078663          	beqz	a5,80003ab4 <interruptHandler+0x258>
    80003a4c:	20000593          	li	a1,512
    80003a50:	00009517          	auipc	a0,0x9
    80003a54:	e3050513          	addi	a0,a0,-464 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80003a58:	00000097          	auipc	ra,0x0
    80003a5c:	b14080e7          	jalr	-1260(ra) # 8000356c <_ZN8MemAlloc9mem_allocEm>
    80003a60:	00050693          	mv	a3,a0
            int status = TCB::_thread_create(handle, body, arg, stack_space);
    80003a64:	000a8613          	mv	a2,s5
    80003a68:	00098593          	mv	a1,s3
    80003a6c:	00090513          	mv	a0,s2
    80003a70:	fffff097          	auipc	ra,0xfffff
    80003a74:	32c080e7          	jalr	812(ra) # 80002d9c <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>
            __asm__ volatile("mv a0, %0": :"r"(status));
    80003a78:	00050513          	mv	a0,a0
    __asm__ volatile("csrw sstatus, %0" : : "r" (arg));
    80003a7c:	100a1073          	csrw	sstatus,s4
        }

        RiscVReg::write_sstatus(statusVar); //restauracija statusnog registra
        sepcVar+=4; //jer ecall cuva pc koji ukazuje opet na nju
    80003a80:	00448493          	addi	s1,s1,4
        __asm__ volatile("csrw sepc, %0" : : "r" (sepcVar));
    80003a84:	14149073          	csrw	sepc,s1
    __asm__ volatile("csrc sip, 0x02");
    80003a88:	14417073          	csrci	sip,2
    else
    {
        printInt(scauseV);
        putc('\n');
    }
}
    80003a8c:	03813083          	ld	ra,56(sp)
    80003a90:	03013403          	ld	s0,48(sp)
    80003a94:	02813483          	ld	s1,40(sp)
    80003a98:	02013903          	ld	s2,32(sp)
    80003a9c:	01813983          	ld	s3,24(sp)
    80003aa0:	01013a03          	ld	s4,16(sp)
    80003aa4:	00813a83          	ld	s5,8(sp)
    80003aa8:	00013b03          	ld	s6,0(sp)
    80003aac:	04010113          	addi	sp,sp,64
    80003ab0:	00008067          	ret
            instance.flag=true;
    80003ab4:	00009797          	auipc	a5,0x9
    80003ab8:	dcc78793          	addi	a5,a5,-564 # 8000c880 <_ZZN8MemAlloc12getAllocatorEvE8instance>
    80003abc:	00100713          	li	a4,1
    80003ac0:	00e78423          	sb	a4,8(a5)
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
    80003ac4:	00009697          	auipc	a3,0x9
    80003ac8:	d2c6b683          	ld	a3,-724(a3) # 8000c7f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003acc:	0006b703          	ld	a4,0(a3)
    80003ad0:	00e7b023          	sd	a4,0(a5)
            instance.headFree->next= nullptr;
    80003ad4:	00073423          	sd	zero,8(a4)
            instance.headFree->prev= nullptr;
    80003ad8:	00073023          	sd	zero,0(a4)
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
    80003adc:	00009717          	auipc	a4,0x9
    80003ae0:	d5c73703          	ld	a4,-676(a4) # 8000c838 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003ae4:	00073503          	ld	a0,0(a4)
    80003ae8:	0006b703          	ld	a4,0(a3)
    80003aec:	40e50533          	sub	a0,a0,a4
    80003af0:	40355513          	srai	a0,a0,0x3
    80003af4:	0007bb03          	ld	s6,0(a5)
    80003af8:	00ab3c23          	sd	a0,24(s6)
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
    80003afc:	fe050513          	addi	a0,a0,-32
    80003b00:	00000097          	auipc	ra,0x0
    80003b04:	a50080e7          	jalr	-1456(ra) # 80003550 <_ZN8MemAlloc13bytesToBlocksEm>
    80003b08:	00ab3823          	sd	a0,16(s6)
    80003b0c:	f41ff06f          	j	80003a4c <interruptHandler+0x1f0>
            int status = TCB::_thread_exit();
    80003b10:	fffff097          	auipc	ra,0xfffff
    80003b14:	214080e7          	jalr	532(ra) # 80002d24 <_ZN3TCB12_thread_exitEv>
            __asm__ volatile("mv a0, %0": :"r"(status));
    80003b18:	00050513          	mv	a0,a0
    80003b1c:	f61ff06f          	j	80003a7c <interruptHandler+0x220>
            TCB::_thread_dispatch();
    80003b20:	fffff097          	auipc	ra,0xfffff
    80003b24:	0f4080e7          	jalr	244(ra) # 80002c14 <_ZN3TCB16_thread_dispatchEv>
    80003b28:	f55ff06f          	j	80003a7c <interruptHandler+0x220>
            TCB::_thread_join(handle);
    80003b2c:	00090513          	mv	a0,s2
    80003b30:	fffff097          	auipc	ra,0xfffff
    80003b34:	4cc080e7          	jalr	1228(ra) # 80002ffc <_ZN3TCB12_thread_joinEPS_>
    80003b38:	f45ff06f          	j	80003a7c <interruptHandler+0x220>
            int ret=Sem::_sem_open(handle,init);
    80003b3c:	0009859b          	sext.w	a1,s3
    80003b40:	00090513          	mv	a0,s2
    80003b44:	ffffe097          	auipc	ra,0xffffe
    80003b48:	01c080e7          	jalr	28(ra) # 80001b60 <_ZN3Sem9_sem_openEPPS_j>
            __asm__ volatile("mv a0, %0": :"r"(ret));
    80003b4c:	00050513          	mv	a0,a0
    80003b50:	f2dff06f          	j	80003a7c <interruptHandler+0x220>
            int ret = Sem::_sem_close(handle);
    80003b54:	00090513          	mv	a0,s2
    80003b58:	ffffe097          	auipc	ra,0xffffe
    80003b5c:	ee4080e7          	jalr	-284(ra) # 80001a3c <_ZN3Sem10_sem_closeEPS_>
            __asm__ volatile("mv a0, %0": :"r"(ret));
    80003b60:	00050513          	mv	a0,a0
    80003b64:	f19ff06f          	j	80003a7c <interruptHandler+0x220>
            int ret = Sem::_sem_wait(id);
    80003b68:	00090513          	mv	a0,s2
    80003b6c:	ffffe097          	auipc	ra,0xffffe
    80003b70:	c58080e7          	jalr	-936(ra) # 800017c4 <_ZN3Sem9_sem_waitEPS_>
            __asm__ volatile("mv a0, %0": :"r"(ret));
    80003b74:	00050513          	mv	a0,a0
    80003b78:	f05ff06f          	j	80003a7c <interruptHandler+0x220>
            int ret = Sem::_sem_signal(id);
    80003b7c:	00090513          	mv	a0,s2
    80003b80:	ffffe097          	auipc	ra,0xffffe
    80003b84:	d80080e7          	jalr	-640(ra) # 80001900 <_ZN3Sem11_sem_signalEPS_>
            __asm__ volatile("mv a0, %0": :"r"(ret));
    80003b88:	00050513          	mv	a0,a0
    80003b8c:	ef1ff06f          	j	80003a7c <interruptHandler+0x220>
            int ret=TCB::_time_sleep(time);
    80003b90:	00090513          	mv	a0,s2
    80003b94:	fffff097          	auipc	ra,0xfffff
    80003b98:	5ec080e7          	jalr	1516(ra) # 80003180 <_ZN3TCB11_time_sleepEm>
            __asm__ volatile("mv a0, %0": :"r"(ret));
    80003b9c:	00050513          	mv	a0,a0
    80003ba0:	eddff06f          	j	80003a7c <interruptHandler+0x220>
            char c=Con::getConsoleInstance().getcI();
    80003ba4:	fffff097          	auipc	ra,0xfffff
    80003ba8:	7e4080e7          	jalr	2020(ra) # 80003388 <_ZN3Con18getConsoleInstanceEv>
    80003bac:	fffff097          	auipc	ra,0xfffff
    80003bb0:	7b0080e7          	jalr	1968(ra) # 8000335c <_ZN3Con5getcIEv>
            __asm__ volatile("mv a0, %0": :"r"(c));
    80003bb4:	00050513          	mv	a0,a0
    80003bb8:	ec5ff06f          	j	80003a7c <interruptHandler+0x220>
            char c=(char)a1;
    80003bbc:	0ff97913          	andi	s2,s2,255
            Con::getConsoleInstance().putcO(c);
    80003bc0:	fffff097          	auipc	ra,0xfffff
    80003bc4:	7c8080e7          	jalr	1992(ra) # 80003388 <_ZN3Con18getConsoleInstanceEv>
    80003bc8:	00090593          	mv	a1,s2
    80003bcc:	fffff097          	auipc	ra,0xfffff
    80003bd0:	70c080e7          	jalr	1804(ra) # 800032d8 <_ZN3Con5putcOEc>
    80003bd4:	ea9ff06f          	j	80003a7c <interruptHandler+0x220>
        printInt(scauseV);
    80003bd8:	00000613          	li	a2,0
    80003bdc:	00a00593          	li	a1,10
    80003be0:	0005051b          	sext.w	a0,a0
    80003be4:	ffffe097          	auipc	ra,0xffffe
    80003be8:	228080e7          	jalr	552(ra) # 80001e0c <_Z8printIntiii>
        putc('\n');
    80003bec:	00a00513          	li	a0,10
    80003bf0:	ffffe097          	auipc	ra,0xffffe
    80003bf4:	ac0080e7          	jalr	-1344(ra) # 800016b0 <_Z4putcc>
    80003bf8:	e95ff06f          	j	80003a8c <interruptHandler+0x230>

0000000080003bfc <consoleHandler>:

extern "C" void consoleHandler(){
    80003bfc:	fe010113          	addi	sp,sp,-32
    80003c00:	00113c23          	sd	ra,24(sp)
    80003c04:	00813823          	sd	s0,16(sp)
    80003c08:	00913423          	sd	s1,8(sp)
    80003c0c:	02010413          	addi	s0,sp,32
    uint64 ret=plic_claim();
    80003c10:	00004097          	auipc	ra,0x4
    80003c14:	c54080e7          	jalr	-940(ra) # 80007864 <plic_claim>
    80003c18:	00050493          	mv	s1,a0
    if(ret==CONSOLE_IRQ) {
    80003c1c:	00a00793          	li	a5,10
    80003c20:	02f50263          	beq	a0,a5,80003c44 <consoleHandler+0x48>
        while ((*(char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
            Con::getConsoleInstance().putcI(*(char *) CONSOLE_RX_DATA);
        }
    }
    plic_complete(ret);
    80003c24:	00048513          	mv	a0,s1
    80003c28:	00004097          	auipc	ra,0x4
    80003c2c:	c74080e7          	jalr	-908(ra) # 8000789c <plic_complete>
}
    80003c30:	01813083          	ld	ra,24(sp)
    80003c34:	01013403          	ld	s0,16(sp)
    80003c38:	00813483          	ld	s1,8(sp)
    80003c3c:	02010113          	addi	sp,sp,32
    80003c40:	00008067          	ret
        while ((*(char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
    80003c44:	00009797          	auipc	a5,0x9
    80003c48:	ba47b783          	ld	a5,-1116(a5) # 8000c7e8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003c4c:	0007b783          	ld	a5,0(a5)
    80003c50:	0007c783          	lbu	a5,0(a5)
    80003c54:	0017f793          	andi	a5,a5,1
    80003c58:	fc0786e3          	beqz	a5,80003c24 <consoleHandler+0x28>
            Con::getConsoleInstance().putcI(*(char *) CONSOLE_RX_DATA);
    80003c5c:	fffff097          	auipc	ra,0xfffff
    80003c60:	72c080e7          	jalr	1836(ra) # 80003388 <_ZN3Con18getConsoleInstanceEv>
    80003c64:	00009797          	auipc	a5,0x9
    80003c68:	b747b783          	ld	a5,-1164(a5) # 8000c7d8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003c6c:	0007b783          	ld	a5,0(a5)
    80003c70:	0007c583          	lbu	a1,0(a5)
    80003c74:	fffff097          	auipc	ra,0xfffff
    80003c78:	690080e7          	jalr	1680(ra) # 80003304 <_ZN3Con5putcIEc>
        while ((*(char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
    80003c7c:	fc9ff06f          	j	80003c44 <consoleHandler+0x48>

0000000080003c80 <timerHandler>:

extern "C" void timerHandler(){
    80003c80:	fe010113          	addi	sp,sp,-32
    80003c84:	00113c23          	sd	ra,24(sp)
    80003c88:	00813823          	sd	s0,16(sp)
    80003c8c:	00913423          	sd	s1,8(sp)
    80003c90:	01213023          	sd	s2,0(sp)
    80003c94:	02010413          	addi	s0,sp,32
    TCB::timeSliceCnt++;
    80003c98:	00009717          	auipc	a4,0x9
    80003c9c:	b8873703          	ld	a4,-1144(a4) # 8000c820 <_GLOBAL_OFFSET_TABLE_+0x50>
    80003ca0:	00073783          	ld	a5,0(a4)
    80003ca4:	00178793          	addi	a5,a5,1
    80003ca8:	00f73023          	sd	a5,0(a4)
    for(BlockedElem* tmp=TCB::sleepHead;tmp;tmp=tmp->next){
    80003cac:	00009797          	auipc	a5,0x9
    80003cb0:	b647b783          	ld	a5,-1180(a5) # 8000c810 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003cb4:	0007b603          	ld	a2,0(a5)
    80003cb8:	00060793          	mv	a5,a2
    80003cbc:	00078e63          	beqz	a5,80003cd8 <timerHandler+0x58>
        tmp->thread->decSleepTime();
    80003cc0:	0007b683          	ld	a3,0(a5)
    void decSleepTime(){sleepTime--;}
    80003cc4:	0186b703          	ld	a4,24(a3)
    80003cc8:	fff70713          	addi	a4,a4,-1
    80003ccc:	00e6bc23          	sd	a4,24(a3)
    for(BlockedElem* tmp=TCB::sleepHead;tmp;tmp=tmp->next){
    80003cd0:	0087b783          	ld	a5,8(a5)
    80003cd4:	fe9ff06f          	j	80003cbc <timerHandler+0x3c>
    }
    if(TCB::sleepHead && TCB::sleepHead->thread->getSleepTime()==0){
    80003cd8:	00060863          	beqz	a2,80003ce8 <timerHandler+0x68>
    80003cdc:	00063783          	ld	a5,0(a2)
    size_t getSleepTime(){return sleepTime;}
    80003ce0:	0187b783          	ld	a5,24(a5)
    80003ce4:	04078063          	beqz	a5,80003d24 <timerHandler+0xa4>
        TCB::removeElemsFromSleepList();
    }
    if(TCB::timeSliceCnt>=TCB::running->getTimeSlice()){
    80003ce8:	00009797          	auipc	a5,0x9
    80003cec:	b487b783          	ld	a5,-1208(a5) # 8000c830 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003cf0:	0007b783          	ld	a5,0(a5)
    size_t getTimeSlice() const {return timeSlice;}
    80003cf4:	0107b783          	ld	a5,16(a5)
    80003cf8:	00009717          	auipc	a4,0x9
    80003cfc:	b2873703          	ld	a4,-1240(a4) # 8000c820 <_GLOBAL_OFFSET_TABLE_+0x50>
    80003d00:	00073703          	ld	a4,0(a4)
    80003d04:	02f77663          	bgeu	a4,a5,80003d30 <timerHandler+0xb0>
    80003d08:	14417073          	csrci	sip,2
        TCB::_thread_dispatch();
        __asm__ volatile("csrw sepc, %0": :"r"(sepcV));
        __asm__ volatile("csrw sstatus, %0": :"r"(ssatusV));
    }
    RiscVReg::clear_ssip();
    80003d0c:	01813083          	ld	ra,24(sp)
    80003d10:	01013403          	ld	s0,16(sp)
    80003d14:	00813483          	ld	s1,8(sp)
    80003d18:	00013903          	ld	s2,0(sp)
    80003d1c:	02010113          	addi	sp,sp,32
    80003d20:	00008067          	ret
        TCB::removeElemsFromSleepList();
    80003d24:	fffff097          	auipc	ra,0xfffff
    80003d28:	4ac080e7          	jalr	1196(ra) # 800031d0 <_ZN3TCB24removeElemsFromSleepListEv>
    80003d2c:	fbdff06f          	j	80003ce8 <timerHandler+0x68>
        __asm__ volatile("csrr %0, sepc": "=r"(sepcV));
    80003d30:	14102973          	csrr	s2,sepc
        __asm__ volatile("csrr %0, sstatus": "=r"(ssatusV));
    80003d34:	100024f3          	csrr	s1,sstatus
        TCB::timeSliceCnt=0;
    80003d38:	00009797          	auipc	a5,0x9
    80003d3c:	ae87b783          	ld	a5,-1304(a5) # 8000c820 <_GLOBAL_OFFSET_TABLE_+0x50>
    80003d40:	0007b023          	sd	zero,0(a5)
        TCB::_thread_dispatch();
    80003d44:	fffff097          	auipc	ra,0xfffff
    80003d48:	ed0080e7          	jalr	-304(ra) # 80002c14 <_ZN3TCB16_thread_dispatchEv>
        __asm__ volatile("csrw sepc, %0": :"r"(sepcV));
    80003d4c:	14191073          	csrw	sepc,s2
        __asm__ volatile("csrw sstatus, %0": :"r"(ssatusV));
    80003d50:	10049073          	csrw	sstatus,s1
    80003d54:	fb5ff06f          	j	80003d08 <timerHandler+0x88>

0000000080003d58 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003d58:	fe010113          	addi	sp,sp,-32
    80003d5c:	00113c23          	sd	ra,24(sp)
    80003d60:	00813823          	sd	s0,16(sp)
    80003d64:	00913423          	sd	s1,8(sp)
    80003d68:	01213023          	sd	s2,0(sp)
    80003d6c:	02010413          	addi	s0,sp,32
    80003d70:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003d74:	00000913          	li	s2,0
    80003d78:	00c0006f          	j	80003d84 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003d7c:	ffffd097          	auipc	ra,0xffffd
    80003d80:	7a4080e7          	jalr	1956(ra) # 80001520 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003d84:	ffffe097          	auipc	ra,0xffffe
    80003d88:	900080e7          	jalr	-1792(ra) # 80001684 <_Z4getcv>
    80003d8c:	0005059b          	sext.w	a1,a0
    80003d90:	01b00793          	li	a5,27
    80003d94:	02f58a63          	beq	a1,a5,80003dc8 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003d98:	0084b503          	ld	a0,8(s1)
    80003d9c:	00003097          	auipc	ra,0x3
    80003da0:	fec080e7          	jalr	-20(ra) # 80006d88 <_ZN6Buffer3putEi>
        i++;
    80003da4:	0019071b          	addiw	a4,s2,1
    80003da8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003dac:	0004a683          	lw	a3,0(s1)
    80003db0:	0026979b          	slliw	a5,a3,0x2
    80003db4:	00d787bb          	addw	a5,a5,a3
    80003db8:	0017979b          	slliw	a5,a5,0x1
    80003dbc:	02f767bb          	remw	a5,a4,a5
    80003dc0:	fc0792e3          	bnez	a5,80003d84 <_ZL16producerKeyboardPv+0x2c>
    80003dc4:	fb9ff06f          	j	80003d7c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003dc8:	00100793          	li	a5,1
    80003dcc:	00009717          	auipc	a4,0x9
    80003dd0:	aef72e23          	sw	a5,-1284(a4) # 8000c8c8 <_ZL9threadEnd>
    data->buffer->put('!');
    80003dd4:	02100593          	li	a1,33
    80003dd8:	0084b503          	ld	a0,8(s1)
    80003ddc:	00003097          	auipc	ra,0x3
    80003de0:	fac080e7          	jalr	-84(ra) # 80006d88 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003de4:	0104b503          	ld	a0,16(s1)
    80003de8:	ffffe097          	auipc	ra,0xffffe
    80003dec:	818080e7          	jalr	-2024(ra) # 80001600 <_Z10sem_signalP3Sem>
}
    80003df0:	01813083          	ld	ra,24(sp)
    80003df4:	01013403          	ld	s0,16(sp)
    80003df8:	00813483          	ld	s1,8(sp)
    80003dfc:	00013903          	ld	s2,0(sp)
    80003e00:	02010113          	addi	sp,sp,32
    80003e04:	00008067          	ret

0000000080003e08 <_ZL8producerPv>:

static void producer(void *arg) {
    80003e08:	fe010113          	addi	sp,sp,-32
    80003e0c:	00113c23          	sd	ra,24(sp)
    80003e10:	00813823          	sd	s0,16(sp)
    80003e14:	00913423          	sd	s1,8(sp)
    80003e18:	01213023          	sd	s2,0(sp)
    80003e1c:	02010413          	addi	s0,sp,32
    80003e20:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003e24:	00000913          	li	s2,0
    80003e28:	00c0006f          	j	80003e34 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003e2c:	ffffd097          	auipc	ra,0xffffd
    80003e30:	6f4080e7          	jalr	1780(ra) # 80001520 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003e34:	00009797          	auipc	a5,0x9
    80003e38:	a947a783          	lw	a5,-1388(a5) # 8000c8c8 <_ZL9threadEnd>
    80003e3c:	02079e63          	bnez	a5,80003e78 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003e40:	0004a583          	lw	a1,0(s1)
    80003e44:	0305859b          	addiw	a1,a1,48
    80003e48:	0084b503          	ld	a0,8(s1)
    80003e4c:	00003097          	auipc	ra,0x3
    80003e50:	f3c080e7          	jalr	-196(ra) # 80006d88 <_ZN6Buffer3putEi>
        i++;
    80003e54:	0019071b          	addiw	a4,s2,1
    80003e58:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003e5c:	0004a683          	lw	a3,0(s1)
    80003e60:	0026979b          	slliw	a5,a3,0x2
    80003e64:	00d787bb          	addw	a5,a5,a3
    80003e68:	0017979b          	slliw	a5,a5,0x1
    80003e6c:	02f767bb          	remw	a5,a4,a5
    80003e70:	fc0792e3          	bnez	a5,80003e34 <_ZL8producerPv+0x2c>
    80003e74:	fb9ff06f          	j	80003e2c <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003e78:	0104b503          	ld	a0,16(s1)
    80003e7c:	ffffd097          	auipc	ra,0xffffd
    80003e80:	784080e7          	jalr	1924(ra) # 80001600 <_Z10sem_signalP3Sem>
}
    80003e84:	01813083          	ld	ra,24(sp)
    80003e88:	01013403          	ld	s0,16(sp)
    80003e8c:	00813483          	ld	s1,8(sp)
    80003e90:	00013903          	ld	s2,0(sp)
    80003e94:	02010113          	addi	sp,sp,32
    80003e98:	00008067          	ret

0000000080003e9c <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003e9c:	fd010113          	addi	sp,sp,-48
    80003ea0:	02113423          	sd	ra,40(sp)
    80003ea4:	02813023          	sd	s0,32(sp)
    80003ea8:	00913c23          	sd	s1,24(sp)
    80003eac:	01213823          	sd	s2,16(sp)
    80003eb0:	01313423          	sd	s3,8(sp)
    80003eb4:	03010413          	addi	s0,sp,48
    80003eb8:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003ebc:	00000993          	li	s3,0
    80003ec0:	01c0006f          	j	80003edc <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003ec4:	ffffd097          	auipc	ra,0xffffd
    80003ec8:	65c080e7          	jalr	1628(ra) # 80001520 <_Z15thread_dispatchv>
    80003ecc:	0500006f          	j	80003f1c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003ed0:	00a00513          	li	a0,10
    80003ed4:	ffffd097          	auipc	ra,0xffffd
    80003ed8:	7dc080e7          	jalr	2012(ra) # 800016b0 <_Z4putcc>
    while (!threadEnd) {
    80003edc:	00009797          	auipc	a5,0x9
    80003ee0:	9ec7a783          	lw	a5,-1556(a5) # 8000c8c8 <_ZL9threadEnd>
    80003ee4:	06079063          	bnez	a5,80003f44 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003ee8:	00893503          	ld	a0,8(s2)
    80003eec:	00003097          	auipc	ra,0x3
    80003ef0:	f2c080e7          	jalr	-212(ra) # 80006e18 <_ZN6Buffer3getEv>
        i++;
    80003ef4:	0019849b          	addiw	s1,s3,1
    80003ef8:	0004899b          	sext.w	s3,s1
        putc(key);
    80003efc:	0ff57513          	andi	a0,a0,255
    80003f00:	ffffd097          	auipc	ra,0xffffd
    80003f04:	7b0080e7          	jalr	1968(ra) # 800016b0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003f08:	00092703          	lw	a4,0(s2)
    80003f0c:	0027179b          	slliw	a5,a4,0x2
    80003f10:	00e787bb          	addw	a5,a5,a4
    80003f14:	02f4e7bb          	remw	a5,s1,a5
    80003f18:	fa0786e3          	beqz	a5,80003ec4 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003f1c:	05000793          	li	a5,80
    80003f20:	02f4e4bb          	remw	s1,s1,a5
    80003f24:	fa049ce3          	bnez	s1,80003edc <_ZL8consumerPv+0x40>
    80003f28:	fa9ff06f          	j	80003ed0 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003f2c:	00893503          	ld	a0,8(s2)
    80003f30:	00003097          	auipc	ra,0x3
    80003f34:	ee8080e7          	jalr	-280(ra) # 80006e18 <_ZN6Buffer3getEv>
        putc(key);
    80003f38:	0ff57513          	andi	a0,a0,255
    80003f3c:	ffffd097          	auipc	ra,0xffffd
    80003f40:	774080e7          	jalr	1908(ra) # 800016b0 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003f44:	00893503          	ld	a0,8(s2)
    80003f48:	00003097          	auipc	ra,0x3
    80003f4c:	f5c080e7          	jalr	-164(ra) # 80006ea4 <_ZN6Buffer6getCntEv>
    80003f50:	fca04ee3          	bgtz	a0,80003f2c <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003f54:	01093503          	ld	a0,16(s2)
    80003f58:	ffffd097          	auipc	ra,0xffffd
    80003f5c:	6a8080e7          	jalr	1704(ra) # 80001600 <_Z10sem_signalP3Sem>
}
    80003f60:	02813083          	ld	ra,40(sp)
    80003f64:	02013403          	ld	s0,32(sp)
    80003f68:	01813483          	ld	s1,24(sp)
    80003f6c:	01013903          	ld	s2,16(sp)
    80003f70:	00813983          	ld	s3,8(sp)
    80003f74:	03010113          	addi	sp,sp,48
    80003f78:	00008067          	ret

0000000080003f7c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003f7c:	f9010113          	addi	sp,sp,-112
    80003f80:	06113423          	sd	ra,104(sp)
    80003f84:	06813023          	sd	s0,96(sp)
    80003f88:	04913c23          	sd	s1,88(sp)
    80003f8c:	05213823          	sd	s2,80(sp)
    80003f90:	05313423          	sd	s3,72(sp)
    80003f94:	05413023          	sd	s4,64(sp)
    80003f98:	03513c23          	sd	s5,56(sp)
    80003f9c:	03613823          	sd	s6,48(sp)
    80003fa0:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003fa4:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003fa8:	00006517          	auipc	a0,0x6
    80003fac:	2f050513          	addi	a0,a0,752 # 8000a298 <CONSOLE_STATUS+0x288>
    80003fb0:	ffffe097          	auipc	ra,0xffffe
    80003fb4:	cac080e7          	jalr	-852(ra) # 80001c5c <_Z11printStringPKc>
    getString(input, 30);
    80003fb8:	01e00593          	li	a1,30
    80003fbc:	fa040493          	addi	s1,s0,-96
    80003fc0:	00048513          	mv	a0,s1
    80003fc4:	ffffe097          	auipc	ra,0xffffe
    80003fc8:	d20080e7          	jalr	-736(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003fcc:	00048513          	mv	a0,s1
    80003fd0:	ffffe097          	auipc	ra,0xffffe
    80003fd4:	dec080e7          	jalr	-532(ra) # 80001dbc <_Z11stringToIntPKc>
    80003fd8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003fdc:	00006517          	auipc	a0,0x6
    80003fe0:	2dc50513          	addi	a0,a0,732 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    80003fe4:	ffffe097          	auipc	ra,0xffffe
    80003fe8:	c78080e7          	jalr	-904(ra) # 80001c5c <_Z11printStringPKc>
    getString(input, 30);
    80003fec:	01e00593          	li	a1,30
    80003ff0:	00048513          	mv	a0,s1
    80003ff4:	ffffe097          	auipc	ra,0xffffe
    80003ff8:	cf0080e7          	jalr	-784(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80003ffc:	00048513          	mv	a0,s1
    80004000:	ffffe097          	auipc	ra,0xffffe
    80004004:	dbc080e7          	jalr	-580(ra) # 80001dbc <_Z11stringToIntPKc>
    80004008:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000400c:	00006517          	auipc	a0,0x6
    80004010:	2cc50513          	addi	a0,a0,716 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    80004014:	ffffe097          	auipc	ra,0xffffe
    80004018:	c48080e7          	jalr	-952(ra) # 80001c5c <_Z11printStringPKc>
    8000401c:	00000613          	li	a2,0
    80004020:	00a00593          	li	a1,10
    80004024:	00090513          	mv	a0,s2
    80004028:	ffffe097          	auipc	ra,0xffffe
    8000402c:	de4080e7          	jalr	-540(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004030:	00006517          	auipc	a0,0x6
    80004034:	2c050513          	addi	a0,a0,704 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80004038:	ffffe097          	auipc	ra,0xffffe
    8000403c:	c24080e7          	jalr	-988(ra) # 80001c5c <_Z11printStringPKc>
    80004040:	00000613          	li	a2,0
    80004044:	00a00593          	li	a1,10
    80004048:	00048513          	mv	a0,s1
    8000404c:	ffffe097          	auipc	ra,0xffffe
    80004050:	dc0080e7          	jalr	-576(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80004054:	00006517          	auipc	a0,0x6
    80004058:	2b450513          	addi	a0,a0,692 # 8000a308 <CONSOLE_STATUS+0x2f8>
    8000405c:	ffffe097          	auipc	ra,0xffffe
    80004060:	c00080e7          	jalr	-1024(ra) # 80001c5c <_Z11printStringPKc>
    if(threadNum > n) {
    80004064:	0324c463          	blt	s1,s2,8000408c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80004068:	03205c63          	blez	s2,800040a0 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    8000406c:	03800513          	li	a0,56
    80004070:	ffffe097          	auipc	ra,0xffffe
    80004074:	688080e7          	jalr	1672(ra) # 800026f8 <_Znwm>
    80004078:	00050a13          	mv	s4,a0
    8000407c:	00048593          	mv	a1,s1
    80004080:	00003097          	auipc	ra,0x3
    80004084:	c6c080e7          	jalr	-916(ra) # 80006cec <_ZN6BufferC1Ei>
    80004088:	0300006f          	j	800040b8 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000408c:	00006517          	auipc	a0,0x6
    80004090:	28450513          	addi	a0,a0,644 # 8000a310 <CONSOLE_STATUS+0x300>
    80004094:	ffffe097          	auipc	ra,0xffffe
    80004098:	bc8080e7          	jalr	-1080(ra) # 80001c5c <_Z11printStringPKc>
        return;
    8000409c:	0140006f          	j	800040b0 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800040a0:	00006517          	auipc	a0,0x6
    800040a4:	2b050513          	addi	a0,a0,688 # 8000a350 <CONSOLE_STATUS+0x340>
    800040a8:	ffffe097          	auipc	ra,0xffffe
    800040ac:	bb4080e7          	jalr	-1100(ra) # 80001c5c <_Z11printStringPKc>
        return;
    800040b0:	000b0113          	mv	sp,s6
    800040b4:	1500006f          	j	80004204 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800040b8:	00000593          	li	a1,0
    800040bc:	00009517          	auipc	a0,0x9
    800040c0:	81450513          	addi	a0,a0,-2028 # 8000c8d0 <_ZL10waitForAll>
    800040c4:	ffffd097          	auipc	ra,0xffffd
    800040c8:	4a8080e7          	jalr	1192(ra) # 8000156c <_Z8sem_openPP3Semj>
    thread_t threads[threadNum];
    800040cc:	00391793          	slli	a5,s2,0x3
    800040d0:	00f78793          	addi	a5,a5,15
    800040d4:	ff07f793          	andi	a5,a5,-16
    800040d8:	40f10133          	sub	sp,sp,a5
    800040dc:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800040e0:	0019071b          	addiw	a4,s2,1
    800040e4:	00171793          	slli	a5,a4,0x1
    800040e8:	00e787b3          	add	a5,a5,a4
    800040ec:	00379793          	slli	a5,a5,0x3
    800040f0:	00f78793          	addi	a5,a5,15
    800040f4:	ff07f793          	andi	a5,a5,-16
    800040f8:	40f10133          	sub	sp,sp,a5
    800040fc:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80004100:	00191613          	slli	a2,s2,0x1
    80004104:	012607b3          	add	a5,a2,s2
    80004108:	00379793          	slli	a5,a5,0x3
    8000410c:	00f987b3          	add	a5,s3,a5
    80004110:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004114:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80004118:	00008717          	auipc	a4,0x8
    8000411c:	7b873703          	ld	a4,1976(a4) # 8000c8d0 <_ZL10waitForAll>
    80004120:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80004124:	00078613          	mv	a2,a5
    80004128:	00000597          	auipc	a1,0x0
    8000412c:	d7458593          	addi	a1,a1,-652 # 80003e9c <_ZL8consumerPv>
    80004130:	f9840513          	addi	a0,s0,-104
    80004134:	ffffd097          	auipc	ra,0xffffd
    80004138:	388080e7          	jalr	904(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000413c:	00000493          	li	s1,0
    80004140:	0280006f          	j	80004168 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80004144:	00000597          	auipc	a1,0x0
    80004148:	c1458593          	addi	a1,a1,-1004 # 80003d58 <_ZL16producerKeyboardPv>
                      data + i);
    8000414c:	00179613          	slli	a2,a5,0x1
    80004150:	00f60633          	add	a2,a2,a5
    80004154:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004158:	00c98633          	add	a2,s3,a2
    8000415c:	ffffd097          	auipc	ra,0xffffd
    80004160:	360080e7          	jalr	864(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004164:	0014849b          	addiw	s1,s1,1
    80004168:	0524d263          	bge	s1,s2,800041ac <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    8000416c:	00149793          	slli	a5,s1,0x1
    80004170:	009787b3          	add	a5,a5,s1
    80004174:	00379793          	slli	a5,a5,0x3
    80004178:	00f987b3          	add	a5,s3,a5
    8000417c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004180:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80004184:	00008717          	auipc	a4,0x8
    80004188:	74c73703          	ld	a4,1868(a4) # 8000c8d0 <_ZL10waitForAll>
    8000418c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80004190:	00048793          	mv	a5,s1
    80004194:	00349513          	slli	a0,s1,0x3
    80004198:	00aa8533          	add	a0,s5,a0
    8000419c:	fa9054e3          	blez	s1,80004144 <_Z22producerConsumer_C_APIv+0x1c8>
    800041a0:	00000597          	auipc	a1,0x0
    800041a4:	c6858593          	addi	a1,a1,-920 # 80003e08 <_ZL8producerPv>
    800041a8:	fa5ff06f          	j	8000414c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800041ac:	ffffd097          	auipc	ra,0xffffd
    800041b0:	374080e7          	jalr	884(ra) # 80001520 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800041b4:	00000493          	li	s1,0
    800041b8:	00994e63          	blt	s2,s1,800041d4 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800041bc:	00008517          	auipc	a0,0x8
    800041c0:	71453503          	ld	a0,1812(a0) # 8000c8d0 <_ZL10waitForAll>
    800041c4:	ffffd097          	auipc	ra,0xffffd
    800041c8:	40c080e7          	jalr	1036(ra) # 800015d0 <_Z8sem_waitP3Sem>
    for (int i = 0; i <= threadNum; i++) {
    800041cc:	0014849b          	addiw	s1,s1,1
    800041d0:	fe9ff06f          	j	800041b8 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800041d4:	00008517          	auipc	a0,0x8
    800041d8:	6fc53503          	ld	a0,1788(a0) # 8000c8d0 <_ZL10waitForAll>
    800041dc:	ffffd097          	auipc	ra,0xffffd
    800041e0:	3c4080e7          	jalr	964(ra) # 800015a0 <_Z9sem_closeP3Sem>
    delete buffer;
    800041e4:	000a0e63          	beqz	s4,80004200 <_Z22producerConsumer_C_APIv+0x284>
    800041e8:	000a0513          	mv	a0,s4
    800041ec:	00003097          	auipc	ra,0x3
    800041f0:	d40080e7          	jalr	-704(ra) # 80006f2c <_ZN6BufferD1Ev>
    800041f4:	000a0513          	mv	a0,s4
    800041f8:	ffffe097          	auipc	ra,0xffffe
    800041fc:	528080e7          	jalr	1320(ra) # 80002720 <_ZdlPv>
    80004200:	000b0113          	mv	sp,s6

}
    80004204:	f9040113          	addi	sp,s0,-112
    80004208:	06813083          	ld	ra,104(sp)
    8000420c:	06013403          	ld	s0,96(sp)
    80004210:	05813483          	ld	s1,88(sp)
    80004214:	05013903          	ld	s2,80(sp)
    80004218:	04813983          	ld	s3,72(sp)
    8000421c:	04013a03          	ld	s4,64(sp)
    80004220:	03813a83          	ld	s5,56(sp)
    80004224:	03013b03          	ld	s6,48(sp)
    80004228:	07010113          	addi	sp,sp,112
    8000422c:	00008067          	ret
    80004230:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80004234:	000a0513          	mv	a0,s4
    80004238:	ffffe097          	auipc	ra,0xffffe
    8000423c:	4e8080e7          	jalr	1256(ra) # 80002720 <_ZdlPv>
    80004240:	00048513          	mv	a0,s1
    80004244:	00009097          	auipc	ra,0x9
    80004248:	7b4080e7          	jalr	1972(ra) # 8000d9f8 <_Unwind_Resume>

000000008000424c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000424c:	fe010113          	addi	sp,sp,-32
    80004250:	00113c23          	sd	ra,24(sp)
    80004254:	00813823          	sd	s0,16(sp)
    80004258:	00913423          	sd	s1,8(sp)
    8000425c:	01213023          	sd	s2,0(sp)
    80004260:	02010413          	addi	s0,sp,32
    80004264:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004268:	00100793          	li	a5,1
    8000426c:	02a7f863          	bgeu	a5,a0,8000429c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004270:	00a00793          	li	a5,10
    80004274:	02f577b3          	remu	a5,a0,a5
    80004278:	02078e63          	beqz	a5,800042b4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000427c:	fff48513          	addi	a0,s1,-1
    80004280:	00000097          	auipc	ra,0x0
    80004284:	fcc080e7          	jalr	-52(ra) # 8000424c <_ZL9fibonaccim>
    80004288:	00050913          	mv	s2,a0
    8000428c:	ffe48513          	addi	a0,s1,-2
    80004290:	00000097          	auipc	ra,0x0
    80004294:	fbc080e7          	jalr	-68(ra) # 8000424c <_ZL9fibonaccim>
    80004298:	00a90533          	add	a0,s2,a0
}
    8000429c:	01813083          	ld	ra,24(sp)
    800042a0:	01013403          	ld	s0,16(sp)
    800042a4:	00813483          	ld	s1,8(sp)
    800042a8:	00013903          	ld	s2,0(sp)
    800042ac:	02010113          	addi	sp,sp,32
    800042b0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800042b4:	ffffd097          	auipc	ra,0xffffd
    800042b8:	26c080e7          	jalr	620(ra) # 80001520 <_Z15thread_dispatchv>
    800042bc:	fc1ff06f          	j	8000427c <_ZL9fibonaccim+0x30>

00000000800042c0 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800042c0:	fe010113          	addi	sp,sp,-32
    800042c4:	00113c23          	sd	ra,24(sp)
    800042c8:	00813823          	sd	s0,16(sp)
    800042cc:	00913423          	sd	s1,8(sp)
    800042d0:	01213023          	sd	s2,0(sp)
    800042d4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800042d8:	00000913          	li	s2,0
    800042dc:	0380006f          	j	80004314 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800042e0:	ffffd097          	auipc	ra,0xffffd
    800042e4:	240080e7          	jalr	576(ra) # 80001520 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800042e8:	00148493          	addi	s1,s1,1
    800042ec:	000027b7          	lui	a5,0x2
    800042f0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800042f4:	0097ee63          	bltu	a5,s1,80004310 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800042f8:	00000713          	li	a4,0
    800042fc:	000077b7          	lui	a5,0x7
    80004300:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004304:	fce7eee3          	bltu	a5,a4,800042e0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80004308:	00170713          	addi	a4,a4,1
    8000430c:	ff1ff06f          	j	800042fc <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004310:	00190913          	addi	s2,s2,1
    80004314:	00900793          	li	a5,9
    80004318:	0527e063          	bltu	a5,s2,80004358 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000431c:	00006517          	auipc	a0,0x6
    80004320:	06450513          	addi	a0,a0,100 # 8000a380 <CONSOLE_STATUS+0x370>
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	938080e7          	jalr	-1736(ra) # 80001c5c <_Z11printStringPKc>
    8000432c:	00000613          	li	a2,0
    80004330:	00a00593          	li	a1,10
    80004334:	0009051b          	sext.w	a0,s2
    80004338:	ffffe097          	auipc	ra,0xffffe
    8000433c:	ad4080e7          	jalr	-1324(ra) # 80001e0c <_Z8printIntiii>
    80004340:	00006517          	auipc	a0,0x6
    80004344:	e2050513          	addi	a0,a0,-480 # 8000a160 <CONSOLE_STATUS+0x150>
    80004348:	ffffe097          	auipc	ra,0xffffe
    8000434c:	914080e7          	jalr	-1772(ra) # 80001c5c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004350:	00000493          	li	s1,0
    80004354:	f99ff06f          	j	800042ec <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004358:	00006517          	auipc	a0,0x6
    8000435c:	03050513          	addi	a0,a0,48 # 8000a388 <CONSOLE_STATUS+0x378>
    80004360:	ffffe097          	auipc	ra,0xffffe
    80004364:	8fc080e7          	jalr	-1796(ra) # 80001c5c <_Z11printStringPKc>
    finishedA = true;
    80004368:	00100793          	li	a5,1
    8000436c:	00008717          	auipc	a4,0x8
    80004370:	56f70623          	sb	a5,1388(a4) # 8000c8d8 <_ZL9finishedA>
}
    80004374:	01813083          	ld	ra,24(sp)
    80004378:	01013403          	ld	s0,16(sp)
    8000437c:	00813483          	ld	s1,8(sp)
    80004380:	00013903          	ld	s2,0(sp)
    80004384:	02010113          	addi	sp,sp,32
    80004388:	00008067          	ret

000000008000438c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000438c:	fe010113          	addi	sp,sp,-32
    80004390:	00113c23          	sd	ra,24(sp)
    80004394:	00813823          	sd	s0,16(sp)
    80004398:	00913423          	sd	s1,8(sp)
    8000439c:	01213023          	sd	s2,0(sp)
    800043a0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800043a4:	00000913          	li	s2,0
    800043a8:	0380006f          	j	800043e0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800043ac:	ffffd097          	auipc	ra,0xffffd
    800043b0:	174080e7          	jalr	372(ra) # 80001520 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800043b4:	00148493          	addi	s1,s1,1
    800043b8:	000027b7          	lui	a5,0x2
    800043bc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800043c0:	0097ee63          	bltu	a5,s1,800043dc <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800043c4:	00000713          	li	a4,0
    800043c8:	000077b7          	lui	a5,0x7
    800043cc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800043d0:	fce7eee3          	bltu	a5,a4,800043ac <_ZN7WorkerB11workerBodyBEPv+0x20>
    800043d4:	00170713          	addi	a4,a4,1
    800043d8:	ff1ff06f          	j	800043c8 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800043dc:	00190913          	addi	s2,s2,1
    800043e0:	00f00793          	li	a5,15
    800043e4:	0527e063          	bltu	a5,s2,80004424 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800043e8:	00006517          	auipc	a0,0x6
    800043ec:	fb050513          	addi	a0,a0,-80 # 8000a398 <CONSOLE_STATUS+0x388>
    800043f0:	ffffe097          	auipc	ra,0xffffe
    800043f4:	86c080e7          	jalr	-1940(ra) # 80001c5c <_Z11printStringPKc>
    800043f8:	00000613          	li	a2,0
    800043fc:	00a00593          	li	a1,10
    80004400:	0009051b          	sext.w	a0,s2
    80004404:	ffffe097          	auipc	ra,0xffffe
    80004408:	a08080e7          	jalr	-1528(ra) # 80001e0c <_Z8printIntiii>
    8000440c:	00006517          	auipc	a0,0x6
    80004410:	d5450513          	addi	a0,a0,-684 # 8000a160 <CONSOLE_STATUS+0x150>
    80004414:	ffffe097          	auipc	ra,0xffffe
    80004418:	848080e7          	jalr	-1976(ra) # 80001c5c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000441c:	00000493          	li	s1,0
    80004420:	f99ff06f          	j	800043b8 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80004424:	00006517          	auipc	a0,0x6
    80004428:	f7c50513          	addi	a0,a0,-132 # 8000a3a0 <CONSOLE_STATUS+0x390>
    8000442c:	ffffe097          	auipc	ra,0xffffe
    80004430:	830080e7          	jalr	-2000(ra) # 80001c5c <_Z11printStringPKc>
    finishedB = true;
    80004434:	00100793          	li	a5,1
    80004438:	00008717          	auipc	a4,0x8
    8000443c:	4af700a3          	sb	a5,1185(a4) # 8000c8d9 <_ZL9finishedB>
    thread_dispatch();
    80004440:	ffffd097          	auipc	ra,0xffffd
    80004444:	0e0080e7          	jalr	224(ra) # 80001520 <_Z15thread_dispatchv>
}
    80004448:	01813083          	ld	ra,24(sp)
    8000444c:	01013403          	ld	s0,16(sp)
    80004450:	00813483          	ld	s1,8(sp)
    80004454:	00013903          	ld	s2,0(sp)
    80004458:	02010113          	addi	sp,sp,32
    8000445c:	00008067          	ret

0000000080004460 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004460:	fe010113          	addi	sp,sp,-32
    80004464:	00113c23          	sd	ra,24(sp)
    80004468:	00813823          	sd	s0,16(sp)
    8000446c:	00913423          	sd	s1,8(sp)
    80004470:	01213023          	sd	s2,0(sp)
    80004474:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004478:	00000493          	li	s1,0
    8000447c:	0400006f          	j	800044bc <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004480:	00006517          	auipc	a0,0x6
    80004484:	f3050513          	addi	a0,a0,-208 # 8000a3b0 <CONSOLE_STATUS+0x3a0>
    80004488:	ffffd097          	auipc	ra,0xffffd
    8000448c:	7d4080e7          	jalr	2004(ra) # 80001c5c <_Z11printStringPKc>
    80004490:	00000613          	li	a2,0
    80004494:	00a00593          	li	a1,10
    80004498:	00048513          	mv	a0,s1
    8000449c:	ffffe097          	auipc	ra,0xffffe
    800044a0:	970080e7          	jalr	-1680(ra) # 80001e0c <_Z8printIntiii>
    800044a4:	00006517          	auipc	a0,0x6
    800044a8:	cbc50513          	addi	a0,a0,-836 # 8000a160 <CONSOLE_STATUS+0x150>
    800044ac:	ffffd097          	auipc	ra,0xffffd
    800044b0:	7b0080e7          	jalr	1968(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 3; i++) {
    800044b4:	0014849b          	addiw	s1,s1,1
    800044b8:	0ff4f493          	andi	s1,s1,255
    800044bc:	00200793          	li	a5,2
    800044c0:	fc97f0e3          	bgeu	a5,s1,80004480 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800044c4:	00006517          	auipc	a0,0x6
    800044c8:	ef450513          	addi	a0,a0,-268 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    800044cc:	ffffd097          	auipc	ra,0xffffd
    800044d0:	790080e7          	jalr	1936(ra) # 80001c5c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800044d4:	00700313          	li	t1,7
    thread_dispatch();
    800044d8:	ffffd097          	auipc	ra,0xffffd
    800044dc:	048080e7          	jalr	72(ra) # 80001520 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800044e0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800044e4:	00006517          	auipc	a0,0x6
    800044e8:	ee450513          	addi	a0,a0,-284 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    800044ec:	ffffd097          	auipc	ra,0xffffd
    800044f0:	770080e7          	jalr	1904(ra) # 80001c5c <_Z11printStringPKc>
    800044f4:	00000613          	li	a2,0
    800044f8:	00a00593          	li	a1,10
    800044fc:	0009051b          	sext.w	a0,s2
    80004500:	ffffe097          	auipc	ra,0xffffe
    80004504:	90c080e7          	jalr	-1780(ra) # 80001e0c <_Z8printIntiii>
    80004508:	00006517          	auipc	a0,0x6
    8000450c:	c5850513          	addi	a0,a0,-936 # 8000a160 <CONSOLE_STATUS+0x150>
    80004510:	ffffd097          	auipc	ra,0xffffd
    80004514:	74c080e7          	jalr	1868(ra) # 80001c5c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004518:	00c00513          	li	a0,12
    8000451c:	00000097          	auipc	ra,0x0
    80004520:	d30080e7          	jalr	-720(ra) # 8000424c <_ZL9fibonaccim>
    80004524:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004528:	00006517          	auipc	a0,0x6
    8000452c:	ea850513          	addi	a0,a0,-344 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80004530:	ffffd097          	auipc	ra,0xffffd
    80004534:	72c080e7          	jalr	1836(ra) # 80001c5c <_Z11printStringPKc>
    80004538:	00000613          	li	a2,0
    8000453c:	00a00593          	li	a1,10
    80004540:	0009051b          	sext.w	a0,s2
    80004544:	ffffe097          	auipc	ra,0xffffe
    80004548:	8c8080e7          	jalr	-1848(ra) # 80001e0c <_Z8printIntiii>
    8000454c:	00006517          	auipc	a0,0x6
    80004550:	c1450513          	addi	a0,a0,-1004 # 8000a160 <CONSOLE_STATUS+0x150>
    80004554:	ffffd097          	auipc	ra,0xffffd
    80004558:	708080e7          	jalr	1800(ra) # 80001c5c <_Z11printStringPKc>
    8000455c:	0400006f          	j	8000459c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004560:	00006517          	auipc	a0,0x6
    80004564:	e5050513          	addi	a0,a0,-432 # 8000a3b0 <CONSOLE_STATUS+0x3a0>
    80004568:	ffffd097          	auipc	ra,0xffffd
    8000456c:	6f4080e7          	jalr	1780(ra) # 80001c5c <_Z11printStringPKc>
    80004570:	00000613          	li	a2,0
    80004574:	00a00593          	li	a1,10
    80004578:	00048513          	mv	a0,s1
    8000457c:	ffffe097          	auipc	ra,0xffffe
    80004580:	890080e7          	jalr	-1904(ra) # 80001e0c <_Z8printIntiii>
    80004584:	00006517          	auipc	a0,0x6
    80004588:	bdc50513          	addi	a0,a0,-1060 # 8000a160 <CONSOLE_STATUS+0x150>
    8000458c:	ffffd097          	auipc	ra,0xffffd
    80004590:	6d0080e7          	jalr	1744(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004594:	0014849b          	addiw	s1,s1,1
    80004598:	0ff4f493          	andi	s1,s1,255
    8000459c:	00500793          	li	a5,5
    800045a0:	fc97f0e3          	bgeu	a5,s1,80004560 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    800045a4:	00006517          	auipc	a0,0x6
    800045a8:	e3c50513          	addi	a0,a0,-452 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    800045ac:	ffffd097          	auipc	ra,0xffffd
    800045b0:	6b0080e7          	jalr	1712(ra) # 80001c5c <_Z11printStringPKc>
    finishedC = true;
    800045b4:	00100793          	li	a5,1
    800045b8:	00008717          	auipc	a4,0x8
    800045bc:	32f70123          	sb	a5,802(a4) # 8000c8da <_ZL9finishedC>
    thread_dispatch();
    800045c0:	ffffd097          	auipc	ra,0xffffd
    800045c4:	f60080e7          	jalr	-160(ra) # 80001520 <_Z15thread_dispatchv>
}
    800045c8:	01813083          	ld	ra,24(sp)
    800045cc:	01013403          	ld	s0,16(sp)
    800045d0:	00813483          	ld	s1,8(sp)
    800045d4:	00013903          	ld	s2,0(sp)
    800045d8:	02010113          	addi	sp,sp,32
    800045dc:	00008067          	ret

00000000800045e0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800045e0:	fe010113          	addi	sp,sp,-32
    800045e4:	00113c23          	sd	ra,24(sp)
    800045e8:	00813823          	sd	s0,16(sp)
    800045ec:	00913423          	sd	s1,8(sp)
    800045f0:	01213023          	sd	s2,0(sp)
    800045f4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800045f8:	00a00493          	li	s1,10
    800045fc:	0400006f          	j	8000463c <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004600:	00006517          	auipc	a0,0x6
    80004604:	df050513          	addi	a0,a0,-528 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80004608:	ffffd097          	auipc	ra,0xffffd
    8000460c:	654080e7          	jalr	1620(ra) # 80001c5c <_Z11printStringPKc>
    80004610:	00000613          	li	a2,0
    80004614:	00a00593          	li	a1,10
    80004618:	00048513          	mv	a0,s1
    8000461c:	ffffd097          	auipc	ra,0xffffd
    80004620:	7f0080e7          	jalr	2032(ra) # 80001e0c <_Z8printIntiii>
    80004624:	00006517          	auipc	a0,0x6
    80004628:	b3c50513          	addi	a0,a0,-1220 # 8000a160 <CONSOLE_STATUS+0x150>
    8000462c:	ffffd097          	auipc	ra,0xffffd
    80004630:	630080e7          	jalr	1584(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004634:	0014849b          	addiw	s1,s1,1
    80004638:	0ff4f493          	andi	s1,s1,255
    8000463c:	00c00793          	li	a5,12
    80004640:	fc97f0e3          	bgeu	a5,s1,80004600 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004644:	00006517          	auipc	a0,0x6
    80004648:	db450513          	addi	a0,a0,-588 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    8000464c:	ffffd097          	auipc	ra,0xffffd
    80004650:	610080e7          	jalr	1552(ra) # 80001c5c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004654:	00500313          	li	t1,5
    thread_dispatch();
    80004658:	ffffd097          	auipc	ra,0xffffd
    8000465c:	ec8080e7          	jalr	-312(ra) # 80001520 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004660:	01000513          	li	a0,16
    80004664:	00000097          	auipc	ra,0x0
    80004668:	be8080e7          	jalr	-1048(ra) # 8000424c <_ZL9fibonaccim>
    8000466c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004670:	00006517          	auipc	a0,0x6
    80004674:	d9850513          	addi	a0,a0,-616 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80004678:	ffffd097          	auipc	ra,0xffffd
    8000467c:	5e4080e7          	jalr	1508(ra) # 80001c5c <_Z11printStringPKc>
    80004680:	00000613          	li	a2,0
    80004684:	00a00593          	li	a1,10
    80004688:	0009051b          	sext.w	a0,s2
    8000468c:	ffffd097          	auipc	ra,0xffffd
    80004690:	780080e7          	jalr	1920(ra) # 80001e0c <_Z8printIntiii>
    80004694:	00006517          	auipc	a0,0x6
    80004698:	acc50513          	addi	a0,a0,-1332 # 8000a160 <CONSOLE_STATUS+0x150>
    8000469c:	ffffd097          	auipc	ra,0xffffd
    800046a0:	5c0080e7          	jalr	1472(ra) # 80001c5c <_Z11printStringPKc>
    800046a4:	0400006f          	j	800046e4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800046a8:	00006517          	auipc	a0,0x6
    800046ac:	d4850513          	addi	a0,a0,-696 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    800046b0:	ffffd097          	auipc	ra,0xffffd
    800046b4:	5ac080e7          	jalr	1452(ra) # 80001c5c <_Z11printStringPKc>
    800046b8:	00000613          	li	a2,0
    800046bc:	00a00593          	li	a1,10
    800046c0:	00048513          	mv	a0,s1
    800046c4:	ffffd097          	auipc	ra,0xffffd
    800046c8:	748080e7          	jalr	1864(ra) # 80001e0c <_Z8printIntiii>
    800046cc:	00006517          	auipc	a0,0x6
    800046d0:	a9450513          	addi	a0,a0,-1388 # 8000a160 <CONSOLE_STATUS+0x150>
    800046d4:	ffffd097          	auipc	ra,0xffffd
    800046d8:	588080e7          	jalr	1416(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800046dc:	0014849b          	addiw	s1,s1,1
    800046e0:	0ff4f493          	andi	s1,s1,255
    800046e4:	00f00793          	li	a5,15
    800046e8:	fc97f0e3          	bgeu	a5,s1,800046a8 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800046ec:	00006517          	auipc	a0,0x6
    800046f0:	d2c50513          	addi	a0,a0,-724 # 8000a418 <CONSOLE_STATUS+0x408>
    800046f4:	ffffd097          	auipc	ra,0xffffd
    800046f8:	568080e7          	jalr	1384(ra) # 80001c5c <_Z11printStringPKc>
    finishedD = true;
    800046fc:	00100793          	li	a5,1
    80004700:	00008717          	auipc	a4,0x8
    80004704:	1cf70da3          	sb	a5,475(a4) # 8000c8db <_ZL9finishedD>
    thread_dispatch();
    80004708:	ffffd097          	auipc	ra,0xffffd
    8000470c:	e18080e7          	jalr	-488(ra) # 80001520 <_Z15thread_dispatchv>
}
    80004710:	01813083          	ld	ra,24(sp)
    80004714:	01013403          	ld	s0,16(sp)
    80004718:	00813483          	ld	s1,8(sp)
    8000471c:	00013903          	ld	s2,0(sp)
    80004720:	02010113          	addi	sp,sp,32
    80004724:	00008067          	ret

0000000080004728 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004728:	fc010113          	addi	sp,sp,-64
    8000472c:	02113c23          	sd	ra,56(sp)
    80004730:	02813823          	sd	s0,48(sp)
    80004734:	02913423          	sd	s1,40(sp)
    80004738:	03213023          	sd	s2,32(sp)
    8000473c:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004740:	02000513          	li	a0,32
    80004744:	ffffe097          	auipc	ra,0xffffe
    80004748:	fb4080e7          	jalr	-76(ra) # 800026f8 <_Znwm>
    8000474c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004750:	ffffe097          	auipc	ra,0xffffe
    80004754:	118080e7          	jalr	280(ra) # 80002868 <_ZN6ThreadC1Ev>
    80004758:	00008797          	auipc	a5,0x8
    8000475c:	ef878793          	addi	a5,a5,-264 # 8000c650 <_ZTV7WorkerA+0x10>
    80004760:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004764:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004768:	00006517          	auipc	a0,0x6
    8000476c:	cc050513          	addi	a0,a0,-832 # 8000a428 <CONSOLE_STATUS+0x418>
    80004770:	ffffd097          	auipc	ra,0xffffd
    80004774:	4ec080e7          	jalr	1260(ra) # 80001c5c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004778:	02000513          	li	a0,32
    8000477c:	ffffe097          	auipc	ra,0xffffe
    80004780:	f7c080e7          	jalr	-132(ra) # 800026f8 <_Znwm>
    80004784:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004788:	ffffe097          	auipc	ra,0xffffe
    8000478c:	0e0080e7          	jalr	224(ra) # 80002868 <_ZN6ThreadC1Ev>
    80004790:	00008797          	auipc	a5,0x8
    80004794:	ee878793          	addi	a5,a5,-280 # 8000c678 <_ZTV7WorkerB+0x10>
    80004798:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000479c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800047a0:	00006517          	auipc	a0,0x6
    800047a4:	ca050513          	addi	a0,a0,-864 # 8000a440 <CONSOLE_STATUS+0x430>
    800047a8:	ffffd097          	auipc	ra,0xffffd
    800047ac:	4b4080e7          	jalr	1204(ra) # 80001c5c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800047b0:	02000513          	li	a0,32
    800047b4:	ffffe097          	auipc	ra,0xffffe
    800047b8:	f44080e7          	jalr	-188(ra) # 800026f8 <_Znwm>
    800047bc:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800047c0:	ffffe097          	auipc	ra,0xffffe
    800047c4:	0a8080e7          	jalr	168(ra) # 80002868 <_ZN6ThreadC1Ev>
    800047c8:	00008797          	auipc	a5,0x8
    800047cc:	ed878793          	addi	a5,a5,-296 # 8000c6a0 <_ZTV7WorkerC+0x10>
    800047d0:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800047d4:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800047d8:	00006517          	auipc	a0,0x6
    800047dc:	c8050513          	addi	a0,a0,-896 # 8000a458 <CONSOLE_STATUS+0x448>
    800047e0:	ffffd097          	auipc	ra,0xffffd
    800047e4:	47c080e7          	jalr	1148(ra) # 80001c5c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800047e8:	02000513          	li	a0,32
    800047ec:	ffffe097          	auipc	ra,0xffffe
    800047f0:	f0c080e7          	jalr	-244(ra) # 800026f8 <_Znwm>
    800047f4:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	070080e7          	jalr	112(ra) # 80002868 <_ZN6ThreadC1Ev>
    80004800:	00008797          	auipc	a5,0x8
    80004804:	ec878793          	addi	a5,a5,-312 # 8000c6c8 <_ZTV7WorkerD+0x10>
    80004808:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    8000480c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004810:	00006517          	auipc	a0,0x6
    80004814:	c6050513          	addi	a0,a0,-928 # 8000a470 <CONSOLE_STATUS+0x460>
    80004818:	ffffd097          	auipc	ra,0xffffd
    8000481c:	444080e7          	jalr	1092(ra) # 80001c5c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004820:	00000493          	li	s1,0
    80004824:	00300793          	li	a5,3
    80004828:	0297c663          	blt	a5,s1,80004854 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    8000482c:	00349793          	slli	a5,s1,0x3
    80004830:	fe040713          	addi	a4,s0,-32
    80004834:	00f707b3          	add	a5,a4,a5
    80004838:	fe07b503          	ld	a0,-32(a5)
    8000483c:	ffffe097          	auipc	ra,0xffffe
    80004840:	fa0080e7          	jalr	-96(ra) # 800027dc <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004844:	0014849b          	addiw	s1,s1,1
    80004848:	fddff06f          	j	80004824 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    8000484c:	ffffe097          	auipc	ra,0xffffe
    80004850:	ff4080e7          	jalr	-12(ra) # 80002840 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004854:	00008797          	auipc	a5,0x8
    80004858:	0847c783          	lbu	a5,132(a5) # 8000c8d8 <_ZL9finishedA>
    8000485c:	fe0788e3          	beqz	a5,8000484c <_Z20Threads_CPP_API_testv+0x124>
    80004860:	00008797          	auipc	a5,0x8
    80004864:	0797c783          	lbu	a5,121(a5) # 8000c8d9 <_ZL9finishedB>
    80004868:	fe0782e3          	beqz	a5,8000484c <_Z20Threads_CPP_API_testv+0x124>
    8000486c:	00008797          	auipc	a5,0x8
    80004870:	06e7c783          	lbu	a5,110(a5) # 8000c8da <_ZL9finishedC>
    80004874:	fc078ce3          	beqz	a5,8000484c <_Z20Threads_CPP_API_testv+0x124>
    80004878:	00008797          	auipc	a5,0x8
    8000487c:	0637c783          	lbu	a5,99(a5) # 8000c8db <_ZL9finishedD>
    80004880:	fc0786e3          	beqz	a5,8000484c <_Z20Threads_CPP_API_testv+0x124>
    80004884:	fc040493          	addi	s1,s0,-64
    80004888:	0080006f          	j	80004890 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    8000488c:	00848493          	addi	s1,s1,8
    80004890:	fe040793          	addi	a5,s0,-32
    80004894:	08f48663          	beq	s1,a5,80004920 <_Z20Threads_CPP_API_testv+0x1f8>
    80004898:	0004b503          	ld	a0,0(s1)
    8000489c:	fe0508e3          	beqz	a0,8000488c <_Z20Threads_CPP_API_testv+0x164>
    800048a0:	00053783          	ld	a5,0(a0)
    800048a4:	0087b783          	ld	a5,8(a5)
    800048a8:	000780e7          	jalr	a5
    800048ac:	fe1ff06f          	j	8000488c <_Z20Threads_CPP_API_testv+0x164>
    800048b0:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800048b4:	00048513          	mv	a0,s1
    800048b8:	ffffe097          	auipc	ra,0xffffe
    800048bc:	e68080e7          	jalr	-408(ra) # 80002720 <_ZdlPv>
    800048c0:	00090513          	mv	a0,s2
    800048c4:	00009097          	auipc	ra,0x9
    800048c8:	134080e7          	jalr	308(ra) # 8000d9f8 <_Unwind_Resume>
    800048cc:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800048d0:	00048513          	mv	a0,s1
    800048d4:	ffffe097          	auipc	ra,0xffffe
    800048d8:	e4c080e7          	jalr	-436(ra) # 80002720 <_ZdlPv>
    800048dc:	00090513          	mv	a0,s2
    800048e0:	00009097          	auipc	ra,0x9
    800048e4:	118080e7          	jalr	280(ra) # 8000d9f8 <_Unwind_Resume>
    800048e8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800048ec:	00048513          	mv	a0,s1
    800048f0:	ffffe097          	auipc	ra,0xffffe
    800048f4:	e30080e7          	jalr	-464(ra) # 80002720 <_ZdlPv>
    800048f8:	00090513          	mv	a0,s2
    800048fc:	00009097          	auipc	ra,0x9
    80004900:	0fc080e7          	jalr	252(ra) # 8000d9f8 <_Unwind_Resume>
    80004904:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004908:	00048513          	mv	a0,s1
    8000490c:	ffffe097          	auipc	ra,0xffffe
    80004910:	e14080e7          	jalr	-492(ra) # 80002720 <_ZdlPv>
    80004914:	00090513          	mv	a0,s2
    80004918:	00009097          	auipc	ra,0x9
    8000491c:	0e0080e7          	jalr	224(ra) # 8000d9f8 <_Unwind_Resume>
}
    80004920:	03813083          	ld	ra,56(sp)
    80004924:	03013403          	ld	s0,48(sp)
    80004928:	02813483          	ld	s1,40(sp)
    8000492c:	02013903          	ld	s2,32(sp)
    80004930:	04010113          	addi	sp,sp,64
    80004934:	00008067          	ret

0000000080004938 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004938:	ff010113          	addi	sp,sp,-16
    8000493c:	00113423          	sd	ra,8(sp)
    80004940:	00813023          	sd	s0,0(sp)
    80004944:	01010413          	addi	s0,sp,16
    80004948:	00008797          	auipc	a5,0x8
    8000494c:	d0878793          	addi	a5,a5,-760 # 8000c650 <_ZTV7WorkerA+0x10>
    80004950:	00f53023          	sd	a5,0(a0)
    80004954:	ffffe097          	auipc	ra,0xffffe
    80004958:	d54080e7          	jalr	-684(ra) # 800026a8 <_ZN6ThreadD1Ev>
    8000495c:	00813083          	ld	ra,8(sp)
    80004960:	00013403          	ld	s0,0(sp)
    80004964:	01010113          	addi	sp,sp,16
    80004968:	00008067          	ret

000000008000496c <_ZN7WorkerAD0Ev>:
    8000496c:	fe010113          	addi	sp,sp,-32
    80004970:	00113c23          	sd	ra,24(sp)
    80004974:	00813823          	sd	s0,16(sp)
    80004978:	00913423          	sd	s1,8(sp)
    8000497c:	02010413          	addi	s0,sp,32
    80004980:	00050493          	mv	s1,a0
    80004984:	00008797          	auipc	a5,0x8
    80004988:	ccc78793          	addi	a5,a5,-820 # 8000c650 <_ZTV7WorkerA+0x10>
    8000498c:	00f53023          	sd	a5,0(a0)
    80004990:	ffffe097          	auipc	ra,0xffffe
    80004994:	d18080e7          	jalr	-744(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004998:	00048513          	mv	a0,s1
    8000499c:	ffffe097          	auipc	ra,0xffffe
    800049a0:	d84080e7          	jalr	-636(ra) # 80002720 <_ZdlPv>
    800049a4:	01813083          	ld	ra,24(sp)
    800049a8:	01013403          	ld	s0,16(sp)
    800049ac:	00813483          	ld	s1,8(sp)
    800049b0:	02010113          	addi	sp,sp,32
    800049b4:	00008067          	ret

00000000800049b8 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800049b8:	ff010113          	addi	sp,sp,-16
    800049bc:	00113423          	sd	ra,8(sp)
    800049c0:	00813023          	sd	s0,0(sp)
    800049c4:	01010413          	addi	s0,sp,16
    800049c8:	00008797          	auipc	a5,0x8
    800049cc:	cb078793          	addi	a5,a5,-848 # 8000c678 <_ZTV7WorkerB+0x10>
    800049d0:	00f53023          	sd	a5,0(a0)
    800049d4:	ffffe097          	auipc	ra,0xffffe
    800049d8:	cd4080e7          	jalr	-812(ra) # 800026a8 <_ZN6ThreadD1Ev>
    800049dc:	00813083          	ld	ra,8(sp)
    800049e0:	00013403          	ld	s0,0(sp)
    800049e4:	01010113          	addi	sp,sp,16
    800049e8:	00008067          	ret

00000000800049ec <_ZN7WorkerBD0Ev>:
    800049ec:	fe010113          	addi	sp,sp,-32
    800049f0:	00113c23          	sd	ra,24(sp)
    800049f4:	00813823          	sd	s0,16(sp)
    800049f8:	00913423          	sd	s1,8(sp)
    800049fc:	02010413          	addi	s0,sp,32
    80004a00:	00050493          	mv	s1,a0
    80004a04:	00008797          	auipc	a5,0x8
    80004a08:	c7478793          	addi	a5,a5,-908 # 8000c678 <_ZTV7WorkerB+0x10>
    80004a0c:	00f53023          	sd	a5,0(a0)
    80004a10:	ffffe097          	auipc	ra,0xffffe
    80004a14:	c98080e7          	jalr	-872(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004a18:	00048513          	mv	a0,s1
    80004a1c:	ffffe097          	auipc	ra,0xffffe
    80004a20:	d04080e7          	jalr	-764(ra) # 80002720 <_ZdlPv>
    80004a24:	01813083          	ld	ra,24(sp)
    80004a28:	01013403          	ld	s0,16(sp)
    80004a2c:	00813483          	ld	s1,8(sp)
    80004a30:	02010113          	addi	sp,sp,32
    80004a34:	00008067          	ret

0000000080004a38 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004a38:	ff010113          	addi	sp,sp,-16
    80004a3c:	00113423          	sd	ra,8(sp)
    80004a40:	00813023          	sd	s0,0(sp)
    80004a44:	01010413          	addi	s0,sp,16
    80004a48:	00008797          	auipc	a5,0x8
    80004a4c:	c5878793          	addi	a5,a5,-936 # 8000c6a0 <_ZTV7WorkerC+0x10>
    80004a50:	00f53023          	sd	a5,0(a0)
    80004a54:	ffffe097          	auipc	ra,0xffffe
    80004a58:	c54080e7          	jalr	-940(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004a5c:	00813083          	ld	ra,8(sp)
    80004a60:	00013403          	ld	s0,0(sp)
    80004a64:	01010113          	addi	sp,sp,16
    80004a68:	00008067          	ret

0000000080004a6c <_ZN7WorkerCD0Ev>:
    80004a6c:	fe010113          	addi	sp,sp,-32
    80004a70:	00113c23          	sd	ra,24(sp)
    80004a74:	00813823          	sd	s0,16(sp)
    80004a78:	00913423          	sd	s1,8(sp)
    80004a7c:	02010413          	addi	s0,sp,32
    80004a80:	00050493          	mv	s1,a0
    80004a84:	00008797          	auipc	a5,0x8
    80004a88:	c1c78793          	addi	a5,a5,-996 # 8000c6a0 <_ZTV7WorkerC+0x10>
    80004a8c:	00f53023          	sd	a5,0(a0)
    80004a90:	ffffe097          	auipc	ra,0xffffe
    80004a94:	c18080e7          	jalr	-1000(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004a98:	00048513          	mv	a0,s1
    80004a9c:	ffffe097          	auipc	ra,0xffffe
    80004aa0:	c84080e7          	jalr	-892(ra) # 80002720 <_ZdlPv>
    80004aa4:	01813083          	ld	ra,24(sp)
    80004aa8:	01013403          	ld	s0,16(sp)
    80004aac:	00813483          	ld	s1,8(sp)
    80004ab0:	02010113          	addi	sp,sp,32
    80004ab4:	00008067          	ret

0000000080004ab8 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004ab8:	ff010113          	addi	sp,sp,-16
    80004abc:	00113423          	sd	ra,8(sp)
    80004ac0:	00813023          	sd	s0,0(sp)
    80004ac4:	01010413          	addi	s0,sp,16
    80004ac8:	00008797          	auipc	a5,0x8
    80004acc:	c0078793          	addi	a5,a5,-1024 # 8000c6c8 <_ZTV7WorkerD+0x10>
    80004ad0:	00f53023          	sd	a5,0(a0)
    80004ad4:	ffffe097          	auipc	ra,0xffffe
    80004ad8:	bd4080e7          	jalr	-1068(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004adc:	00813083          	ld	ra,8(sp)
    80004ae0:	00013403          	ld	s0,0(sp)
    80004ae4:	01010113          	addi	sp,sp,16
    80004ae8:	00008067          	ret

0000000080004aec <_ZN7WorkerDD0Ev>:
    80004aec:	fe010113          	addi	sp,sp,-32
    80004af0:	00113c23          	sd	ra,24(sp)
    80004af4:	00813823          	sd	s0,16(sp)
    80004af8:	00913423          	sd	s1,8(sp)
    80004afc:	02010413          	addi	s0,sp,32
    80004b00:	00050493          	mv	s1,a0
    80004b04:	00008797          	auipc	a5,0x8
    80004b08:	bc478793          	addi	a5,a5,-1084 # 8000c6c8 <_ZTV7WorkerD+0x10>
    80004b0c:	00f53023          	sd	a5,0(a0)
    80004b10:	ffffe097          	auipc	ra,0xffffe
    80004b14:	b98080e7          	jalr	-1128(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004b18:	00048513          	mv	a0,s1
    80004b1c:	ffffe097          	auipc	ra,0xffffe
    80004b20:	c04080e7          	jalr	-1020(ra) # 80002720 <_ZdlPv>
    80004b24:	01813083          	ld	ra,24(sp)
    80004b28:	01013403          	ld	s0,16(sp)
    80004b2c:	00813483          	ld	s1,8(sp)
    80004b30:	02010113          	addi	sp,sp,32
    80004b34:	00008067          	ret

0000000080004b38 <_ZN7WorkerA3runEv>:
    void run() override {
    80004b38:	ff010113          	addi	sp,sp,-16
    80004b3c:	00113423          	sd	ra,8(sp)
    80004b40:	00813023          	sd	s0,0(sp)
    80004b44:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004b48:	00000593          	li	a1,0
    80004b4c:	fffff097          	auipc	ra,0xfffff
    80004b50:	774080e7          	jalr	1908(ra) # 800042c0 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004b54:	00813083          	ld	ra,8(sp)
    80004b58:	00013403          	ld	s0,0(sp)
    80004b5c:	01010113          	addi	sp,sp,16
    80004b60:	00008067          	ret

0000000080004b64 <_ZN7WorkerB3runEv>:
    void run() override {
    80004b64:	ff010113          	addi	sp,sp,-16
    80004b68:	00113423          	sd	ra,8(sp)
    80004b6c:	00813023          	sd	s0,0(sp)
    80004b70:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004b74:	00000593          	li	a1,0
    80004b78:	00000097          	auipc	ra,0x0
    80004b7c:	814080e7          	jalr	-2028(ra) # 8000438c <_ZN7WorkerB11workerBodyBEPv>
    }
    80004b80:	00813083          	ld	ra,8(sp)
    80004b84:	00013403          	ld	s0,0(sp)
    80004b88:	01010113          	addi	sp,sp,16
    80004b8c:	00008067          	ret

0000000080004b90 <_ZN7WorkerC3runEv>:
    void run() override {
    80004b90:	ff010113          	addi	sp,sp,-16
    80004b94:	00113423          	sd	ra,8(sp)
    80004b98:	00813023          	sd	s0,0(sp)
    80004b9c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004ba0:	00000593          	li	a1,0
    80004ba4:	00000097          	auipc	ra,0x0
    80004ba8:	8bc080e7          	jalr	-1860(ra) # 80004460 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004bac:	00813083          	ld	ra,8(sp)
    80004bb0:	00013403          	ld	s0,0(sp)
    80004bb4:	01010113          	addi	sp,sp,16
    80004bb8:	00008067          	ret

0000000080004bbc <_ZN7WorkerD3runEv>:
    void run() override {
    80004bbc:	ff010113          	addi	sp,sp,-16
    80004bc0:	00113423          	sd	ra,8(sp)
    80004bc4:	00813023          	sd	s0,0(sp)
    80004bc8:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004bcc:	00000593          	li	a1,0
    80004bd0:	00000097          	auipc	ra,0x0
    80004bd4:	a10080e7          	jalr	-1520(ra) # 800045e0 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004bd8:	00813083          	ld	ra,8(sp)
    80004bdc:	00013403          	ld	s0,0(sp)
    80004be0:	01010113          	addi	sp,sp,16
    80004be4:	00008067          	ret

0000000080004be8 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004be8:	f8010113          	addi	sp,sp,-128
    80004bec:	06113c23          	sd	ra,120(sp)
    80004bf0:	06813823          	sd	s0,112(sp)
    80004bf4:	06913423          	sd	s1,104(sp)
    80004bf8:	07213023          	sd	s2,96(sp)
    80004bfc:	05313c23          	sd	s3,88(sp)
    80004c00:	05413823          	sd	s4,80(sp)
    80004c04:	05513423          	sd	s5,72(sp)
    80004c08:	05613023          	sd	s6,64(sp)
    80004c0c:	03713c23          	sd	s7,56(sp)
    80004c10:	03813823          	sd	s8,48(sp)
    80004c14:	03913423          	sd	s9,40(sp)
    80004c18:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004c1c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004c20:	00005517          	auipc	a0,0x5
    80004c24:	67850513          	addi	a0,a0,1656 # 8000a298 <CONSOLE_STATUS+0x288>
    80004c28:	ffffd097          	auipc	ra,0xffffd
    80004c2c:	034080e7          	jalr	52(ra) # 80001c5c <_Z11printStringPKc>
    getString(input, 30);
    80004c30:	01e00593          	li	a1,30
    80004c34:	f8040493          	addi	s1,s0,-128
    80004c38:	00048513          	mv	a0,s1
    80004c3c:	ffffd097          	auipc	ra,0xffffd
    80004c40:	0a8080e7          	jalr	168(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004c44:	00048513          	mv	a0,s1
    80004c48:	ffffd097          	auipc	ra,0xffffd
    80004c4c:	174080e7          	jalr	372(ra) # 80001dbc <_Z11stringToIntPKc>
    80004c50:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004c54:	00005517          	auipc	a0,0x5
    80004c58:	66450513          	addi	a0,a0,1636 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    80004c5c:	ffffd097          	auipc	ra,0xffffd
    80004c60:	000080e7          	jalr	ra # 80001c5c <_Z11printStringPKc>
    getString(input, 30);
    80004c64:	01e00593          	li	a1,30
    80004c68:	00048513          	mv	a0,s1
    80004c6c:	ffffd097          	auipc	ra,0xffffd
    80004c70:	078080e7          	jalr	120(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80004c74:	00048513          	mv	a0,s1
    80004c78:	ffffd097          	auipc	ra,0xffffd
    80004c7c:	144080e7          	jalr	324(ra) # 80001dbc <_Z11stringToIntPKc>
    80004c80:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004c84:	00005517          	auipc	a0,0x5
    80004c88:	65450513          	addi	a0,a0,1620 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    80004c8c:	ffffd097          	auipc	ra,0xffffd
    80004c90:	fd0080e7          	jalr	-48(ra) # 80001c5c <_Z11printStringPKc>
    printInt(threadNum);
    80004c94:	00000613          	li	a2,0
    80004c98:	00a00593          	li	a1,10
    80004c9c:	00098513          	mv	a0,s3
    80004ca0:	ffffd097          	auipc	ra,0xffffd
    80004ca4:	16c080e7          	jalr	364(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004ca8:	00005517          	auipc	a0,0x5
    80004cac:	64850513          	addi	a0,a0,1608 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80004cb0:	ffffd097          	auipc	ra,0xffffd
    80004cb4:	fac080e7          	jalr	-84(ra) # 80001c5c <_Z11printStringPKc>
    printInt(n);
    80004cb8:	00000613          	li	a2,0
    80004cbc:	00a00593          	li	a1,10
    80004cc0:	00048513          	mv	a0,s1
    80004cc4:	ffffd097          	auipc	ra,0xffffd
    80004cc8:	148080e7          	jalr	328(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80004ccc:	00005517          	auipc	a0,0x5
    80004cd0:	63c50513          	addi	a0,a0,1596 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80004cd4:	ffffd097          	auipc	ra,0xffffd
    80004cd8:	f88080e7          	jalr	-120(ra) # 80001c5c <_Z11printStringPKc>
    if (threadNum > n) {
    80004cdc:	0334c463          	blt	s1,s3,80004d04 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004ce0:	03305c63          	blez	s3,80004d18 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004ce4:	03800513          	li	a0,56
    80004ce8:	ffffe097          	auipc	ra,0xffffe
    80004cec:	a10080e7          	jalr	-1520(ra) # 800026f8 <_Znwm>
    80004cf0:	00050a93          	mv	s5,a0
    80004cf4:	00048593          	mv	a1,s1
    80004cf8:	00001097          	auipc	ra,0x1
    80004cfc:	4e8080e7          	jalr	1256(ra) # 800061e0 <_ZN9BufferCPPC1Ei>
    80004d00:	0300006f          	j	80004d30 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004d04:	00005517          	auipc	a0,0x5
    80004d08:	60c50513          	addi	a0,a0,1548 # 8000a310 <CONSOLE_STATUS+0x300>
    80004d0c:	ffffd097          	auipc	ra,0xffffd
    80004d10:	f50080e7          	jalr	-176(ra) # 80001c5c <_Z11printStringPKc>
        return;
    80004d14:	0140006f          	j	80004d28 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004d18:	00005517          	auipc	a0,0x5
    80004d1c:	63850513          	addi	a0,a0,1592 # 8000a350 <CONSOLE_STATUS+0x340>
    80004d20:	ffffd097          	auipc	ra,0xffffd
    80004d24:	f3c080e7          	jalr	-196(ra) # 80001c5c <_Z11printStringPKc>
        return;
    80004d28:	000c0113          	mv	sp,s8
    80004d2c:	2140006f          	j	80004f40 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004d30:	01000513          	li	a0,16
    80004d34:	ffffe097          	auipc	ra,0xffffe
    80004d38:	9c4080e7          	jalr	-1596(ra) # 800026f8 <_Znwm>
    80004d3c:	00050913          	mv	s2,a0
    80004d40:	00000593          	li	a1,0
    80004d44:	ffffe097          	auipc	ra,0xffffe
    80004d48:	bd4080e7          	jalr	-1068(ra) # 80002918 <_ZN9SemaphoreC1Ej>
    80004d4c:	00008797          	auipc	a5,0x8
    80004d50:	b927be23          	sd	s2,-1124(a5) # 8000c8e8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004d54:	00399793          	slli	a5,s3,0x3
    80004d58:	00f78793          	addi	a5,a5,15
    80004d5c:	ff07f793          	andi	a5,a5,-16
    80004d60:	40f10133          	sub	sp,sp,a5
    80004d64:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004d68:	0019871b          	addiw	a4,s3,1
    80004d6c:	00171793          	slli	a5,a4,0x1
    80004d70:	00e787b3          	add	a5,a5,a4
    80004d74:	00379793          	slli	a5,a5,0x3
    80004d78:	00f78793          	addi	a5,a5,15
    80004d7c:	ff07f793          	andi	a5,a5,-16
    80004d80:	40f10133          	sub	sp,sp,a5
    80004d84:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004d88:	00199493          	slli	s1,s3,0x1
    80004d8c:	013484b3          	add	s1,s1,s3
    80004d90:	00349493          	slli	s1,s1,0x3
    80004d94:	009b04b3          	add	s1,s6,s1
    80004d98:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004d9c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004da0:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004da4:	02800513          	li	a0,40
    80004da8:	ffffe097          	auipc	ra,0xffffe
    80004dac:	950080e7          	jalr	-1712(ra) # 800026f8 <_Znwm>
    80004db0:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004db4:	ffffe097          	auipc	ra,0xffffe
    80004db8:	ab4080e7          	jalr	-1356(ra) # 80002868 <_ZN6ThreadC1Ev>
    80004dbc:	00008797          	auipc	a5,0x8
    80004dc0:	98478793          	addi	a5,a5,-1660 # 8000c740 <_ZTV8Consumer+0x10>
    80004dc4:	00fbb023          	sd	a5,0(s7)
    80004dc8:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004dcc:	000b8513          	mv	a0,s7
    80004dd0:	ffffe097          	auipc	ra,0xffffe
    80004dd4:	a0c080e7          	jalr	-1524(ra) # 800027dc <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004dd8:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004ddc:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004de0:	00008797          	auipc	a5,0x8
    80004de4:	b087b783          	ld	a5,-1272(a5) # 8000c8e8 <_ZL10waitForAll>
    80004de8:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004dec:	02800513          	li	a0,40
    80004df0:	ffffe097          	auipc	ra,0xffffe
    80004df4:	908080e7          	jalr	-1784(ra) # 800026f8 <_Znwm>
    80004df8:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004dfc:	ffffe097          	auipc	ra,0xffffe
    80004e00:	a6c080e7          	jalr	-1428(ra) # 80002868 <_ZN6ThreadC1Ev>
    80004e04:	00008797          	auipc	a5,0x8
    80004e08:	8ec78793          	addi	a5,a5,-1812 # 8000c6f0 <_ZTV16ProducerKeyborad+0x10>
    80004e0c:	00f4b023          	sd	a5,0(s1)
    80004e10:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004e14:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004e18:	00048513          	mv	a0,s1
    80004e1c:	ffffe097          	auipc	ra,0xffffe
    80004e20:	9c0080e7          	jalr	-1600(ra) # 800027dc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004e24:	00100913          	li	s2,1
    80004e28:	0300006f          	j	80004e58 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004e2c:	00008797          	auipc	a5,0x8
    80004e30:	8ec78793          	addi	a5,a5,-1812 # 8000c718 <_ZTV8Producer+0x10>
    80004e34:	00fcb023          	sd	a5,0(s9)
    80004e38:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004e3c:	00391793          	slli	a5,s2,0x3
    80004e40:	00fa07b3          	add	a5,s4,a5
    80004e44:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004e48:	000c8513          	mv	a0,s9
    80004e4c:	ffffe097          	auipc	ra,0xffffe
    80004e50:	990080e7          	jalr	-1648(ra) # 800027dc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004e54:	0019091b          	addiw	s2,s2,1
    80004e58:	05395263          	bge	s2,s3,80004e9c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004e5c:	00191493          	slli	s1,s2,0x1
    80004e60:	012484b3          	add	s1,s1,s2
    80004e64:	00349493          	slli	s1,s1,0x3
    80004e68:	009b04b3          	add	s1,s6,s1
    80004e6c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004e70:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004e74:	00008797          	auipc	a5,0x8
    80004e78:	a747b783          	ld	a5,-1420(a5) # 8000c8e8 <_ZL10waitForAll>
    80004e7c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004e80:	02800513          	li	a0,40
    80004e84:	ffffe097          	auipc	ra,0xffffe
    80004e88:	874080e7          	jalr	-1932(ra) # 800026f8 <_Znwm>
    80004e8c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004e90:	ffffe097          	auipc	ra,0xffffe
    80004e94:	9d8080e7          	jalr	-1576(ra) # 80002868 <_ZN6ThreadC1Ev>
    80004e98:	f95ff06f          	j	80004e2c <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004e9c:	ffffe097          	auipc	ra,0xffffe
    80004ea0:	9a4080e7          	jalr	-1628(ra) # 80002840 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004ea4:	00000493          	li	s1,0
    80004ea8:	0099ce63          	blt	s3,s1,80004ec4 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004eac:	00008517          	auipc	a0,0x8
    80004eb0:	a3c53503          	ld	a0,-1476(a0) # 8000c8e8 <_ZL10waitForAll>
    80004eb4:	ffffe097          	auipc	ra,0xffffe
    80004eb8:	a9c080e7          	jalr	-1380(ra) # 80002950 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004ebc:	0014849b          	addiw	s1,s1,1
    80004ec0:	fe9ff06f          	j	80004ea8 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004ec4:	00008517          	auipc	a0,0x8
    80004ec8:	a2453503          	ld	a0,-1500(a0) # 8000c8e8 <_ZL10waitForAll>
    80004ecc:	00050863          	beqz	a0,80004edc <_Z20testConsumerProducerv+0x2f4>
    80004ed0:	00053783          	ld	a5,0(a0)
    80004ed4:	0087b783          	ld	a5,8(a5)
    80004ed8:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004edc:	00000493          	li	s1,0
    80004ee0:	0080006f          	j	80004ee8 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004ee4:	0014849b          	addiw	s1,s1,1
    80004ee8:	0334d263          	bge	s1,s3,80004f0c <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004eec:	00349793          	slli	a5,s1,0x3
    80004ef0:	00fa07b3          	add	a5,s4,a5
    80004ef4:	0007b503          	ld	a0,0(a5)
    80004ef8:	fe0506e3          	beqz	a0,80004ee4 <_Z20testConsumerProducerv+0x2fc>
    80004efc:	00053783          	ld	a5,0(a0)
    80004f00:	0087b783          	ld	a5,8(a5)
    80004f04:	000780e7          	jalr	a5
    80004f08:	fddff06f          	j	80004ee4 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004f0c:	000b8a63          	beqz	s7,80004f20 <_Z20testConsumerProducerv+0x338>
    80004f10:	000bb783          	ld	a5,0(s7)
    80004f14:	0087b783          	ld	a5,8(a5)
    80004f18:	000b8513          	mv	a0,s7
    80004f1c:	000780e7          	jalr	a5
    delete buffer;
    80004f20:	000a8e63          	beqz	s5,80004f3c <_Z20testConsumerProducerv+0x354>
    80004f24:	000a8513          	mv	a0,s5
    80004f28:	00001097          	auipc	ra,0x1
    80004f2c:	5b0080e7          	jalr	1456(ra) # 800064d8 <_ZN9BufferCPPD1Ev>
    80004f30:	000a8513          	mv	a0,s5
    80004f34:	ffffd097          	auipc	ra,0xffffd
    80004f38:	7ec080e7          	jalr	2028(ra) # 80002720 <_ZdlPv>
    80004f3c:	000c0113          	mv	sp,s8
}
    80004f40:	f8040113          	addi	sp,s0,-128
    80004f44:	07813083          	ld	ra,120(sp)
    80004f48:	07013403          	ld	s0,112(sp)
    80004f4c:	06813483          	ld	s1,104(sp)
    80004f50:	06013903          	ld	s2,96(sp)
    80004f54:	05813983          	ld	s3,88(sp)
    80004f58:	05013a03          	ld	s4,80(sp)
    80004f5c:	04813a83          	ld	s5,72(sp)
    80004f60:	04013b03          	ld	s6,64(sp)
    80004f64:	03813b83          	ld	s7,56(sp)
    80004f68:	03013c03          	ld	s8,48(sp)
    80004f6c:	02813c83          	ld	s9,40(sp)
    80004f70:	08010113          	addi	sp,sp,128
    80004f74:	00008067          	ret
    80004f78:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004f7c:	000a8513          	mv	a0,s5
    80004f80:	ffffd097          	auipc	ra,0xffffd
    80004f84:	7a0080e7          	jalr	1952(ra) # 80002720 <_ZdlPv>
    80004f88:	00048513          	mv	a0,s1
    80004f8c:	00009097          	auipc	ra,0x9
    80004f90:	a6c080e7          	jalr	-1428(ra) # 8000d9f8 <_Unwind_Resume>
    80004f94:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004f98:	00090513          	mv	a0,s2
    80004f9c:	ffffd097          	auipc	ra,0xffffd
    80004fa0:	784080e7          	jalr	1924(ra) # 80002720 <_ZdlPv>
    80004fa4:	00048513          	mv	a0,s1
    80004fa8:	00009097          	auipc	ra,0x9
    80004fac:	a50080e7          	jalr	-1456(ra) # 8000d9f8 <_Unwind_Resume>
    80004fb0:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004fb4:	000b8513          	mv	a0,s7
    80004fb8:	ffffd097          	auipc	ra,0xffffd
    80004fbc:	768080e7          	jalr	1896(ra) # 80002720 <_ZdlPv>
    80004fc0:	00048513          	mv	a0,s1
    80004fc4:	00009097          	auipc	ra,0x9
    80004fc8:	a34080e7          	jalr	-1484(ra) # 8000d9f8 <_Unwind_Resume>
    80004fcc:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004fd0:	00048513          	mv	a0,s1
    80004fd4:	ffffd097          	auipc	ra,0xffffd
    80004fd8:	74c080e7          	jalr	1868(ra) # 80002720 <_ZdlPv>
    80004fdc:	00090513          	mv	a0,s2
    80004fe0:	00009097          	auipc	ra,0x9
    80004fe4:	a18080e7          	jalr	-1512(ra) # 8000d9f8 <_Unwind_Resume>
    80004fe8:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004fec:	000c8513          	mv	a0,s9
    80004ff0:	ffffd097          	auipc	ra,0xffffd
    80004ff4:	730080e7          	jalr	1840(ra) # 80002720 <_ZdlPv>
    80004ff8:	00048513          	mv	a0,s1
    80004ffc:	00009097          	auipc	ra,0x9
    80005000:	9fc080e7          	jalr	-1540(ra) # 8000d9f8 <_Unwind_Resume>

0000000080005004 <_ZN8Consumer3runEv>:
    void run() override {
    80005004:	fd010113          	addi	sp,sp,-48
    80005008:	02113423          	sd	ra,40(sp)
    8000500c:	02813023          	sd	s0,32(sp)
    80005010:	00913c23          	sd	s1,24(sp)
    80005014:	01213823          	sd	s2,16(sp)
    80005018:	01313423          	sd	s3,8(sp)
    8000501c:	03010413          	addi	s0,sp,48
    80005020:	00050913          	mv	s2,a0
        int i = 0;
    80005024:	00000993          	li	s3,0
    80005028:	0100006f          	j	80005038 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    8000502c:	00a00513          	li	a0,10
    80005030:	ffffe097          	auipc	ra,0xffffe
    80005034:	9a0080e7          	jalr	-1632(ra) # 800029d0 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80005038:	00008797          	auipc	a5,0x8
    8000503c:	8a87a783          	lw	a5,-1880(a5) # 8000c8e0 <_ZL9threadEnd>
    80005040:	04079a63          	bnez	a5,80005094 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80005044:	02093783          	ld	a5,32(s2)
    80005048:	0087b503          	ld	a0,8(a5)
    8000504c:	00001097          	auipc	ra,0x1
    80005050:	378080e7          	jalr	888(ra) # 800063c4 <_ZN9BufferCPP3getEv>
            i++;
    80005054:	0019849b          	addiw	s1,s3,1
    80005058:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    8000505c:	0ff57513          	andi	a0,a0,255
    80005060:	ffffe097          	auipc	ra,0xffffe
    80005064:	970080e7          	jalr	-1680(ra) # 800029d0 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80005068:	05000793          	li	a5,80
    8000506c:	02f4e4bb          	remw	s1,s1,a5
    80005070:	fc0494e3          	bnez	s1,80005038 <_ZN8Consumer3runEv+0x34>
    80005074:	fb9ff06f          	j	8000502c <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005078:	02093783          	ld	a5,32(s2)
    8000507c:	0087b503          	ld	a0,8(a5)
    80005080:	00001097          	auipc	ra,0x1
    80005084:	344080e7          	jalr	836(ra) # 800063c4 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005088:	0ff57513          	andi	a0,a0,255
    8000508c:	ffffe097          	auipc	ra,0xffffe
    80005090:	944080e7          	jalr	-1724(ra) # 800029d0 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005094:	02093783          	ld	a5,32(s2)
    80005098:	0087b503          	ld	a0,8(a5)
    8000509c:	00001097          	auipc	ra,0x1
    800050a0:	3b4080e7          	jalr	948(ra) # 80006450 <_ZN9BufferCPP6getCntEv>
    800050a4:	fca04ae3          	bgtz	a0,80005078 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800050a8:	02093783          	ld	a5,32(s2)
    800050ac:	0107b503          	ld	a0,16(a5)
    800050b0:	ffffe097          	auipc	ra,0xffffe
    800050b4:	8cc080e7          	jalr	-1844(ra) # 8000297c <_ZN9Semaphore6signalEv>
    }
    800050b8:	02813083          	ld	ra,40(sp)
    800050bc:	02013403          	ld	s0,32(sp)
    800050c0:	01813483          	ld	s1,24(sp)
    800050c4:	01013903          	ld	s2,16(sp)
    800050c8:	00813983          	ld	s3,8(sp)
    800050cc:	03010113          	addi	sp,sp,48
    800050d0:	00008067          	ret

00000000800050d4 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800050d4:	ff010113          	addi	sp,sp,-16
    800050d8:	00113423          	sd	ra,8(sp)
    800050dc:	00813023          	sd	s0,0(sp)
    800050e0:	01010413          	addi	s0,sp,16
    800050e4:	00007797          	auipc	a5,0x7
    800050e8:	65c78793          	addi	a5,a5,1628 # 8000c740 <_ZTV8Consumer+0x10>
    800050ec:	00f53023          	sd	a5,0(a0)
    800050f0:	ffffd097          	auipc	ra,0xffffd
    800050f4:	5b8080e7          	jalr	1464(ra) # 800026a8 <_ZN6ThreadD1Ev>
    800050f8:	00813083          	ld	ra,8(sp)
    800050fc:	00013403          	ld	s0,0(sp)
    80005100:	01010113          	addi	sp,sp,16
    80005104:	00008067          	ret

0000000080005108 <_ZN8ConsumerD0Ev>:
    80005108:	fe010113          	addi	sp,sp,-32
    8000510c:	00113c23          	sd	ra,24(sp)
    80005110:	00813823          	sd	s0,16(sp)
    80005114:	00913423          	sd	s1,8(sp)
    80005118:	02010413          	addi	s0,sp,32
    8000511c:	00050493          	mv	s1,a0
    80005120:	00007797          	auipc	a5,0x7
    80005124:	62078793          	addi	a5,a5,1568 # 8000c740 <_ZTV8Consumer+0x10>
    80005128:	00f53023          	sd	a5,0(a0)
    8000512c:	ffffd097          	auipc	ra,0xffffd
    80005130:	57c080e7          	jalr	1404(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005134:	00048513          	mv	a0,s1
    80005138:	ffffd097          	auipc	ra,0xffffd
    8000513c:	5e8080e7          	jalr	1512(ra) # 80002720 <_ZdlPv>
    80005140:	01813083          	ld	ra,24(sp)
    80005144:	01013403          	ld	s0,16(sp)
    80005148:	00813483          	ld	s1,8(sp)
    8000514c:	02010113          	addi	sp,sp,32
    80005150:	00008067          	ret

0000000080005154 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005154:	ff010113          	addi	sp,sp,-16
    80005158:	00113423          	sd	ra,8(sp)
    8000515c:	00813023          	sd	s0,0(sp)
    80005160:	01010413          	addi	s0,sp,16
    80005164:	00007797          	auipc	a5,0x7
    80005168:	58c78793          	addi	a5,a5,1420 # 8000c6f0 <_ZTV16ProducerKeyborad+0x10>
    8000516c:	00f53023          	sd	a5,0(a0)
    80005170:	ffffd097          	auipc	ra,0xffffd
    80005174:	538080e7          	jalr	1336(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005178:	00813083          	ld	ra,8(sp)
    8000517c:	00013403          	ld	s0,0(sp)
    80005180:	01010113          	addi	sp,sp,16
    80005184:	00008067          	ret

0000000080005188 <_ZN16ProducerKeyboradD0Ev>:
    80005188:	fe010113          	addi	sp,sp,-32
    8000518c:	00113c23          	sd	ra,24(sp)
    80005190:	00813823          	sd	s0,16(sp)
    80005194:	00913423          	sd	s1,8(sp)
    80005198:	02010413          	addi	s0,sp,32
    8000519c:	00050493          	mv	s1,a0
    800051a0:	00007797          	auipc	a5,0x7
    800051a4:	55078793          	addi	a5,a5,1360 # 8000c6f0 <_ZTV16ProducerKeyborad+0x10>
    800051a8:	00f53023          	sd	a5,0(a0)
    800051ac:	ffffd097          	auipc	ra,0xffffd
    800051b0:	4fc080e7          	jalr	1276(ra) # 800026a8 <_ZN6ThreadD1Ev>
    800051b4:	00048513          	mv	a0,s1
    800051b8:	ffffd097          	auipc	ra,0xffffd
    800051bc:	568080e7          	jalr	1384(ra) # 80002720 <_ZdlPv>
    800051c0:	01813083          	ld	ra,24(sp)
    800051c4:	01013403          	ld	s0,16(sp)
    800051c8:	00813483          	ld	s1,8(sp)
    800051cc:	02010113          	addi	sp,sp,32
    800051d0:	00008067          	ret

00000000800051d4 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800051d4:	ff010113          	addi	sp,sp,-16
    800051d8:	00113423          	sd	ra,8(sp)
    800051dc:	00813023          	sd	s0,0(sp)
    800051e0:	01010413          	addi	s0,sp,16
    800051e4:	00007797          	auipc	a5,0x7
    800051e8:	53478793          	addi	a5,a5,1332 # 8000c718 <_ZTV8Producer+0x10>
    800051ec:	00f53023          	sd	a5,0(a0)
    800051f0:	ffffd097          	auipc	ra,0xffffd
    800051f4:	4b8080e7          	jalr	1208(ra) # 800026a8 <_ZN6ThreadD1Ev>
    800051f8:	00813083          	ld	ra,8(sp)
    800051fc:	00013403          	ld	s0,0(sp)
    80005200:	01010113          	addi	sp,sp,16
    80005204:	00008067          	ret

0000000080005208 <_ZN8ProducerD0Ev>:
    80005208:	fe010113          	addi	sp,sp,-32
    8000520c:	00113c23          	sd	ra,24(sp)
    80005210:	00813823          	sd	s0,16(sp)
    80005214:	00913423          	sd	s1,8(sp)
    80005218:	02010413          	addi	s0,sp,32
    8000521c:	00050493          	mv	s1,a0
    80005220:	00007797          	auipc	a5,0x7
    80005224:	4f878793          	addi	a5,a5,1272 # 8000c718 <_ZTV8Producer+0x10>
    80005228:	00f53023          	sd	a5,0(a0)
    8000522c:	ffffd097          	auipc	ra,0xffffd
    80005230:	47c080e7          	jalr	1148(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005234:	00048513          	mv	a0,s1
    80005238:	ffffd097          	auipc	ra,0xffffd
    8000523c:	4e8080e7          	jalr	1256(ra) # 80002720 <_ZdlPv>
    80005240:	01813083          	ld	ra,24(sp)
    80005244:	01013403          	ld	s0,16(sp)
    80005248:	00813483          	ld	s1,8(sp)
    8000524c:	02010113          	addi	sp,sp,32
    80005250:	00008067          	ret

0000000080005254 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005254:	fe010113          	addi	sp,sp,-32
    80005258:	00113c23          	sd	ra,24(sp)
    8000525c:	00813823          	sd	s0,16(sp)
    80005260:	00913423          	sd	s1,8(sp)
    80005264:	02010413          	addi	s0,sp,32
    80005268:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    8000526c:	ffffc097          	auipc	ra,0xffffc
    80005270:	418080e7          	jalr	1048(ra) # 80001684 <_Z4getcv>
    80005274:	0005059b          	sext.w	a1,a0
    80005278:	01b00793          	li	a5,27
    8000527c:	00f58c63          	beq	a1,a5,80005294 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005280:	0204b783          	ld	a5,32(s1)
    80005284:	0087b503          	ld	a0,8(a5)
    80005288:	00001097          	auipc	ra,0x1
    8000528c:	0ac080e7          	jalr	172(ra) # 80006334 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005290:	fddff06f          	j	8000526c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005294:	00100793          	li	a5,1
    80005298:	00007717          	auipc	a4,0x7
    8000529c:	64f72423          	sw	a5,1608(a4) # 8000c8e0 <_ZL9threadEnd>
        td->buffer->put('!');
    800052a0:	0204b783          	ld	a5,32(s1)
    800052a4:	02100593          	li	a1,33
    800052a8:	0087b503          	ld	a0,8(a5)
    800052ac:	00001097          	auipc	ra,0x1
    800052b0:	088080e7          	jalr	136(ra) # 80006334 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800052b4:	0204b783          	ld	a5,32(s1)
    800052b8:	0107b503          	ld	a0,16(a5)
    800052bc:	ffffd097          	auipc	ra,0xffffd
    800052c0:	6c0080e7          	jalr	1728(ra) # 8000297c <_ZN9Semaphore6signalEv>
    }
    800052c4:	01813083          	ld	ra,24(sp)
    800052c8:	01013403          	ld	s0,16(sp)
    800052cc:	00813483          	ld	s1,8(sp)
    800052d0:	02010113          	addi	sp,sp,32
    800052d4:	00008067          	ret

00000000800052d8 <_ZN8Producer3runEv>:
    void run() override {
    800052d8:	fe010113          	addi	sp,sp,-32
    800052dc:	00113c23          	sd	ra,24(sp)
    800052e0:	00813823          	sd	s0,16(sp)
    800052e4:	00913423          	sd	s1,8(sp)
    800052e8:	01213023          	sd	s2,0(sp)
    800052ec:	02010413          	addi	s0,sp,32
    800052f0:	00050493          	mv	s1,a0
        int i = 0;
    800052f4:	00000913          	li	s2,0
        while (!threadEnd) {
    800052f8:	00007797          	auipc	a5,0x7
    800052fc:	5e87a783          	lw	a5,1512(a5) # 8000c8e0 <_ZL9threadEnd>
    80005300:	04079263          	bnez	a5,80005344 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80005304:	0204b783          	ld	a5,32(s1)
    80005308:	0007a583          	lw	a1,0(a5)
    8000530c:	0305859b          	addiw	a1,a1,48
    80005310:	0087b503          	ld	a0,8(a5)
    80005314:	00001097          	auipc	ra,0x1
    80005318:	020080e7          	jalr	32(ra) # 80006334 <_ZN9BufferCPP3putEi>
            i++;
    8000531c:	0019071b          	addiw	a4,s2,1
    80005320:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005324:	0204b783          	ld	a5,32(s1)
    80005328:	0007a783          	lw	a5,0(a5)
    8000532c:	00e787bb          	addw	a5,a5,a4
    80005330:	00500513          	li	a0,5
    80005334:	02a7e53b          	remw	a0,a5,a0
    80005338:	ffffd097          	auipc	ra,0xffffd
    8000533c:	564080e7          	jalr	1380(ra) # 8000289c <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80005340:	fb9ff06f          	j	800052f8 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005344:	0204b783          	ld	a5,32(s1)
    80005348:	0107b503          	ld	a0,16(a5)
    8000534c:	ffffd097          	auipc	ra,0xffffd
    80005350:	630080e7          	jalr	1584(ra) # 8000297c <_ZN9Semaphore6signalEv>
    }
    80005354:	01813083          	ld	ra,24(sp)
    80005358:	01013403          	ld	s0,16(sp)
    8000535c:	00813483          	ld	s1,8(sp)
    80005360:	00013903          	ld	s2,0(sp)
    80005364:	02010113          	addi	sp,sp,32
    80005368:	00008067          	ret

000000008000536c <_ZL9fibonaccim>:
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;
thread_t threads[4];

static uint64 fibonacci(uint64 n) {
    8000536c:	fe010113          	addi	sp,sp,-32
    80005370:	00113c23          	sd	ra,24(sp)
    80005374:	00813823          	sd	s0,16(sp)
    80005378:	00913423          	sd	s1,8(sp)
    8000537c:	01213023          	sd	s2,0(sp)
    80005380:	02010413          	addi	s0,sp,32
    80005384:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005388:	00100793          	li	a5,1
    8000538c:	02a7f863          	bgeu	a5,a0,800053bc <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005390:	00a00793          	li	a5,10
    80005394:	02f577b3          	remu	a5,a0,a5
    80005398:	02078e63          	beqz	a5,800053d4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000539c:	fff48513          	addi	a0,s1,-1
    800053a0:	00000097          	auipc	ra,0x0
    800053a4:	fcc080e7          	jalr	-52(ra) # 8000536c <_ZL9fibonaccim>
    800053a8:	00050913          	mv	s2,a0
    800053ac:	ffe48513          	addi	a0,s1,-2
    800053b0:	00000097          	auipc	ra,0x0
    800053b4:	fbc080e7          	jalr	-68(ra) # 8000536c <_ZL9fibonaccim>
    800053b8:	00a90533          	add	a0,s2,a0
}
    800053bc:	01813083          	ld	ra,24(sp)
    800053c0:	01013403          	ld	s0,16(sp)
    800053c4:	00813483          	ld	s1,8(sp)
    800053c8:	00013903          	ld	s2,0(sp)
    800053cc:	02010113          	addi	sp,sp,32
    800053d0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800053d4:	ffffc097          	auipc	ra,0xffffc
    800053d8:	14c080e7          	jalr	332(ra) # 80001520 <_Z15thread_dispatchv>
    800053dc:	fc1ff06f          	j	8000539c <_ZL9fibonaccim+0x30>

00000000800053e0 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800053e0:	fe010113          	addi	sp,sp,-32
    800053e4:	00113c23          	sd	ra,24(sp)
    800053e8:	00813823          	sd	s0,16(sp)
    800053ec:	00913423          	sd	s1,8(sp)
    800053f0:	01213023          	sd	s2,0(sp)
    800053f4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800053f8:	00a00493          	li	s1,10
    800053fc:	0400006f          	j	8000543c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005400:	00005517          	auipc	a0,0x5
    80005404:	ff050513          	addi	a0,a0,-16 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80005408:	ffffd097          	auipc	ra,0xffffd
    8000540c:	854080e7          	jalr	-1964(ra) # 80001c5c <_Z11printStringPKc>
    80005410:	00000613          	li	a2,0
    80005414:	00a00593          	li	a1,10
    80005418:	00048513          	mv	a0,s1
    8000541c:	ffffd097          	auipc	ra,0xffffd
    80005420:	9f0080e7          	jalr	-1552(ra) # 80001e0c <_Z8printIntiii>
    80005424:	00005517          	auipc	a0,0x5
    80005428:	d3c50513          	addi	a0,a0,-708 # 8000a160 <CONSOLE_STATUS+0x150>
    8000542c:	ffffd097          	auipc	ra,0xffffd
    80005430:	830080e7          	jalr	-2000(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005434:	0014849b          	addiw	s1,s1,1
    80005438:	0ff4f493          	andi	s1,s1,255
    8000543c:	00c00793          	li	a5,12
    80005440:	fc97f0e3          	bgeu	a5,s1,80005400 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005444:	00005517          	auipc	a0,0x5
    80005448:	fb450513          	addi	a0,a0,-76 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    8000544c:	ffffd097          	auipc	ra,0xffffd
    80005450:	810080e7          	jalr	-2032(ra) # 80001c5c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005454:	00500313          	li	t1,5
    thread_dispatch();
    80005458:	ffffc097          	auipc	ra,0xffffc
    8000545c:	0c8080e7          	jalr	200(ra) # 80001520 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005460:	01000513          	li	a0,16
    80005464:	00000097          	auipc	ra,0x0
    80005468:	f08080e7          	jalr	-248(ra) # 8000536c <_ZL9fibonaccim>
    8000546c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005470:	00005517          	auipc	a0,0x5
    80005474:	f9850513          	addi	a0,a0,-104 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80005478:	ffffc097          	auipc	ra,0xffffc
    8000547c:	7e4080e7          	jalr	2020(ra) # 80001c5c <_Z11printStringPKc>
    80005480:	00000613          	li	a2,0
    80005484:	00a00593          	li	a1,10
    80005488:	0009051b          	sext.w	a0,s2
    8000548c:	ffffd097          	auipc	ra,0xffffd
    80005490:	980080e7          	jalr	-1664(ra) # 80001e0c <_Z8printIntiii>
    80005494:	00005517          	auipc	a0,0x5
    80005498:	ccc50513          	addi	a0,a0,-820 # 8000a160 <CONSOLE_STATUS+0x150>
    8000549c:	ffffc097          	auipc	ra,0xffffc
    800054a0:	7c0080e7          	jalr	1984(ra) # 80001c5c <_Z11printStringPKc>
    800054a4:	0400006f          	j	800054e4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800054a8:	00005517          	auipc	a0,0x5
    800054ac:	f4850513          	addi	a0,a0,-184 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    800054b0:	ffffc097          	auipc	ra,0xffffc
    800054b4:	7ac080e7          	jalr	1964(ra) # 80001c5c <_Z11printStringPKc>
    800054b8:	00000613          	li	a2,0
    800054bc:	00a00593          	li	a1,10
    800054c0:	00048513          	mv	a0,s1
    800054c4:	ffffd097          	auipc	ra,0xffffd
    800054c8:	948080e7          	jalr	-1720(ra) # 80001e0c <_Z8printIntiii>
    800054cc:	00005517          	auipc	a0,0x5
    800054d0:	c9450513          	addi	a0,a0,-876 # 8000a160 <CONSOLE_STATUS+0x150>
    800054d4:	ffffc097          	auipc	ra,0xffffc
    800054d8:	788080e7          	jalr	1928(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800054dc:	0014849b          	addiw	s1,s1,1
    800054e0:	0ff4f493          	andi	s1,s1,255
    800054e4:	00f00793          	li	a5,15
    800054e8:	fc97f0e3          	bgeu	a5,s1,800054a8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800054ec:	00005517          	auipc	a0,0x5
    800054f0:	f2c50513          	addi	a0,a0,-212 # 8000a418 <CONSOLE_STATUS+0x408>
    800054f4:	ffffc097          	auipc	ra,0xffffc
    800054f8:	768080e7          	jalr	1896(ra) # 80001c5c <_Z11printStringPKc>
    finishedD = true;
    800054fc:	00100793          	li	a5,1
    80005500:	00007717          	auipc	a4,0x7
    80005504:	3ef70823          	sb	a5,1008(a4) # 8000c8f0 <_ZL9finishedD>
    thread_dispatch();
    80005508:	ffffc097          	auipc	ra,0xffffc
    8000550c:	018080e7          	jalr	24(ra) # 80001520 <_Z15thread_dispatchv>
}
    80005510:	01813083          	ld	ra,24(sp)
    80005514:	01013403          	ld	s0,16(sp)
    80005518:	00813483          	ld	s1,8(sp)
    8000551c:	00013903          	ld	s2,0(sp)
    80005520:	02010113          	addi	sp,sp,32
    80005524:	00008067          	ret

0000000080005528 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005528:	fe010113          	addi	sp,sp,-32
    8000552c:	00113c23          	sd	ra,24(sp)
    80005530:	00813823          	sd	s0,16(sp)
    80005534:	00913423          	sd	s1,8(sp)
    80005538:	01213023          	sd	s2,0(sp)
    8000553c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005540:	00000493          	li	s1,0
    80005544:	0400006f          	j	80005584 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005548:	00005517          	auipc	a0,0x5
    8000554c:	e6850513          	addi	a0,a0,-408 # 8000a3b0 <CONSOLE_STATUS+0x3a0>
    80005550:	ffffc097          	auipc	ra,0xffffc
    80005554:	70c080e7          	jalr	1804(ra) # 80001c5c <_Z11printStringPKc>
    80005558:	00000613          	li	a2,0
    8000555c:	00a00593          	li	a1,10
    80005560:	00048513          	mv	a0,s1
    80005564:	ffffd097          	auipc	ra,0xffffd
    80005568:	8a8080e7          	jalr	-1880(ra) # 80001e0c <_Z8printIntiii>
    8000556c:	00005517          	auipc	a0,0x5
    80005570:	bf450513          	addi	a0,a0,-1036 # 8000a160 <CONSOLE_STATUS+0x150>
    80005574:	ffffc097          	auipc	ra,0xffffc
    80005578:	6e8080e7          	jalr	1768(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000557c:	0014849b          	addiw	s1,s1,1
    80005580:	0ff4f493          	andi	s1,s1,255
    80005584:	00200793          	li	a5,2
    80005588:	fc97f0e3          	bgeu	a5,s1,80005548 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000558c:	00005517          	auipc	a0,0x5
    80005590:	e2c50513          	addi	a0,a0,-468 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80005594:	ffffc097          	auipc	ra,0xffffc
    80005598:	6c8080e7          	jalr	1736(ra) # 80001c5c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000559c:	00700313          	li	t1,7
    thread_dispatch();
    800055a0:	ffffc097          	auipc	ra,0xffffc
    800055a4:	f80080e7          	jalr	-128(ra) # 80001520 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800055a8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800055ac:	00005517          	auipc	a0,0x5
    800055b0:	e1c50513          	addi	a0,a0,-484 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    800055b4:	ffffc097          	auipc	ra,0xffffc
    800055b8:	6a8080e7          	jalr	1704(ra) # 80001c5c <_Z11printStringPKc>
    800055bc:	00000613          	li	a2,0
    800055c0:	00a00593          	li	a1,10
    800055c4:	0009051b          	sext.w	a0,s2
    800055c8:	ffffd097          	auipc	ra,0xffffd
    800055cc:	844080e7          	jalr	-1980(ra) # 80001e0c <_Z8printIntiii>
    800055d0:	00005517          	auipc	a0,0x5
    800055d4:	b9050513          	addi	a0,a0,-1136 # 8000a160 <CONSOLE_STATUS+0x150>
    800055d8:	ffffc097          	auipc	ra,0xffffc
    800055dc:	684080e7          	jalr	1668(ra) # 80001c5c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800055e0:	00c00513          	li	a0,12
    800055e4:	00000097          	auipc	ra,0x0
    800055e8:	d88080e7          	jalr	-632(ra) # 8000536c <_ZL9fibonaccim>
    800055ec:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800055f0:	00005517          	auipc	a0,0x5
    800055f4:	de050513          	addi	a0,a0,-544 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    800055f8:	ffffc097          	auipc	ra,0xffffc
    800055fc:	664080e7          	jalr	1636(ra) # 80001c5c <_Z11printStringPKc>
    80005600:	00000613          	li	a2,0
    80005604:	00a00593          	li	a1,10
    80005608:	0009051b          	sext.w	a0,s2
    8000560c:	ffffd097          	auipc	ra,0xffffd
    80005610:	800080e7          	jalr	-2048(ra) # 80001e0c <_Z8printIntiii>
    80005614:	00005517          	auipc	a0,0x5
    80005618:	b4c50513          	addi	a0,a0,-1204 # 8000a160 <CONSOLE_STATUS+0x150>
    8000561c:	ffffc097          	auipc	ra,0xffffc
    80005620:	640080e7          	jalr	1600(ra) # 80001c5c <_Z11printStringPKc>
    80005624:	0400006f          	j	80005664 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005628:	00005517          	auipc	a0,0x5
    8000562c:	d8850513          	addi	a0,a0,-632 # 8000a3b0 <CONSOLE_STATUS+0x3a0>
    80005630:	ffffc097          	auipc	ra,0xffffc
    80005634:	62c080e7          	jalr	1580(ra) # 80001c5c <_Z11printStringPKc>
    80005638:	00000613          	li	a2,0
    8000563c:	00a00593          	li	a1,10
    80005640:	00048513          	mv	a0,s1
    80005644:	ffffc097          	auipc	ra,0xffffc
    80005648:	7c8080e7          	jalr	1992(ra) # 80001e0c <_Z8printIntiii>
    8000564c:	00005517          	auipc	a0,0x5
    80005650:	b1450513          	addi	a0,a0,-1260 # 8000a160 <CONSOLE_STATUS+0x150>
    80005654:	ffffc097          	auipc	ra,0xffffc
    80005658:	608080e7          	jalr	1544(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000565c:	0014849b          	addiw	s1,s1,1
    80005660:	0ff4f493          	andi	s1,s1,255
    80005664:	00500793          	li	a5,5
    80005668:	fc97f0e3          	bgeu	a5,s1,80005628 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    8000566c:	00005517          	auipc	a0,0x5
    80005670:	d7450513          	addi	a0,a0,-652 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80005674:	ffffc097          	auipc	ra,0xffffc
    80005678:	5e8080e7          	jalr	1512(ra) # 80001c5c <_Z11printStringPKc>
    finishedC = true;
    8000567c:	00100793          	li	a5,1
    80005680:	00007717          	auipc	a4,0x7
    80005684:	26f708a3          	sb	a5,625(a4) # 8000c8f1 <_ZL9finishedC>
    thread_dispatch();
    80005688:	ffffc097          	auipc	ra,0xffffc
    8000568c:	e98080e7          	jalr	-360(ra) # 80001520 <_Z15thread_dispatchv>
}
    80005690:	01813083          	ld	ra,24(sp)
    80005694:	01013403          	ld	s0,16(sp)
    80005698:	00813483          	ld	s1,8(sp)
    8000569c:	00013903          	ld	s2,0(sp)
    800056a0:	02010113          	addi	sp,sp,32
    800056a4:	00008067          	ret

00000000800056a8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800056a8:	fe010113          	addi	sp,sp,-32
    800056ac:	00113c23          	sd	ra,24(sp)
    800056b0:	00813823          	sd	s0,16(sp)
    800056b4:	00913423          	sd	s1,8(sp)
    800056b8:	01213023          	sd	s2,0(sp)
    800056bc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800056c0:	00000913          	li	s2,0
    800056c4:	0380006f          	j	800056fc <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800056c8:	ffffc097          	auipc	ra,0xffffc
    800056cc:	e58080e7          	jalr	-424(ra) # 80001520 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800056d0:	00148493          	addi	s1,s1,1
    800056d4:	000027b7          	lui	a5,0x2
    800056d8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800056dc:	0097ee63          	bltu	a5,s1,800056f8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800056e0:	00000713          	li	a4,0
    800056e4:	000077b7          	lui	a5,0x7
    800056e8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800056ec:	fce7eee3          	bltu	a5,a4,800056c8 <_ZL11workerBodyBPv+0x20>
    800056f0:	00170713          	addi	a4,a4,1
    800056f4:	ff1ff06f          	j	800056e4 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800056f8:	00190913          	addi	s2,s2,1
    800056fc:	00f00793          	li	a5,15
    80005700:	0527e063          	bltu	a5,s2,80005740 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005704:	00005517          	auipc	a0,0x5
    80005708:	c9450513          	addi	a0,a0,-876 # 8000a398 <CONSOLE_STATUS+0x388>
    8000570c:	ffffc097          	auipc	ra,0xffffc
    80005710:	550080e7          	jalr	1360(ra) # 80001c5c <_Z11printStringPKc>
    80005714:	00000613          	li	a2,0
    80005718:	00a00593          	li	a1,10
    8000571c:	0009051b          	sext.w	a0,s2
    80005720:	ffffc097          	auipc	ra,0xffffc
    80005724:	6ec080e7          	jalr	1772(ra) # 80001e0c <_Z8printIntiii>
    80005728:	00005517          	auipc	a0,0x5
    8000572c:	a3850513          	addi	a0,a0,-1480 # 8000a160 <CONSOLE_STATUS+0x150>
    80005730:	ffffc097          	auipc	ra,0xffffc
    80005734:	52c080e7          	jalr	1324(ra) # 80001c5c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005738:	00000493          	li	s1,0
    8000573c:	f99ff06f          	j	800056d4 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005740:	00005517          	auipc	a0,0x5
    80005744:	c6050513          	addi	a0,a0,-928 # 8000a3a0 <CONSOLE_STATUS+0x390>
    80005748:	ffffc097          	auipc	ra,0xffffc
    8000574c:	514080e7          	jalr	1300(ra) # 80001c5c <_Z11printStringPKc>
    finishedB = true;
    80005750:	00100793          	li	a5,1
    80005754:	00007717          	auipc	a4,0x7
    80005758:	18f70f23          	sb	a5,414(a4) # 8000c8f2 <_ZL9finishedB>
    thread_dispatch();
    8000575c:	ffffc097          	auipc	ra,0xffffc
    80005760:	dc4080e7          	jalr	-572(ra) # 80001520 <_Z15thread_dispatchv>
}
    80005764:	01813083          	ld	ra,24(sp)
    80005768:	01013403          	ld	s0,16(sp)
    8000576c:	00813483          	ld	s1,8(sp)
    80005770:	00013903          	ld	s2,0(sp)
    80005774:	02010113          	addi	sp,sp,32
    80005778:	00008067          	ret

000000008000577c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000577c:	fe010113          	addi	sp,sp,-32
    80005780:	00113c23          	sd	ra,24(sp)
    80005784:	00813823          	sd	s0,16(sp)
    80005788:	00913423          	sd	s1,8(sp)
    8000578c:	01213023          	sd	s2,0(sp)
    80005790:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005794:	00000913          	li	s2,0
    80005798:	0380006f          	j	800057d0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000579c:	ffffc097          	auipc	ra,0xffffc
    800057a0:	d84080e7          	jalr	-636(ra) # 80001520 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800057a4:	00148493          	addi	s1,s1,1
    800057a8:	000027b7          	lui	a5,0x2
    800057ac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800057b0:	0097ee63          	bltu	a5,s1,800057cc <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800057b4:	00000713          	li	a4,0
    800057b8:	000077b7          	lui	a5,0x7
    800057bc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800057c0:	fce7eee3          	bltu	a5,a4,8000579c <_ZL11workerBodyAPv+0x20>
    800057c4:	00170713          	addi	a4,a4,1
    800057c8:	ff1ff06f          	j	800057b8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800057cc:	00190913          	addi	s2,s2,1
    800057d0:	00900793          	li	a5,9
    800057d4:	0527e063          	bltu	a5,s2,80005814 <_ZL11workerBodyAPv+0x98>
        printString("A: i=");
    800057d8:	00005517          	auipc	a0,0x5
    800057dc:	ba850513          	addi	a0,a0,-1112 # 8000a380 <CONSOLE_STATUS+0x370>
    800057e0:	ffffc097          	auipc	ra,0xffffc
    800057e4:	47c080e7          	jalr	1148(ra) # 80001c5c <_Z11printStringPKc>
        printInt(i);
    800057e8:	00000613          	li	a2,0
    800057ec:	00a00593          	li	a1,10
    800057f0:	0009051b          	sext.w	a0,s2
    800057f4:	ffffc097          	auipc	ra,0xffffc
    800057f8:	618080e7          	jalr	1560(ra) # 80001e0c <_Z8printIntiii>
        printString("\n");
    800057fc:	00005517          	auipc	a0,0x5
    80005800:	96450513          	addi	a0,a0,-1692 # 8000a160 <CONSOLE_STATUS+0x150>
    80005804:	ffffc097          	auipc	ra,0xffffc
    80005808:	458080e7          	jalr	1112(ra) # 80001c5c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000580c:	00000493          	li	s1,0
    80005810:	f99ff06f          	j	800057a8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005814:	00005517          	auipc	a0,0x5
    80005818:	b7450513          	addi	a0,a0,-1164 # 8000a388 <CONSOLE_STATUS+0x378>
    8000581c:	ffffc097          	auipc	ra,0xffffc
    80005820:	440080e7          	jalr	1088(ra) # 80001c5c <_Z11printStringPKc>
    finishedA = true;
    80005824:	00100793          	li	a5,1
    80005828:	00007717          	auipc	a4,0x7
    8000582c:	0cf705a3          	sb	a5,203(a4) # 8000c8f3 <_ZL9finishedA>
}
    80005830:	01813083          	ld	ra,24(sp)
    80005834:	01013403          	ld	s0,16(sp)
    80005838:	00813483          	ld	s1,8(sp)
    8000583c:	00013903          	ld	s2,0(sp)
    80005840:	02010113          	addi	sp,sp,32
    80005844:	00008067          	ret

0000000080005848 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005848:	ff010113          	addi	sp,sp,-16
    8000584c:	00113423          	sd	ra,8(sp)
    80005850:	00813023          	sd	s0,0(sp)
    80005854:	01010413          	addi	s0,sp,16

    thread_create(&threads[0], workerBodyA, nullptr);
    80005858:	00000613          	li	a2,0
    8000585c:	00000597          	auipc	a1,0x0
    80005860:	f2058593          	addi	a1,a1,-224 # 8000577c <_ZL11workerBodyAPv>
    80005864:	00007517          	auipc	a0,0x7
    80005868:	09450513          	addi	a0,a0,148 # 8000c8f8 <threads>
    8000586c:	ffffc097          	auipc	ra,0xffffc
    80005870:	c50080e7          	jalr	-944(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005874:	00005517          	auipc	a0,0x5
    80005878:	bb450513          	addi	a0,a0,-1100 # 8000a428 <CONSOLE_STATUS+0x418>
    8000587c:	ffffc097          	auipc	ra,0xffffc
    80005880:	3e0080e7          	jalr	992(ra) # 80001c5c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005884:	00000613          	li	a2,0
    80005888:	00000597          	auipc	a1,0x0
    8000588c:	e2058593          	addi	a1,a1,-480 # 800056a8 <_ZL11workerBodyBPv>
    80005890:	00007517          	auipc	a0,0x7
    80005894:	07050513          	addi	a0,a0,112 # 8000c900 <threads+0x8>
    80005898:	ffffc097          	auipc	ra,0xffffc
    8000589c:	c24080e7          	jalr	-988(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800058a0:	00005517          	auipc	a0,0x5
    800058a4:	ba050513          	addi	a0,a0,-1120 # 8000a440 <CONSOLE_STATUS+0x430>
    800058a8:	ffffc097          	auipc	ra,0xffffc
    800058ac:	3b4080e7          	jalr	948(ra) # 80001c5c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800058b0:	00000613          	li	a2,0
    800058b4:	00000597          	auipc	a1,0x0
    800058b8:	c7458593          	addi	a1,a1,-908 # 80005528 <_ZL11workerBodyCPv>
    800058bc:	00007517          	auipc	a0,0x7
    800058c0:	04c50513          	addi	a0,a0,76 # 8000c908 <threads+0x10>
    800058c4:	ffffc097          	auipc	ra,0xffffc
    800058c8:	bf8080e7          	jalr	-1032(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800058cc:	00005517          	auipc	a0,0x5
    800058d0:	b8c50513          	addi	a0,a0,-1140 # 8000a458 <CONSOLE_STATUS+0x448>
    800058d4:	ffffc097          	auipc	ra,0xffffc
    800058d8:	388080e7          	jalr	904(ra) # 80001c5c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800058dc:	00000613          	li	a2,0
    800058e0:	00000597          	auipc	a1,0x0
    800058e4:	b0058593          	addi	a1,a1,-1280 # 800053e0 <_ZL11workerBodyDPv>
    800058e8:	00007517          	auipc	a0,0x7
    800058ec:	02850513          	addi	a0,a0,40 # 8000c910 <threads+0x18>
    800058f0:	ffffc097          	auipc	ra,0xffffc
    800058f4:	bcc080e7          	jalr	-1076(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800058f8:	00005517          	auipc	a0,0x5
    800058fc:	b7850513          	addi	a0,a0,-1160 # 8000a470 <CONSOLE_STATUS+0x460>
    80005900:	ffffc097          	auipc	ra,0xffffc
    80005904:	35c080e7          	jalr	860(ra) # 80001c5c <_Z11printStringPKc>
    80005908:	00c0006f          	j	80005914 <_Z18Threads_C_API_testv+0xcc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000590c:	ffffc097          	auipc	ra,0xffffc
    80005910:	c14080e7          	jalr	-1004(ra) # 80001520 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005914:	00007797          	auipc	a5,0x7
    80005918:	fdf7c783          	lbu	a5,-33(a5) # 8000c8f3 <_ZL9finishedA>
    8000591c:	fe0788e3          	beqz	a5,8000590c <_Z18Threads_C_API_testv+0xc4>
    80005920:	00007797          	auipc	a5,0x7
    80005924:	fd27c783          	lbu	a5,-46(a5) # 8000c8f2 <_ZL9finishedB>
    80005928:	fe0782e3          	beqz	a5,8000590c <_Z18Threads_C_API_testv+0xc4>
    8000592c:	00007797          	auipc	a5,0x7
    80005930:	fc57c783          	lbu	a5,-59(a5) # 8000c8f1 <_ZL9finishedC>
    80005934:	fc078ce3          	beqz	a5,8000590c <_Z18Threads_C_API_testv+0xc4>
    80005938:	00007797          	auipc	a5,0x7
    8000593c:	fb87c783          	lbu	a5,-72(a5) # 8000c8f0 <_ZL9finishedD>
    80005940:	fc0786e3          	beqz	a5,8000590c <_Z18Threads_C_API_testv+0xc4>
    }

}
    80005944:	00813083          	ld	ra,8(sp)
    80005948:	00013403          	ld	s0,0(sp)
    8000594c:	01010113          	addi	sp,sp,16
    80005950:	00008067          	ret

0000000080005954 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005954:	fd010113          	addi	sp,sp,-48
    80005958:	02113423          	sd	ra,40(sp)
    8000595c:	02813023          	sd	s0,32(sp)
    80005960:	00913c23          	sd	s1,24(sp)
    80005964:	01213823          	sd	s2,16(sp)
    80005968:	01313423          	sd	s3,8(sp)
    8000596c:	03010413          	addi	s0,sp,48
    80005970:	00050993          	mv	s3,a0
    80005974:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005978:	00000913          	li	s2,0
    8000597c:	00c0006f          	j	80005988 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005980:	ffffd097          	auipc	ra,0xffffd
    80005984:	ec0080e7          	jalr	-320(ra) # 80002840 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005988:	ffffc097          	auipc	ra,0xffffc
    8000598c:	cfc080e7          	jalr	-772(ra) # 80001684 <_Z4getcv>
    80005990:	0005059b          	sext.w	a1,a0
    80005994:	01b00793          	li	a5,27
    80005998:	02f58a63          	beq	a1,a5,800059cc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    8000599c:	0084b503          	ld	a0,8(s1)
    800059a0:	00001097          	auipc	ra,0x1
    800059a4:	994080e7          	jalr	-1644(ra) # 80006334 <_ZN9BufferCPP3putEi>
        i++;
    800059a8:	0019071b          	addiw	a4,s2,1
    800059ac:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800059b0:	0004a683          	lw	a3,0(s1)
    800059b4:	0026979b          	slliw	a5,a3,0x2
    800059b8:	00d787bb          	addw	a5,a5,a3
    800059bc:	0017979b          	slliw	a5,a5,0x1
    800059c0:	02f767bb          	remw	a5,a4,a5
    800059c4:	fc0792e3          	bnez	a5,80005988 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800059c8:	fb9ff06f          	j	80005980 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800059cc:	00100793          	li	a5,1
    800059d0:	00007717          	auipc	a4,0x7
    800059d4:	f4f72423          	sw	a5,-184(a4) # 8000c918 <_ZL9threadEnd>
    td->buffer->put('!');
    800059d8:	0209b783          	ld	a5,32(s3)
    800059dc:	02100593          	li	a1,33
    800059e0:	0087b503          	ld	a0,8(a5)
    800059e4:	00001097          	auipc	ra,0x1
    800059e8:	950080e7          	jalr	-1712(ra) # 80006334 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800059ec:	0104b503          	ld	a0,16(s1)
    800059f0:	ffffd097          	auipc	ra,0xffffd
    800059f4:	f8c080e7          	jalr	-116(ra) # 8000297c <_ZN9Semaphore6signalEv>
}
    800059f8:	02813083          	ld	ra,40(sp)
    800059fc:	02013403          	ld	s0,32(sp)
    80005a00:	01813483          	ld	s1,24(sp)
    80005a04:	01013903          	ld	s2,16(sp)
    80005a08:	00813983          	ld	s3,8(sp)
    80005a0c:	03010113          	addi	sp,sp,48
    80005a10:	00008067          	ret

0000000080005a14 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005a14:	fe010113          	addi	sp,sp,-32
    80005a18:	00113c23          	sd	ra,24(sp)
    80005a1c:	00813823          	sd	s0,16(sp)
    80005a20:	00913423          	sd	s1,8(sp)
    80005a24:	01213023          	sd	s2,0(sp)
    80005a28:	02010413          	addi	s0,sp,32
    80005a2c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005a30:	00000913          	li	s2,0
    80005a34:	00c0006f          	j	80005a40 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005a38:	ffffd097          	auipc	ra,0xffffd
    80005a3c:	e08080e7          	jalr	-504(ra) # 80002840 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005a40:	00007797          	auipc	a5,0x7
    80005a44:	ed87a783          	lw	a5,-296(a5) # 8000c918 <_ZL9threadEnd>
    80005a48:	02079e63          	bnez	a5,80005a84 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005a4c:	0004a583          	lw	a1,0(s1)
    80005a50:	0305859b          	addiw	a1,a1,48
    80005a54:	0084b503          	ld	a0,8(s1)
    80005a58:	00001097          	auipc	ra,0x1
    80005a5c:	8dc080e7          	jalr	-1828(ra) # 80006334 <_ZN9BufferCPP3putEi>
        i++;
    80005a60:	0019071b          	addiw	a4,s2,1
    80005a64:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005a68:	0004a683          	lw	a3,0(s1)
    80005a6c:	0026979b          	slliw	a5,a3,0x2
    80005a70:	00d787bb          	addw	a5,a5,a3
    80005a74:	0017979b          	slliw	a5,a5,0x1
    80005a78:	02f767bb          	remw	a5,a4,a5
    80005a7c:	fc0792e3          	bnez	a5,80005a40 <_ZN12ProducerSync8producerEPv+0x2c>
    80005a80:	fb9ff06f          	j	80005a38 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005a84:	0104b503          	ld	a0,16(s1)
    80005a88:	ffffd097          	auipc	ra,0xffffd
    80005a8c:	ef4080e7          	jalr	-268(ra) # 8000297c <_ZN9Semaphore6signalEv>
}
    80005a90:	01813083          	ld	ra,24(sp)
    80005a94:	01013403          	ld	s0,16(sp)
    80005a98:	00813483          	ld	s1,8(sp)
    80005a9c:	00013903          	ld	s2,0(sp)
    80005aa0:	02010113          	addi	sp,sp,32
    80005aa4:	00008067          	ret

0000000080005aa8 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005aa8:	fd010113          	addi	sp,sp,-48
    80005aac:	02113423          	sd	ra,40(sp)
    80005ab0:	02813023          	sd	s0,32(sp)
    80005ab4:	00913c23          	sd	s1,24(sp)
    80005ab8:	01213823          	sd	s2,16(sp)
    80005abc:	01313423          	sd	s3,8(sp)
    80005ac0:	01413023          	sd	s4,0(sp)
    80005ac4:	03010413          	addi	s0,sp,48
    80005ac8:	00050993          	mv	s3,a0
    80005acc:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005ad0:	00000a13          	li	s4,0
    80005ad4:	01c0006f          	j	80005af0 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005ad8:	ffffd097          	auipc	ra,0xffffd
    80005adc:	d68080e7          	jalr	-664(ra) # 80002840 <_ZN6Thread8dispatchEv>
    80005ae0:	0500006f          	j	80005b30 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005ae4:	00a00513          	li	a0,10
    80005ae8:	ffffc097          	auipc	ra,0xffffc
    80005aec:	bc8080e7          	jalr	-1080(ra) # 800016b0 <_Z4putcc>
    while (!threadEnd) {
    80005af0:	00007797          	auipc	a5,0x7
    80005af4:	e287a783          	lw	a5,-472(a5) # 8000c918 <_ZL9threadEnd>
    80005af8:	06079263          	bnez	a5,80005b5c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005afc:	00893503          	ld	a0,8(s2)
    80005b00:	00001097          	auipc	ra,0x1
    80005b04:	8c4080e7          	jalr	-1852(ra) # 800063c4 <_ZN9BufferCPP3getEv>
        i++;
    80005b08:	001a049b          	addiw	s1,s4,1
    80005b0c:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005b10:	0ff57513          	andi	a0,a0,255
    80005b14:	ffffc097          	auipc	ra,0xffffc
    80005b18:	b9c080e7          	jalr	-1124(ra) # 800016b0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005b1c:	00092703          	lw	a4,0(s2)
    80005b20:	0027179b          	slliw	a5,a4,0x2
    80005b24:	00e787bb          	addw	a5,a5,a4
    80005b28:	02f4e7bb          	remw	a5,s1,a5
    80005b2c:	fa0786e3          	beqz	a5,80005ad8 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005b30:	05000793          	li	a5,80
    80005b34:	02f4e4bb          	remw	s1,s1,a5
    80005b38:	fa049ce3          	bnez	s1,80005af0 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005b3c:	fa9ff06f          	j	80005ae4 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005b40:	0209b783          	ld	a5,32(s3)
    80005b44:	0087b503          	ld	a0,8(a5)
    80005b48:	00001097          	auipc	ra,0x1
    80005b4c:	87c080e7          	jalr	-1924(ra) # 800063c4 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005b50:	0ff57513          	andi	a0,a0,255
    80005b54:	ffffd097          	auipc	ra,0xffffd
    80005b58:	e7c080e7          	jalr	-388(ra) # 800029d0 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005b5c:	0209b783          	ld	a5,32(s3)
    80005b60:	0087b503          	ld	a0,8(a5)
    80005b64:	00001097          	auipc	ra,0x1
    80005b68:	8ec080e7          	jalr	-1812(ra) # 80006450 <_ZN9BufferCPP6getCntEv>
    80005b6c:	fca04ae3          	bgtz	a0,80005b40 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005b70:	01093503          	ld	a0,16(s2)
    80005b74:	ffffd097          	auipc	ra,0xffffd
    80005b78:	e08080e7          	jalr	-504(ra) # 8000297c <_ZN9Semaphore6signalEv>
}
    80005b7c:	02813083          	ld	ra,40(sp)
    80005b80:	02013403          	ld	s0,32(sp)
    80005b84:	01813483          	ld	s1,24(sp)
    80005b88:	01013903          	ld	s2,16(sp)
    80005b8c:	00813983          	ld	s3,8(sp)
    80005b90:	00013a03          	ld	s4,0(sp)
    80005b94:	03010113          	addi	sp,sp,48
    80005b98:	00008067          	ret

0000000080005b9c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005b9c:	f8010113          	addi	sp,sp,-128
    80005ba0:	06113c23          	sd	ra,120(sp)
    80005ba4:	06813823          	sd	s0,112(sp)
    80005ba8:	06913423          	sd	s1,104(sp)
    80005bac:	07213023          	sd	s2,96(sp)
    80005bb0:	05313c23          	sd	s3,88(sp)
    80005bb4:	05413823          	sd	s4,80(sp)
    80005bb8:	05513423          	sd	s5,72(sp)
    80005bbc:	05613023          	sd	s6,64(sp)
    80005bc0:	03713c23          	sd	s7,56(sp)
    80005bc4:	03813823          	sd	s8,48(sp)
    80005bc8:	03913423          	sd	s9,40(sp)
    80005bcc:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005bd0:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005bd4:	00004517          	auipc	a0,0x4
    80005bd8:	6c450513          	addi	a0,a0,1732 # 8000a298 <CONSOLE_STATUS+0x288>
    80005bdc:	ffffc097          	auipc	ra,0xffffc
    80005be0:	080080e7          	jalr	128(ra) # 80001c5c <_Z11printStringPKc>
    getString(input, 30);
    80005be4:	01e00593          	li	a1,30
    80005be8:	f8040493          	addi	s1,s0,-128
    80005bec:	00048513          	mv	a0,s1
    80005bf0:	ffffc097          	auipc	ra,0xffffc
    80005bf4:	0f4080e7          	jalr	244(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005bf8:	00048513          	mv	a0,s1
    80005bfc:	ffffc097          	auipc	ra,0xffffc
    80005c00:	1c0080e7          	jalr	448(ra) # 80001dbc <_Z11stringToIntPKc>
    80005c04:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005c08:	00004517          	auipc	a0,0x4
    80005c0c:	6b050513          	addi	a0,a0,1712 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    80005c10:	ffffc097          	auipc	ra,0xffffc
    80005c14:	04c080e7          	jalr	76(ra) # 80001c5c <_Z11printStringPKc>
    getString(input, 30);
    80005c18:	01e00593          	li	a1,30
    80005c1c:	00048513          	mv	a0,s1
    80005c20:	ffffc097          	auipc	ra,0xffffc
    80005c24:	0c4080e7          	jalr	196(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80005c28:	00048513          	mv	a0,s1
    80005c2c:	ffffc097          	auipc	ra,0xffffc
    80005c30:	190080e7          	jalr	400(ra) # 80001dbc <_Z11stringToIntPKc>
    80005c34:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005c38:	00004517          	auipc	a0,0x4
    80005c3c:	6a050513          	addi	a0,a0,1696 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    80005c40:	ffffc097          	auipc	ra,0xffffc
    80005c44:	01c080e7          	jalr	28(ra) # 80001c5c <_Z11printStringPKc>
    80005c48:	00000613          	li	a2,0
    80005c4c:	00a00593          	li	a1,10
    80005c50:	00090513          	mv	a0,s2
    80005c54:	ffffc097          	auipc	ra,0xffffc
    80005c58:	1b8080e7          	jalr	440(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005c5c:	00004517          	auipc	a0,0x4
    80005c60:	69450513          	addi	a0,a0,1684 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80005c64:	ffffc097          	auipc	ra,0xffffc
    80005c68:	ff8080e7          	jalr	-8(ra) # 80001c5c <_Z11printStringPKc>
    80005c6c:	00000613          	li	a2,0
    80005c70:	00a00593          	li	a1,10
    80005c74:	00048513          	mv	a0,s1
    80005c78:	ffffc097          	auipc	ra,0xffffc
    80005c7c:	194080e7          	jalr	404(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80005c80:	00004517          	auipc	a0,0x4
    80005c84:	68850513          	addi	a0,a0,1672 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80005c88:	ffffc097          	auipc	ra,0xffffc
    80005c8c:	fd4080e7          	jalr	-44(ra) # 80001c5c <_Z11printStringPKc>
    if(threadNum > n) {
    80005c90:	0324c463          	blt	s1,s2,80005cb8 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005c94:	03205c63          	blez	s2,80005ccc <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005c98:	03800513          	li	a0,56
    80005c9c:	ffffd097          	auipc	ra,0xffffd
    80005ca0:	a5c080e7          	jalr	-1444(ra) # 800026f8 <_Znwm>
    80005ca4:	00050a93          	mv	s5,a0
    80005ca8:	00048593          	mv	a1,s1
    80005cac:	00000097          	auipc	ra,0x0
    80005cb0:	534080e7          	jalr	1332(ra) # 800061e0 <_ZN9BufferCPPC1Ei>
    80005cb4:	0300006f          	j	80005ce4 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005cb8:	00004517          	auipc	a0,0x4
    80005cbc:	65850513          	addi	a0,a0,1624 # 8000a310 <CONSOLE_STATUS+0x300>
    80005cc0:	ffffc097          	auipc	ra,0xffffc
    80005cc4:	f9c080e7          	jalr	-100(ra) # 80001c5c <_Z11printStringPKc>
        return;
    80005cc8:	0140006f          	j	80005cdc <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005ccc:	00004517          	auipc	a0,0x4
    80005cd0:	68450513          	addi	a0,a0,1668 # 8000a350 <CONSOLE_STATUS+0x340>
    80005cd4:	ffffc097          	auipc	ra,0xffffc
    80005cd8:	f88080e7          	jalr	-120(ra) # 80001c5c <_Z11printStringPKc>
        return;
    80005cdc:	000b8113          	mv	sp,s7
    80005ce0:	2380006f          	j	80005f18 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005ce4:	01000513          	li	a0,16
    80005ce8:	ffffd097          	auipc	ra,0xffffd
    80005cec:	a10080e7          	jalr	-1520(ra) # 800026f8 <_Znwm>
    80005cf0:	00050493          	mv	s1,a0
    80005cf4:	00000593          	li	a1,0
    80005cf8:	ffffd097          	auipc	ra,0xffffd
    80005cfc:	c20080e7          	jalr	-992(ra) # 80002918 <_ZN9SemaphoreC1Ej>
    80005d00:	00007797          	auipc	a5,0x7
    80005d04:	c297b023          	sd	s1,-992(a5) # 8000c920 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005d08:	00391793          	slli	a5,s2,0x3
    80005d0c:	00f78793          	addi	a5,a5,15
    80005d10:	ff07f793          	andi	a5,a5,-16
    80005d14:	40f10133          	sub	sp,sp,a5
    80005d18:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005d1c:	0019071b          	addiw	a4,s2,1
    80005d20:	00171793          	slli	a5,a4,0x1
    80005d24:	00e787b3          	add	a5,a5,a4
    80005d28:	00379793          	slli	a5,a5,0x3
    80005d2c:	00f78793          	addi	a5,a5,15
    80005d30:	ff07f793          	andi	a5,a5,-16
    80005d34:	40f10133          	sub	sp,sp,a5
    80005d38:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005d3c:	00191c13          	slli	s8,s2,0x1
    80005d40:	012c07b3          	add	a5,s8,s2
    80005d44:	00379793          	slli	a5,a5,0x3
    80005d48:	00fa07b3          	add	a5,s4,a5
    80005d4c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005d50:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005d54:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005d58:	02800513          	li	a0,40
    80005d5c:	ffffd097          	auipc	ra,0xffffd
    80005d60:	99c080e7          	jalr	-1636(ra) # 800026f8 <_Znwm>
    80005d64:	00050b13          	mv	s6,a0
    80005d68:	012c0c33          	add	s8,s8,s2
    80005d6c:	003c1c13          	slli	s8,s8,0x3
    80005d70:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005d74:	ffffd097          	auipc	ra,0xffffd
    80005d78:	af4080e7          	jalr	-1292(ra) # 80002868 <_ZN6ThreadC1Ev>
    80005d7c:	00007797          	auipc	a5,0x7
    80005d80:	a3c78793          	addi	a5,a5,-1476 # 8000c7b8 <_ZTV12ConsumerSync+0x10>
    80005d84:	00fb3023          	sd	a5,0(s6)
    80005d88:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005d8c:	000b0513          	mv	a0,s6
    80005d90:	ffffd097          	auipc	ra,0xffffd
    80005d94:	a4c080e7          	jalr	-1460(ra) # 800027dc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005d98:	00000493          	li	s1,0
    80005d9c:	0380006f          	j	80005dd4 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005da0:	00007797          	auipc	a5,0x7
    80005da4:	9f078793          	addi	a5,a5,-1552 # 8000c790 <_ZTV12ProducerSync+0x10>
    80005da8:	00fcb023          	sd	a5,0(s9)
    80005dac:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005db0:	00349793          	slli	a5,s1,0x3
    80005db4:	00f987b3          	add	a5,s3,a5
    80005db8:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005dbc:	00349793          	slli	a5,s1,0x3
    80005dc0:	00f987b3          	add	a5,s3,a5
    80005dc4:	0007b503          	ld	a0,0(a5)
    80005dc8:	ffffd097          	auipc	ra,0xffffd
    80005dcc:	a14080e7          	jalr	-1516(ra) # 800027dc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005dd0:	0014849b          	addiw	s1,s1,1
    80005dd4:	0b24d063          	bge	s1,s2,80005e74 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005dd8:	00149793          	slli	a5,s1,0x1
    80005ddc:	009787b3          	add	a5,a5,s1
    80005de0:	00379793          	slli	a5,a5,0x3
    80005de4:	00fa07b3          	add	a5,s4,a5
    80005de8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005dec:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005df0:	00007717          	auipc	a4,0x7
    80005df4:	b3073703          	ld	a4,-1232(a4) # 8000c920 <_ZL10waitForAll>
    80005df8:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005dfc:	02905863          	blez	s1,80005e2c <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005e00:	02800513          	li	a0,40
    80005e04:	ffffd097          	auipc	ra,0xffffd
    80005e08:	8f4080e7          	jalr	-1804(ra) # 800026f8 <_Znwm>
    80005e0c:	00050c93          	mv	s9,a0
    80005e10:	00149c13          	slli	s8,s1,0x1
    80005e14:	009c0c33          	add	s8,s8,s1
    80005e18:	003c1c13          	slli	s8,s8,0x3
    80005e1c:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005e20:	ffffd097          	auipc	ra,0xffffd
    80005e24:	a48080e7          	jalr	-1464(ra) # 80002868 <_ZN6ThreadC1Ev>
    80005e28:	f79ff06f          	j	80005da0 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005e2c:	02800513          	li	a0,40
    80005e30:	ffffd097          	auipc	ra,0xffffd
    80005e34:	8c8080e7          	jalr	-1848(ra) # 800026f8 <_Znwm>
    80005e38:	00050c93          	mv	s9,a0
    80005e3c:	00149c13          	slli	s8,s1,0x1
    80005e40:	009c0c33          	add	s8,s8,s1
    80005e44:	003c1c13          	slli	s8,s8,0x3
    80005e48:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005e4c:	ffffd097          	auipc	ra,0xffffd
    80005e50:	a1c080e7          	jalr	-1508(ra) # 80002868 <_ZN6ThreadC1Ev>
    80005e54:	00007797          	auipc	a5,0x7
    80005e58:	91478793          	addi	a5,a5,-1772 # 8000c768 <_ZTV16ProducerKeyboard+0x10>
    80005e5c:	00fcb023          	sd	a5,0(s9)
    80005e60:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005e64:	00349793          	slli	a5,s1,0x3
    80005e68:	00f987b3          	add	a5,s3,a5
    80005e6c:	0197b023          	sd	s9,0(a5)
    80005e70:	f4dff06f          	j	80005dbc <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005e74:	ffffd097          	auipc	ra,0xffffd
    80005e78:	9cc080e7          	jalr	-1588(ra) # 80002840 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005e7c:	00000493          	li	s1,0
    80005e80:	00994e63          	blt	s2,s1,80005e9c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005e84:	00007517          	auipc	a0,0x7
    80005e88:	a9c53503          	ld	a0,-1380(a0) # 8000c920 <_ZL10waitForAll>
    80005e8c:	ffffd097          	auipc	ra,0xffffd
    80005e90:	ac4080e7          	jalr	-1340(ra) # 80002950 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005e94:	0014849b          	addiw	s1,s1,1
    80005e98:	fe9ff06f          	j	80005e80 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005e9c:	00000493          	li	s1,0
    80005ea0:	0080006f          	j	80005ea8 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005ea4:	0014849b          	addiw	s1,s1,1
    80005ea8:	0324d263          	bge	s1,s2,80005ecc <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005eac:	00349793          	slli	a5,s1,0x3
    80005eb0:	00f987b3          	add	a5,s3,a5
    80005eb4:	0007b503          	ld	a0,0(a5)
    80005eb8:	fe0506e3          	beqz	a0,80005ea4 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005ebc:	00053783          	ld	a5,0(a0)
    80005ec0:	0087b783          	ld	a5,8(a5)
    80005ec4:	000780e7          	jalr	a5
    80005ec8:	fddff06f          	j	80005ea4 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005ecc:	000b0a63          	beqz	s6,80005ee0 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005ed0:	000b3783          	ld	a5,0(s6)
    80005ed4:	0087b783          	ld	a5,8(a5)
    80005ed8:	000b0513          	mv	a0,s6
    80005edc:	000780e7          	jalr	a5
    delete waitForAll;
    80005ee0:	00007517          	auipc	a0,0x7
    80005ee4:	a4053503          	ld	a0,-1472(a0) # 8000c920 <_ZL10waitForAll>
    80005ee8:	00050863          	beqz	a0,80005ef8 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005eec:	00053783          	ld	a5,0(a0)
    80005ef0:	0087b783          	ld	a5,8(a5)
    80005ef4:	000780e7          	jalr	a5
    delete buffer;
    80005ef8:	000a8e63          	beqz	s5,80005f14 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005efc:	000a8513          	mv	a0,s5
    80005f00:	00000097          	auipc	ra,0x0
    80005f04:	5d8080e7          	jalr	1496(ra) # 800064d8 <_ZN9BufferCPPD1Ev>
    80005f08:	000a8513          	mv	a0,s5
    80005f0c:	ffffd097          	auipc	ra,0xffffd
    80005f10:	814080e7          	jalr	-2028(ra) # 80002720 <_ZdlPv>
    80005f14:	000b8113          	mv	sp,s7

}
    80005f18:	f8040113          	addi	sp,s0,-128
    80005f1c:	07813083          	ld	ra,120(sp)
    80005f20:	07013403          	ld	s0,112(sp)
    80005f24:	06813483          	ld	s1,104(sp)
    80005f28:	06013903          	ld	s2,96(sp)
    80005f2c:	05813983          	ld	s3,88(sp)
    80005f30:	05013a03          	ld	s4,80(sp)
    80005f34:	04813a83          	ld	s5,72(sp)
    80005f38:	04013b03          	ld	s6,64(sp)
    80005f3c:	03813b83          	ld	s7,56(sp)
    80005f40:	03013c03          	ld	s8,48(sp)
    80005f44:	02813c83          	ld	s9,40(sp)
    80005f48:	08010113          	addi	sp,sp,128
    80005f4c:	00008067          	ret
    80005f50:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005f54:	000a8513          	mv	a0,s5
    80005f58:	ffffc097          	auipc	ra,0xffffc
    80005f5c:	7c8080e7          	jalr	1992(ra) # 80002720 <_ZdlPv>
    80005f60:	00048513          	mv	a0,s1
    80005f64:	00008097          	auipc	ra,0x8
    80005f68:	a94080e7          	jalr	-1388(ra) # 8000d9f8 <_Unwind_Resume>
    80005f6c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005f70:	00048513          	mv	a0,s1
    80005f74:	ffffc097          	auipc	ra,0xffffc
    80005f78:	7ac080e7          	jalr	1964(ra) # 80002720 <_ZdlPv>
    80005f7c:	00090513          	mv	a0,s2
    80005f80:	00008097          	auipc	ra,0x8
    80005f84:	a78080e7          	jalr	-1416(ra) # 8000d9f8 <_Unwind_Resume>
    80005f88:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005f8c:	000b0513          	mv	a0,s6
    80005f90:	ffffc097          	auipc	ra,0xffffc
    80005f94:	790080e7          	jalr	1936(ra) # 80002720 <_ZdlPv>
    80005f98:	00048513          	mv	a0,s1
    80005f9c:	00008097          	auipc	ra,0x8
    80005fa0:	a5c080e7          	jalr	-1444(ra) # 8000d9f8 <_Unwind_Resume>
    80005fa4:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005fa8:	000c8513          	mv	a0,s9
    80005fac:	ffffc097          	auipc	ra,0xffffc
    80005fb0:	774080e7          	jalr	1908(ra) # 80002720 <_ZdlPv>
    80005fb4:	00048513          	mv	a0,s1
    80005fb8:	00008097          	auipc	ra,0x8
    80005fbc:	a40080e7          	jalr	-1472(ra) # 8000d9f8 <_Unwind_Resume>
    80005fc0:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005fc4:	000c8513          	mv	a0,s9
    80005fc8:	ffffc097          	auipc	ra,0xffffc
    80005fcc:	758080e7          	jalr	1880(ra) # 80002720 <_ZdlPv>
    80005fd0:	00048513          	mv	a0,s1
    80005fd4:	00008097          	auipc	ra,0x8
    80005fd8:	a24080e7          	jalr	-1500(ra) # 8000d9f8 <_Unwind_Resume>

0000000080005fdc <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005fdc:	ff010113          	addi	sp,sp,-16
    80005fe0:	00113423          	sd	ra,8(sp)
    80005fe4:	00813023          	sd	s0,0(sp)
    80005fe8:	01010413          	addi	s0,sp,16
    80005fec:	00006797          	auipc	a5,0x6
    80005ff0:	7cc78793          	addi	a5,a5,1996 # 8000c7b8 <_ZTV12ConsumerSync+0x10>
    80005ff4:	00f53023          	sd	a5,0(a0)
    80005ff8:	ffffc097          	auipc	ra,0xffffc
    80005ffc:	6b0080e7          	jalr	1712(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80006000:	00813083          	ld	ra,8(sp)
    80006004:	00013403          	ld	s0,0(sp)
    80006008:	01010113          	addi	sp,sp,16
    8000600c:	00008067          	ret

0000000080006010 <_ZN12ConsumerSyncD0Ev>:
    80006010:	fe010113          	addi	sp,sp,-32
    80006014:	00113c23          	sd	ra,24(sp)
    80006018:	00813823          	sd	s0,16(sp)
    8000601c:	00913423          	sd	s1,8(sp)
    80006020:	02010413          	addi	s0,sp,32
    80006024:	00050493          	mv	s1,a0
    80006028:	00006797          	auipc	a5,0x6
    8000602c:	79078793          	addi	a5,a5,1936 # 8000c7b8 <_ZTV12ConsumerSync+0x10>
    80006030:	00f53023          	sd	a5,0(a0)
    80006034:	ffffc097          	auipc	ra,0xffffc
    80006038:	674080e7          	jalr	1652(ra) # 800026a8 <_ZN6ThreadD1Ev>
    8000603c:	00048513          	mv	a0,s1
    80006040:	ffffc097          	auipc	ra,0xffffc
    80006044:	6e0080e7          	jalr	1760(ra) # 80002720 <_ZdlPv>
    80006048:	01813083          	ld	ra,24(sp)
    8000604c:	01013403          	ld	s0,16(sp)
    80006050:	00813483          	ld	s1,8(sp)
    80006054:	02010113          	addi	sp,sp,32
    80006058:	00008067          	ret

000000008000605c <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    8000605c:	ff010113          	addi	sp,sp,-16
    80006060:	00113423          	sd	ra,8(sp)
    80006064:	00813023          	sd	s0,0(sp)
    80006068:	01010413          	addi	s0,sp,16
    8000606c:	00006797          	auipc	a5,0x6
    80006070:	72478793          	addi	a5,a5,1828 # 8000c790 <_ZTV12ProducerSync+0x10>
    80006074:	00f53023          	sd	a5,0(a0)
    80006078:	ffffc097          	auipc	ra,0xffffc
    8000607c:	630080e7          	jalr	1584(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80006080:	00813083          	ld	ra,8(sp)
    80006084:	00013403          	ld	s0,0(sp)
    80006088:	01010113          	addi	sp,sp,16
    8000608c:	00008067          	ret

0000000080006090 <_ZN12ProducerSyncD0Ev>:
    80006090:	fe010113          	addi	sp,sp,-32
    80006094:	00113c23          	sd	ra,24(sp)
    80006098:	00813823          	sd	s0,16(sp)
    8000609c:	00913423          	sd	s1,8(sp)
    800060a0:	02010413          	addi	s0,sp,32
    800060a4:	00050493          	mv	s1,a0
    800060a8:	00006797          	auipc	a5,0x6
    800060ac:	6e878793          	addi	a5,a5,1768 # 8000c790 <_ZTV12ProducerSync+0x10>
    800060b0:	00f53023          	sd	a5,0(a0)
    800060b4:	ffffc097          	auipc	ra,0xffffc
    800060b8:	5f4080e7          	jalr	1524(ra) # 800026a8 <_ZN6ThreadD1Ev>
    800060bc:	00048513          	mv	a0,s1
    800060c0:	ffffc097          	auipc	ra,0xffffc
    800060c4:	660080e7          	jalr	1632(ra) # 80002720 <_ZdlPv>
    800060c8:	01813083          	ld	ra,24(sp)
    800060cc:	01013403          	ld	s0,16(sp)
    800060d0:	00813483          	ld	s1,8(sp)
    800060d4:	02010113          	addi	sp,sp,32
    800060d8:	00008067          	ret

00000000800060dc <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800060dc:	ff010113          	addi	sp,sp,-16
    800060e0:	00113423          	sd	ra,8(sp)
    800060e4:	00813023          	sd	s0,0(sp)
    800060e8:	01010413          	addi	s0,sp,16
    800060ec:	00006797          	auipc	a5,0x6
    800060f0:	67c78793          	addi	a5,a5,1660 # 8000c768 <_ZTV16ProducerKeyboard+0x10>
    800060f4:	00f53023          	sd	a5,0(a0)
    800060f8:	ffffc097          	auipc	ra,0xffffc
    800060fc:	5b0080e7          	jalr	1456(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80006100:	00813083          	ld	ra,8(sp)
    80006104:	00013403          	ld	s0,0(sp)
    80006108:	01010113          	addi	sp,sp,16
    8000610c:	00008067          	ret

0000000080006110 <_ZN16ProducerKeyboardD0Ev>:
    80006110:	fe010113          	addi	sp,sp,-32
    80006114:	00113c23          	sd	ra,24(sp)
    80006118:	00813823          	sd	s0,16(sp)
    8000611c:	00913423          	sd	s1,8(sp)
    80006120:	02010413          	addi	s0,sp,32
    80006124:	00050493          	mv	s1,a0
    80006128:	00006797          	auipc	a5,0x6
    8000612c:	64078793          	addi	a5,a5,1600 # 8000c768 <_ZTV16ProducerKeyboard+0x10>
    80006130:	00f53023          	sd	a5,0(a0)
    80006134:	ffffc097          	auipc	ra,0xffffc
    80006138:	574080e7          	jalr	1396(ra) # 800026a8 <_ZN6ThreadD1Ev>
    8000613c:	00048513          	mv	a0,s1
    80006140:	ffffc097          	auipc	ra,0xffffc
    80006144:	5e0080e7          	jalr	1504(ra) # 80002720 <_ZdlPv>
    80006148:	01813083          	ld	ra,24(sp)
    8000614c:	01013403          	ld	s0,16(sp)
    80006150:	00813483          	ld	s1,8(sp)
    80006154:	02010113          	addi	sp,sp,32
    80006158:	00008067          	ret

000000008000615c <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    8000615c:	ff010113          	addi	sp,sp,-16
    80006160:	00113423          	sd	ra,8(sp)
    80006164:	00813023          	sd	s0,0(sp)
    80006168:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    8000616c:	02053583          	ld	a1,32(a0)
    80006170:	fffff097          	auipc	ra,0xfffff
    80006174:	7e4080e7          	jalr	2020(ra) # 80005954 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80006178:	00813083          	ld	ra,8(sp)
    8000617c:	00013403          	ld	s0,0(sp)
    80006180:	01010113          	addi	sp,sp,16
    80006184:	00008067          	ret

0000000080006188 <_ZN12ProducerSync3runEv>:
    void run() override {
    80006188:	ff010113          	addi	sp,sp,-16
    8000618c:	00113423          	sd	ra,8(sp)
    80006190:	00813023          	sd	s0,0(sp)
    80006194:	01010413          	addi	s0,sp,16
        producer(td);
    80006198:	02053583          	ld	a1,32(a0)
    8000619c:	00000097          	auipc	ra,0x0
    800061a0:	878080e7          	jalr	-1928(ra) # 80005a14 <_ZN12ProducerSync8producerEPv>
    }
    800061a4:	00813083          	ld	ra,8(sp)
    800061a8:	00013403          	ld	s0,0(sp)
    800061ac:	01010113          	addi	sp,sp,16
    800061b0:	00008067          	ret

00000000800061b4 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800061b4:	ff010113          	addi	sp,sp,-16
    800061b8:	00113423          	sd	ra,8(sp)
    800061bc:	00813023          	sd	s0,0(sp)
    800061c0:	01010413          	addi	s0,sp,16
        consumer(td);
    800061c4:	02053583          	ld	a1,32(a0)
    800061c8:	00000097          	auipc	ra,0x0
    800061cc:	8e0080e7          	jalr	-1824(ra) # 80005aa8 <_ZN12ConsumerSync8consumerEPv>
    }
    800061d0:	00813083          	ld	ra,8(sp)
    800061d4:	00013403          	ld	s0,0(sp)
    800061d8:	01010113          	addi	sp,sp,16
    800061dc:	00008067          	ret

00000000800061e0 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800061e0:	fd010113          	addi	sp,sp,-48
    800061e4:	02113423          	sd	ra,40(sp)
    800061e8:	02813023          	sd	s0,32(sp)
    800061ec:	00913c23          	sd	s1,24(sp)
    800061f0:	01213823          	sd	s2,16(sp)
    800061f4:	01313423          	sd	s3,8(sp)
    800061f8:	03010413          	addi	s0,sp,48
    800061fc:	00050493          	mv	s1,a0
    80006200:	00058913          	mv	s2,a1
    80006204:	0015879b          	addiw	a5,a1,1
    80006208:	0007851b          	sext.w	a0,a5
    8000620c:	00f4a023          	sw	a5,0(s1)
    80006210:	0004a823          	sw	zero,16(s1)
    80006214:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006218:	00251513          	slli	a0,a0,0x2
    8000621c:	ffffb097          	auipc	ra,0xffffb
    80006220:	234080e7          	jalr	564(ra) # 80001450 <_Z9mem_allocm>
    80006224:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006228:	01000513          	li	a0,16
    8000622c:	ffffc097          	auipc	ra,0xffffc
    80006230:	4cc080e7          	jalr	1228(ra) # 800026f8 <_Znwm>
    80006234:	00050993          	mv	s3,a0
    80006238:	00000593          	li	a1,0
    8000623c:	ffffc097          	auipc	ra,0xffffc
    80006240:	6dc080e7          	jalr	1756(ra) # 80002918 <_ZN9SemaphoreC1Ej>
    80006244:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006248:	01000513          	li	a0,16
    8000624c:	ffffc097          	auipc	ra,0xffffc
    80006250:	4ac080e7          	jalr	1196(ra) # 800026f8 <_Znwm>
    80006254:	00050993          	mv	s3,a0
    80006258:	00090593          	mv	a1,s2
    8000625c:	ffffc097          	auipc	ra,0xffffc
    80006260:	6bc080e7          	jalr	1724(ra) # 80002918 <_ZN9SemaphoreC1Ej>
    80006264:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006268:	01000513          	li	a0,16
    8000626c:	ffffc097          	auipc	ra,0xffffc
    80006270:	48c080e7          	jalr	1164(ra) # 800026f8 <_Znwm>
    80006274:	00050913          	mv	s2,a0
    80006278:	00100593          	li	a1,1
    8000627c:	ffffc097          	auipc	ra,0xffffc
    80006280:	69c080e7          	jalr	1692(ra) # 80002918 <_ZN9SemaphoreC1Ej>
    80006284:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006288:	01000513          	li	a0,16
    8000628c:	ffffc097          	auipc	ra,0xffffc
    80006290:	46c080e7          	jalr	1132(ra) # 800026f8 <_Znwm>
    80006294:	00050913          	mv	s2,a0
    80006298:	00100593          	li	a1,1
    8000629c:	ffffc097          	auipc	ra,0xffffc
    800062a0:	67c080e7          	jalr	1660(ra) # 80002918 <_ZN9SemaphoreC1Ej>
    800062a4:	0324b823          	sd	s2,48(s1)
}
    800062a8:	02813083          	ld	ra,40(sp)
    800062ac:	02013403          	ld	s0,32(sp)
    800062b0:	01813483          	ld	s1,24(sp)
    800062b4:	01013903          	ld	s2,16(sp)
    800062b8:	00813983          	ld	s3,8(sp)
    800062bc:	03010113          	addi	sp,sp,48
    800062c0:	00008067          	ret
    800062c4:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800062c8:	00098513          	mv	a0,s3
    800062cc:	ffffc097          	auipc	ra,0xffffc
    800062d0:	454080e7          	jalr	1108(ra) # 80002720 <_ZdlPv>
    800062d4:	00048513          	mv	a0,s1
    800062d8:	00007097          	auipc	ra,0x7
    800062dc:	720080e7          	jalr	1824(ra) # 8000d9f8 <_Unwind_Resume>
    800062e0:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800062e4:	00098513          	mv	a0,s3
    800062e8:	ffffc097          	auipc	ra,0xffffc
    800062ec:	438080e7          	jalr	1080(ra) # 80002720 <_ZdlPv>
    800062f0:	00048513          	mv	a0,s1
    800062f4:	00007097          	auipc	ra,0x7
    800062f8:	704080e7          	jalr	1796(ra) # 8000d9f8 <_Unwind_Resume>
    800062fc:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006300:	00090513          	mv	a0,s2
    80006304:	ffffc097          	auipc	ra,0xffffc
    80006308:	41c080e7          	jalr	1052(ra) # 80002720 <_ZdlPv>
    8000630c:	00048513          	mv	a0,s1
    80006310:	00007097          	auipc	ra,0x7
    80006314:	6e8080e7          	jalr	1768(ra) # 8000d9f8 <_Unwind_Resume>
    80006318:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000631c:	00090513          	mv	a0,s2
    80006320:	ffffc097          	auipc	ra,0xffffc
    80006324:	400080e7          	jalr	1024(ra) # 80002720 <_ZdlPv>
    80006328:	00048513          	mv	a0,s1
    8000632c:	00007097          	auipc	ra,0x7
    80006330:	6cc080e7          	jalr	1740(ra) # 8000d9f8 <_Unwind_Resume>

0000000080006334 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006334:	fe010113          	addi	sp,sp,-32
    80006338:	00113c23          	sd	ra,24(sp)
    8000633c:	00813823          	sd	s0,16(sp)
    80006340:	00913423          	sd	s1,8(sp)
    80006344:	01213023          	sd	s2,0(sp)
    80006348:	02010413          	addi	s0,sp,32
    8000634c:	00050493          	mv	s1,a0
    80006350:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006354:	01853503          	ld	a0,24(a0)
    80006358:	ffffc097          	auipc	ra,0xffffc
    8000635c:	5f8080e7          	jalr	1528(ra) # 80002950 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006360:	0304b503          	ld	a0,48(s1)
    80006364:	ffffc097          	auipc	ra,0xffffc
    80006368:	5ec080e7          	jalr	1516(ra) # 80002950 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    8000636c:	0084b783          	ld	a5,8(s1)
    80006370:	0144a703          	lw	a4,20(s1)
    80006374:	00271713          	slli	a4,a4,0x2
    80006378:	00e787b3          	add	a5,a5,a4
    8000637c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006380:	0144a783          	lw	a5,20(s1)
    80006384:	0017879b          	addiw	a5,a5,1
    80006388:	0004a703          	lw	a4,0(s1)
    8000638c:	02e7e7bb          	remw	a5,a5,a4
    80006390:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006394:	0304b503          	ld	a0,48(s1)
    80006398:	ffffc097          	auipc	ra,0xffffc
    8000639c:	5e4080e7          	jalr	1508(ra) # 8000297c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800063a0:	0204b503          	ld	a0,32(s1)
    800063a4:	ffffc097          	auipc	ra,0xffffc
    800063a8:	5d8080e7          	jalr	1496(ra) # 8000297c <_ZN9Semaphore6signalEv>

}
    800063ac:	01813083          	ld	ra,24(sp)
    800063b0:	01013403          	ld	s0,16(sp)
    800063b4:	00813483          	ld	s1,8(sp)
    800063b8:	00013903          	ld	s2,0(sp)
    800063bc:	02010113          	addi	sp,sp,32
    800063c0:	00008067          	ret

00000000800063c4 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800063c4:	fe010113          	addi	sp,sp,-32
    800063c8:	00113c23          	sd	ra,24(sp)
    800063cc:	00813823          	sd	s0,16(sp)
    800063d0:	00913423          	sd	s1,8(sp)
    800063d4:	01213023          	sd	s2,0(sp)
    800063d8:	02010413          	addi	s0,sp,32
    800063dc:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800063e0:	02053503          	ld	a0,32(a0)
    800063e4:	ffffc097          	auipc	ra,0xffffc
    800063e8:	56c080e7          	jalr	1388(ra) # 80002950 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800063ec:	0284b503          	ld	a0,40(s1)
    800063f0:	ffffc097          	auipc	ra,0xffffc
    800063f4:	560080e7          	jalr	1376(ra) # 80002950 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800063f8:	0084b703          	ld	a4,8(s1)
    800063fc:	0104a783          	lw	a5,16(s1)
    80006400:	00279693          	slli	a3,a5,0x2
    80006404:	00d70733          	add	a4,a4,a3
    80006408:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000640c:	0017879b          	addiw	a5,a5,1
    80006410:	0004a703          	lw	a4,0(s1)
    80006414:	02e7e7bb          	remw	a5,a5,a4
    80006418:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000641c:	0284b503          	ld	a0,40(s1)
    80006420:	ffffc097          	auipc	ra,0xffffc
    80006424:	55c080e7          	jalr	1372(ra) # 8000297c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006428:	0184b503          	ld	a0,24(s1)
    8000642c:	ffffc097          	auipc	ra,0xffffc
    80006430:	550080e7          	jalr	1360(ra) # 8000297c <_ZN9Semaphore6signalEv>

    return ret;
}
    80006434:	00090513          	mv	a0,s2
    80006438:	01813083          	ld	ra,24(sp)
    8000643c:	01013403          	ld	s0,16(sp)
    80006440:	00813483          	ld	s1,8(sp)
    80006444:	00013903          	ld	s2,0(sp)
    80006448:	02010113          	addi	sp,sp,32
    8000644c:	00008067          	ret

0000000080006450 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006450:	fe010113          	addi	sp,sp,-32
    80006454:	00113c23          	sd	ra,24(sp)
    80006458:	00813823          	sd	s0,16(sp)
    8000645c:	00913423          	sd	s1,8(sp)
    80006460:	01213023          	sd	s2,0(sp)
    80006464:	02010413          	addi	s0,sp,32
    80006468:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    8000646c:	02853503          	ld	a0,40(a0)
    80006470:	ffffc097          	auipc	ra,0xffffc
    80006474:	4e0080e7          	jalr	1248(ra) # 80002950 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006478:	0304b503          	ld	a0,48(s1)
    8000647c:	ffffc097          	auipc	ra,0xffffc
    80006480:	4d4080e7          	jalr	1236(ra) # 80002950 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006484:	0144a783          	lw	a5,20(s1)
    80006488:	0104a903          	lw	s2,16(s1)
    8000648c:	0327ce63          	blt	a5,s2,800064c8 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006490:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006494:	0304b503          	ld	a0,48(s1)
    80006498:	ffffc097          	auipc	ra,0xffffc
    8000649c:	4e4080e7          	jalr	1252(ra) # 8000297c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800064a0:	0284b503          	ld	a0,40(s1)
    800064a4:	ffffc097          	auipc	ra,0xffffc
    800064a8:	4d8080e7          	jalr	1240(ra) # 8000297c <_ZN9Semaphore6signalEv>

    return ret;
}
    800064ac:	00090513          	mv	a0,s2
    800064b0:	01813083          	ld	ra,24(sp)
    800064b4:	01013403          	ld	s0,16(sp)
    800064b8:	00813483          	ld	s1,8(sp)
    800064bc:	00013903          	ld	s2,0(sp)
    800064c0:	02010113          	addi	sp,sp,32
    800064c4:	00008067          	ret
        ret = cap - head + tail;
    800064c8:	0004a703          	lw	a4,0(s1)
    800064cc:	4127093b          	subw	s2,a4,s2
    800064d0:	00f9093b          	addw	s2,s2,a5
    800064d4:	fc1ff06f          	j	80006494 <_ZN9BufferCPP6getCntEv+0x44>

00000000800064d8 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800064d8:	fe010113          	addi	sp,sp,-32
    800064dc:	00113c23          	sd	ra,24(sp)
    800064e0:	00813823          	sd	s0,16(sp)
    800064e4:	00913423          	sd	s1,8(sp)
    800064e8:	02010413          	addi	s0,sp,32
    800064ec:	00050493          	mv	s1,a0
    Console::putc('\n');
    800064f0:	00a00513          	li	a0,10
    800064f4:	ffffc097          	auipc	ra,0xffffc
    800064f8:	4dc080e7          	jalr	1244(ra) # 800029d0 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800064fc:	00004517          	auipc	a0,0x4
    80006500:	f8c50513          	addi	a0,a0,-116 # 8000a488 <CONSOLE_STATUS+0x478>
    80006504:	ffffb097          	auipc	ra,0xffffb
    80006508:	758080e7          	jalr	1880(ra) # 80001c5c <_Z11printStringPKc>
    while (getCnt()) {
    8000650c:	00048513          	mv	a0,s1
    80006510:	00000097          	auipc	ra,0x0
    80006514:	f40080e7          	jalr	-192(ra) # 80006450 <_ZN9BufferCPP6getCntEv>
    80006518:	02050c63          	beqz	a0,80006550 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000651c:	0084b783          	ld	a5,8(s1)
    80006520:	0104a703          	lw	a4,16(s1)
    80006524:	00271713          	slli	a4,a4,0x2
    80006528:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    8000652c:	0007c503          	lbu	a0,0(a5)
    80006530:	ffffc097          	auipc	ra,0xffffc
    80006534:	4a0080e7          	jalr	1184(ra) # 800029d0 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006538:	0104a783          	lw	a5,16(s1)
    8000653c:	0017879b          	addiw	a5,a5,1
    80006540:	0004a703          	lw	a4,0(s1)
    80006544:	02e7e7bb          	remw	a5,a5,a4
    80006548:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    8000654c:	fc1ff06f          	j	8000650c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006550:	02100513          	li	a0,33
    80006554:	ffffc097          	auipc	ra,0xffffc
    80006558:	47c080e7          	jalr	1148(ra) # 800029d0 <_ZN7Console4putcEc>
    Console::putc('\n');
    8000655c:	00a00513          	li	a0,10
    80006560:	ffffc097          	auipc	ra,0xffffc
    80006564:	470080e7          	jalr	1136(ra) # 800029d0 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006568:	0084b503          	ld	a0,8(s1)
    8000656c:	ffffb097          	auipc	ra,0xffffb
    80006570:	f20080e7          	jalr	-224(ra) # 8000148c <_Z8mem_freePv>
    delete itemAvailable;
    80006574:	0204b503          	ld	a0,32(s1)
    80006578:	00050863          	beqz	a0,80006588 <_ZN9BufferCPPD1Ev+0xb0>
    8000657c:	00053783          	ld	a5,0(a0)
    80006580:	0087b783          	ld	a5,8(a5)
    80006584:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006588:	0184b503          	ld	a0,24(s1)
    8000658c:	00050863          	beqz	a0,8000659c <_ZN9BufferCPPD1Ev+0xc4>
    80006590:	00053783          	ld	a5,0(a0)
    80006594:	0087b783          	ld	a5,8(a5)
    80006598:	000780e7          	jalr	a5
    delete mutexTail;
    8000659c:	0304b503          	ld	a0,48(s1)
    800065a0:	00050863          	beqz	a0,800065b0 <_ZN9BufferCPPD1Ev+0xd8>
    800065a4:	00053783          	ld	a5,0(a0)
    800065a8:	0087b783          	ld	a5,8(a5)
    800065ac:	000780e7          	jalr	a5
    delete mutexHead;
    800065b0:	0284b503          	ld	a0,40(s1)
    800065b4:	00050863          	beqz	a0,800065c4 <_ZN9BufferCPPD1Ev+0xec>
    800065b8:	00053783          	ld	a5,0(a0)
    800065bc:	0087b783          	ld	a5,8(a5)
    800065c0:	000780e7          	jalr	a5
}
    800065c4:	01813083          	ld	ra,24(sp)
    800065c8:	01013403          	ld	s0,16(sp)
    800065cc:	00813483          	ld	s1,8(sp)
    800065d0:	02010113          	addi	sp,sp,32
    800065d4:	00008067          	ret

00000000800065d8 <_ZL9sleepyRunPv>:

#include "../h/printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800065d8:	fe010113          	addi	sp,sp,-32
    800065dc:	00113c23          	sd	ra,24(sp)
    800065e0:	00813823          	sd	s0,16(sp)
    800065e4:	00913423          	sd	s1,8(sp)
    800065e8:	01213023          	sd	s2,0(sp)
    800065ec:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800065f0:	00053903          	ld	s2,0(a0)
    int i = 6;
    800065f4:	00600493          	li	s1,6
    while (--i > 0) {
    800065f8:	fff4849b          	addiw	s1,s1,-1
    800065fc:	04905463          	blez	s1,80006644 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006600:	00004517          	auipc	a0,0x4
    80006604:	ea050513          	addi	a0,a0,-352 # 8000a4a0 <CONSOLE_STATUS+0x490>
    80006608:	ffffb097          	auipc	ra,0xffffb
    8000660c:	654080e7          	jalr	1620(ra) # 80001c5c <_Z11printStringPKc>
        printInt(sleep_time);
    80006610:	00000613          	li	a2,0
    80006614:	00a00593          	li	a1,10
    80006618:	0009051b          	sext.w	a0,s2
    8000661c:	ffffb097          	auipc	ra,0xffffb
    80006620:	7f0080e7          	jalr	2032(ra) # 80001e0c <_Z8printIntiii>
        printString(" !\n");
    80006624:	00004517          	auipc	a0,0x4
    80006628:	e8450513          	addi	a0,a0,-380 # 8000a4a8 <CONSOLE_STATUS+0x498>
    8000662c:	ffffb097          	auipc	ra,0xffffb
    80006630:	630080e7          	jalr	1584(ra) # 80001c5c <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006634:	00090513          	mv	a0,s2
    80006638:	ffffb097          	auipc	ra,0xffffb
    8000663c:	ff8080e7          	jalr	-8(ra) # 80001630 <_Z10time_sleepm>
    while (--i > 0) {
    80006640:	fb9ff06f          	j	800065f8 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006644:	00a00793          	li	a5,10
    80006648:	02f95933          	divu	s2,s2,a5
    8000664c:	fff90913          	addi	s2,s2,-1
    80006650:	00006797          	auipc	a5,0x6
    80006654:	2d878793          	addi	a5,a5,728 # 8000c928 <_ZL8finished>
    80006658:	01278933          	add	s2,a5,s2
    8000665c:	00100793          	li	a5,1
    80006660:	00f90023          	sb	a5,0(s2)
}
    80006664:	01813083          	ld	ra,24(sp)
    80006668:	01013403          	ld	s0,16(sp)
    8000666c:	00813483          	ld	s1,8(sp)
    80006670:	00013903          	ld	s2,0(sp)
    80006674:	02010113          	addi	sp,sp,32
    80006678:	00008067          	ret

000000008000667c <_Z12testSleepingv>:

void testSleeping() {
    8000667c:	fc010113          	addi	sp,sp,-64
    80006680:	02113c23          	sd	ra,56(sp)
    80006684:	02813823          	sd	s0,48(sp)
    80006688:	02913423          	sd	s1,40(sp)
    8000668c:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006690:	00a00793          	li	a5,10
    80006694:	fcf43823          	sd	a5,-48(s0)
    80006698:	01400793          	li	a5,20
    8000669c:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800066a0:	00000493          	li	s1,0
    800066a4:	02c0006f          	j	800066d0 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800066a8:	00349793          	slli	a5,s1,0x3
    800066ac:	fd040613          	addi	a2,s0,-48
    800066b0:	00f60633          	add	a2,a2,a5
    800066b4:	00000597          	auipc	a1,0x0
    800066b8:	f2458593          	addi	a1,a1,-220 # 800065d8 <_ZL9sleepyRunPv>
    800066bc:	fc040513          	addi	a0,s0,-64
    800066c0:	00f50533          	add	a0,a0,a5
    800066c4:	ffffb097          	auipc	ra,0xffffb
    800066c8:	df8080e7          	jalr	-520(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800066cc:	0014849b          	addiw	s1,s1,1
    800066d0:	00100793          	li	a5,1
    800066d4:	fc97dae3          	bge	a5,s1,800066a8 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800066d8:	00006797          	auipc	a5,0x6
    800066dc:	2507c783          	lbu	a5,592(a5) # 8000c928 <_ZL8finished>
    800066e0:	fe078ce3          	beqz	a5,800066d8 <_Z12testSleepingv+0x5c>
    800066e4:	00006797          	auipc	a5,0x6
    800066e8:	2457c783          	lbu	a5,581(a5) # 8000c929 <_ZL8finished+0x1>
    800066ec:	fe0786e3          	beqz	a5,800066d8 <_Z12testSleepingv+0x5c>
    return;
}
    800066f0:	03813083          	ld	ra,56(sp)
    800066f4:	03013403          	ld	s0,48(sp)
    800066f8:	02813483          	ld	s1,40(sp)
    800066fc:	04010113          	addi	sp,sp,64
    80006700:	00008067          	ret

0000000080006704 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006704:	fe010113          	addi	sp,sp,-32
    80006708:	00113c23          	sd	ra,24(sp)
    8000670c:	00813823          	sd	s0,16(sp)
    80006710:	00913423          	sd	s1,8(sp)
    80006714:	01213023          	sd	s2,0(sp)
    80006718:	02010413          	addi	s0,sp,32
    8000671c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006720:	00100793          	li	a5,1
    80006724:	02a7f863          	bgeu	a5,a0,80006754 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006728:	00a00793          	li	a5,10
    8000672c:	02f577b3          	remu	a5,a0,a5
    80006730:	02078e63          	beqz	a5,8000676c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006734:	fff48513          	addi	a0,s1,-1
    80006738:	00000097          	auipc	ra,0x0
    8000673c:	fcc080e7          	jalr	-52(ra) # 80006704 <_ZL9fibonaccim>
    80006740:	00050913          	mv	s2,a0
    80006744:	ffe48513          	addi	a0,s1,-2
    80006748:	00000097          	auipc	ra,0x0
    8000674c:	fbc080e7          	jalr	-68(ra) # 80006704 <_ZL9fibonaccim>
    80006750:	00a90533          	add	a0,s2,a0
}
    80006754:	01813083          	ld	ra,24(sp)
    80006758:	01013403          	ld	s0,16(sp)
    8000675c:	00813483          	ld	s1,8(sp)
    80006760:	00013903          	ld	s2,0(sp)
    80006764:	02010113          	addi	sp,sp,32
    80006768:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000676c:	ffffb097          	auipc	ra,0xffffb
    80006770:	db4080e7          	jalr	-588(ra) # 80001520 <_Z15thread_dispatchv>
    80006774:	fc1ff06f          	j	80006734 <_ZL9fibonaccim+0x30>

0000000080006778 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006778:	fe010113          	addi	sp,sp,-32
    8000677c:	00113c23          	sd	ra,24(sp)
    80006780:	00813823          	sd	s0,16(sp)
    80006784:	00913423          	sd	s1,8(sp)
    80006788:	01213023          	sd	s2,0(sp)
    8000678c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006790:	00a00493          	li	s1,10
    80006794:	0400006f          	j	800067d4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006798:	00004517          	auipc	a0,0x4
    8000679c:	c5850513          	addi	a0,a0,-936 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    800067a0:	ffffb097          	auipc	ra,0xffffb
    800067a4:	4bc080e7          	jalr	1212(ra) # 80001c5c <_Z11printStringPKc>
    800067a8:	00000613          	li	a2,0
    800067ac:	00a00593          	li	a1,10
    800067b0:	00048513          	mv	a0,s1
    800067b4:	ffffb097          	auipc	ra,0xffffb
    800067b8:	658080e7          	jalr	1624(ra) # 80001e0c <_Z8printIntiii>
    800067bc:	00004517          	auipc	a0,0x4
    800067c0:	9a450513          	addi	a0,a0,-1628 # 8000a160 <CONSOLE_STATUS+0x150>
    800067c4:	ffffb097          	auipc	ra,0xffffb
    800067c8:	498080e7          	jalr	1176(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800067cc:	0014849b          	addiw	s1,s1,1
    800067d0:	0ff4f493          	andi	s1,s1,255
    800067d4:	00c00793          	li	a5,12
    800067d8:	fc97f0e3          	bgeu	a5,s1,80006798 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800067dc:	00004517          	auipc	a0,0x4
    800067e0:	c1c50513          	addi	a0,a0,-996 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    800067e4:	ffffb097          	auipc	ra,0xffffb
    800067e8:	478080e7          	jalr	1144(ra) # 80001c5c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800067ec:	00500313          	li	t1,5
    thread_dispatch();
    800067f0:	ffffb097          	auipc	ra,0xffffb
    800067f4:	d30080e7          	jalr	-720(ra) # 80001520 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800067f8:	01000513          	li	a0,16
    800067fc:	00000097          	auipc	ra,0x0
    80006800:	f08080e7          	jalr	-248(ra) # 80006704 <_ZL9fibonaccim>
    80006804:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006808:	00004517          	auipc	a0,0x4
    8000680c:	c0050513          	addi	a0,a0,-1024 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80006810:	ffffb097          	auipc	ra,0xffffb
    80006814:	44c080e7          	jalr	1100(ra) # 80001c5c <_Z11printStringPKc>
    80006818:	00000613          	li	a2,0
    8000681c:	00a00593          	li	a1,10
    80006820:	0009051b          	sext.w	a0,s2
    80006824:	ffffb097          	auipc	ra,0xffffb
    80006828:	5e8080e7          	jalr	1512(ra) # 80001e0c <_Z8printIntiii>
    8000682c:	00004517          	auipc	a0,0x4
    80006830:	93450513          	addi	a0,a0,-1740 # 8000a160 <CONSOLE_STATUS+0x150>
    80006834:	ffffb097          	auipc	ra,0xffffb
    80006838:	428080e7          	jalr	1064(ra) # 80001c5c <_Z11printStringPKc>
    8000683c:	0400006f          	j	8000687c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006840:	00004517          	auipc	a0,0x4
    80006844:	bb050513          	addi	a0,a0,-1104 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80006848:	ffffb097          	auipc	ra,0xffffb
    8000684c:	414080e7          	jalr	1044(ra) # 80001c5c <_Z11printStringPKc>
    80006850:	00000613          	li	a2,0
    80006854:	00a00593          	li	a1,10
    80006858:	00048513          	mv	a0,s1
    8000685c:	ffffb097          	auipc	ra,0xffffb
    80006860:	5b0080e7          	jalr	1456(ra) # 80001e0c <_Z8printIntiii>
    80006864:	00004517          	auipc	a0,0x4
    80006868:	8fc50513          	addi	a0,a0,-1796 # 8000a160 <CONSOLE_STATUS+0x150>
    8000686c:	ffffb097          	auipc	ra,0xffffb
    80006870:	3f0080e7          	jalr	1008(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006874:	0014849b          	addiw	s1,s1,1
    80006878:	0ff4f493          	andi	s1,s1,255
    8000687c:	00f00793          	li	a5,15
    80006880:	fc97f0e3          	bgeu	a5,s1,80006840 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006884:	00004517          	auipc	a0,0x4
    80006888:	b9450513          	addi	a0,a0,-1132 # 8000a418 <CONSOLE_STATUS+0x408>
    8000688c:	ffffb097          	auipc	ra,0xffffb
    80006890:	3d0080e7          	jalr	976(ra) # 80001c5c <_Z11printStringPKc>
    finishedD = true;
    80006894:	00100793          	li	a5,1
    80006898:	00006717          	auipc	a4,0x6
    8000689c:	08f70923          	sb	a5,146(a4) # 8000c92a <_ZL9finishedD>
    thread_dispatch();
    800068a0:	ffffb097          	auipc	ra,0xffffb
    800068a4:	c80080e7          	jalr	-896(ra) # 80001520 <_Z15thread_dispatchv>
}
    800068a8:	01813083          	ld	ra,24(sp)
    800068ac:	01013403          	ld	s0,16(sp)
    800068b0:	00813483          	ld	s1,8(sp)
    800068b4:	00013903          	ld	s2,0(sp)
    800068b8:	02010113          	addi	sp,sp,32
    800068bc:	00008067          	ret

00000000800068c0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800068c0:	fe010113          	addi	sp,sp,-32
    800068c4:	00113c23          	sd	ra,24(sp)
    800068c8:	00813823          	sd	s0,16(sp)
    800068cc:	00913423          	sd	s1,8(sp)
    800068d0:	01213023          	sd	s2,0(sp)
    800068d4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800068d8:	00000493          	li	s1,0
    800068dc:	0400006f          	j	8000691c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800068e0:	00004517          	auipc	a0,0x4
    800068e4:	ad050513          	addi	a0,a0,-1328 # 8000a3b0 <CONSOLE_STATUS+0x3a0>
    800068e8:	ffffb097          	auipc	ra,0xffffb
    800068ec:	374080e7          	jalr	884(ra) # 80001c5c <_Z11printStringPKc>
    800068f0:	00000613          	li	a2,0
    800068f4:	00a00593          	li	a1,10
    800068f8:	00048513          	mv	a0,s1
    800068fc:	ffffb097          	auipc	ra,0xffffb
    80006900:	510080e7          	jalr	1296(ra) # 80001e0c <_Z8printIntiii>
    80006904:	00004517          	auipc	a0,0x4
    80006908:	85c50513          	addi	a0,a0,-1956 # 8000a160 <CONSOLE_STATUS+0x150>
    8000690c:	ffffb097          	auipc	ra,0xffffb
    80006910:	350080e7          	jalr	848(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006914:	0014849b          	addiw	s1,s1,1
    80006918:	0ff4f493          	andi	s1,s1,255
    8000691c:	00200793          	li	a5,2
    80006920:	fc97f0e3          	bgeu	a5,s1,800068e0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006924:	00004517          	auipc	a0,0x4
    80006928:	a9450513          	addi	a0,a0,-1388 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    8000692c:	ffffb097          	auipc	ra,0xffffb
    80006930:	330080e7          	jalr	816(ra) # 80001c5c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006934:	00700313          	li	t1,7
    thread_dispatch();
    80006938:	ffffb097          	auipc	ra,0xffffb
    8000693c:	be8080e7          	jalr	-1048(ra) # 80001520 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006940:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006944:	00004517          	auipc	a0,0x4
    80006948:	a8450513          	addi	a0,a0,-1404 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    8000694c:	ffffb097          	auipc	ra,0xffffb
    80006950:	310080e7          	jalr	784(ra) # 80001c5c <_Z11printStringPKc>
    80006954:	00000613          	li	a2,0
    80006958:	00a00593          	li	a1,10
    8000695c:	0009051b          	sext.w	a0,s2
    80006960:	ffffb097          	auipc	ra,0xffffb
    80006964:	4ac080e7          	jalr	1196(ra) # 80001e0c <_Z8printIntiii>
    80006968:	00003517          	auipc	a0,0x3
    8000696c:	7f850513          	addi	a0,a0,2040 # 8000a160 <CONSOLE_STATUS+0x150>
    80006970:	ffffb097          	auipc	ra,0xffffb
    80006974:	2ec080e7          	jalr	748(ra) # 80001c5c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006978:	00c00513          	li	a0,12
    8000697c:	00000097          	auipc	ra,0x0
    80006980:	d88080e7          	jalr	-632(ra) # 80006704 <_ZL9fibonaccim>
    80006984:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006988:	00004517          	auipc	a0,0x4
    8000698c:	a4850513          	addi	a0,a0,-1464 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80006990:	ffffb097          	auipc	ra,0xffffb
    80006994:	2cc080e7          	jalr	716(ra) # 80001c5c <_Z11printStringPKc>
    80006998:	00000613          	li	a2,0
    8000699c:	00a00593          	li	a1,10
    800069a0:	0009051b          	sext.w	a0,s2
    800069a4:	ffffb097          	auipc	ra,0xffffb
    800069a8:	468080e7          	jalr	1128(ra) # 80001e0c <_Z8printIntiii>
    800069ac:	00003517          	auipc	a0,0x3
    800069b0:	7b450513          	addi	a0,a0,1972 # 8000a160 <CONSOLE_STATUS+0x150>
    800069b4:	ffffb097          	auipc	ra,0xffffb
    800069b8:	2a8080e7          	jalr	680(ra) # 80001c5c <_Z11printStringPKc>
    800069bc:	0400006f          	j	800069fc <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800069c0:	00004517          	auipc	a0,0x4
    800069c4:	9f050513          	addi	a0,a0,-1552 # 8000a3b0 <CONSOLE_STATUS+0x3a0>
    800069c8:	ffffb097          	auipc	ra,0xffffb
    800069cc:	294080e7          	jalr	660(ra) # 80001c5c <_Z11printStringPKc>
    800069d0:	00000613          	li	a2,0
    800069d4:	00a00593          	li	a1,10
    800069d8:	00048513          	mv	a0,s1
    800069dc:	ffffb097          	auipc	ra,0xffffb
    800069e0:	430080e7          	jalr	1072(ra) # 80001e0c <_Z8printIntiii>
    800069e4:	00003517          	auipc	a0,0x3
    800069e8:	77c50513          	addi	a0,a0,1916 # 8000a160 <CONSOLE_STATUS+0x150>
    800069ec:	ffffb097          	auipc	ra,0xffffb
    800069f0:	270080e7          	jalr	624(ra) # 80001c5c <_Z11printStringPKc>
    for (; i < 6; i++) {
    800069f4:	0014849b          	addiw	s1,s1,1
    800069f8:	0ff4f493          	andi	s1,s1,255
    800069fc:	00500793          	li	a5,5
    80006a00:	fc97f0e3          	bgeu	a5,s1,800069c0 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006a04:	00004517          	auipc	a0,0x4
    80006a08:	98450513          	addi	a0,a0,-1660 # 8000a388 <CONSOLE_STATUS+0x378>
    80006a0c:	ffffb097          	auipc	ra,0xffffb
    80006a10:	250080e7          	jalr	592(ra) # 80001c5c <_Z11printStringPKc>
    finishedC = true;
    80006a14:	00100793          	li	a5,1
    80006a18:	00006717          	auipc	a4,0x6
    80006a1c:	f0f709a3          	sb	a5,-237(a4) # 8000c92b <_ZL9finishedC>
    thread_dispatch();
    80006a20:	ffffb097          	auipc	ra,0xffffb
    80006a24:	b00080e7          	jalr	-1280(ra) # 80001520 <_Z15thread_dispatchv>
}
    80006a28:	01813083          	ld	ra,24(sp)
    80006a2c:	01013403          	ld	s0,16(sp)
    80006a30:	00813483          	ld	s1,8(sp)
    80006a34:	00013903          	ld	s2,0(sp)
    80006a38:	02010113          	addi	sp,sp,32
    80006a3c:	00008067          	ret

0000000080006a40 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006a40:	fe010113          	addi	sp,sp,-32
    80006a44:	00113c23          	sd	ra,24(sp)
    80006a48:	00813823          	sd	s0,16(sp)
    80006a4c:	00913423          	sd	s1,8(sp)
    80006a50:	01213023          	sd	s2,0(sp)
    80006a54:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006a58:	00000913          	li	s2,0
    80006a5c:	0400006f          	j	80006a9c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006a60:	ffffb097          	auipc	ra,0xffffb
    80006a64:	ac0080e7          	jalr	-1344(ra) # 80001520 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006a68:	00148493          	addi	s1,s1,1
    80006a6c:	000027b7          	lui	a5,0x2
    80006a70:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a74:	0097ee63          	bltu	a5,s1,80006a90 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a78:	00000713          	li	a4,0
    80006a7c:	000077b7          	lui	a5,0x7
    80006a80:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a84:	fce7eee3          	bltu	a5,a4,80006a60 <_ZL11workerBodyBPv+0x20>
    80006a88:	00170713          	addi	a4,a4,1
    80006a8c:	ff1ff06f          	j	80006a7c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006a90:	00a00793          	li	a5,10
    80006a94:	04f90663          	beq	s2,a5,80006ae0 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006a98:	00190913          	addi	s2,s2,1
    80006a9c:	00f00793          	li	a5,15
    80006aa0:	0527e463          	bltu	a5,s2,80006ae8 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006aa4:	00004517          	auipc	a0,0x4
    80006aa8:	8f450513          	addi	a0,a0,-1804 # 8000a398 <CONSOLE_STATUS+0x388>
    80006aac:	ffffb097          	auipc	ra,0xffffb
    80006ab0:	1b0080e7          	jalr	432(ra) # 80001c5c <_Z11printStringPKc>
    80006ab4:	00000613          	li	a2,0
    80006ab8:	00a00593          	li	a1,10
    80006abc:	0009051b          	sext.w	a0,s2
    80006ac0:	ffffb097          	auipc	ra,0xffffb
    80006ac4:	34c080e7          	jalr	844(ra) # 80001e0c <_Z8printIntiii>
    80006ac8:	00003517          	auipc	a0,0x3
    80006acc:	69850513          	addi	a0,a0,1688 # 8000a160 <CONSOLE_STATUS+0x150>
    80006ad0:	ffffb097          	auipc	ra,0xffffb
    80006ad4:	18c080e7          	jalr	396(ra) # 80001c5c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006ad8:	00000493          	li	s1,0
    80006adc:	f91ff06f          	j	80006a6c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006ae0:	14102ff3          	csrr	t6,sepc
    80006ae4:	fb5ff06f          	j	80006a98 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006ae8:	00004517          	auipc	a0,0x4
    80006aec:	8b850513          	addi	a0,a0,-1864 # 8000a3a0 <CONSOLE_STATUS+0x390>
    80006af0:	ffffb097          	auipc	ra,0xffffb
    80006af4:	16c080e7          	jalr	364(ra) # 80001c5c <_Z11printStringPKc>
    finishedB = true;
    80006af8:	00100793          	li	a5,1
    80006afc:	00006717          	auipc	a4,0x6
    80006b00:	e2f70823          	sb	a5,-464(a4) # 8000c92c <_ZL9finishedB>
    thread_dispatch();
    80006b04:	ffffb097          	auipc	ra,0xffffb
    80006b08:	a1c080e7          	jalr	-1508(ra) # 80001520 <_Z15thread_dispatchv>
}
    80006b0c:	01813083          	ld	ra,24(sp)
    80006b10:	01013403          	ld	s0,16(sp)
    80006b14:	00813483          	ld	s1,8(sp)
    80006b18:	00013903          	ld	s2,0(sp)
    80006b1c:	02010113          	addi	sp,sp,32
    80006b20:	00008067          	ret

0000000080006b24 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006b24:	fe010113          	addi	sp,sp,-32
    80006b28:	00113c23          	sd	ra,24(sp)
    80006b2c:	00813823          	sd	s0,16(sp)
    80006b30:	00913423          	sd	s1,8(sp)
    80006b34:	01213023          	sd	s2,0(sp)
    80006b38:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006b3c:	00000913          	li	s2,0
    80006b40:	0380006f          	j	80006b78 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006b44:	ffffb097          	auipc	ra,0xffffb
    80006b48:	9dc080e7          	jalr	-1572(ra) # 80001520 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006b4c:	00148493          	addi	s1,s1,1
    80006b50:	000027b7          	lui	a5,0x2
    80006b54:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006b58:	0097ee63          	bltu	a5,s1,80006b74 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006b5c:	00000713          	li	a4,0
    80006b60:	000077b7          	lui	a5,0x7
    80006b64:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006b68:	fce7eee3          	bltu	a5,a4,80006b44 <_ZL11workerBodyAPv+0x20>
    80006b6c:	00170713          	addi	a4,a4,1
    80006b70:	ff1ff06f          	j	80006b60 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006b74:	00190913          	addi	s2,s2,1
    80006b78:	00900793          	li	a5,9
    80006b7c:	0527e063          	bltu	a5,s2,80006bbc <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006b80:	00004517          	auipc	a0,0x4
    80006b84:	80050513          	addi	a0,a0,-2048 # 8000a380 <CONSOLE_STATUS+0x370>
    80006b88:	ffffb097          	auipc	ra,0xffffb
    80006b8c:	0d4080e7          	jalr	212(ra) # 80001c5c <_Z11printStringPKc>
    80006b90:	00000613          	li	a2,0
    80006b94:	00a00593          	li	a1,10
    80006b98:	0009051b          	sext.w	a0,s2
    80006b9c:	ffffb097          	auipc	ra,0xffffb
    80006ba0:	270080e7          	jalr	624(ra) # 80001e0c <_Z8printIntiii>
    80006ba4:	00003517          	auipc	a0,0x3
    80006ba8:	5bc50513          	addi	a0,a0,1468 # 8000a160 <CONSOLE_STATUS+0x150>
    80006bac:	ffffb097          	auipc	ra,0xffffb
    80006bb0:	0b0080e7          	jalr	176(ra) # 80001c5c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006bb4:	00000493          	li	s1,0
    80006bb8:	f99ff06f          	j	80006b50 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006bbc:	00003517          	auipc	a0,0x3
    80006bc0:	7cc50513          	addi	a0,a0,1996 # 8000a388 <CONSOLE_STATUS+0x378>
    80006bc4:	ffffb097          	auipc	ra,0xffffb
    80006bc8:	098080e7          	jalr	152(ra) # 80001c5c <_Z11printStringPKc>
    finishedA = true;
    80006bcc:	00100793          	li	a5,1
    80006bd0:	00006717          	auipc	a4,0x6
    80006bd4:	d4f70ea3          	sb	a5,-675(a4) # 8000c92d <_ZL9finishedA>
}
    80006bd8:	01813083          	ld	ra,24(sp)
    80006bdc:	01013403          	ld	s0,16(sp)
    80006be0:	00813483          	ld	s1,8(sp)
    80006be4:	00013903          	ld	s2,0(sp)
    80006be8:	02010113          	addi	sp,sp,32
    80006bec:	00008067          	ret

0000000080006bf0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006bf0:	fd010113          	addi	sp,sp,-48
    80006bf4:	02113423          	sd	ra,40(sp)
    80006bf8:	02813023          	sd	s0,32(sp)
    80006bfc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006c00:	00000613          	li	a2,0
    80006c04:	00000597          	auipc	a1,0x0
    80006c08:	f2058593          	addi	a1,a1,-224 # 80006b24 <_ZL11workerBodyAPv>
    80006c0c:	fd040513          	addi	a0,s0,-48
    80006c10:	ffffb097          	auipc	ra,0xffffb
    80006c14:	8ac080e7          	jalr	-1876(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006c18:	00004517          	auipc	a0,0x4
    80006c1c:	81050513          	addi	a0,a0,-2032 # 8000a428 <CONSOLE_STATUS+0x418>
    80006c20:	ffffb097          	auipc	ra,0xffffb
    80006c24:	03c080e7          	jalr	60(ra) # 80001c5c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006c28:	00000613          	li	a2,0
    80006c2c:	00000597          	auipc	a1,0x0
    80006c30:	e1458593          	addi	a1,a1,-492 # 80006a40 <_ZL11workerBodyBPv>
    80006c34:	fd840513          	addi	a0,s0,-40
    80006c38:	ffffb097          	auipc	ra,0xffffb
    80006c3c:	884080e7          	jalr	-1916(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006c40:	00004517          	auipc	a0,0x4
    80006c44:	80050513          	addi	a0,a0,-2048 # 8000a440 <CONSOLE_STATUS+0x430>
    80006c48:	ffffb097          	auipc	ra,0xffffb
    80006c4c:	014080e7          	jalr	20(ra) # 80001c5c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006c50:	00000613          	li	a2,0
    80006c54:	00000597          	auipc	a1,0x0
    80006c58:	c6c58593          	addi	a1,a1,-916 # 800068c0 <_ZL11workerBodyCPv>
    80006c5c:	fe040513          	addi	a0,s0,-32
    80006c60:	ffffb097          	auipc	ra,0xffffb
    80006c64:	85c080e7          	jalr	-1956(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006c68:	00003517          	auipc	a0,0x3
    80006c6c:	7f050513          	addi	a0,a0,2032 # 8000a458 <CONSOLE_STATUS+0x448>
    80006c70:	ffffb097          	auipc	ra,0xffffb
    80006c74:	fec080e7          	jalr	-20(ra) # 80001c5c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006c78:	00000613          	li	a2,0
    80006c7c:	00000597          	auipc	a1,0x0
    80006c80:	afc58593          	addi	a1,a1,-1284 # 80006778 <_ZL11workerBodyDPv>
    80006c84:	fe840513          	addi	a0,s0,-24
    80006c88:	ffffb097          	auipc	ra,0xffffb
    80006c8c:	834080e7          	jalr	-1996(ra) # 800014bc <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006c90:	00003517          	auipc	a0,0x3
    80006c94:	7e050513          	addi	a0,a0,2016 # 8000a470 <CONSOLE_STATUS+0x460>
    80006c98:	ffffb097          	auipc	ra,0xffffb
    80006c9c:	fc4080e7          	jalr	-60(ra) # 80001c5c <_Z11printStringPKc>
    80006ca0:	00c0006f          	j	80006cac <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006ca4:	ffffb097          	auipc	ra,0xffffb
    80006ca8:	87c080e7          	jalr	-1924(ra) # 80001520 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006cac:	00006797          	auipc	a5,0x6
    80006cb0:	c817c783          	lbu	a5,-895(a5) # 8000c92d <_ZL9finishedA>
    80006cb4:	fe0788e3          	beqz	a5,80006ca4 <_Z16System_Mode_testv+0xb4>
    80006cb8:	00006797          	auipc	a5,0x6
    80006cbc:	c747c783          	lbu	a5,-908(a5) # 8000c92c <_ZL9finishedB>
    80006cc0:	fe0782e3          	beqz	a5,80006ca4 <_Z16System_Mode_testv+0xb4>
    80006cc4:	00006797          	auipc	a5,0x6
    80006cc8:	c677c783          	lbu	a5,-921(a5) # 8000c92b <_ZL9finishedC>
    80006ccc:	fc078ce3          	beqz	a5,80006ca4 <_Z16System_Mode_testv+0xb4>
    80006cd0:	00006797          	auipc	a5,0x6
    80006cd4:	c5a7c783          	lbu	a5,-934(a5) # 8000c92a <_ZL9finishedD>
    80006cd8:	fc0786e3          	beqz	a5,80006ca4 <_Z16System_Mode_testv+0xb4>
    }

}
    80006cdc:	02813083          	ld	ra,40(sp)
    80006ce0:	02013403          	ld	s0,32(sp)
    80006ce4:	03010113          	addi	sp,sp,48
    80006ce8:	00008067          	ret

0000000080006cec <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006cec:	fe010113          	addi	sp,sp,-32
    80006cf0:	00113c23          	sd	ra,24(sp)
    80006cf4:	00813823          	sd	s0,16(sp)
    80006cf8:	00913423          	sd	s1,8(sp)
    80006cfc:	01213023          	sd	s2,0(sp)
    80006d00:	02010413          	addi	s0,sp,32
    80006d04:	00050493          	mv	s1,a0
    80006d08:	00058913          	mv	s2,a1
    80006d0c:	0015879b          	addiw	a5,a1,1
    80006d10:	0007851b          	sext.w	a0,a5
    80006d14:	00f4a023          	sw	a5,0(s1)
    80006d18:	0004a823          	sw	zero,16(s1)
    80006d1c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006d20:	00251513          	slli	a0,a0,0x2
    80006d24:	ffffa097          	auipc	ra,0xffffa
    80006d28:	72c080e7          	jalr	1836(ra) # 80001450 <_Z9mem_allocm>
    80006d2c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006d30:	00000593          	li	a1,0
    80006d34:	02048513          	addi	a0,s1,32
    80006d38:	ffffb097          	auipc	ra,0xffffb
    80006d3c:	834080e7          	jalr	-1996(ra) # 8000156c <_Z8sem_openPP3Semj>
    sem_open(&spaceAvailable, _cap);
    80006d40:	00090593          	mv	a1,s2
    80006d44:	01848513          	addi	a0,s1,24
    80006d48:	ffffb097          	auipc	ra,0xffffb
    80006d4c:	824080e7          	jalr	-2012(ra) # 8000156c <_Z8sem_openPP3Semj>
    sem_open(&mutexHead, 1);
    80006d50:	00100593          	li	a1,1
    80006d54:	02848513          	addi	a0,s1,40
    80006d58:	ffffb097          	auipc	ra,0xffffb
    80006d5c:	814080e7          	jalr	-2028(ra) # 8000156c <_Z8sem_openPP3Semj>
    sem_open(&mutexTail, 1);
    80006d60:	00100593          	li	a1,1
    80006d64:	03048513          	addi	a0,s1,48
    80006d68:	ffffb097          	auipc	ra,0xffffb
    80006d6c:	804080e7          	jalr	-2044(ra) # 8000156c <_Z8sem_openPP3Semj>
}
    80006d70:	01813083          	ld	ra,24(sp)
    80006d74:	01013403          	ld	s0,16(sp)
    80006d78:	00813483          	ld	s1,8(sp)
    80006d7c:	00013903          	ld	s2,0(sp)
    80006d80:	02010113          	addi	sp,sp,32
    80006d84:	00008067          	ret

0000000080006d88 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006d88:	fe010113          	addi	sp,sp,-32
    80006d8c:	00113c23          	sd	ra,24(sp)
    80006d90:	00813823          	sd	s0,16(sp)
    80006d94:	00913423          	sd	s1,8(sp)
    80006d98:	01213023          	sd	s2,0(sp)
    80006d9c:	02010413          	addi	s0,sp,32
    80006da0:	00050493          	mv	s1,a0
    80006da4:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006da8:	01853503          	ld	a0,24(a0)
    80006dac:	ffffb097          	auipc	ra,0xffffb
    80006db0:	824080e7          	jalr	-2012(ra) # 800015d0 <_Z8sem_waitP3Sem>

    sem_wait(mutexTail);
    80006db4:	0304b503          	ld	a0,48(s1)
    80006db8:	ffffb097          	auipc	ra,0xffffb
    80006dbc:	818080e7          	jalr	-2024(ra) # 800015d0 <_Z8sem_waitP3Sem>
    buffer[tail] = val;
    80006dc0:	0084b783          	ld	a5,8(s1)
    80006dc4:	0144a703          	lw	a4,20(s1)
    80006dc8:	00271713          	slli	a4,a4,0x2
    80006dcc:	00e787b3          	add	a5,a5,a4
    80006dd0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006dd4:	0144a783          	lw	a5,20(s1)
    80006dd8:	0017879b          	addiw	a5,a5,1
    80006ddc:	0004a703          	lw	a4,0(s1)
    80006de0:	02e7e7bb          	remw	a5,a5,a4
    80006de4:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006de8:	0304b503          	ld	a0,48(s1)
    80006dec:	ffffb097          	auipc	ra,0xffffb
    80006df0:	814080e7          	jalr	-2028(ra) # 80001600 <_Z10sem_signalP3Sem>

    sem_signal(itemAvailable);
    80006df4:	0204b503          	ld	a0,32(s1)
    80006df8:	ffffb097          	auipc	ra,0xffffb
    80006dfc:	808080e7          	jalr	-2040(ra) # 80001600 <_Z10sem_signalP3Sem>

}
    80006e00:	01813083          	ld	ra,24(sp)
    80006e04:	01013403          	ld	s0,16(sp)
    80006e08:	00813483          	ld	s1,8(sp)
    80006e0c:	00013903          	ld	s2,0(sp)
    80006e10:	02010113          	addi	sp,sp,32
    80006e14:	00008067          	ret

0000000080006e18 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006e18:	fe010113          	addi	sp,sp,-32
    80006e1c:	00113c23          	sd	ra,24(sp)
    80006e20:	00813823          	sd	s0,16(sp)
    80006e24:	00913423          	sd	s1,8(sp)
    80006e28:	01213023          	sd	s2,0(sp)
    80006e2c:	02010413          	addi	s0,sp,32
    80006e30:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006e34:	02053503          	ld	a0,32(a0)
    80006e38:	ffffa097          	auipc	ra,0xffffa
    80006e3c:	798080e7          	jalr	1944(ra) # 800015d0 <_Z8sem_waitP3Sem>

    sem_wait(mutexHead);
    80006e40:	0284b503          	ld	a0,40(s1)
    80006e44:	ffffa097          	auipc	ra,0xffffa
    80006e48:	78c080e7          	jalr	1932(ra) # 800015d0 <_Z8sem_waitP3Sem>

    int ret = buffer[head];
    80006e4c:	0084b703          	ld	a4,8(s1)
    80006e50:	0104a783          	lw	a5,16(s1)
    80006e54:	00279693          	slli	a3,a5,0x2
    80006e58:	00d70733          	add	a4,a4,a3
    80006e5c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006e60:	0017879b          	addiw	a5,a5,1
    80006e64:	0004a703          	lw	a4,0(s1)
    80006e68:	02e7e7bb          	remw	a5,a5,a4
    80006e6c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006e70:	0284b503          	ld	a0,40(s1)
    80006e74:	ffffa097          	auipc	ra,0xffffa
    80006e78:	78c080e7          	jalr	1932(ra) # 80001600 <_Z10sem_signalP3Sem>

    sem_signal(spaceAvailable);
    80006e7c:	0184b503          	ld	a0,24(s1)
    80006e80:	ffffa097          	auipc	ra,0xffffa
    80006e84:	780080e7          	jalr	1920(ra) # 80001600 <_Z10sem_signalP3Sem>

    return ret;
}
    80006e88:	00090513          	mv	a0,s2
    80006e8c:	01813083          	ld	ra,24(sp)
    80006e90:	01013403          	ld	s0,16(sp)
    80006e94:	00813483          	ld	s1,8(sp)
    80006e98:	00013903          	ld	s2,0(sp)
    80006e9c:	02010113          	addi	sp,sp,32
    80006ea0:	00008067          	ret

0000000080006ea4 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006ea4:	fe010113          	addi	sp,sp,-32
    80006ea8:	00113c23          	sd	ra,24(sp)
    80006eac:	00813823          	sd	s0,16(sp)
    80006eb0:	00913423          	sd	s1,8(sp)
    80006eb4:	01213023          	sd	s2,0(sp)
    80006eb8:	02010413          	addi	s0,sp,32
    80006ebc:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006ec0:	02853503          	ld	a0,40(a0)
    80006ec4:	ffffa097          	auipc	ra,0xffffa
    80006ec8:	70c080e7          	jalr	1804(ra) # 800015d0 <_Z8sem_waitP3Sem>
    sem_wait(mutexTail);
    80006ecc:	0304b503          	ld	a0,48(s1)
    80006ed0:	ffffa097          	auipc	ra,0xffffa
    80006ed4:	700080e7          	jalr	1792(ra) # 800015d0 <_Z8sem_waitP3Sem>

    if (tail >= head) {
    80006ed8:	0144a783          	lw	a5,20(s1)
    80006edc:	0104a903          	lw	s2,16(s1)
    80006ee0:	0327ce63          	blt	a5,s2,80006f1c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006ee4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006ee8:	0304b503          	ld	a0,48(s1)
    80006eec:	ffffa097          	auipc	ra,0xffffa
    80006ef0:	714080e7          	jalr	1812(ra) # 80001600 <_Z10sem_signalP3Sem>
    sem_signal(mutexHead);
    80006ef4:	0284b503          	ld	a0,40(s1)
    80006ef8:	ffffa097          	auipc	ra,0xffffa
    80006efc:	708080e7          	jalr	1800(ra) # 80001600 <_Z10sem_signalP3Sem>

    return ret;
}
    80006f00:	00090513          	mv	a0,s2
    80006f04:	01813083          	ld	ra,24(sp)
    80006f08:	01013403          	ld	s0,16(sp)
    80006f0c:	00813483          	ld	s1,8(sp)
    80006f10:	00013903          	ld	s2,0(sp)
    80006f14:	02010113          	addi	sp,sp,32
    80006f18:	00008067          	ret
        ret = cap - head + tail;
    80006f1c:	0004a703          	lw	a4,0(s1)
    80006f20:	4127093b          	subw	s2,a4,s2
    80006f24:	00f9093b          	addw	s2,s2,a5
    80006f28:	fc1ff06f          	j	80006ee8 <_ZN6Buffer6getCntEv+0x44>

0000000080006f2c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006f2c:	fe010113          	addi	sp,sp,-32
    80006f30:	00113c23          	sd	ra,24(sp)
    80006f34:	00813823          	sd	s0,16(sp)
    80006f38:	00913423          	sd	s1,8(sp)
    80006f3c:	02010413          	addi	s0,sp,32
    80006f40:	00050493          	mv	s1,a0
    putc('\n');
    80006f44:	00a00513          	li	a0,10
    80006f48:	ffffa097          	auipc	ra,0xffffa
    80006f4c:	768080e7          	jalr	1896(ra) # 800016b0 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006f50:	00003517          	auipc	a0,0x3
    80006f54:	53850513          	addi	a0,a0,1336 # 8000a488 <CONSOLE_STATUS+0x478>
    80006f58:	ffffb097          	auipc	ra,0xffffb
    80006f5c:	d04080e7          	jalr	-764(ra) # 80001c5c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006f60:	00048513          	mv	a0,s1
    80006f64:	00000097          	auipc	ra,0x0
    80006f68:	f40080e7          	jalr	-192(ra) # 80006ea4 <_ZN6Buffer6getCntEv>
    80006f6c:	02a05c63          	blez	a0,80006fa4 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006f70:	0084b783          	ld	a5,8(s1)
    80006f74:	0104a703          	lw	a4,16(s1)
    80006f78:	00271713          	slli	a4,a4,0x2
    80006f7c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006f80:	0007c503          	lbu	a0,0(a5)
    80006f84:	ffffa097          	auipc	ra,0xffffa
    80006f88:	72c080e7          	jalr	1836(ra) # 800016b0 <_Z4putcc>
        head = (head + 1) % cap;
    80006f8c:	0104a783          	lw	a5,16(s1)
    80006f90:	0017879b          	addiw	a5,a5,1
    80006f94:	0004a703          	lw	a4,0(s1)
    80006f98:	02e7e7bb          	remw	a5,a5,a4
    80006f9c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006fa0:	fc1ff06f          	j	80006f60 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006fa4:	02100513          	li	a0,33
    80006fa8:	ffffa097          	auipc	ra,0xffffa
    80006fac:	708080e7          	jalr	1800(ra) # 800016b0 <_Z4putcc>
    putc('\n');
    80006fb0:	00a00513          	li	a0,10
    80006fb4:	ffffa097          	auipc	ra,0xffffa
    80006fb8:	6fc080e7          	jalr	1788(ra) # 800016b0 <_Z4putcc>
    mem_free(buffer);
    80006fbc:	0084b503          	ld	a0,8(s1)
    80006fc0:	ffffa097          	auipc	ra,0xffffa
    80006fc4:	4cc080e7          	jalr	1228(ra) # 8000148c <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006fc8:	0204b503          	ld	a0,32(s1)
    80006fcc:	ffffa097          	auipc	ra,0xffffa
    80006fd0:	5d4080e7          	jalr	1492(ra) # 800015a0 <_Z9sem_closeP3Sem>
    sem_close(spaceAvailable);
    80006fd4:	0184b503          	ld	a0,24(s1)
    80006fd8:	ffffa097          	auipc	ra,0xffffa
    80006fdc:	5c8080e7          	jalr	1480(ra) # 800015a0 <_Z9sem_closeP3Sem>
    sem_close(mutexTail);
    80006fe0:	0304b503          	ld	a0,48(s1)
    80006fe4:	ffffa097          	auipc	ra,0xffffa
    80006fe8:	5bc080e7          	jalr	1468(ra) # 800015a0 <_Z9sem_closeP3Sem>
    sem_close(mutexHead);
    80006fec:	0284b503          	ld	a0,40(s1)
    80006ff0:	ffffa097          	auipc	ra,0xffffa
    80006ff4:	5b0080e7          	jalr	1456(ra) # 800015a0 <_Z9sem_closeP3Sem>
}
    80006ff8:	01813083          	ld	ra,24(sp)
    80006ffc:	01013403          	ld	s0,16(sp)
    80007000:	00813483          	ld	s1,8(sp)
    80007004:	02010113          	addi	sp,sp,32
    80007008:	00008067          	ret

000000008000700c <start>:
    8000700c:	ff010113          	addi	sp,sp,-16
    80007010:	00813423          	sd	s0,8(sp)
    80007014:	01010413          	addi	s0,sp,16
    80007018:	300027f3          	csrr	a5,mstatus
    8000701c:	ffffe737          	lui	a4,0xffffe
    80007020:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff0c6f>
    80007024:	00e7f7b3          	and	a5,a5,a4
    80007028:	00001737          	lui	a4,0x1
    8000702c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007030:	00e7e7b3          	or	a5,a5,a4
    80007034:	30079073          	csrw	mstatus,a5
    80007038:	00000797          	auipc	a5,0x0
    8000703c:	16078793          	addi	a5,a5,352 # 80007198 <system_main>
    80007040:	34179073          	csrw	mepc,a5
    80007044:	00000793          	li	a5,0
    80007048:	18079073          	csrw	satp,a5
    8000704c:	000107b7          	lui	a5,0x10
    80007050:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007054:	30279073          	csrw	medeleg,a5
    80007058:	30379073          	csrw	mideleg,a5
    8000705c:	104027f3          	csrr	a5,sie
    80007060:	2227e793          	ori	a5,a5,546
    80007064:	10479073          	csrw	sie,a5
    80007068:	fff00793          	li	a5,-1
    8000706c:	00a7d793          	srli	a5,a5,0xa
    80007070:	3b079073          	csrw	pmpaddr0,a5
    80007074:	00f00793          	li	a5,15
    80007078:	3a079073          	csrw	pmpcfg0,a5
    8000707c:	f14027f3          	csrr	a5,mhartid
    80007080:	0200c737          	lui	a4,0x200c
    80007084:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007088:	0007869b          	sext.w	a3,a5
    8000708c:	00269713          	slli	a4,a3,0x2
    80007090:	000f4637          	lui	a2,0xf4
    80007094:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007098:	00d70733          	add	a4,a4,a3
    8000709c:	0037979b          	slliw	a5,a5,0x3
    800070a0:	020046b7          	lui	a3,0x2004
    800070a4:	00d787b3          	add	a5,a5,a3
    800070a8:	00c585b3          	add	a1,a1,a2
    800070ac:	00371693          	slli	a3,a4,0x3
    800070b0:	00006717          	auipc	a4,0x6
    800070b4:	88070713          	addi	a4,a4,-1920 # 8000c930 <timer_scratch>
    800070b8:	00b7b023          	sd	a1,0(a5)
    800070bc:	00d70733          	add	a4,a4,a3
    800070c0:	00f73c23          	sd	a5,24(a4)
    800070c4:	02c73023          	sd	a2,32(a4)
    800070c8:	34071073          	csrw	mscratch,a4
    800070cc:	00000797          	auipc	a5,0x0
    800070d0:	6e478793          	addi	a5,a5,1764 # 800077b0 <timervec>
    800070d4:	30579073          	csrw	mtvec,a5
    800070d8:	300027f3          	csrr	a5,mstatus
    800070dc:	0087e793          	ori	a5,a5,8
    800070e0:	30079073          	csrw	mstatus,a5
    800070e4:	304027f3          	csrr	a5,mie
    800070e8:	0807e793          	ori	a5,a5,128
    800070ec:	30479073          	csrw	mie,a5
    800070f0:	f14027f3          	csrr	a5,mhartid
    800070f4:	0007879b          	sext.w	a5,a5
    800070f8:	00078213          	mv	tp,a5
    800070fc:	30200073          	mret
    80007100:	00813403          	ld	s0,8(sp)
    80007104:	01010113          	addi	sp,sp,16
    80007108:	00008067          	ret

000000008000710c <timerinit>:
    8000710c:	ff010113          	addi	sp,sp,-16
    80007110:	00813423          	sd	s0,8(sp)
    80007114:	01010413          	addi	s0,sp,16
    80007118:	f14027f3          	csrr	a5,mhartid
    8000711c:	0200c737          	lui	a4,0x200c
    80007120:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007124:	0007869b          	sext.w	a3,a5
    80007128:	00269713          	slli	a4,a3,0x2
    8000712c:	000f4637          	lui	a2,0xf4
    80007130:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007134:	00d70733          	add	a4,a4,a3
    80007138:	0037979b          	slliw	a5,a5,0x3
    8000713c:	020046b7          	lui	a3,0x2004
    80007140:	00d787b3          	add	a5,a5,a3
    80007144:	00c585b3          	add	a1,a1,a2
    80007148:	00371693          	slli	a3,a4,0x3
    8000714c:	00005717          	auipc	a4,0x5
    80007150:	7e470713          	addi	a4,a4,2020 # 8000c930 <timer_scratch>
    80007154:	00b7b023          	sd	a1,0(a5)
    80007158:	00d70733          	add	a4,a4,a3
    8000715c:	00f73c23          	sd	a5,24(a4)
    80007160:	02c73023          	sd	a2,32(a4)
    80007164:	34071073          	csrw	mscratch,a4
    80007168:	00000797          	auipc	a5,0x0
    8000716c:	64878793          	addi	a5,a5,1608 # 800077b0 <timervec>
    80007170:	30579073          	csrw	mtvec,a5
    80007174:	300027f3          	csrr	a5,mstatus
    80007178:	0087e793          	ori	a5,a5,8
    8000717c:	30079073          	csrw	mstatus,a5
    80007180:	304027f3          	csrr	a5,mie
    80007184:	0807e793          	ori	a5,a5,128
    80007188:	30479073          	csrw	mie,a5
    8000718c:	00813403          	ld	s0,8(sp)
    80007190:	01010113          	addi	sp,sp,16
    80007194:	00008067          	ret

0000000080007198 <system_main>:
    80007198:	fe010113          	addi	sp,sp,-32
    8000719c:	00813823          	sd	s0,16(sp)
    800071a0:	00913423          	sd	s1,8(sp)
    800071a4:	00113c23          	sd	ra,24(sp)
    800071a8:	02010413          	addi	s0,sp,32
    800071ac:	00000097          	auipc	ra,0x0
    800071b0:	0c4080e7          	jalr	196(ra) # 80007270 <cpuid>
    800071b4:	00005497          	auipc	s1,0x5
    800071b8:	69c48493          	addi	s1,s1,1692 # 8000c850 <started>
    800071bc:	02050263          	beqz	a0,800071e0 <system_main+0x48>
    800071c0:	0004a783          	lw	a5,0(s1)
    800071c4:	0007879b          	sext.w	a5,a5
    800071c8:	fe078ce3          	beqz	a5,800071c0 <system_main+0x28>
    800071cc:	0ff0000f          	fence
    800071d0:	00003517          	auipc	a0,0x3
    800071d4:	31050513          	addi	a0,a0,784 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    800071d8:	00001097          	auipc	ra,0x1
    800071dc:	a74080e7          	jalr	-1420(ra) # 80007c4c <panic>
    800071e0:	00001097          	auipc	ra,0x1
    800071e4:	9c8080e7          	jalr	-1592(ra) # 80007ba8 <consoleinit>
    800071e8:	00001097          	auipc	ra,0x1
    800071ec:	154080e7          	jalr	340(ra) # 8000833c <printfinit>
    800071f0:	00003517          	auipc	a0,0x3
    800071f4:	f7050513          	addi	a0,a0,-144 # 8000a160 <CONSOLE_STATUS+0x150>
    800071f8:	00001097          	auipc	ra,0x1
    800071fc:	ab0080e7          	jalr	-1360(ra) # 80007ca8 <__printf>
    80007200:	00003517          	auipc	a0,0x3
    80007204:	2b050513          	addi	a0,a0,688 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80007208:	00001097          	auipc	ra,0x1
    8000720c:	aa0080e7          	jalr	-1376(ra) # 80007ca8 <__printf>
    80007210:	00003517          	auipc	a0,0x3
    80007214:	f5050513          	addi	a0,a0,-176 # 8000a160 <CONSOLE_STATUS+0x150>
    80007218:	00001097          	auipc	ra,0x1
    8000721c:	a90080e7          	jalr	-1392(ra) # 80007ca8 <__printf>
    80007220:	00001097          	auipc	ra,0x1
    80007224:	4a8080e7          	jalr	1192(ra) # 800086c8 <kinit>
    80007228:	00000097          	auipc	ra,0x0
    8000722c:	148080e7          	jalr	328(ra) # 80007370 <trapinit>
    80007230:	00000097          	auipc	ra,0x0
    80007234:	16c080e7          	jalr	364(ra) # 8000739c <trapinithart>
    80007238:	00000097          	auipc	ra,0x0
    8000723c:	5b8080e7          	jalr	1464(ra) # 800077f0 <plicinit>
    80007240:	00000097          	auipc	ra,0x0
    80007244:	5d8080e7          	jalr	1496(ra) # 80007818 <plicinithart>
    80007248:	00000097          	auipc	ra,0x0
    8000724c:	078080e7          	jalr	120(ra) # 800072c0 <userinit>
    80007250:	0ff0000f          	fence
    80007254:	00100793          	li	a5,1
    80007258:	00003517          	auipc	a0,0x3
    8000725c:	27050513          	addi	a0,a0,624 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80007260:	00f4a023          	sw	a5,0(s1)
    80007264:	00001097          	auipc	ra,0x1
    80007268:	a44080e7          	jalr	-1468(ra) # 80007ca8 <__printf>
    8000726c:	0000006f          	j	8000726c <system_main+0xd4>

0000000080007270 <cpuid>:
    80007270:	ff010113          	addi	sp,sp,-16
    80007274:	00813423          	sd	s0,8(sp)
    80007278:	01010413          	addi	s0,sp,16
    8000727c:	00020513          	mv	a0,tp
    80007280:	00813403          	ld	s0,8(sp)
    80007284:	0005051b          	sext.w	a0,a0
    80007288:	01010113          	addi	sp,sp,16
    8000728c:	00008067          	ret

0000000080007290 <mycpu>:
    80007290:	ff010113          	addi	sp,sp,-16
    80007294:	00813423          	sd	s0,8(sp)
    80007298:	01010413          	addi	s0,sp,16
    8000729c:	00020793          	mv	a5,tp
    800072a0:	00813403          	ld	s0,8(sp)
    800072a4:	0007879b          	sext.w	a5,a5
    800072a8:	00779793          	slli	a5,a5,0x7
    800072ac:	00006517          	auipc	a0,0x6
    800072b0:	6b450513          	addi	a0,a0,1716 # 8000d960 <cpus>
    800072b4:	00f50533          	add	a0,a0,a5
    800072b8:	01010113          	addi	sp,sp,16
    800072bc:	00008067          	ret

00000000800072c0 <userinit>:
    800072c0:	ff010113          	addi	sp,sp,-16
    800072c4:	00813423          	sd	s0,8(sp)
    800072c8:	01010413          	addi	s0,sp,16
    800072cc:	00813403          	ld	s0,8(sp)
    800072d0:	01010113          	addi	sp,sp,16
    800072d4:	ffffb317          	auipc	t1,0xffffb
    800072d8:	05430067          	jr	84(t1) # 80002328 <main>

00000000800072dc <either_copyout>:
    800072dc:	ff010113          	addi	sp,sp,-16
    800072e0:	00813023          	sd	s0,0(sp)
    800072e4:	00113423          	sd	ra,8(sp)
    800072e8:	01010413          	addi	s0,sp,16
    800072ec:	02051663          	bnez	a0,80007318 <either_copyout+0x3c>
    800072f0:	00058513          	mv	a0,a1
    800072f4:	00060593          	mv	a1,a2
    800072f8:	0006861b          	sext.w	a2,a3
    800072fc:	00002097          	auipc	ra,0x2
    80007300:	c58080e7          	jalr	-936(ra) # 80008f54 <__memmove>
    80007304:	00813083          	ld	ra,8(sp)
    80007308:	00013403          	ld	s0,0(sp)
    8000730c:	00000513          	li	a0,0
    80007310:	01010113          	addi	sp,sp,16
    80007314:	00008067          	ret
    80007318:	00003517          	auipc	a0,0x3
    8000731c:	1f050513          	addi	a0,a0,496 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80007320:	00001097          	auipc	ra,0x1
    80007324:	92c080e7          	jalr	-1748(ra) # 80007c4c <panic>

0000000080007328 <either_copyin>:
    80007328:	ff010113          	addi	sp,sp,-16
    8000732c:	00813023          	sd	s0,0(sp)
    80007330:	00113423          	sd	ra,8(sp)
    80007334:	01010413          	addi	s0,sp,16
    80007338:	02059463          	bnez	a1,80007360 <either_copyin+0x38>
    8000733c:	00060593          	mv	a1,a2
    80007340:	0006861b          	sext.w	a2,a3
    80007344:	00002097          	auipc	ra,0x2
    80007348:	c10080e7          	jalr	-1008(ra) # 80008f54 <__memmove>
    8000734c:	00813083          	ld	ra,8(sp)
    80007350:	00013403          	ld	s0,0(sp)
    80007354:	00000513          	li	a0,0
    80007358:	01010113          	addi	sp,sp,16
    8000735c:	00008067          	ret
    80007360:	00003517          	auipc	a0,0x3
    80007364:	1d050513          	addi	a0,a0,464 # 8000a530 <CONSOLE_STATUS+0x520>
    80007368:	00001097          	auipc	ra,0x1
    8000736c:	8e4080e7          	jalr	-1820(ra) # 80007c4c <panic>

0000000080007370 <trapinit>:
    80007370:	ff010113          	addi	sp,sp,-16
    80007374:	00813423          	sd	s0,8(sp)
    80007378:	01010413          	addi	s0,sp,16
    8000737c:	00813403          	ld	s0,8(sp)
    80007380:	00003597          	auipc	a1,0x3
    80007384:	1d858593          	addi	a1,a1,472 # 8000a558 <CONSOLE_STATUS+0x548>
    80007388:	00006517          	auipc	a0,0x6
    8000738c:	65850513          	addi	a0,a0,1624 # 8000d9e0 <tickslock>
    80007390:	01010113          	addi	sp,sp,16
    80007394:	00001317          	auipc	t1,0x1
    80007398:	5c430067          	jr	1476(t1) # 80008958 <initlock>

000000008000739c <trapinithart>:
    8000739c:	ff010113          	addi	sp,sp,-16
    800073a0:	00813423          	sd	s0,8(sp)
    800073a4:	01010413          	addi	s0,sp,16
    800073a8:	00000797          	auipc	a5,0x0
    800073ac:	2f878793          	addi	a5,a5,760 # 800076a0 <kernelvec>
    800073b0:	10579073          	csrw	stvec,a5
    800073b4:	00813403          	ld	s0,8(sp)
    800073b8:	01010113          	addi	sp,sp,16
    800073bc:	00008067          	ret

00000000800073c0 <usertrap>:
    800073c0:	ff010113          	addi	sp,sp,-16
    800073c4:	00813423          	sd	s0,8(sp)
    800073c8:	01010413          	addi	s0,sp,16
    800073cc:	00813403          	ld	s0,8(sp)
    800073d0:	01010113          	addi	sp,sp,16
    800073d4:	00008067          	ret

00000000800073d8 <usertrapret>:
    800073d8:	ff010113          	addi	sp,sp,-16
    800073dc:	00813423          	sd	s0,8(sp)
    800073e0:	01010413          	addi	s0,sp,16
    800073e4:	00813403          	ld	s0,8(sp)
    800073e8:	01010113          	addi	sp,sp,16
    800073ec:	00008067          	ret

00000000800073f0 <kerneltrap>:
    800073f0:	fe010113          	addi	sp,sp,-32
    800073f4:	00813823          	sd	s0,16(sp)
    800073f8:	00113c23          	sd	ra,24(sp)
    800073fc:	00913423          	sd	s1,8(sp)
    80007400:	02010413          	addi	s0,sp,32
    80007404:	142025f3          	csrr	a1,scause
    80007408:	100027f3          	csrr	a5,sstatus
    8000740c:	0027f793          	andi	a5,a5,2
    80007410:	10079c63          	bnez	a5,80007528 <kerneltrap+0x138>
    80007414:	142027f3          	csrr	a5,scause
    80007418:	0207ce63          	bltz	a5,80007454 <kerneltrap+0x64>
    8000741c:	00003517          	auipc	a0,0x3
    80007420:	18450513          	addi	a0,a0,388 # 8000a5a0 <CONSOLE_STATUS+0x590>
    80007424:	00001097          	auipc	ra,0x1
    80007428:	884080e7          	jalr	-1916(ra) # 80007ca8 <__printf>
    8000742c:	141025f3          	csrr	a1,sepc
    80007430:	14302673          	csrr	a2,stval
    80007434:	00003517          	auipc	a0,0x3
    80007438:	17c50513          	addi	a0,a0,380 # 8000a5b0 <CONSOLE_STATUS+0x5a0>
    8000743c:	00001097          	auipc	ra,0x1
    80007440:	86c080e7          	jalr	-1940(ra) # 80007ca8 <__printf>
    80007444:	00003517          	auipc	a0,0x3
    80007448:	18450513          	addi	a0,a0,388 # 8000a5c8 <CONSOLE_STATUS+0x5b8>
    8000744c:	00001097          	auipc	ra,0x1
    80007450:	800080e7          	jalr	-2048(ra) # 80007c4c <panic>
    80007454:	0ff7f713          	andi	a4,a5,255
    80007458:	00900693          	li	a3,9
    8000745c:	04d70063          	beq	a4,a3,8000749c <kerneltrap+0xac>
    80007460:	fff00713          	li	a4,-1
    80007464:	03f71713          	slli	a4,a4,0x3f
    80007468:	00170713          	addi	a4,a4,1
    8000746c:	fae798e3          	bne	a5,a4,8000741c <kerneltrap+0x2c>
    80007470:	00000097          	auipc	ra,0x0
    80007474:	e00080e7          	jalr	-512(ra) # 80007270 <cpuid>
    80007478:	06050663          	beqz	a0,800074e4 <kerneltrap+0xf4>
    8000747c:	144027f3          	csrr	a5,sip
    80007480:	ffd7f793          	andi	a5,a5,-3
    80007484:	14479073          	csrw	sip,a5
    80007488:	01813083          	ld	ra,24(sp)
    8000748c:	01013403          	ld	s0,16(sp)
    80007490:	00813483          	ld	s1,8(sp)
    80007494:	02010113          	addi	sp,sp,32
    80007498:	00008067          	ret
    8000749c:	00000097          	auipc	ra,0x0
    800074a0:	3c8080e7          	jalr	968(ra) # 80007864 <plic_claim>
    800074a4:	00a00793          	li	a5,10
    800074a8:	00050493          	mv	s1,a0
    800074ac:	06f50863          	beq	a0,a5,8000751c <kerneltrap+0x12c>
    800074b0:	fc050ce3          	beqz	a0,80007488 <kerneltrap+0x98>
    800074b4:	00050593          	mv	a1,a0
    800074b8:	00003517          	auipc	a0,0x3
    800074bc:	0c850513          	addi	a0,a0,200 # 8000a580 <CONSOLE_STATUS+0x570>
    800074c0:	00000097          	auipc	ra,0x0
    800074c4:	7e8080e7          	jalr	2024(ra) # 80007ca8 <__printf>
    800074c8:	01013403          	ld	s0,16(sp)
    800074cc:	01813083          	ld	ra,24(sp)
    800074d0:	00048513          	mv	a0,s1
    800074d4:	00813483          	ld	s1,8(sp)
    800074d8:	02010113          	addi	sp,sp,32
    800074dc:	00000317          	auipc	t1,0x0
    800074e0:	3c030067          	jr	960(t1) # 8000789c <plic_complete>
    800074e4:	00006517          	auipc	a0,0x6
    800074e8:	4fc50513          	addi	a0,a0,1276 # 8000d9e0 <tickslock>
    800074ec:	00001097          	auipc	ra,0x1
    800074f0:	490080e7          	jalr	1168(ra) # 8000897c <acquire>
    800074f4:	00005717          	auipc	a4,0x5
    800074f8:	36070713          	addi	a4,a4,864 # 8000c854 <ticks>
    800074fc:	00072783          	lw	a5,0(a4)
    80007500:	00006517          	auipc	a0,0x6
    80007504:	4e050513          	addi	a0,a0,1248 # 8000d9e0 <tickslock>
    80007508:	0017879b          	addiw	a5,a5,1
    8000750c:	00f72023          	sw	a5,0(a4)
    80007510:	00001097          	auipc	ra,0x1
    80007514:	538080e7          	jalr	1336(ra) # 80008a48 <release>
    80007518:	f65ff06f          	j	8000747c <kerneltrap+0x8c>
    8000751c:	00001097          	auipc	ra,0x1
    80007520:	094080e7          	jalr	148(ra) # 800085b0 <uartintr>
    80007524:	fa5ff06f          	j	800074c8 <kerneltrap+0xd8>
    80007528:	00003517          	auipc	a0,0x3
    8000752c:	03850513          	addi	a0,a0,56 # 8000a560 <CONSOLE_STATUS+0x550>
    80007530:	00000097          	auipc	ra,0x0
    80007534:	71c080e7          	jalr	1820(ra) # 80007c4c <panic>

0000000080007538 <clockintr>:
    80007538:	fe010113          	addi	sp,sp,-32
    8000753c:	00813823          	sd	s0,16(sp)
    80007540:	00913423          	sd	s1,8(sp)
    80007544:	00113c23          	sd	ra,24(sp)
    80007548:	02010413          	addi	s0,sp,32
    8000754c:	00006497          	auipc	s1,0x6
    80007550:	49448493          	addi	s1,s1,1172 # 8000d9e0 <tickslock>
    80007554:	00048513          	mv	a0,s1
    80007558:	00001097          	auipc	ra,0x1
    8000755c:	424080e7          	jalr	1060(ra) # 8000897c <acquire>
    80007560:	00005717          	auipc	a4,0x5
    80007564:	2f470713          	addi	a4,a4,756 # 8000c854 <ticks>
    80007568:	00072783          	lw	a5,0(a4)
    8000756c:	01013403          	ld	s0,16(sp)
    80007570:	01813083          	ld	ra,24(sp)
    80007574:	00048513          	mv	a0,s1
    80007578:	0017879b          	addiw	a5,a5,1
    8000757c:	00813483          	ld	s1,8(sp)
    80007580:	00f72023          	sw	a5,0(a4)
    80007584:	02010113          	addi	sp,sp,32
    80007588:	00001317          	auipc	t1,0x1
    8000758c:	4c030067          	jr	1216(t1) # 80008a48 <release>

0000000080007590 <devintr>:
    80007590:	142027f3          	csrr	a5,scause
    80007594:	00000513          	li	a0,0
    80007598:	0007c463          	bltz	a5,800075a0 <devintr+0x10>
    8000759c:	00008067          	ret
    800075a0:	fe010113          	addi	sp,sp,-32
    800075a4:	00813823          	sd	s0,16(sp)
    800075a8:	00113c23          	sd	ra,24(sp)
    800075ac:	00913423          	sd	s1,8(sp)
    800075b0:	02010413          	addi	s0,sp,32
    800075b4:	0ff7f713          	andi	a4,a5,255
    800075b8:	00900693          	li	a3,9
    800075bc:	04d70c63          	beq	a4,a3,80007614 <devintr+0x84>
    800075c0:	fff00713          	li	a4,-1
    800075c4:	03f71713          	slli	a4,a4,0x3f
    800075c8:	00170713          	addi	a4,a4,1
    800075cc:	00e78c63          	beq	a5,a4,800075e4 <devintr+0x54>
    800075d0:	01813083          	ld	ra,24(sp)
    800075d4:	01013403          	ld	s0,16(sp)
    800075d8:	00813483          	ld	s1,8(sp)
    800075dc:	02010113          	addi	sp,sp,32
    800075e0:	00008067          	ret
    800075e4:	00000097          	auipc	ra,0x0
    800075e8:	c8c080e7          	jalr	-884(ra) # 80007270 <cpuid>
    800075ec:	06050663          	beqz	a0,80007658 <devintr+0xc8>
    800075f0:	144027f3          	csrr	a5,sip
    800075f4:	ffd7f793          	andi	a5,a5,-3
    800075f8:	14479073          	csrw	sip,a5
    800075fc:	01813083          	ld	ra,24(sp)
    80007600:	01013403          	ld	s0,16(sp)
    80007604:	00813483          	ld	s1,8(sp)
    80007608:	00200513          	li	a0,2
    8000760c:	02010113          	addi	sp,sp,32
    80007610:	00008067          	ret
    80007614:	00000097          	auipc	ra,0x0
    80007618:	250080e7          	jalr	592(ra) # 80007864 <plic_claim>
    8000761c:	00a00793          	li	a5,10
    80007620:	00050493          	mv	s1,a0
    80007624:	06f50663          	beq	a0,a5,80007690 <devintr+0x100>
    80007628:	00100513          	li	a0,1
    8000762c:	fa0482e3          	beqz	s1,800075d0 <devintr+0x40>
    80007630:	00048593          	mv	a1,s1
    80007634:	00003517          	auipc	a0,0x3
    80007638:	f4c50513          	addi	a0,a0,-180 # 8000a580 <CONSOLE_STATUS+0x570>
    8000763c:	00000097          	auipc	ra,0x0
    80007640:	66c080e7          	jalr	1644(ra) # 80007ca8 <__printf>
    80007644:	00048513          	mv	a0,s1
    80007648:	00000097          	auipc	ra,0x0
    8000764c:	254080e7          	jalr	596(ra) # 8000789c <plic_complete>
    80007650:	00100513          	li	a0,1
    80007654:	f7dff06f          	j	800075d0 <devintr+0x40>
    80007658:	00006517          	auipc	a0,0x6
    8000765c:	38850513          	addi	a0,a0,904 # 8000d9e0 <tickslock>
    80007660:	00001097          	auipc	ra,0x1
    80007664:	31c080e7          	jalr	796(ra) # 8000897c <acquire>
    80007668:	00005717          	auipc	a4,0x5
    8000766c:	1ec70713          	addi	a4,a4,492 # 8000c854 <ticks>
    80007670:	00072783          	lw	a5,0(a4)
    80007674:	00006517          	auipc	a0,0x6
    80007678:	36c50513          	addi	a0,a0,876 # 8000d9e0 <tickslock>
    8000767c:	0017879b          	addiw	a5,a5,1
    80007680:	00f72023          	sw	a5,0(a4)
    80007684:	00001097          	auipc	ra,0x1
    80007688:	3c4080e7          	jalr	964(ra) # 80008a48 <release>
    8000768c:	f65ff06f          	j	800075f0 <devintr+0x60>
    80007690:	00001097          	auipc	ra,0x1
    80007694:	f20080e7          	jalr	-224(ra) # 800085b0 <uartintr>
    80007698:	fadff06f          	j	80007644 <devintr+0xb4>
    8000769c:	0000                	unimp
	...

00000000800076a0 <kernelvec>:
    800076a0:	f0010113          	addi	sp,sp,-256
    800076a4:	00113023          	sd	ra,0(sp)
    800076a8:	00213423          	sd	sp,8(sp)
    800076ac:	00313823          	sd	gp,16(sp)
    800076b0:	00413c23          	sd	tp,24(sp)
    800076b4:	02513023          	sd	t0,32(sp)
    800076b8:	02613423          	sd	t1,40(sp)
    800076bc:	02713823          	sd	t2,48(sp)
    800076c0:	02813c23          	sd	s0,56(sp)
    800076c4:	04913023          	sd	s1,64(sp)
    800076c8:	04a13423          	sd	a0,72(sp)
    800076cc:	04b13823          	sd	a1,80(sp)
    800076d0:	04c13c23          	sd	a2,88(sp)
    800076d4:	06d13023          	sd	a3,96(sp)
    800076d8:	06e13423          	sd	a4,104(sp)
    800076dc:	06f13823          	sd	a5,112(sp)
    800076e0:	07013c23          	sd	a6,120(sp)
    800076e4:	09113023          	sd	a7,128(sp)
    800076e8:	09213423          	sd	s2,136(sp)
    800076ec:	09313823          	sd	s3,144(sp)
    800076f0:	09413c23          	sd	s4,152(sp)
    800076f4:	0b513023          	sd	s5,160(sp)
    800076f8:	0b613423          	sd	s6,168(sp)
    800076fc:	0b713823          	sd	s7,176(sp)
    80007700:	0b813c23          	sd	s8,184(sp)
    80007704:	0d913023          	sd	s9,192(sp)
    80007708:	0da13423          	sd	s10,200(sp)
    8000770c:	0db13823          	sd	s11,208(sp)
    80007710:	0dc13c23          	sd	t3,216(sp)
    80007714:	0fd13023          	sd	t4,224(sp)
    80007718:	0fe13423          	sd	t5,232(sp)
    8000771c:	0ff13823          	sd	t6,240(sp)
    80007720:	cd1ff0ef          	jal	ra,800073f0 <kerneltrap>
    80007724:	00013083          	ld	ra,0(sp)
    80007728:	00813103          	ld	sp,8(sp)
    8000772c:	01013183          	ld	gp,16(sp)
    80007730:	02013283          	ld	t0,32(sp)
    80007734:	02813303          	ld	t1,40(sp)
    80007738:	03013383          	ld	t2,48(sp)
    8000773c:	03813403          	ld	s0,56(sp)
    80007740:	04013483          	ld	s1,64(sp)
    80007744:	04813503          	ld	a0,72(sp)
    80007748:	05013583          	ld	a1,80(sp)
    8000774c:	05813603          	ld	a2,88(sp)
    80007750:	06013683          	ld	a3,96(sp)
    80007754:	06813703          	ld	a4,104(sp)
    80007758:	07013783          	ld	a5,112(sp)
    8000775c:	07813803          	ld	a6,120(sp)
    80007760:	08013883          	ld	a7,128(sp)
    80007764:	08813903          	ld	s2,136(sp)
    80007768:	09013983          	ld	s3,144(sp)
    8000776c:	09813a03          	ld	s4,152(sp)
    80007770:	0a013a83          	ld	s5,160(sp)
    80007774:	0a813b03          	ld	s6,168(sp)
    80007778:	0b013b83          	ld	s7,176(sp)
    8000777c:	0b813c03          	ld	s8,184(sp)
    80007780:	0c013c83          	ld	s9,192(sp)
    80007784:	0c813d03          	ld	s10,200(sp)
    80007788:	0d013d83          	ld	s11,208(sp)
    8000778c:	0d813e03          	ld	t3,216(sp)
    80007790:	0e013e83          	ld	t4,224(sp)
    80007794:	0e813f03          	ld	t5,232(sp)
    80007798:	0f013f83          	ld	t6,240(sp)
    8000779c:	10010113          	addi	sp,sp,256
    800077a0:	10200073          	sret
    800077a4:	00000013          	nop
    800077a8:	00000013          	nop
    800077ac:	00000013          	nop

00000000800077b0 <timervec>:
    800077b0:	34051573          	csrrw	a0,mscratch,a0
    800077b4:	00b53023          	sd	a1,0(a0)
    800077b8:	00c53423          	sd	a2,8(a0)
    800077bc:	00d53823          	sd	a3,16(a0)
    800077c0:	01853583          	ld	a1,24(a0)
    800077c4:	02053603          	ld	a2,32(a0)
    800077c8:	0005b683          	ld	a3,0(a1)
    800077cc:	00c686b3          	add	a3,a3,a2
    800077d0:	00d5b023          	sd	a3,0(a1)
    800077d4:	00200593          	li	a1,2
    800077d8:	14459073          	csrw	sip,a1
    800077dc:	01053683          	ld	a3,16(a0)
    800077e0:	00853603          	ld	a2,8(a0)
    800077e4:	00053583          	ld	a1,0(a0)
    800077e8:	34051573          	csrrw	a0,mscratch,a0
    800077ec:	30200073          	mret

00000000800077f0 <plicinit>:
    800077f0:	ff010113          	addi	sp,sp,-16
    800077f4:	00813423          	sd	s0,8(sp)
    800077f8:	01010413          	addi	s0,sp,16
    800077fc:	00813403          	ld	s0,8(sp)
    80007800:	0c0007b7          	lui	a5,0xc000
    80007804:	00100713          	li	a4,1
    80007808:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000780c:	00e7a223          	sw	a4,4(a5)
    80007810:	01010113          	addi	sp,sp,16
    80007814:	00008067          	ret

0000000080007818 <plicinithart>:
    80007818:	ff010113          	addi	sp,sp,-16
    8000781c:	00813023          	sd	s0,0(sp)
    80007820:	00113423          	sd	ra,8(sp)
    80007824:	01010413          	addi	s0,sp,16
    80007828:	00000097          	auipc	ra,0x0
    8000782c:	a48080e7          	jalr	-1464(ra) # 80007270 <cpuid>
    80007830:	0085171b          	slliw	a4,a0,0x8
    80007834:	0c0027b7          	lui	a5,0xc002
    80007838:	00e787b3          	add	a5,a5,a4
    8000783c:	40200713          	li	a4,1026
    80007840:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007844:	00813083          	ld	ra,8(sp)
    80007848:	00013403          	ld	s0,0(sp)
    8000784c:	00d5151b          	slliw	a0,a0,0xd
    80007850:	0c2017b7          	lui	a5,0xc201
    80007854:	00a78533          	add	a0,a5,a0
    80007858:	00052023          	sw	zero,0(a0)
    8000785c:	01010113          	addi	sp,sp,16
    80007860:	00008067          	ret

0000000080007864 <plic_claim>:
    80007864:	ff010113          	addi	sp,sp,-16
    80007868:	00813023          	sd	s0,0(sp)
    8000786c:	00113423          	sd	ra,8(sp)
    80007870:	01010413          	addi	s0,sp,16
    80007874:	00000097          	auipc	ra,0x0
    80007878:	9fc080e7          	jalr	-1540(ra) # 80007270 <cpuid>
    8000787c:	00813083          	ld	ra,8(sp)
    80007880:	00013403          	ld	s0,0(sp)
    80007884:	00d5151b          	slliw	a0,a0,0xd
    80007888:	0c2017b7          	lui	a5,0xc201
    8000788c:	00a78533          	add	a0,a5,a0
    80007890:	00452503          	lw	a0,4(a0)
    80007894:	01010113          	addi	sp,sp,16
    80007898:	00008067          	ret

000000008000789c <plic_complete>:
    8000789c:	fe010113          	addi	sp,sp,-32
    800078a0:	00813823          	sd	s0,16(sp)
    800078a4:	00913423          	sd	s1,8(sp)
    800078a8:	00113c23          	sd	ra,24(sp)
    800078ac:	02010413          	addi	s0,sp,32
    800078b0:	00050493          	mv	s1,a0
    800078b4:	00000097          	auipc	ra,0x0
    800078b8:	9bc080e7          	jalr	-1604(ra) # 80007270 <cpuid>
    800078bc:	01813083          	ld	ra,24(sp)
    800078c0:	01013403          	ld	s0,16(sp)
    800078c4:	00d5179b          	slliw	a5,a0,0xd
    800078c8:	0c201737          	lui	a4,0xc201
    800078cc:	00f707b3          	add	a5,a4,a5
    800078d0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800078d4:	00813483          	ld	s1,8(sp)
    800078d8:	02010113          	addi	sp,sp,32
    800078dc:	00008067          	ret

00000000800078e0 <consolewrite>:
    800078e0:	fb010113          	addi	sp,sp,-80
    800078e4:	04813023          	sd	s0,64(sp)
    800078e8:	04113423          	sd	ra,72(sp)
    800078ec:	02913c23          	sd	s1,56(sp)
    800078f0:	03213823          	sd	s2,48(sp)
    800078f4:	03313423          	sd	s3,40(sp)
    800078f8:	03413023          	sd	s4,32(sp)
    800078fc:	01513c23          	sd	s5,24(sp)
    80007900:	05010413          	addi	s0,sp,80
    80007904:	06c05c63          	blez	a2,8000797c <consolewrite+0x9c>
    80007908:	00060993          	mv	s3,a2
    8000790c:	00050a13          	mv	s4,a0
    80007910:	00058493          	mv	s1,a1
    80007914:	00000913          	li	s2,0
    80007918:	fff00a93          	li	s5,-1
    8000791c:	01c0006f          	j	80007938 <consolewrite+0x58>
    80007920:	fbf44503          	lbu	a0,-65(s0)
    80007924:	0019091b          	addiw	s2,s2,1
    80007928:	00148493          	addi	s1,s1,1
    8000792c:	00001097          	auipc	ra,0x1
    80007930:	a9c080e7          	jalr	-1380(ra) # 800083c8 <uartputc>
    80007934:	03298063          	beq	s3,s2,80007954 <consolewrite+0x74>
    80007938:	00048613          	mv	a2,s1
    8000793c:	00100693          	li	a3,1
    80007940:	000a0593          	mv	a1,s4
    80007944:	fbf40513          	addi	a0,s0,-65
    80007948:	00000097          	auipc	ra,0x0
    8000794c:	9e0080e7          	jalr	-1568(ra) # 80007328 <either_copyin>
    80007950:	fd5518e3          	bne	a0,s5,80007920 <consolewrite+0x40>
    80007954:	04813083          	ld	ra,72(sp)
    80007958:	04013403          	ld	s0,64(sp)
    8000795c:	03813483          	ld	s1,56(sp)
    80007960:	02813983          	ld	s3,40(sp)
    80007964:	02013a03          	ld	s4,32(sp)
    80007968:	01813a83          	ld	s5,24(sp)
    8000796c:	00090513          	mv	a0,s2
    80007970:	03013903          	ld	s2,48(sp)
    80007974:	05010113          	addi	sp,sp,80
    80007978:	00008067          	ret
    8000797c:	00000913          	li	s2,0
    80007980:	fd5ff06f          	j	80007954 <consolewrite+0x74>

0000000080007984 <consoleread>:
    80007984:	f9010113          	addi	sp,sp,-112
    80007988:	06813023          	sd	s0,96(sp)
    8000798c:	04913c23          	sd	s1,88(sp)
    80007990:	05213823          	sd	s2,80(sp)
    80007994:	05313423          	sd	s3,72(sp)
    80007998:	05413023          	sd	s4,64(sp)
    8000799c:	03513c23          	sd	s5,56(sp)
    800079a0:	03613823          	sd	s6,48(sp)
    800079a4:	03713423          	sd	s7,40(sp)
    800079a8:	03813023          	sd	s8,32(sp)
    800079ac:	06113423          	sd	ra,104(sp)
    800079b0:	01913c23          	sd	s9,24(sp)
    800079b4:	07010413          	addi	s0,sp,112
    800079b8:	00060b93          	mv	s7,a2
    800079bc:	00050913          	mv	s2,a0
    800079c0:	00058c13          	mv	s8,a1
    800079c4:	00060b1b          	sext.w	s6,a2
    800079c8:	00006497          	auipc	s1,0x6
    800079cc:	04048493          	addi	s1,s1,64 # 8000da08 <cons>
    800079d0:	00400993          	li	s3,4
    800079d4:	fff00a13          	li	s4,-1
    800079d8:	00a00a93          	li	s5,10
    800079dc:	05705e63          	blez	s7,80007a38 <consoleread+0xb4>
    800079e0:	09c4a703          	lw	a4,156(s1)
    800079e4:	0984a783          	lw	a5,152(s1)
    800079e8:	0007071b          	sext.w	a4,a4
    800079ec:	08e78463          	beq	a5,a4,80007a74 <consoleread+0xf0>
    800079f0:	07f7f713          	andi	a4,a5,127
    800079f4:	00e48733          	add	a4,s1,a4
    800079f8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800079fc:	0017869b          	addiw	a3,a5,1
    80007a00:	08d4ac23          	sw	a3,152(s1)
    80007a04:	00070c9b          	sext.w	s9,a4
    80007a08:	0b370663          	beq	a4,s3,80007ab4 <consoleread+0x130>
    80007a0c:	00100693          	li	a3,1
    80007a10:	f9f40613          	addi	a2,s0,-97
    80007a14:	000c0593          	mv	a1,s8
    80007a18:	00090513          	mv	a0,s2
    80007a1c:	f8e40fa3          	sb	a4,-97(s0)
    80007a20:	00000097          	auipc	ra,0x0
    80007a24:	8bc080e7          	jalr	-1860(ra) # 800072dc <either_copyout>
    80007a28:	01450863          	beq	a0,s4,80007a38 <consoleread+0xb4>
    80007a2c:	001c0c13          	addi	s8,s8,1
    80007a30:	fffb8b9b          	addiw	s7,s7,-1
    80007a34:	fb5c94e3          	bne	s9,s5,800079dc <consoleread+0x58>
    80007a38:	000b851b          	sext.w	a0,s7
    80007a3c:	06813083          	ld	ra,104(sp)
    80007a40:	06013403          	ld	s0,96(sp)
    80007a44:	05813483          	ld	s1,88(sp)
    80007a48:	05013903          	ld	s2,80(sp)
    80007a4c:	04813983          	ld	s3,72(sp)
    80007a50:	04013a03          	ld	s4,64(sp)
    80007a54:	03813a83          	ld	s5,56(sp)
    80007a58:	02813b83          	ld	s7,40(sp)
    80007a5c:	02013c03          	ld	s8,32(sp)
    80007a60:	01813c83          	ld	s9,24(sp)
    80007a64:	40ab053b          	subw	a0,s6,a0
    80007a68:	03013b03          	ld	s6,48(sp)
    80007a6c:	07010113          	addi	sp,sp,112
    80007a70:	00008067          	ret
    80007a74:	00001097          	auipc	ra,0x1
    80007a78:	1d8080e7          	jalr	472(ra) # 80008c4c <push_on>
    80007a7c:	0984a703          	lw	a4,152(s1)
    80007a80:	09c4a783          	lw	a5,156(s1)
    80007a84:	0007879b          	sext.w	a5,a5
    80007a88:	fef70ce3          	beq	a4,a5,80007a80 <consoleread+0xfc>
    80007a8c:	00001097          	auipc	ra,0x1
    80007a90:	234080e7          	jalr	564(ra) # 80008cc0 <pop_on>
    80007a94:	0984a783          	lw	a5,152(s1)
    80007a98:	07f7f713          	andi	a4,a5,127
    80007a9c:	00e48733          	add	a4,s1,a4
    80007aa0:	01874703          	lbu	a4,24(a4)
    80007aa4:	0017869b          	addiw	a3,a5,1
    80007aa8:	08d4ac23          	sw	a3,152(s1)
    80007aac:	00070c9b          	sext.w	s9,a4
    80007ab0:	f5371ee3          	bne	a4,s3,80007a0c <consoleread+0x88>
    80007ab4:	000b851b          	sext.w	a0,s7
    80007ab8:	f96bf2e3          	bgeu	s7,s6,80007a3c <consoleread+0xb8>
    80007abc:	08f4ac23          	sw	a5,152(s1)
    80007ac0:	f7dff06f          	j	80007a3c <consoleread+0xb8>

0000000080007ac4 <consputc>:
    80007ac4:	10000793          	li	a5,256
    80007ac8:	00f50663          	beq	a0,a5,80007ad4 <consputc+0x10>
    80007acc:	00001317          	auipc	t1,0x1
    80007ad0:	9f430067          	jr	-1548(t1) # 800084c0 <uartputc_sync>
    80007ad4:	ff010113          	addi	sp,sp,-16
    80007ad8:	00113423          	sd	ra,8(sp)
    80007adc:	00813023          	sd	s0,0(sp)
    80007ae0:	01010413          	addi	s0,sp,16
    80007ae4:	00800513          	li	a0,8
    80007ae8:	00001097          	auipc	ra,0x1
    80007aec:	9d8080e7          	jalr	-1576(ra) # 800084c0 <uartputc_sync>
    80007af0:	02000513          	li	a0,32
    80007af4:	00001097          	auipc	ra,0x1
    80007af8:	9cc080e7          	jalr	-1588(ra) # 800084c0 <uartputc_sync>
    80007afc:	00013403          	ld	s0,0(sp)
    80007b00:	00813083          	ld	ra,8(sp)
    80007b04:	00800513          	li	a0,8
    80007b08:	01010113          	addi	sp,sp,16
    80007b0c:	00001317          	auipc	t1,0x1
    80007b10:	9b430067          	jr	-1612(t1) # 800084c0 <uartputc_sync>

0000000080007b14 <consoleintr>:
    80007b14:	fe010113          	addi	sp,sp,-32
    80007b18:	00813823          	sd	s0,16(sp)
    80007b1c:	00913423          	sd	s1,8(sp)
    80007b20:	01213023          	sd	s2,0(sp)
    80007b24:	00113c23          	sd	ra,24(sp)
    80007b28:	02010413          	addi	s0,sp,32
    80007b2c:	00006917          	auipc	s2,0x6
    80007b30:	edc90913          	addi	s2,s2,-292 # 8000da08 <cons>
    80007b34:	00050493          	mv	s1,a0
    80007b38:	00090513          	mv	a0,s2
    80007b3c:	00001097          	auipc	ra,0x1
    80007b40:	e40080e7          	jalr	-448(ra) # 8000897c <acquire>
    80007b44:	02048c63          	beqz	s1,80007b7c <consoleintr+0x68>
    80007b48:	0a092783          	lw	a5,160(s2)
    80007b4c:	09892703          	lw	a4,152(s2)
    80007b50:	07f00693          	li	a3,127
    80007b54:	40e7873b          	subw	a4,a5,a4
    80007b58:	02e6e263          	bltu	a3,a4,80007b7c <consoleintr+0x68>
    80007b5c:	00d00713          	li	a4,13
    80007b60:	04e48063          	beq	s1,a4,80007ba0 <consoleintr+0x8c>
    80007b64:	07f7f713          	andi	a4,a5,127
    80007b68:	00e90733          	add	a4,s2,a4
    80007b6c:	0017879b          	addiw	a5,a5,1
    80007b70:	0af92023          	sw	a5,160(s2)
    80007b74:	00970c23          	sb	s1,24(a4)
    80007b78:	08f92e23          	sw	a5,156(s2)
    80007b7c:	01013403          	ld	s0,16(sp)
    80007b80:	01813083          	ld	ra,24(sp)
    80007b84:	00813483          	ld	s1,8(sp)
    80007b88:	00013903          	ld	s2,0(sp)
    80007b8c:	00006517          	auipc	a0,0x6
    80007b90:	e7c50513          	addi	a0,a0,-388 # 8000da08 <cons>
    80007b94:	02010113          	addi	sp,sp,32
    80007b98:	00001317          	auipc	t1,0x1
    80007b9c:	eb030067          	jr	-336(t1) # 80008a48 <release>
    80007ba0:	00a00493          	li	s1,10
    80007ba4:	fc1ff06f          	j	80007b64 <consoleintr+0x50>

0000000080007ba8 <consoleinit>:
    80007ba8:	fe010113          	addi	sp,sp,-32
    80007bac:	00113c23          	sd	ra,24(sp)
    80007bb0:	00813823          	sd	s0,16(sp)
    80007bb4:	00913423          	sd	s1,8(sp)
    80007bb8:	02010413          	addi	s0,sp,32
    80007bbc:	00006497          	auipc	s1,0x6
    80007bc0:	e4c48493          	addi	s1,s1,-436 # 8000da08 <cons>
    80007bc4:	00048513          	mv	a0,s1
    80007bc8:	00003597          	auipc	a1,0x3
    80007bcc:	a1058593          	addi	a1,a1,-1520 # 8000a5d8 <CONSOLE_STATUS+0x5c8>
    80007bd0:	00001097          	auipc	ra,0x1
    80007bd4:	d88080e7          	jalr	-632(ra) # 80008958 <initlock>
    80007bd8:	00000097          	auipc	ra,0x0
    80007bdc:	7ac080e7          	jalr	1964(ra) # 80008384 <uartinit>
    80007be0:	01813083          	ld	ra,24(sp)
    80007be4:	01013403          	ld	s0,16(sp)
    80007be8:	00000797          	auipc	a5,0x0
    80007bec:	d9c78793          	addi	a5,a5,-612 # 80007984 <consoleread>
    80007bf0:	0af4bc23          	sd	a5,184(s1)
    80007bf4:	00000797          	auipc	a5,0x0
    80007bf8:	cec78793          	addi	a5,a5,-788 # 800078e0 <consolewrite>
    80007bfc:	0cf4b023          	sd	a5,192(s1)
    80007c00:	00813483          	ld	s1,8(sp)
    80007c04:	02010113          	addi	sp,sp,32
    80007c08:	00008067          	ret

0000000080007c0c <console_read>:
    80007c0c:	ff010113          	addi	sp,sp,-16
    80007c10:	00813423          	sd	s0,8(sp)
    80007c14:	01010413          	addi	s0,sp,16
    80007c18:	00813403          	ld	s0,8(sp)
    80007c1c:	00006317          	auipc	t1,0x6
    80007c20:	ea433303          	ld	t1,-348(t1) # 8000dac0 <devsw+0x10>
    80007c24:	01010113          	addi	sp,sp,16
    80007c28:	00030067          	jr	t1

0000000080007c2c <console_write>:
    80007c2c:	ff010113          	addi	sp,sp,-16
    80007c30:	00813423          	sd	s0,8(sp)
    80007c34:	01010413          	addi	s0,sp,16
    80007c38:	00813403          	ld	s0,8(sp)
    80007c3c:	00006317          	auipc	t1,0x6
    80007c40:	e8c33303          	ld	t1,-372(t1) # 8000dac8 <devsw+0x18>
    80007c44:	01010113          	addi	sp,sp,16
    80007c48:	00030067          	jr	t1

0000000080007c4c <panic>:
    80007c4c:	fe010113          	addi	sp,sp,-32
    80007c50:	00113c23          	sd	ra,24(sp)
    80007c54:	00813823          	sd	s0,16(sp)
    80007c58:	00913423          	sd	s1,8(sp)
    80007c5c:	02010413          	addi	s0,sp,32
    80007c60:	00050493          	mv	s1,a0
    80007c64:	00003517          	auipc	a0,0x3
    80007c68:	97c50513          	addi	a0,a0,-1668 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    80007c6c:	00006797          	auipc	a5,0x6
    80007c70:	ee07ae23          	sw	zero,-260(a5) # 8000db68 <pr+0x18>
    80007c74:	00000097          	auipc	ra,0x0
    80007c78:	034080e7          	jalr	52(ra) # 80007ca8 <__printf>
    80007c7c:	00048513          	mv	a0,s1
    80007c80:	00000097          	auipc	ra,0x0
    80007c84:	028080e7          	jalr	40(ra) # 80007ca8 <__printf>
    80007c88:	00002517          	auipc	a0,0x2
    80007c8c:	4d850513          	addi	a0,a0,1240 # 8000a160 <CONSOLE_STATUS+0x150>
    80007c90:	00000097          	auipc	ra,0x0
    80007c94:	018080e7          	jalr	24(ra) # 80007ca8 <__printf>
    80007c98:	00100793          	li	a5,1
    80007c9c:	00005717          	auipc	a4,0x5
    80007ca0:	baf72e23          	sw	a5,-1092(a4) # 8000c858 <panicked>
    80007ca4:	0000006f          	j	80007ca4 <panic+0x58>

0000000080007ca8 <__printf>:
    80007ca8:	f3010113          	addi	sp,sp,-208
    80007cac:	08813023          	sd	s0,128(sp)
    80007cb0:	07313423          	sd	s3,104(sp)
    80007cb4:	09010413          	addi	s0,sp,144
    80007cb8:	05813023          	sd	s8,64(sp)
    80007cbc:	08113423          	sd	ra,136(sp)
    80007cc0:	06913c23          	sd	s1,120(sp)
    80007cc4:	07213823          	sd	s2,112(sp)
    80007cc8:	07413023          	sd	s4,96(sp)
    80007ccc:	05513c23          	sd	s5,88(sp)
    80007cd0:	05613823          	sd	s6,80(sp)
    80007cd4:	05713423          	sd	s7,72(sp)
    80007cd8:	03913c23          	sd	s9,56(sp)
    80007cdc:	03a13823          	sd	s10,48(sp)
    80007ce0:	03b13423          	sd	s11,40(sp)
    80007ce4:	00006317          	auipc	t1,0x6
    80007ce8:	e6c30313          	addi	t1,t1,-404 # 8000db50 <pr>
    80007cec:	01832c03          	lw	s8,24(t1)
    80007cf0:	00b43423          	sd	a1,8(s0)
    80007cf4:	00c43823          	sd	a2,16(s0)
    80007cf8:	00d43c23          	sd	a3,24(s0)
    80007cfc:	02e43023          	sd	a4,32(s0)
    80007d00:	02f43423          	sd	a5,40(s0)
    80007d04:	03043823          	sd	a6,48(s0)
    80007d08:	03143c23          	sd	a7,56(s0)
    80007d0c:	00050993          	mv	s3,a0
    80007d10:	4a0c1663          	bnez	s8,800081bc <__printf+0x514>
    80007d14:	60098c63          	beqz	s3,8000832c <__printf+0x684>
    80007d18:	0009c503          	lbu	a0,0(s3)
    80007d1c:	00840793          	addi	a5,s0,8
    80007d20:	f6f43c23          	sd	a5,-136(s0)
    80007d24:	00000493          	li	s1,0
    80007d28:	22050063          	beqz	a0,80007f48 <__printf+0x2a0>
    80007d2c:	00002a37          	lui	s4,0x2
    80007d30:	00018ab7          	lui	s5,0x18
    80007d34:	000f4b37          	lui	s6,0xf4
    80007d38:	00989bb7          	lui	s7,0x989
    80007d3c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007d40:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007d44:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007d48:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007d4c:	00148c9b          	addiw	s9,s1,1
    80007d50:	02500793          	li	a5,37
    80007d54:	01998933          	add	s2,s3,s9
    80007d58:	38f51263          	bne	a0,a5,800080dc <__printf+0x434>
    80007d5c:	00094783          	lbu	a5,0(s2)
    80007d60:	00078c9b          	sext.w	s9,a5
    80007d64:	1e078263          	beqz	a5,80007f48 <__printf+0x2a0>
    80007d68:	0024849b          	addiw	s1,s1,2
    80007d6c:	07000713          	li	a4,112
    80007d70:	00998933          	add	s2,s3,s1
    80007d74:	38e78a63          	beq	a5,a4,80008108 <__printf+0x460>
    80007d78:	20f76863          	bltu	a4,a5,80007f88 <__printf+0x2e0>
    80007d7c:	42a78863          	beq	a5,a0,800081ac <__printf+0x504>
    80007d80:	06400713          	li	a4,100
    80007d84:	40e79663          	bne	a5,a4,80008190 <__printf+0x4e8>
    80007d88:	f7843783          	ld	a5,-136(s0)
    80007d8c:	0007a603          	lw	a2,0(a5)
    80007d90:	00878793          	addi	a5,a5,8
    80007d94:	f6f43c23          	sd	a5,-136(s0)
    80007d98:	42064a63          	bltz	a2,800081cc <__printf+0x524>
    80007d9c:	00a00713          	li	a4,10
    80007da0:	02e677bb          	remuw	a5,a2,a4
    80007da4:	00003d97          	auipc	s11,0x3
    80007da8:	864d8d93          	addi	s11,s11,-1948 # 8000a608 <digits>
    80007dac:	00900593          	li	a1,9
    80007db0:	0006051b          	sext.w	a0,a2
    80007db4:	00000c93          	li	s9,0
    80007db8:	02079793          	slli	a5,a5,0x20
    80007dbc:	0207d793          	srli	a5,a5,0x20
    80007dc0:	00fd87b3          	add	a5,s11,a5
    80007dc4:	0007c783          	lbu	a5,0(a5)
    80007dc8:	02e656bb          	divuw	a3,a2,a4
    80007dcc:	f8f40023          	sb	a5,-128(s0)
    80007dd0:	14c5d863          	bge	a1,a2,80007f20 <__printf+0x278>
    80007dd4:	06300593          	li	a1,99
    80007dd8:	00100c93          	li	s9,1
    80007ddc:	02e6f7bb          	remuw	a5,a3,a4
    80007de0:	02079793          	slli	a5,a5,0x20
    80007de4:	0207d793          	srli	a5,a5,0x20
    80007de8:	00fd87b3          	add	a5,s11,a5
    80007dec:	0007c783          	lbu	a5,0(a5)
    80007df0:	02e6d73b          	divuw	a4,a3,a4
    80007df4:	f8f400a3          	sb	a5,-127(s0)
    80007df8:	12a5f463          	bgeu	a1,a0,80007f20 <__printf+0x278>
    80007dfc:	00a00693          	li	a3,10
    80007e00:	00900593          	li	a1,9
    80007e04:	02d777bb          	remuw	a5,a4,a3
    80007e08:	02079793          	slli	a5,a5,0x20
    80007e0c:	0207d793          	srli	a5,a5,0x20
    80007e10:	00fd87b3          	add	a5,s11,a5
    80007e14:	0007c503          	lbu	a0,0(a5)
    80007e18:	02d757bb          	divuw	a5,a4,a3
    80007e1c:	f8a40123          	sb	a0,-126(s0)
    80007e20:	48e5f263          	bgeu	a1,a4,800082a4 <__printf+0x5fc>
    80007e24:	06300513          	li	a0,99
    80007e28:	02d7f5bb          	remuw	a1,a5,a3
    80007e2c:	02059593          	slli	a1,a1,0x20
    80007e30:	0205d593          	srli	a1,a1,0x20
    80007e34:	00bd85b3          	add	a1,s11,a1
    80007e38:	0005c583          	lbu	a1,0(a1)
    80007e3c:	02d7d7bb          	divuw	a5,a5,a3
    80007e40:	f8b401a3          	sb	a1,-125(s0)
    80007e44:	48e57263          	bgeu	a0,a4,800082c8 <__printf+0x620>
    80007e48:	3e700513          	li	a0,999
    80007e4c:	02d7f5bb          	remuw	a1,a5,a3
    80007e50:	02059593          	slli	a1,a1,0x20
    80007e54:	0205d593          	srli	a1,a1,0x20
    80007e58:	00bd85b3          	add	a1,s11,a1
    80007e5c:	0005c583          	lbu	a1,0(a1)
    80007e60:	02d7d7bb          	divuw	a5,a5,a3
    80007e64:	f8b40223          	sb	a1,-124(s0)
    80007e68:	46e57663          	bgeu	a0,a4,800082d4 <__printf+0x62c>
    80007e6c:	02d7f5bb          	remuw	a1,a5,a3
    80007e70:	02059593          	slli	a1,a1,0x20
    80007e74:	0205d593          	srli	a1,a1,0x20
    80007e78:	00bd85b3          	add	a1,s11,a1
    80007e7c:	0005c583          	lbu	a1,0(a1)
    80007e80:	02d7d7bb          	divuw	a5,a5,a3
    80007e84:	f8b402a3          	sb	a1,-123(s0)
    80007e88:	46ea7863          	bgeu	s4,a4,800082f8 <__printf+0x650>
    80007e8c:	02d7f5bb          	remuw	a1,a5,a3
    80007e90:	02059593          	slli	a1,a1,0x20
    80007e94:	0205d593          	srli	a1,a1,0x20
    80007e98:	00bd85b3          	add	a1,s11,a1
    80007e9c:	0005c583          	lbu	a1,0(a1)
    80007ea0:	02d7d7bb          	divuw	a5,a5,a3
    80007ea4:	f8b40323          	sb	a1,-122(s0)
    80007ea8:	3eeaf863          	bgeu	s5,a4,80008298 <__printf+0x5f0>
    80007eac:	02d7f5bb          	remuw	a1,a5,a3
    80007eb0:	02059593          	slli	a1,a1,0x20
    80007eb4:	0205d593          	srli	a1,a1,0x20
    80007eb8:	00bd85b3          	add	a1,s11,a1
    80007ebc:	0005c583          	lbu	a1,0(a1)
    80007ec0:	02d7d7bb          	divuw	a5,a5,a3
    80007ec4:	f8b403a3          	sb	a1,-121(s0)
    80007ec8:	42eb7e63          	bgeu	s6,a4,80008304 <__printf+0x65c>
    80007ecc:	02d7f5bb          	remuw	a1,a5,a3
    80007ed0:	02059593          	slli	a1,a1,0x20
    80007ed4:	0205d593          	srli	a1,a1,0x20
    80007ed8:	00bd85b3          	add	a1,s11,a1
    80007edc:	0005c583          	lbu	a1,0(a1)
    80007ee0:	02d7d7bb          	divuw	a5,a5,a3
    80007ee4:	f8b40423          	sb	a1,-120(s0)
    80007ee8:	42ebfc63          	bgeu	s7,a4,80008320 <__printf+0x678>
    80007eec:	02079793          	slli	a5,a5,0x20
    80007ef0:	0207d793          	srli	a5,a5,0x20
    80007ef4:	00fd8db3          	add	s11,s11,a5
    80007ef8:	000dc703          	lbu	a4,0(s11)
    80007efc:	00a00793          	li	a5,10
    80007f00:	00900c93          	li	s9,9
    80007f04:	f8e404a3          	sb	a4,-119(s0)
    80007f08:	00065c63          	bgez	a2,80007f20 <__printf+0x278>
    80007f0c:	f9040713          	addi	a4,s0,-112
    80007f10:	00f70733          	add	a4,a4,a5
    80007f14:	02d00693          	li	a3,45
    80007f18:	fed70823          	sb	a3,-16(a4)
    80007f1c:	00078c93          	mv	s9,a5
    80007f20:	f8040793          	addi	a5,s0,-128
    80007f24:	01978cb3          	add	s9,a5,s9
    80007f28:	f7f40d13          	addi	s10,s0,-129
    80007f2c:	000cc503          	lbu	a0,0(s9)
    80007f30:	fffc8c93          	addi	s9,s9,-1
    80007f34:	00000097          	auipc	ra,0x0
    80007f38:	b90080e7          	jalr	-1136(ra) # 80007ac4 <consputc>
    80007f3c:	ffac98e3          	bne	s9,s10,80007f2c <__printf+0x284>
    80007f40:	00094503          	lbu	a0,0(s2)
    80007f44:	e00514e3          	bnez	a0,80007d4c <__printf+0xa4>
    80007f48:	1a0c1663          	bnez	s8,800080f4 <__printf+0x44c>
    80007f4c:	08813083          	ld	ra,136(sp)
    80007f50:	08013403          	ld	s0,128(sp)
    80007f54:	07813483          	ld	s1,120(sp)
    80007f58:	07013903          	ld	s2,112(sp)
    80007f5c:	06813983          	ld	s3,104(sp)
    80007f60:	06013a03          	ld	s4,96(sp)
    80007f64:	05813a83          	ld	s5,88(sp)
    80007f68:	05013b03          	ld	s6,80(sp)
    80007f6c:	04813b83          	ld	s7,72(sp)
    80007f70:	04013c03          	ld	s8,64(sp)
    80007f74:	03813c83          	ld	s9,56(sp)
    80007f78:	03013d03          	ld	s10,48(sp)
    80007f7c:	02813d83          	ld	s11,40(sp)
    80007f80:	0d010113          	addi	sp,sp,208
    80007f84:	00008067          	ret
    80007f88:	07300713          	li	a4,115
    80007f8c:	1ce78a63          	beq	a5,a4,80008160 <__printf+0x4b8>
    80007f90:	07800713          	li	a4,120
    80007f94:	1ee79e63          	bne	a5,a4,80008190 <__printf+0x4e8>
    80007f98:	f7843783          	ld	a5,-136(s0)
    80007f9c:	0007a703          	lw	a4,0(a5)
    80007fa0:	00878793          	addi	a5,a5,8
    80007fa4:	f6f43c23          	sd	a5,-136(s0)
    80007fa8:	28074263          	bltz	a4,8000822c <__printf+0x584>
    80007fac:	00002d97          	auipc	s11,0x2
    80007fb0:	65cd8d93          	addi	s11,s11,1628 # 8000a608 <digits>
    80007fb4:	00f77793          	andi	a5,a4,15
    80007fb8:	00fd87b3          	add	a5,s11,a5
    80007fbc:	0007c683          	lbu	a3,0(a5)
    80007fc0:	00f00613          	li	a2,15
    80007fc4:	0007079b          	sext.w	a5,a4
    80007fc8:	f8d40023          	sb	a3,-128(s0)
    80007fcc:	0047559b          	srliw	a1,a4,0x4
    80007fd0:	0047569b          	srliw	a3,a4,0x4
    80007fd4:	00000c93          	li	s9,0
    80007fd8:	0ee65063          	bge	a2,a4,800080b8 <__printf+0x410>
    80007fdc:	00f6f693          	andi	a3,a3,15
    80007fe0:	00dd86b3          	add	a3,s11,a3
    80007fe4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007fe8:	0087d79b          	srliw	a5,a5,0x8
    80007fec:	00100c93          	li	s9,1
    80007ff0:	f8d400a3          	sb	a3,-127(s0)
    80007ff4:	0cb67263          	bgeu	a2,a1,800080b8 <__printf+0x410>
    80007ff8:	00f7f693          	andi	a3,a5,15
    80007ffc:	00dd86b3          	add	a3,s11,a3
    80008000:	0006c583          	lbu	a1,0(a3)
    80008004:	00f00613          	li	a2,15
    80008008:	0047d69b          	srliw	a3,a5,0x4
    8000800c:	f8b40123          	sb	a1,-126(s0)
    80008010:	0047d593          	srli	a1,a5,0x4
    80008014:	28f67e63          	bgeu	a2,a5,800082b0 <__printf+0x608>
    80008018:	00f6f693          	andi	a3,a3,15
    8000801c:	00dd86b3          	add	a3,s11,a3
    80008020:	0006c503          	lbu	a0,0(a3)
    80008024:	0087d813          	srli	a6,a5,0x8
    80008028:	0087d69b          	srliw	a3,a5,0x8
    8000802c:	f8a401a3          	sb	a0,-125(s0)
    80008030:	28b67663          	bgeu	a2,a1,800082bc <__printf+0x614>
    80008034:	00f6f693          	andi	a3,a3,15
    80008038:	00dd86b3          	add	a3,s11,a3
    8000803c:	0006c583          	lbu	a1,0(a3)
    80008040:	00c7d513          	srli	a0,a5,0xc
    80008044:	00c7d69b          	srliw	a3,a5,0xc
    80008048:	f8b40223          	sb	a1,-124(s0)
    8000804c:	29067a63          	bgeu	a2,a6,800082e0 <__printf+0x638>
    80008050:	00f6f693          	andi	a3,a3,15
    80008054:	00dd86b3          	add	a3,s11,a3
    80008058:	0006c583          	lbu	a1,0(a3)
    8000805c:	0107d813          	srli	a6,a5,0x10
    80008060:	0107d69b          	srliw	a3,a5,0x10
    80008064:	f8b402a3          	sb	a1,-123(s0)
    80008068:	28a67263          	bgeu	a2,a0,800082ec <__printf+0x644>
    8000806c:	00f6f693          	andi	a3,a3,15
    80008070:	00dd86b3          	add	a3,s11,a3
    80008074:	0006c683          	lbu	a3,0(a3)
    80008078:	0147d79b          	srliw	a5,a5,0x14
    8000807c:	f8d40323          	sb	a3,-122(s0)
    80008080:	21067663          	bgeu	a2,a6,8000828c <__printf+0x5e4>
    80008084:	02079793          	slli	a5,a5,0x20
    80008088:	0207d793          	srli	a5,a5,0x20
    8000808c:	00fd8db3          	add	s11,s11,a5
    80008090:	000dc683          	lbu	a3,0(s11)
    80008094:	00800793          	li	a5,8
    80008098:	00700c93          	li	s9,7
    8000809c:	f8d403a3          	sb	a3,-121(s0)
    800080a0:	00075c63          	bgez	a4,800080b8 <__printf+0x410>
    800080a4:	f9040713          	addi	a4,s0,-112
    800080a8:	00f70733          	add	a4,a4,a5
    800080ac:	02d00693          	li	a3,45
    800080b0:	fed70823          	sb	a3,-16(a4)
    800080b4:	00078c93          	mv	s9,a5
    800080b8:	f8040793          	addi	a5,s0,-128
    800080bc:	01978cb3          	add	s9,a5,s9
    800080c0:	f7f40d13          	addi	s10,s0,-129
    800080c4:	000cc503          	lbu	a0,0(s9)
    800080c8:	fffc8c93          	addi	s9,s9,-1
    800080cc:	00000097          	auipc	ra,0x0
    800080d0:	9f8080e7          	jalr	-1544(ra) # 80007ac4 <consputc>
    800080d4:	ff9d18e3          	bne	s10,s9,800080c4 <__printf+0x41c>
    800080d8:	0100006f          	j	800080e8 <__printf+0x440>
    800080dc:	00000097          	auipc	ra,0x0
    800080e0:	9e8080e7          	jalr	-1560(ra) # 80007ac4 <consputc>
    800080e4:	000c8493          	mv	s1,s9
    800080e8:	00094503          	lbu	a0,0(s2)
    800080ec:	c60510e3          	bnez	a0,80007d4c <__printf+0xa4>
    800080f0:	e40c0ee3          	beqz	s8,80007f4c <__printf+0x2a4>
    800080f4:	00006517          	auipc	a0,0x6
    800080f8:	a5c50513          	addi	a0,a0,-1444 # 8000db50 <pr>
    800080fc:	00001097          	auipc	ra,0x1
    80008100:	94c080e7          	jalr	-1716(ra) # 80008a48 <release>
    80008104:	e49ff06f          	j	80007f4c <__printf+0x2a4>
    80008108:	f7843783          	ld	a5,-136(s0)
    8000810c:	03000513          	li	a0,48
    80008110:	01000d13          	li	s10,16
    80008114:	00878713          	addi	a4,a5,8
    80008118:	0007bc83          	ld	s9,0(a5)
    8000811c:	f6e43c23          	sd	a4,-136(s0)
    80008120:	00000097          	auipc	ra,0x0
    80008124:	9a4080e7          	jalr	-1628(ra) # 80007ac4 <consputc>
    80008128:	07800513          	li	a0,120
    8000812c:	00000097          	auipc	ra,0x0
    80008130:	998080e7          	jalr	-1640(ra) # 80007ac4 <consputc>
    80008134:	00002d97          	auipc	s11,0x2
    80008138:	4d4d8d93          	addi	s11,s11,1236 # 8000a608 <digits>
    8000813c:	03ccd793          	srli	a5,s9,0x3c
    80008140:	00fd87b3          	add	a5,s11,a5
    80008144:	0007c503          	lbu	a0,0(a5)
    80008148:	fffd0d1b          	addiw	s10,s10,-1
    8000814c:	004c9c93          	slli	s9,s9,0x4
    80008150:	00000097          	auipc	ra,0x0
    80008154:	974080e7          	jalr	-1676(ra) # 80007ac4 <consputc>
    80008158:	fe0d12e3          	bnez	s10,8000813c <__printf+0x494>
    8000815c:	f8dff06f          	j	800080e8 <__printf+0x440>
    80008160:	f7843783          	ld	a5,-136(s0)
    80008164:	0007bc83          	ld	s9,0(a5)
    80008168:	00878793          	addi	a5,a5,8
    8000816c:	f6f43c23          	sd	a5,-136(s0)
    80008170:	000c9a63          	bnez	s9,80008184 <__printf+0x4dc>
    80008174:	1080006f          	j	8000827c <__printf+0x5d4>
    80008178:	001c8c93          	addi	s9,s9,1
    8000817c:	00000097          	auipc	ra,0x0
    80008180:	948080e7          	jalr	-1720(ra) # 80007ac4 <consputc>
    80008184:	000cc503          	lbu	a0,0(s9)
    80008188:	fe0518e3          	bnez	a0,80008178 <__printf+0x4d0>
    8000818c:	f5dff06f          	j	800080e8 <__printf+0x440>
    80008190:	02500513          	li	a0,37
    80008194:	00000097          	auipc	ra,0x0
    80008198:	930080e7          	jalr	-1744(ra) # 80007ac4 <consputc>
    8000819c:	000c8513          	mv	a0,s9
    800081a0:	00000097          	auipc	ra,0x0
    800081a4:	924080e7          	jalr	-1756(ra) # 80007ac4 <consputc>
    800081a8:	f41ff06f          	j	800080e8 <__printf+0x440>
    800081ac:	02500513          	li	a0,37
    800081b0:	00000097          	auipc	ra,0x0
    800081b4:	914080e7          	jalr	-1772(ra) # 80007ac4 <consputc>
    800081b8:	f31ff06f          	j	800080e8 <__printf+0x440>
    800081bc:	00030513          	mv	a0,t1
    800081c0:	00000097          	auipc	ra,0x0
    800081c4:	7bc080e7          	jalr	1980(ra) # 8000897c <acquire>
    800081c8:	b4dff06f          	j	80007d14 <__printf+0x6c>
    800081cc:	40c0053b          	negw	a0,a2
    800081d0:	00a00713          	li	a4,10
    800081d4:	02e576bb          	remuw	a3,a0,a4
    800081d8:	00002d97          	auipc	s11,0x2
    800081dc:	430d8d93          	addi	s11,s11,1072 # 8000a608 <digits>
    800081e0:	ff700593          	li	a1,-9
    800081e4:	02069693          	slli	a3,a3,0x20
    800081e8:	0206d693          	srli	a3,a3,0x20
    800081ec:	00dd86b3          	add	a3,s11,a3
    800081f0:	0006c683          	lbu	a3,0(a3)
    800081f4:	02e557bb          	divuw	a5,a0,a4
    800081f8:	f8d40023          	sb	a3,-128(s0)
    800081fc:	10b65e63          	bge	a2,a1,80008318 <__printf+0x670>
    80008200:	06300593          	li	a1,99
    80008204:	02e7f6bb          	remuw	a3,a5,a4
    80008208:	02069693          	slli	a3,a3,0x20
    8000820c:	0206d693          	srli	a3,a3,0x20
    80008210:	00dd86b3          	add	a3,s11,a3
    80008214:	0006c683          	lbu	a3,0(a3)
    80008218:	02e7d73b          	divuw	a4,a5,a4
    8000821c:	00200793          	li	a5,2
    80008220:	f8d400a3          	sb	a3,-127(s0)
    80008224:	bca5ece3          	bltu	a1,a0,80007dfc <__printf+0x154>
    80008228:	ce5ff06f          	j	80007f0c <__printf+0x264>
    8000822c:	40e007bb          	negw	a5,a4
    80008230:	00002d97          	auipc	s11,0x2
    80008234:	3d8d8d93          	addi	s11,s11,984 # 8000a608 <digits>
    80008238:	00f7f693          	andi	a3,a5,15
    8000823c:	00dd86b3          	add	a3,s11,a3
    80008240:	0006c583          	lbu	a1,0(a3)
    80008244:	ff100613          	li	a2,-15
    80008248:	0047d69b          	srliw	a3,a5,0x4
    8000824c:	f8b40023          	sb	a1,-128(s0)
    80008250:	0047d59b          	srliw	a1,a5,0x4
    80008254:	0ac75e63          	bge	a4,a2,80008310 <__printf+0x668>
    80008258:	00f6f693          	andi	a3,a3,15
    8000825c:	00dd86b3          	add	a3,s11,a3
    80008260:	0006c603          	lbu	a2,0(a3)
    80008264:	00f00693          	li	a3,15
    80008268:	0087d79b          	srliw	a5,a5,0x8
    8000826c:	f8c400a3          	sb	a2,-127(s0)
    80008270:	d8b6e4e3          	bltu	a3,a1,80007ff8 <__printf+0x350>
    80008274:	00200793          	li	a5,2
    80008278:	e2dff06f          	j	800080a4 <__printf+0x3fc>
    8000827c:	00002c97          	auipc	s9,0x2
    80008280:	36cc8c93          	addi	s9,s9,876 # 8000a5e8 <CONSOLE_STATUS+0x5d8>
    80008284:	02800513          	li	a0,40
    80008288:	ef1ff06f          	j	80008178 <__printf+0x4d0>
    8000828c:	00700793          	li	a5,7
    80008290:	00600c93          	li	s9,6
    80008294:	e0dff06f          	j	800080a0 <__printf+0x3f8>
    80008298:	00700793          	li	a5,7
    8000829c:	00600c93          	li	s9,6
    800082a0:	c69ff06f          	j	80007f08 <__printf+0x260>
    800082a4:	00300793          	li	a5,3
    800082a8:	00200c93          	li	s9,2
    800082ac:	c5dff06f          	j	80007f08 <__printf+0x260>
    800082b0:	00300793          	li	a5,3
    800082b4:	00200c93          	li	s9,2
    800082b8:	de9ff06f          	j	800080a0 <__printf+0x3f8>
    800082bc:	00400793          	li	a5,4
    800082c0:	00300c93          	li	s9,3
    800082c4:	dddff06f          	j	800080a0 <__printf+0x3f8>
    800082c8:	00400793          	li	a5,4
    800082cc:	00300c93          	li	s9,3
    800082d0:	c39ff06f          	j	80007f08 <__printf+0x260>
    800082d4:	00500793          	li	a5,5
    800082d8:	00400c93          	li	s9,4
    800082dc:	c2dff06f          	j	80007f08 <__printf+0x260>
    800082e0:	00500793          	li	a5,5
    800082e4:	00400c93          	li	s9,4
    800082e8:	db9ff06f          	j	800080a0 <__printf+0x3f8>
    800082ec:	00600793          	li	a5,6
    800082f0:	00500c93          	li	s9,5
    800082f4:	dadff06f          	j	800080a0 <__printf+0x3f8>
    800082f8:	00600793          	li	a5,6
    800082fc:	00500c93          	li	s9,5
    80008300:	c09ff06f          	j	80007f08 <__printf+0x260>
    80008304:	00800793          	li	a5,8
    80008308:	00700c93          	li	s9,7
    8000830c:	bfdff06f          	j	80007f08 <__printf+0x260>
    80008310:	00100793          	li	a5,1
    80008314:	d91ff06f          	j	800080a4 <__printf+0x3fc>
    80008318:	00100793          	li	a5,1
    8000831c:	bf1ff06f          	j	80007f0c <__printf+0x264>
    80008320:	00900793          	li	a5,9
    80008324:	00800c93          	li	s9,8
    80008328:	be1ff06f          	j	80007f08 <__printf+0x260>
    8000832c:	00002517          	auipc	a0,0x2
    80008330:	2c450513          	addi	a0,a0,708 # 8000a5f0 <CONSOLE_STATUS+0x5e0>
    80008334:	00000097          	auipc	ra,0x0
    80008338:	918080e7          	jalr	-1768(ra) # 80007c4c <panic>

000000008000833c <printfinit>:
    8000833c:	fe010113          	addi	sp,sp,-32
    80008340:	00813823          	sd	s0,16(sp)
    80008344:	00913423          	sd	s1,8(sp)
    80008348:	00113c23          	sd	ra,24(sp)
    8000834c:	02010413          	addi	s0,sp,32
    80008350:	00006497          	auipc	s1,0x6
    80008354:	80048493          	addi	s1,s1,-2048 # 8000db50 <pr>
    80008358:	00048513          	mv	a0,s1
    8000835c:	00002597          	auipc	a1,0x2
    80008360:	2a458593          	addi	a1,a1,676 # 8000a600 <CONSOLE_STATUS+0x5f0>
    80008364:	00000097          	auipc	ra,0x0
    80008368:	5f4080e7          	jalr	1524(ra) # 80008958 <initlock>
    8000836c:	01813083          	ld	ra,24(sp)
    80008370:	01013403          	ld	s0,16(sp)
    80008374:	0004ac23          	sw	zero,24(s1)
    80008378:	00813483          	ld	s1,8(sp)
    8000837c:	02010113          	addi	sp,sp,32
    80008380:	00008067          	ret

0000000080008384 <uartinit>:
    80008384:	ff010113          	addi	sp,sp,-16
    80008388:	00813423          	sd	s0,8(sp)
    8000838c:	01010413          	addi	s0,sp,16
    80008390:	100007b7          	lui	a5,0x10000
    80008394:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008398:	f8000713          	li	a4,-128
    8000839c:	00e781a3          	sb	a4,3(a5)
    800083a0:	00300713          	li	a4,3
    800083a4:	00e78023          	sb	a4,0(a5)
    800083a8:	000780a3          	sb	zero,1(a5)
    800083ac:	00e781a3          	sb	a4,3(a5)
    800083b0:	00700693          	li	a3,7
    800083b4:	00d78123          	sb	a3,2(a5)
    800083b8:	00e780a3          	sb	a4,1(a5)
    800083bc:	00813403          	ld	s0,8(sp)
    800083c0:	01010113          	addi	sp,sp,16
    800083c4:	00008067          	ret

00000000800083c8 <uartputc>:
    800083c8:	00004797          	auipc	a5,0x4
    800083cc:	4907a783          	lw	a5,1168(a5) # 8000c858 <panicked>
    800083d0:	00078463          	beqz	a5,800083d8 <uartputc+0x10>
    800083d4:	0000006f          	j	800083d4 <uartputc+0xc>
    800083d8:	fd010113          	addi	sp,sp,-48
    800083dc:	02813023          	sd	s0,32(sp)
    800083e0:	00913c23          	sd	s1,24(sp)
    800083e4:	01213823          	sd	s2,16(sp)
    800083e8:	01313423          	sd	s3,8(sp)
    800083ec:	02113423          	sd	ra,40(sp)
    800083f0:	03010413          	addi	s0,sp,48
    800083f4:	00004917          	auipc	s2,0x4
    800083f8:	46c90913          	addi	s2,s2,1132 # 8000c860 <uart_tx_r>
    800083fc:	00093783          	ld	a5,0(s2)
    80008400:	00004497          	auipc	s1,0x4
    80008404:	46848493          	addi	s1,s1,1128 # 8000c868 <uart_tx_w>
    80008408:	0004b703          	ld	a4,0(s1)
    8000840c:	02078693          	addi	a3,a5,32
    80008410:	00050993          	mv	s3,a0
    80008414:	02e69c63          	bne	a3,a4,8000844c <uartputc+0x84>
    80008418:	00001097          	auipc	ra,0x1
    8000841c:	834080e7          	jalr	-1996(ra) # 80008c4c <push_on>
    80008420:	00093783          	ld	a5,0(s2)
    80008424:	0004b703          	ld	a4,0(s1)
    80008428:	02078793          	addi	a5,a5,32
    8000842c:	00e79463          	bne	a5,a4,80008434 <uartputc+0x6c>
    80008430:	0000006f          	j	80008430 <uartputc+0x68>
    80008434:	00001097          	auipc	ra,0x1
    80008438:	88c080e7          	jalr	-1908(ra) # 80008cc0 <pop_on>
    8000843c:	00093783          	ld	a5,0(s2)
    80008440:	0004b703          	ld	a4,0(s1)
    80008444:	02078693          	addi	a3,a5,32
    80008448:	fce688e3          	beq	a3,a4,80008418 <uartputc+0x50>
    8000844c:	01f77693          	andi	a3,a4,31
    80008450:	00005597          	auipc	a1,0x5
    80008454:	72058593          	addi	a1,a1,1824 # 8000db70 <uart_tx_buf>
    80008458:	00d586b3          	add	a3,a1,a3
    8000845c:	00170713          	addi	a4,a4,1
    80008460:	01368023          	sb	s3,0(a3)
    80008464:	00e4b023          	sd	a4,0(s1)
    80008468:	10000637          	lui	a2,0x10000
    8000846c:	02f71063          	bne	a4,a5,8000848c <uartputc+0xc4>
    80008470:	0340006f          	j	800084a4 <uartputc+0xdc>
    80008474:	00074703          	lbu	a4,0(a4)
    80008478:	00f93023          	sd	a5,0(s2)
    8000847c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008480:	00093783          	ld	a5,0(s2)
    80008484:	0004b703          	ld	a4,0(s1)
    80008488:	00f70e63          	beq	a4,a5,800084a4 <uartputc+0xdc>
    8000848c:	00564683          	lbu	a3,5(a2)
    80008490:	01f7f713          	andi	a4,a5,31
    80008494:	00e58733          	add	a4,a1,a4
    80008498:	0206f693          	andi	a3,a3,32
    8000849c:	00178793          	addi	a5,a5,1
    800084a0:	fc069ae3          	bnez	a3,80008474 <uartputc+0xac>
    800084a4:	02813083          	ld	ra,40(sp)
    800084a8:	02013403          	ld	s0,32(sp)
    800084ac:	01813483          	ld	s1,24(sp)
    800084b0:	01013903          	ld	s2,16(sp)
    800084b4:	00813983          	ld	s3,8(sp)
    800084b8:	03010113          	addi	sp,sp,48
    800084bc:	00008067          	ret

00000000800084c0 <uartputc_sync>:
    800084c0:	ff010113          	addi	sp,sp,-16
    800084c4:	00813423          	sd	s0,8(sp)
    800084c8:	01010413          	addi	s0,sp,16
    800084cc:	00004717          	auipc	a4,0x4
    800084d0:	38c72703          	lw	a4,908(a4) # 8000c858 <panicked>
    800084d4:	02071663          	bnez	a4,80008500 <uartputc_sync+0x40>
    800084d8:	00050793          	mv	a5,a0
    800084dc:	100006b7          	lui	a3,0x10000
    800084e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800084e4:	02077713          	andi	a4,a4,32
    800084e8:	fe070ce3          	beqz	a4,800084e0 <uartputc_sync+0x20>
    800084ec:	0ff7f793          	andi	a5,a5,255
    800084f0:	00f68023          	sb	a5,0(a3)
    800084f4:	00813403          	ld	s0,8(sp)
    800084f8:	01010113          	addi	sp,sp,16
    800084fc:	00008067          	ret
    80008500:	0000006f          	j	80008500 <uartputc_sync+0x40>

0000000080008504 <uartstart>:
    80008504:	ff010113          	addi	sp,sp,-16
    80008508:	00813423          	sd	s0,8(sp)
    8000850c:	01010413          	addi	s0,sp,16
    80008510:	00004617          	auipc	a2,0x4
    80008514:	35060613          	addi	a2,a2,848 # 8000c860 <uart_tx_r>
    80008518:	00004517          	auipc	a0,0x4
    8000851c:	35050513          	addi	a0,a0,848 # 8000c868 <uart_tx_w>
    80008520:	00063783          	ld	a5,0(a2)
    80008524:	00053703          	ld	a4,0(a0)
    80008528:	04f70263          	beq	a4,a5,8000856c <uartstart+0x68>
    8000852c:	100005b7          	lui	a1,0x10000
    80008530:	00005817          	auipc	a6,0x5
    80008534:	64080813          	addi	a6,a6,1600 # 8000db70 <uart_tx_buf>
    80008538:	01c0006f          	j	80008554 <uartstart+0x50>
    8000853c:	0006c703          	lbu	a4,0(a3)
    80008540:	00f63023          	sd	a5,0(a2)
    80008544:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008548:	00063783          	ld	a5,0(a2)
    8000854c:	00053703          	ld	a4,0(a0)
    80008550:	00f70e63          	beq	a4,a5,8000856c <uartstart+0x68>
    80008554:	01f7f713          	andi	a4,a5,31
    80008558:	00e806b3          	add	a3,a6,a4
    8000855c:	0055c703          	lbu	a4,5(a1)
    80008560:	00178793          	addi	a5,a5,1
    80008564:	02077713          	andi	a4,a4,32
    80008568:	fc071ae3          	bnez	a4,8000853c <uartstart+0x38>
    8000856c:	00813403          	ld	s0,8(sp)
    80008570:	01010113          	addi	sp,sp,16
    80008574:	00008067          	ret

0000000080008578 <uartgetc>:
    80008578:	ff010113          	addi	sp,sp,-16
    8000857c:	00813423          	sd	s0,8(sp)
    80008580:	01010413          	addi	s0,sp,16
    80008584:	10000737          	lui	a4,0x10000
    80008588:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000858c:	0017f793          	andi	a5,a5,1
    80008590:	00078c63          	beqz	a5,800085a8 <uartgetc+0x30>
    80008594:	00074503          	lbu	a0,0(a4)
    80008598:	0ff57513          	andi	a0,a0,255
    8000859c:	00813403          	ld	s0,8(sp)
    800085a0:	01010113          	addi	sp,sp,16
    800085a4:	00008067          	ret
    800085a8:	fff00513          	li	a0,-1
    800085ac:	ff1ff06f          	j	8000859c <uartgetc+0x24>

00000000800085b0 <uartintr>:
    800085b0:	100007b7          	lui	a5,0x10000
    800085b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800085b8:	0017f793          	andi	a5,a5,1
    800085bc:	0a078463          	beqz	a5,80008664 <uartintr+0xb4>
    800085c0:	fe010113          	addi	sp,sp,-32
    800085c4:	00813823          	sd	s0,16(sp)
    800085c8:	00913423          	sd	s1,8(sp)
    800085cc:	00113c23          	sd	ra,24(sp)
    800085d0:	02010413          	addi	s0,sp,32
    800085d4:	100004b7          	lui	s1,0x10000
    800085d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800085dc:	0ff57513          	andi	a0,a0,255
    800085e0:	fffff097          	auipc	ra,0xfffff
    800085e4:	534080e7          	jalr	1332(ra) # 80007b14 <consoleintr>
    800085e8:	0054c783          	lbu	a5,5(s1)
    800085ec:	0017f793          	andi	a5,a5,1
    800085f0:	fe0794e3          	bnez	a5,800085d8 <uartintr+0x28>
    800085f4:	00004617          	auipc	a2,0x4
    800085f8:	26c60613          	addi	a2,a2,620 # 8000c860 <uart_tx_r>
    800085fc:	00004517          	auipc	a0,0x4
    80008600:	26c50513          	addi	a0,a0,620 # 8000c868 <uart_tx_w>
    80008604:	00063783          	ld	a5,0(a2)
    80008608:	00053703          	ld	a4,0(a0)
    8000860c:	04f70263          	beq	a4,a5,80008650 <uartintr+0xa0>
    80008610:	100005b7          	lui	a1,0x10000
    80008614:	00005817          	auipc	a6,0x5
    80008618:	55c80813          	addi	a6,a6,1372 # 8000db70 <uart_tx_buf>
    8000861c:	01c0006f          	j	80008638 <uartintr+0x88>
    80008620:	0006c703          	lbu	a4,0(a3)
    80008624:	00f63023          	sd	a5,0(a2)
    80008628:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000862c:	00063783          	ld	a5,0(a2)
    80008630:	00053703          	ld	a4,0(a0)
    80008634:	00f70e63          	beq	a4,a5,80008650 <uartintr+0xa0>
    80008638:	01f7f713          	andi	a4,a5,31
    8000863c:	00e806b3          	add	a3,a6,a4
    80008640:	0055c703          	lbu	a4,5(a1)
    80008644:	00178793          	addi	a5,a5,1
    80008648:	02077713          	andi	a4,a4,32
    8000864c:	fc071ae3          	bnez	a4,80008620 <uartintr+0x70>
    80008650:	01813083          	ld	ra,24(sp)
    80008654:	01013403          	ld	s0,16(sp)
    80008658:	00813483          	ld	s1,8(sp)
    8000865c:	02010113          	addi	sp,sp,32
    80008660:	00008067          	ret
    80008664:	00004617          	auipc	a2,0x4
    80008668:	1fc60613          	addi	a2,a2,508 # 8000c860 <uart_tx_r>
    8000866c:	00004517          	auipc	a0,0x4
    80008670:	1fc50513          	addi	a0,a0,508 # 8000c868 <uart_tx_w>
    80008674:	00063783          	ld	a5,0(a2)
    80008678:	00053703          	ld	a4,0(a0)
    8000867c:	04f70263          	beq	a4,a5,800086c0 <uartintr+0x110>
    80008680:	100005b7          	lui	a1,0x10000
    80008684:	00005817          	auipc	a6,0x5
    80008688:	4ec80813          	addi	a6,a6,1260 # 8000db70 <uart_tx_buf>
    8000868c:	01c0006f          	j	800086a8 <uartintr+0xf8>
    80008690:	0006c703          	lbu	a4,0(a3)
    80008694:	00f63023          	sd	a5,0(a2)
    80008698:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000869c:	00063783          	ld	a5,0(a2)
    800086a0:	00053703          	ld	a4,0(a0)
    800086a4:	02f70063          	beq	a4,a5,800086c4 <uartintr+0x114>
    800086a8:	01f7f713          	andi	a4,a5,31
    800086ac:	00e806b3          	add	a3,a6,a4
    800086b0:	0055c703          	lbu	a4,5(a1)
    800086b4:	00178793          	addi	a5,a5,1
    800086b8:	02077713          	andi	a4,a4,32
    800086bc:	fc071ae3          	bnez	a4,80008690 <uartintr+0xe0>
    800086c0:	00008067          	ret
    800086c4:	00008067          	ret

00000000800086c8 <kinit>:
    800086c8:	fc010113          	addi	sp,sp,-64
    800086cc:	02913423          	sd	s1,40(sp)
    800086d0:	fffff7b7          	lui	a5,0xfffff
    800086d4:	00006497          	auipc	s1,0x6
    800086d8:	4bb48493          	addi	s1,s1,1211 # 8000eb8f <end+0xfff>
    800086dc:	02813823          	sd	s0,48(sp)
    800086e0:	01313c23          	sd	s3,24(sp)
    800086e4:	00f4f4b3          	and	s1,s1,a5
    800086e8:	02113c23          	sd	ra,56(sp)
    800086ec:	03213023          	sd	s2,32(sp)
    800086f0:	01413823          	sd	s4,16(sp)
    800086f4:	01513423          	sd	s5,8(sp)
    800086f8:	04010413          	addi	s0,sp,64
    800086fc:	000017b7          	lui	a5,0x1
    80008700:	01100993          	li	s3,17
    80008704:	00f487b3          	add	a5,s1,a5
    80008708:	01b99993          	slli	s3,s3,0x1b
    8000870c:	06f9e063          	bltu	s3,a5,8000876c <kinit+0xa4>
    80008710:	00005a97          	auipc	s5,0x5
    80008714:	480a8a93          	addi	s5,s5,1152 # 8000db90 <end>
    80008718:	0754ec63          	bltu	s1,s5,80008790 <kinit+0xc8>
    8000871c:	0734fa63          	bgeu	s1,s3,80008790 <kinit+0xc8>
    80008720:	00088a37          	lui	s4,0x88
    80008724:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008728:	00004917          	auipc	s2,0x4
    8000872c:	14890913          	addi	s2,s2,328 # 8000c870 <kmem>
    80008730:	00ca1a13          	slli	s4,s4,0xc
    80008734:	0140006f          	j	80008748 <kinit+0x80>
    80008738:	000017b7          	lui	a5,0x1
    8000873c:	00f484b3          	add	s1,s1,a5
    80008740:	0554e863          	bltu	s1,s5,80008790 <kinit+0xc8>
    80008744:	0534f663          	bgeu	s1,s3,80008790 <kinit+0xc8>
    80008748:	00001637          	lui	a2,0x1
    8000874c:	00100593          	li	a1,1
    80008750:	00048513          	mv	a0,s1
    80008754:	00000097          	auipc	ra,0x0
    80008758:	5e4080e7          	jalr	1508(ra) # 80008d38 <__memset>
    8000875c:	00093783          	ld	a5,0(s2)
    80008760:	00f4b023          	sd	a5,0(s1)
    80008764:	00993023          	sd	s1,0(s2)
    80008768:	fd4498e3          	bne	s1,s4,80008738 <kinit+0x70>
    8000876c:	03813083          	ld	ra,56(sp)
    80008770:	03013403          	ld	s0,48(sp)
    80008774:	02813483          	ld	s1,40(sp)
    80008778:	02013903          	ld	s2,32(sp)
    8000877c:	01813983          	ld	s3,24(sp)
    80008780:	01013a03          	ld	s4,16(sp)
    80008784:	00813a83          	ld	s5,8(sp)
    80008788:	04010113          	addi	sp,sp,64
    8000878c:	00008067          	ret
    80008790:	00002517          	auipc	a0,0x2
    80008794:	e9050513          	addi	a0,a0,-368 # 8000a620 <digits+0x18>
    80008798:	fffff097          	auipc	ra,0xfffff
    8000879c:	4b4080e7          	jalr	1204(ra) # 80007c4c <panic>

00000000800087a0 <freerange>:
    800087a0:	fc010113          	addi	sp,sp,-64
    800087a4:	000017b7          	lui	a5,0x1
    800087a8:	02913423          	sd	s1,40(sp)
    800087ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800087b0:	009504b3          	add	s1,a0,s1
    800087b4:	fffff537          	lui	a0,0xfffff
    800087b8:	02813823          	sd	s0,48(sp)
    800087bc:	02113c23          	sd	ra,56(sp)
    800087c0:	03213023          	sd	s2,32(sp)
    800087c4:	01313c23          	sd	s3,24(sp)
    800087c8:	01413823          	sd	s4,16(sp)
    800087cc:	01513423          	sd	s5,8(sp)
    800087d0:	01613023          	sd	s6,0(sp)
    800087d4:	04010413          	addi	s0,sp,64
    800087d8:	00a4f4b3          	and	s1,s1,a0
    800087dc:	00f487b3          	add	a5,s1,a5
    800087e0:	06f5e463          	bltu	a1,a5,80008848 <freerange+0xa8>
    800087e4:	00005a97          	auipc	s5,0x5
    800087e8:	3aca8a93          	addi	s5,s5,940 # 8000db90 <end>
    800087ec:	0954e263          	bltu	s1,s5,80008870 <freerange+0xd0>
    800087f0:	01100993          	li	s3,17
    800087f4:	01b99993          	slli	s3,s3,0x1b
    800087f8:	0734fc63          	bgeu	s1,s3,80008870 <freerange+0xd0>
    800087fc:	00058a13          	mv	s4,a1
    80008800:	00004917          	auipc	s2,0x4
    80008804:	07090913          	addi	s2,s2,112 # 8000c870 <kmem>
    80008808:	00002b37          	lui	s6,0x2
    8000880c:	0140006f          	j	80008820 <freerange+0x80>
    80008810:	000017b7          	lui	a5,0x1
    80008814:	00f484b3          	add	s1,s1,a5
    80008818:	0554ec63          	bltu	s1,s5,80008870 <freerange+0xd0>
    8000881c:	0534fa63          	bgeu	s1,s3,80008870 <freerange+0xd0>
    80008820:	00001637          	lui	a2,0x1
    80008824:	00100593          	li	a1,1
    80008828:	00048513          	mv	a0,s1
    8000882c:	00000097          	auipc	ra,0x0
    80008830:	50c080e7          	jalr	1292(ra) # 80008d38 <__memset>
    80008834:	00093703          	ld	a4,0(s2)
    80008838:	016487b3          	add	a5,s1,s6
    8000883c:	00e4b023          	sd	a4,0(s1)
    80008840:	00993023          	sd	s1,0(s2)
    80008844:	fcfa76e3          	bgeu	s4,a5,80008810 <freerange+0x70>
    80008848:	03813083          	ld	ra,56(sp)
    8000884c:	03013403          	ld	s0,48(sp)
    80008850:	02813483          	ld	s1,40(sp)
    80008854:	02013903          	ld	s2,32(sp)
    80008858:	01813983          	ld	s3,24(sp)
    8000885c:	01013a03          	ld	s4,16(sp)
    80008860:	00813a83          	ld	s5,8(sp)
    80008864:	00013b03          	ld	s6,0(sp)
    80008868:	04010113          	addi	sp,sp,64
    8000886c:	00008067          	ret
    80008870:	00002517          	auipc	a0,0x2
    80008874:	db050513          	addi	a0,a0,-592 # 8000a620 <digits+0x18>
    80008878:	fffff097          	auipc	ra,0xfffff
    8000887c:	3d4080e7          	jalr	980(ra) # 80007c4c <panic>

0000000080008880 <kfree>:
    80008880:	fe010113          	addi	sp,sp,-32
    80008884:	00813823          	sd	s0,16(sp)
    80008888:	00113c23          	sd	ra,24(sp)
    8000888c:	00913423          	sd	s1,8(sp)
    80008890:	02010413          	addi	s0,sp,32
    80008894:	03451793          	slli	a5,a0,0x34
    80008898:	04079c63          	bnez	a5,800088f0 <kfree+0x70>
    8000889c:	00005797          	auipc	a5,0x5
    800088a0:	2f478793          	addi	a5,a5,756 # 8000db90 <end>
    800088a4:	00050493          	mv	s1,a0
    800088a8:	04f56463          	bltu	a0,a5,800088f0 <kfree+0x70>
    800088ac:	01100793          	li	a5,17
    800088b0:	01b79793          	slli	a5,a5,0x1b
    800088b4:	02f57e63          	bgeu	a0,a5,800088f0 <kfree+0x70>
    800088b8:	00001637          	lui	a2,0x1
    800088bc:	00100593          	li	a1,1
    800088c0:	00000097          	auipc	ra,0x0
    800088c4:	478080e7          	jalr	1144(ra) # 80008d38 <__memset>
    800088c8:	00004797          	auipc	a5,0x4
    800088cc:	fa878793          	addi	a5,a5,-88 # 8000c870 <kmem>
    800088d0:	0007b703          	ld	a4,0(a5)
    800088d4:	01813083          	ld	ra,24(sp)
    800088d8:	01013403          	ld	s0,16(sp)
    800088dc:	00e4b023          	sd	a4,0(s1)
    800088e0:	0097b023          	sd	s1,0(a5)
    800088e4:	00813483          	ld	s1,8(sp)
    800088e8:	02010113          	addi	sp,sp,32
    800088ec:	00008067          	ret
    800088f0:	00002517          	auipc	a0,0x2
    800088f4:	d3050513          	addi	a0,a0,-720 # 8000a620 <digits+0x18>
    800088f8:	fffff097          	auipc	ra,0xfffff
    800088fc:	354080e7          	jalr	852(ra) # 80007c4c <panic>

0000000080008900 <kalloc>:
    80008900:	fe010113          	addi	sp,sp,-32
    80008904:	00813823          	sd	s0,16(sp)
    80008908:	00913423          	sd	s1,8(sp)
    8000890c:	00113c23          	sd	ra,24(sp)
    80008910:	02010413          	addi	s0,sp,32
    80008914:	00004797          	auipc	a5,0x4
    80008918:	f5c78793          	addi	a5,a5,-164 # 8000c870 <kmem>
    8000891c:	0007b483          	ld	s1,0(a5)
    80008920:	02048063          	beqz	s1,80008940 <kalloc+0x40>
    80008924:	0004b703          	ld	a4,0(s1)
    80008928:	00001637          	lui	a2,0x1
    8000892c:	00500593          	li	a1,5
    80008930:	00048513          	mv	a0,s1
    80008934:	00e7b023          	sd	a4,0(a5)
    80008938:	00000097          	auipc	ra,0x0
    8000893c:	400080e7          	jalr	1024(ra) # 80008d38 <__memset>
    80008940:	01813083          	ld	ra,24(sp)
    80008944:	01013403          	ld	s0,16(sp)
    80008948:	00048513          	mv	a0,s1
    8000894c:	00813483          	ld	s1,8(sp)
    80008950:	02010113          	addi	sp,sp,32
    80008954:	00008067          	ret

0000000080008958 <initlock>:
    80008958:	ff010113          	addi	sp,sp,-16
    8000895c:	00813423          	sd	s0,8(sp)
    80008960:	01010413          	addi	s0,sp,16
    80008964:	00813403          	ld	s0,8(sp)
    80008968:	00b53423          	sd	a1,8(a0)
    8000896c:	00052023          	sw	zero,0(a0)
    80008970:	00053823          	sd	zero,16(a0)
    80008974:	01010113          	addi	sp,sp,16
    80008978:	00008067          	ret

000000008000897c <acquire>:
    8000897c:	fe010113          	addi	sp,sp,-32
    80008980:	00813823          	sd	s0,16(sp)
    80008984:	00913423          	sd	s1,8(sp)
    80008988:	00113c23          	sd	ra,24(sp)
    8000898c:	01213023          	sd	s2,0(sp)
    80008990:	02010413          	addi	s0,sp,32
    80008994:	00050493          	mv	s1,a0
    80008998:	10002973          	csrr	s2,sstatus
    8000899c:	100027f3          	csrr	a5,sstatus
    800089a0:	ffd7f793          	andi	a5,a5,-3
    800089a4:	10079073          	csrw	sstatus,a5
    800089a8:	fffff097          	auipc	ra,0xfffff
    800089ac:	8e8080e7          	jalr	-1816(ra) # 80007290 <mycpu>
    800089b0:	07852783          	lw	a5,120(a0)
    800089b4:	06078e63          	beqz	a5,80008a30 <acquire+0xb4>
    800089b8:	fffff097          	auipc	ra,0xfffff
    800089bc:	8d8080e7          	jalr	-1832(ra) # 80007290 <mycpu>
    800089c0:	07852783          	lw	a5,120(a0)
    800089c4:	0004a703          	lw	a4,0(s1)
    800089c8:	0017879b          	addiw	a5,a5,1
    800089cc:	06f52c23          	sw	a5,120(a0)
    800089d0:	04071063          	bnez	a4,80008a10 <acquire+0x94>
    800089d4:	00100713          	li	a4,1
    800089d8:	00070793          	mv	a5,a4
    800089dc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800089e0:	0007879b          	sext.w	a5,a5
    800089e4:	fe079ae3          	bnez	a5,800089d8 <acquire+0x5c>
    800089e8:	0ff0000f          	fence
    800089ec:	fffff097          	auipc	ra,0xfffff
    800089f0:	8a4080e7          	jalr	-1884(ra) # 80007290 <mycpu>
    800089f4:	01813083          	ld	ra,24(sp)
    800089f8:	01013403          	ld	s0,16(sp)
    800089fc:	00a4b823          	sd	a0,16(s1)
    80008a00:	00013903          	ld	s2,0(sp)
    80008a04:	00813483          	ld	s1,8(sp)
    80008a08:	02010113          	addi	sp,sp,32
    80008a0c:	00008067          	ret
    80008a10:	0104b903          	ld	s2,16(s1)
    80008a14:	fffff097          	auipc	ra,0xfffff
    80008a18:	87c080e7          	jalr	-1924(ra) # 80007290 <mycpu>
    80008a1c:	faa91ce3          	bne	s2,a0,800089d4 <acquire+0x58>
    80008a20:	00002517          	auipc	a0,0x2
    80008a24:	c0850513          	addi	a0,a0,-1016 # 8000a628 <digits+0x20>
    80008a28:	fffff097          	auipc	ra,0xfffff
    80008a2c:	224080e7          	jalr	548(ra) # 80007c4c <panic>
    80008a30:	00195913          	srli	s2,s2,0x1
    80008a34:	fffff097          	auipc	ra,0xfffff
    80008a38:	85c080e7          	jalr	-1956(ra) # 80007290 <mycpu>
    80008a3c:	00197913          	andi	s2,s2,1
    80008a40:	07252e23          	sw	s2,124(a0)
    80008a44:	f75ff06f          	j	800089b8 <acquire+0x3c>

0000000080008a48 <release>:
    80008a48:	fe010113          	addi	sp,sp,-32
    80008a4c:	00813823          	sd	s0,16(sp)
    80008a50:	00113c23          	sd	ra,24(sp)
    80008a54:	00913423          	sd	s1,8(sp)
    80008a58:	01213023          	sd	s2,0(sp)
    80008a5c:	02010413          	addi	s0,sp,32
    80008a60:	00052783          	lw	a5,0(a0)
    80008a64:	00079a63          	bnez	a5,80008a78 <release+0x30>
    80008a68:	00002517          	auipc	a0,0x2
    80008a6c:	bc850513          	addi	a0,a0,-1080 # 8000a630 <digits+0x28>
    80008a70:	fffff097          	auipc	ra,0xfffff
    80008a74:	1dc080e7          	jalr	476(ra) # 80007c4c <panic>
    80008a78:	01053903          	ld	s2,16(a0)
    80008a7c:	00050493          	mv	s1,a0
    80008a80:	fffff097          	auipc	ra,0xfffff
    80008a84:	810080e7          	jalr	-2032(ra) # 80007290 <mycpu>
    80008a88:	fea910e3          	bne	s2,a0,80008a68 <release+0x20>
    80008a8c:	0004b823          	sd	zero,16(s1)
    80008a90:	0ff0000f          	fence
    80008a94:	0f50000f          	fence	iorw,ow
    80008a98:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008a9c:	ffffe097          	auipc	ra,0xffffe
    80008aa0:	7f4080e7          	jalr	2036(ra) # 80007290 <mycpu>
    80008aa4:	100027f3          	csrr	a5,sstatus
    80008aa8:	0027f793          	andi	a5,a5,2
    80008aac:	04079a63          	bnez	a5,80008b00 <release+0xb8>
    80008ab0:	07852783          	lw	a5,120(a0)
    80008ab4:	02f05e63          	blez	a5,80008af0 <release+0xa8>
    80008ab8:	fff7871b          	addiw	a4,a5,-1
    80008abc:	06e52c23          	sw	a4,120(a0)
    80008ac0:	00071c63          	bnez	a4,80008ad8 <release+0x90>
    80008ac4:	07c52783          	lw	a5,124(a0)
    80008ac8:	00078863          	beqz	a5,80008ad8 <release+0x90>
    80008acc:	100027f3          	csrr	a5,sstatus
    80008ad0:	0027e793          	ori	a5,a5,2
    80008ad4:	10079073          	csrw	sstatus,a5
    80008ad8:	01813083          	ld	ra,24(sp)
    80008adc:	01013403          	ld	s0,16(sp)
    80008ae0:	00813483          	ld	s1,8(sp)
    80008ae4:	00013903          	ld	s2,0(sp)
    80008ae8:	02010113          	addi	sp,sp,32
    80008aec:	00008067          	ret
    80008af0:	00002517          	auipc	a0,0x2
    80008af4:	b6050513          	addi	a0,a0,-1184 # 8000a650 <digits+0x48>
    80008af8:	fffff097          	auipc	ra,0xfffff
    80008afc:	154080e7          	jalr	340(ra) # 80007c4c <panic>
    80008b00:	00002517          	auipc	a0,0x2
    80008b04:	b3850513          	addi	a0,a0,-1224 # 8000a638 <digits+0x30>
    80008b08:	fffff097          	auipc	ra,0xfffff
    80008b0c:	144080e7          	jalr	324(ra) # 80007c4c <panic>

0000000080008b10 <holding>:
    80008b10:	00052783          	lw	a5,0(a0)
    80008b14:	00079663          	bnez	a5,80008b20 <holding+0x10>
    80008b18:	00000513          	li	a0,0
    80008b1c:	00008067          	ret
    80008b20:	fe010113          	addi	sp,sp,-32
    80008b24:	00813823          	sd	s0,16(sp)
    80008b28:	00913423          	sd	s1,8(sp)
    80008b2c:	00113c23          	sd	ra,24(sp)
    80008b30:	02010413          	addi	s0,sp,32
    80008b34:	01053483          	ld	s1,16(a0)
    80008b38:	ffffe097          	auipc	ra,0xffffe
    80008b3c:	758080e7          	jalr	1880(ra) # 80007290 <mycpu>
    80008b40:	01813083          	ld	ra,24(sp)
    80008b44:	01013403          	ld	s0,16(sp)
    80008b48:	40a48533          	sub	a0,s1,a0
    80008b4c:	00153513          	seqz	a0,a0
    80008b50:	00813483          	ld	s1,8(sp)
    80008b54:	02010113          	addi	sp,sp,32
    80008b58:	00008067          	ret

0000000080008b5c <push_off>:
    80008b5c:	fe010113          	addi	sp,sp,-32
    80008b60:	00813823          	sd	s0,16(sp)
    80008b64:	00113c23          	sd	ra,24(sp)
    80008b68:	00913423          	sd	s1,8(sp)
    80008b6c:	02010413          	addi	s0,sp,32
    80008b70:	100024f3          	csrr	s1,sstatus
    80008b74:	100027f3          	csrr	a5,sstatus
    80008b78:	ffd7f793          	andi	a5,a5,-3
    80008b7c:	10079073          	csrw	sstatus,a5
    80008b80:	ffffe097          	auipc	ra,0xffffe
    80008b84:	710080e7          	jalr	1808(ra) # 80007290 <mycpu>
    80008b88:	07852783          	lw	a5,120(a0)
    80008b8c:	02078663          	beqz	a5,80008bb8 <push_off+0x5c>
    80008b90:	ffffe097          	auipc	ra,0xffffe
    80008b94:	700080e7          	jalr	1792(ra) # 80007290 <mycpu>
    80008b98:	07852783          	lw	a5,120(a0)
    80008b9c:	01813083          	ld	ra,24(sp)
    80008ba0:	01013403          	ld	s0,16(sp)
    80008ba4:	0017879b          	addiw	a5,a5,1
    80008ba8:	06f52c23          	sw	a5,120(a0)
    80008bac:	00813483          	ld	s1,8(sp)
    80008bb0:	02010113          	addi	sp,sp,32
    80008bb4:	00008067          	ret
    80008bb8:	0014d493          	srli	s1,s1,0x1
    80008bbc:	ffffe097          	auipc	ra,0xffffe
    80008bc0:	6d4080e7          	jalr	1748(ra) # 80007290 <mycpu>
    80008bc4:	0014f493          	andi	s1,s1,1
    80008bc8:	06952e23          	sw	s1,124(a0)
    80008bcc:	fc5ff06f          	j	80008b90 <push_off+0x34>

0000000080008bd0 <pop_off>:
    80008bd0:	ff010113          	addi	sp,sp,-16
    80008bd4:	00813023          	sd	s0,0(sp)
    80008bd8:	00113423          	sd	ra,8(sp)
    80008bdc:	01010413          	addi	s0,sp,16
    80008be0:	ffffe097          	auipc	ra,0xffffe
    80008be4:	6b0080e7          	jalr	1712(ra) # 80007290 <mycpu>
    80008be8:	100027f3          	csrr	a5,sstatus
    80008bec:	0027f793          	andi	a5,a5,2
    80008bf0:	04079663          	bnez	a5,80008c3c <pop_off+0x6c>
    80008bf4:	07852783          	lw	a5,120(a0)
    80008bf8:	02f05a63          	blez	a5,80008c2c <pop_off+0x5c>
    80008bfc:	fff7871b          	addiw	a4,a5,-1
    80008c00:	06e52c23          	sw	a4,120(a0)
    80008c04:	00071c63          	bnez	a4,80008c1c <pop_off+0x4c>
    80008c08:	07c52783          	lw	a5,124(a0)
    80008c0c:	00078863          	beqz	a5,80008c1c <pop_off+0x4c>
    80008c10:	100027f3          	csrr	a5,sstatus
    80008c14:	0027e793          	ori	a5,a5,2
    80008c18:	10079073          	csrw	sstatus,a5
    80008c1c:	00813083          	ld	ra,8(sp)
    80008c20:	00013403          	ld	s0,0(sp)
    80008c24:	01010113          	addi	sp,sp,16
    80008c28:	00008067          	ret
    80008c2c:	00002517          	auipc	a0,0x2
    80008c30:	a2450513          	addi	a0,a0,-1500 # 8000a650 <digits+0x48>
    80008c34:	fffff097          	auipc	ra,0xfffff
    80008c38:	018080e7          	jalr	24(ra) # 80007c4c <panic>
    80008c3c:	00002517          	auipc	a0,0x2
    80008c40:	9fc50513          	addi	a0,a0,-1540 # 8000a638 <digits+0x30>
    80008c44:	fffff097          	auipc	ra,0xfffff
    80008c48:	008080e7          	jalr	8(ra) # 80007c4c <panic>

0000000080008c4c <push_on>:
    80008c4c:	fe010113          	addi	sp,sp,-32
    80008c50:	00813823          	sd	s0,16(sp)
    80008c54:	00113c23          	sd	ra,24(sp)
    80008c58:	00913423          	sd	s1,8(sp)
    80008c5c:	02010413          	addi	s0,sp,32
    80008c60:	100024f3          	csrr	s1,sstatus
    80008c64:	100027f3          	csrr	a5,sstatus
    80008c68:	0027e793          	ori	a5,a5,2
    80008c6c:	10079073          	csrw	sstatus,a5
    80008c70:	ffffe097          	auipc	ra,0xffffe
    80008c74:	620080e7          	jalr	1568(ra) # 80007290 <mycpu>
    80008c78:	07852783          	lw	a5,120(a0)
    80008c7c:	02078663          	beqz	a5,80008ca8 <push_on+0x5c>
    80008c80:	ffffe097          	auipc	ra,0xffffe
    80008c84:	610080e7          	jalr	1552(ra) # 80007290 <mycpu>
    80008c88:	07852783          	lw	a5,120(a0)
    80008c8c:	01813083          	ld	ra,24(sp)
    80008c90:	01013403          	ld	s0,16(sp)
    80008c94:	0017879b          	addiw	a5,a5,1
    80008c98:	06f52c23          	sw	a5,120(a0)
    80008c9c:	00813483          	ld	s1,8(sp)
    80008ca0:	02010113          	addi	sp,sp,32
    80008ca4:	00008067          	ret
    80008ca8:	0014d493          	srli	s1,s1,0x1
    80008cac:	ffffe097          	auipc	ra,0xffffe
    80008cb0:	5e4080e7          	jalr	1508(ra) # 80007290 <mycpu>
    80008cb4:	0014f493          	andi	s1,s1,1
    80008cb8:	06952e23          	sw	s1,124(a0)
    80008cbc:	fc5ff06f          	j	80008c80 <push_on+0x34>

0000000080008cc0 <pop_on>:
    80008cc0:	ff010113          	addi	sp,sp,-16
    80008cc4:	00813023          	sd	s0,0(sp)
    80008cc8:	00113423          	sd	ra,8(sp)
    80008ccc:	01010413          	addi	s0,sp,16
    80008cd0:	ffffe097          	auipc	ra,0xffffe
    80008cd4:	5c0080e7          	jalr	1472(ra) # 80007290 <mycpu>
    80008cd8:	100027f3          	csrr	a5,sstatus
    80008cdc:	0027f793          	andi	a5,a5,2
    80008ce0:	04078463          	beqz	a5,80008d28 <pop_on+0x68>
    80008ce4:	07852783          	lw	a5,120(a0)
    80008ce8:	02f05863          	blez	a5,80008d18 <pop_on+0x58>
    80008cec:	fff7879b          	addiw	a5,a5,-1
    80008cf0:	06f52c23          	sw	a5,120(a0)
    80008cf4:	07853783          	ld	a5,120(a0)
    80008cf8:	00079863          	bnez	a5,80008d08 <pop_on+0x48>
    80008cfc:	100027f3          	csrr	a5,sstatus
    80008d00:	ffd7f793          	andi	a5,a5,-3
    80008d04:	10079073          	csrw	sstatus,a5
    80008d08:	00813083          	ld	ra,8(sp)
    80008d0c:	00013403          	ld	s0,0(sp)
    80008d10:	01010113          	addi	sp,sp,16
    80008d14:	00008067          	ret
    80008d18:	00002517          	auipc	a0,0x2
    80008d1c:	96050513          	addi	a0,a0,-1696 # 8000a678 <digits+0x70>
    80008d20:	fffff097          	auipc	ra,0xfffff
    80008d24:	f2c080e7          	jalr	-212(ra) # 80007c4c <panic>
    80008d28:	00002517          	auipc	a0,0x2
    80008d2c:	93050513          	addi	a0,a0,-1744 # 8000a658 <digits+0x50>
    80008d30:	fffff097          	auipc	ra,0xfffff
    80008d34:	f1c080e7          	jalr	-228(ra) # 80007c4c <panic>

0000000080008d38 <__memset>:
    80008d38:	ff010113          	addi	sp,sp,-16
    80008d3c:	00813423          	sd	s0,8(sp)
    80008d40:	01010413          	addi	s0,sp,16
    80008d44:	1a060e63          	beqz	a2,80008f00 <__memset+0x1c8>
    80008d48:	40a007b3          	neg	a5,a0
    80008d4c:	0077f793          	andi	a5,a5,7
    80008d50:	00778693          	addi	a3,a5,7
    80008d54:	00b00813          	li	a6,11
    80008d58:	0ff5f593          	andi	a1,a1,255
    80008d5c:	fff6071b          	addiw	a4,a2,-1
    80008d60:	1b06e663          	bltu	a3,a6,80008f0c <__memset+0x1d4>
    80008d64:	1cd76463          	bltu	a4,a3,80008f2c <__memset+0x1f4>
    80008d68:	1a078e63          	beqz	a5,80008f24 <__memset+0x1ec>
    80008d6c:	00b50023          	sb	a1,0(a0)
    80008d70:	00100713          	li	a4,1
    80008d74:	1ae78463          	beq	a5,a4,80008f1c <__memset+0x1e4>
    80008d78:	00b500a3          	sb	a1,1(a0)
    80008d7c:	00200713          	li	a4,2
    80008d80:	1ae78a63          	beq	a5,a4,80008f34 <__memset+0x1fc>
    80008d84:	00b50123          	sb	a1,2(a0)
    80008d88:	00300713          	li	a4,3
    80008d8c:	18e78463          	beq	a5,a4,80008f14 <__memset+0x1dc>
    80008d90:	00b501a3          	sb	a1,3(a0)
    80008d94:	00400713          	li	a4,4
    80008d98:	1ae78263          	beq	a5,a4,80008f3c <__memset+0x204>
    80008d9c:	00b50223          	sb	a1,4(a0)
    80008da0:	00500713          	li	a4,5
    80008da4:	1ae78063          	beq	a5,a4,80008f44 <__memset+0x20c>
    80008da8:	00b502a3          	sb	a1,5(a0)
    80008dac:	00700713          	li	a4,7
    80008db0:	18e79e63          	bne	a5,a4,80008f4c <__memset+0x214>
    80008db4:	00b50323          	sb	a1,6(a0)
    80008db8:	00700e93          	li	t4,7
    80008dbc:	00859713          	slli	a4,a1,0x8
    80008dc0:	00e5e733          	or	a4,a1,a4
    80008dc4:	01059e13          	slli	t3,a1,0x10
    80008dc8:	01c76e33          	or	t3,a4,t3
    80008dcc:	01859313          	slli	t1,a1,0x18
    80008dd0:	006e6333          	or	t1,t3,t1
    80008dd4:	02059893          	slli	a7,a1,0x20
    80008dd8:	40f60e3b          	subw	t3,a2,a5
    80008ddc:	011368b3          	or	a7,t1,a7
    80008de0:	02859813          	slli	a6,a1,0x28
    80008de4:	0108e833          	or	a6,a7,a6
    80008de8:	03059693          	slli	a3,a1,0x30
    80008dec:	003e589b          	srliw	a7,t3,0x3
    80008df0:	00d866b3          	or	a3,a6,a3
    80008df4:	03859713          	slli	a4,a1,0x38
    80008df8:	00389813          	slli	a6,a7,0x3
    80008dfc:	00f507b3          	add	a5,a0,a5
    80008e00:	00e6e733          	or	a4,a3,a4
    80008e04:	000e089b          	sext.w	a7,t3
    80008e08:	00f806b3          	add	a3,a6,a5
    80008e0c:	00e7b023          	sd	a4,0(a5)
    80008e10:	00878793          	addi	a5,a5,8
    80008e14:	fed79ce3          	bne	a5,a3,80008e0c <__memset+0xd4>
    80008e18:	ff8e7793          	andi	a5,t3,-8
    80008e1c:	0007871b          	sext.w	a4,a5
    80008e20:	01d787bb          	addw	a5,a5,t4
    80008e24:	0ce88e63          	beq	a7,a4,80008f00 <__memset+0x1c8>
    80008e28:	00f50733          	add	a4,a0,a5
    80008e2c:	00b70023          	sb	a1,0(a4)
    80008e30:	0017871b          	addiw	a4,a5,1
    80008e34:	0cc77663          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008e38:	00e50733          	add	a4,a0,a4
    80008e3c:	00b70023          	sb	a1,0(a4)
    80008e40:	0027871b          	addiw	a4,a5,2
    80008e44:	0ac77e63          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008e48:	00e50733          	add	a4,a0,a4
    80008e4c:	00b70023          	sb	a1,0(a4)
    80008e50:	0037871b          	addiw	a4,a5,3
    80008e54:	0ac77663          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008e58:	00e50733          	add	a4,a0,a4
    80008e5c:	00b70023          	sb	a1,0(a4)
    80008e60:	0047871b          	addiw	a4,a5,4
    80008e64:	08c77e63          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008e68:	00e50733          	add	a4,a0,a4
    80008e6c:	00b70023          	sb	a1,0(a4)
    80008e70:	0057871b          	addiw	a4,a5,5
    80008e74:	08c77663          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008e78:	00e50733          	add	a4,a0,a4
    80008e7c:	00b70023          	sb	a1,0(a4)
    80008e80:	0067871b          	addiw	a4,a5,6
    80008e84:	06c77e63          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008e88:	00e50733          	add	a4,a0,a4
    80008e8c:	00b70023          	sb	a1,0(a4)
    80008e90:	0077871b          	addiw	a4,a5,7
    80008e94:	06c77663          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008e98:	00e50733          	add	a4,a0,a4
    80008e9c:	00b70023          	sb	a1,0(a4)
    80008ea0:	0087871b          	addiw	a4,a5,8
    80008ea4:	04c77e63          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008ea8:	00e50733          	add	a4,a0,a4
    80008eac:	00b70023          	sb	a1,0(a4)
    80008eb0:	0097871b          	addiw	a4,a5,9
    80008eb4:	04c77663          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008eb8:	00e50733          	add	a4,a0,a4
    80008ebc:	00b70023          	sb	a1,0(a4)
    80008ec0:	00a7871b          	addiw	a4,a5,10
    80008ec4:	02c77e63          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008ec8:	00e50733          	add	a4,a0,a4
    80008ecc:	00b70023          	sb	a1,0(a4)
    80008ed0:	00b7871b          	addiw	a4,a5,11
    80008ed4:	02c77663          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008ed8:	00e50733          	add	a4,a0,a4
    80008edc:	00b70023          	sb	a1,0(a4)
    80008ee0:	00c7871b          	addiw	a4,a5,12
    80008ee4:	00c77e63          	bgeu	a4,a2,80008f00 <__memset+0x1c8>
    80008ee8:	00e50733          	add	a4,a0,a4
    80008eec:	00b70023          	sb	a1,0(a4)
    80008ef0:	00d7879b          	addiw	a5,a5,13
    80008ef4:	00c7f663          	bgeu	a5,a2,80008f00 <__memset+0x1c8>
    80008ef8:	00f507b3          	add	a5,a0,a5
    80008efc:	00b78023          	sb	a1,0(a5)
    80008f00:	00813403          	ld	s0,8(sp)
    80008f04:	01010113          	addi	sp,sp,16
    80008f08:	00008067          	ret
    80008f0c:	00b00693          	li	a3,11
    80008f10:	e55ff06f          	j	80008d64 <__memset+0x2c>
    80008f14:	00300e93          	li	t4,3
    80008f18:	ea5ff06f          	j	80008dbc <__memset+0x84>
    80008f1c:	00100e93          	li	t4,1
    80008f20:	e9dff06f          	j	80008dbc <__memset+0x84>
    80008f24:	00000e93          	li	t4,0
    80008f28:	e95ff06f          	j	80008dbc <__memset+0x84>
    80008f2c:	00000793          	li	a5,0
    80008f30:	ef9ff06f          	j	80008e28 <__memset+0xf0>
    80008f34:	00200e93          	li	t4,2
    80008f38:	e85ff06f          	j	80008dbc <__memset+0x84>
    80008f3c:	00400e93          	li	t4,4
    80008f40:	e7dff06f          	j	80008dbc <__memset+0x84>
    80008f44:	00500e93          	li	t4,5
    80008f48:	e75ff06f          	j	80008dbc <__memset+0x84>
    80008f4c:	00600e93          	li	t4,6
    80008f50:	e6dff06f          	j	80008dbc <__memset+0x84>

0000000080008f54 <__memmove>:
    80008f54:	ff010113          	addi	sp,sp,-16
    80008f58:	00813423          	sd	s0,8(sp)
    80008f5c:	01010413          	addi	s0,sp,16
    80008f60:	0e060863          	beqz	a2,80009050 <__memmove+0xfc>
    80008f64:	fff6069b          	addiw	a3,a2,-1
    80008f68:	0006881b          	sext.w	a6,a3
    80008f6c:	0ea5e863          	bltu	a1,a0,8000905c <__memmove+0x108>
    80008f70:	00758713          	addi	a4,a1,7
    80008f74:	00a5e7b3          	or	a5,a1,a0
    80008f78:	40a70733          	sub	a4,a4,a0
    80008f7c:	0077f793          	andi	a5,a5,7
    80008f80:	00f73713          	sltiu	a4,a4,15
    80008f84:	00174713          	xori	a4,a4,1
    80008f88:	0017b793          	seqz	a5,a5
    80008f8c:	00e7f7b3          	and	a5,a5,a4
    80008f90:	10078863          	beqz	a5,800090a0 <__memmove+0x14c>
    80008f94:	00900793          	li	a5,9
    80008f98:	1107f463          	bgeu	a5,a6,800090a0 <__memmove+0x14c>
    80008f9c:	0036581b          	srliw	a6,a2,0x3
    80008fa0:	fff8081b          	addiw	a6,a6,-1
    80008fa4:	02081813          	slli	a6,a6,0x20
    80008fa8:	01d85893          	srli	a7,a6,0x1d
    80008fac:	00858813          	addi	a6,a1,8
    80008fb0:	00058793          	mv	a5,a1
    80008fb4:	00050713          	mv	a4,a0
    80008fb8:	01088833          	add	a6,a7,a6
    80008fbc:	0007b883          	ld	a7,0(a5)
    80008fc0:	00878793          	addi	a5,a5,8
    80008fc4:	00870713          	addi	a4,a4,8
    80008fc8:	ff173c23          	sd	a7,-8(a4)
    80008fcc:	ff0798e3          	bne	a5,a6,80008fbc <__memmove+0x68>
    80008fd0:	ff867713          	andi	a4,a2,-8
    80008fd4:	02071793          	slli	a5,a4,0x20
    80008fd8:	0207d793          	srli	a5,a5,0x20
    80008fdc:	00f585b3          	add	a1,a1,a5
    80008fe0:	40e686bb          	subw	a3,a3,a4
    80008fe4:	00f507b3          	add	a5,a0,a5
    80008fe8:	06e60463          	beq	a2,a4,80009050 <__memmove+0xfc>
    80008fec:	0005c703          	lbu	a4,0(a1)
    80008ff0:	00e78023          	sb	a4,0(a5)
    80008ff4:	04068e63          	beqz	a3,80009050 <__memmove+0xfc>
    80008ff8:	0015c603          	lbu	a2,1(a1)
    80008ffc:	00100713          	li	a4,1
    80009000:	00c780a3          	sb	a2,1(a5)
    80009004:	04e68663          	beq	a3,a4,80009050 <__memmove+0xfc>
    80009008:	0025c603          	lbu	a2,2(a1)
    8000900c:	00200713          	li	a4,2
    80009010:	00c78123          	sb	a2,2(a5)
    80009014:	02e68e63          	beq	a3,a4,80009050 <__memmove+0xfc>
    80009018:	0035c603          	lbu	a2,3(a1)
    8000901c:	00300713          	li	a4,3
    80009020:	00c781a3          	sb	a2,3(a5)
    80009024:	02e68663          	beq	a3,a4,80009050 <__memmove+0xfc>
    80009028:	0045c603          	lbu	a2,4(a1)
    8000902c:	00400713          	li	a4,4
    80009030:	00c78223          	sb	a2,4(a5)
    80009034:	00e68e63          	beq	a3,a4,80009050 <__memmove+0xfc>
    80009038:	0055c603          	lbu	a2,5(a1)
    8000903c:	00500713          	li	a4,5
    80009040:	00c782a3          	sb	a2,5(a5)
    80009044:	00e68663          	beq	a3,a4,80009050 <__memmove+0xfc>
    80009048:	0065c703          	lbu	a4,6(a1)
    8000904c:	00e78323          	sb	a4,6(a5)
    80009050:	00813403          	ld	s0,8(sp)
    80009054:	01010113          	addi	sp,sp,16
    80009058:	00008067          	ret
    8000905c:	02061713          	slli	a4,a2,0x20
    80009060:	02075713          	srli	a4,a4,0x20
    80009064:	00e587b3          	add	a5,a1,a4
    80009068:	f0f574e3          	bgeu	a0,a5,80008f70 <__memmove+0x1c>
    8000906c:	02069613          	slli	a2,a3,0x20
    80009070:	02065613          	srli	a2,a2,0x20
    80009074:	fff64613          	not	a2,a2
    80009078:	00e50733          	add	a4,a0,a4
    8000907c:	00c78633          	add	a2,a5,a2
    80009080:	fff7c683          	lbu	a3,-1(a5)
    80009084:	fff78793          	addi	a5,a5,-1
    80009088:	fff70713          	addi	a4,a4,-1
    8000908c:	00d70023          	sb	a3,0(a4)
    80009090:	fec798e3          	bne	a5,a2,80009080 <__memmove+0x12c>
    80009094:	00813403          	ld	s0,8(sp)
    80009098:	01010113          	addi	sp,sp,16
    8000909c:	00008067          	ret
    800090a0:	02069713          	slli	a4,a3,0x20
    800090a4:	02075713          	srli	a4,a4,0x20
    800090a8:	00170713          	addi	a4,a4,1
    800090ac:	00e50733          	add	a4,a0,a4
    800090b0:	00050793          	mv	a5,a0
    800090b4:	0005c683          	lbu	a3,0(a1)
    800090b8:	00178793          	addi	a5,a5,1
    800090bc:	00158593          	addi	a1,a1,1
    800090c0:	fed78fa3          	sb	a3,-1(a5)
    800090c4:	fee798e3          	bne	a5,a4,800090b4 <__memmove+0x160>
    800090c8:	f89ff06f          	j	80009050 <__memmove+0xfc>
	...
