; ModuleID = 'pthread.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu-elf"

%union.anon = type { i64 }
%seg_400cb0__rodata_type = type <{ [4 x i8], [23 x i8], [23 x i8], [16 x i8], [35 x i8], [63 x i8], [33 x i8], [16 x i8] }>
%seg_601e08__init_array_type = type <{ i64, i64 }>
%seg_601ff8__got_type = type <{ i64 }>
%seg_602000__got_plt_type = type <{ [24 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }>
%seg_602088__bss_type = type <{ [8 x i8], [8 x i8], [40 x i8], [48 x i8], [8 x i8] }>
%tls_data1_type = type <{ [4 x i8] }>
%tls_data2_type = type <{ [12 x i8] }>
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
@stdout = external global i64, align 8
@seg_400cb0__rodata = internal constant %seg_400cb0__rodata_type <{ [4 x i8] c"\01\00\02\00", [23 x i8] c"bar(), tls data=%d %d\0A\00", [23 x i8] c"foo(), tls data=%d %d\0A\00", [16 x i8] c"Create threads\0A\00", [35 x i8] c"Failed with %d at pthread_create()\00", [63 x i8] c"Wait for the threads to complete, and release their resources\0A\00", [33 x i8] c"Failed with %d at pthread_join()\00", [16 x i8] c"Main completed\0A\00" }>
@seg_601e08__init_array = internal global %seg_601e08__init_array_type <{ i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_400940_frame_dummy to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_400910___do_global_dtors_aux to i64) }>
@seg_601ff8__got = internal global %seg_601ff8__got_type <{ i64 ptrtoint (i64 ()* @__gmon_start__ to i64) }>
@seg_602000__got_plt = internal global %seg_602000__got_plt_type <{ [24 x i8] c"\18\1E`\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i64 ptrtoint (i64 (i64, i64, i64, i64)* @pthread_create to i64), i64 ptrtoint (i64 (i64, i64)* @pthread_cond_wait to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @printf to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @__libc_start_main to i64), i64 ptrtoint (i64 (i64)* @pthread_cond_signal to i64), i64 ptrtoint (i64 (i64, i64)* @pthread_cond_init to i64), i64 ptrtoint (i64 (i64)* @pthread_mutex_unlock to i64), i64 ptrtoint (i64 (i64)* @fflush to i64), i64 ptrtoint (i64 (i64, i64)* @pthread_join to i64), i64 ptrtoint (i64 (i64)* @exit to i64), i64 ptrtoint (i64 (i64, i64)* @pthread_mutex_init to i64), i64 ptrtoint (i64 (i64)* @pthread_mutex_lock to i64) }>
@seg_602088__bss = internal global %seg_602088__bss_type zeroinitializer
@tls_data1 = thread_local local_unnamed_addr constant %tls_data1_type zeroinitializer
@tls_data2 = thread_local local_unnamed_addr constant %tls_data2_type <{ [12 x i8] c"\00\00\00\00\10!`\00\00\00\00\00" }>
@__mcsema_reg_state = internal thread_local global %struct.State zeroinitializer
@__mcsema_stack = internal thread_local global [131072 x i64] zeroinitializer
@__mcsema_tls = internal thread_local global [512 x i64] zeroinitializer
@0 = internal global i1 false
@llvm.global_dtors = appending constant [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 101, void ()* @__mcsema_destructor, i8* null }]
@llvm.global_ctors = appending constant [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 101, void ()* @__mcsema_constructor, i8* null }]

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: noduplicate noinline nounwind optnone
define %struct.Memory* @__remill_error(%struct.State* dereferenceable(3376), i64, %struct.Memory*) local_unnamed_addr #1 {
  call void @llvm.trap()
  unreachable
}

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @pthread_cond_init(i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @exit(i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @pthread_join(i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @__gmon_start__() #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @pthread_mutex_init(i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @pthread_create(i64, i64, i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @__libc_start_main(i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @printf(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @pthread_mutex_unlock(i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @pthread_cond_wait(i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @pthread_mutex_lock(i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @fflush(i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @pthread_cond_signal(i64) #2

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400940_frame_dummy(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_400940:
  %3 = add i64 %1, -112
  %4 = tail call %struct.Memory* @sub_4008d0_register_tm_clones(%struct.State* nonnull %0, i64 %3, %struct.Memory* %2)
  ret %struct.Memory* %4
}

; Function Attrs: noinline
define %struct.Memory* @sub_400950_bar(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400950:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 5, i32 7, i32 0, i32 0
  %10 = load i64, i64* %8, align 8
  %11 = load i64, i64* %7, align 8, !tbaa !1231
  %12 = add i64 %11, -8
  %13 = inttoptr i64 %12 to i64*
  store i64 %10, i64* %13
  %14 = add i64 %11, -24
  %15 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %17 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %18 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %19 = lshr i64 %14, 63
  %20 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %21 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 4), i64* %6, align 8, !tbaa !1231
  %22 = load i64, i64* %9, align 8
  %23 = add i64 %22, -8
  %24 = inttoptr i64 %23 to i32*
  %25 = load i32, i32* %24
  %26 = zext i32 %25 to i64
  store i64 %26, i64* %5, align 8, !tbaa !1231
  %27 = add i64 %22, -4
  %28 = inttoptr i64 %27 to i32*
  %29 = load i32, i32* %28
  %30 = zext i32 %29 to i64
  store i64 %30, i64* %4, align 8, !tbaa !1231
  %31 = add i64 %1, 41
  %32 = add i64 %11, -32
  %33 = inttoptr i64 %32 to i64*
  store i64 %31, i64* %33
  %34 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %35 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %36 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %37 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %38 = load i64, i64* %35, align 8, !alias.scope !1235, !noalias !1238
  %39 = load i64, i64* %36, align 8, !alias.scope !1235, !noalias !1238
  %40 = load i64, i64* %37, align 8, !alias.scope !1235, !noalias !1238
  %41 = inttoptr i64 %14 to i64*
  %42 = load i64, i64* %41
  %43 = add i64 %11, -16
  %44 = inttoptr i64 %43 to i64*
  %45 = load i64, i64* %44
  %46 = add i64 %11, -8
  %47 = inttoptr i64 %46 to i64*
  %48 = load i64, i64* %47
  %49 = inttoptr i64 %11 to i64*
  %50 = load i64, i64* %49
  %51 = add i64 %11, 8
  %52 = inttoptr i64 %51 to i64*
  %53 = load i64, i64* %52
  %54 = add i64 %11, 16
  %55 = inttoptr i64 %54 to i64*
  %56 = load i64, i64* %55
  %57 = add i64 %11, 24
  %58 = inttoptr i64 %57 to i64*
  %59 = load i64, i64* %58
  %60 = add i64 %11, 32
  %61 = inttoptr i64 %60 to i64*
  %62 = load i64, i64* %61
  %63 = add i64 %11, 40
  %64 = inttoptr i64 %63 to i64*
  %65 = load i64, i64* %64
  %66 = add i64 %11, 48
  %67 = inttoptr i64 %66 to i64*
  %68 = load i64, i64* %67
  %69 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 4), i64 %26, i64 %30, i64 %38, i64 %39, i64 %40, i64 %42, i64 %45, i64 %48, i64 %50, i64 %53, i64 %56, i64 %59, i64 %62, i64 %65, i64 %68), !noalias !1235
  store i64 %69, i64* %34, align 8, !alias.scope !1235, !noalias !1238
  %70 = add i64 %11, -12
  %71 = trunc i64 %69 to i32
  %72 = inttoptr i64 %70 to i32*
  store i32 %71, i32* %72
  %73 = add i64 %11, -8
  %74 = icmp ugt i64 %14, -17
  %75 = zext i1 %74 to i8
  store i8 %75, i8* %15, align 1, !tbaa !1240
  %76 = trunc i64 %73 to i32
  %77 = and i32 %76, 255
  %78 = tail call i32 @llvm.ctpop.i32(i32 %77) #9
  %79 = trunc i32 %78 to i8
  %80 = and i8 %79, 1
  %81 = xor i8 %80, 1
  store i8 %81, i8* %16, align 1, !tbaa !1254
  %82 = xor i64 %14, 16
  %83 = xor i64 %82, %73
  %84 = lshr i64 %83, 4
  %85 = trunc i64 %84 to i8
  %86 = and i8 %85, 1
  store i8 %86, i8* %17, align 1, !tbaa !1255
  %87 = icmp eq i64 %73, 0
  %88 = zext i1 %87 to i8
  store i8 %88, i8* %18, align 1, !tbaa !1256
  %89 = lshr i64 %73, 63
  %90 = trunc i64 %89 to i8
  store i8 %90, i8* %20, align 1, !tbaa !1257
  %91 = xor i64 %89, %19
  %92 = add nuw nsw i64 %91, %89
  %93 = icmp eq i64 %92, 2
  %94 = zext i1 %93 to i8
  store i8 %94, i8* %21, align 1, !tbaa !1258
  %95 = inttoptr i64 %73 to i64*
  %96 = load i64, i64* %95
  store i64 %96, i64* %8, align 8, !tbaa !1231
  %97 = inttoptr i64 %11 to i64*
  %98 = load i64, i64* %97
  store i64 %98, i64* %3, align 8, !tbaa !1231
  %99 = add i64 %11, 8
  store i64 %99, i64* %7, align 8, !tbaa !1231
  ret %struct.Memory* %2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400ca0___libc_csu_fini(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #3 {
block_400ca0:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !1231
  %6 = inttoptr i64 %5 to i64*
  %7 = load i64, i64* %6
  store i64 %7, i64* %3, align 8, !tbaa !1231
  %8 = add i64 %5, 8
  store i64 %8, i64* %4, align 8, !tbaa !1231
  ret %struct.Memory* %2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400768__init_proc(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400768:
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
  %14 = load i64, i64* getelementptr inbounds (%seg_601ff8__got_type, %seg_601ff8__got_type* @seg_601ff8__got, i32 0, i32 0)
  store i64 %14, i64* %4, align 8, !tbaa !1231
  store i8 0, i8* %8, align 1, !tbaa !1240
  %15 = trunc i64 %14 to i32
  %16 = and i32 %15, 255
  %17 = tail call i32 @llvm.ctpop.i32(i32 %16) #9
  %18 = trunc i32 %17 to i8
  %19 = and i8 %18, 1
  %20 = xor i8 %19, 1
  store i8 %20, i8* %9, align 1, !tbaa !1254
  %21 = icmp eq i64 %14, 0
  %22 = zext i1 %21 to i8
  store i8 %22, i8* %11, align 1, !tbaa !1256
  %23 = lshr i64 %14, 63
  %24 = trunc i64 %23 to i8
  store i8 %24, i8* %12, align 1, !tbaa !1257
  store i8 0, i8* %13, align 1, !tbaa !1258
  store i8 0, i8* %10, align 1, !tbaa !1255
  %25 = select i1 %21, i64 21, i64 16
  %26 = add i64 %25, %1
  br i1 %21, label %block_40077d, label %block_400778

block_40077d:                                     ; preds = %block_400778, %block_400768
  %27 = phi i64 [ %7, %block_400768 ], [ %59, %block_400778 ]
  %28 = phi %struct.Memory* [ %2, %block_400768 ], [ %58, %block_400778 ]
  %29 = add i64 %27, 8
  %30 = icmp ugt i64 %27, -9
  %31 = zext i1 %30 to i8
  store i8 %31, i8* %8, align 1, !tbaa !1240
  %32 = trunc i64 %29 to i32
  %33 = and i32 %32, 255
  %34 = tail call i32 @llvm.ctpop.i32(i32 %33) #9
  %35 = trunc i32 %34 to i8
  %36 = and i8 %35, 1
  %37 = xor i8 %36, 1
  store i8 %37, i8* %9, align 1, !tbaa !1254
  %38 = xor i64 %29, %27
  %39 = lshr i64 %38, 4
  %40 = trunc i64 %39 to i8
  %41 = and i8 %40, 1
  store i8 %41, i8* %10, align 1, !tbaa !1255
  %42 = icmp eq i64 %29, 0
  %43 = zext i1 %42 to i8
  store i8 %43, i8* %11, align 1, !tbaa !1256
  %44 = lshr i64 %29, 63
  %45 = trunc i64 %44 to i8
  store i8 %45, i8* %12, align 1, !tbaa !1257
  %46 = lshr i64 %27, 63
  %47 = xor i64 %44, %46
  %48 = add nuw nsw i64 %47, %44
  %49 = icmp eq i64 %48, 2
  %50 = zext i1 %49 to i8
  store i8 %50, i8* %13, align 1, !tbaa !1258
  %51 = inttoptr i64 %29 to i64*
  %52 = load i64, i64* %51
  store i64 %52, i64* %3, align 8, !tbaa !1231
  %53 = add i64 %27, 16
  store i64 %53, i64* %5, align 8, !tbaa !1231
  ret %struct.Memory* %28

block_400778:                                     ; preds = %block_400768
  %54 = add i64 %26, 232
  %55 = add i64 %26, 5
  %56 = add i64 %6, -16
  %57 = inttoptr i64 %56 to i64*
  store i64 %55, i64* %57
  store i64 %56, i64* %5, align 8, !tbaa !1231
  %58 = tail call %struct.Memory* @sub_400860(%struct.State* nonnull %0, i64 %54, %struct.Memory* %2)
  %59 = load i64, i64* %5, align 8
  br label %block_40077d
}

; Function Attrs: noinline
define %struct.Memory* @sub_400860(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #4 {
block_400860:
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

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4008a0_deregister_tm_clones(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_4008a0:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  store i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64* %4, align 8, !tbaa !1231
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  store i8 zext (i1 icmp ult (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)) to i8), i8* %5, align 1, !tbaa !1240
  %6 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)) to i32), i32 255)) #9
  %7 = trunc i32 %6 to i8
  %8 = and i8 %7, 1
  %9 = xor i8 %8, 1
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  store i8 %9, i8* %10, align 1, !tbaa !1254
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  store i8 and (i8 trunc (i64 lshr (i64 xor (i64 xor (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64))), i64 4) to i8), i8 1), i8* %11, align 1, !tbaa !1255
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  store i8 zext (i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 0) to i8), i8* %12, align 1, !tbaa !1256
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  store i8 trunc (i64 lshr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 63) to i8), i8* %13, align 1, !tbaa !1257
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i8 zext (i1 icmp eq (i64 add (i64 xor (i64 lshr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 63), i64 lshr (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 63)), i64 xor (i64 lshr (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 63), i64 lshr (i64 ptrtoint (i64* @stdout to i64), i64 63))), i64 2) to i8), i8* %14, align 1, !tbaa !1258
  br i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 0), label %block_4008c0, label %block_4008ad

block_4008ad:                                     ; preds = %block_4008a0
  store i64 0, i64* %4, align 8, !tbaa !1231
  store i8 0, i8* %5, align 1, !tbaa !1240
  store i8 1, i8* %10, align 1, !tbaa !1254
  store i8 1, i8* %12, align 1, !tbaa !1256
  store i8 0, i8* %13, align 1, !tbaa !1257
  store i8 0, i8* %14, align 1, !tbaa !1258
  store i8 0, i8* %11, align 1, !tbaa !1255
  br label %block_4008c0

block_4008c0:                                     ; preds = %block_4008ad, %block_4008a0
  %15 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %16 = load i64, i64* %15, align 8, !tbaa !1231
  %17 = inttoptr i64 %16 to i64*
  %18 = load i64, i64* %17
  store i64 %18, i64* %3, align 8, !tbaa !1231
  %19 = add i64 %16, 8
  store i64 %19, i64* %15, align 8, !tbaa !1231
  ret %struct.Memory* %2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400c30___libc_csu_init(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400c30:
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
  %19 = load i64, i64* %12, align 8, !tbaa !1231
  %20 = add i64 %19, -8
  %21 = inttoptr i64 %20 to i64*
  store i64 %18, i64* %21
  %22 = load i64, i64* %16, align 8
  %23 = add i64 %19, -16
  %24 = inttoptr i64 %23 to i64*
  store i64 %22, i64* %24
  %25 = load i32, i32* %5, align 4
  %26 = zext i32 %25 to i64
  store i64 %26, i64* %17, align 8, !tbaa !1231
  %27 = load i64, i64* %15, align 8
  %28 = add i64 %19, -24
  %29 = inttoptr i64 %28 to i64*
  store i64 %27, i64* %29
  %30 = load i64, i64* %14, align 8
  %31 = add i64 %19, -32
  %32 = inttoptr i64 %31 to i64*
  store i64 %30, i64* %32
  store i64 ptrtoint (%seg_601e08__init_array_type* @seg_601e08__init_array to i64), i64* %14, align 8, !tbaa !1231
  %33 = load i64, i64* %13, align 8
  %34 = add i64 %19, -40
  %35 = inttoptr i64 %34 to i64*
  store i64 %33, i64* %35
  %36 = load i64, i64* %8, align 8
  %37 = add i64 %19, -48
  %38 = inttoptr i64 %37 to i64*
  store i64 %36, i64* %38
  %39 = load i64, i64* %10, align 8
  store i64 %39, i64* %16, align 8, !tbaa !1231
  %40 = load i64, i64* %9, align 8
  store i64 %40, i64* %15, align 8, !tbaa !1231
  %41 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %42 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %43 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %44 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %45 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %46 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i64 ashr (i64 sub (i64 add (i64 ptrtoint (%seg_601e08__init_array_type* @seg_601e08__init_array to i64), i64 8), i64 ptrtoint (%seg_601e08__init_array_type* @seg_601e08__init_array to i64)), i64 3), i64* %13, align 8, !tbaa !1231
  %47 = add i64 %1, -1224
  %48 = add i64 %1, 49
  %49 = add i64 %19, -64
  %50 = inttoptr i64 %49 to i64*
  store i64 %48, i64* %50
  store i64 %49, i64* %12, align 8, !tbaa !1231
  %51 = tail call %struct.Memory* @sub_400768__init_proc(%struct.State* nonnull %0, i64 %47, %struct.Memory* %2)
  %52 = load i64, i64* %13, align 8
  %53 = load i64, i64* %3, align 8
  %54 = icmp eq i64 %52, 0
  %55 = select i1 %54, i64 37, i64 5
  %56 = add i64 %53, %55
  br i1 %54, label %block_400c86, label %block_400c66

block_400c66:                                     ; preds = %block_400c30
  store i64 0, i64* %8, align 8, !tbaa !1231
  store i8 0, i8* %41, align 1, !tbaa !1240
  store i8 1, i8* %42, align 1, !tbaa !1254
  store i8 1, i8* %44, align 1, !tbaa !1256
  store i8 0, i8* %45, align 1, !tbaa !1257
  store i8 0, i8* %46, align 1, !tbaa !1258
  store i8 0, i8* %43, align 1, !tbaa !1255
  %57 = add i64 %56, 10
  br label %block_400c70

block_400c70:                                     ; preds = %block_400c70, %block_400c66
  %58 = phi i64 [ 0, %block_400c66 ], [ %77, %block_400c70 ]
  %59 = phi i64 [ %57, %block_400c66 ], [ %105, %block_400c70 ]
  %60 = phi %struct.Memory* [ %51, %block_400c66 ], [ %74, %block_400c70 ]
  %61 = load i64, i64* %15, align 8
  store i64 %61, i64* %9, align 8, !tbaa !1231
  %62 = load i64, i64* %16, align 8
  store i64 %62, i64* %10, align 8, !tbaa !1231
  %63 = load i32, i32* %7, align 4
  %64 = zext i32 %63 to i64
  store i64 %64, i64* %11, align 8, !tbaa !1231
  %65 = load i64, i64* %14, align 8
  %66 = shl i64 %58, 3
  %67 = add i64 %66, %65
  %68 = add i64 %59, 13
  %69 = load i64, i64* %12, align 8, !tbaa !1231
  %70 = add i64 %69, -8
  %71 = inttoptr i64 %70 to i64*
  store i64 %68, i64* %71
  store i64 %70, i64* %12, align 8, !tbaa !1231
  %72 = inttoptr i64 %67 to i64*
  %73 = load i64, i64* %72
  store i64 %73, i64* %3, align 8, !tbaa !1231
  %74 = tail call %struct.Memory* @__mcsema_detach_call_value(%struct.State* nonnull %0, i64 %73, %struct.Memory* %60)
  %75 = load i64, i64* %8, align 8
  %76 = load i64, i64* %3, align 8
  %77 = add i64 %75, 1
  store i64 %77, i64* %8, align 8, !tbaa !1231
  %78 = lshr i64 %77, 63
  %79 = load i64, i64* %13, align 8
  %80 = sub i64 %77, %79
  %81 = icmp ult i64 %77, %79
  %82 = zext i1 %81 to i8
  store i8 %82, i8* %41, align 1, !tbaa !1240
  %83 = trunc i64 %80 to i32
  %84 = and i32 %83, 255
  %85 = tail call i32 @llvm.ctpop.i32(i32 %84) #9
  %86 = trunc i32 %85 to i8
  %87 = and i8 %86, 1
  %88 = xor i8 %87, 1
  store i8 %88, i8* %42, align 1, !tbaa !1254
  %89 = xor i64 %79, %77
  %90 = xor i64 %89, %80
  %91 = lshr i64 %90, 4
  %92 = trunc i64 %91 to i8
  %93 = and i8 %92, 1
  store i8 %93, i8* %43, align 1, !tbaa !1255
  %94 = icmp eq i64 %80, 0
  %95 = zext i1 %94 to i8
  store i8 %95, i8* %44, align 1, !tbaa !1256
  %96 = lshr i64 %80, 63
  %97 = trunc i64 %96 to i8
  store i8 %97, i8* %45, align 1, !tbaa !1257
  %98 = lshr i64 %79, 63
  %99 = xor i64 %98, %78
  %100 = xor i64 %96, %78
  %101 = add nuw nsw i64 %100, %99
  %102 = icmp eq i64 %101, 2
  %103 = zext i1 %102 to i8
  store i8 %103, i8* %46, align 1, !tbaa !1258
  %104 = select i1 %94, i64 9, i64 -13
  %105 = add i64 %76, %104
  br i1 %94, label %block_400c86.loopexit, label %block_400c70

block_400c86.loopexit:                            ; preds = %block_400c70
  br label %block_400c86

block_400c86:                                     ; preds = %block_400c86.loopexit, %block_400c30
  %106 = phi %struct.Memory* [ %51, %block_400c30 ], [ %74, %block_400c86.loopexit ]
  %107 = load i64, i64* %12, align 8
  %108 = add i64 %107, 8
  %109 = icmp ugt i64 %107, -9
  %110 = zext i1 %109 to i8
  store i8 %110, i8* %41, align 1, !tbaa !1240
  %111 = trunc i64 %108 to i32
  %112 = and i32 %111, 255
  %113 = tail call i32 @llvm.ctpop.i32(i32 %112) #9
  %114 = trunc i32 %113 to i8
  %115 = and i8 %114, 1
  %116 = xor i8 %115, 1
  store i8 %116, i8* %42, align 1, !tbaa !1254
  %117 = xor i64 %108, %107
  %118 = lshr i64 %117, 4
  %119 = trunc i64 %118 to i8
  %120 = and i8 %119, 1
  store i8 %120, i8* %43, align 1, !tbaa !1255
  %121 = icmp eq i64 %108, 0
  %122 = zext i1 %121 to i8
  store i8 %122, i8* %44, align 1, !tbaa !1256
  %123 = lshr i64 %108, 63
  %124 = trunc i64 %123 to i8
  store i8 %124, i8* %45, align 1, !tbaa !1257
  %125 = lshr i64 %107, 63
  %126 = xor i64 %123, %125
  %127 = add nuw nsw i64 %126, %123
  %128 = icmp eq i64 %127, 2
  %129 = zext i1 %128 to i8
  store i8 %129, i8* %46, align 1, !tbaa !1258
  %130 = add i64 %107, 16
  %131 = inttoptr i64 %108 to i64*
  %132 = load i64, i64* %131
  store i64 %132, i64* %8, align 8, !tbaa !1231
  %133 = add i64 %107, 24
  %134 = inttoptr i64 %130 to i64*
  %135 = load i64, i64* %134
  store i64 %135, i64* %13, align 8, !tbaa !1231
  %136 = add i64 %107, 32
  %137 = inttoptr i64 %133 to i64*
  %138 = load i64, i64* %137
  store i64 %138, i64* %14, align 8, !tbaa !1231
  %139 = add i64 %107, 40
  %140 = inttoptr i64 %136 to i64*
  %141 = load i64, i64* %140
  store i64 %141, i64* %15, align 8, !tbaa !1231
  %142 = add i64 %107, 48
  %143 = inttoptr i64 %139 to i64*
  %144 = load i64, i64* %143
  store i64 %144, i64* %16, align 8, !tbaa !1231
  %145 = add i64 %107, 56
  %146 = inttoptr i64 %142 to i64*
  %147 = load i64, i64* %146
  store i64 %147, i64* %17, align 8, !tbaa !1231
  %148 = inttoptr i64 %145 to i64*
  %149 = load i64, i64* %148
  store i64 %149, i64* %3, align 8, !tbaa !1231
  %150 = add i64 %107, 64
  store i64 %150, i64* %12, align 8, !tbaa !1231
  ret %struct.Memory* %106
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400790(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_400790:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_602000__got_plt_type* @seg_602000__got_plt to i64), i64 8) to i64*)
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %6 = load i64, i64* %5, align 8, !tbaa !1231
  %7 = add i64 %6, -8
  %8 = inttoptr i64 %7 to i64*
  store i64 %4, i64* %8
  store i64 %7, i64* %5, align 8, !tbaa !1231
  %9 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_602000__got_plt_type* @seg_602000__got_plt to i64), i64 16) to i64*)
  store i64 %9, i64* %3, align 8, !tbaa !1231
  %10 = icmp eq i64 %9, 4196252
  br i1 %10, label %block_40079c, label %12

block_40079c:                                     ; preds = %block_400790
  store i64 4196256, i64* %3, align 8
  %11 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull %0, i64 4196256, %struct.Memory* %2)
  ret %struct.Memory* %11

; <label>:12:                                     ; preds = %block_400790
  %13 = tail call %struct.Memory* @__mcsema_detach_call_value(%struct.State* nonnull %0, i64 %9, %struct.Memory* %2)
  ret %struct.Memory* %13
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400910___do_global_dtors_aux(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_400910:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %5 = load i8, i8* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 8) to i8*)
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  store i8 0, i8* %6, align 1, !tbaa !1240
  %7 = zext i8 %5 to i32
  %8 = tail call i32 @llvm.ctpop.i32(i32 %7) #9
  %9 = trunc i32 %8 to i8
  %10 = and i8 %9, 1
  %11 = xor i8 %10, 1
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  store i8 %11, i8* %12, align 1, !tbaa !1254
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  store i8 0, i8* %13, align 1, !tbaa !1255
  %14 = icmp eq i8 %5, 0
  %15 = zext i1 %14 to i8
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  store i8 %15, i8* %16, align 1, !tbaa !1256
  %17 = lshr i8 %5, 7
  %18 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  store i8 %17, i8* %18, align 1, !tbaa !1257
  %19 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i8 0, i8* %19, align 1, !tbaa !1258
  %20 = select i1 %14, i64 9, i64 32
  %21 = add i64 %20, %1
  %22 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  br i1 %14, label %block_400919, label %block_400930

block_400930:                                     ; preds = %block_400910
  %23 = load i64, i64* %22, align 8, !tbaa !1231
  %24 = inttoptr i64 %23 to i64*
  %25 = load i64, i64* %24
  store i64 %25, i64* %3, align 8, !tbaa !1231
  %26 = add i64 %23, 8
  store i64 %26, i64* %22, align 8, !tbaa !1231
  ret %struct.Memory* %2

block_400919:                                     ; preds = %block_400910
  %27 = load i64, i64* %4, align 8
  %28 = load i64, i64* %22, align 8, !tbaa !1231
  %29 = add i64 %28, -8
  %30 = inttoptr i64 %29 to i64*
  store i64 %27, i64* %30
  store i64 %29, i64* %4, align 8, !tbaa !1231
  %31 = add i64 %21, -121
  %32 = add i64 %21, 9
  %33 = add i64 %28, -16
  %34 = inttoptr i64 %33 to i64*
  store i64 %32, i64* %34
  store i64 %33, i64* %22, align 8, !tbaa !1231
  %35 = tail call %struct.Memory* @sub_4008a0_deregister_tm_clones(%struct.State* nonnull %0, i64 %31, %struct.Memory* %2)
  store i8 1, i8* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 8) to i8*)
  %36 = load i64, i64* %22, align 8, !tbaa !1231
  %37 = add i64 %36, 8
  %38 = inttoptr i64 %36 to i64*
  %39 = load i64, i64* %38
  store i64 %39, i64* %4, align 8, !tbaa !1231
  %40 = inttoptr i64 %37 to i64*
  %41 = load i64, i64* %40
  store i64 %41, i64* %3, align 8, !tbaa !1231
  %42 = add i64 %36, 16
  store i64 %42, i64* %22, align 8, !tbaa !1231
  ret %struct.Memory* %35
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400ca4__term_proc(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #3 {
block_400ca4:
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
  store i8 %24, i8* %7, align 1, !tbaa !1240
  %25 = trunc i64 %5 to i32
  %26 = and i32 %25, 255
  %27 = tail call i32 @llvm.ctpop.i32(i32 %26) #9
  %28 = trunc i32 %27 to i8
  %29 = and i8 %28, 1
  %30 = xor i8 %29, 1
  store i8 %30, i8* %8, align 1, !tbaa !1254
  store i8 %12, i8* %13, align 1, !tbaa !1255
  %31 = icmp eq i64 %5, 0
  %32 = zext i1 %31 to i8
  store i8 %32, i8* %14, align 1, !tbaa !1256
  %33 = trunc i64 %17 to i8
  store i8 %33, i8* %16, align 1, !tbaa !1257
  store i8 %21, i8* %22, align 1, !tbaa !1258
  %34 = inttoptr i64 %5 to i64*
  %35 = load i64, i64* %34
  store i64 %35, i64* %3, align 8, !tbaa !1231
  %36 = add i64 %5, 8
  store i64 %36, i64* %4, align 8, !tbaa !1231
  ret %struct.Memory* %2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400990_foo(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400990:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 5, i32 7, i32 0, i32 0
  %7 = load i64, i64* %5, align 8
  %8 = load i64, i64* %4, align 8, !tbaa !1231
  %9 = add i64 %8, -8
  %10 = inttoptr i64 %9 to i64*
  store i64 %7, i64* %10
  store i64 %9, i64* %5, align 8, !tbaa !1231
  %11 = add i64 %8, -24
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %15 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %17 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  %18 = load i64, i64* %6, align 8
  %19 = add i64 %18, -8
  %20 = inttoptr i64 %19 to i32*
  %21 = load i32, i32* %20
  %22 = zext i32 %21 to i64
  %23 = add i64 %18, -4
  %24 = inttoptr i64 %23 to i32*
  %25 = load i32, i32* %24
  %26 = zext i32 %25 to i64
  %27 = add i64 %1, 41
  %28 = add i64 %8, -32
  %29 = inttoptr i64 %28 to i64*
  store i64 %27, i64* %29
  %30 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %31 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %32 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %33 = load i64, i64* %30, align 8, !alias.scope !1264, !noalias !1267
  %34 = load i64, i64* %31, align 8, !alias.scope !1264, !noalias !1267
  %35 = load i64, i64* %32, align 8, !alias.scope !1264, !noalias !1267
  %36 = inttoptr i64 %11 to i64*
  %37 = load i64, i64* %36
  %38 = add i64 %8, -16
  %39 = inttoptr i64 %38 to i64*
  %40 = load i64, i64* %39
  %41 = add i64 %8, -8
  %42 = inttoptr i64 %41 to i64*
  %43 = load i64, i64* %42
  %44 = inttoptr i64 %8 to i64*
  %45 = load i64, i64* %44
  %46 = add i64 %8, 8
  %47 = inttoptr i64 %46 to i64*
  %48 = load i64, i64* %47
  %49 = add i64 %8, 16
  %50 = inttoptr i64 %49 to i64*
  %51 = load i64, i64* %50
  %52 = add i64 %8, 24
  %53 = inttoptr i64 %52 to i64*
  %54 = load i64, i64* %53
  %55 = add i64 %8, 32
  %56 = inttoptr i64 %55 to i64*
  %57 = load i64, i64* %56
  %58 = add i64 %8, 40
  %59 = inttoptr i64 %58 to i64*
  %60 = load i64, i64* %59
  %61 = add i64 %8, 48
  %62 = inttoptr i64 %61 to i64*
  %63 = load i64, i64* %62
  %64 = inttoptr i64 %28 to i64*
  %65 = load i64, i64* %64
  %66 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 27), i64 %22, i64 %26, i64 %33, i64 %34, i64 %35, i64 %37, i64 %40, i64 %43, i64 %45, i64 %48, i64 %51, i64 %54, i64 %57, i64 %60, i64 %63), !noalias !1264
  %67 = add i64 %8, -12
  %68 = trunc i64 %66 to i32
  %69 = inttoptr i64 %67 to i32*
  store i32 %68, i32* %69
  %70 = add i64 %65, -105
  %71 = add i64 %65, 8
  %72 = inttoptr i64 %28 to i64*
  store i64 %71, i64* %72
  store i64 %28, i64* %4, align 8, !tbaa !1231
  %73 = tail call %struct.Memory* @sub_400950_bar(%struct.State* nonnull %0, i64 %70, %struct.Memory* %2)
  %74 = load i64, i64* %4, align 8
  %75 = add i64 %74, 16
  %76 = icmp ugt i64 %74, -17
  %77 = zext i1 %76 to i8
  store i8 %77, i8* %12, align 1, !tbaa !1240
  %78 = trunc i64 %75 to i32
  %79 = and i32 %78, 255
  %80 = tail call i32 @llvm.ctpop.i32(i32 %79) #9
  %81 = trunc i32 %80 to i8
  %82 = and i8 %81, 1
  %83 = xor i8 %82, 1
  store i8 %83, i8* %13, align 1, !tbaa !1254
  %84 = xor i64 %74, 16
  %85 = xor i64 %84, %75
  %86 = lshr i64 %85, 4
  %87 = trunc i64 %86 to i8
  %88 = and i8 %87, 1
  store i8 %88, i8* %14, align 1, !tbaa !1255
  %89 = icmp eq i64 %75, 0
  %90 = zext i1 %89 to i8
  store i8 %90, i8* %15, align 1, !tbaa !1256
  %91 = lshr i64 %75, 63
  %92 = trunc i64 %91 to i8
  store i8 %92, i8* %16, align 1, !tbaa !1257
  %93 = lshr i64 %74, 63
  %94 = xor i64 %91, %93
  %95 = add nuw nsw i64 %94, %91
  %96 = icmp eq i64 %95, 2
  %97 = zext i1 %96 to i8
  store i8 %97, i8* %17, align 1, !tbaa !1258
  %98 = add i64 %74, 24
  %99 = inttoptr i64 %75 to i64*
  %100 = load i64, i64* %99
  store i64 %100, i64* %5, align 8, !tbaa !1231
  %101 = inttoptr i64 %98 to i64*
  %102 = load i64, i64* %101
  store i64 %102, i64* %3, align 8, !tbaa !1231
  %103 = add i64 %74, 32
  store i64 %103, i64* %4, align 8, !tbaa !1231
  ret %struct.Memory* %73
}

; Function Attrs: noinline
define %struct.Memory* @sub_4009d0_theThread(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_4009d0:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 5, i32 7, i32 0, i32 0
  %11 = load i64, i64* %9, align 8
  %12 = load i64, i64* %8, align 8, !tbaa !1231
  %13 = add i64 %12, -8
  %14 = inttoptr i64 %13 to i64*
  store i64 %11, i64* %14
  store i64 %13, i64* %9, align 8, !tbaa !1231
  %15 = add i64 %12, -56
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %17 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %18 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %19 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %20 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %21 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  %22 = add i64 %12, -16
  %23 = load i64, i64* %7, align 8
  %24 = inttoptr i64 %22 to i64*
  store i64 %23, i64* %24
  %25 = add i64 %12, -32
  %26 = inttoptr i64 %25 to i64*
  store i64 zext (i32 trunc (i64 and (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16), i64 4294967295) to i32) to i64), i64* %26
  %27 = add i64 %1, 28
  %28 = add i64 %12, -64
  %29 = inttoptr i64 %28 to i64*
  store i64 %27, i64* %29
  %30 = inttoptr i64 %28 to i64*
  %31 = load i64, i64* %30
  store i64 %31, i64* %3, align 8, !alias.scope !1269, !noalias !1272
  store i64 %15, i64* %8, align 8, !alias.scope !1269, !noalias !1272
  %32 = tail call i64 @pthread_mutex_lock(i64 zext (i32 trunc (i64 and (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16), i64 4294967295) to i32) to i64)), !noalias !1269
  %33 = load i64, i64* %3, align 8
  %34 = load i64, i64* %9, align 8
  %35 = add i64 %34, -24
  %36 = inttoptr i64 %35 to i64*
  %37 = load i64, i64* %36
  %38 = add i64 %34, -28
  %39 = trunc i64 %32 to i32
  %40 = inttoptr i64 %38 to i32*
  store i32 %39, i32* %40
  %41 = add i64 %33, 19
  %42 = load i64, i64* %8, align 8, !tbaa !1231
  %43 = add i64 %42, -8
  %44 = inttoptr i64 %43 to i64*
  store i64 %41, i64* %44
  %45 = inttoptr i64 %43 to i64*
  %46 = load i64, i64* %45
  store i64 %46, i64* %3, align 8, !alias.scope !1274, !noalias !1277
  store i64 %42, i64* %8, align 8, !alias.scope !1274, !noalias !1277
  %47 = tail call i64 @pthread_cond_wait(i64 zext (i32 trunc (i64 and (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 56), i64 4294967295) to i32) to i64), i64 %37), !noalias !1274
  %48 = load i64, i64* %3, align 8
  %49 = load i32, i32* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 104) to i32*)
  %50 = add i32 %49, 1
  store i32 %50, i32* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 104) to i32*)
  %51 = load i64, i64* %9, align 8
  %52 = add i64 %51, -8
  %53 = inttoptr i64 %52 to i64*
  %54 = load i64, i64* %53
  %55 = add i64 %51, -16
  %56 = inttoptr i64 %55 to i64*
  store i64 %54, i64* %56
  %57 = inttoptr i64 %55 to i64*
  %58 = load i64, i64* %57
  %59 = inttoptr i64 %58 to i32*
  %60 = load i32, i32* %59
  %61 = load i64, i64* %10, align 8
  %62 = add i64 %61, -8
  %63 = inttoptr i64 %62 to i32*
  store i32 %60, i32* %63
  %64 = inttoptr i64 %55 to i64*
  %65 = load i64, i64* %64
  %66 = add i64 %65, 4
  %67 = inttoptr i64 %66 to i32*
  %68 = load i32, i32* %67
  %69 = zext i32 %68 to i64
  store i64 %69, i64* %5, align 8, !tbaa !1231
  %70 = add i64 %61, -4
  %71 = inttoptr i64 %70 to i32*
  store i32 %68, i32* %71
  %72 = add i64 %51, -32
  %73 = trunc i64 %47 to i32
  %74 = inttoptr i64 %72 to i32*
  store i32 %73, i32* %74
  %75 = add i64 %48, -111
  %76 = add i64 %48, 59
  %77 = load i64, i64* %8, align 8, !tbaa !1231
  %78 = add i64 %77, -8
  %79 = inttoptr i64 %78 to i64*
  store i64 %76, i64* %79
  store i64 %78, i64* %8, align 8, !tbaa !1231
  %80 = tail call %struct.Memory* @sub_400990_foo(%struct.State* nonnull %0, i64 %75, %struct.Memory* %2)
  %81 = load i64, i64* %3, align 8
  store i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16), i64* %7, align 8, !tbaa !1231
  %82 = add i64 %81, 15
  %83 = load i64, i64* %8, align 8, !tbaa !1231
  %84 = add i64 %83, -8
  %85 = inttoptr i64 %84 to i64*
  store i64 %82, i64* %85
  store i64 %83, i64* %8, align 8, !alias.scope !1279, !noalias !1282
  %86 = tail call i64 @pthread_mutex_unlock(i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16)), !noalias !1279
  store i64 0, i64* %5, align 8, !tbaa !1231
  store i64 0, i64* %6, align 8, !tbaa !1231
  %87 = load i64, i64* %9, align 8
  %88 = add i64 %87, -36
  %89 = trunc i64 %86 to i32
  %90 = inttoptr i64 %88 to i32*
  store i32 %89, i32* %90
  store i64 0, i64* %4, align 8, !tbaa !1231
  %91 = load i64, i64* %8, align 8
  %92 = add i64 %91, 48
  %93 = icmp ugt i64 %91, -49
  %94 = zext i1 %93 to i8
  store i8 %94, i8* %16, align 1, !tbaa !1240
  %95 = trunc i64 %92 to i32
  %96 = and i32 %95, 255
  %97 = tail call i32 @llvm.ctpop.i32(i32 %96) #9
  %98 = trunc i32 %97 to i8
  %99 = and i8 %98, 1
  %100 = xor i8 %99, 1
  store i8 %100, i8* %17, align 1, !tbaa !1254
  %101 = xor i64 %91, 16
  %102 = xor i64 %101, %92
  %103 = lshr i64 %102, 4
  %104 = trunc i64 %103 to i8
  %105 = and i8 %104, 1
  store i8 %105, i8* %18, align 1, !tbaa !1255
  %106 = icmp eq i64 %92, 0
  %107 = zext i1 %106 to i8
  store i8 %107, i8* %19, align 1, !tbaa !1256
  %108 = lshr i64 %92, 63
  %109 = trunc i64 %108 to i8
  store i8 %109, i8* %20, align 1, !tbaa !1257
  %110 = lshr i64 %91, 63
  %111 = xor i64 %108, %110
  %112 = add nuw nsw i64 %111, %108
  %113 = icmp eq i64 %112, 2
  %114 = zext i1 %113 to i8
  store i8 %114, i8* %21, align 1, !tbaa !1258
  %115 = add i64 %91, 56
  %116 = inttoptr i64 %92 to i64*
  %117 = load i64, i64* %116
  store i64 %117, i64* %9, align 8, !tbaa !1231
  %118 = inttoptr i64 %115 to i64*
  %119 = load i64, i64* %118
  store i64 %119, i64* %3, align 8, !tbaa !1231
  %120 = add i64 %91, 64
  store i64 %120, i64* %8, align 8, !tbaa !1231
  ret %struct.Memory* %80
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4008d0_register_tm_clones(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #3 {
block_4008d0:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %11 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  store i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64* %4, align 8, !tbaa !1231
  store i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1), i64* %5, align 8, !tbaa !1231
  store i8 and (i8 trunc (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)) to i8), i8 1), i8* %6, align 1, !tbaa !1284
  %12 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1) to i32), i32 255)) #9
  %13 = trunc i32 %12 to i8
  %14 = and i8 %13, 1
  %15 = xor i8 %14, 1
  store i8 %15, i8* %7, align 1, !tbaa !1284
  store i8 0, i8* %8, align 1, !tbaa !1284
  store i8 zext (i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1), i64 0) to i8), i8* %9, align 1, !tbaa !1284
  store i8 trunc (i64 lshr (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1), i64 63) to i8), i8* %10, align 1, !tbaa !1284
  store i8 0, i8* %11, align 1, !tbaa !1284
  br i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1), i64 0), label %block_400900, label %block_4008ef

block_4008ef:                                     ; preds = %block_4008d0
  store i64 0, i64* %4, align 8, !tbaa !1231
  store i8 0, i8* %6, align 1, !tbaa !1240
  store i8 1, i8* %7, align 1, !tbaa !1254
  store i8 1, i8* %9, align 1, !tbaa !1256
  store i8 0, i8* %10, align 1, !tbaa !1257
  store i8 0, i8* %11, align 1, !tbaa !1258
  store i8 0, i8* %8, align 1, !tbaa !1255
  br label %block_400900

block_400900:                                     ; preds = %block_4008ef, %block_4008d0
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %17 = load i64, i64* %16, align 8, !tbaa !1231
  %18 = inttoptr i64 %17 to i64*
  %19 = load i64, i64* %18
  store i64 %19, i64* %3, align 8, !tbaa !1231
  %20 = add i64 %17, 8
  store i64 %20, i64* %16, align 8, !tbaa !1231
  ret %struct.Memory* %2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400870__start(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400870:
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
  store i64 0, i64* %10, align 8, !tbaa !1231
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %15 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %16 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %17 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  %18 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %19 = load i64, i64* %6, align 8
  store i64 %19, i64* %12, align 8, !tbaa !1231
  %20 = load i64, i64* %9, align 8, !tbaa !1231
  %21 = add i64 %20, 8
  %22 = inttoptr i64 %20 to i64*
  %23 = load i64, i64* %22
  store i64 %23, i64* %7, align 8, !tbaa !1231
  store i64 %21, i64* %6, align 8, !tbaa !1231
  %24 = and i64 %21, -16
  store i8 0, i8* %13, align 1, !tbaa !1240
  %25 = trunc i64 %21 to i32
  %26 = and i32 %25, 240
  %27 = tail call i32 @llvm.ctpop.i32(i32 %26) #9
  %28 = trunc i32 %27 to i8
  %29 = and i8 %28, 1
  %30 = xor i8 %29, 1
  store i8 %30, i8* %14, align 1, !tbaa !1254
  %31 = icmp eq i64 %24, 0
  %32 = zext i1 %31 to i8
  store i8 %32, i8* %15, align 1, !tbaa !1256
  %33 = lshr i64 %21, 63
  %34 = trunc i64 %33 to i8
  store i8 %34, i8* %16, align 1, !tbaa !1257
  store i8 0, i8* %17, align 1, !tbaa !1258
  store i8 0, i8* %18, align 1, !tbaa !1255
  %35 = load i64, i64* %4, align 8
  %36 = add i64 %24, -8
  %37 = inttoptr i64 %36 to i64*
  store i64 %35, i64* %37
  %38 = add i64 %24, -16
  %39 = inttoptr i64 %38 to i64*
  store i64 %36, i64* %39
  store i64 ptrtoint (i64 ()* @callback_sub_400ca0___libc_csu_fini to i64), i64* %11, align 8, !tbaa !1231
  store i64 ptrtoint (i64 ()* @callback_sub_400c30___libc_csu_init to i64), i64* %5, align 8, !tbaa !1231
  store i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64* %8, align 8, !tbaa !1231
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
  store i64 %38, i64* %9, align 8, !alias.scope !1285, !noalias !1288
  %50 = tail call i64 @__libc_start_main(i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64 %23, i64 %21, i64 ptrtoint (i64 ()* @callback_sub_400c30___libc_csu_init to i64), i64 ptrtoint (i64 ()* @callback_sub_400ca0___libc_csu_fini to i64), i64 %19, i64 %44, i64 %47), !noalias !1285
  store i64 %50, i64* %4, align 8, !alias.scope !1285, !noalias !1288
  %51 = add i64 %49, 1
  store i64 %51, i64* %3, align 8
  %52 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull %0, i64 %51, %struct.Memory* %2)
  ret %struct.Memory* %52
}

; Function Attrs: noinline
define %struct.Memory* @sub_400a60_main(%struct.State* noalias dereferenceable(3376), i64, %struct.Memory* noalias) local_unnamed_addr #4 {
block_400a60:
  %3 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0
  %6 = bitcast %union.anon* %5 to i32*
  %7 = getelementptr inbounds %union.anon, %union.anon* %4, i64 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %11 = getelementptr inbounds %union.anon, %union.anon* %5, i64 0, i32 0
  %12 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %13 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 15, i32 0, i32 0
  %14 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 17, i32 0, i32 0
  %15 = load i64, i64* %13, align 8
  %16 = load i64, i64* %12, align 8, !tbaa !1231
  %17 = add i64 %16, -8
  %18 = inttoptr i64 %17 to i64*
  store i64 %15, i64* %18
  store i64 %17, i64* %13, align 8, !tbaa !1231
  %19 = add i64 %16, -120
  %20 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 1
  %21 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 3
  %22 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 5
  %23 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 7
  %24 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 9
  %25 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 2, i32 13
  %26 = add i64 %16, -12
  %27 = inttoptr i64 %26 to i32*
  store i32 0, i32* %27
  %28 = add i64 %16, -16
  %29 = load i32, i32* %6, align 4
  %30 = inttoptr i64 %28 to i32*
  store i32 %29, i32* %30
  %31 = add i64 %16, -24
  %32 = load i64, i64* %10, align 8
  %33 = inttoptr i64 %31 to i64*
  store i64 %32, i64* %33
  %34 = add i64 %16, -28
  %35 = inttoptr i64 %34 to i32*
  store i32 0, i32* %35
  %36 = add i64 %1, 49
  %37 = add i64 %16, -128
  %38 = inttoptr i64 %37 to i64*
  store i64 %36, i64* %38
  %39 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %40 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %41 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 19, i32 0, i32 0
  %42 = load i64, i64* %9, align 8, !alias.scope !1290, !noalias !1293
  %43 = load i64, i64* %40, align 8, !alias.scope !1290, !noalias !1293
  %44 = load i64, i64* %14, align 8, !alias.scope !1290, !noalias !1293
  %45 = load i64, i64* %41, align 8, !alias.scope !1290, !noalias !1293
  %46 = inttoptr i64 %19 to i64*
  %47 = load i64, i64* %46
  %48 = add i64 %16, -112
  %49 = inttoptr i64 %48 to i64*
  %50 = load i64, i64* %49
  %51 = add i64 %16, -104
  %52 = inttoptr i64 %51 to i64*
  %53 = load i64, i64* %52
  %54 = add i64 %16, -96
  %55 = inttoptr i64 %54 to i64*
  %56 = load i64, i64* %55
  %57 = add i64 %16, -88
  %58 = inttoptr i64 %57 to i64*
  %59 = load i64, i64* %58
  %60 = add i64 %16, -80
  %61 = inttoptr i64 %60 to i64*
  %62 = load i64, i64* %61
  %63 = add i64 %16, -72
  %64 = inttoptr i64 %63 to i64*
  %65 = load i64, i64* %64
  %66 = add i64 %16, -64
  %67 = inttoptr i64 %66 to i64*
  %68 = load i64, i64* %67
  %69 = add i64 %16, -56
  %70 = inttoptr i64 %69 to i64*
  %71 = load i64, i64* %70
  %72 = add i64 %16, -48
  %73 = inttoptr i64 %72 to i64*
  %74 = load i64, i64* %73
  %75 = inttoptr i64 %37 to i64*
  %76 = load i64, i64* %75
  store i64 %76, i64* %3, align 8, !alias.scope !1290, !noalias !1293
  store i64 %19, i64* %12, align 8, !alias.scope !1290, !noalias !1293
  %77 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 50), i64 %32, i64 %42, i64 %43, i64 %44, i64 %45, i64 %47, i64 %50, i64 %53, i64 %56, i64 %59, i64 %62, i64 %65, i64 %68, i64 %71, i64 %74), !noalias !1290
  %78 = load i64, i64* %3, align 8
  %79 = load i64, i64* %13, align 8
  %80 = add i64 %79, -68
  %81 = trunc i64 %77 to i32
  %82 = inttoptr i64 %80 to i32*
  store i32 %81, i32* %82
  %83 = add i64 %78, 22
  %84 = load i64, i64* %12, align 8, !tbaa !1231
  %85 = add i64 %84, -8
  %86 = inttoptr i64 %85 to i64*
  store i64 %83, i64* %86
  %87 = inttoptr i64 %85 to i64*
  %88 = load i64, i64* %87
  store i64 %88, i64* %3, align 8, !alias.scope !1295, !noalias !1298
  store i64 %84, i64* %12, align 8, !alias.scope !1295, !noalias !1298
  %89 = tail call i64 @pthread_mutex_init(i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16), i64 0), !noalias !1295
  %90 = load i64, i64* %3, align 8
  store i64 0, i64* %8, align 8, !tbaa !1231
  store i64 0, i64* %10, align 8, !tbaa !1231
  %91 = load i64, i64* %13, align 8
  %92 = add i64 %91, -72
  %93 = trunc i64 %89 to i32
  %94 = inttoptr i64 %92 to i32*
  store i32 %93, i32* %94
  %95 = add i64 %90, 22
  %96 = load i64, i64* %12, align 8, !tbaa !1231
  %97 = add i64 %96, -8
  %98 = inttoptr i64 %97 to i64*
  store i64 %95, i64* %98
  %99 = inttoptr i64 %97 to i64*
  %100 = load i64, i64* %99
  store i64 %100, i64* %3, align 8, !alias.scope !1300, !noalias !1303
  store i64 %96, i64* %12, align 8, !alias.scope !1300, !noalias !1303
  %101 = tail call i64 @pthread_cond_init(i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 56), i64 0), !noalias !1300
  %102 = load i64, i64* %13, align 8
  %103 = add i64 %102, -24
  %104 = load i64, i64* %3, align 8
  %105 = inttoptr i64 %103 to i32*
  store i32 0, i32* %105
  %106 = add i64 %102, -76
  %107 = trunc i64 %101 to i32
  %108 = add i64 %104, 10
  %109 = inttoptr i64 %106 to i32*
  store i32 %107, i32* %109
  br label %block_400ac7

block_400bda:                                     ; preds = %block_400bbb
  %110 = zext i32 %244 to i64
  store i64 %110, i64* %10, align 8, !tbaa !1231
  %111 = add i64 %255, 20
  %112 = load i64, i64* %12, align 8, !tbaa !1231
  %113 = add i64 %112, -8
  %114 = inttoptr i64 %113 to i64*
  store i64 %111, i64* %114
  %115 = load i64, i64* %9, align 8, !alias.scope !1305, !noalias !1308
  %116 = load i64, i64* %40, align 8, !alias.scope !1305, !noalias !1308
  %117 = load i64, i64* %14, align 8, !alias.scope !1305, !noalias !1308
  %118 = load i64, i64* %41, align 8, !alias.scope !1305, !noalias !1308
  %119 = inttoptr i64 %112 to i64*
  %120 = load i64, i64* %119
  %121 = add i64 %112, 8
  %122 = inttoptr i64 %121 to i64*
  %123 = load i64, i64* %122
  %124 = add i64 %112, 16
  %125 = inttoptr i64 %124 to i64*
  %126 = load i64, i64* %125
  %127 = add i64 %112, 24
  %128 = inttoptr i64 %127 to i64*
  %129 = load i64, i64* %128
  %130 = add i64 %112, 32
  %131 = inttoptr i64 %130 to i64*
  %132 = load i64, i64* %131
  %133 = add i64 %112, 40
  %134 = inttoptr i64 %133 to i64*
  %135 = load i64, i64* %134
  %136 = add i64 %112, 48
  %137 = inttoptr i64 %136 to i64*
  %138 = load i64, i64* %137
  %139 = add i64 %112, 56
  %140 = inttoptr i64 %139 to i64*
  %141 = load i64, i64* %140
  %142 = add i64 %112, 64
  %143 = inttoptr i64 %142 to i64*
  %144 = load i64, i64* %143
  %145 = add i64 %112, 72
  %146 = inttoptr i64 %145 to i64*
  %147 = load i64, i64* %146
  %148 = inttoptr i64 %113 to i64*
  %149 = load i64, i64* %148
  store i64 %149, i64* %3, align 8, !alias.scope !1305, !noalias !1308
  store i64 %112, i64* %12, align 8, !alias.scope !1305, !noalias !1308
  %150 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 164), i64 %110, i64 %115, i64 %116, i64 %117, i64 %118, i64 %120, i64 %123, i64 %126, i64 %129, i64 %132, i64 %135, i64 %138, i64 %141, i64 %144, i64 %147), !noalias !1305
  %151 = load i64, i64* %3, align 8
  store i64 1, i64* %11, align 8, !tbaa !1231
  %152 = load i64, i64* %13, align 8
  %153 = add i64 %152, -96
  %154 = trunc i64 %150 to i32
  %155 = inttoptr i64 %153 to i32*
  store i32 %154, i32* %155
  %156 = add i64 %151, 13
  %157 = load i64, i64* %12, align 8, !tbaa !1231
  %158 = add i64 %157, -8
  %159 = inttoptr i64 %158 to i64*
  store i64 %156, i64* %159
  %160 = inttoptr i64 %158 to i64*
  %161 = load i64, i64* %160
  store i64 %161, i64* %3, align 8, !alias.scope !1310, !noalias !1313
  store i64 %157, i64* %12, align 8, !alias.scope !1310, !noalias !1313
  %162 = tail call i64 @exit(i64 1), !noalias !1310
  store i64 %162, i64* %39, align 8, !alias.scope !1310, !noalias !1313
  %163 = load i64, i64* %3, align 8
  %164 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull %0, i64 %163, %struct.Memory* %494)
  ret %struct.Memory* %164

block_400b61:                                     ; preds = %block_400ac7
  %165 = add i64 %290, 17
  %166 = load i64, i64* %12, align 8, !tbaa !1231
  %167 = add i64 %166, -8
  %168 = inttoptr i64 %167 to i64*
  store i64 %165, i64* %168
  %169 = load i64, i64* %10, align 8, !alias.scope !1315, !noalias !1318
  %170 = load i64, i64* %9, align 8, !alias.scope !1315, !noalias !1318
  %171 = load i64, i64* %40, align 8, !alias.scope !1315, !noalias !1318
  %172 = load i64, i64* %14, align 8, !alias.scope !1315, !noalias !1318
  %173 = load i64, i64* %41, align 8, !alias.scope !1315, !noalias !1318
  %174 = inttoptr i64 %166 to i64*
  %175 = load i64, i64* %174
  %176 = add i64 %166, 8
  %177 = inttoptr i64 %176 to i64*
  %178 = load i64, i64* %177
  %179 = add i64 %166, 16
  %180 = inttoptr i64 %179 to i64*
  %181 = load i64, i64* %180
  %182 = add i64 %166, 24
  %183 = inttoptr i64 %182 to i64*
  %184 = load i64, i64* %183
  %185 = add i64 %166, 32
  %186 = inttoptr i64 %185 to i64*
  %187 = load i64, i64* %186
  %188 = add i64 %166, 40
  %189 = inttoptr i64 %188 to i64*
  %190 = load i64, i64* %189
  %191 = add i64 %166, 48
  %192 = inttoptr i64 %191 to i64*
  %193 = load i64, i64* %192
  %194 = add i64 %166, 56
  %195 = inttoptr i64 %194 to i64*
  %196 = load i64, i64* %195
  %197 = add i64 %166, 64
  %198 = inttoptr i64 %197 to i64*
  %199 = load i64, i64* %198
  %200 = add i64 %166, 72
  %201 = inttoptr i64 %200 to i64*
  %202 = load i64, i64* %201
  %203 = inttoptr i64 %167 to i64*
  %204 = load i64, i64* %203
  store i64 %204, i64* %3, align 8, !alias.scope !1315, !noalias !1318
  store i64 %166, i64* %12, align 8, !alias.scope !1315, !noalias !1318
  %205 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 101), i64 %169, i64 %170, i64 %171, i64 %172, i64 %173, i64 %175, i64 %178, i64 %181, i64 %184, i64 %187, i64 %190, i64 %193, i64 %196, i64 %199, i64 %202), !noalias !1315
  %206 = load i64, i64* %3, align 8
  %207 = load i64, i64* @stdout
  %208 = load i64, i64* %13, align 8
  %209 = add i64 %208, -84
  %210 = trunc i64 %205 to i32
  %211 = inttoptr i64 %209 to i32*
  store i32 %210, i32* %211
  %212 = add i64 %206, 16
  %213 = load i64, i64* %12, align 8, !tbaa !1231
  %214 = add i64 %213, -8
  %215 = inttoptr i64 %214 to i64*
  store i64 %212, i64* %215
  %216 = inttoptr i64 %214 to i64*
  %217 = load i64, i64* %216
  store i64 %217, i64* %3, align 8, !alias.scope !1320, !noalias !1323
  store i64 %213, i64* %12, align 8, !alias.scope !1320, !noalias !1323
  %218 = tail call i64 @fflush(i64 %207), !noalias !1320
  %219 = load i64, i64* %13, align 8
  %220 = add i64 %219, -88
  %221 = trunc i64 %218 to i32
  %222 = load i64, i64* %3, align 8
  %223 = add i64 %222, 3
  %224 = inttoptr i64 %220 to i32*
  store i32 %221, i32* %224
  br label %block_400b85

block_400bbb:                                     ; preds = %block_400bb1
  store i64 0, i64* %10, align 8, !tbaa !1231
  %225 = sext i32 %497 to i64
  store i64 %225, i64* %8, align 8, !tbaa !1231
  %226 = shl nsw i64 %225, 3
  %227 = add i64 %493, -48
  %228 = add i64 %227, %226
  %229 = inttoptr i64 %228 to i64*
  %230 = load i64, i64* %229
  %231 = add i64 %508, 18
  %232 = load i64, i64* %12, align 8, !tbaa !1231
  %233 = add i64 %232, -8
  %234 = inttoptr i64 %233 to i64*
  store i64 %231, i64* %234
  %235 = inttoptr i64 %233 to i64*
  %236 = load i64, i64* %235
  store i64 %236, i64* %3, align 8, !alias.scope !1325, !noalias !1328
  store i64 %232, i64* %12, align 8, !alias.scope !1325, !noalias !1328
  %237 = tail call i64 @pthread_join(i64 %230, i64 0), !noalias !1325
  %238 = load i64, i64* %13, align 8
  %239 = add i64 %238, -20
  %240 = trunc i64 %237 to i32
  %241 = load i64, i64* %3, align 8
  %242 = inttoptr i64 %239 to i32*
  store i32 %240, i32* %242
  %243 = inttoptr i64 %239 to i32*
  %244 = load i32, i32* %243
  store i8 0, i8* %20, align 1, !tbaa !1240
  %245 = and i32 %244, 255
  %246 = tail call i32 @llvm.ctpop.i32(i32 %245) #9
  %247 = trunc i32 %246 to i8
  %248 = and i8 %247, 1
  %249 = xor i8 %248, 1
  store i8 %249, i8* %21, align 1, !tbaa !1254
  store i8 0, i8* %22, align 1, !tbaa !1255
  %250 = icmp eq i32 %244, 0
  %251 = zext i1 %250 to i8
  store i8 %251, i8* %23, align 1, !tbaa !1256
  %252 = lshr i32 %244, 31
  %253 = trunc i32 %252 to i8
  store i8 %253, i8* %24, align 1, !tbaa !1257
  store i8 0, i8* %25, align 1, !tbaa !1258
  %254 = select i1 %250, i64 46, i64 13
  %255 = add i64 %241, %254
  br i1 %250, label %block_400bfb, label %block_400bda

block_400baa:                                     ; preds = %block_400b85
  %256 = add i64 %259, -24
  %257 = add i64 %273, 7
  %258 = inttoptr i64 %256 to i32*
  store i32 0, i32* %258
  br label %block_400bb1

block_400b85:                                     ; preds = %block_400b93, %block_400b61
  %259 = phi i64 [ %219, %block_400b61 ], [ %359, %block_400b93 ]
  %260 = phi i64 [ %223, %block_400b61 ], [ %364, %block_400b93 ]
  %261 = phi %struct.Memory* [ %276, %block_400b61 ], [ %261, %block_400b93 ]
  %262 = load i32, i32* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 104) to i32*)
  %263 = add i32 %262, -2
  %264 = lshr i32 %263, 31
  %265 = trunc i32 %264 to i8
  %266 = lshr i32 %262, 31
  %267 = xor i32 %264, %266
  %268 = add nuw nsw i32 %267, %266
  %269 = icmp eq i32 %268, 2
  %270 = icmp ne i8 %265, 0
  %271 = xor i1 %270, %269
  %272 = select i1 %271, i64 14, i64 37
  %273 = add i64 %260, %272
  br i1 %271, label %block_400b93, label %block_400baa

block_400ac7:                                     ; preds = %block_400b4e, %block_400a60
  %274 = phi i64 [ %108, %block_400a60 ], [ %296, %block_400b4e ]
  %275 = phi i64 [ %102, %block_400a60 ], [ %474, %block_400b4e ]
  %276 = phi %struct.Memory* [ %2, %block_400a60 ], [ %276, %block_400b4e ]
  %277 = add i64 %275, -24
  %278 = inttoptr i64 %277 to i32*
  %279 = load i32, i32* %278
  %280 = add i32 %279, -2
  %281 = lshr i32 %280, 31
  %282 = trunc i32 %281 to i8
  %283 = lshr i32 %279, 31
  %284 = xor i32 %281, %283
  %285 = add nuw nsw i32 %284, %283
  %286 = icmp eq i32 %285, 2
  %287 = icmp ne i8 %282, 0
  %288 = xor i1 %287, %286
  %289 = select i1 %288, i64 10, i64 154
  %290 = add i64 %274, %289
  br i1 %288, label %block_400ad1, label %block_400b61

block_400b4e:                                     ; preds = %block_400ad1
  %291 = add i64 %474, -24
  %292 = inttoptr i64 %291 to i32*
  %293 = load i32, i32* %292
  %294 = add i32 %293, 1
  %295 = inttoptr i64 %291 to i32*
  store i32 %294, i32* %295
  %296 = add i64 %491, -135
  br label %block_400ac7

block_400b2d:                                     ; preds = %block_400ad1
  %297 = zext i32 %480 to i64
  store i64 %297, i64* %10, align 8, !tbaa !1231
  %298 = add i64 %491, 20
  %299 = load i64, i64* %12, align 8, !tbaa !1231
  %300 = add i64 %299, -8
  %301 = inttoptr i64 %300 to i64*
  store i64 %298, i64* %301
  %302 = load i64, i64* %9, align 8, !alias.scope !1330, !noalias !1333
  %303 = load i64, i64* %40, align 8, !alias.scope !1330, !noalias !1333
  %304 = load i64, i64* %14, align 8, !alias.scope !1330, !noalias !1333
  %305 = load i64, i64* %41, align 8, !alias.scope !1330, !noalias !1333
  %306 = inttoptr i64 %299 to i64*
  %307 = load i64, i64* %306
  %308 = add i64 %299, 8
  %309 = inttoptr i64 %308 to i64*
  %310 = load i64, i64* %309
  %311 = add i64 %299, 16
  %312 = inttoptr i64 %311 to i64*
  %313 = load i64, i64* %312
  %314 = add i64 %299, 24
  %315 = inttoptr i64 %314 to i64*
  %316 = load i64, i64* %315
  %317 = add i64 %299, 32
  %318 = inttoptr i64 %317 to i64*
  %319 = load i64, i64* %318
  %320 = add i64 %299, 40
  %321 = inttoptr i64 %320 to i64*
  %322 = load i64, i64* %321
  %323 = add i64 %299, 48
  %324 = inttoptr i64 %323 to i64*
  %325 = load i64, i64* %324
  %326 = add i64 %299, 56
  %327 = inttoptr i64 %326 to i64*
  %328 = load i64, i64* %327
  %329 = add i64 %299, 64
  %330 = inttoptr i64 %329 to i64*
  %331 = load i64, i64* %330
  %332 = add i64 %299, 72
  %333 = inttoptr i64 %332 to i64*
  %334 = load i64, i64* %333
  %335 = inttoptr i64 %300 to i64*
  %336 = load i64, i64* %335
  store i64 %336, i64* %3, align 8, !alias.scope !1330, !noalias !1333
  store i64 %299, i64* %12, align 8, !alias.scope !1330, !noalias !1333
  %337 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 66), i64 %297, i64 %302, i64 %303, i64 %304, i64 %305, i64 %307, i64 %310, i64 %313, i64 %316, i64 %319, i64 %322, i64 %325, i64 %328, i64 %331, i64 %334), !noalias !1330
  %338 = load i64, i64* %3, align 8
  store i64 1, i64* %11, align 8, !tbaa !1231
  %339 = load i64, i64* %13, align 8
  %340 = add i64 %339, -80
  %341 = trunc i64 %337 to i32
  %342 = inttoptr i64 %340 to i32*
  store i32 %341, i32* %342
  %343 = add i64 %338, 13
  %344 = load i64, i64* %12, align 8, !tbaa !1231
  %345 = add i64 %344, -8
  %346 = inttoptr i64 %345 to i64*
  store i64 %343, i64* %346
  %347 = inttoptr i64 %345 to i64*
  %348 = load i64, i64* %347
  store i64 %348, i64* %3, align 8, !alias.scope !1335, !noalias !1338
  store i64 %344, i64* %12, align 8, !alias.scope !1335, !noalias !1338
  %349 = tail call i64 @exit(i64 1), !noalias !1335
  store i64 %349, i64* %39, align 8, !alias.scope !1335, !noalias !1338
  %350 = load i64, i64* %3, align 8
  %351 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull %0, i64 %350, %struct.Memory* %276)
  ret %struct.Memory* %351

block_400b93:                                     ; preds = %block_400b85
  %352 = add i64 %273, 15
  %353 = load i64, i64* %12, align 8, !tbaa !1231
  %354 = add i64 %353, -8
  %355 = inttoptr i64 %354 to i64*
  store i64 %352, i64* %355
  %356 = inttoptr i64 %354 to i64*
  %357 = load i64, i64* %356
  store i64 %357, i64* %3, align 8, !alias.scope !1340, !noalias !1343
  store i64 %353, i64* %12, align 8, !alias.scope !1340, !noalias !1343
  %358 = tail call i64 @pthread_cond_signal(i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 56)), !noalias !1340
  %359 = load i64, i64* %13, align 8
  %360 = add i64 %359, -92
  %361 = trunc i64 %358 to i32
  %362 = load i64, i64* %3, align 8
  %363 = inttoptr i64 %360 to i32*
  store i32 %361, i32* %363
  %364 = add i64 %362, -29
  br label %block_400b85

block_400c0e:                                     ; preds = %block_400bb1
  store i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 197), i64* %11, align 8, !tbaa !1231
  %365 = add i64 %508, 17
  %366 = load i64, i64* %12, align 8, !tbaa !1231
  %367 = add i64 %366, -8
  %368 = inttoptr i64 %367 to i64*
  store i64 %365, i64* %368
  %369 = load i64, i64* %10, align 8, !alias.scope !1345, !noalias !1348
  %370 = load i64, i64* %9, align 8, !alias.scope !1345, !noalias !1348
  %371 = load i64, i64* %40, align 8, !alias.scope !1345, !noalias !1348
  %372 = load i64, i64* %14, align 8, !alias.scope !1345, !noalias !1348
  %373 = load i64, i64* %41, align 8, !alias.scope !1345, !noalias !1348
  %374 = inttoptr i64 %366 to i64*
  %375 = load i64, i64* %374
  %376 = add i64 %366, 8
  %377 = inttoptr i64 %376 to i64*
  %378 = load i64, i64* %377
  %379 = add i64 %366, 16
  %380 = inttoptr i64 %379 to i64*
  %381 = load i64, i64* %380
  %382 = add i64 %366, 24
  %383 = inttoptr i64 %382 to i64*
  %384 = load i64, i64* %383
  %385 = add i64 %366, 32
  %386 = inttoptr i64 %385 to i64*
  %387 = load i64, i64* %386
  %388 = add i64 %366, 40
  %389 = inttoptr i64 %388 to i64*
  %390 = load i64, i64* %389
  %391 = add i64 %366, 48
  %392 = inttoptr i64 %391 to i64*
  %393 = load i64, i64* %392
  %394 = add i64 %366, 56
  %395 = inttoptr i64 %394 to i64*
  %396 = load i64, i64* %395
  %397 = add i64 %366, 64
  %398 = inttoptr i64 %397 to i64*
  %399 = load i64, i64* %398
  %400 = add i64 %366, 72
  %401 = inttoptr i64 %400 to i64*
  %402 = load i64, i64* %401
  store i64 %366, i64* %12, align 8, !alias.scope !1345, !noalias !1348
  %403 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 197), i64 %369, i64 %370, i64 %371, i64 %372, i64 %373, i64 %375, i64 %378, i64 %381, i64 %384, i64 %387, i64 %390, i64 %393, i64 %396, i64 %399, i64 %402), !noalias !1345
  store i64 0, i64* %8, align 8, !tbaa !1231
  %404 = load i64, i64* %13, align 8
  %405 = add i64 %404, -100
  %406 = trunc i64 %403 to i32
  %407 = inttoptr i64 %405 to i32*
  store i32 %406, i32* %407
  store i64 0, i64* %7, align 8, !tbaa !1231
  %408 = load i64, i64* %12, align 8
  %409 = add i64 %408, 112
  %410 = icmp ugt i64 %408, -113
  %411 = zext i1 %410 to i8
  store i8 %411, i8* %20, align 1, !tbaa !1240
  %412 = trunc i64 %409 to i32
  %413 = and i32 %412, 255
  %414 = tail call i32 @llvm.ctpop.i32(i32 %413) #9
  %415 = trunc i32 %414 to i8
  %416 = and i8 %415, 1
  %417 = xor i8 %416, 1
  store i8 %417, i8* %21, align 1, !tbaa !1254
  %418 = xor i64 %408, 16
  %419 = xor i64 %418, %409
  %420 = lshr i64 %419, 4
  %421 = trunc i64 %420 to i8
  %422 = and i8 %421, 1
  store i8 %422, i8* %22, align 1, !tbaa !1255
  %423 = icmp eq i64 %409, 0
  %424 = zext i1 %423 to i8
  store i8 %424, i8* %23, align 1, !tbaa !1256
  %425 = lshr i64 %409, 63
  %426 = trunc i64 %425 to i8
  store i8 %426, i8* %24, align 1, !tbaa !1257
  %427 = lshr i64 %408, 63
  %428 = xor i64 %425, %427
  %429 = add nuw nsw i64 %428, %425
  %430 = icmp eq i64 %429, 2
  %431 = zext i1 %430 to i8
  store i8 %431, i8* %25, align 1, !tbaa !1258
  %432 = add i64 %408, 120
  %433 = inttoptr i64 %409 to i64*
  %434 = load i64, i64* %433
  store i64 %434, i64* %13, align 8, !tbaa !1231
  %435 = inttoptr i64 %432 to i64*
  %436 = load i64, i64* %435
  store i64 %436, i64* %3, align 8, !tbaa !1231
  %437 = add i64 %408, 128
  store i64 %437, i64* %12, align 8, !tbaa !1231
  ret %struct.Memory* %494

block_400ad1:                                     ; preds = %block_400ac7
  store i64 0, i64* %10, align 8, !tbaa !1231
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @theThread to i64), i64* %9, align 8, !tbaa !1231
  %438 = add i64 %275, -64
  store i64 %438, i64* %8, align 8, !tbaa !1231
  %439 = add i64 %275, -48
  store i64 %439, i64* %11, align 8, !tbaa !1231
  %440 = sext i32 %279 to i64
  %441 = shl nsw i64 %440, 3
  %442 = add i64 %438, %441
  %443 = inttoptr i64 %442 to i32*
  store i32 %279, i32* %443
  %444 = inttoptr i64 %277 to i32*
  %445 = load i32, i32* %444
  %446 = shl i32 %445, 1
  %447 = add i32 %446, 2
  %448 = load i64, i64* %13, align 8
  %449 = add i64 %448, -24
  %450 = inttoptr i64 %449 to i32*
  %451 = load i32, i32* %450
  %452 = sext i32 %451 to i64
  %453 = shl nsw i64 %452, 3
  %454 = add i64 %448, -60
  %455 = add i64 %454, %453
  %456 = inttoptr i64 %455 to i32*
  store i32 %447, i32* %456
  %457 = inttoptr i64 %449 to i32*
  %458 = load i32, i32* %457
  %459 = sext i32 %458 to i64
  %460 = shl nsw i64 %459, 3
  %461 = load i64, i64* %11, align 8
  %462 = add i64 %460, %461
  store i64 %460, i64* %14, align 8, !tbaa !1231
  %463 = load i64, i64* %8, align 8
  %464 = add i64 %460, %463
  store i64 %464, i64* %8, align 8, !tbaa !1231
  %465 = add i64 %290, 79
  %466 = load i64, i64* %12, align 8, !tbaa !1231
  %467 = add i64 %466, -8
  %468 = inttoptr i64 %467 to i64*
  store i64 %465, i64* %468
  %469 = load i64, i64* %10, align 8, !alias.scope !1350, !noalias !1353
  %470 = load i64, i64* %9, align 8, !alias.scope !1350, !noalias !1353
  %471 = inttoptr i64 %467 to i64*
  %472 = load i64, i64* %471
  store i64 %472, i64* %3, align 8, !alias.scope !1350, !noalias !1353
  store i64 %466, i64* %12, align 8, !alias.scope !1350, !noalias !1353
  %473 = tail call i64 @pthread_create(i64 %462, i64 %469, i64 %470, i64 %464), !noalias !1350
  %474 = load i64, i64* %13, align 8
  %475 = add i64 %474, -20
  %476 = trunc i64 %473 to i32
  %477 = load i64, i64* %3, align 8
  %478 = inttoptr i64 %475 to i32*
  store i32 %476, i32* %478
  %479 = inttoptr i64 %475 to i32*
  %480 = load i32, i32* %479
  store i8 0, i8* %20, align 1, !tbaa !1240
  %481 = and i32 %480, 255
  %482 = tail call i32 @llvm.ctpop.i32(i32 %481) #9
  %483 = trunc i32 %482 to i8
  %484 = and i8 %483, 1
  %485 = xor i8 %484, 1
  store i8 %485, i8* %21, align 1, !tbaa !1254
  store i8 0, i8* %22, align 1, !tbaa !1255
  %486 = icmp eq i32 %480, 0
  %487 = zext i1 %486 to i8
  store i8 %487, i8* %23, align 1, !tbaa !1256
  %488 = lshr i32 %480, 31
  %489 = trunc i32 %488 to i8
  store i8 %489, i8* %24, align 1, !tbaa !1257
  store i8 0, i8* %25, align 1, !tbaa !1258
  %490 = select i1 %486, i64 46, i64 13
  %491 = add i64 %477, %490
  br i1 %486, label %block_400b4e, label %block_400b2d

block_400bb1:                                     ; preds = %block_400bfb, %block_400baa
  %492 = phi i64 [ %257, %block_400baa ], [ %514, %block_400bfb ]
  %493 = phi i64 [ %259, %block_400baa ], [ %238, %block_400bfb ]
  %494 = phi %struct.Memory* [ %261, %block_400baa ], [ %494, %block_400bfb ]
  %495 = add i64 %493, -24
  %496 = inttoptr i64 %495 to i32*
  %497 = load i32, i32* %496
  %498 = add i32 %497, -2
  %499 = lshr i32 %498, 31
  %500 = trunc i32 %499 to i8
  %501 = lshr i32 %497, 31
  %502 = xor i32 %499, %501
  %503 = add nuw nsw i32 %502, %501
  %504 = icmp eq i32 %503, 2
  %505 = icmp ne i8 %500, 0
  %506 = xor i1 %505, %504
  %507 = select i1 %506, i64 10, i64 93
  %508 = add i64 %492, %507
  br i1 %506, label %block_400bbb, label %block_400c0e

block_400bfb:                                     ; preds = %block_400bbb
  %509 = add i64 %238, -24
  %510 = inttoptr i64 %509 to i32*
  %511 = load i32, i32* %510
  %512 = add i32 %511, 1
  %513 = inttoptr i64 %509 to i32*
  store i32 %512, i32* %513
  %514 = add i64 %255, -74
  br label %block_400bb1
}

; Function Attrs: nobuiltin noinline
define i64 @callback_sub_400870__start(i64, i64, i64, i64, i64, i64, i64, i64) local_unnamed_addr #5 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196464, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %18 = tail call %struct.Memory* @sub_400870__start(%struct.State* nonnull @__mcsema_reg_state, i64 4196464, %struct.Memory* null)
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
define i64 @callback_sub_400940_frame_dummy(i64, i64, i64, i64, i64, i64, i64, i64) #7 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196672, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %18 = tail call %struct.Memory* @sub_400940_frame_dummy(%struct.State* nonnull @__mcsema_reg_state, i64 4196672, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_400910___do_global_dtors_aux(i64, i64, i64, i64, i64, i64, i64, i64) #7 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196624, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %18 = tail call %struct.Memory* @sub_400910___do_global_dtors_aux(%struct.State* nonnull @__mcsema_reg_state, i64 4196624, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007c0_printf(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
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

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602180___gmon_start__(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
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
define %struct.Memory* @ext_400850_pthread_mutex_lock(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
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
  %13 = tail call i64 @pthread_mutex_lock(i64 %8)
  store i64 %13, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602120_pthread_cond_wait(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %9 = load i64, i64* %7, align 8
  %10 = load i64, i64* %6, align 8
  %11 = load i64, i64* %8, align 8
  %12 = inttoptr i64 %11 to i64*
  %13 = load i64, i64* %12
  store i64 %13, i64* %4, align 8
  %14 = add i64 %11, 8
  store i64 %14, i64* %8, align 8
  %15 = tail call i64 @pthread_cond_wait(i64 %9, i64 %10)
  store i64 %15, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602148_pthread_mutex_unlock(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
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
  %13 = tail call i64 @pthread_mutex_unlock(i64 %8)
  store i64 %13, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_400ca0___libc_csu_fini() #7 {
  %1 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %2 = icmp eq i64 %1, 0
  br i1 %2, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %0
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %0
  %3 = phi i64 [ %1, %0 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4197536, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %4 = load volatile i1, i1* @0, align 1
  br i1 %4, label %__mcsema_early_init.exit, label %5

; <label>:5:                                      ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %5, %__mcsema_verify_reg_state.exit
  %6 = add i64 %3, -8
  store i64 %6, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %7 = tail call %struct.Memory* @sub_400ca0___libc_csu_fini(%struct.State* nonnull @__mcsema_reg_state, i64 4197536, %struct.Memory* null)
  store i64 %3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %8 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %8
}

; Function Attrs: nobuiltin noinline
define i64 @callback_sub_400c30___libc_csu_init() #5 {
  %1 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %2 = icmp eq i64 %1, 0
  br i1 %2, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %0
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %0
  %3 = phi i64 [ %1, %0 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4197424, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %4 = load volatile i1, i1* @0, align 1
  br i1 %4, label %__mcsema_early_init.exit, label %5

; <label>:5:                                      ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %5, %__mcsema_verify_reg_state.exit
  %6 = add i64 %3, -8
  store i64 %6, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %7 = tail call %struct.Memory* @sub_400c30___libc_csu_init(%struct.State* nonnull @__mcsema_reg_state, i64 4197424, %struct.Memory* null)
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
  store i64 4196960, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %10 = tail call %struct.Memory* @sub_400a60_main(%struct.State* nonnull @__mcsema_reg_state, i64 4196960, %struct.Memory* null)
  store i64 %6, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %11 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %11
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007d0___libc_start_main(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
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
define %struct.Memory* @ext_400830_exit(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
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
  %13 = tail call i64 @exit(i64 %8)
  store i64 %13, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602168_pthread_mutex_init(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %9 = load i64, i64* %7, align 8
  %10 = load i64, i64* %6, align 8
  %11 = load i64, i64* %8, align 8
  %12 = inttoptr i64 %11 to i64*
  %13 = load i64, i64* %12
  store i64 %13, i64* %4, align 8
  %14 = add i64 %11, 8
  store i64 %14, i64* %8, align 8
  %15 = tail call i64 @pthread_mutex_init(i64 %9, i64 %10)
  store i64 %15, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007f0_pthread_cond_init(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %9 = load i64, i64* %7, align 8
  %10 = load i64, i64* %6, align 8
  %11 = load i64, i64* %8, align 8
  %12 = inttoptr i64 %11 to i64*
  %13 = load i64, i64* %12
  store i64 %13, i64* %4, align 8
  %14 = add i64 %11, 8
  store i64 %14, i64* %8, align 8
  %15 = tail call i64 @pthread_cond_init(i64 %9, i64 %10)
  store i64 %15, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602150_fflush(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
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
  %13 = tail call i64 @fflush(i64 %8)
  store i64 %13, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602158_pthread_join(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %9 = load i64, i64* %7, align 8
  %10 = load i64, i64* %6, align 8
  %11 = load i64, i64* %8, align 8
  %12 = inttoptr i64 %11 to i64*
  %13 = load i64, i64* %12
  store i64 %13, i64* %4, align 8
  %14 = add i64 %11, 8
  store i64 %14, i64* %8, align 8
  %15 = tail call i64 @pthread_join(i64 %9, i64 %10)
  store i64 %15, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007e0_pthread_cond_signal(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
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
  %13 = tail call i64 @pthread_cond_signal(i64 %8)
  store i64 %13, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: nobuiltin noinline
define i64 @theThread(i64, i64, i64, i64, i64, i64, i64, i64) #5 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196816, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %18 = tail call %struct.Memory* @sub_4009d0_theThread(%struct.State* nonnull @__mcsema_reg_state, i64 4196816, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007a0_pthread_create(%struct.State* noalias nocapture dereferenceable(3376), i64, %struct.Memory* noalias returned) local_unnamed_addr #8 {
  %4 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 33, i32 0, i32 0
  %5 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 7, i32 0, i32 0
  %8 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 9, i32 0, i32 0
  %9 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 11, i32 0, i32 0
  %10 = getelementptr inbounds %struct.State, %struct.State* %0, i64 0, i32 6, i32 13, i32 0, i32 0
  %11 = load i64, i64* %9, align 8
  %12 = load i64, i64* %8, align 8
  %13 = load i64, i64* %7, align 8
  %14 = load i64, i64* %6, align 8
  %15 = load i64, i64* %10, align 8
  %16 = inttoptr i64 %15 to i64*
  %17 = load i64, i64* %16
  store i64 %17, i64* %4, align 8
  %18 = add i64 %15, 8
  store i64 %18, i64* %10, align 8
  %19 = tail call i64 @pthread_create(i64 %11, i64 %12, i64 %13, i64 %14)
  store i64 %19, i64* %5, align 8
  ret %struct.Memory* %2
}

; Function Attrs: nobuiltin noinline
define i64 @bar(i64, i64, i64, i64, i64, i64, i64, i64) local_unnamed_addr #5 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196688, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %18 = tail call %struct.Memory* @sub_400950_bar(%struct.State* nonnull @__mcsema_reg_state, i64 4196688, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
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
  store i64 4197540, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %18 = tail call %struct.Memory* @sub_400ca4__term_proc(%struct.State* nonnull @__mcsema_reg_state, i64 4197540, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: nobuiltin noinline
define i64 @foo(i64, i64, i64, i64, i64, i64, i64, i64) local_unnamed_addr #5 {
  %9 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %8
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %8
  %11 = phi i64 [ %9, %8 ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196752, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %18 = tail call %struct.Memory* @sub_400990_foo(%struct.State* nonnull @__mcsema_reg_state, i64 4196752, %struct.Memory* null)
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
  store i64 4196200, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %18 = tail call %struct.Memory* @sub_400768__init_proc(%struct.State* nonnull @__mcsema_reg_state, i64 4196200, %struct.Memory* null)
  store i64 %11, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %19 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %19
}

; Function Attrs: nounwind
define internal void @__mcsema_destructor() #9 {
  %1 = tail call i64 @callback_sub_400ca0___libc_csu_fini()
  ret void
}

define internal void @__mcsema_constructor() {
  %1 = load volatile i1, i1* @0, align 1
  br i1 %1, label %__mcsema_early_init.exit, label %2

; <label>:2:                                      ; preds = %0
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %2, %0
  %3 = tail call i64 @callback_sub_400c30___libc_csu_init()
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
!1231 = !{!1232, !1232, i64 0}
!1232 = !{!"long", !1233, i64 0}
!1233 = !{!"omnipotent char", !1234, i64 0}
!1234 = !{!"Simple C++ TBAA"}
!1235 = !{!1236}
!1236 = distinct !{!1236, !1237, !"ext_4007c0_printf: argument 0"}
!1237 = distinct !{!1237, !"ext_4007c0_printf"}
!1238 = !{!1239}
!1239 = distinct !{!1239, !1237, !"ext_4007c0_printf: argument 1"}
!1240 = !{!1241, !1233, i64 2065}
!1241 = !{!"_ZTS5State", !1233, i64 16, !1242, i64 2064, !1233, i64 2080, !1243, i64 2088, !1245, i64 2112, !1247, i64 2208, !1248, i64 2480, !1249, i64 2608, !1250, i64 2736, !1233, i64 2760, !1233, i64 2768, !1251, i64 3280}
!1242 = !{!"_ZTS10ArithFlags", !1233, i64 0, !1233, i64 1, !1233, i64 2, !1233, i64 3, !1233, i64 4, !1233, i64 5, !1233, i64 6, !1233, i64 7, !1233, i64 8, !1233, i64 9, !1233, i64 10, !1233, i64 11, !1233, i64 12, !1233, i64 13, !1233, i64 14, !1233, i64 15}
!1243 = !{!"_ZTS8Segments", !1244, i64 0, !1233, i64 2, !1244, i64 4, !1233, i64 6, !1244, i64 8, !1233, i64 10, !1244, i64 12, !1233, i64 14, !1244, i64 16, !1233, i64 18, !1244, i64 20, !1233, i64 22}
!1244 = !{!"short", !1233, i64 0}
!1245 = !{!"_ZTS12AddressSpace", !1232, i64 0, !1246, i64 8, !1232, i64 16, !1246, i64 24, !1232, i64 32, !1246, i64 40, !1232, i64 48, !1246, i64 56, !1232, i64 64, !1246, i64 72, !1232, i64 80, !1246, i64 88}
!1246 = !{!"_ZTS3Reg", !1233, i64 0}
!1247 = !{!"_ZTS3GPR", !1232, i64 0, !1246, i64 8, !1232, i64 16, !1246, i64 24, !1232, i64 32, !1246, i64 40, !1232, i64 48, !1246, i64 56, !1232, i64 64, !1246, i64 72, !1232, i64 80, !1246, i64 88, !1232, i64 96, !1246, i64 104, !1232, i64 112, !1246, i64 120, !1232, i64 128, !1246, i64 136, !1232, i64 144, !1246, i64 152, !1232, i64 160, !1246, i64 168, !1232, i64 176, !1246, i64 184, !1232, i64 192, !1246, i64 200, !1232, i64 208, !1246, i64 216, !1232, i64 224, !1246, i64 232, !1232, i64 240, !1246, i64 248, !1232, i64 256, !1246, i64 264}
!1248 = !{!"_ZTS8X87Stack", !1233, i64 0}
!1249 = !{!"_ZTS3MMX", !1233, i64 0}
!1250 = !{!"_ZTS14FPUStatusFlags", !1233, i64 0, !1233, i64 1, !1233, i64 2, !1233, i64 3, !1233, i64 4, !1233, i64 5, !1233, i64 6, !1233, i64 7, !1233, i64 8, !1233, i64 9, !1233, i64 10, !1233, i64 11, !1233, i64 12, !1233, i64 13, !1233, i64 14, !1233, i64 15, !1233, i64 16, !1233, i64 17, !1233, i64 18, !1233, i64 19, !1233, i64 20}
!1251 = !{!"_ZTS13SegmentCaches", !1252, i64 0, !1252, i64 16, !1252, i64 32, !1252, i64 48, !1252, i64 64, !1252, i64 80}
!1252 = !{!"_ZTS13SegmentShadow", !1233, i64 0, !1253, i64 8, !1253, i64 12}
!1253 = !{!"int", !1233, i64 0}
!1254 = !{!1241, !1233, i64 2067}
!1255 = !{!1241, !1233, i64 2069}
!1256 = !{!1241, !1233, i64 2071}
!1257 = !{!1241, !1233, i64 2073}
!1258 = !{!1241, !1233, i64 2077}
!1259 = !{!1260}
!1260 = distinct !{!1260, !1261, !"ext_602180___gmon_start__: argument 0"}
!1261 = distinct !{!1261, !"ext_602180___gmon_start__"}
!1262 = !{!1263}
!1263 = distinct !{!1263, !1261, !"ext_602180___gmon_start__: argument 1"}
!1264 = !{!1265}
!1265 = distinct !{!1265, !1266, !"ext_4007c0_printf: argument 0"}
!1266 = distinct !{!1266, !"ext_4007c0_printf"}
!1267 = !{!1268}
!1268 = distinct !{!1268, !1266, !"ext_4007c0_printf: argument 1"}
!1269 = !{!1270}
!1270 = distinct !{!1270, !1271, !"ext_400850_pthread_mutex_lock: argument 0"}
!1271 = distinct !{!1271, !"ext_400850_pthread_mutex_lock"}
!1272 = !{!1273}
!1273 = distinct !{!1273, !1271, !"ext_400850_pthread_mutex_lock: argument 1"}
!1274 = !{!1275}
!1275 = distinct !{!1275, !1276, !"ext_602120_pthread_cond_wait: argument 0"}
!1276 = distinct !{!1276, !"ext_602120_pthread_cond_wait"}
!1277 = !{!1278}
!1278 = distinct !{!1278, !1276, !"ext_602120_pthread_cond_wait: argument 1"}
!1279 = !{!1280}
!1280 = distinct !{!1280, !1281, !"ext_602148_pthread_mutex_unlock: argument 0"}
!1281 = distinct !{!1281, !"ext_602148_pthread_mutex_unlock"}
!1282 = !{!1283}
!1283 = distinct !{!1283, !1281, !"ext_602148_pthread_mutex_unlock: argument 1"}
!1284 = !{!1233, !1233, i64 0}
!1285 = !{!1286}
!1286 = distinct !{!1286, !1287, !"ext_4007d0___libc_start_main: argument 0"}
!1287 = distinct !{!1287, !"ext_4007d0___libc_start_main"}
!1288 = !{!1289}
!1289 = distinct !{!1289, !1287, !"ext_4007d0___libc_start_main: argument 1"}
!1290 = !{!1291}
!1291 = distinct !{!1291, !1292, !"ext_4007c0_printf: argument 0"}
!1292 = distinct !{!1292, !"ext_4007c0_printf"}
!1293 = !{!1294}
!1294 = distinct !{!1294, !1292, !"ext_4007c0_printf: argument 1"}
!1295 = !{!1296}
!1296 = distinct !{!1296, !1297, !"ext_602168_pthread_mutex_init: argument 0"}
!1297 = distinct !{!1297, !"ext_602168_pthread_mutex_init"}
!1298 = !{!1299}
!1299 = distinct !{!1299, !1297, !"ext_602168_pthread_mutex_init: argument 1"}
!1300 = !{!1301}
!1301 = distinct !{!1301, !1302, !"ext_4007f0_pthread_cond_init: argument 0"}
!1302 = distinct !{!1302, !"ext_4007f0_pthread_cond_init"}
!1303 = !{!1304}
!1304 = distinct !{!1304, !1302, !"ext_4007f0_pthread_cond_init: argument 1"}
!1305 = !{!1306}
!1306 = distinct !{!1306, !1307, !"ext_4007c0_printf: argument 0"}
!1307 = distinct !{!1307, !"ext_4007c0_printf"}
!1308 = !{!1309}
!1309 = distinct !{!1309, !1307, !"ext_4007c0_printf: argument 1"}
!1310 = !{!1311}
!1311 = distinct !{!1311, !1312, !"ext_400830_exit: argument 0"}
!1312 = distinct !{!1312, !"ext_400830_exit"}
!1313 = !{!1314}
!1314 = distinct !{!1314, !1312, !"ext_400830_exit: argument 1"}
!1315 = !{!1316}
!1316 = distinct !{!1316, !1317, !"ext_4007c0_printf: argument 0"}
!1317 = distinct !{!1317, !"ext_4007c0_printf"}
!1318 = !{!1319}
!1319 = distinct !{!1319, !1317, !"ext_4007c0_printf: argument 1"}
!1320 = !{!1321}
!1321 = distinct !{!1321, !1322, !"ext_602150_fflush: argument 0"}
!1322 = distinct !{!1322, !"ext_602150_fflush"}
!1323 = !{!1324}
!1324 = distinct !{!1324, !1322, !"ext_602150_fflush: argument 1"}
!1325 = !{!1326}
!1326 = distinct !{!1326, !1327, !"ext_602158_pthread_join: argument 0"}
!1327 = distinct !{!1327, !"ext_602158_pthread_join"}
!1328 = !{!1329}
!1329 = distinct !{!1329, !1327, !"ext_602158_pthread_join: argument 1"}
!1330 = !{!1331}
!1331 = distinct !{!1331, !1332, !"ext_4007c0_printf: argument 0"}
!1332 = distinct !{!1332, !"ext_4007c0_printf"}
!1333 = !{!1334}
!1334 = distinct !{!1334, !1332, !"ext_4007c0_printf: argument 1"}
!1335 = !{!1336}
!1336 = distinct !{!1336, !1337, !"ext_400830_exit: argument 0"}
!1337 = distinct !{!1337, !"ext_400830_exit"}
!1338 = !{!1339}
!1339 = distinct !{!1339, !1337, !"ext_400830_exit: argument 1"}
!1340 = !{!1341}
!1341 = distinct !{!1341, !1342, !"ext_4007e0_pthread_cond_signal: argument 0"}
!1342 = distinct !{!1342, !"ext_4007e0_pthread_cond_signal"}
!1343 = !{!1344}
!1344 = distinct !{!1344, !1342, !"ext_4007e0_pthread_cond_signal: argument 1"}
!1345 = !{!1346}
!1346 = distinct !{!1346, !1347, !"ext_4007c0_printf: argument 0"}
!1347 = distinct !{!1347, !"ext_4007c0_printf"}
!1348 = !{!1349}
!1349 = distinct !{!1349, !1347, !"ext_4007c0_printf: argument 1"}
!1350 = !{!1351}
!1351 = distinct !{!1351, !1352, !"ext_4007a0_pthread_create: argument 0"}
!1352 = distinct !{!1352, !"ext_4007a0_pthread_create"}
!1353 = !{!1354}
!1354 = distinct !{!1354, !1352, !"ext_4007a0_pthread_create: argument 1"}