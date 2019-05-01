; ModuleID = 'switch.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu-elf"

%union.anon = type { i64 }
%seg_4009b0__rodata_type = type <{ [4 x i8], [16 x i8], [15 x i8], [15 x i8], [16 x i8], [15 x i8], [18 x i8], [20 x i8], [20 x i8], [34 x i8], [28 x i8], [28 x i8], [28 x i8], [28 x i8], [28 x i8], [28 x i8], [28 x i8], [28 x i8], [28 x i8], [28 x i8], [19 x i8] }>
%seg_600e18__init_array_type = type <{ i64, i64 }>
%seg_600ff8__got_type = type <{ i64 }>
%seg_601000__got_plt_type = type <{ [24 x i8], i64, i64, i64 }>
%__bss_start_type = type <{ [8 x i8] }>
%struct.State = type { %struct.ArchState, [32 x %union.VectorReg], %struct.ArithFlags, %union.anon, %struct.Segments, %struct.AddressSpace, %struct.GPR, %struct.X87Stack, %struct.MMX, %struct.FPUStatusFlags, %union.anon, %union.FPU, %struct.SegmentCaches }
%struct.ArchState = type { i32, i32, %union.anon }
%union.VectorReg = type { %union.vec512_t }
%union.vec512_t = type { %struct.uint64v8_t }
%struct.uint64v8_t = type { [8 x i64] }
%struct.ArithFlags = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.Segments = type { i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector }
%union.SegmentSelector = type { i16 }
%struct.AddressSpace = type { i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg }
%struct.Reg = type { %union.anon }
%struct.GPR = type { i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg }
%struct.X87Stack = type { [8 x %struct.anon.3] }
%struct.anon.3 = type { i64, double }
%struct.MMX = type { [8 x %struct.anon.4] }
%struct.anon.4 = type { i64, %union.vec64_t }
%union.vec64_t = type { %struct.uint64v1_t }
%struct.uint64v1_t = type { [1 x i64] }
%struct.FPUStatusFlags = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [4 x i8] }
%union.FPU = type { %struct.anon.13 }
%struct.anon.13 = type { %struct.FpuFXSAVE, [96 x i8] }
%struct.FpuFXSAVE = type { %union.SegmentSelector, %union.SegmentSelector, %union.FPUAbridgedTagWord, i8, i16, i32, %union.SegmentSelector, i16, i32, %union.SegmentSelector, i16, %union.FPUControlStatus, %union.FPUControlStatus, [8 x %struct.FPUStackElem], [16 x %union.vec128_t] }
%union.FPUAbridgedTagWord = type { i8 }
%union.FPUControlStatus = type { i32 }
%struct.FPUStackElem = type { %union.anon.11, [6 x i8] }
%union.anon.11 = type { %struct.float80_t }
%struct.float80_t = type { [10 x i8] }
%union.vec128_t = type { %struct.uint128v1_t }
%struct.uint128v1_t = type { [1 x i128] }
%struct.SegmentCaches = type { %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow }
%struct.SegmentShadow = type { %union.anon, i32, i32 }
%struct.Memory = type opaque

@DR0 = external global i64, align 8
@DR1 = external global i64, align 8
@DR2 = external global i64, align 8
@DR3 = external global i64, align 8
@DR4 = external global i64, align 8
@DR5 = external global i64, align 8
@DR6 = external global i64, align 8
@DR7 = external global i64, align 8
@gCR0 = external global %union.anon, align 1
@gCR1 = external global %union.anon, align 1
@gCR2 = external global %union.anon, align 1
@gCR3 = external global %union.anon, align 1
@gCR4 = external global %union.anon, align 1
@gCR8 = external global %union.anon, align 1
@seg_4009b0__rodata = internal constant %seg_4009b0__rodata_type <{ [4 x i8] c"\01\00\02\00", [16 x i8] c"Input was zero\0A\00", [15 x i8] c"Input was one\0A\00", [15 x i8] c"Input was two\0A\00", [16 x i8] c"Input was four\0A\00", [15 x i8] c"Input was six\0A\00", [18 x i8] c"Input was twelve\0A\00", [20 x i8] c"Input was thirteen\0A\00", [20 x i8] c"Input was nineteen\0A\00", [34 x i8] c"Input was two hundred fifty-five\0A\00", [28 x i8] c"Really big input:  0x12389\0A\00", [28 x i8] c"Really big input:  0x1238A\0A\00", [28 x i8] c"Really big input:  0x1238B\0A\00", [28 x i8] c"Really big input:  0x1238C\0A\00", [28 x i8] c"Really big input:  0x1238D\0A\00", [28 x i8] c"Really big input:  0x1238F\0A\00", [28 x i8] c"Really big input:  0x12390\0A\00", [28 x i8] c"Really big input:  0x12391\0A\00", [28 x i8] c"Really big input:  0x12392\0A\00", [28 x i8] c"Really big input:  0x12393\0A\00", [19 x i8] c"Unknown input: %d\0A\00" }>
@seg_600e18__init_array = internal global %seg_600e18__init_array_type <{ i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_400520_frame_dummy to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_4004f0___do_global_dtors_aux to i64) }>
@seg_600ff8__got = internal global %seg_600ff8__got_type <{ i64 ptrtoint (i64 ()* @__gmon_start__ to i64) }>
@seg_601000__got_plt = internal global %seg_601000__got_plt_type <{ [24 x i8] c"(\0E`\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @printf to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @__libc_start_main to i64), i64 ptrtoint (i64 (i64)* @atoi to i64) }>
@__bss_start = global %__bss_start_type zeroinitializer
@__mcsema_reg_state = internal thread_local global %struct.State zeroinitializer
@__mcsema_stack = internal thread_local global [131072 x i64] zeroinitializer
@__mcsema_tls = internal thread_local global [512 x i64] zeroinitializer
@0 = internal global i1 false
@llvm.global_ctors = appending constant [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 101, void ()* @__mcsema_constructor, i8* null }]
@llvm.global_dtors = appending constant [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 101, void ()* @__mcsema_destructor, i8* null }]

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: noduplicate noinline nounwind optnone
define %struct.Memory* @__remill_error(%struct.State* dereferenceable(3376), i64, %struct.Memory*) local_unnamed_addr #1 {
  call void @llvm.trap()
  unreachable
}

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @__gmon_start__() #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @printf(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @atoi(i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @__libc_start_main(i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4004f0___do_global_dtors_aux(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_4004f0:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %5 = load i8, i8* getelementptr inbounds (%__bss_start_type, %__bss_start_type* @__bss_start, i32 0, i32 0, i32 0)
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  store i8 0, i8* %6, align 1, !tbaa !1231
  %7 = zext i8 %5 to i32
  %8 = tail call i32 @llvm.ctpop.i32(i32 %7) #9
  %9 = trunc i32 %8 to i8
  %10 = and i8 %9, 1
  %11 = xor i8 %10, 1
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  store i8 %11, i8* %12, align 1, !tbaa !1248
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  store i8 0, i8* %13, align 1, !tbaa !1249
  %14 = icmp eq i8 %5, 0
  %15 = zext i1 %14 to i8
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  store i8 %15, i8* %16, align 1, !tbaa !1250
  %17 = lshr i8 %5, 7
  %18 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  store i8 %17, i8* %18, align 1, !tbaa !1251
  %19 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i8 0, i8* %19, align 1, !tbaa !1252
  %20 = select i1 %14, i64 9, i64 32
  %21 = add i64 %20, %1
  %22 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  br i1 %14, label %block_4004f9, label %block_400510

block_4004f9:                                     ; preds = %block_4004f0
  %23 = load i64, i64* %4, align 8
  %24 = load i64, i64* %22, align 8, !tbaa !1253
  %25 = add i64 %24, -8
  %26 = inttoptr i64 %25 to i64*
  store i64 %23, i64* %26
  store i64 %25, i64* %4, align 8, !tbaa !1253
  %27 = add i64 %21, -121
  %28 = add i64 %21, 9
  %29 = add i64 %24, -16
  %30 = inttoptr i64 %29 to i64*
  store i64 %28, i64* %30
  store i64 %29, i64* %22, align 8, !tbaa !1253
  %31 = tail call %struct.Memory* @sub_400480_deregister_tm_clones(%struct.State* nonnull %0, i64 %27, %struct.Memory* %2)
  store i8 1, i8* getelementptr inbounds (%__bss_start_type, %__bss_start_type* @__bss_start, i32 0, i32 0, i32 0)
  %32 = load i64, i64* %22, align 8, !tbaa !1253
  %33 = add i64 %32, 8
  %34 = inttoptr i64 %32 to i64*
  %35 = load i64, i64* %34
  store i64 %35, i64* %4, align 8, !tbaa !1253
  %36 = inttoptr i64 %33 to i64*
  %37 = load i64, i64* %36
  store i64 %37, i64* %3, align 8, !tbaa !1253
  %38 = add i64 %32, 16
  store i64 %38, i64* %22, align 8, !tbaa !1253
  ret %struct.Memory* %31

block_400510:                                     ; preds = %block_4004f0
  %39 = load i64, i64* %22, align 8, !tbaa !1253
  %40 = inttoptr i64 %39 to i64*
  %41 = load i64, i64* %40
  store i64 %41, i64* %3, align 8, !tbaa !1253
  %42 = add i64 %39, 8
  store i64 %42, i64* %22, align 8, !tbaa !1253
  ret %struct.Memory* %2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400480_deregister_tm_clones(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_400480:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  store i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64* %4, align 8, !tbaa !1253
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  store i8 zext (i1 icmp ult (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)) to i8), i8* %5, align 1, !tbaa !1231
  %6 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)) to i32), i32 255)) #9
  %7 = trunc i32 %6 to i8
  %8 = and i8 %7, 1
  %9 = xor i8 %8, 1
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  store i8 %9, i8* %10, align 1, !tbaa !1248
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  store i8 and (i8 trunc (i64 lshr (i64 xor (i64 xor (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64))), i64 4) to i8), i8 1), i8* %11, align 1, !tbaa !1249
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  store i8 zext (i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 0) to i8), i8* %12, align 1, !tbaa !1250
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  store i8 trunc (i64 lshr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 63) to i8), i8* %13, align 1, !tbaa !1251
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i8 zext (i1 icmp eq (i64 add (i64 xor (i64 lshr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 63), i64 lshr (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 63)), i64 xor (i64 lshr (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 63), i64 lshr (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 63))), i64 2) to i8), i8* %14, align 1, !tbaa !1252
  br i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 0), label %block_4004a0, label %block_40048d

block_40048d:                                     ; preds = %block_400480
  store i64 0, i64* %4, align 8, !tbaa !1253
  store i8 0, i8* %5, align 1, !tbaa !1231
  store i8 1, i8* %10, align 1, !tbaa !1248
  store i8 1, i8* %12, align 1, !tbaa !1250
  store i8 0, i8* %13, align 1, !tbaa !1251
  store i8 0, i8* %14, align 1, !tbaa !1252
  store i8 0, i8* %11, align 1, !tbaa !1249
  br label %block_4004a0

block_4004a0:                                     ; preds = %block_40048d, %block_400480
  %15 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %16 = load i64, i64* %15, align 8, !tbaa !1253
  %17 = inttoptr i64 %16 to i64*
  %18 = load i64, i64* %17
  store i64 %18, i64* %3, align 8, !tbaa !1253
  %19 = add i64 %16, 8
  store i64 %19, i64* %15, align 8, !tbaa !1253
  ret %struct.Memory* %2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400520_frame_dummy(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_400520:
  %3 = add i64 %1, -112
  %4 = tail call %struct.Memory* @sub_4004b0_register_tm_clones(%struct.State* nonnull %0, i64 %3, %struct.Memory* %2)
  ret %struct.Memory* %4
}

; Function Attrs: noinline
define %struct.Memory* @sub_400930___libc_csu_init(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400930:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0
  %5 = bitcast %union.anon* %4 to i32*
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 31, i32 0
  %7 = bitcast %union.anon* %6 to i32*
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 3, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %11 = getelementptr inbounds %union.anon, %union.anon* %4, i64 0, i32 0
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 25, i32 0, i32 0
  %15 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 27, i32 0, i32 0
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 29, i32 0, i32 0
  %17 = getelementptr inbounds %union.anon, %union.anon* %6, i64 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = load i64, i64* %12, align 8, !tbaa !1253
  %20 = add i64 %19, -8
  %21 = inttoptr i64 %20 to i64*
  store i64 %18, i64* %21
  %22 = load i64, i64* %16, align 8
  %23 = add i64 %19, -16
  %24 = inttoptr i64 %23 to i64*
  store i64 %22, i64* %24
  %25 = load i32, i32* %5, align 4
  %26 = zext i32 %25 to i64
  store i64 %26, i64* %17, align 8, !tbaa !1253
  %27 = load i64, i64* %15, align 8
  %28 = add i64 %19, -24
  %29 = inttoptr i64 %28 to i64*
  store i64 %27, i64* %29
  %30 = load i64, i64* %14, align 8
  %31 = add i64 %19, -32
  %32 = inttoptr i64 %31 to i64*
  store i64 %30, i64* %32
  store i64 ptrtoint (%seg_600e18__init_array_type* @seg_600e18__init_array to i64), i64* %14, align 8, !tbaa !1253
  %33 = load i64, i64* %13, align 8
  %34 = add i64 %19, -40
  %35 = inttoptr i64 %34 to i64*
  store i64 %33, i64* %35
  %36 = load i64, i64* %8, align 8
  %37 = add i64 %19, -48
  %38 = inttoptr i64 %37 to i64*
  store i64 %36, i64* %38
  %39 = load i64, i64* %10, align 8
  store i64 %39, i64* %16, align 8, !tbaa !1253
  %40 = load i64, i64* %9, align 8
  store i64 %40, i64* %15, align 8, !tbaa !1253
  %41 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %42 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %43 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %44 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %45 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %46 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i64 ashr (i64 sub (i64 add (i64 ptrtoint (%seg_600e18__init_array_type* @seg_600e18__init_array to i64), i64 8), i64 ptrtoint (%seg_600e18__init_array_type* @seg_600e18__init_array to i64)), i64 3), i64* %13, align 8, !tbaa !1253
  %47 = add i64 %1, -1360
  %48 = add i64 %1, 49
  %49 = add i64 %19, -64
  %50 = inttoptr i64 %49 to i64*
  store i64 %48, i64* %50
  store i64 %49, i64* %12, align 8, !tbaa !1253
  %51 = tail call %struct.Memory* @sub_4003e0__init_proc(%struct.State* nonnull %0, i64 %47, %struct.Memory* %2)
  %52 = load i64, i64* %13, align 8
  %53 = load i64, i64* %3, align 8
  %54 = icmp eq i64 %52, 0
  %55 = select i1 %54, i64 37, i64 5
  %56 = add i64 %53, %55
  br i1 %54, label %block_400986, label %block_400966

block_400966:                                     ; preds = %block_400930
  store i64 0, i64* %8, align 8, !tbaa !1253
  store i8 0, i8* %41, align 1, !tbaa !1231
  store i8 1, i8* %42, align 1, !tbaa !1248
  store i8 1, i8* %44, align 1, !tbaa !1250
  store i8 0, i8* %45, align 1, !tbaa !1251
  store i8 0, i8* %46, align 1, !tbaa !1252
  store i8 0, i8* %43, align 1, !tbaa !1249
  %57 = add i64 %56, 10
  br label %block_400970

block_400970:                                     ; preds = %block_400970, %block_400966
  %58 = phi i64 [ 0, %block_400966 ], [ %77, %block_400970 ]
  %59 = phi i64 [ %57, %block_400966 ], [ %105, %block_400970 ]
  %60 = phi %struct.Memory* [ %51, %block_400966 ], [ %74, %block_400970 ]
  %61 = load i64, i64* %15, align 8
  store i64 %61, i64* %9, align 8, !tbaa !1253
  %62 = load i64, i64* %16, align 8
  store i64 %62, i64* %10, align 8, !tbaa !1253
  %63 = load i32, i32* %7, align 4
  %64 = zext i32 %63 to i64
  store i64 %64, i64* %11, align 8, !tbaa !1253
  %65 = load i64, i64* %14, align 8
  %66 = shl i64 %58, 3
  %67 = add i64 %66, %65
  %68 = add i64 %59, 13
  %69 = load i64, i64* %12, align 8, !tbaa !1253
  %70 = add i64 %69, -8
  %71 = inttoptr i64 %70 to i64*
  store i64 %68, i64* %71
  store i64 %70, i64* %12, align 8, !tbaa !1253
  %72 = inttoptr i64 %67 to i64*
  %73 = load i64, i64* %72
  store i64 %73, i64* %3, align 8, !tbaa !1253
  %74 = tail call %struct.Memory* @__mcsema_detach_call_value(%struct.State* nonnull %0, i64 %73, %struct.Memory* %60)
  %75 = load i64, i64* %8, align 8
  %76 = load i64, i64* %3, align 8
  %77 = add i64 %75, 1
  store i64 %77, i64* %8, align 8, !tbaa !1253
  %78 = lshr i64 %77, 63
  %79 = load i64, i64* %13, align 8
  %80 = sub i64 %77, %79
  %81 = icmp ult i64 %77, %79
  %82 = zext i1 %81 to i8
  store i8 %82, i8* %41, align 1, !tbaa !1231
  %83 = trunc i64 %80 to i32
  %84 = and i32 %83, 255
  %85 = tail call i32 @llvm.ctpop.i32(i32 %84) #9
  %86 = trunc i32 %85 to i8
  %87 = and i8 %86, 1
  %88 = xor i8 %87, 1
  store i8 %88, i8* %42, align 1, !tbaa !1248
  %89 = xor i64 %79, %77
  %90 = xor i64 %89, %80
  %91 = lshr i64 %90, 4
  %92 = trunc i64 %91 to i8
  %93 = and i8 %92, 1
  store i8 %93, i8* %43, align 1, !tbaa !1249
  %94 = icmp eq i64 %80, 0
  %95 = zext i1 %94 to i8
  store i8 %95, i8* %44, align 1, !tbaa !1250
  %96 = lshr i64 %80, 63
  %97 = trunc i64 %96 to i8
  store i8 %97, i8* %45, align 1, !tbaa !1251
  %98 = lshr i64 %79, 63
  %99 = xor i64 %98, %78
  %100 = xor i64 %96, %78
  %101 = add nuw nsw i64 %100, %99
  %102 = icmp eq i64 %101, 2
  %103 = zext i1 %102 to i8
  store i8 %103, i8* %46, align 1, !tbaa !1252
  %104 = select i1 %94, i64 9, i64 -13
  %105 = add i64 %76, %104
  br i1 %94, label %block_400986.loopexit, label %block_400970

block_400986.loopexit:                            ; preds = %block_400970
  br label %block_400986

block_400986:                                     ; preds = %block_400986.loopexit, %block_400930
  %106 = phi %struct.Memory* [ %51, %block_400930 ], [ %74, %block_400986.loopexit ]
  %107 = load i64, i64* %12, align 8
  %108 = add i64 %107, 8
  %109 = icmp ugt i64 %107, -9
  %110 = zext i1 %109 to i8
  store i8 %110, i8* %41, align 1, !tbaa !1231
  %111 = trunc i64 %108 to i32
  %112 = and i32 %111, 255
  %113 = tail call i32 @llvm.ctpop.i32(i32 %112) #9
  %114 = trunc i32 %113 to i8
  %115 = and i8 %114, 1
  %116 = xor i8 %115, 1
  store i8 %116, i8* %42, align 1, !tbaa !1248
  %117 = xor i64 %108, %107
  %118 = lshr i64 %117, 4
  %119 = trunc i64 %118 to i8
  %120 = and i8 %119, 1
  store i8 %120, i8* %43, align 1, !tbaa !1249
  %121 = icmp eq i64 %108, 0
  %122 = zext i1 %121 to i8
  store i8 %122, i8* %44, align 1, !tbaa !1250
  %123 = lshr i64 %108, 63
  %124 = trunc i64 %123 to i8
  store i8 %124, i8* %45, align 1, !tbaa !1251
  %125 = lshr i64 %107, 63
  %126 = xor i64 %123, %125
  %127 = add nuw nsw i64 %126, %123
  %128 = icmp eq i64 %127, 2
  %129 = zext i1 %128 to i8
  store i8 %129, i8* %46, align 1, !tbaa !1252
  %130 = add i64 %107, 16
  %131 = inttoptr i64 %108 to i64*
  %132 = load i64, i64* %131
  store i64 %132, i64* %8, align 8, !tbaa !1253
  %133 = add i64 %107, 24
  %134 = inttoptr i64 %130 to i64*
  %135 = load i64, i64* %134
  store i64 %135, i64* %13, align 8, !tbaa !1253
  %136 = add i64 %107, 32
  %137 = inttoptr i64 %133 to i64*
  %138 = load i64, i64* %137
  store i64 %138, i64* %14, align 8, !tbaa !1253
  %139 = add i64 %107, 40
  %140 = inttoptr i64 %136 to i64*
  %141 = load i64, i64* %140
  store i64 %141, i64* %15, align 8, !tbaa !1253
  %142 = add i64 %107, 48
  %143 = inttoptr i64 %139 to i64*
  %144 = load i64, i64* %143
  store i64 %144, i64* %16, align 8, !tbaa !1253
  %145 = add i64 %107, 56
  %146 = inttoptr i64 %142 to i64*
  %147 = load i64, i64* %146
  store i64 %147, i64* %17, align 8, !tbaa !1253
  %148 = inttoptr i64 %145 to i64*
  %149 = load i64, i64* %148
  store i64 %149, i64* %3, align 8, !tbaa !1253
  %150 = add i64 %107, 64
  store i64 %150, i64* %12, align 8, !tbaa !1253
  ret %struct.Memory* %106
}

; Function Attrs: noinline
define %struct.Memory* @sub_400450__start(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400450:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  store i64 0, i64* %10, align 8, !tbaa !1253
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %15 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %17 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  %18 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %19 = load i64, i64* %6, align 8
  store i64 %19, i64* %12, align 8, !tbaa !1253
  %20 = load i64, i64* %9, align 8, !tbaa !1253
  %21 = add i64 %20, 8
  %22 = inttoptr i64 %20 to i64*
  %23 = load i64, i64* %22
  store i64 %23, i64* %7, align 8, !tbaa !1253
  store i64 %21, i64* %6, align 8, !tbaa !1253
  %24 = and i64 %21, -16
  store i8 0, i8* %13, align 1, !tbaa !1231
  %25 = trunc i64 %21 to i32
  %26 = and i32 %25, 240
  %27 = tail call i32 @llvm.ctpop.i32(i32 %26) #9
  %28 = trunc i32 %27 to i8
  %29 = and i8 %28, 1
  %30 = xor i8 %29, 1
  store i8 %30, i8* %14, align 1, !tbaa !1248
  %31 = icmp eq i64 %24, 0
  %32 = zext i1 %31 to i8
  store i8 %32, i8* %15, align 1, !tbaa !1250
  %33 = lshr i64 %21, 63
  %34 = trunc i64 %33 to i8
  store i8 %34, i8* %16, align 1, !tbaa !1251
  store i8 0, i8* %17, align 1, !tbaa !1252
  store i8 0, i8* %18, align 1, !tbaa !1249
  %35 = load i64, i64* %4, align 8
  %36 = add i64 %24, -8
  %37 = inttoptr i64 %36 to i64*
  store i64 %35, i64* %37
  %38 = add i64 %24, -16
  %39 = inttoptr i64 %38 to i64*
  store i64 %36, i64* %39
  store i64 ptrtoint (i64 ()* @callback_sub_4009a0___libc_csu_fini to i64), i64* %11, align 8, !tbaa !1253
  store i64 ptrtoint (i64 ()* @callback_sub_400930___libc_csu_init to i64), i64* %5, align 8, !tbaa !1253
  store i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64* %8, align 8, !tbaa !1253
  %40 = add i64 %1, 41
  %41 = add i64 %24, -24
  %42 = inttoptr i64 %41 to i64*
  store i64 %40, i64* %42
  %43 = inttoptr i64 %38 to i64*
  %44 = load i64, i64* %43
  %45 = add i64 %24, -8
  %46 = inttoptr i64 %45 to i64*
  %47 = load i64, i64* %46
  %48 = inttoptr i64 %41 to i64*
  %49 = load i64, i64* %48
  store i64 %38, i64* %9, align 8, !alias.scope !1254, !noalias !1257
  %50 = tail call i64 @__libc_start_main(i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64 %23, i64 %21, i64 ptrtoint (i64 ()* @callback_sub_400930___libc_csu_init to i64), i64 ptrtoint (i64 ()* @callback_sub_4009a0___libc_csu_fini to i64), i64 %19, i64 %44, i64 %47), !noalias !1254
  store i64 %50, i64* %4, align 8, !alias.scope !1254, !noalias !1257
  %51 = add i64 %49, 1
  store i64 %51, i64* %3, align 8
  %52 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull %0, i64 %51, %struct.Memory* %2)
  ret %struct.Memory* %52
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4009a4__term_proc(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #3 {
block_4009a4:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %5 = load i64, i64* %4, align 8
  %6 = add i64 %5, -8
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %9 = xor i64 %6, %5
  %10 = lshr i64 %9, 4
  %11 = trunc i64 %10 to i8
  %12 = and i8 %11, 1
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %15 = lshr i64 %6, 63
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %17 = lshr i64 %5, 63
  %18 = xor i64 %15, %17
  %19 = add nuw nsw i64 %18, %17
  %20 = icmp eq i64 %19, 2
  %21 = zext i1 %20 to i8
  %22 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  %23 = icmp ult i64 %5, 8
  %24 = zext i1 %23 to i8
  store i8 %24, i8* %7, align 1, !tbaa !1231
  %25 = trunc i64 %5 to i32
  %26 = and i32 %25, 255
  %27 = tail call i32 @llvm.ctpop.i32(i32 %26) #9
  %28 = trunc i32 %27 to i8
  %29 = and i8 %28, 1
  %30 = xor i8 %29, 1
  store i8 %30, i8* %8, align 1, !tbaa !1248
  store i8 %12, i8* %13, align 1, !tbaa !1249
  %31 = icmp eq i64 %5, 0
  %32 = zext i1 %31 to i8
  store i8 %32, i8* %14, align 1, !tbaa !1250
  %33 = trunc i64 %17 to i8
  store i8 %33, i8* %16, align 1, !tbaa !1251
  store i8 %21, i8* %22, align 1, !tbaa !1252
  %34 = inttoptr i64 %5 to i64*
  %35 = load i64, i64* %34
  store i64 %35, i64* %3, align 8, !tbaa !1253
  %36 = add i64 %5, 8
  store i64 %36, i64* %4, align 8, !tbaa !1253
  ret %struct.Memory* %2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400440(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #4 {
block_400440:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %6 = load i64, i64* %5, align 8, !alias.scope !1259, !noalias !1262
  %7 = inttoptr i64 %6 to i64*
  %8 = load i64, i64* %7
  store i64 %8, i64* %3, align 8, !alias.scope !1259, !noalias !1262
  %9 = add i64 %6, 8
  store i64 %9, i64* %5, align 8, !alias.scope !1259, !noalias !1262
  %10 = tail call i64 @__gmon_start__(), !noalias !1259
  store i64 %10, i64* %4, align 8, !alias.scope !1259, !noalias !1262
  ret %struct.Memory* %2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400530_main(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400530:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0
  %6 = bitcast %union.anon* %5 to i32*
  %7 = getelementptr inbounds %union.anon, %union.anon* %4, i64 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %9 = getelementptr inbounds %union.anon, %union.anon* %5, i64 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %12 = load i64, i64* %11, align 8
  %13 = load i64, i64* %10, align 8, !tbaa !1253
  %14 = add i64 %13, -8
  %15 = inttoptr i64 %14 to i64*
  store i64 %12, i64* %15
  store i64 %14, i64* %11, align 8, !tbaa !1253
  %16 = add i64 %13, -184
  %17 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %18 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %19 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %20 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %21 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %22 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  %23 = add i64 %13, -12
  %24 = inttoptr i64 %23 to i32*
  store i32 0, i32* %24
  %25 = add i64 %13, -16
  %26 = load i32, i32* %6, align 4
  %27 = inttoptr i64 %25 to i32*
  store i32 %26, i32* %27
  %28 = add i64 %13, -24
  %29 = load i64, i64* %8, align 8
  %30 = inttoptr i64 %28 to i64*
  store i64 %29, i64* %30
  %31 = inttoptr i64 %25 to i32*
  %32 = load i32, i32* %31
  %33 = add i32 %32, -2
  %34 = lshr i32 %33, 31
  %35 = trunc i32 %34 to i8
  %36 = lshr i32 %32, 31
  %37 = xor i32 %34, %36
  %38 = add nuw nsw i32 %37, %36
  %39 = icmp eq i32 %38, 2
  %40 = icmp ne i8 %35, 0
  %41 = xor i1 %40, %39
  %42 = select i1 %41, i64 35, i64 47
  %43 = add i64 %42, %1
  br i1 %41, label %block_400553, label %block_40055f

block_40077d:                                     ; preds = %block_4005cd
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 81), i64* %9, align 8, !tbaa !1253
  %44 = add i64 %467, 17
  %45 = load i64, i64* %10, align 8, !tbaa !1253
  %46 = add i64 %45, -8
  %47 = inttoptr i64 %46 to i64*
  store i64 %44, i64* %47
  %48 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %49 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %50 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %51 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %52 = load i64, i64* %8, align 8, !alias.scope !1264, !noalias !1267
  %53 = load i64, i64* %49, align 8, !alias.scope !1264, !noalias !1267
  %54 = load i64, i64* %48, align 8, !alias.scope !1264, !noalias !1267
  %55 = load i64, i64* %50, align 8, !alias.scope !1264, !noalias !1267
  %56 = load i64, i64* %51, align 8, !alias.scope !1264, !noalias !1267
  %57 = inttoptr i64 %45 to i64*
  %58 = load i64, i64* %57
  %59 = add i64 %45, 8
  %60 = inttoptr i64 %59 to i64*
  %61 = load i64, i64* %60
  %62 = add i64 %45, 16
  %63 = inttoptr i64 %62 to i64*
  %64 = load i64, i64* %63
  %65 = add i64 %45, 24
  %66 = inttoptr i64 %65 to i64*
  %67 = load i64, i64* %66
  %68 = add i64 %45, 32
  %69 = inttoptr i64 %68 to i64*
  %70 = load i64, i64* %69
  %71 = add i64 %45, 40
  %72 = inttoptr i64 %71 to i64*
  %73 = load i64, i64* %72
  %74 = add i64 %45, 48
  %75 = inttoptr i64 %74 to i64*
  %76 = load i64, i64* %75
  %77 = add i64 %45, 56
  %78 = inttoptr i64 %77 to i64*
  %79 = load i64, i64* %78
  %80 = add i64 %45, 64
  %81 = inttoptr i64 %80 to i64*
  %82 = load i64, i64* %81
  %83 = add i64 %45, 72
  %84 = inttoptr i64 %83 to i64*
  %85 = load i64, i64* %84
  %86 = inttoptr i64 %46 to i64*
  %87 = load i64, i64* %86
  store i64 %87, i64* %3, align 8, !alias.scope !1264, !noalias !1267
  store i64 %45, i64* %10, align 8, !alias.scope !1264, !noalias !1267
  %88 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 81), i64 %52, i64 %53, i64 %54, i64 %55, i64 %56, i64 %58, i64 %61, i64 %64, i64 %67, i64 %70, i64 %73, i64 %76, i64 %79, i64 %82, i64 %85), !noalias !1264
  %89 = load i64, i64* %11, align 8
  %90 = add i64 %89, -120
  %91 = trunc i64 %88 to i32
  %92 = inttoptr i64 %90 to i32*
  store i32 %91, i32* %92
  br label %block_400916

block_4006fb:                                     ; preds = %block_4006e5
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 453), i64* %9, align 8, !tbaa !1253
  %93 = inttoptr i64 %335 to i32*
  %94 = load i32, i32* %93
  %95 = zext i32 %94 to i64
  store i64 %95, i64* %8, align 8, !tbaa !1253
  %96 = add i64 %948, 533
  %97 = load i64, i64* %10, align 8, !tbaa !1253
  %98 = add i64 %97, -8
  %99 = inttoptr i64 %98 to i64*
  store i64 %96, i64* %99
  %100 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %101 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %102 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %103 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %104 = load i64, i64* %101, align 8, !alias.scope !1269, !noalias !1272
  %105 = load i64, i64* %100, align 8, !alias.scope !1269, !noalias !1272
  %106 = load i64, i64* %102, align 8, !alias.scope !1269, !noalias !1272
  %107 = load i64, i64* %103, align 8, !alias.scope !1269, !noalias !1272
  %108 = inttoptr i64 %97 to i64*
  %109 = load i64, i64* %108
  %110 = add i64 %97, 8
  %111 = inttoptr i64 %110 to i64*
  %112 = load i64, i64* %111
  %113 = add i64 %97, 16
  %114 = inttoptr i64 %113 to i64*
  %115 = load i64, i64* %114
  %116 = add i64 %97, 24
  %117 = inttoptr i64 %116 to i64*
  %118 = load i64, i64* %117
  %119 = add i64 %97, 32
  %120 = inttoptr i64 %119 to i64*
  %121 = load i64, i64* %120
  %122 = add i64 %97, 40
  %123 = inttoptr i64 %122 to i64*
  %124 = load i64, i64* %123
  %125 = add i64 %97, 48
  %126 = inttoptr i64 %125 to i64*
  %127 = load i64, i64* %126
  %128 = add i64 %97, 56
  %129 = inttoptr i64 %128 to i64*
  %130 = load i64, i64* %129
  %131 = add i64 %97, 64
  %132 = inttoptr i64 %131 to i64*
  %133 = load i64, i64* %132
  %134 = add i64 %97, 72
  %135 = inttoptr i64 %134 to i64*
  %136 = load i64, i64* %135
  %137 = inttoptr i64 %98 to i64*
  %138 = load i64, i64* %137
  store i64 %138, i64* %3, align 8, !alias.scope !1269, !noalias !1272
  store i64 %97, i64* %10, align 8, !alias.scope !1269, !noalias !1272
  %139 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 453), i64 %95, i64 %104, i64 %105, i64 %106, i64 %107, i64 %109, i64 %112, i64 %115, i64 %118, i64 %121, i64 %124, i64 %127, i64 %130, i64 %133, i64 %136), !noalias !1269
  %140 = load i64, i64* %11, align 8
  %141 = add i64 %140, -176
  %142 = trunc i64 %139 to i32
  %143 = inttoptr i64 %141 to i32*
  store i32 %142, i32* %143
  br label %block_400916

block_400677:                                     ; preds = %block_400661
  %144 = inttoptr i64 %342 to i32*
  %145 = load i32, i32* %144
  %146 = add i32 %145, -74637
  %147 = icmp eq i32 %146, 0
  %148 = add i64 %334, -76
  %149 = inttoptr i64 %148 to i32*
  store i32 %146, i32* %149
  %150 = select i1 %147, i64 477, i64 22
  %151 = add i64 %273, %150
  br i1 %147, label %block_400854, label %block_40068d

block_4005f5:                                     ; preds = %block_4005e1
  %152 = inttoptr i64 %342 to i32*
  %153 = load i32, i32* %152
  %154 = add i32 %153, -19
  %155 = icmp eq i32 %154, 0
  %156 = add i64 %334, -52
  %157 = inttoptr i64 %156 to i32*
  store i32 %154, i32* %157
  %158 = select i1 %155, i64 442, i64 20
  %159 = add i64 %741, %158
  br i1 %155, label %block_4007af, label %block_400609

block_4008a8:                                     ; preds = %block_4006b9
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 369), i64* %9, align 8, !tbaa !1253
  %160 = add i64 %353, 17
  %161 = load i64, i64* %10, align 8, !tbaa !1253
  %162 = add i64 %161, -8
  %163 = inttoptr i64 %162 to i64*
  store i64 %160, i64* %163
  %164 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %165 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %166 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %167 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %168 = load i64, i64* %8, align 8, !alias.scope !1274, !noalias !1277
  %169 = load i64, i64* %165, align 8, !alias.scope !1274, !noalias !1277
  %170 = load i64, i64* %164, align 8, !alias.scope !1274, !noalias !1277
  %171 = load i64, i64* %166, align 8, !alias.scope !1274, !noalias !1277
  %172 = load i64, i64* %167, align 8, !alias.scope !1274, !noalias !1277
  %173 = inttoptr i64 %161 to i64*
  %174 = load i64, i64* %173
  %175 = add i64 %161, 8
  %176 = inttoptr i64 %175 to i64*
  %177 = load i64, i64* %176
  %178 = add i64 %161, 16
  %179 = inttoptr i64 %178 to i64*
  %180 = load i64, i64* %179
  %181 = add i64 %161, 24
  %182 = inttoptr i64 %181 to i64*
  %183 = load i64, i64* %182
  %184 = add i64 %161, 32
  %185 = inttoptr i64 %184 to i64*
  %186 = load i64, i64* %185
  %187 = add i64 %161, 40
  %188 = inttoptr i64 %187 to i64*
  %189 = load i64, i64* %188
  %190 = add i64 %161, 48
  %191 = inttoptr i64 %190 to i64*
  %192 = load i64, i64* %191
  %193 = add i64 %161, 56
  %194 = inttoptr i64 %193 to i64*
  %195 = load i64, i64* %194
  %196 = add i64 %161, 64
  %197 = inttoptr i64 %196 to i64*
  %198 = load i64, i64* %197
  %199 = add i64 %161, 72
  %200 = inttoptr i64 %199 to i64*
  %201 = load i64, i64* %200
  %202 = inttoptr i64 %162 to i64*
  %203 = load i64, i64* %202
  store i64 %203, i64* %3, align 8, !alias.scope !1274, !noalias !1277
  store i64 %161, i64* %10, align 8, !alias.scope !1274, !noalias !1277
  %204 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 369), i64 %168, i64 %169, i64 %170, i64 %171, i64 %172, i64 %174, i64 %177, i64 %180, i64 %183, i64 %186, i64 %189, i64 %192, i64 %195, i64 %198, i64 %201), !noalias !1274
  %205 = load i64, i64* %11, align 8
  %206 = add i64 %205, -164
  %207 = trunc i64 %204 to i32
  %208 = inttoptr i64 %206 to i32*
  store i32 %207, i32* %208
  br label %block_400916

block_40057d:                                     ; preds = %block_40055f
  %209 = inttoptr i64 %342 to i32*
  %210 = load i32, i32* %209
  %211 = add i32 %210, -1
  %212 = icmp eq i32 %211, 0
  %213 = add i64 %334, -28
  %214 = inttoptr i64 %213 to i32*
  store i32 %211, i32* %214
  %215 = select i1 %212, i64 412, i64 20
  %216 = add i64 %345, %215
  br i1 %212, label %block_400719, label %block_400591

block_4007e4:                                     ; preds = %block_40061f
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 173), i64* %9, align 8, !tbaa !1253
  %217 = add i64 %806, 17
  %218 = load i64, i64* %10, align 8, !tbaa !1253
  %219 = add i64 %218, -8
  %220 = inttoptr i64 %219 to i64*
  store i64 %217, i64* %220
  %221 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %222 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %223 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %224 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %225 = load i64, i64* %8, align 8, !alias.scope !1279, !noalias !1282
  %226 = load i64, i64* %222, align 8, !alias.scope !1279, !noalias !1282
  %227 = load i64, i64* %221, align 8, !alias.scope !1279, !noalias !1282
  %228 = load i64, i64* %223, align 8, !alias.scope !1279, !noalias !1282
  %229 = load i64, i64* %224, align 8, !alias.scope !1279, !noalias !1282
  %230 = inttoptr i64 %218 to i64*
  %231 = load i64, i64* %230
  %232 = add i64 %218, 8
  %233 = inttoptr i64 %232 to i64*
  %234 = load i64, i64* %233
  %235 = add i64 %218, 16
  %236 = inttoptr i64 %235 to i64*
  %237 = load i64, i64* %236
  %238 = add i64 %218, 24
  %239 = inttoptr i64 %238 to i64*
  %240 = load i64, i64* %239
  %241 = add i64 %218, 32
  %242 = inttoptr i64 %241 to i64*
  %243 = load i64, i64* %242
  %244 = add i64 %218, 40
  %245 = inttoptr i64 %244 to i64*
  %246 = load i64, i64* %245
  %247 = add i64 %218, 48
  %248 = inttoptr i64 %247 to i64*
  %249 = load i64, i64* %248
  %250 = add i64 %218, 56
  %251 = inttoptr i64 %250 to i64*
  %252 = load i64, i64* %251
  %253 = add i64 %218, 64
  %254 = inttoptr i64 %253 to i64*
  %255 = load i64, i64* %254
  %256 = add i64 %218, 72
  %257 = inttoptr i64 %256 to i64*
  %258 = load i64, i64* %257
  %259 = inttoptr i64 %219 to i64*
  %260 = load i64, i64* %259
  store i64 %260, i64* %3, align 8, !alias.scope !1279, !noalias !1282
  store i64 %218, i64* %10, align 8, !alias.scope !1279, !noalias !1282
  %261 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 173), i64 %225, i64 %226, i64 %227, i64 %228, i64 %229, i64 %231, i64 %234, i64 %237, i64 %240, i64 %243, i64 %246, i64 %249, i64 %252, i64 %255, i64 %258), !noalias !1279
  %262 = load i64, i64* %11, align 8
  %263 = add i64 %262, -136
  %264 = trunc i64 %261 to i32
  %265 = inttoptr i64 %263 to i32*
  store i32 %264, i32* %265
  br label %block_400916

block_400661:                                     ; preds = %block_40064b
  %266 = inttoptr i64 %342 to i32*
  %267 = load i32, i32* %266
  %268 = add i32 %267, -74636
  %269 = icmp eq i32 %268, 0
  %270 = add i64 %334, -72
  %271 = inttoptr i64 %270 to i32*
  store i32 %268, i32* %271
  %272 = select i1 %269, i64 471, i64 22
  %273 = add i64 %1128, %272
  br i1 %269, label %block_400838, label %block_400677

block_4008e0:                                     ; preds = %block_4006e5
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 425), i64* %9, align 8, !tbaa !1253
  %274 = add i64 %948, 17
  %275 = load i64, i64* %10, align 8, !tbaa !1253
  %276 = add i64 %275, -8
  %277 = inttoptr i64 %276 to i64*
  store i64 %274, i64* %277
  %278 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %279 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %280 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %281 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %282 = load i64, i64* %8, align 8, !alias.scope !1284, !noalias !1287
  %283 = load i64, i64* %279, align 8, !alias.scope !1284, !noalias !1287
  %284 = load i64, i64* %278, align 8, !alias.scope !1284, !noalias !1287
  %285 = load i64, i64* %280, align 8, !alias.scope !1284, !noalias !1287
  %286 = load i64, i64* %281, align 8, !alias.scope !1284, !noalias !1287
  %287 = inttoptr i64 %275 to i64*
  %288 = load i64, i64* %287
  %289 = add i64 %275, 8
  %290 = inttoptr i64 %289 to i64*
  %291 = load i64, i64* %290
  %292 = add i64 %275, 16
  %293 = inttoptr i64 %292 to i64*
  %294 = load i64, i64* %293
  %295 = add i64 %275, 24
  %296 = inttoptr i64 %295 to i64*
  %297 = load i64, i64* %296
  %298 = add i64 %275, 32
  %299 = inttoptr i64 %298 to i64*
  %300 = load i64, i64* %299
  %301 = add i64 %275, 40
  %302 = inttoptr i64 %301 to i64*
  %303 = load i64, i64* %302
  %304 = add i64 %275, 48
  %305 = inttoptr i64 %304 to i64*
  %306 = load i64, i64* %305
  %307 = add i64 %275, 56
  %308 = inttoptr i64 %307 to i64*
  %309 = load i64, i64* %308
  %310 = add i64 %275, 64
  %311 = inttoptr i64 %310 to i64*
  %312 = load i64, i64* %311
  %313 = add i64 %275, 72
  %314 = inttoptr i64 %313 to i64*
  %315 = load i64, i64* %314
  %316 = inttoptr i64 %276 to i64*
  %317 = load i64, i64* %316
  store i64 %317, i64* %3, align 8, !alias.scope !1284, !noalias !1287
  store i64 %275, i64* %10, align 8, !alias.scope !1284, !noalias !1287
  %318 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 425), i64 %282, i64 %283, i64 %284, i64 %285, i64 %286, i64 %288, i64 %291, i64 %294, i64 %297, i64 %300, i64 %303, i64 %306, i64 %309, i64 %312, i64 %315), !noalias !1284
  %319 = load i64, i64* %11, align 8
  %320 = add i64 %319, -172
  %321 = trunc i64 %318 to i32
  %322 = inttoptr i64 %320 to i32*
  store i32 %321, i32* %322
  br label %block_400916

block_40055f:                                     ; preds = %block_400530
  %323 = inttoptr i64 %28 to i64*
  %324 = load i64, i64* %323
  %325 = add i64 %324, 8
  %326 = inttoptr i64 %325 to i64*
  %327 = load i64, i64* %326
  %328 = add i64 %43, 13
  %329 = add i64 %13, -192
  %330 = inttoptr i64 %329 to i64*
  store i64 %328, i64* %330
  %331 = inttoptr i64 %329 to i64*
  %332 = load i64, i64* %331
  store i64 %332, i64* %3, align 8, !alias.scope !1289, !noalias !1292
  store i64 %16, i64* %10, align 8, !alias.scope !1289, !noalias !1292
  %333 = tail call i64 @atoi(i64 %327), !noalias !1289
  %334 = load i64, i64* %11, align 8
  %335 = add i64 %334, -20
  %336 = trunc i64 %333 to i32
  %337 = load i64, i64* %3, align 8
  %338 = inttoptr i64 %335 to i32*
  store i32 %336, i32* %338
  %339 = inttoptr i64 %335 to i32*
  %340 = load i32, i32* %339
  %341 = icmp eq i32 %340, 0
  %342 = add i64 %334, -24
  %343 = inttoptr i64 %342 to i32*
  store i32 %340, i32* %343
  %344 = select i1 %341, i64 404, i64 17
  %345 = add i64 %337, %344
  br i1 %341, label %block_400700, label %block_40057d

block_4006b9:                                     ; preds = %block_4006a3
  %346 = inttoptr i64 %342 to i32*
  %347 = load i32, i32* %346
  %348 = add i32 %347, -74641
  %349 = icmp eq i32 %348, 0
  %350 = add i64 %334, -88
  %351 = inttoptr i64 %350 to i32*
  store i32 %348, i32* %351
  %352 = select i1 %349, i64 495, i64 22
  %353 = add i64 %798, %352
  br i1 %349, label %block_4008a8, label %block_4006cf

block_400870:                                     ; preds = %block_40068d
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 313), i64* %9, align 8, !tbaa !1253
  %354 = add i64 %965, 17
  %355 = load i64, i64* %10, align 8, !tbaa !1253
  %356 = add i64 %355, -8
  %357 = inttoptr i64 %356 to i64*
  store i64 %354, i64* %357
  %358 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %359 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %360 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %361 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %362 = load i64, i64* %8, align 8, !alias.scope !1294, !noalias !1297
  %363 = load i64, i64* %359, align 8, !alias.scope !1294, !noalias !1297
  %364 = load i64, i64* %358, align 8, !alias.scope !1294, !noalias !1297
  %365 = load i64, i64* %360, align 8, !alias.scope !1294, !noalias !1297
  %366 = load i64, i64* %361, align 8, !alias.scope !1294, !noalias !1297
  %367 = inttoptr i64 %355 to i64*
  %368 = load i64, i64* %367
  %369 = add i64 %355, 8
  %370 = inttoptr i64 %369 to i64*
  %371 = load i64, i64* %370
  %372 = add i64 %355, 16
  %373 = inttoptr i64 %372 to i64*
  %374 = load i64, i64* %373
  %375 = add i64 %355, 24
  %376 = inttoptr i64 %375 to i64*
  %377 = load i64, i64* %376
  %378 = add i64 %355, 32
  %379 = inttoptr i64 %378 to i64*
  %380 = load i64, i64* %379
  %381 = add i64 %355, 40
  %382 = inttoptr i64 %381 to i64*
  %383 = load i64, i64* %382
  %384 = add i64 %355, 48
  %385 = inttoptr i64 %384 to i64*
  %386 = load i64, i64* %385
  %387 = add i64 %355, 56
  %388 = inttoptr i64 %387 to i64*
  %389 = load i64, i64* %388
  %390 = add i64 %355, 64
  %391 = inttoptr i64 %390 to i64*
  %392 = load i64, i64* %391
  %393 = add i64 %355, 72
  %394 = inttoptr i64 %393 to i64*
  %395 = load i64, i64* %394
  %396 = inttoptr i64 %356 to i64*
  %397 = load i64, i64* %396
  store i64 %397, i64* %3, align 8, !alias.scope !1294, !noalias !1297
  store i64 %355, i64* %10, align 8, !alias.scope !1294, !noalias !1297
  %398 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 313), i64 %362, i64 %363, i64 %364, i64 %365, i64 %366, i64 %368, i64 %371, i64 %374, i64 %377, i64 %380, i64 %383, i64 %386, i64 %389, i64 %392, i64 %395), !noalias !1294
  %399 = load i64, i64* %11, align 8
  %400 = add i64 %399, -156
  %401 = trunc i64 %398 to i32
  %402 = inttoptr i64 %400 to i32*
  store i32 %401, i32* %402
  br label %block_400916

block_400764:                                     ; preds = %block_4005b9
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 66), i64* %9, align 8, !tbaa !1253
  %403 = add i64 %573, 17
  %404 = load i64, i64* %10, align 8, !tbaa !1253
  %405 = add i64 %404, -8
  %406 = inttoptr i64 %405 to i64*
  store i64 %403, i64* %406
  %407 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %408 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %409 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %410 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %411 = load i64, i64* %8, align 8, !alias.scope !1299, !noalias !1302
  %412 = load i64, i64* %408, align 8, !alias.scope !1299, !noalias !1302
  %413 = load i64, i64* %407, align 8, !alias.scope !1299, !noalias !1302
  %414 = load i64, i64* %409, align 8, !alias.scope !1299, !noalias !1302
  %415 = load i64, i64* %410, align 8, !alias.scope !1299, !noalias !1302
  %416 = inttoptr i64 %404 to i64*
  %417 = load i64, i64* %416
  %418 = add i64 %404, 8
  %419 = inttoptr i64 %418 to i64*
  %420 = load i64, i64* %419
  %421 = add i64 %404, 16
  %422 = inttoptr i64 %421 to i64*
  %423 = load i64, i64* %422
  %424 = add i64 %404, 24
  %425 = inttoptr i64 %424 to i64*
  %426 = load i64, i64* %425
  %427 = add i64 %404, 32
  %428 = inttoptr i64 %427 to i64*
  %429 = load i64, i64* %428
  %430 = add i64 %404, 40
  %431 = inttoptr i64 %430 to i64*
  %432 = load i64, i64* %431
  %433 = add i64 %404, 48
  %434 = inttoptr i64 %433 to i64*
  %435 = load i64, i64* %434
  %436 = add i64 %404, 56
  %437 = inttoptr i64 %436 to i64*
  %438 = load i64, i64* %437
  %439 = add i64 %404, 64
  %440 = inttoptr i64 %439 to i64*
  %441 = load i64, i64* %440
  %442 = add i64 %404, 72
  %443 = inttoptr i64 %442 to i64*
  %444 = load i64, i64* %443
  %445 = inttoptr i64 %405 to i64*
  %446 = load i64, i64* %445
  store i64 %446, i64* %3, align 8, !alias.scope !1299, !noalias !1302
  store i64 %404, i64* %10, align 8, !alias.scope !1299, !noalias !1302
  %447 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 66), i64 %411, i64 %412, i64 %413, i64 %414, i64 %415, i64 %417, i64 %420, i64 %423, i64 %426, i64 %429, i64 %432, i64 %435, i64 %438, i64 %441, i64 %444), !noalias !1299
  %448 = load i64, i64* %11, align 8
  %449 = add i64 %448, -116
  %450 = trunc i64 %447 to i32
  %451 = inttoptr i64 %449 to i32*
  store i32 %450, i32* %451
  br label %block_400916

block_4006cf:                                     ; preds = %block_4006b9
  %452 = inttoptr i64 %342 to i32*
  %453 = load i32, i32* %452
  %454 = add i32 %453, -74642
  %455 = icmp eq i32 %454, 0
  %456 = add i64 %334, -92
  %457 = inttoptr i64 %456 to i32*
  store i32 %454, i32* %457
  %458 = select i1 %455, i64 501, i64 22
  %459 = add i64 %353, %458
  br i1 %455, label %block_4008c4, label %block_4006e5

block_4005cd:                                     ; preds = %block_4005b9
  %460 = inttoptr i64 %342 to i32*
  %461 = load i32, i32* %460
  %462 = add i32 %461, -12
  %463 = icmp eq i32 %462, 0
  %464 = add i64 %334, -44
  %465 = inttoptr i64 %464 to i32*
  store i32 %462, i32* %465
  %466 = select i1 %463, i64 432, i64 20
  %467 = add i64 %573, %466
  br i1 %463, label %block_40077d, label %block_4005e1

block_4007c8:                                     ; preds = %block_400609
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 139), i64* %9, align 8, !tbaa !1253
  %468 = add i64 %1022, 17
  %469 = load i64, i64* %10, align 8, !tbaa !1253
  %470 = add i64 %469, -8
  %471 = inttoptr i64 %470 to i64*
  store i64 %468, i64* %471
  %472 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %473 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %474 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %475 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %476 = load i64, i64* %8, align 8, !alias.scope !1304, !noalias !1307
  %477 = load i64, i64* %473, align 8, !alias.scope !1304, !noalias !1307
  %478 = load i64, i64* %472, align 8, !alias.scope !1304, !noalias !1307
  %479 = load i64, i64* %474, align 8, !alias.scope !1304, !noalias !1307
  %480 = load i64, i64* %475, align 8, !alias.scope !1304, !noalias !1307
  %481 = inttoptr i64 %469 to i64*
  %482 = load i64, i64* %481
  %483 = add i64 %469, 8
  %484 = inttoptr i64 %483 to i64*
  %485 = load i64, i64* %484
  %486 = add i64 %469, 16
  %487 = inttoptr i64 %486 to i64*
  %488 = load i64, i64* %487
  %489 = add i64 %469, 24
  %490 = inttoptr i64 %489 to i64*
  %491 = load i64, i64* %490
  %492 = add i64 %469, 32
  %493 = inttoptr i64 %492 to i64*
  %494 = load i64, i64* %493
  %495 = add i64 %469, 40
  %496 = inttoptr i64 %495 to i64*
  %497 = load i64, i64* %496
  %498 = add i64 %469, 48
  %499 = inttoptr i64 %498 to i64*
  %500 = load i64, i64* %499
  %501 = add i64 %469, 56
  %502 = inttoptr i64 %501 to i64*
  %503 = load i64, i64* %502
  %504 = add i64 %469, 64
  %505 = inttoptr i64 %504 to i64*
  %506 = load i64, i64* %505
  %507 = add i64 %469, 72
  %508 = inttoptr i64 %507 to i64*
  %509 = load i64, i64* %508
  %510 = inttoptr i64 %470 to i64*
  %511 = load i64, i64* %510
  store i64 %511, i64* %3, align 8, !alias.scope !1304, !noalias !1307
  store i64 %469, i64* %10, align 8, !alias.scope !1304, !noalias !1307
  %512 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 139), i64 %476, i64 %477, i64 %478, i64 %479, i64 %480, i64 %482, i64 %485, i64 %488, i64 %491, i64 %494, i64 %497, i64 %500, i64 %503, i64 %506, i64 %509), !noalias !1304
  %513 = load i64, i64* %11, align 8
  %514 = add i64 %513, -132
  %515 = trunc i64 %512 to i32
  %516 = inttoptr i64 %514 to i32*
  store i32 %515, i32* %516
  br label %block_400916

block_40074b:                                     ; preds = %block_4005a5
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 50), i64* %9, align 8, !tbaa !1253
  %517 = add i64 %1136, 17
  %518 = load i64, i64* %10, align 8, !tbaa !1253
  %519 = add i64 %518, -8
  %520 = inttoptr i64 %519 to i64*
  store i64 %517, i64* %520
  %521 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %522 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %523 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %524 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %525 = load i64, i64* %8, align 8, !alias.scope !1309, !noalias !1312
  %526 = load i64, i64* %522, align 8, !alias.scope !1309, !noalias !1312
  %527 = load i64, i64* %521, align 8, !alias.scope !1309, !noalias !1312
  %528 = load i64, i64* %523, align 8, !alias.scope !1309, !noalias !1312
  %529 = load i64, i64* %524, align 8, !alias.scope !1309, !noalias !1312
  %530 = inttoptr i64 %518 to i64*
  %531 = load i64, i64* %530
  %532 = add i64 %518, 8
  %533 = inttoptr i64 %532 to i64*
  %534 = load i64, i64* %533
  %535 = add i64 %518, 16
  %536 = inttoptr i64 %535 to i64*
  %537 = load i64, i64* %536
  %538 = add i64 %518, 24
  %539 = inttoptr i64 %538 to i64*
  %540 = load i64, i64* %539
  %541 = add i64 %518, 32
  %542 = inttoptr i64 %541 to i64*
  %543 = load i64, i64* %542
  %544 = add i64 %518, 40
  %545 = inttoptr i64 %544 to i64*
  %546 = load i64, i64* %545
  %547 = add i64 %518, 48
  %548 = inttoptr i64 %547 to i64*
  %549 = load i64, i64* %548
  %550 = add i64 %518, 56
  %551 = inttoptr i64 %550 to i64*
  %552 = load i64, i64* %551
  %553 = add i64 %518, 64
  %554 = inttoptr i64 %553 to i64*
  %555 = load i64, i64* %554
  %556 = add i64 %518, 72
  %557 = inttoptr i64 %556 to i64*
  %558 = load i64, i64* %557
  %559 = inttoptr i64 %519 to i64*
  %560 = load i64, i64* %559
  store i64 %560, i64* %3, align 8, !alias.scope !1309, !noalias !1312
  store i64 %518, i64* %10, align 8, !alias.scope !1309, !noalias !1312
  %561 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 50), i64 %525, i64 %526, i64 %527, i64 %528, i64 %529, i64 %531, i64 %534, i64 %537, i64 %540, i64 %543, i64 %546, i64 %549, i64 %552, i64 %555, i64 %558), !noalias !1309
  %562 = load i64, i64* %11, align 8
  %563 = add i64 %562, -112
  %564 = trunc i64 %561 to i32
  %565 = inttoptr i64 %563 to i32*
  store i32 %564, i32* %565
  br label %block_400916

block_4005b9:                                     ; preds = %block_4005a5
  %566 = inttoptr i64 %342 to i32*
  %567 = load i32, i32* %566
  %568 = add i32 %567, -6
  %569 = icmp eq i32 %568, 0
  %570 = add i64 %334, -40
  %571 = inttoptr i64 %570 to i32*
  store i32 %568, i32* %571
  %572 = select i1 %569, i64 427, i64 20
  %573 = add i64 %1136, %572
  br i1 %569, label %block_400764, label %block_4005cd

block_400838:                                     ; preds = %block_400661
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 257), i64* %9, align 8, !tbaa !1253
  %574 = add i64 %273, 17
  %575 = load i64, i64* %10, align 8, !tbaa !1253
  %576 = add i64 %575, -8
  %577 = inttoptr i64 %576 to i64*
  store i64 %574, i64* %577
  %578 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %579 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %580 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %581 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %582 = load i64, i64* %8, align 8, !alias.scope !1314, !noalias !1317
  %583 = load i64, i64* %579, align 8, !alias.scope !1314, !noalias !1317
  %584 = load i64, i64* %578, align 8, !alias.scope !1314, !noalias !1317
  %585 = load i64, i64* %580, align 8, !alias.scope !1314, !noalias !1317
  %586 = load i64, i64* %581, align 8, !alias.scope !1314, !noalias !1317
  %587 = inttoptr i64 %575 to i64*
  %588 = load i64, i64* %587
  %589 = add i64 %575, 8
  %590 = inttoptr i64 %589 to i64*
  %591 = load i64, i64* %590
  %592 = add i64 %575, 16
  %593 = inttoptr i64 %592 to i64*
  %594 = load i64, i64* %593
  %595 = add i64 %575, 24
  %596 = inttoptr i64 %595 to i64*
  %597 = load i64, i64* %596
  %598 = add i64 %575, 32
  %599 = inttoptr i64 %598 to i64*
  %600 = load i64, i64* %599
  %601 = add i64 %575, 40
  %602 = inttoptr i64 %601 to i64*
  %603 = load i64, i64* %602
  %604 = add i64 %575, 48
  %605 = inttoptr i64 %604 to i64*
  %606 = load i64, i64* %605
  %607 = add i64 %575, 56
  %608 = inttoptr i64 %607 to i64*
  %609 = load i64, i64* %608
  %610 = add i64 %575, 64
  %611 = inttoptr i64 %610 to i64*
  %612 = load i64, i64* %611
  %613 = add i64 %575, 72
  %614 = inttoptr i64 %613 to i64*
  %615 = load i64, i64* %614
  %616 = inttoptr i64 %576 to i64*
  %617 = load i64, i64* %616
  store i64 %617, i64* %3, align 8, !alias.scope !1314, !noalias !1317
  store i64 %575, i64* %10, align 8, !alias.scope !1314, !noalias !1317
  %618 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 257), i64 %582, i64 %583, i64 %584, i64 %585, i64 %586, i64 %588, i64 %591, i64 %594, i64 %597, i64 %600, i64 %603, i64 %606, i64 %609, i64 %612, i64 %615), !noalias !1314
  %619 = load i64, i64* %11, align 8
  %620 = add i64 %619, -148
  %621 = trunc i64 %618 to i32
  %622 = inttoptr i64 %620 to i32*
  store i32 %621, i32* %622
  br label %block_400916

block_400916:                                     ; preds = %block_400700, %block_400800, %block_400796, %block_40081c, %block_40088c, %block_400719, %block_400854, %block_4007af, %block_400732, %block_4008c4, %block_400838, %block_40074b, %block_4007c8, %block_400764, %block_400870, %block_4008e0, %block_4007e4, %block_4008a8, %block_4006fb, %block_40077d
  %623 = phi i64 [ %1231, %block_400700 ], [ %937, %block_400719 ], [ %730, %block_400732 ], [ %562, %block_40074b ], [ %448, %block_400764 ], [ %89, %block_40077d ], [ %1117, %block_400796 ], [ %787, %block_4007af ], [ %513, %block_4007c8 ], [ %262, %block_4007e4 ], [ %1182, %block_400800 ], [ %1068, %block_40081c ], [ %619, %block_400838 ], [ %852, %block_400854 ], [ %399, %block_400870 ], [ %1011, %block_40088c ], [ %205, %block_4008a8 ], [ %681, %block_4008c4 ], [ %319, %block_4008e0 ], [ %140, %block_4006fb ]
  %624 = phi %struct.Memory* [ %2, %block_400700 ], [ %2, %block_400719 ], [ %2, %block_400732 ], [ %2, %block_40074b ], [ %2, %block_400764 ], [ %2, %block_40077d ], [ %2, %block_400796 ], [ %2, %block_4007af ], [ %2, %block_4007c8 ], [ %2, %block_4007e4 ], [ %2, %block_400800 ], [ %2, %block_40081c ], [ %2, %block_400838 ], [ %2, %block_400854 ], [ %2, %block_400870 ], [ %2, %block_40088c ], [ %2, %block_4008a8 ], [ %2, %block_4008c4 ], [ %2, %block_4008e0 ], [ %2, %block_4006fb ]
  %625 = add i64 %623, -4
  %626 = inttoptr i64 %625 to i32*
  store i32 0, i32* %626
  %627 = load i64, i64* %10, align 8
  br label %block_40091d

block_400635:                                     ; preds = %block_40061f
  %628 = inttoptr i64 %342 to i32*
  %629 = load i32, i32* %628
  %630 = add i32 %629, -74634
  %631 = icmp eq i32 %630, 0
  %632 = add i64 %334, -64
  %633 = inttoptr i64 %632 to i32*
  store i32 %630, i32* %633
  %634 = select i1 %631, i64 459, i64 22
  %635 = add i64 %806, %634
  br i1 %631, label %block_400800, label %block_40064b

block_4008c4:                                     ; preds = %block_4006cf
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 397), i64* %9, align 8, !tbaa !1253
  %636 = add i64 %459, 17
  %637 = load i64, i64* %10, align 8, !tbaa !1253
  %638 = add i64 %637, -8
  %639 = inttoptr i64 %638 to i64*
  store i64 %636, i64* %639
  %640 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %641 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %642 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %643 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %644 = load i64, i64* %8, align 8, !alias.scope !1319, !noalias !1322
  %645 = load i64, i64* %641, align 8, !alias.scope !1319, !noalias !1322
  %646 = load i64, i64* %640, align 8, !alias.scope !1319, !noalias !1322
  %647 = load i64, i64* %642, align 8, !alias.scope !1319, !noalias !1322
  %648 = load i64, i64* %643, align 8, !alias.scope !1319, !noalias !1322
  %649 = inttoptr i64 %637 to i64*
  %650 = load i64, i64* %649
  %651 = add i64 %637, 8
  %652 = inttoptr i64 %651 to i64*
  %653 = load i64, i64* %652
  %654 = add i64 %637, 16
  %655 = inttoptr i64 %654 to i64*
  %656 = load i64, i64* %655
  %657 = add i64 %637, 24
  %658 = inttoptr i64 %657 to i64*
  %659 = load i64, i64* %658
  %660 = add i64 %637, 32
  %661 = inttoptr i64 %660 to i64*
  %662 = load i64, i64* %661
  %663 = add i64 %637, 40
  %664 = inttoptr i64 %663 to i64*
  %665 = load i64, i64* %664
  %666 = add i64 %637, 48
  %667 = inttoptr i64 %666 to i64*
  %668 = load i64, i64* %667
  %669 = add i64 %637, 56
  %670 = inttoptr i64 %669 to i64*
  %671 = load i64, i64* %670
  %672 = add i64 %637, 64
  %673 = inttoptr i64 %672 to i64*
  %674 = load i64, i64* %673
  %675 = add i64 %637, 72
  %676 = inttoptr i64 %675 to i64*
  %677 = load i64, i64* %676
  %678 = inttoptr i64 %638 to i64*
  %679 = load i64, i64* %678
  store i64 %679, i64* %3, align 8, !alias.scope !1319, !noalias !1322
  store i64 %637, i64* %10, align 8, !alias.scope !1319, !noalias !1322
  %680 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 397), i64 %644, i64 %645, i64 %646, i64 %647, i64 %648, i64 %650, i64 %653, i64 %656, i64 %659, i64 %662, i64 %665, i64 %668, i64 %671, i64 %674, i64 %677), !noalias !1319
  %681 = load i64, i64* %11, align 8
  %682 = add i64 %681, -168
  %683 = trunc i64 %680 to i32
  %684 = inttoptr i64 %682 to i32*
  store i32 %683, i32* %684
  br label %block_400916

block_400732:                                     ; preds = %block_400591
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 35), i64* %9, align 8, !tbaa !1253
  %685 = add i64 %957, 17
  %686 = load i64, i64* %10, align 8, !tbaa !1253
  %687 = add i64 %686, -8
  %688 = inttoptr i64 %687 to i64*
  store i64 %685, i64* %688
  %689 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %690 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %691 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %692 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %693 = load i64, i64* %8, align 8, !alias.scope !1324, !noalias !1327
  %694 = load i64, i64* %690, align 8, !alias.scope !1324, !noalias !1327
  %695 = load i64, i64* %689, align 8, !alias.scope !1324, !noalias !1327
  %696 = load i64, i64* %691, align 8, !alias.scope !1324, !noalias !1327
  %697 = load i64, i64* %692, align 8, !alias.scope !1324, !noalias !1327
  %698 = inttoptr i64 %686 to i64*
  %699 = load i64, i64* %698
  %700 = add i64 %686, 8
  %701 = inttoptr i64 %700 to i64*
  %702 = load i64, i64* %701
  %703 = add i64 %686, 16
  %704 = inttoptr i64 %703 to i64*
  %705 = load i64, i64* %704
  %706 = add i64 %686, 24
  %707 = inttoptr i64 %706 to i64*
  %708 = load i64, i64* %707
  %709 = add i64 %686, 32
  %710 = inttoptr i64 %709 to i64*
  %711 = load i64, i64* %710
  %712 = add i64 %686, 40
  %713 = inttoptr i64 %712 to i64*
  %714 = load i64, i64* %713
  %715 = add i64 %686, 48
  %716 = inttoptr i64 %715 to i64*
  %717 = load i64, i64* %716
  %718 = add i64 %686, 56
  %719 = inttoptr i64 %718 to i64*
  %720 = load i64, i64* %719
  %721 = add i64 %686, 64
  %722 = inttoptr i64 %721 to i64*
  %723 = load i64, i64* %722
  %724 = add i64 %686, 72
  %725 = inttoptr i64 %724 to i64*
  %726 = load i64, i64* %725
  %727 = inttoptr i64 %687 to i64*
  %728 = load i64, i64* %727
  store i64 %728, i64* %3, align 8, !alias.scope !1324, !noalias !1327
  store i64 %686, i64* %10, align 8, !alias.scope !1324, !noalias !1327
  %729 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 35), i64 %693, i64 %694, i64 %695, i64 %696, i64 %697, i64 %699, i64 %702, i64 %705, i64 %708, i64 %711, i64 %714, i64 %717, i64 %720, i64 %723, i64 %726), !noalias !1324
  %730 = load i64, i64* %11, align 8
  %731 = add i64 %730, -108
  %732 = trunc i64 %729 to i32
  %733 = inttoptr i64 %731 to i32*
  store i32 %732, i32* %733
  br label %block_400916

block_4005e1:                                     ; preds = %block_4005cd
  %734 = inttoptr i64 %342 to i32*
  %735 = load i32, i32* %734
  %736 = add i32 %735, -13
  %737 = icmp eq i32 %736, 0
  %738 = add i64 %334, -48
  %739 = inttoptr i64 %738 to i32*
  store i32 %736, i32* %739
  %740 = select i1 %737, i64 437, i64 20
  %741 = add i64 %467, %740
  br i1 %737, label %block_400796, label %block_4005f5

block_4007af:                                     ; preds = %block_4005f5
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 119), i64* %9, align 8, !tbaa !1253
  %742 = add i64 %159, 17
  %743 = load i64, i64* %10, align 8, !tbaa !1253
  %744 = add i64 %743, -8
  %745 = inttoptr i64 %744 to i64*
  store i64 %742, i64* %745
  %746 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %747 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %748 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %749 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %750 = load i64, i64* %8, align 8, !alias.scope !1329, !noalias !1332
  %751 = load i64, i64* %747, align 8, !alias.scope !1329, !noalias !1332
  %752 = load i64, i64* %746, align 8, !alias.scope !1329, !noalias !1332
  %753 = load i64, i64* %748, align 8, !alias.scope !1329, !noalias !1332
  %754 = load i64, i64* %749, align 8, !alias.scope !1329, !noalias !1332
  %755 = inttoptr i64 %743 to i64*
  %756 = load i64, i64* %755
  %757 = add i64 %743, 8
  %758 = inttoptr i64 %757 to i64*
  %759 = load i64, i64* %758
  %760 = add i64 %743, 16
  %761 = inttoptr i64 %760 to i64*
  %762 = load i64, i64* %761
  %763 = add i64 %743, 24
  %764 = inttoptr i64 %763 to i64*
  %765 = load i64, i64* %764
  %766 = add i64 %743, 32
  %767 = inttoptr i64 %766 to i64*
  %768 = load i64, i64* %767
  %769 = add i64 %743, 40
  %770 = inttoptr i64 %769 to i64*
  %771 = load i64, i64* %770
  %772 = add i64 %743, 48
  %773 = inttoptr i64 %772 to i64*
  %774 = load i64, i64* %773
  %775 = add i64 %743, 56
  %776 = inttoptr i64 %775 to i64*
  %777 = load i64, i64* %776
  %778 = add i64 %743, 64
  %779 = inttoptr i64 %778 to i64*
  %780 = load i64, i64* %779
  %781 = add i64 %743, 72
  %782 = inttoptr i64 %781 to i64*
  %783 = load i64, i64* %782
  %784 = inttoptr i64 %744 to i64*
  %785 = load i64, i64* %784
  store i64 %785, i64* %3, align 8, !alias.scope !1329, !noalias !1332
  store i64 %743, i64* %10, align 8, !alias.scope !1329, !noalias !1332
  %786 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 119), i64 %750, i64 %751, i64 %752, i64 %753, i64 %754, i64 %756, i64 %759, i64 %762, i64 %765, i64 %768, i64 %771, i64 %774, i64 %777, i64 %780, i64 %783), !noalias !1329
  %787 = load i64, i64* %11, align 8
  %788 = add i64 %787, -128
  %789 = trunc i64 %786 to i32
  %790 = inttoptr i64 %788 to i32*
  store i32 %789, i32* %790
  br label %block_400916

block_4006a3:                                     ; preds = %block_40068d
  %791 = inttoptr i64 %342 to i32*
  %792 = load i32, i32* %791
  %793 = add i32 %792, -74640
  %794 = icmp eq i32 %793, 0
  %795 = add i64 %334, -84
  %796 = inttoptr i64 %795 to i32*
  store i32 %793, i32* %796
  %797 = select i1 %794, i64 489, i64 22
  %798 = add i64 %965, %797
  br i1 %794, label %block_40088c, label %block_4006b9

block_40061f:                                     ; preds = %block_400609
  %799 = inttoptr i64 %342 to i32*
  %800 = load i32, i32* %799
  %801 = add i32 %800, -74633
  %802 = icmp eq i32 %801, 0
  %803 = add i64 %334, -60
  %804 = inttoptr i64 %803 to i32*
  store i32 %801, i32* %804
  %805 = select i1 %802, i64 453, i64 22
  %806 = add i64 %1022, %805
  br i1 %802, label %block_4007e4, label %block_400635

block_400854:                                     ; preds = %block_400677
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 285), i64* %9, align 8, !tbaa !1253
  %807 = add i64 %151, 17
  %808 = load i64, i64* %10, align 8, !tbaa !1253
  %809 = add i64 %808, -8
  %810 = inttoptr i64 %809 to i64*
  store i64 %807, i64* %810
  %811 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %812 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %813 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %814 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %815 = load i64, i64* %8, align 8, !alias.scope !1334, !noalias !1337
  %816 = load i64, i64* %812, align 8, !alias.scope !1334, !noalias !1337
  %817 = load i64, i64* %811, align 8, !alias.scope !1334, !noalias !1337
  %818 = load i64, i64* %813, align 8, !alias.scope !1334, !noalias !1337
  %819 = load i64, i64* %814, align 8, !alias.scope !1334, !noalias !1337
  %820 = inttoptr i64 %808 to i64*
  %821 = load i64, i64* %820
  %822 = add i64 %808, 8
  %823 = inttoptr i64 %822 to i64*
  %824 = load i64, i64* %823
  %825 = add i64 %808, 16
  %826 = inttoptr i64 %825 to i64*
  %827 = load i64, i64* %826
  %828 = add i64 %808, 24
  %829 = inttoptr i64 %828 to i64*
  %830 = load i64, i64* %829
  %831 = add i64 %808, 32
  %832 = inttoptr i64 %831 to i64*
  %833 = load i64, i64* %832
  %834 = add i64 %808, 40
  %835 = inttoptr i64 %834 to i64*
  %836 = load i64, i64* %835
  %837 = add i64 %808, 48
  %838 = inttoptr i64 %837 to i64*
  %839 = load i64, i64* %838
  %840 = add i64 %808, 56
  %841 = inttoptr i64 %840 to i64*
  %842 = load i64, i64* %841
  %843 = add i64 %808, 64
  %844 = inttoptr i64 %843 to i64*
  %845 = load i64, i64* %844
  %846 = add i64 %808, 72
  %847 = inttoptr i64 %846 to i64*
  %848 = load i64, i64* %847
  %849 = inttoptr i64 %809 to i64*
  %850 = load i64, i64* %849
  store i64 %850, i64* %3, align 8, !alias.scope !1334, !noalias !1337
  store i64 %808, i64* %10, align 8, !alias.scope !1334, !noalias !1337
  %851 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 285), i64 %815, i64 %816, i64 %817, i64 %818, i64 %819, i64 %821, i64 %824, i64 %827, i64 %830, i64 %833, i64 %836, i64 %839, i64 %842, i64 %845, i64 %848), !noalias !1334
  %852 = load i64, i64* %11, align 8
  %853 = add i64 %852, -152
  %854 = trunc i64 %851 to i32
  %855 = inttoptr i64 %853 to i32*
  store i32 %854, i32* %855
  br label %block_400916

block_40091d:                                     ; preds = %block_400553, %block_400916
  %856 = phi i64 [ %627, %block_400916 ], [ %16, %block_400553 ]
  %857 = phi i64 [ %623, %block_400916 ], [ %14, %block_400553 ]
  %858 = phi %struct.Memory* [ %624, %block_400916 ], [ %2, %block_400553 ]
  %859 = add i64 %857, -4
  %860 = inttoptr i64 %859 to i32*
  %861 = load i32, i32* %860
  %862 = zext i32 %861 to i64
  store i64 %862, i64* %7, align 8, !tbaa !1253
  %863 = add i64 %856, 176
  %864 = icmp ugt i64 %856, -177
  %865 = zext i1 %864 to i8
  store i8 %865, i8* %17, align 1, !tbaa !1231
  %866 = trunc i64 %863 to i32
  %867 = and i32 %866, 255
  %868 = tail call i32 @llvm.ctpop.i32(i32 %867) #9
  %869 = trunc i32 %868 to i8
  %870 = and i8 %869, 1
  %871 = xor i8 %870, 1
  store i8 %871, i8* %18, align 1, !tbaa !1248
  %872 = xor i64 %856, 16
  %873 = xor i64 %872, %863
  %874 = lshr i64 %873, 4
  %875 = trunc i64 %874 to i8
  %876 = and i8 %875, 1
  store i8 %876, i8* %19, align 1, !tbaa !1249
  %877 = icmp eq i64 %863, 0
  %878 = zext i1 %877 to i8
  store i8 %878, i8* %20, align 1, !tbaa !1250
  %879 = lshr i64 %863, 63
  %880 = trunc i64 %879 to i8
  store i8 %880, i8* %21, align 1, !tbaa !1251
  %881 = lshr i64 %856, 63
  %882 = xor i64 %879, %881
  %883 = add nuw nsw i64 %882, %879
  %884 = icmp eq i64 %883, 2
  %885 = zext i1 %884 to i8
  store i8 %885, i8* %22, align 1, !tbaa !1252
  %886 = add i64 %856, 184
  %887 = inttoptr i64 %863 to i64*
  %888 = load i64, i64* %887
  store i64 %888, i64* %11, align 8, !tbaa !1253
  %889 = inttoptr i64 %886 to i64*
  %890 = load i64, i64* %889
  store i64 %890, i64* %3, align 8, !tbaa !1253
  %891 = add i64 %856, 192
  store i64 %891, i64* %10, align 8, !tbaa !1253
  ret %struct.Memory* %858

block_400719:                                     ; preds = %block_40057d
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 20), i64* %9, align 8, !tbaa !1253
  %892 = add i64 %216, 17
  %893 = load i64, i64* %10, align 8, !tbaa !1253
  %894 = add i64 %893, -8
  %895 = inttoptr i64 %894 to i64*
  store i64 %892, i64* %895
  %896 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %897 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %898 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %899 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %900 = load i64, i64* %8, align 8, !alias.scope !1339, !noalias !1342
  %901 = load i64, i64* %897, align 8, !alias.scope !1339, !noalias !1342
  %902 = load i64, i64* %896, align 8, !alias.scope !1339, !noalias !1342
  %903 = load i64, i64* %898, align 8, !alias.scope !1339, !noalias !1342
  %904 = load i64, i64* %899, align 8, !alias.scope !1339, !noalias !1342
  %905 = inttoptr i64 %893 to i64*
  %906 = load i64, i64* %905
  %907 = add i64 %893, 8
  %908 = inttoptr i64 %907 to i64*
  %909 = load i64, i64* %908
  %910 = add i64 %893, 16
  %911 = inttoptr i64 %910 to i64*
  %912 = load i64, i64* %911
  %913 = add i64 %893, 24
  %914 = inttoptr i64 %913 to i64*
  %915 = load i64, i64* %914
  %916 = add i64 %893, 32
  %917 = inttoptr i64 %916 to i64*
  %918 = load i64, i64* %917
  %919 = add i64 %893, 40
  %920 = inttoptr i64 %919 to i64*
  %921 = load i64, i64* %920
  %922 = add i64 %893, 48
  %923 = inttoptr i64 %922 to i64*
  %924 = load i64, i64* %923
  %925 = add i64 %893, 56
  %926 = inttoptr i64 %925 to i64*
  %927 = load i64, i64* %926
  %928 = add i64 %893, 64
  %929 = inttoptr i64 %928 to i64*
  %930 = load i64, i64* %929
  %931 = add i64 %893, 72
  %932 = inttoptr i64 %931 to i64*
  %933 = load i64, i64* %932
  %934 = inttoptr i64 %894 to i64*
  %935 = load i64, i64* %934
  store i64 %935, i64* %3, align 8, !alias.scope !1339, !noalias !1342
  store i64 %893, i64* %10, align 8, !alias.scope !1339, !noalias !1342
  %936 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 20), i64 %900, i64 %901, i64 %902, i64 %903, i64 %904, i64 %906, i64 %909, i64 %912, i64 %915, i64 %918, i64 %921, i64 %924, i64 %927, i64 %930, i64 %933), !noalias !1339
  %937 = load i64, i64* %11, align 8
  %938 = add i64 %937, -104
  %939 = trunc i64 %936 to i32
  %940 = inttoptr i64 %938 to i32*
  store i32 %939, i32* %940
  br label %block_400916

block_4006e5:                                     ; preds = %block_4006cf
  %941 = inttoptr i64 %342 to i32*
  %942 = load i32, i32* %941
  %943 = add i32 %942, -74643
  %944 = icmp eq i32 %943, 0
  %945 = add i64 %334, -96
  %946 = inttoptr i64 %945 to i32*
  store i32 %943, i32* %946
  %947 = select i1 %944, i64 507, i64 22
  %948 = add i64 %459, %947
  br i1 %944, label %block_4008e0, label %block_4006fb

block_400553:                                     ; preds = %block_400530
  %949 = inttoptr i64 %23 to i32*
  store i32 -1, i32* %949
  br label %block_40091d

block_400591:                                     ; preds = %block_40057d
  %950 = inttoptr i64 %342 to i32*
  %951 = load i32, i32* %950
  %952 = add i32 %951, -2
  %953 = icmp eq i32 %952, 0
  %954 = add i64 %334, -32
  %955 = inttoptr i64 %954 to i32*
  store i32 %952, i32* %955
  %956 = select i1 %953, i64 417, i64 20
  %957 = add i64 %216, %956
  br i1 %953, label %block_400732, label %block_4005a5

block_40068d:                                     ; preds = %block_400677
  %958 = inttoptr i64 %342 to i32*
  %959 = load i32, i32* %958
  %960 = add i32 %959, -74639
  %961 = icmp eq i32 %960, 0
  %962 = add i64 %334, -80
  %963 = inttoptr i64 %962 to i32*
  store i32 %960, i32* %963
  %964 = select i1 %961, i64 483, i64 22
  %965 = add i64 %151, %964
  br i1 %961, label %block_400870, label %block_4006a3

block_40088c:                                     ; preds = %block_4006a3
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 341), i64* %9, align 8, !tbaa !1253
  %966 = add i64 %798, 17
  %967 = load i64, i64* %10, align 8, !tbaa !1253
  %968 = add i64 %967, -8
  %969 = inttoptr i64 %968 to i64*
  store i64 %966, i64* %969
  %970 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %971 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %972 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %973 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %974 = load i64, i64* %8, align 8, !alias.scope !1344, !noalias !1347
  %975 = load i64, i64* %971, align 8, !alias.scope !1344, !noalias !1347
  %976 = load i64, i64* %970, align 8, !alias.scope !1344, !noalias !1347
  %977 = load i64, i64* %972, align 8, !alias.scope !1344, !noalias !1347
  %978 = load i64, i64* %973, align 8, !alias.scope !1344, !noalias !1347
  %979 = inttoptr i64 %967 to i64*
  %980 = load i64, i64* %979
  %981 = add i64 %967, 8
  %982 = inttoptr i64 %981 to i64*
  %983 = load i64, i64* %982
  %984 = add i64 %967, 16
  %985 = inttoptr i64 %984 to i64*
  %986 = load i64, i64* %985
  %987 = add i64 %967, 24
  %988 = inttoptr i64 %987 to i64*
  %989 = load i64, i64* %988
  %990 = add i64 %967, 32
  %991 = inttoptr i64 %990 to i64*
  %992 = load i64, i64* %991
  %993 = add i64 %967, 40
  %994 = inttoptr i64 %993 to i64*
  %995 = load i64, i64* %994
  %996 = add i64 %967, 48
  %997 = inttoptr i64 %996 to i64*
  %998 = load i64, i64* %997
  %999 = add i64 %967, 56
  %1000 = inttoptr i64 %999 to i64*
  %1001 = load i64, i64* %1000
  %1002 = add i64 %967, 64
  %1003 = inttoptr i64 %1002 to i64*
  %1004 = load i64, i64* %1003
  %1005 = add i64 %967, 72
  %1006 = inttoptr i64 %1005 to i64*
  %1007 = load i64, i64* %1006
  %1008 = inttoptr i64 %968 to i64*
  %1009 = load i64, i64* %1008
  store i64 %1009, i64* %3, align 8, !alias.scope !1344, !noalias !1347
  store i64 %967, i64* %10, align 8, !alias.scope !1344, !noalias !1347
  %1010 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 341), i64 %974, i64 %975, i64 %976, i64 %977, i64 %978, i64 %980, i64 %983, i64 %986, i64 %989, i64 %992, i64 %995, i64 %998, i64 %1001, i64 %1004, i64 %1007), !noalias !1344
  %1011 = load i64, i64* %11, align 8
  %1012 = add i64 %1011, -160
  %1013 = trunc i64 %1010 to i32
  %1014 = inttoptr i64 %1012 to i32*
  store i32 %1013, i32* %1014
  br label %block_400916

block_400609:                                     ; preds = %block_4005f5
  %1015 = inttoptr i64 %342 to i32*
  %1016 = load i32, i32* %1015
  %1017 = add i32 %1016, -255
  %1018 = icmp eq i32 %1017, 0
  %1019 = add i64 %334, -56
  %1020 = inttoptr i64 %1019 to i32*
  store i32 %1017, i32* %1020
  %1021 = select i1 %1018, i64 447, i64 22
  %1022 = add i64 %159, %1021
  br i1 %1018, label %block_4007c8, label %block_40061f

block_40081c:                                     ; preds = %block_40064b
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 229), i64* %9, align 8, !tbaa !1253
  %1023 = add i64 %1128, 17
  %1024 = load i64, i64* %10, align 8, !tbaa !1253
  %1025 = add i64 %1024, -8
  %1026 = inttoptr i64 %1025 to i64*
  store i64 %1023, i64* %1026
  %1027 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %1028 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %1029 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %1030 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %1031 = load i64, i64* %8, align 8, !alias.scope !1349, !noalias !1352
  %1032 = load i64, i64* %1028, align 8, !alias.scope !1349, !noalias !1352
  %1033 = load i64, i64* %1027, align 8, !alias.scope !1349, !noalias !1352
  %1034 = load i64, i64* %1029, align 8, !alias.scope !1349, !noalias !1352
  %1035 = load i64, i64* %1030, align 8, !alias.scope !1349, !noalias !1352
  %1036 = inttoptr i64 %1024 to i64*
  %1037 = load i64, i64* %1036
  %1038 = add i64 %1024, 8
  %1039 = inttoptr i64 %1038 to i64*
  %1040 = load i64, i64* %1039
  %1041 = add i64 %1024, 16
  %1042 = inttoptr i64 %1041 to i64*
  %1043 = load i64, i64* %1042
  %1044 = add i64 %1024, 24
  %1045 = inttoptr i64 %1044 to i64*
  %1046 = load i64, i64* %1045
  %1047 = add i64 %1024, 32
  %1048 = inttoptr i64 %1047 to i64*
  %1049 = load i64, i64* %1048
  %1050 = add i64 %1024, 40
  %1051 = inttoptr i64 %1050 to i64*
  %1052 = load i64, i64* %1051
  %1053 = add i64 %1024, 48
  %1054 = inttoptr i64 %1053 to i64*
  %1055 = load i64, i64* %1054
  %1056 = add i64 %1024, 56
  %1057 = inttoptr i64 %1056 to i64*
  %1058 = load i64, i64* %1057
  %1059 = add i64 %1024, 64
  %1060 = inttoptr i64 %1059 to i64*
  %1061 = load i64, i64* %1060
  %1062 = add i64 %1024, 72
  %1063 = inttoptr i64 %1062 to i64*
  %1064 = load i64, i64* %1063
  %1065 = inttoptr i64 %1025 to i64*
  %1066 = load i64, i64* %1065
  store i64 %1066, i64* %3, align 8, !alias.scope !1349, !noalias !1352
  store i64 %1024, i64* %10, align 8, !alias.scope !1349, !noalias !1352
  %1067 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 229), i64 %1031, i64 %1032, i64 %1033, i64 %1034, i64 %1035, i64 %1037, i64 %1040, i64 %1043, i64 %1046, i64 %1049, i64 %1052, i64 %1055, i64 %1058, i64 %1061, i64 %1064), !noalias !1349
  %1068 = load i64, i64* %11, align 8
  %1069 = add i64 %1068, -144
  %1070 = trunc i64 %1067 to i32
  %1071 = inttoptr i64 %1069 to i32*
  store i32 %1070, i32* %1071
  br label %block_400916

block_400796:                                     ; preds = %block_4005e1
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 99), i64* %9, align 8, !tbaa !1253
  %1072 = add i64 %741, 17
  %1073 = load i64, i64* %10, align 8, !tbaa !1253
  %1074 = add i64 %1073, -8
  %1075 = inttoptr i64 %1074 to i64*
  store i64 %1072, i64* %1075
  %1076 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %1077 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %1078 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %1079 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %1080 = load i64, i64* %8, align 8, !alias.scope !1354, !noalias !1357
  %1081 = load i64, i64* %1077, align 8, !alias.scope !1354, !noalias !1357
  %1082 = load i64, i64* %1076, align 8, !alias.scope !1354, !noalias !1357
  %1083 = load i64, i64* %1078, align 8, !alias.scope !1354, !noalias !1357
  %1084 = load i64, i64* %1079, align 8, !alias.scope !1354, !noalias !1357
  %1085 = inttoptr i64 %1073 to i64*
  %1086 = load i64, i64* %1085
  %1087 = add i64 %1073, 8
  %1088 = inttoptr i64 %1087 to i64*
  %1089 = load i64, i64* %1088
  %1090 = add i64 %1073, 16
  %1091 = inttoptr i64 %1090 to i64*
  %1092 = load i64, i64* %1091
  %1093 = add i64 %1073, 24
  %1094 = inttoptr i64 %1093 to i64*
  %1095 = load i64, i64* %1094
  %1096 = add i64 %1073, 32
  %1097 = inttoptr i64 %1096 to i64*
  %1098 = load i64, i64* %1097
  %1099 = add i64 %1073, 40
  %1100 = inttoptr i64 %1099 to i64*
  %1101 = load i64, i64* %1100
  %1102 = add i64 %1073, 48
  %1103 = inttoptr i64 %1102 to i64*
  %1104 = load i64, i64* %1103
  %1105 = add i64 %1073, 56
  %1106 = inttoptr i64 %1105 to i64*
  %1107 = load i64, i64* %1106
  %1108 = add i64 %1073, 64
  %1109 = inttoptr i64 %1108 to i64*
  %1110 = load i64, i64* %1109
  %1111 = add i64 %1073, 72
  %1112 = inttoptr i64 %1111 to i64*
  %1113 = load i64, i64* %1112
  %1114 = inttoptr i64 %1074 to i64*
  %1115 = load i64, i64* %1114
  store i64 %1115, i64* %3, align 8, !alias.scope !1354, !noalias !1357
  store i64 %1073, i64* %10, align 8, !alias.scope !1354, !noalias !1357
  %1116 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 99), i64 %1080, i64 %1081, i64 %1082, i64 %1083, i64 %1084, i64 %1086, i64 %1089, i64 %1092, i64 %1095, i64 %1098, i64 %1101, i64 %1104, i64 %1107, i64 %1110, i64 %1113), !noalias !1354
  %1117 = load i64, i64* %11, align 8
  %1118 = add i64 %1117, -124
  %1119 = trunc i64 %1116 to i32
  %1120 = inttoptr i64 %1118 to i32*
  store i32 %1119, i32* %1120
  br label %block_400916

block_40064b:                                     ; preds = %block_400635
  %1121 = inttoptr i64 %342 to i32*
  %1122 = load i32, i32* %1121
  %1123 = add i32 %1122, -74635
  %1124 = icmp eq i32 %1123, 0
  %1125 = add i64 %334, -68
  %1126 = inttoptr i64 %1125 to i32*
  store i32 %1123, i32* %1126
  %1127 = select i1 %1124, i64 465, i64 22
  %1128 = add i64 %635, %1127
  br i1 %1124, label %block_40081c, label %block_400661

block_4005a5:                                     ; preds = %block_400591
  %1129 = inttoptr i64 %342 to i32*
  %1130 = load i32, i32* %1129
  %1131 = add i32 %1130, -4
  %1132 = icmp eq i32 %1131, 0
  %1133 = add i64 %334, -36
  %1134 = inttoptr i64 %1133 to i32*
  store i32 %1131, i32* %1134
  %1135 = select i1 %1132, i64 422, i64 20
  %1136 = add i64 %957, %1135
  br i1 %1132, label %block_40074b, label %block_4005b9

block_400800:                                     ; preds = %block_400635
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 201), i64* %9, align 8, !tbaa !1253
  %1137 = add i64 %635, 17
  %1138 = load i64, i64* %10, align 8, !tbaa !1253
  %1139 = add i64 %1138, -8
  %1140 = inttoptr i64 %1139 to i64*
  store i64 %1137, i64* %1140
  %1141 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %1142 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %1143 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %1144 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %1145 = load i64, i64* %8, align 8, !alias.scope !1359, !noalias !1362
  %1146 = load i64, i64* %1142, align 8, !alias.scope !1359, !noalias !1362
  %1147 = load i64, i64* %1141, align 8, !alias.scope !1359, !noalias !1362
  %1148 = load i64, i64* %1143, align 8, !alias.scope !1359, !noalias !1362
  %1149 = load i64, i64* %1144, align 8, !alias.scope !1359, !noalias !1362
  %1150 = inttoptr i64 %1138 to i64*
  %1151 = load i64, i64* %1150
  %1152 = add i64 %1138, 8
  %1153 = inttoptr i64 %1152 to i64*
  %1154 = load i64, i64* %1153
  %1155 = add i64 %1138, 16
  %1156 = inttoptr i64 %1155 to i64*
  %1157 = load i64, i64* %1156
  %1158 = add i64 %1138, 24
  %1159 = inttoptr i64 %1158 to i64*
  %1160 = load i64, i64* %1159
  %1161 = add i64 %1138, 32
  %1162 = inttoptr i64 %1161 to i64*
  %1163 = load i64, i64* %1162
  %1164 = add i64 %1138, 40
  %1165 = inttoptr i64 %1164 to i64*
  %1166 = load i64, i64* %1165
  %1167 = add i64 %1138, 48
  %1168 = inttoptr i64 %1167 to i64*
  %1169 = load i64, i64* %1168
  %1170 = add i64 %1138, 56
  %1171 = inttoptr i64 %1170 to i64*
  %1172 = load i64, i64* %1171
  %1173 = add i64 %1138, 64
  %1174 = inttoptr i64 %1173 to i64*
  %1175 = load i64, i64* %1174
  %1176 = add i64 %1138, 72
  %1177 = inttoptr i64 %1176 to i64*
  %1178 = load i64, i64* %1177
  %1179 = inttoptr i64 %1139 to i64*
  %1180 = load i64, i64* %1179
  store i64 %1180, i64* %3, align 8, !alias.scope !1359, !noalias !1362
  store i64 %1138, i64* %10, align 8, !alias.scope !1359, !noalias !1362
  %1181 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 201), i64 %1145, i64 %1146, i64 %1147, i64 %1148, i64 %1149, i64 %1151, i64 %1154, i64 %1157, i64 %1160, i64 %1163, i64 %1166, i64 %1169, i64 %1172, i64 %1175, i64 %1178), !noalias !1359
  %1182 = load i64, i64* %11, align 8
  %1183 = add i64 %1182, -140
  %1184 = trunc i64 %1181 to i32
  %1185 = inttoptr i64 %1183 to i32*
  store i32 %1184, i32* %1185
  br label %block_400916

block_400700:                                     ; preds = %block_40055f
  store i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 4), i64* %9, align 8, !tbaa !1253
  %1186 = add i64 %345, 17
  %1187 = load i64, i64* %10, align 8, !tbaa !1253
  %1188 = add i64 %1187, -8
  %1189 = inttoptr i64 %1188 to i64*
  store i64 %1186, i64* %1189
  %1190 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %1191 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %1192 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %1193 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %1194 = load i64, i64* %8, align 8, !alias.scope !1364, !noalias !1367
  %1195 = load i64, i64* %1191, align 8, !alias.scope !1364, !noalias !1367
  %1196 = load i64, i64* %1190, align 8, !alias.scope !1364, !noalias !1367
  %1197 = load i64, i64* %1192, align 8, !alias.scope !1364, !noalias !1367
  %1198 = load i64, i64* %1193, align 8, !alias.scope !1364, !noalias !1367
  %1199 = inttoptr i64 %1187 to i64*
  %1200 = load i64, i64* %1199
  %1201 = add i64 %1187, 8
  %1202 = inttoptr i64 %1201 to i64*
  %1203 = load i64, i64* %1202
  %1204 = add i64 %1187, 16
  %1205 = inttoptr i64 %1204 to i64*
  %1206 = load i64, i64* %1205
  %1207 = add i64 %1187, 24
  %1208 = inttoptr i64 %1207 to i64*
  %1209 = load i64, i64* %1208
  %1210 = add i64 %1187, 32
  %1211 = inttoptr i64 %1210 to i64*
  %1212 = load i64, i64* %1211
  %1213 = add i64 %1187, 40
  %1214 = inttoptr i64 %1213 to i64*
  %1215 = load i64, i64* %1214
  %1216 = add i64 %1187, 48
  %1217 = inttoptr i64 %1216 to i64*
  %1218 = load i64, i64* %1217
  %1219 = add i64 %1187, 56
  %1220 = inttoptr i64 %1219 to i64*
  %1221 = load i64, i64* %1220
  %1222 = add i64 %1187, 64
  %1223 = inttoptr i64 %1222 to i64*
  %1224 = load i64, i64* %1223
  %1225 = add i64 %1187, 72
  %1226 = inttoptr i64 %1225 to i64*
  %1227 = load i64, i64* %1226
  %1228 = inttoptr i64 %1188 to i64*
  %1229 = load i64, i64* %1228
  store i64 %1229, i64* %3, align 8, !alias.scope !1364, !noalias !1367
  store i64 %1187, i64* %10, align 8, !alias.scope !1364, !noalias !1367
  %1230 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_4009b0__rodata_type* @seg_4009b0__rodata to i64), i64 4), i64 %1194, i64 %1195, i64 %1196, i64 %1197, i64 %1198, i64 %1200, i64 %1203, i64 %1206, i64 %1209, i64 %1212, i64 %1215, i64 %1218, i64 %1221, i64 %1224, i64 %1227), !noalias !1364
  %1231 = load i64, i64* %11, align 8
  %1232 = add i64 %1231, -100
  %1233 = trunc i64 %1230 to i32
  %1234 = inttoptr i64 %1232 to i32*
  store i32 %1233, i32* %1234
  br label %block_400916
}

; Function Attrs: noinline
define %struct.Memory* @sub_400400(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400400:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_601000__got_plt_type* @seg_601000__got_plt to i64), i64 8) to i64*)
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %6 = load i64, i64* %5, align 8, !tbaa !1253
  %7 = add i64 %6, -8
  %8 = inttoptr i64 %7 to i64*
  store i64 %4, i64* %8
  store i64 %7, i64* %5, align 8, !tbaa !1253
  %9 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_601000__got_plt_type* @seg_601000__got_plt to i64), i64 16) to i64*)
  store i64 %9, i64* %3, align 8, !tbaa !1253
  %10 = icmp eq i64 %9, 4195340
  br i1 %10, label %block_40040c, label %56

block_40040c:                                     ; preds = %block_400400
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %15 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %17 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %18 = load i64, i64* %15, align 8, !alias.scope !1369, !noalias !1372
  %19 = load i64, i64* %14, align 8, !alias.scope !1369, !noalias !1372
  %20 = load i64, i64* %13, align 8, !alias.scope !1369, !noalias !1372
  %21 = load i64, i64* %12, align 8, !alias.scope !1369, !noalias !1372
  %22 = load i64, i64* %16, align 8, !alias.scope !1369, !noalias !1372
  %23 = load i64, i64* %17, align 8, !alias.scope !1369, !noalias !1372
  %24 = inttoptr i64 %6 to i64*
  %25 = load i64, i64* %24
  %26 = add i64 %6, 8
  %27 = inttoptr i64 %26 to i64*
  %28 = load i64, i64* %27
  %29 = add i64 %6, 16
  %30 = inttoptr i64 %29 to i64*
  %31 = load i64, i64* %30
  %32 = add i64 %6, 24
  %33 = inttoptr i64 %32 to i64*
  %34 = load i64, i64* %33
  %35 = add i64 %6, 32
  %36 = inttoptr i64 %35 to i64*
  %37 = load i64, i64* %36
  %38 = add i64 %6, 40
  %39 = inttoptr i64 %38 to i64*
  %40 = load i64, i64* %39
  %41 = add i64 %6, 48
  %42 = inttoptr i64 %41 to i64*
  %43 = load i64, i64* %42
  %44 = add i64 %6, 56
  %45 = inttoptr i64 %44 to i64*
  %46 = load i64, i64* %45
  %47 = add i64 %6, 64
  %48 = inttoptr i64 %47 to i64*
  %49 = load i64, i64* %48
  %50 = add i64 %6, 72
  %51 = inttoptr i64 %50 to i64*
  %52 = load i64, i64* %51
  %53 = inttoptr i64 %7 to i64*
  %54 = load i64, i64* %53
  store i64 %54, i64* %3, align 8, !alias.scope !1369, !noalias !1372
  store i64 %6, i64* %5, align 8, !alias.scope !1369, !noalias !1372
  %55 = tail call i64 @printf(i64 %18, i64 %19, i64 %20, i64 %21, i64 %22, i64 %23, i64 %25, i64 %28, i64 %31, i64 %34, i64 %37, i64 %40, i64 %43, i64 %46, i64 %49, i64 %52), !noalias !1369
  store i64 %55, i64* %11, align 8, !alias.scope !1369, !noalias !1372
  ret %struct.Memory* %2

; <label>:56:                                     ; preds = %block_400400
  %57 = tail call %struct.Memory* @__mcsema_detach_call_value(%struct.State* nonnull %0, i64 %9, %struct.Memory* %2)
  ret %struct.Memory* %57
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4004b0_register_tm_clones(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_4004b0:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64* %4, align 8, !tbaa !1253
  store i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1), i64* %5, align 8, !tbaa !1253
  store i8 and (i8 trunc (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)) to i8), i8 1), i8* %6, align 1, !tbaa !1374
  %12 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1) to i32), i32 255)) #9
  %13 = trunc i32 %12 to i8
  %14 = and i8 %13, 1
  %15 = xor i8 %14, 1
  store i8 %15, i8* %7, align 1, !tbaa !1374
  store i8 0, i8* %8, align 1, !tbaa !1374
  store i8 zext (i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1), i64 0) to i8), i8* %9, align 1, !tbaa !1374
  store i8 trunc (i64 lshr (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1), i64 63) to i8), i8* %10, align 1, !tbaa !1374
  store i8 0, i8* %11, align 1, !tbaa !1374
  br i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1), i64 0), label %block_4004e0, label %block_4004cf

block_4004cf:                                     ; preds = %block_4004b0
  store i64 0, i64* %4, align 8, !tbaa !1253
  store i8 0, i8* %6, align 1, !tbaa !1231
  store i8 1, i8* %7, align 1, !tbaa !1248
  store i8 1, i8* %9, align 1, !tbaa !1250
  store i8 0, i8* %10, align 1, !tbaa !1251
  store i8 0, i8* %11, align 1, !tbaa !1252
  store i8 0, i8* %8, align 1, !tbaa !1249
  br label %block_4004e0

block_4004e0:                                     ; preds = %block_4004cf, %block_4004b0
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %17 = load i64, i64* %16, align 8, !tbaa !1253
  %18 = inttoptr i64 %17 to i64*
  %19 = load i64, i64* %18
  store i64 %19, i64* %3, align 8, !tbaa !1253
  %20 = add i64 %17, 8
  store i64 %20, i64* %16, align 8, !tbaa !1253
  ret %struct.Memory* %2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4009a0___libc_csu_fini(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #3 {
block_4009a0:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !1253
  %6 = inttoptr i64 %5 to i64*
  %7 = load i64, i64* %6
  store i64 %7, i64* %3, align 8, !tbaa !1253
  %8 = add i64 %5, 8
  store i64 %8, i64* %4, align 8, !tbaa !1253
  ret %struct.Memory* %2
}

; Function Attrs: noinline
define %struct.Memory* @sub_4003e0__init_proc(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_4003e0:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = add i64 %6, -8
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  %14 = load i64, i64* getelementptr inbounds (%seg_600ff8__got_type, %seg_600ff8__got_type* @seg_600ff8__got, i32 0, i32 0)
  store i64 %14, i64* %4, align 8, !tbaa !1253
  store i8 0, i8* %8, align 1, !tbaa !1231
  %15 = trunc i64 %14 to i32
  %16 = and i32 %15, 255
  %17 = tail call i32 @llvm.ctpop.i32(i32 %16) #9
  %18 = trunc i32 %17 to i8
  %19 = and i8 %18, 1
  %20 = xor i8 %19, 1
  store i8 %20, i8* %9, align 1, !tbaa !1248
  %21 = icmp eq i64 %14, 0
  %22 = zext i1 %21 to i8
  store i8 %22, i8* %11, align 1, !tbaa !1250
  %23 = lshr i64 %14, 63
  %24 = trunc i64 %23 to i8
  store i8 %24, i8* %12, align 1, !tbaa !1251
  store i8 0, i8* %13, align 1, !tbaa !1252
  store i8 0, i8* %10, align 1, !tbaa !1249
  %25 = select i1 %21, i64 21, i64 16
  %26 = add i64 %25, %1
  br i1 %21, label %block_4003f5, label %block_4003f0

block_4003f5:                                     ; preds = %block_4003f0, %block_4003e0
  %27 = phi i64 [ %7, %block_4003e0 ], [ %59, %block_4003f0 ]
  %28 = phi %struct.Memory* [ %2, %block_4003e0 ], [ %58, %block_4003f0 ]
  %29 = add i64 %27, 8
  %30 = icmp ugt i64 %27, -9
  %31 = zext i1 %30 to i8
  store i8 %31, i8* %8, align 1, !tbaa !1231
  %32 = trunc i64 %29 to i32
  %33 = and i32 %32, 255
  %34 = tail call i32 @llvm.ctpop.i32(i32 %33) #9
  %35 = trunc i32 %34 to i8
  %36 = and i8 %35, 1
  %37 = xor i8 %36, 1
  store i8 %37, i8* %9, align 1, !tbaa !1248
  %38 = xor i64 %29, %27
  %39 = lshr i64 %38, 4
  %40 = trunc i64 %39 to i8
  %41 = and i8 %40, 1
  store i8 %41, i8* %10, align 1, !tbaa !1249
  %42 = icmp eq i64 %29, 0
  %43 = zext i1 %42 to i8
  store i8 %43, i8* %11, align 1, !tbaa !1250
  %44 = lshr i64 %29, 63
  %45 = trunc i64 %44 to i8
  store i8 %45, i8* %12, align 1, !tbaa !1251
  %46 = lshr i64 %27, 63
  %47 = xor i64 %44, %46
  %48 = add nuw nsw i64 %47, %44
  %49 = icmp eq i64 %48, 2
  %50 = zext i1 %49 to i8
  store i8 %50, i8* %13, align 1, !tbaa !1252
  %51 = inttoptr i64 %29 to i64*
  %52 = load i64, i64* %51
  store i64 %52, i64* %3, align 8, !tbaa !1253
  %53 = add i64 %27, 16
  store i64 %53, i64* %5, align 8, !tbaa !1253
  ret %struct.Memory* %28

block_4003f0:                                     ; preds = %block_4003e0
  %54 = add i64 %26, 80
  %55 = add i64 %26, 5
  %56 = add i64 %6, -16
  %57 = inttoptr i64 %56 to i64*
  store i64 %55, i64* %57
  store i64 %56, i64* %5, align 8, !tbaa !1253
  %58 = tail call %struct.Memory* @sub_400440(%struct.State* nonnull %0, i64 %54, %struct.Memory* %2)
  %59 = load i64, i64* %5, align 8
  br label %block_4003f5
}

; Function Attrs: nobuiltin noinline
define i64 @callback_sub_400450__start(i64, i64, i64, i64, i64, i64, i64, i64) local_unnamed_addr #5 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195408, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %12 = load volatile i1, i1* @0, align 1
  br i1 %12, label %__mcsema_early_init.exit, label %13

; <label>:13:                                     ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %13, %__mcsema_verify_reg_state.exit
  store i64 %0, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %14 = inttoptr i64 %11 to i64*
  store i64 %7, i64* %14
  %15 = add i64 %11, -8
  %16 = inttoptr i64 %15 to i64*
  store i64 %6, i64* %16
  %17 = add i64 %11, -24
  store i64 %17, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %18 = tail call %struct.Memory* @sub_400450__start(%struct.State* nonnull @__mcsema_reg_state, i64 4195408, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: norecurse nounwind
define void @__mcsema_verify_reg_state() local_unnamed_addr #6 {
entry:
  %0 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %is_null, label %end

is_null:                                          ; preds = %entry
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %end

end:                                              ; preds = %is_null, %entry
  ret void
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_400520_frame_dummy(i64, i64, i64, i64, i64, i64, i64, i64) #7 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195616, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %12 = load volatile i1, i1* @0, align 1
  br i1 %12, label %__mcsema_early_init.exit, label %13

; <label>:13:                                     ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %13, %__mcsema_verify_reg_state.exit
  store i64 %0, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %14 = inttoptr i64 %11 to i64*
  store i64 %7, i64* %14
  %15 = add i64 %11, -8
  %16 = inttoptr i64 %15 to i64*
  store i64 %6, i64* %16
  %17 = add i64 %11, -24
  store i64 %17, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %18 = tail call %struct.Memory* @sub_400520_frame_dummy(%struct.State* nonnull @__mcsema_reg_state, i64 4195616, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_4004f0___do_global_dtors_aux(i64, i64, i64, i64, i64, i64, i64, i64) #7 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195568, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %12 = load volatile i1, i1* @0, align 1
  br i1 %12, label %__mcsema_early_init.exit, label %13

; <label>:13:                                     ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %13, %__mcsema_verify_reg_state.exit
  store i64 %0, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %14 = inttoptr i64 %11 to i64*
  store i64 %7, i64* %14
  %15 = add i64 %11, -8
  %16 = inttoptr i64 %15 to i64*
  store i64 %6, i64* %16
  %17 = add i64 %11, -24
  store i64 %17, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %18 = tail call %struct.Memory* @sub_4004f0___do_global_dtors_aux(%struct.State* nonnull @__mcsema_reg_state, i64 4195568, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: noinline nounwind
define %struct.Memory* @__mcsema_detach_call_value(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #3 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %13 = load i64, i64* %9, align 8
  %14 = load i64, i64* %8, align 8
  %15 = load i64, i64* %7, align 8
  %16 = load i64, i64* %6, align 8
  %17 = load i64, i64* %11, align 8
  %18 = load i64, i64* %12, align 8
  %19 = load i64, i64* %10, align 8
  %20 = add i64 %19, 8
  %21 = inttoptr i64 %20 to i64*
  %22 = load i64, i64* %21
  %23 = add i64 %19, 16
  %24 = inttoptr i64 %23 to i64*
  %25 = load i64, i64* %24
  %26 = inttoptr i64 %1 to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %27 = tail call i64 %26(i64 %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18, i64 %22, i64 %25) #9
  store i64 %27, i64* %5, align 8
  %28 = inttoptr i64 %19 to i64*
  %29 = load i64, i64* %28
  store i64 %29, i64* %4, align 8
  store i64 %20, i64* %10, align 8
  ret %struct.Memory* %2
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_4009a0___libc_csu_fini() #7 {
  %1 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %2 = icmp eq i64 %1, 0
  br i1 %2, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %0
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %0
  %3 = phi i64 [ %1, %0 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196768, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %4 = load volatile i1, i1* @0, align 1
  br i1 %4, label %__mcsema_early_init.exit, label %5

; <label>:5:                                      ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %5, %__mcsema_verify_reg_state.exit
  %6 = add i64 %3, -8
  store i64 %6, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %7 = tail call %struct.Memory* @sub_4009a0___libc_csu_fini(%struct.State* nonnull @__mcsema_reg_state, i64 4196768, %struct.Memory* null)
  store i64 %3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %8 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %8
}

; Function Attrs: nobuiltin noinline
define i64 @callback_sub_400930___libc_csu_init() #5 {
  %1 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %2 = icmp eq i64 %1, 0
  br i1 %2, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %0
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %0
  %3 = phi i64 [ %1, %0 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196656, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %4 = load volatile i1, i1* @0, align 1
  br i1 %4, label %__mcsema_early_init.exit, label %5

; <label>:5:                                      ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %5, %__mcsema_verify_reg_state.exit
  %6 = add i64 %3, -8
  store i64 %6, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %7 = tail call %struct.Memory* @sub_400930___libc_csu_init(%struct.State* nonnull @__mcsema_reg_state, i64 4196656, %struct.Memory* null)
  store i64 %3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %8 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %8
}

; Function Attrs: nobuiltin noinline
define i64 @main(i64, i64, i64) #5 {
  %4 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %3
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %3
  %6 = phi i64 [ %4, %3 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195632, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %7 = load volatile i1, i1* @0, align 1
  br i1 %7, label %__mcsema_early_init.exit, label %8

; <label>:8:                                      ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %8, %__mcsema_verify_reg_state.exit
  store i64 %0, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  %9 = add i64 %6, -8
  store i64 %9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = tail call %struct.Memory* @sub_400530_main(%struct.State* nonnull @__mcsema_reg_state, i64 4195632, %struct.Memory* null)
  store i64 %6, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %11 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %11
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_601058___libc_start_main(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %13 = load i64, i64* %9, align 8
  %14 = load i64, i64* %8, align 8
  %15 = load i64, i64* %7, align 8
  %16 = load i64, i64* %6, align 8
  %17 = load i64, i64* %11, align 8
  %18 = load i64, i64* %12, align 8
  %19 = load i64, i64* %10, align 8
  %20 = add i64 %19, 8
  %21 = inttoptr i64 %20 to i64*
  %22 = load i64, i64* %21
  %23 = add i64 %19, 16
  %24 = inttoptr i64 %23 to i64*
  %25 = load i64, i64* %24
  %26 = inttoptr i64 %19 to i64*
  %27 = load i64, i64* %26
  store i64 %27, i64* %4, align 8
  store i64 %20, i64* %10, align 8
  %28 = tail call i64 @__libc_start_main(i64 %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18, i64 %22, i64 %25)
  store i64 %28, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_601068___gmon_start__(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %7 = load i64, i64* %6, align 8
  %8 = inttoptr i64 %7 to i64*
  %9 = load i64, i64* %8
  store i64 %9, i64* %4, align 8
  %10 = add i64 %7, 8
  store i64 %10, i64* %6, align 8
  %11 = tail call i64 @__gmon_start__()
  store i64 %11, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_400410_printf(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %13 = load i64, i64* %9, align 8
  %14 = load i64, i64* %8, align 8
  %15 = load i64, i64* %7, align 8
  %16 = load i64, i64* %6, align 8
  %17 = load i64, i64* %11, align 8
  %18 = load i64, i64* %12, align 8
  %19 = load i64, i64* %10, align 8
  %20 = add i64 %19, 8
  %21 = inttoptr i64 %20 to i64*
  %22 = load i64, i64* %21
  %23 = add i64 %19, 16
  %24 = inttoptr i64 %23 to i64*
  %25 = load i64, i64* %24
  %26 = add i64 %19, 24
  %27 = inttoptr i64 %26 to i64*
  %28 = load i64, i64* %27
  %29 = add i64 %19, 32
  %30 = inttoptr i64 %29 to i64*
  %31 = load i64, i64* %30
  %32 = add i64 %19, 40
  %33 = inttoptr i64 %32 to i64*
  %34 = load i64, i64* %33
  %35 = add i64 %19, 48
  %36 = inttoptr i64 %35 to i64*
  %37 = load i64, i64* %36
  %38 = add i64 %19, 56
  %39 = inttoptr i64 %38 to i64*
  %40 = load i64, i64* %39
  %41 = add i64 %19, 64
  %42 = inttoptr i64 %41 to i64*
  %43 = load i64, i64* %42
  %44 = add i64 %19, 72
  %45 = inttoptr i64 %44 to i64*
  %46 = load i64, i64* %45
  %47 = add i64 %19, 80
  %48 = inttoptr i64 %47 to i64*
  %49 = load i64, i64* %48
  %50 = inttoptr i64 %19 to i64*
  %51 = load i64, i64* %50
  store i64 %51, i64* %4, align 8
  store i64 %20, i64* %10, align 8
  %52 = tail call i64 @printf(i64 %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18, i64 %22, i64 %25, i64 %28, i64 %31, i64 %34, i64 %37, i64 %40, i64 %43, i64 %46, i64 %49)
  store i64 %52, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_400430_atoi(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %8 = load i64, i64* %6, align 8
  %9 = load i64, i64* %7, align 8
  %10 = inttoptr i64 %9 to i64*
  %11 = load i64, i64* %10
  store i64 %11, i64* %4, align 8
  %12 = add i64 %9, 8
  store i64 %12, i64* %7, align 8
  %13 = tail call i64 @atoi(i64 %8)
  store i64 %13, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @.term_proc(i64, i64, i64, i64, i64, i64, i64, i64) local_unnamed_addr #7 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196772, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %12 = load volatile i1, i1* @0, align 1
  br i1 %12, label %__mcsema_early_init.exit, label %13

; <label>:13:                                     ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %13, %__mcsema_verify_reg_state.exit
  store i64 %0, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %14 = inttoptr i64 %11 to i64*
  store i64 %7, i64* %14
  %15 = add i64 %11, -8
  %16 = inttoptr i64 %15 to i64*
  store i64 %6, i64* %16
  %17 = add i64 %11, -24
  store i64 %17, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %18 = tail call %struct.Memory* @sub_4009a4__term_proc(%struct.State* nonnull @__mcsema_reg_state, i64 4196772, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: nobuiltin noinline
define i64 @.init_proc(i64, i64, i64, i64, i64, i64, i64, i64) local_unnamed_addr #5 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195296, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %12 = load volatile i1, i1* @0, align 1
  br i1 %12, label %__mcsema_early_init.exit, label %13

; <label>:13:                                     ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %13, %__mcsema_verify_reg_state.exit
  store i64 %0, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %14 = inttoptr i64 %11 to i64*
  store i64 %7, i64* %14
  %15 = add i64 %11, -8
  %16 = inttoptr i64 %15 to i64*
  store i64 %6, i64* %16
  %17 = add i64 %11, -24
  store i64 %17, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %18 = tail call %struct.Memory* @sub_4003e0__init_proc(%struct.State* nonnull @__mcsema_reg_state, i64 4195296, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

define internal void @__mcsema_constructor() {
  %1 = load volatile i1, i1* @0, align 1
  br i1 %1, label %__mcsema_early_init.exit, label %2

; <label>:2:                                      ; preds = %0
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %2, %0
  %3 = tail call i64 @callback_sub_400930___libc_csu_init()
  ret void
}

; Function Attrs: nounwind
define internal void @__mcsema_destructor() #9 {
  %1 = tail call i64 @callback_sub_4009a0___libc_csu_fini()
  ret void
}

; Function Attrs: noinline optnone
define %struct.State* @__mcsema_debug_get_reg_state() #10 {
  ret %struct.State* @__mcsema_reg_state
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #11

attributes #0 = { nounwind readnone speculatable }
attributes #1 = { noduplicate noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline }
attributes #3 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin noinline }
attributes #6 = { norecurse nounwind }
attributes #7 = { nobuiltin noinline nounwind }
attributes #8 = { alwaysinline inlinehint "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }
attributes #10 = { noinline optnone }
attributes #11 = { cold noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!1229, !1230}

!0 = !{!"clang version 4.0.1 (tags/RELEASE_401/final)"}
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.1 (tags/RELEASE_401/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !67, imports: !70)
!2 = !DIFile(filename: "/home/douze/remill/remill/Arch/X86/Runtime/BasicBlock.cpp", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!3 = !{!4, !26, !35, !39, !45, !51, !55, !61}
!4 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "Name", scope: !6, file: !5, line: 70, baseType: !8, size: 32, elements: !11, identifier: "_ZTSN14AsyncHyperCall4NameE")
!5 = !DIFile(filename: "/home/douze/remill/remill/Arch/Runtime/HyperCall.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!6 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "AsyncHyperCall", file: !5, line: 68, size: 8, elements: !7, identifier: "_ZTS14AsyncHyperCall")
!7 = !{}
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !9, line: 183, baseType: !10)
!9 = !DIFile(filename: "/home/douze/remill/remill-build/libraries/llvm/bin/../lib/clang/4.0.1/include/stdint.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25}
!12 = !DIEnumerator(name: "kInvalid", value: 0)
!13 = !DIEnumerator(name: "kX86Int1", value: 1)
!14 = !DIEnumerator(name: "kX86Int3", value: 2)
!15 = !DIEnumerator(name: "kX86IntO", value: 3)
!16 = !DIEnumerator(name: "kX86IntN", value: 4)
!17 = !DIEnumerator(name: "kX86Bound", value: 5)
!18 = !DIEnumerator(name: "kX86IRet", value: 6)
!19 = !DIEnumerator(name: "kX86SysCall", value: 7)
!20 = !DIEnumerator(name: "kX86SysRet", value: 8)
!21 = !DIEnumerator(name: "kX86SysEnter", value: 9)
!22 = !DIEnumerator(name: "kX86SysExit", value: 10)
!23 = !DIEnumerator(name: "kX86JmpFar", value: 11)
!24 = !DIEnumerator(name: "kAArch64SupervisorCall", value: 12)
!25 = !DIEnumerator(name: "kInvalidInstruction", value: 13)
!26 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "RequestPrivilegeLevel", file: !27, line: 64, baseType: !28, size: 16, elements: !30, identifier: "_ZTS21RequestPrivilegeLevel")
!27 = !DIFile(filename: "/home/douze/remill/remill/Arch/X86/Runtime/State.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 218, baseType: !29)
!29 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!30 = !{!31, !32, !33, !34}
!31 = !DIEnumerator(name: "kRPLRingZero", value: 0)
!32 = !DIEnumerator(name: "kRPLRingOne", value: 1)
!33 = !DIEnumerator(name: "kRPLRingTwo", value: 2)
!34 = !DIEnumerator(name: "kRPLRingThree", value: 3)
!35 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "TableIndicator", file: !27, line: 71, baseType: !28, size: 16, elements: !36, identifier: "_ZTS14TableIndicator")
!36 = !{!37, !38}
!37 = !DIEnumerator(name: "kGlobalDescriptorTable", value: 0)
!38 = !DIEnumerator(name: "kLocalDescriptorTable", value: 1)
!39 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "FPUPrecisionControl", file: !27, line: 123, baseType: !28, size: 16, elements: !40, identifier: "_ZTS19FPUPrecisionControl")
!40 = !{!41, !42, !43, !44}
!41 = !DIEnumerator(name: "kPrecisionSingle", value: 0)
!42 = !DIEnumerator(name: "kPrecisionReserved", value: 1)
!43 = !DIEnumerator(name: "kPrecisionDouble", value: 2)
!44 = !DIEnumerator(name: "kPrecisionExtended", value: 3)
!45 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "FPURoundingControl", file: !27, line: 130, baseType: !28, size: 16, elements: !46, identifier: "_ZTS18FPURoundingControl")
!46 = !{!47, !48, !49, !50}
!47 = !DIEnumerator(name: "kFPURoundToNearestEven", value: 0)
!48 = !DIEnumerator(name: "kFPURoundDownNegInf", value: 1)
!49 = !DIEnumerator(name: "kFPURoundUpInf", value: 2)
!50 = !DIEnumerator(name: "kFPURoundToZero", value: 3)
!51 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "FPUInfinityControl", file: !27, line: 137, baseType: !28, size: 16, elements: !52, identifier: "_ZTS18FPUInfinityControl")
!52 = !{!53, !54}
!53 = !DIEnumerator(name: "kInfinityProjective", value: 0)
!54 = !DIEnumerator(name: "kInfinityAffine", value: 1)
!55 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "FPUTag", file: !27, line: 214, baseType: !28, size: 16, elements: !56, identifier: "_ZTS6FPUTag")
!56 = !{!57, !58, !59, !60}
!57 = !DIEnumerator(name: "kFPUTagNonZero", value: 0)
!58 = !DIEnumerator(name: "kFPUTagZero", value: 1)
!59 = !DIEnumerator(name: "kFPUTagSpecial", value: 2)
!60 = !DIEnumerator(name: "kFPUTagEmpty", value: 3)
!61 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "FPUAbridgedTag", file: !27, line: 221, baseType: !62, size: 8, elements: !64, identifier: "_ZTS14FPUAbridgedTag")
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !9, line: 237, baseType: !63)
!63 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!64 = !{!65, !66}
!65 = !DIEnumerator(name: "kFPUAbridgedTagEmpty", value: 0)
!66 = !DIEnumerator(name: "kFPUAbridgedTagValid", value: 1)
!67 = !{!68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!70 = !{!71, !75, !79, !86, !90, !95, !100, !102, !110, !114, !118, !130, !134, !138, !142, !146, !151, !155, !159, !163, !167, !175, !179, !183, !185, !189, !193, !197, !203, !207, !211, !213, !221, !225, !233, !235, !239, !243, !247, !251, !256, !261, !266, !267, !268, !269, !272, !273, !274, !275, !276, !277, !278, !333, !338, !340, !342, !346, !348, !350, !352, !354, !356, !358, !360, !365, !369, !371, !373, !378, !380, !382, !384, !386, !388, !390, !393, !395, !397, !401, !405, !407, !409, !411, !413, !415, !417, !419, !421, !423, !425, !429, !433, !435, !437, !439, !441, !443, !445, !447, !449, !451, !453, !455, !457, !459, !461, !463, !467, !471, !475, !477, !479, !481, !483, !485, !487, !489, !491, !493, !497, !501, !505, !507, !509, !511, !515, !519, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !547, !551, !555, !559, !561, !563, !565, !567, !571, !575, !577, !579, !581, !583, !585, !587, !591, !595, !597, !599, !601, !603, !607, !611, !615, !617, !619, !621, !623, !625, !627, !631, !635, !639, !641, !645, !649, !651, !653, !655, !657, !659, !661, !676, !678, !682, !690, !695, !699, !703, !707, !711, !713, !715, !719, !725, !729, !735, !741, !743, !747, !751, !755, !759, !770, !772, !776, !780, !784, !786, !790, !794, !798, !800, !802, !806, !814, !818, !822, !826, !828, !834, !836, !842, !846, !850, !854, !858, !862, !866, !868, !870, !874, !878, !882, !884, !888, !892, !894, !896, !900, !904, !908, !912, !913, !914, !842, !770, !776, !784, !912, !913, !914, !915, !919, !922, !924, !926, !928, !930, !932, !934, !936, !938, !940, !942, !944, !946, !947, !948, !949, !951, !953, !955, !957, !959, !961, !963, !965, !967, !969, !971, !973, !975, !978, !982, !987, !990, !992, !994, !996, !998, !1000, !1002, !1004, !1006, !1008, !1010, !1012, !1014, !1016, !1018, !1023, !1028, !1032, !1034, !1036, !1038, !1040, !1047, !1051, !1055, !1059, !1063, !1067, !1072, !1076, !1078, !1082, !1088, !1092, !1097, !1099, !1101, !1105, !1109, !1113, !1115, !1117, !1119, !1121, !1125, !1127, !1129, !1133, !1137, !1141, !1145, !1149, !1151, !1153, !1157, !1161, !1165, !1169, !1171, !1173, !1177, !1181, !1182, !1183, !1184, !1185, !1186, !1190, !1192, !1195, !1200, !1202, !1208, !1210, !1212, !1214, !1219, !1221, !1227, !1186, !1190, !1192, !1195, !1200, !1202, !1208, !1210, !1212, !1214, !1219, !1221, !1227}
!71 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !72, entity: !73)
!72 = !DINamespace(name: "__gnu_debug", scope: null)
!73 = !DINamespace(name: "__debug", scope: !74)
!74 = !DINamespace(name: "std", scope: null)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !76)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !77, line: 101, baseType: !78)
!77 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !77, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !77, line: 109, baseType: !81)
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !77, line: 105, size: 128, elements: !82, identifier: "_ZTS6ldiv_t")
!82 = !{!83, !85}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !81, file: !77, line: 107, baseType: !84, size: 64)
!84 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !81, file: !77, line: 108, baseType: !84, size: 64, offset: 64)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !87)
!87 = !DISubprogram(name: "abort", scope: !77, file: !77, line: 515, type: !88, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!88 = !DISubroutineType(types: !89)
!89 = !{null}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !91)
!91 = !DISubprogram(name: "abs", scope: !77, file: !77, line: 774, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !94}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !96)
!96 = !DISubprogram(name: "atexit", scope: !77, file: !77, line: 519, type: !97, flags: DIFlagPrototyped, spFlags: 0)
!97 = !DISubroutineType(types: !98)
!98 = !{!94, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !101)
!101 = !DISubprogram(name: "at_quick_exit", scope: !77, file: !77, line: 524, type: !97, flags: DIFlagPrototyped, spFlags: 0)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !103)
!103 = !DISubprogram(name: "atof", scope: !77, file: !77, line: 144, type: !104, flags: DIFlagPrototyped, spFlags: 0)
!104 = !DISubroutineType(types: !105)
!105 = !{!106, !107}
!106 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !109)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !111)
!111 = !DISubprogram(name: "atoi", scope: !77, file: !77, line: 147, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DISubroutineType(types: !113)
!113 = !{!94, !107}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !115)
!115 = !DISubprogram(name: "atol", scope: !77, file: !77, line: 150, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DISubroutineType(types: !117)
!117 = !{!84, !107}
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !119)
!119 = !DISubprogram(name: "bsearch", scope: !77, file: !77, line: 754, type: !120, flags: DIFlagPrototyped, spFlags: 0)
!120 = !DISubroutineType(types: !121)
!121 = !{!122, !68, !68, !123, !123, !126}
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !124, line: 62, baseType: !125)
!124 = !DIFile(filename: "/home/douze/remill/remill-build/libraries/llvm/bin/../lib/clang/4.0.1/include/stddef.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!125 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!126 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !77, line: 741, baseType: !127)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64)
!128 = !DISubroutineType(types: !129)
!129 = !{!94, !68, !68}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !131)
!131 = !DISubprogram(name: "calloc", scope: !77, file: !77, line: 468, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!132 = !DISubroutineType(types: !133)
!133 = !{!122, !123, !123}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !135)
!135 = !DISubprogram(name: "div", scope: !77, file: !77, line: 788, type: !136, flags: DIFlagPrototyped, spFlags: 0)
!136 = !DISubroutineType(types: !137)
!137 = !{!76, !94, !94}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !139)
!139 = !DISubprogram(name: "exit", scope: !77, file: !77, line: 543, type: !140, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!140 = !DISubroutineType(types: !141)
!141 = !{null, !94}
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !143)
!143 = !DISubprogram(name: "free", scope: !77, file: !77, line: 483, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!144 = !DISubroutineType(types: !145)
!145 = !{null, !122}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !147)
!147 = !DISubprogram(name: "getenv", scope: !77, file: !77, line: 564, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!148 = !DISubroutineType(types: !149)
!149 = !{!150, !107}
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !152)
!152 = !DISubprogram(name: "labs", scope: !77, file: !77, line: 775, type: !153, flags: DIFlagPrototyped, spFlags: 0)
!153 = !DISubroutineType(types: !154)
!154 = !{!84, !84}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !156)
!156 = !DISubprogram(name: "ldiv", scope: !77, file: !77, line: 790, type: !157, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DISubroutineType(types: !158)
!158 = !{!80, !84, !84}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !160)
!160 = !DISubprogram(name: "malloc", scope: !77, file: !77, line: 466, type: !161, flags: DIFlagPrototyped, spFlags: 0)
!161 = !DISubroutineType(types: !162)
!162 = !{!122, !123}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !164)
!164 = !DISubprogram(name: "mblen", scope: !77, file: !77, line: 862, type: !165, flags: DIFlagPrototyped, spFlags: 0)
!165 = !DISubroutineType(types: !166)
!166 = !{!94, !107, !123}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !168)
!168 = !DISubprogram(name: "mbstowcs", scope: !77, file: !77, line: 873, type: !169, flags: DIFlagPrototyped, spFlags: 0)
!169 = !DISubroutineType(types: !170)
!170 = !{!123, !171, !174, !123}
!171 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !172)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !173, size: 64)
!173 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!174 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !107)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !176)
!176 = !DISubprogram(name: "mbtowc", scope: !77, file: !77, line: 865, type: !177, flags: DIFlagPrototyped, spFlags: 0)
!177 = !DISubroutineType(types: !178)
!178 = !{!94, !171, !174, !123}
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !180)
!180 = !DISubprogram(name: "qsort", scope: !77, file: !77, line: 764, type: !181, flags: DIFlagPrototyped, spFlags: 0)
!181 = !DISubroutineType(types: !182)
!182 = !{null, !122, !123, !123, !126}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !184)
!184 = !DISubprogram(name: "quick_exit", scope: !77, file: !77, line: 549, type: !140, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !186)
!186 = !DISubprogram(name: "rand", scope: !77, file: !77, line: 374, type: !187, flags: DIFlagPrototyped, spFlags: 0)
!187 = !DISubroutineType(types: !188)
!188 = !{!94}
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !190)
!190 = !DISubprogram(name: "realloc", scope: !77, file: !77, line: 480, type: !191, flags: DIFlagPrototyped, spFlags: 0)
!191 = !DISubroutineType(types: !192)
!192 = !{!122, !122, !123}
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !194)
!194 = !DISubprogram(name: "srand", scope: !77, file: !77, line: 376, type: !195, flags: DIFlagPrototyped, spFlags: 0)
!195 = !DISubroutineType(types: !196)
!196 = !{null, !10}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !198)
!198 = !DISubprogram(name: "strtod", scope: !77, file: !77, line: 164, type: !199, flags: DIFlagPrototyped, spFlags: 0)
!199 = !DISubroutineType(types: !200)
!200 = !{!106, !174, !201}
!201 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !202)
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !204)
!204 = !DISubprogram(name: "strtol", scope: !77, file: !77, line: 183, type: !205, flags: DIFlagPrototyped, spFlags: 0)
!205 = !DISubroutineType(types: !206)
!206 = !{!84, !174, !201, !94}
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !208)
!208 = !DISubprogram(name: "strtoul", scope: !77, file: !77, line: 187, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!209 = !DISubroutineType(types: !210)
!210 = !{!125, !174, !201, !94}
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !212)
!212 = !DISubprogram(name: "system", scope: !77, file: !77, line: 716, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !214)
!214 = !DISubprogram(name: "wcstombs", scope: !77, file: !77, line: 876, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!215 = !DISubroutineType(types: !216)
!216 = !{!123, !217, !218, !123}
!217 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !150)
!218 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !219)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 64)
!220 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !173)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !222)
!222 = !DISubprogram(name: "wctomb", scope: !77, file: !77, line: 869, type: !223, flags: DIFlagPrototyped, spFlags: 0)
!223 = !DISubroutineType(types: !224)
!224 = !{!94, !150, !173}
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !227)
!226 = !DINamespace(name: "__gnu_cxx", scope: null)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !77, line: 121, baseType: !228)
!228 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !77, line: 117, size: 128, elements: !229, identifier: "_ZTS7lldiv_t")
!229 = !{!230, !232}
!230 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !228, file: !77, line: 119, baseType: !231, size: 64)
!231 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !228, file: !77, line: 120, baseType: !231, size: 64, offset: 64)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !234)
!234 = !DISubprogram(name: "_Exit", scope: !77, file: !77, line: 557, type: !140, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !236)
!236 = !DISubprogram(name: "llabs", scope: !77, file: !77, line: 779, type: !237, flags: DIFlagPrototyped, spFlags: 0)
!237 = !DISubroutineType(types: !238)
!238 = !{!231, !231}
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !240)
!240 = !DISubprogram(name: "lldiv", scope: !77, file: !77, line: 796, type: !241, flags: DIFlagPrototyped, spFlags: 0)
!241 = !DISubroutineType(types: !242)
!242 = !{!227, !231, !231}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !244)
!244 = !DISubprogram(name: "atoll", scope: !77, file: !77, line: 157, type: !245, flags: DIFlagPrototyped, spFlags: 0)
!245 = !DISubroutineType(types: !246)
!246 = !{!231, !107}
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !248)
!248 = !DISubprogram(name: "strtoll", scope: !77, file: !77, line: 209, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!249 = !DISubroutineType(types: !250)
!250 = !{!231, !174, !201, !94}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !252)
!252 = !DISubprogram(name: "strtoull", scope: !77, file: !77, line: 214, type: !253, flags: DIFlagPrototyped, spFlags: 0)
!253 = !DISubroutineType(types: !254)
!254 = !{!255, !174, !201, !94}
!255 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !257)
!257 = !DISubprogram(name: "strtof", scope: !77, file: !77, line: 172, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!258 = !DISubroutineType(types: !259)
!259 = !{!260, !174, !201}
!260 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !262)
!262 = !DISubprogram(name: "strtold", scope: !77, file: !77, line: 175, type: !263, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DISubroutineType(types: !264)
!264 = !{!265, !174, !201}
!265 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !227)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !234)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !236)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !270)
!270 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !226, file: !271, line: 227, type: !241, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !240)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !244)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !257)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !248)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !252)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !262)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !279)
!279 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !281, file: !280, line: 75, size: 64, elements: !282, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!280 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/exception_ptr.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!281 = !DINamespace(name: "__exception_ptr", scope: !74)
!282 = !{!283, !284, !288, !291, !292, !297, !298, !302, !308, !312, !316, !319, !320, !323, !327}
!283 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !279, file: !280, line: 77, baseType: !122, size: 64)
!284 = !DISubprogram(name: "exception_ptr", scope: !279, file: !280, line: 79, type: !285, scopeLine: 79, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!285 = !DISubroutineType(types: !286)
!286 = !{null, !287, !122}
!287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!288 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !279, file: !280, line: 81, type: !289, scopeLine: 81, flags: DIFlagPrototyped, spFlags: 0)
!289 = !DISubroutineType(types: !290)
!290 = !{null, !287}
!291 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !279, file: !280, line: 82, type: !289, scopeLine: 82, flags: DIFlagPrototyped, spFlags: 0)
!292 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !279, file: !280, line: 84, type: !293, scopeLine: 84, flags: DIFlagPrototyped, spFlags: 0)
!293 = !DISubroutineType(types: !294)
!294 = !{!122, !295}
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !296, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!296 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !279)
!297 = !DISubprogram(name: "exception_ptr", scope: !279, file: !280, line: 90, type: !289, scopeLine: 90, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!298 = !DISubprogram(name: "exception_ptr", scope: !279, file: !280, line: 92, type: !299, scopeLine: 92, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!299 = !DISubroutineType(types: !300)
!300 = !{null, !287, !301}
!301 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !296, size: 64)
!302 = !DISubprogram(name: "exception_ptr", scope: !279, file: !280, line: 95, type: !303, scopeLine: 95, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!303 = !DISubroutineType(types: !304)
!304 = !{null, !287, !305}
!305 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !74, file: !306, line: 200, baseType: !307)
!306 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!307 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!308 = !DISubprogram(name: "exception_ptr", scope: !279, file: !280, line: 99, type: !309, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!309 = !DISubroutineType(types: !310)
!310 = !{null, !287, !311}
!311 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !279, size: 64)
!312 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !279, file: !280, line: 112, type: !313, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!313 = !DISubroutineType(types: !314)
!314 = !{!315, !287, !301}
!315 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !279, size: 64)
!316 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !279, file: !280, line: 116, type: !317, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!317 = !DISubroutineType(types: !318)
!318 = !{!315, !287, !311}
!319 = !DISubprogram(name: "~exception_ptr", scope: !279, file: !280, line: 123, type: !289, scopeLine: 123, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!320 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !279, file: !280, line: 126, type: !321, scopeLine: 126, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!321 = !DISubroutineType(types: !322)
!322 = !{null, !287, !315}
!323 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !279, file: !280, line: 138, type: !324, scopeLine: 138, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!324 = !DISubroutineType(types: !325)
!325 = !{!326, !295}
!326 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!327 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !279, file: !280, line: 147, type: !328, scopeLine: 147, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!328 = !DISubroutineType(types: !329)
!329 = !{!330, !295}
!330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !331, size: 64)
!331 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !332)
!332 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !74, file: !280, line: 47, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !334)
!334 = !DISubprogram(name: "acos", scope: !335, file: !335, line: 54, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!336 = !DISubroutineType(types: !337)
!337 = !{!106, !106}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !339)
!339 = !DISubprogram(name: "asin", scope: !335, file: !335, line: 56, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !341)
!341 = !DISubprogram(name: "atan", scope: !335, file: !335, line: 58, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !343)
!343 = !DISubprogram(name: "atan2", scope: !335, file: !335, line: 60, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DISubroutineType(types: !345)
!345 = !{!106, !106, !106}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !347)
!347 = !DISubprogram(name: "ceil", scope: !335, file: !335, line: 178, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !349)
!349 = !DISubprogram(name: "cos", scope: !335, file: !335, line: 63, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !351)
!351 = !DISubprogram(name: "cosh", scope: !335, file: !335, line: 72, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !353)
!353 = !DISubprogram(name: "exp", scope: !335, file: !335, line: 100, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !355)
!355 = !DISubprogram(name: "fabs", scope: !335, file: !335, line: 181, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !357)
!357 = !DISubprogram(name: "floor", scope: !335, file: !335, line: 184, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !359)
!359 = !DISubprogram(name: "fmod", scope: !335, file: !335, line: 187, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !361)
!361 = !DISubprogram(name: "frexp", scope: !335, file: !335, line: 103, type: !362, flags: DIFlagPrototyped, spFlags: 0)
!362 = !DISubroutineType(types: !363)
!363 = !{!106, !106, !364}
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !366)
!366 = !DISubprogram(name: "ldexp", scope: !335, file: !335, line: 106, type: !367, flags: DIFlagPrototyped, spFlags: 0)
!367 = !DISubroutineType(types: !368)
!368 = !{!106, !106, !94}
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !370)
!370 = !DISubprogram(name: "log", scope: !335, file: !335, line: 109, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !372)
!372 = !DISubprogram(name: "log10", scope: !335, file: !335, line: 112, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !374)
!374 = !DISubprogram(name: "modf", scope: !335, file: !335, line: 115, type: !375, flags: DIFlagPrototyped, spFlags: 0)
!375 = !DISubroutineType(types: !376)
!376 = !{!106, !106, !377}
!377 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !379)
!379 = !DISubprogram(name: "pow", scope: !335, file: !335, line: 153, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !381)
!381 = !DISubprogram(name: "sin", scope: !335, file: !335, line: 65, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !383)
!383 = !DISubprogram(name: "sinh", scope: !335, file: !335, line: 74, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !385)
!385 = !DISubprogram(name: "sqrt", scope: !335, file: !335, line: 156, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !387)
!387 = !DISubprogram(name: "tan", scope: !335, file: !335, line: 67, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !389)
!389 = !DISubprogram(name: "tanh", scope: !335, file: !335, line: 76, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !391)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !392, line: 29, baseType: !106)
!392 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathdef.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !394)
!394 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !392, line: 28, baseType: !260)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !396)
!396 = !DISubprogram(name: "acosh", scope: !335, file: !335, line: 88, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !398)
!398 = !DISubprogram(name: "acoshf", scope: !335, file: !335, line: 88, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!399 = !DISubroutineType(types: !400)
!400 = !{!260, !260}
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !402)
!402 = !DISubprogram(name: "acoshl", scope: !335, file: !335, line: 88, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DISubroutineType(types: !404)
!404 = !{!265, !265}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !406)
!406 = !DISubprogram(name: "asinh", scope: !335, file: !335, line: 90, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !408)
!408 = !DISubprogram(name: "asinhf", scope: !335, file: !335, line: 90, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !410)
!410 = !DISubprogram(name: "asinhl", scope: !335, file: !335, line: 90, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !412)
!412 = !DISubprogram(name: "atanh", scope: !335, file: !335, line: 92, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !414)
!414 = !DISubprogram(name: "atanhf", scope: !335, file: !335, line: 92, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !416)
!416 = !DISubprogram(name: "atanhl", scope: !335, file: !335, line: 92, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !418)
!418 = !DISubprogram(name: "cbrt", scope: !335, file: !335, line: 169, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !420)
!420 = !DISubprogram(name: "cbrtf", scope: !335, file: !335, line: 169, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !422)
!422 = !DISubprogram(name: "cbrtl", scope: !335, file: !335, line: 169, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !424)
!424 = !DISubprogram(name: "copysign", scope: !335, file: !335, line: 221, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !426)
!426 = !DISubprogram(name: "copysignf", scope: !335, file: !335, line: 221, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{!260, !260, !260}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !430)
!430 = !DISubprogram(name: "copysignl", scope: !335, file: !335, line: 221, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{!265, !265, !265}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !434)
!434 = !DISubprogram(name: "erf", scope: !335, file: !335, line: 259, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !436)
!436 = !DISubprogram(name: "erff", scope: !335, file: !335, line: 259, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !438)
!438 = !DISubprogram(name: "erfl", scope: !335, file: !335, line: 259, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !440)
!440 = !DISubprogram(name: "erfc", scope: !335, file: !335, line: 260, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !442)
!442 = !DISubprogram(name: "erfcf", scope: !335, file: !335, line: 260, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !444)
!444 = !DISubprogram(name: "erfcl", scope: !335, file: !335, line: 260, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !446)
!446 = !DISubprogram(name: "exp2", scope: !335, file: !335, line: 141, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !448)
!448 = !DISubprogram(name: "exp2f", scope: !335, file: !335, line: 141, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !450)
!450 = !DISubprogram(name: "exp2l", scope: !335, file: !335, line: 141, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !452)
!452 = !DISubprogram(name: "expm1", scope: !335, file: !335, line: 128, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !454)
!454 = !DISubprogram(name: "expm1f", scope: !335, file: !335, line: 128, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !456)
!456 = !DISubprogram(name: "expm1l", scope: !335, file: !335, line: 128, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !458)
!458 = !DISubprogram(name: "fdim", scope: !335, file: !335, line: 347, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !460)
!460 = !DISubprogram(name: "fdimf", scope: !335, file: !335, line: 347, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !462)
!462 = !DISubprogram(name: "fdiml", scope: !335, file: !335, line: 347, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !464)
!464 = !DISubprogram(name: "fma", scope: !335, file: !335, line: 366, type: !465, flags: DIFlagPrototyped, spFlags: 0)
!465 = !DISubroutineType(types: !466)
!466 = !{!106, !106, !106, !106}
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !468)
!468 = !DISubprogram(name: "fmaf", scope: !335, file: !335, line: 366, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{!260, !260, !260, !260}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !472)
!472 = !DISubprogram(name: "fmal", scope: !335, file: !335, line: 366, type: !473, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DISubroutineType(types: !474)
!474 = !{!265, !265, !265, !265}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !476)
!476 = !DISubprogram(name: "fmax", scope: !335, file: !335, line: 350, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !478)
!478 = !DISubprogram(name: "fmaxf", scope: !335, file: !335, line: 350, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !480)
!480 = !DISubprogram(name: "fmaxl", scope: !335, file: !335, line: 350, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !482)
!482 = !DISubprogram(name: "fmin", scope: !335, file: !335, line: 353, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !484)
!484 = !DISubprogram(name: "fminf", scope: !335, file: !335, line: 353, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !486)
!486 = !DISubprogram(name: "fminl", scope: !335, file: !335, line: 353, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !488)
!488 = !DISubprogram(name: "hypot", scope: !335, file: !335, line: 162, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !490)
!490 = !DISubprogram(name: "hypotf", scope: !335, file: !335, line: 162, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !492)
!492 = !DISubprogram(name: "hypotl", scope: !335, file: !335, line: 162, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !494)
!494 = !DISubprogram(name: "ilogb", scope: !335, file: !335, line: 306, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!495 = !DISubroutineType(types: !496)
!496 = !{!94, !106}
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !498)
!498 = !DISubprogram(name: "ilogbf", scope: !335, file: !335, line: 306, type: !499, flags: DIFlagPrototyped, spFlags: 0)
!499 = !DISubroutineType(types: !500)
!500 = !{!94, !260}
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !502)
!502 = !DISubprogram(name: "ilogbl", scope: !335, file: !335, line: 306, type: !503, flags: DIFlagPrototyped, spFlags: 0)
!503 = !DISubroutineType(types: !504)
!504 = !{!94, !265}
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !506)
!506 = !DISubprogram(name: "lgamma", scope: !335, file: !335, line: 261, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !508)
!508 = !DISubprogram(name: "lgammaf", scope: !335, file: !335, line: 261, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !510)
!510 = !DISubprogram(name: "lgammal", scope: !335, file: !335, line: 261, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !512)
!512 = !DISubprogram(name: "llrint", scope: !335, file: !335, line: 337, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!513 = !DISubroutineType(types: !514)
!514 = !{!231, !106}
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !516)
!516 = !DISubprogram(name: "llrintf", scope: !335, file: !335, line: 337, type: !517, flags: DIFlagPrototyped, spFlags: 0)
!517 = !DISubroutineType(types: !518)
!518 = !{!231, !260}
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !520)
!520 = !DISubprogram(name: "llrintl", scope: !335, file: !335, line: 337, type: !521, flags: DIFlagPrototyped, spFlags: 0)
!521 = !DISubroutineType(types: !522)
!522 = !{!231, !265}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !524)
!524 = !DISubprogram(name: "llround", scope: !335, file: !335, line: 343, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !526)
!526 = !DISubprogram(name: "llroundf", scope: !335, file: !335, line: 343, type: !517, flags: DIFlagPrototyped, spFlags: 0)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !528)
!528 = !DISubprogram(name: "llroundl", scope: !335, file: !335, line: 343, type: !521, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !530)
!530 = !DISubprogram(name: "log1p", scope: !335, file: !335, line: 131, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !532)
!532 = !DISubprogram(name: "log1pf", scope: !335, file: !335, line: 131, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !534)
!534 = !DISubprogram(name: "log1pl", scope: !335, file: !335, line: 131, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !536)
!536 = !DISubprogram(name: "log2", scope: !335, file: !335, line: 144, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !538)
!538 = !DISubprogram(name: "log2f", scope: !335, file: !335, line: 144, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !540)
!540 = !DISubprogram(name: "log2l", scope: !335, file: !335, line: 144, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !542)
!542 = !DISubprogram(name: "logb", scope: !335, file: !335, line: 134, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !544)
!544 = !DISubprogram(name: "logbf", scope: !335, file: !335, line: 134, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !546)
!546 = !DISubprogram(name: "logbl", scope: !335, file: !335, line: 134, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !548)
!548 = !DISubprogram(name: "lrint", scope: !335, file: !335, line: 335, type: !549, flags: DIFlagPrototyped, spFlags: 0)
!549 = !DISubroutineType(types: !550)
!550 = !{!84, !106}
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !552)
!552 = !DISubprogram(name: "lrintf", scope: !335, file: !335, line: 335, type: !553, flags: DIFlagPrototyped, spFlags: 0)
!553 = !DISubroutineType(types: !554)
!554 = !{!84, !260}
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !556)
!556 = !DISubprogram(name: "lrintl", scope: !335, file: !335, line: 335, type: !557, flags: DIFlagPrototyped, spFlags: 0)
!557 = !DISubroutineType(types: !558)
!558 = !{!84, !265}
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !560)
!560 = !DISubprogram(name: "lround", scope: !335, file: !335, line: 341, type: !549, flags: DIFlagPrototyped, spFlags: 0)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !562)
!562 = !DISubprogram(name: "lroundf", scope: !335, file: !335, line: 341, type: !553, flags: DIFlagPrototyped, spFlags: 0)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !564)
!564 = !DISubprogram(name: "lroundl", scope: !335, file: !335, line: 341, type: !557, flags: DIFlagPrototyped, spFlags: 0)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !566)
!566 = !DISubprogram(name: "nan", scope: !335, file: !335, line: 228, type: !104, flags: DIFlagPrototyped, spFlags: 0)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !568)
!568 = !DISubprogram(name: "nanf", scope: !335, file: !335, line: 228, type: !569, flags: DIFlagPrototyped, spFlags: 0)
!569 = !DISubroutineType(types: !570)
!570 = !{!260, !107}
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !572)
!572 = !DISubprogram(name: "nanl", scope: !335, file: !335, line: 228, type: !573, flags: DIFlagPrototyped, spFlags: 0)
!573 = !DISubroutineType(types: !574)
!574 = !{!265, !107}
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !576)
!576 = !DISubprogram(name: "nearbyint", scope: !335, file: !335, line: 315, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !578)
!578 = !DISubprogram(name: "nearbyintf", scope: !335, file: !335, line: 315, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !580)
!580 = !DISubprogram(name: "nearbyintl", scope: !335, file: !335, line: 315, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !582)
!582 = !DISubprogram(name: "nextafter", scope: !335, file: !335, line: 292, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !584)
!584 = !DISubprogram(name: "nextafterf", scope: !335, file: !335, line: 292, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !586)
!586 = !DISubprogram(name: "nextafterl", scope: !335, file: !335, line: 292, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !588)
!588 = !DISubprogram(name: "nexttoward", scope: !335, file: !335, line: 294, type: !589, flags: DIFlagPrototyped, spFlags: 0)
!589 = !DISubroutineType(types: !590)
!590 = !{!106, !106, !265}
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !592)
!592 = !DISubprogram(name: "nexttowardf", scope: !335, file: !335, line: 294, type: !593, flags: DIFlagPrototyped, spFlags: 0)
!593 = !DISubroutineType(types: !594)
!594 = !{!260, !260, !265}
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !596)
!596 = !DISubprogram(name: "nexttowardl", scope: !335, file: !335, line: 294, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !598)
!598 = !DISubprogram(name: "remainder", scope: !335, file: !335, line: 298, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !600)
!600 = !DISubprogram(name: "remainderf", scope: !335, file: !335, line: 298, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !602)
!602 = !DISubprogram(name: "remainderl", scope: !335, file: !335, line: 298, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !604)
!604 = !DISubprogram(name: "remquo", scope: !335, file: !335, line: 328, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!605 = !DISubroutineType(types: !606)
!606 = !{!106, !106, !106, !364}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !608)
!608 = !DISubprogram(name: "remquof", scope: !335, file: !335, line: 328, type: !609, flags: DIFlagPrototyped, spFlags: 0)
!609 = !DISubroutineType(types: !610)
!610 = !{!260, !260, !260, !364}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !612)
!612 = !DISubprogram(name: "remquol", scope: !335, file: !335, line: 328, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!265, !265, !265, !364}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !616)
!616 = !DISubprogram(name: "rint", scope: !335, file: !335, line: 289, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !618)
!618 = !DISubprogram(name: "rintf", scope: !335, file: !335, line: 289, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !620)
!620 = !DISubprogram(name: "rintl", scope: !335, file: !335, line: 289, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !622)
!622 = !DISubprogram(name: "round", scope: !335, file: !335, line: 319, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !624)
!624 = !DISubprogram(name: "roundf", scope: !335, file: !335, line: 319, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !626)
!626 = !DISubprogram(name: "roundl", scope: !335, file: !335, line: 319, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !628)
!628 = !DISubprogram(name: "scalbln", scope: !335, file: !335, line: 311, type: !629, flags: DIFlagPrototyped, spFlags: 0)
!629 = !DISubroutineType(types: !630)
!630 = !{!106, !106, !84}
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !632)
!632 = !DISubprogram(name: "scalblnf", scope: !335, file: !335, line: 311, type: !633, flags: DIFlagPrototyped, spFlags: 0)
!633 = !DISubroutineType(types: !634)
!634 = !{!260, !260, !84}
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !636)
!636 = !DISubprogram(name: "scalblnl", scope: !335, file: !335, line: 311, type: !637, flags: DIFlagPrototyped, spFlags: 0)
!637 = !DISubroutineType(types: !638)
!638 = !{!265, !265, !84}
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !640)
!640 = !DISubprogram(name: "scalbn", scope: !335, file: !335, line: 302, type: !367, flags: DIFlagPrototyped, spFlags: 0)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !642)
!642 = !DISubprogram(name: "scalbnf", scope: !335, file: !335, line: 302, type: !643, flags: DIFlagPrototyped, spFlags: 0)
!643 = !DISubroutineType(types: !644)
!644 = !{!260, !260, !94}
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !646)
!646 = !DISubprogram(name: "scalbnl", scope: !335, file: !335, line: 302, type: !647, flags: DIFlagPrototyped, spFlags: 0)
!647 = !DISubroutineType(types: !648)
!648 = !{!265, !265, !94}
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !650)
!650 = !DISubprogram(name: "tgamma", scope: !335, file: !335, line: 268, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !652)
!652 = !DISubprogram(name: "tgammaf", scope: !335, file: !335, line: 268, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !654)
!654 = !DISubprogram(name: "tgammal", scope: !335, file: !335, line: 268, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !656)
!656 = !DISubprogram(name: "trunc", scope: !335, file: !335, line: 323, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !658)
!658 = !DISubprogram(name: "truncf", scope: !335, file: !335, line: 323, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !660)
!660 = !DISubprogram(name: "truncl", scope: !335, file: !335, line: 323, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !662)
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !663, line: 106, baseType: !664)
!663 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!664 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !663, line: 94, baseType: !665)
!665 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !663, line: 82, size: 64, elements: !666, identifier: "_ZTS11__mbstate_t")
!666 = !{!667, !668}
!667 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !665, file: !663, line: 84, baseType: !94, size: 32)
!668 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !665, file: !663, line: 93, baseType: !669, size: 32, offset: 32)
!669 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !665, file: !663, line: 85, size: 32, elements: !670, identifier: "_ZTSN11__mbstate_tUt_E")
!670 = !{!671, !672}
!671 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !669, file: !663, line: 88, baseType: !10, size: 32)
!672 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !669, file: !663, line: 92, baseType: !673, size: 32)
!673 = !DICompositeType(tag: DW_TAG_array_type, baseType: !109, size: 32, elements: !674)
!674 = !{!675}
!675 = !DISubrange(count: 4)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !677)
!677 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !124, line: 132, baseType: !10)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !679)
!679 = !DISubprogram(name: "btowc", scope: !663, file: !663, line: 356, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DISubroutineType(types: !681)
!681 = !{!677, !94}
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !683)
!683 = !DISubprogram(name: "fgetwc", scope: !663, file: !663, line: 748, type: !684, flags: DIFlagPrototyped, spFlags: 0)
!684 = !DISubroutineType(types: !685)
!685 = !{!677, !686}
!686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !687, size: 64)
!687 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !688, line: 64, baseType: !689)
!688 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!689 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !688, line: 44, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !691)
!691 = !DISubprogram(name: "fgetws", scope: !663, file: !663, line: 777, type: !692, flags: DIFlagPrototyped, spFlags: 0)
!692 = !DISubroutineType(types: !693)
!693 = !{!172, !171, !94, !694}
!694 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !686)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !696)
!696 = !DISubprogram(name: "fputwc", scope: !663, file: !663, line: 762, type: !697, flags: DIFlagPrototyped, spFlags: 0)
!697 = !DISubroutineType(types: !698)
!698 = !{!677, !173, !686}
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !700)
!700 = !DISubprogram(name: "fputws", scope: !663, file: !663, line: 784, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!701 = !DISubroutineType(types: !702)
!702 = !{!94, !218, !694}
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !704)
!704 = !DISubprogram(name: "fwide", scope: !663, file: !663, line: 590, type: !705, flags: DIFlagPrototyped, spFlags: 0)
!705 = !DISubroutineType(types: !706)
!706 = !{!94, !686, !94}
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !708)
!708 = !DISubprogram(name: "fwprintf", scope: !663, file: !663, line: 597, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!709 = !DISubroutineType(types: !710)
!710 = !{!94, !694, !218, null}
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !712)
!712 = !DISubprogram(name: "fwscanf", scope: !663, file: !663, line: 638, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !714)
!714 = !DISubprogram(name: "getwc", scope: !663, file: !663, line: 749, type: !684, flags: DIFlagPrototyped, spFlags: 0)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !716)
!716 = !DISubprogram(name: "getwchar", scope: !663, file: !663, line: 755, type: !717, flags: DIFlagPrototyped, spFlags: 0)
!717 = !DISubroutineType(types: !718)
!718 = !{!677}
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !720)
!720 = !DISubprogram(name: "mbrlen", scope: !663, file: !663, line: 379, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DISubroutineType(types: !722)
!722 = !{!123, !174, !123, !723}
!723 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !724)
!724 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !662, size: 64)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !726)
!726 = !DISubprogram(name: "mbrtowc", scope: !663, file: !663, line: 368, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DISubroutineType(types: !728)
!728 = !{!123, !171, !174, !123, !723}
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !730)
!730 = !DISubprogram(name: "mbsinit", scope: !663, file: !663, line: 364, type: !731, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DISubroutineType(types: !732)
!732 = !{!94, !733}
!733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !734, size: 64)
!734 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !662)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !736)
!736 = !DISubprogram(name: "mbsrtowcs", scope: !663, file: !663, line: 411, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!737 = !DISubroutineType(types: !738)
!738 = !{!123, !171, !739, !123, !723}
!739 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !740)
!740 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !742)
!742 = !DISubprogram(name: "putwc", scope: !663, file: !663, line: 763, type: !697, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !744)
!744 = !DISubprogram(name: "putwchar", scope: !663, file: !663, line: 769, type: !745, flags: DIFlagPrototyped, spFlags: 0)
!745 = !DISubroutineType(types: !746)
!746 = !{!677, !173}
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !748)
!748 = !DISubprogram(name: "swprintf", scope: !663, file: !663, line: 607, type: !749, flags: DIFlagPrototyped, spFlags: 0)
!749 = !DISubroutineType(types: !750)
!750 = !{!94, !171, !123, !218, null}
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !752)
!752 = !DISubprogram(name: "swscanf", scope: !663, file: !663, line: 648, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!753 = !DISubroutineType(types: !754)
!754 = !{!94, !218, !218, null}
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !756)
!756 = !DISubprogram(name: "ungetwc", scope: !663, file: !663, line: 792, type: !757, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DISubroutineType(types: !758)
!758 = !{!677, !677, !686}
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !760)
!760 = !DISubprogram(name: "vfwprintf", scope: !663, file: !663, line: 615, type: !761, flags: DIFlagPrototyped, spFlags: 0)
!761 = !DISubroutineType(types: !762)
!762 = !{!94, !694, !218, !763}
!763 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !764, size: 64)
!764 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !2, size: 192, elements: !765, identifier: "_ZTS13__va_list_tag")
!765 = !{!766, !767, !768, !769}
!766 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !764, file: !2, baseType: !10, size: 32)
!767 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !764, file: !2, baseType: !10, size: 32, offset: 32)
!768 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !764, file: !2, baseType: !122, size: 64, offset: 64)
!769 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !764, file: !2, baseType: !122, size: 64, offset: 128)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !771)
!771 = !DISubprogram(name: "vfwscanf", scope: !663, file: !663, line: 692, type: !761, flags: DIFlagPrototyped, spFlags: 0)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !773)
!773 = !DISubprogram(name: "vswprintf", scope: !663, file: !663, line: 628, type: !774, flags: DIFlagPrototyped, spFlags: 0)
!774 = !DISubroutineType(types: !775)
!775 = !{!94, !171, !123, !218, !763}
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !777)
!777 = !DISubprogram(name: "vswscanf", scope: !663, file: !663, line: 704, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!778 = !DISubroutineType(types: !779)
!779 = !{!94, !218, !218, !763}
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !781)
!781 = !DISubprogram(name: "vwprintf", scope: !663, file: !663, line: 623, type: !782, flags: DIFlagPrototyped, spFlags: 0)
!782 = !DISubroutineType(types: !783)
!783 = !{!94, !218, !763}
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !785)
!785 = !DISubprogram(name: "vwscanf", scope: !663, file: !663, line: 700, type: !782, flags: DIFlagPrototyped, spFlags: 0)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !787)
!787 = !DISubprogram(name: "wcrtomb", scope: !663, file: !663, line: 373, type: !788, flags: DIFlagPrototyped, spFlags: 0)
!788 = !DISubroutineType(types: !789)
!789 = !{!123, !217, !173, !723}
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !791)
!791 = !DISubprogram(name: "wcscat", scope: !663, file: !663, line: 157, type: !792, flags: DIFlagPrototyped, spFlags: 0)
!792 = !DISubroutineType(types: !793)
!793 = !{!172, !171, !218}
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !795)
!795 = !DISubprogram(name: "wcscmp", scope: !663, file: !663, line: 166, type: !796, flags: DIFlagPrototyped, spFlags: 0)
!796 = !DISubroutineType(types: !797)
!797 = !{!94, !219, !219}
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !799)
!799 = !DISubprogram(name: "wcscoll", scope: !663, file: !663, line: 195, type: !796, flags: DIFlagPrototyped, spFlags: 0)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !801)
!801 = !DISubprogram(name: "wcscpy", scope: !663, file: !663, line: 147, type: !792, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !803)
!803 = !DISubprogram(name: "wcscspn", scope: !663, file: !663, line: 255, type: !804, flags: DIFlagPrototyped, spFlags: 0)
!804 = !DISubroutineType(types: !805)
!805 = !{!123, !219, !219}
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !807)
!807 = !DISubprogram(name: "wcsftime", scope: !663, file: !663, line: 858, type: !808, flags: DIFlagPrototyped, spFlags: 0)
!808 = !DISubroutineType(types: !809)
!809 = !{!123, !171, !123, !218, !810}
!810 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !811)
!811 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !812, size: 64)
!812 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !813)
!813 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !663, line: 137, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !815)
!815 = !DISubprogram(name: "wcslen", scope: !663, file: !663, line: 290, type: !816, flags: DIFlagPrototyped, spFlags: 0)
!816 = !DISubroutineType(types: !817)
!817 = !{!123, !219}
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !819)
!819 = !DISubprogram(name: "wcsncat", scope: !663, file: !663, line: 161, type: !820, flags: DIFlagPrototyped, spFlags: 0)
!820 = !DISubroutineType(types: !821)
!821 = !{!172, !171, !218, !123}
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !823)
!823 = !DISubprogram(name: "wcsncmp", scope: !663, file: !663, line: 169, type: !824, flags: DIFlagPrototyped, spFlags: 0)
!824 = !DISubroutineType(types: !825)
!825 = !{!94, !219, !219, !123}
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !827)
!827 = !DISubprogram(name: "wcsncpy", scope: !663, file: !663, line: 152, type: !820, flags: DIFlagPrototyped, spFlags: 0)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !829)
!829 = !DISubprogram(name: "wcsrtombs", scope: !663, file: !663, line: 417, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!830 = !DISubroutineType(types: !831)
!831 = !{!123, !217, !832, !123, !723}
!832 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !833)
!833 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !835)
!835 = !DISubprogram(name: "wcsspn", scope: !663, file: !663, line: 259, type: !804, flags: DIFlagPrototyped, spFlags: 0)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !837)
!837 = !DISubprogram(name: "wcstod", scope: !663, file: !663, line: 453, type: !838, flags: DIFlagPrototyped, spFlags: 0)
!838 = !DISubroutineType(types: !839)
!839 = !{!106, !218, !840}
!840 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !841)
!841 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !843)
!843 = !DISubprogram(name: "wcstof", scope: !663, file: !663, line: 460, type: !844, flags: DIFlagPrototyped, spFlags: 0)
!844 = !DISubroutineType(types: !845)
!845 = !{!260, !218, !840}
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !847)
!847 = !DISubprogram(name: "wcstok", scope: !663, file: !663, line: 285, type: !848, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DISubroutineType(types: !849)
!849 = !{!172, !171, !218, !840}
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !851)
!851 = !DISubprogram(name: "wcstol", scope: !663, file: !663, line: 471, type: !852, flags: DIFlagPrototyped, spFlags: 0)
!852 = !DISubroutineType(types: !853)
!853 = !{!84, !218, !840, !94}
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !855)
!855 = !DISubprogram(name: "wcstoul", scope: !663, file: !663, line: 476, type: !856, flags: DIFlagPrototyped, spFlags: 0)
!856 = !DISubroutineType(types: !857)
!857 = !{!125, !218, !840, !94}
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !859)
!859 = !DISubprogram(name: "wcsxfrm", scope: !663, file: !663, line: 199, type: !860, flags: DIFlagPrototyped, spFlags: 0)
!860 = !DISubroutineType(types: !861)
!861 = !{!123, !171, !218, !123}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !863)
!863 = !DISubprogram(name: "wctob", scope: !663, file: !663, line: 360, type: !864, flags: DIFlagPrototyped, spFlags: 0)
!864 = !DISubroutineType(types: !865)
!865 = !{!94, !677}
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !867)
!867 = !DISubprogram(name: "wmemcmp", scope: !663, file: !663, line: 328, type: !824, flags: DIFlagPrototyped, spFlags: 0)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !869)
!869 = !DISubprogram(name: "wmemcpy", scope: !663, file: !663, line: 332, type: !820, flags: DIFlagPrototyped, spFlags: 0)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !871)
!871 = !DISubprogram(name: "wmemmove", scope: !663, file: !663, line: 337, type: !872, flags: DIFlagPrototyped, spFlags: 0)
!872 = !DISubroutineType(types: !873)
!873 = !{!172, !172, !219, !123}
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !875)
!875 = !DISubprogram(name: "wmemset", scope: !663, file: !663, line: 341, type: !876, flags: DIFlagPrototyped, spFlags: 0)
!876 = !DISubroutineType(types: !877)
!877 = !{!172, !172, !173, !123}
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !879)
!879 = !DISubprogram(name: "wprintf", scope: !663, file: !663, line: 604, type: !880, flags: DIFlagPrototyped, spFlags: 0)
!880 = !DISubroutineType(types: !881)
!881 = !{!94, !218, null}
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !883)
!883 = !DISubprogram(name: "wscanf", scope: !663, file: !663, line: 645, type: !880, flags: DIFlagPrototyped, spFlags: 0)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !885)
!885 = !DISubprogram(name: "wcschr", scope: !663, file: !663, line: 230, type: !886, flags: DIFlagPrototyped, spFlags: 0)
!886 = !DISubroutineType(types: !887)
!887 = !{!172, !219, !173}
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !889)
!889 = !DISubprogram(name: "wcspbrk", scope: !663, file: !663, line: 269, type: !890, flags: DIFlagPrototyped, spFlags: 0)
!890 = !DISubroutineType(types: !891)
!891 = !{!172, !219, !219}
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !893)
!893 = !DISubprogram(name: "wcsrchr", scope: !663, file: !663, line: 240, type: !886, flags: DIFlagPrototyped, spFlags: 0)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !895)
!895 = !DISubprogram(name: "wcsstr", scope: !663, file: !663, line: 280, type: !890, flags: DIFlagPrototyped, spFlags: 0)
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !897)
!897 = !DISubprogram(name: "wmemchr", scope: !663, file: !663, line: 323, type: !898, flags: DIFlagPrototyped, spFlags: 0)
!898 = !DISubroutineType(types: !899)
!899 = !{!172, !219, !173, !123}
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !901)
!901 = !DISubprogram(name: "wcstold", scope: !663, file: !663, line: 462, type: !902, flags: DIFlagPrototyped, spFlags: 0)
!902 = !DISubroutineType(types: !903)
!903 = !{!265, !218, !840}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !905)
!905 = !DISubprogram(name: "wcstoll", scope: !663, file: !663, line: 486, type: !906, flags: DIFlagPrototyped, spFlags: 0)
!906 = !DISubroutineType(types: !907)
!907 = !{!231, !218, !840, !94}
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !909)
!909 = !DISubprogram(name: "wcstoull", scope: !663, file: !663, line: 493, type: !910, flags: DIFlagPrototyped, spFlags: 0)
!910 = !DISubroutineType(types: !911)
!911 = !{!255, !218, !840, !94}
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !901)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !905)
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !909)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !916)
!916 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !917, line: 194, baseType: !918)
!917 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!918 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !920)
!920 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !917, line: 195, baseType: !921)
!921 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !923)
!923 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !917, line: 196, baseType: !94)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !925)
!925 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !917, line: 197, baseType: !84)
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !927)
!927 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !9, line: 245, baseType: !916)
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !929)
!929 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !9, line: 228, baseType: !920)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !931)
!931 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !9, line: 197, baseType: !923)
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !933)
!933 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !9, line: 123, baseType: !925)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !935)
!935 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !9, line: 243, baseType: !916)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !937)
!937 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !9, line: 226, baseType: !920)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !939)
!939 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !9, line: 195, baseType: !923)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !941)
!941 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !9, line: 121, baseType: !925)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !943)
!943 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !9, line: 276, baseType: !84)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !945)
!945 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !9, line: 263, baseType: !925)
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !62)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !28)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !8)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !950)
!950 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !9, line: 109, baseType: !125)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !952)
!952 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !9, line: 246, baseType: !62)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !954)
!954 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !9, line: 229, baseType: !28)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !956)
!956 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !9, line: 198, baseType: !8)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !958)
!958 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !9, line: 124, baseType: !950)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !960)
!960 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !9, line: 244, baseType: !62)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !962)
!962 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !9, line: 227, baseType: !28)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !964)
!964 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !9, line: 196, baseType: !8)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !966)
!966 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !9, line: 122, baseType: !950)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !968)
!968 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !9, line: 277, baseType: !125)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !970)
!970 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !9, line: 270, baseType: !950)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !972)
!972 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !74, file: !306, line: 196, baseType: !125)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !974)
!974 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !74, file: !306, line: 197, baseType: !84)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !976)
!976 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !977, line: 53, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!977 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !979)
!979 = !DISubprogram(name: "setlocale", scope: !977, file: !977, line: 124, type: !980, flags: DIFlagPrototyped, spFlags: 0)
!980 = !DISubroutineType(types: !981)
!981 = !{!150, !94, !107}
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !983)
!983 = !DISubprogram(name: "localeconv", scope: !977, file: !977, line: 127, type: !984, flags: DIFlagPrototyped, spFlags: 0)
!984 = !DISubroutineType(types: !985)
!985 = !{!986}
!986 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !976, size: 64)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !988)
!988 = !DISubprogram(name: "isalnum", scope: !989, file: !989, line: 110, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!989 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !991)
!991 = !DISubprogram(name: "isalpha", scope: !989, file: !989, line: 111, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !993)
!993 = !DISubprogram(name: "iscntrl", scope: !989, file: !989, line: 112, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !995)
!995 = !DISubprogram(name: "isdigit", scope: !989, file: !989, line: 113, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !997)
!997 = !DISubprogram(name: "isgraph", scope: !989, file: !989, line: 115, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !999)
!999 = !DISubprogram(name: "islower", scope: !989, file: !989, line: 114, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1001)
!1001 = !DISubprogram(name: "isprint", scope: !989, file: !989, line: 116, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1003)
!1003 = !DISubprogram(name: "ispunct", scope: !989, file: !989, line: 117, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1005)
!1005 = !DISubprogram(name: "isspace", scope: !989, file: !989, line: 118, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1007)
!1007 = !DISubprogram(name: "isupper", scope: !989, file: !989, line: 119, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1009)
!1009 = !DISubprogram(name: "isxdigit", scope: !989, file: !989, line: 120, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1011)
!1011 = !DISubprogram(name: "tolower", scope: !989, file: !989, line: 124, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1013)
!1013 = !DISubprogram(name: "toupper", scope: !989, file: !989, line: 127, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1015)
!1015 = !DISubprogram(name: "isblank", scope: !989, file: !989, line: 136, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1017)
!1017 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !688, line: 48, baseType: !689)
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1019)
!1019 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !688, line: 110, baseType: !1020)
!1020 = !DIDerivedType(tag: DW_TAG_typedef, name: "_G_fpos_t", file: !1021, line: 25, baseType: !1022)
!1021 = !DIFile(filename: "/usr/include/_G_config.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!1022 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1021, line: 21, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1024)
!1024 = !DISubprogram(name: "clearerr", scope: !688, file: !688, line: 826, type: !1025, flags: DIFlagPrototyped, spFlags: 0)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{null, !1027}
!1027 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1017, size: 64)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1029)
!1029 = !DISubprogram(name: "fclose", scope: !688, file: !688, line: 237, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!94, !1027}
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1033)
!1033 = !DISubprogram(name: "feof", scope: !688, file: !688, line: 828, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1035)
!1035 = !DISubprogram(name: "ferror", scope: !688, file: !688, line: 830, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1037)
!1037 = !DISubprogram(name: "fflush", scope: !688, file: !688, line: 242, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1039)
!1039 = !DISubprogram(name: "fgetc", scope: !688, file: !688, line: 531, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1041)
!1041 = !DISubprogram(name: "fgetpos", scope: !688, file: !688, line: 798, type: !1042, flags: DIFlagPrototyped, spFlags: 0)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!94, !1044, !1045}
!1044 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1027)
!1045 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1046)
!1046 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1019, size: 64)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1048)
!1048 = !DISubprogram(name: "fgets", scope: !688, file: !688, line: 622, type: !1049, flags: DIFlagPrototyped, spFlags: 0)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!150, !217, !94, !1044}
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1052)
!1052 = !DISubprogram(name: "fopen", scope: !688, file: !688, line: 272, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{!1027, !174, !174}
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1056)
!1056 = !DISubprogram(name: "fprintf", scope: !688, file: !688, line: 356, type: !1057, flags: DIFlagPrototyped, spFlags: 0)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{!94, !1044, !174, null}
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1060)
!1060 = !DISubprogram(name: "fputc", scope: !688, file: !688, line: 573, type: !1061, flags: DIFlagPrototyped, spFlags: 0)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!94, !94, !1027}
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1064)
!1064 = !DISubprogram(name: "fputs", scope: !688, file: !688, line: 689, type: !1065, flags: DIFlagPrototyped, spFlags: 0)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!94, !174, !1044}
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1068)
!1068 = !DISubprogram(name: "fread", scope: !688, file: !688, line: 709, type: !1069, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!123, !1071, !123, !123, !1044}
!1071 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !122)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1073)
!1073 = !DISubprogram(name: "freopen", scope: !688, file: !688, line: 278, type: !1074, flags: DIFlagPrototyped, spFlags: 0)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!1027, !174, !174, !1044}
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1077)
!1077 = !DISubprogram(name: "fscanf", scope: !688, file: !688, line: 425, type: !1057, flags: DIFlagPrototyped, spFlags: 0)
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1079)
!1079 = !DISubprogram(name: "fseek", scope: !688, file: !688, line: 749, type: !1080, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!94, !1027, !84, !94}
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1083)
!1083 = !DISubprogram(name: "fsetpos", scope: !688, file: !688, line: 803, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!94, !1027, !1086}
!1086 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1087, size: 64)
!1087 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1019)
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1089)
!1089 = !DISubprogram(name: "ftell", scope: !688, file: !688, line: 754, type: !1090, flags: DIFlagPrototyped, spFlags: 0)
!1090 = !DISubroutineType(types: !1091)
!1091 = !{!84, !1027}
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1093)
!1093 = !DISubprogram(name: "fwrite", scope: !688, file: !688, line: 715, type: !1094, flags: DIFlagPrototyped, spFlags: 0)
!1094 = !DISubroutineType(types: !1095)
!1095 = !{!123, !1096, !123, !123, !1044}
!1096 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !68)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1098)
!1098 = !DISubprogram(name: "getc", scope: !688, file: !688, line: 532, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1100)
!1100 = !DISubprogram(name: "getchar", scope: !688, file: !688, line: 538, type: !187, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1102)
!1102 = !DISubprogram(name: "gets", scope: !688, file: !688, line: 638, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!150, !150}
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1106)
!1106 = !DISubprogram(name: "perror", scope: !688, file: !688, line: 846, type: !1107, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{null, !107}
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1110)
!1110 = !DISubprogram(name: "printf", scope: !688, file: !688, line: 362, type: !1111, flags: DIFlagPrototyped, spFlags: 0)
!1111 = !DISubroutineType(types: !1112)
!1112 = !{!94, !174, null}
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1114)
!1114 = !DISubprogram(name: "putc", scope: !688, file: !688, line: 574, type: !1061, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1116)
!1116 = !DISubprogram(name: "putchar", scope: !688, file: !688, line: 580, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1118)
!1118 = !DISubprogram(name: "puts", scope: !688, file: !688, line: 695, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1120)
!1120 = !DISubprogram(name: "remove", scope: !688, file: !688, line: 178, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1122)
!1122 = !DISubprogram(name: "rename", scope: !688, file: !688, line: 180, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!94, !107, !107}
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1126)
!1126 = !DISubprogram(name: "rewind", scope: !688, file: !688, line: 759, type: !1025, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1128)
!1128 = !DISubprogram(name: "scanf", scope: !688, file: !688, line: 431, type: !1111, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1130)
!1130 = !DISubprogram(name: "setbuf", scope: !688, file: !688, line: 332, type: !1131, flags: DIFlagPrototyped, spFlags: 0)
!1131 = !DISubroutineType(types: !1132)
!1132 = !{null, !1044, !217}
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1134)
!1134 = !DISubprogram(name: "setvbuf", scope: !688, file: !688, line: 336, type: !1135, flags: DIFlagPrototyped, spFlags: 0)
!1135 = !DISubroutineType(types: !1136)
!1136 = !{!94, !1044, !217, !94, !123}
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1138)
!1138 = !DISubprogram(name: "sprintf", scope: !688, file: !688, line: 364, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!94, !217, !174, null}
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1142)
!1142 = !DISubprogram(name: "sscanf", scope: !688, file: !688, line: 433, type: !1143, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DISubroutineType(types: !1144)
!1144 = !{!94, !174, !174, null}
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1146)
!1146 = !DISubprogram(name: "tmpfile", scope: !688, file: !688, line: 195, type: !1147, flags: DIFlagPrototyped, spFlags: 0)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{!1027}
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1150)
!1150 = !DISubprogram(name: "tmpnam", scope: !688, file: !688, line: 209, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1152)
!1152 = !DISubprogram(name: "ungetc", scope: !688, file: !688, line: 702, type: !1061, flags: DIFlagPrototyped, spFlags: 0)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1154)
!1154 = !DISubprogram(name: "vfprintf", scope: !688, file: !688, line: 371, type: !1155, flags: DIFlagPrototyped, spFlags: 0)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!94, !1044, !174, !763}
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1158)
!1158 = !DISubprogram(name: "vprintf", scope: !688, file: !688, line: 377, type: !1159, flags: DIFlagPrototyped, spFlags: 0)
!1159 = !DISubroutineType(types: !1160)
!1160 = !{!94, !174, !763}
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1162)
!1162 = !DISubprogram(name: "vsprintf", scope: !688, file: !688, line: 379, type: !1163, flags: DIFlagPrototyped, spFlags: 0)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{!94, !217, !174, !763}
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !1166)
!1166 = !DISubprogram(name: "snprintf", scope: !688, file: !688, line: 386, type: !1167, flags: DIFlagPrototyped, spFlags: 0)
!1167 = !DISubroutineType(types: !1168)
!1168 = !{!94, !217, !123, !174, null}
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !1170)
!1170 = !DISubprogram(name: "vfscanf", scope: !688, file: !688, line: 471, type: !1155, flags: DIFlagPrototyped, spFlags: 0)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !1172)
!1172 = !DISubprogram(name: "vscanf", scope: !688, file: !688, line: 479, type: !1159, flags: DIFlagPrototyped, spFlags: 0)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !1174)
!1174 = !DISubprogram(name: "vsnprintf", scope: !688, file: !688, line: 390, type: !1175, flags: DIFlagPrototyped, spFlags: 0)
!1175 = !DISubroutineType(types: !1176)
!1176 = !{!94, !217, !123, !174, !763}
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !226, entity: !1178)
!1178 = !DISubprogram(name: "vsscanf", scope: !688, file: !688, line: 483, type: !1179, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DISubroutineType(types: !1180)
!1180 = !{!94, !174, !174, !763}
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1166)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1170)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1172)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1174)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1178)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1187)
!1187 = !DIDerivedType(tag: DW_TAG_typedef, name: "fenv_t", file: !1188, line: 94, baseType: !1189)
!1188 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/fenv.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!1189 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1188, line: 75, flags: DIFlagFwdDecl, identifier: "_ZTS6fenv_t")
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1191)
!1191 = !DIDerivedType(tag: DW_TAG_typedef, name: "fexcept_t", file: !1188, line: 68, baseType: !29)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1193)
!1193 = !DISubprogram(name: "feclearexcept", scope: !1194, file: !1194, line: 64, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1194 = !DIFile(filename: "/usr/include/fenv.h", directory: "/home/douze/remill/remill-build/remill/Arch/X86/Runtime")
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1196)
!1196 = !DISubprogram(name: "fegetexceptflag", scope: !1194, file: !1194, line: 68, type: !1197, flags: DIFlagPrototyped, spFlags: 0)
!1197 = !DISubroutineType(types: !1198)
!1198 = !{!94, !1199, !94}
!1199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1191, size: 64)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1201)
!1201 = !DISubprogram(name: "feraiseexcept", scope: !1194, file: !1194, line: 71, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1203)
!1203 = !DISubprogram(name: "fesetexceptflag", scope: !1194, file: !1194, line: 75, type: !1204, flags: DIFlagPrototyped, spFlags: 0)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{!94, !1206, !94}
!1206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1207, size: 64)
!1207 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1191)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1209)
!1209 = !DISubprogram(name: "fetestexcept", scope: !1194, file: !1194, line: 79, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1211)
!1211 = !DISubprogram(name: "fegetround", scope: !1194, file: !1194, line: 85, type: !187, flags: DIFlagPrototyped, spFlags: 0)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1213)
!1213 = !DISubprogram(name: "fesetround", scope: !1194, file: !1194, line: 88, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1215)
!1215 = !DISubprogram(name: "fegetenv", scope: !1194, file: !1194, line: 95, type: !1216, flags: DIFlagPrototyped, spFlags: 0)
!1216 = !DISubroutineType(types: !1217)
!1217 = !{!94, !1218}
!1218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1187, size: 64)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1220)
!1220 = !DISubprogram(name: "feholdexcept", scope: !1194, file: !1194, line: 100, type: !1216, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1222)
!1222 = !DISubprogram(name: "fesetenv", scope: !1194, file: !1194, line: 104, type: !1223, flags: DIFlagPrototyped, spFlags: 0)
!1223 = !DISubroutineType(types: !1224)
!1224 = !{!94, !1225}
!1225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1226, size: 64)
!1226 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1187)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1228)
!1228 = !DISubprogram(name: "feupdateenv", scope: !1194, file: !1194, line: 109, type: !1223, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !{i32 2, !"Dwarf Version", i32 4}
!1230 = !{i32 2, !"Debug Info Version", i32 3}
!1231 = !{!1232, !1233, i64 2065}
!1232 = !{!"_ZTS5State", !1233, i64 16, !1235, i64 2064, !1233, i64 2080, !1236, i64 2088, !1238, i64 2112, !1241, i64 2208, !1242, i64 2480, !1243, i64 2608, !1244, i64 2736, !1233, i64 2760, !1233, i64 2768, !1245, i64 3280}
!1233 = !{!"omnipotent char", !1234, i64 0}
!1234 = !{!"Simple C++ TBAA"}
!1235 = !{!"_ZTS10ArithFlags", !1233, i64 0, !1233, i64 1, !1233, i64 2, !1233, i64 3, !1233, i64 4, !1233, i64 5, !1233, i64 6, !1233, i64 7, !1233, i64 8, !1233, i64 9, !1233, i64 10, !1233, i64 11, !1233, i64 12, !1233, i64 13, !1233, i64 14, !1233, i64 15}
!1236 = !{!"_ZTS8Segments", !1237, i64 0, !1233, i64 2, !1237, i64 4, !1233, i64 6, !1237, i64 8, !1233, i64 10, !1237, i64 12, !1233, i64 14, !1237, i64 16, !1233, i64 18, !1237, i64 20, !1233, i64 22}
!1237 = !{!"short", !1233, i64 0}
!1238 = !{!"_ZTS12AddressSpace", !1239, i64 0, !1240, i64 8, !1239, i64 16, !1240, i64 24, !1239, i64 32, !1240, i64 40, !1239, i64 48, !1240, i64 56, !1239, i64 64, !1240, i64 72, !1239, i64 80, !1240, i64 88}
!1239 = !{!"long", !1233, i64 0}
!1240 = !{!"_ZTS3Reg", !1233, i64 0}
!1241 = !{!"_ZTS3GPR", !1239, i64 0, !1240, i64 8, !1239, i64 16, !1240, i64 24, !1239, i64 32, !1240, i64 40, !1239, i64 48, !1240, i64 56, !1239, i64 64, !1240, i64 72, !1239, i64 80, !1240, i64 88, !1239, i64 96, !1240, i64 104, !1239, i64 112, !1240, i64 120, !1239, i64 128, !1240, i64 136, !1239, i64 144, !1240, i64 152, !1239, i64 160, !1240, i64 168, !1239, i64 176, !1240, i64 184, !1239, i64 192, !1240, i64 200, !1239, i64 208, !1240, i64 216, !1239, i64 224, !1240, i64 232, !1239, i64 240, !1240, i64 248, !1239, i64 256, !1240, i64 264}
!1242 = !{!"_ZTS8X87Stack", !1233, i64 0}
!1243 = !{!"_ZTS3MMX", !1233, i64 0}
!1244 = !{!"_ZTS14FPUStatusFlags", !1233, i64 0, !1233, i64 1, !1233, i64 2, !1233, i64 3, !1233, i64 4, !1233, i64 5, !1233, i64 6, !1233, i64 7, !1233, i64 8, !1233, i64 9, !1233, i64 10, !1233, i64 11, !1233, i64 12, !1233, i64 13, !1233, i64 14, !1233, i64 15, !1233, i64 16, !1233, i64 17, !1233, i64 18, !1233, i64 19, !1233, i64 20}
!1245 = !{!"_ZTS13SegmentCaches", !1246, i64 0, !1246, i64 16, !1246, i64 32, !1246, i64 48, !1246, i64 64, !1246, i64 80}
!1246 = !{!"_ZTS13SegmentShadow", !1233, i64 0, !1247, i64 8, !1247, i64 12}
!1247 = !{!"int", !1233, i64 0}
!1248 = !{!1232, !1233, i64 2067}
!1249 = !{!1232, !1233, i64 2069}
!1250 = !{!1232, !1233, i64 2071}
!1251 = !{!1232, !1233, i64 2073}
!1252 = !{!1232, !1233, i64 2077}
!1253 = !{!1239, !1239, i64 0}
!1254 = !{!1255}
!1255 = distinct !{!1255, !1256, !"ext_601058___libc_start_main: argument 0"}
!1256 = distinct !{!1256, !"ext_601058___libc_start_main"}
!1257 = !{!1258}
!1258 = distinct !{!1258, !1256, !"ext_601058___libc_start_main: argument 1"}
!1259 = !{!1260}
!1260 = distinct !{!1260, !1261, !"ext_601068___gmon_start__: argument 0"}
!1261 = distinct !{!1261, !"ext_601068___gmon_start__"}
!1262 = !{!1263}
!1263 = distinct !{!1263, !1261, !"ext_601068___gmon_start__: argument 1"}
!1264 = !{!1265}
!1265 = distinct !{!1265, !1266, !"ext_400410_printf: argument 0"}
!1266 = distinct !{!1266, !"ext_400410_printf"}
!1267 = !{!1268}
!1268 = distinct !{!1268, !1266, !"ext_400410_printf: argument 1"}
!1269 = !{!1270}
!1270 = distinct !{!1270, !1271, !"ext_400410_printf: argument 0"}
!1271 = distinct !{!1271, !"ext_400410_printf"}
!1272 = !{!1273}
!1273 = distinct !{!1273, !1271, !"ext_400410_printf: argument 1"}
!1274 = !{!1275}
!1275 = distinct !{!1275, !1276, !"ext_400410_printf: argument 0"}
!1276 = distinct !{!1276, !"ext_400410_printf"}
!1277 = !{!1278}
!1278 = distinct !{!1278, !1276, !"ext_400410_printf: argument 1"}
!1279 = !{!1280}
!1280 = distinct !{!1280, !1281, !"ext_400410_printf: argument 0"}
!1281 = distinct !{!1281, !"ext_400410_printf"}
!1282 = !{!1283}
!1283 = distinct !{!1283, !1281, !"ext_400410_printf: argument 1"}
!1284 = !{!1285}
!1285 = distinct !{!1285, !1286, !"ext_400410_printf: argument 0"}
!1286 = distinct !{!1286, !"ext_400410_printf"}
!1287 = !{!1288}
!1288 = distinct !{!1288, !1286, !"ext_400410_printf: argument 1"}
!1289 = !{!1290}
!1290 = distinct !{!1290, !1291, !"ext_400430_atoi: argument 0"}
!1291 = distinct !{!1291, !"ext_400430_atoi"}
!1292 = !{!1293}
!1293 = distinct !{!1293, !1291, !"ext_400430_atoi: argument 1"}
!1294 = !{!1295}
!1295 = distinct !{!1295, !1296, !"ext_400410_printf: argument 0"}
!1296 = distinct !{!1296, !"ext_400410_printf"}
!1297 = !{!1298}
!1298 = distinct !{!1298, !1296, !"ext_400410_printf: argument 1"}
!1299 = !{!1300}
!1300 = distinct !{!1300, !1301, !"ext_400410_printf: argument 0"}
!1301 = distinct !{!1301, !"ext_400410_printf"}
!1302 = !{!1303}
!1303 = distinct !{!1303, !1301, !"ext_400410_printf: argument 1"}
!1304 = !{!1305}
!1305 = distinct !{!1305, !1306, !"ext_400410_printf: argument 0"}
!1306 = distinct !{!1306, !"ext_400410_printf"}
!1307 = !{!1308}
!1308 = distinct !{!1308, !1306, !"ext_400410_printf: argument 1"}
!1309 = !{!1310}
!1310 = distinct !{!1310, !1311, !"ext_400410_printf: argument 0"}
!1311 = distinct !{!1311, !"ext_400410_printf"}
!1312 = !{!1313}
!1313 = distinct !{!1313, !1311, !"ext_400410_printf: argument 1"}
!1314 = !{!1315}
!1315 = distinct !{!1315, !1316, !"ext_400410_printf: argument 0"}
!1316 = distinct !{!1316, !"ext_400410_printf"}
!1317 = !{!1318}
!1318 = distinct !{!1318, !1316, !"ext_400410_printf: argument 1"}
!1319 = !{!1320}
!1320 = distinct !{!1320, !1321, !"ext_400410_printf: argument 0"}
!1321 = distinct !{!1321, !"ext_400410_printf"}
!1322 = !{!1323}
!1323 = distinct !{!1323, !1321, !"ext_400410_printf: argument 1"}
!1324 = !{!1325}
!1325 = distinct !{!1325, !1326, !"ext_400410_printf: argument 0"}
!1326 = distinct !{!1326, !"ext_400410_printf"}
!1327 = !{!1328}
!1328 = distinct !{!1328, !1326, !"ext_400410_printf: argument 1"}
!1329 = !{!1330}
!1330 = distinct !{!1330, !1331, !"ext_400410_printf: argument 0"}
!1331 = distinct !{!1331, !"ext_400410_printf"}
!1332 = !{!1333}
!1333 = distinct !{!1333, !1331, !"ext_400410_printf: argument 1"}
!1334 = !{!1335}
!1335 = distinct !{!1335, !1336, !"ext_400410_printf: argument 0"}
!1336 = distinct !{!1336, !"ext_400410_printf"}
!1337 = !{!1338}
!1338 = distinct !{!1338, !1336, !"ext_400410_printf: argument 1"}
!1339 = !{!1340}
!1340 = distinct !{!1340, !1341, !"ext_400410_printf: argument 0"}
!1341 = distinct !{!1341, !"ext_400410_printf"}
!1342 = !{!1343}
!1343 = distinct !{!1343, !1341, !"ext_400410_printf: argument 1"}
!1344 = !{!1345}
!1345 = distinct !{!1345, !1346, !"ext_400410_printf: argument 0"}
!1346 = distinct !{!1346, !"ext_400410_printf"}
!1347 = !{!1348}
!1348 = distinct !{!1348, !1346, !"ext_400410_printf: argument 1"}
!1349 = !{!1350}
!1350 = distinct !{!1350, !1351, !"ext_400410_printf: argument 0"}
!1351 = distinct !{!1351, !"ext_400410_printf"}
!1352 = !{!1353}
!1353 = distinct !{!1353, !1351, !"ext_400410_printf: argument 1"}
!1354 = !{!1355}
!1355 = distinct !{!1355, !1356, !"ext_400410_printf: argument 0"}
!1356 = distinct !{!1356, !"ext_400410_printf"}
!1357 = !{!1358}
!1358 = distinct !{!1358, !1356, !"ext_400410_printf: argument 1"}
!1359 = !{!1360}
!1360 = distinct !{!1360, !1361, !"ext_400410_printf: argument 0"}
!1361 = distinct !{!1361, !"ext_400410_printf"}
!1362 = !{!1363}
!1363 = distinct !{!1363, !1361, !"ext_400410_printf: argument 1"}
!1364 = !{!1365}
!1365 = distinct !{!1365, !1366, !"ext_400410_printf: argument 0"}
!1366 = distinct !{!1366, !"ext_400410_printf"}
!1367 = !{!1368}
!1368 = distinct !{!1368, !1366, !"ext_400410_printf: argument 1"}
!1369 = !{!1370}
!1370 = distinct !{!1370, !1371, !"ext_400410_printf: argument 0"}
!1371 = distinct !{!1371, !"ext_400410_printf"}
!1372 = !{!1373}
!1373 = distinct !{!1373, !1371, !"ext_400410_printf: argument 1"}
!1374 = !{!1233, !1233, i64 0}
