; ModuleID = 'pthread.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu-elf"

%seg_400cb0__rodata_type = type <{ [4 x i8], [23 x i8], [23 x i8], [16 x i8], [35 x i8], [63 x i8], [33 x i8], [16 x i8] }>
%seg_601e08__init_array_type = type <{ i64, i64 }>
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
%union.anon = type { i64 }
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

@stdout = external global i64, align 8
@seg_400cb0__rodata = internal constant %seg_400cb0__rodata_type <{ [4 x i8] c"\01\00\02\00", [23 x i8] c"bar(), tls data=%d %d\0A\00", [23 x i8] c"foo(), tls data=%d %d\0A\00", [16 x i8] c"Create threads\0A\00", [35 x i8] c"Failed with %d at pthread_create()\00", [63 x i8] c"Wait for the threads to complete, and release their resources\0A\00", [33 x i8] c"Failed with %d at pthread_join()\00", [16 x i8] c"Main completed\0A\00" }>
@seg_601e08__init_array = internal global %seg_601e08__init_array_type <{ i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_400940_frame_dummy to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_400910___do_global_dtors_aux to i64) }>
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

; Function Attrs: noduplicate noinline noreturn nounwind optnone
define %struct.Memory* @__remill_error(%struct.State* dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* %arg2) local_unnamed_addr #1 {
bb:
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
define %struct.Memory* @sub_400940_frame_dummy(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400940:
  %tmp = tail call %struct.Memory* @sub_4008d0_register_tm_clones(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  ret %struct.Memory* %tmp
}

; Function Attrs: noinline
define %struct.Memory* @sub_400950_bar(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_400950:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 5, i32 7, i32 0, i32 0
  %tmp9 = load i64, i64* %tmp7, align 8
  %tmp10 = load i64, i64* %tmp6, align 8, !tbaa !1231
  %tmp11 = add i64 %tmp10, -8
  %tmp12 = inttoptr i64 %tmp11 to i64*
  store i64 %tmp9, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp10, -24
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp16 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp18 = lshr i64 %tmp13, 63
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp20 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 4), i64* %tmp5, align 8, !tbaa !1231
  %tmp21 = load i64, i64* %tmp8, align 8
  %tmp22 = add i64 %tmp21, -8
  %tmp23 = inttoptr i64 %tmp22 to i32*
  %tmp24 = load i32, i32* %tmp23, align 4
  %tmp25 = zext i32 %tmp24 to i64
  store i64 %tmp25, i64* %tmp4, align 8, !tbaa !1231
  %tmp26 = add i64 %tmp21, -4
  %tmp27 = inttoptr i64 %tmp26 to i32*
  %tmp28 = load i32, i32* %tmp27, align 4
  %tmp29 = zext i32 %tmp28 to i64
  store i64 %tmp29, i64* %tmp3, align 8, !tbaa !1231
  %tmp30 = add i64 %arg1, 41
  %tmp31 = add i64 %tmp10, -32
  %tmp32 = inttoptr i64 %tmp31 to i64*
  store i64 %tmp30, i64* %tmp32, align 8
  %tmp33 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp34 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp35 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp36 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  %tmp37 = load i64, i64* %tmp34, align 8, !alias.scope !1235, !noalias !1238
  %tmp38 = load i64, i64* %tmp35, align 8, !alias.scope !1235, !noalias !1238
  %tmp39 = load i64, i64* %tmp36, align 8, !alias.scope !1235, !noalias !1238
  %tmp40 = inttoptr i64 %tmp13 to i64*
  %tmp41 = load i64, i64* %tmp40, align 8
  %tmp42 = add i64 %tmp10, -16
  %tmp43 = inttoptr i64 %tmp42 to i64*
  %tmp44 = load i64, i64* %tmp43, align 8
  %tmp45 = load i64, i64* %tmp12, align 8
  %tmp46 = inttoptr i64 %tmp10 to i64*
  %tmp47 = load i64, i64* %tmp46, align 8
  %tmp48 = add i64 %tmp10, 8
  %tmp49 = inttoptr i64 %tmp48 to i64*
  %tmp50 = load i64, i64* %tmp49, align 8
  %tmp51 = add i64 %tmp10, 16
  %tmp52 = inttoptr i64 %tmp51 to i64*
  %tmp53 = load i64, i64* %tmp52, align 8
  %tmp54 = add i64 %tmp10, 24
  %tmp55 = inttoptr i64 %tmp54 to i64*
  %tmp56 = load i64, i64* %tmp55, align 8
  %tmp57 = add i64 %tmp10, 32
  %tmp58 = inttoptr i64 %tmp57 to i64*
  %tmp59 = load i64, i64* %tmp58, align 8
  %tmp60 = add i64 %tmp10, 40
  %tmp61 = inttoptr i64 %tmp60 to i64*
  %tmp62 = load i64, i64* %tmp61, align 8
  %tmp63 = add i64 %tmp10, 48
  %tmp64 = inttoptr i64 %tmp63 to i64*
  %tmp65 = load i64, i64* %tmp64, align 8
  %tmp66 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 4), i64 %tmp25, i64 %tmp29, i64 %tmp37, i64 %tmp38, i64 %tmp39, i64 %tmp41, i64 %tmp44, i64 %tmp45, i64 %tmp47, i64 %tmp50, i64 %tmp53, i64 %tmp56, i64 %tmp59, i64 %tmp62, i64 %tmp65), !noalias !1235
  store i64 %tmp66, i64* %tmp33, align 8, !alias.scope !1235, !noalias !1238
  %tmp67 = add i64 %tmp10, -12
  %tmp68 = trunc i64 %tmp66 to i32
  %tmp69 = inttoptr i64 %tmp67 to i32*
  store i32 %tmp68, i32* %tmp69, align 4
  %tmp70 = icmp ugt i64 %tmp13, -17
  %tmp71 = zext i1 %tmp70 to i8
  store i8 %tmp71, i8* %tmp14, align 1, !tbaa !1240
  %tmp72 = trunc i64 %tmp11 to i32
  %tmp73 = and i32 %tmp72, 255
  %tmp74 = tail call i32 @llvm.ctpop.i32(i32 %tmp73) #15, !range !1254
  %tmp75 = trunc i32 %tmp74 to i8
  %tmp76 = and i8 %tmp75, 1
  %tmp77 = xor i8 %tmp76, 1
  store i8 %tmp77, i8* %tmp15, align 1, !tbaa !1255
  %tmp78 = xor i64 %tmp13, 16
  %tmp79 = xor i64 %tmp78, %tmp11
  %tmp80 = lshr i64 %tmp79, 4
  %tmp81 = trunc i64 %tmp80 to i8
  %tmp82 = and i8 %tmp81, 1
  store i8 %tmp82, i8* %tmp16, align 1, !tbaa !1256
  %tmp83 = icmp eq i64 %tmp11, 0
  %tmp84 = zext i1 %tmp83 to i8
  store i8 %tmp84, i8* %tmp17, align 1, !tbaa !1257
  %tmp85 = lshr i64 %tmp11, 63
  %tmp86 = trunc i64 %tmp85 to i8
  store i8 %tmp86, i8* %tmp19, align 1, !tbaa !1258
  %tmp87 = xor i64 %tmp85, %tmp18
  %tmp88 = add nuw nsw i64 %tmp87, %tmp85
  %tmp89 = icmp eq i64 %tmp88, 2
  %tmp90 = zext i1 %tmp89 to i8
  store i8 %tmp90, i8* %tmp20, align 1, !tbaa !1259
  %tmp91 = load i64, i64* %tmp12, align 8
  store i64 %tmp91, i64* %tmp7, align 8, !tbaa !1231
  %tmp92 = load i64, i64* %tmp46, align 8
  store i64 %tmp92, i64* %tmp, align 8, !tbaa !1231
  store i64 %tmp48, i64* %tmp6, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline norecurse nounwind
define %struct.Memory* @sub_400ca0___libc_csu_fini(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #5 {
block_400ca0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp4 = load i64, i64* %tmp3, align 8, !tbaa !1231
  %tmp5 = inttoptr i64 %tmp4 to i64*
  %tmp6 = load i64, i64* %tmp5, align 8
  store i64 %tmp6, i64* %tmp, align 8, !tbaa !1231
  %tmp7 = add i64 %tmp4, 8
  store i64 %tmp7, i64* %tmp3, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400768__init_proc(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone %arg2) local_unnamed_addr #4 {
block_400768:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = load i64, i64* %tmp4, align 8
  %tmp6 = add i64 %tmp5, -8
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i64 ptrtoint (i64 ()* @__gmon_start__ to i64), i64* %tmp3, align 8, !tbaa !1231
  store i8 0, i8* %tmp7, align 1, !tbaa !1240
  %tmp13 = tail call i32 @llvm.ctpop.i32(i32 and (i32 ptrtoint (i64 ()* @__gmon_start__ to i32), i32 255)) #15, !range !1254
  %tmp14 = trunc i32 %tmp13 to i8
  %tmp15 = and i8 %tmp14, 1
  %tmp16 = xor i8 %tmp15, 1
  store i8 %tmp16, i8* %tmp8, align 1, !tbaa !1255
  store i8 zext (i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null) to i8), i8* %tmp10, align 1, !tbaa !1257
  store i8 trunc (i64 lshr (i64 ptrtoint (i64 ()* @__gmon_start__ to i64), i64 63) to i8), i8* %tmp11, align 1, !tbaa !1258
  store i8 0, i8* %tmp12, align 1, !tbaa !1259
  store i8 0, i8* %tmp9, align 1, !tbaa !1256
  br i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null), label %block_40077d, label %block_400778

block_40077d:                                     ; preds = %block_400778, %block_400768
  %tmp17 = phi i64 [ %tmp6, %block_400768 ], [ %tmp48, %block_400778 ]
  %tmp18 = phi %struct.Memory* [ %arg2, %block_400768 ], [ %tmp47, %block_400778 ]
  %tmp19 = add i64 %tmp17, 8
  %tmp20 = icmp ugt i64 %tmp17, -9
  %tmp21 = zext i1 %tmp20 to i8
  store i8 %tmp21, i8* %tmp7, align 1, !tbaa !1240
  %tmp22 = trunc i64 %tmp19 to i32
  %tmp23 = and i32 %tmp22, 255
  %tmp24 = tail call i32 @llvm.ctpop.i32(i32 %tmp23) #15, !range !1254
  %tmp25 = trunc i32 %tmp24 to i8
  %tmp26 = and i8 %tmp25, 1
  %tmp27 = xor i8 %tmp26, 1
  store i8 %tmp27, i8* %tmp8, align 1, !tbaa !1255
  %tmp28 = xor i64 %tmp19, %tmp17
  %tmp29 = lshr i64 %tmp28, 4
  %tmp30 = trunc i64 %tmp29 to i8
  %tmp31 = and i8 %tmp30, 1
  store i8 %tmp31, i8* %tmp9, align 1, !tbaa !1256
  %tmp32 = icmp eq i64 %tmp19, 0
  %tmp33 = zext i1 %tmp32 to i8
  store i8 %tmp33, i8* %tmp10, align 1, !tbaa !1257
  %tmp34 = lshr i64 %tmp19, 63
  %tmp35 = trunc i64 %tmp34 to i8
  store i8 %tmp35, i8* %tmp11, align 1, !tbaa !1258
  %tmp36 = lshr i64 %tmp17, 63
  %tmp37 = xor i64 %tmp34, %tmp36
  %tmp38 = add nuw nsw i64 %tmp37, %tmp34
  %tmp39 = icmp eq i64 %tmp38, 2
  %tmp40 = zext i1 %tmp39 to i8
  store i8 %tmp40, i8* %tmp12, align 1, !tbaa !1259
  %tmp41 = inttoptr i64 %tmp19 to i64*
  %tmp42 = load i64, i64* %tmp41, align 8
  store i64 %tmp42, i64* %tmp, align 8, !tbaa !1231
  %tmp43 = add i64 %tmp17, 16
  store i64 %tmp43, i64* %tmp4, align 8, !tbaa !1231
  ret %struct.Memory* %tmp18

block_400778:                                     ; preds = %block_400768
  %tmp44 = add i64 %arg1, add (i64 select (i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null), i64 21, i64 16), i64 5)
  %tmp45 = add i64 %tmp5, -16
  %tmp46 = inttoptr i64 %tmp45 to i64*
  store i64 %tmp44, i64* %tmp46, align 8
  store i64 %tmp45, i64* %tmp4, align 8, !tbaa !1231
  %tmp47 = tail call %struct.Memory* @sub_400860(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  %tmp48 = load i64, i64* %tmp4, align 8
  br label %block_40077d
}

; Function Attrs: noinline
define %struct.Memory* @sub_400860(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_400860:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = load i64, i64* %tmp4, align 8, !alias.scope !1260, !noalias !1263
  %tmp6 = inttoptr i64 %tmp5 to i64*
  %tmp7 = load i64, i64* %tmp6, align 8
  store i64 %tmp7, i64* %tmp, align 8, !alias.scope !1260, !noalias !1263
  %tmp8 = add i64 %tmp5, 8
  store i64 %tmp8, i64* %tmp4, align 8, !alias.scope !1260, !noalias !1263
  %tmp9 = tail call i64 @__gmon_start__(), !noalias !1260
  store i64 %tmp9, i64* %tmp3, align 8, !alias.scope !1260, !noalias !1263
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4008a0_deregister_tm_clones(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_4008a0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  store i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64* %tmp3, align 8, !tbaa !1231
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  store i8 zext (i1 icmp ult (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)) to i8), i8* %tmp4, align 1, !tbaa !1240
  %tmp5 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)) to i32), i32 255)) #15, !range !1265
  %tmp6 = trunc i32 %tmp5 to i8
  %tmp7 = and i8 %tmp6, 1
  %tmp8 = xor i8 %tmp7, 1
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  store i8 %tmp8, i8* %tmp9, align 1, !tbaa !1255
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  store i8 and (i8 trunc (i64 lshr (i64 xor (i64 xor (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64))), i64 4) to i8), i8 1), i8* %tmp10, align 1, !tbaa !1256
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  store i8 zext (i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 0) to i8), i8* %tmp11, align 1, !tbaa !1257
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  store i8 trunc (i64 lshr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 63) to i8), i8* %tmp12, align 1, !tbaa !1258
  %tmp13 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i8 zext (i1 icmp eq (i64 add (i64 xor (i64 lshr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 63), i64 lshr (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 63)), i64 xor (i64 lshr (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 63), i64 lshr (i64 ptrtoint (i64* @stdout to i64), i64 63))), i64 2) to i8), i8* %tmp13, align 1, !tbaa !1259
  br i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 0), label %block_4008c0, label %block_4008ad

block_4008ad:                                     ; preds = %block_4008a0
  store i64 0, i64* %tmp3, align 8, !tbaa !1231
  store i8 0, i8* %tmp4, align 1, !tbaa !1240
  store i8 1, i8* %tmp9, align 1, !tbaa !1255
  store i8 1, i8* %tmp11, align 1, !tbaa !1257
  store i8 0, i8* %tmp12, align 1, !tbaa !1258
  store i8 0, i8* %tmp13, align 1, !tbaa !1259
  store i8 0, i8* %tmp10, align 1, !tbaa !1256
  br label %block_4008c0

block_4008c0:                                     ; preds = %block_4008ad, %block_4008a0
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp15 = load i64, i64* %tmp14, align 8, !tbaa !1231
  %tmp16 = inttoptr i64 %tmp15 to i64*
  %tmp17 = load i64, i64* %tmp16, align 8
  store i64 %tmp17, i64* %tmp, align 8, !tbaa !1231
  %tmp18 = add i64 %tmp15, 8
  store i64 %tmp18, i64* %tmp14, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400c30___libc_csu_init(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone %arg2) local_unnamed_addr #4 {
block_400c30:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0
  %tmp4 = bitcast %union.anon* %tmp3 to i32*
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 31, i32 0
  %tmp6 = bitcast %union.anon* %tmp5 to i32*
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 3, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp10 = getelementptr inbounds %union.anon, %union.anon* %tmp3, i64 0, i32 0
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp13 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 25, i32 0, i32 0
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 27, i32 0, i32 0
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 29, i32 0, i32 0
  %tmp16 = getelementptr inbounds %union.anon, %union.anon* %tmp5, i64 0, i32 0
  %tmp17 = load i64, i64* %tmp16, align 8
  %tmp18 = load i64, i64* %tmp11, align 8, !tbaa !1231
  %tmp19 = add i64 %tmp18, -8
  %tmp20 = inttoptr i64 %tmp19 to i64*
  store i64 %tmp17, i64* %tmp20, align 8
  %tmp21 = load i64, i64* %tmp15, align 8
  %tmp22 = add i64 %tmp18, -16
  %tmp23 = inttoptr i64 %tmp22 to i64*
  store i64 %tmp21, i64* %tmp23, align 8
  %tmp24 = load i32, i32* %tmp4, align 4
  %tmp25 = zext i32 %tmp24 to i64
  store i64 %tmp25, i64* %tmp16, align 8, !tbaa !1231
  %tmp26 = load i64, i64* %tmp14, align 8
  %tmp27 = add i64 %tmp18, -24
  %tmp28 = inttoptr i64 %tmp27 to i64*
  store i64 %tmp26, i64* %tmp28, align 8
  %tmp29 = load i64, i64* %tmp13, align 8
  %tmp30 = add i64 %tmp18, -32
  %tmp31 = inttoptr i64 %tmp30 to i64*
  store i64 %tmp29, i64* %tmp31, align 8
  store i64 ptrtoint (%seg_601e08__init_array_type* @seg_601e08__init_array to i64), i64* %tmp13, align 8, !tbaa !1231
  %tmp32 = load i64, i64* %tmp12, align 8
  %tmp33 = add i64 %tmp18, -40
  %tmp34 = inttoptr i64 %tmp33 to i64*
  store i64 %tmp32, i64* %tmp34, align 8
  %tmp35 = load i64, i64* %tmp7, align 8
  %tmp36 = add i64 %tmp18, -48
  %tmp37 = inttoptr i64 %tmp36 to i64*
  store i64 %tmp35, i64* %tmp37, align 8
  %tmp38 = load i64, i64* %tmp9, align 8
  store i64 %tmp38, i64* %tmp15, align 8, !tbaa !1231
  %tmp39 = load i64, i64* %tmp8, align 8
  store i64 %tmp39, i64* %tmp14, align 8, !tbaa !1231
  %tmp40 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp41 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp42 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp43 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp44 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp45 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i64 ashr (i64 sub (i64 add (i64 ptrtoint (%seg_601e08__init_array_type* @seg_601e08__init_array to i64), i64 8), i64 ptrtoint (%seg_601e08__init_array_type* @seg_601e08__init_array to i64)), i64 3), i64* %tmp12, align 8, !tbaa !1231
  %tmp46 = add i64 %arg1, -1224
  %tmp47 = add i64 %arg1, 49
  %tmp48 = add i64 %tmp18, -64
  %tmp49 = inttoptr i64 %tmp48 to i64*
  store i64 %tmp47, i64* %tmp49, align 8
  store i64 %tmp48, i64* %tmp11, align 8, !tbaa !1231
  %tmp50 = tail call %struct.Memory* @sub_400768__init_proc(%struct.State* nonnull %arg, i64 %tmp46, %struct.Memory* %arg2)
  %tmp51 = load i64, i64* %tmp12, align 8
  %tmp52 = icmp eq i64 %tmp51, 0
  br i1 %tmp52, label %block_400c86, label %block_400c66

block_400c66:                                     ; preds = %block_400c30
  %tmp53 = load i64, i64* %tmp, align 8
  store i64 0, i64* %tmp7, align 8, !tbaa !1231
  store i8 0, i8* %tmp40, align 1, !tbaa !1240
  store i8 1, i8* %tmp41, align 1, !tbaa !1255
  store i8 1, i8* %tmp43, align 1, !tbaa !1257
  store i8 0, i8* %tmp44, align 1, !tbaa !1258
  store i8 0, i8* %tmp45, align 1, !tbaa !1259
  store i8 0, i8* %tmp42, align 1, !tbaa !1256
  %tmp54 = add i64 %tmp53, 15
  br label %block_400c70

block_400c70:                                     ; preds = %block_400c70, %block_400c66
  %tmp55 = phi i64 [ 0, %block_400c66 ], [ %tmp73, %block_400c70 ]
  %tmp56 = phi i64 [ %tmp54, %block_400c66 ], [ %tmp101, %block_400c70 ]
  %tmp57 = load i64, i64* %tmp14, align 8
  store i64 %tmp57, i64* %tmp8, align 8, !tbaa !1231
  %tmp58 = load i64, i64* %tmp15, align 8
  store i64 %tmp58, i64* %tmp9, align 8, !tbaa !1231
  %tmp59 = load i32, i32* %tmp6, align 4
  %tmp60 = zext i32 %tmp59 to i64
  store i64 %tmp60, i64* %tmp10, align 8, !tbaa !1231
  %tmp61 = load i64, i64* %tmp13, align 8
  %tmp62 = shl i64 %tmp55, 3
  %tmp63 = add i64 %tmp61, %tmp62
  %tmp64 = add i64 %tmp56, 13
  %tmp65 = load i64, i64* %tmp11, align 8, !tbaa !1231
  %tmp66 = add i64 %tmp65, -8
  %tmp67 = inttoptr i64 %tmp66 to i64*
  store i64 %tmp64, i64* %tmp67, align 8
  store i64 %tmp66, i64* %tmp11, align 8, !tbaa !1231
  %tmp68 = inttoptr i64 %tmp63 to i64*
  %tmp69 = load i64, i64* %tmp68, align 8
  store i64 %tmp69, i64* %tmp, align 8, !tbaa !1231
  %tmp70 = tail call %struct.Memory* @__mcsema_detach_call_value(%struct.State* nonnull %arg, i64 %tmp69, %struct.Memory* %tmp50)
  %tmp71 = load i64, i64* %tmp7, align 8
  %tmp72 = load i64, i64* %tmp, align 8
  %tmp73 = add i64 %tmp71, 1
  store i64 %tmp73, i64* %tmp7, align 8, !tbaa !1231
  %tmp74 = lshr i64 %tmp73, 63
  %tmp75 = load i64, i64* %tmp12, align 8
  %tmp76 = sub i64 %tmp73, %tmp75
  %tmp77 = icmp ult i64 %tmp73, %tmp75
  %tmp78 = zext i1 %tmp77 to i8
  store i8 %tmp78, i8* %tmp40, align 1, !tbaa !1240
  %tmp79 = trunc i64 %tmp76 to i32
  %tmp80 = and i32 %tmp79, 255
  %tmp81 = tail call i32 @llvm.ctpop.i32(i32 %tmp80) #15, !range !1254
  %tmp82 = trunc i32 %tmp81 to i8
  %tmp83 = and i8 %tmp82, 1
  %tmp84 = xor i8 %tmp83, 1
  store i8 %tmp84, i8* %tmp41, align 1, !tbaa !1255
  %tmp85 = xor i64 %tmp75, %tmp73
  %tmp86 = xor i64 %tmp85, %tmp76
  %tmp87 = lshr i64 %tmp86, 4
  %tmp88 = trunc i64 %tmp87 to i8
  %tmp89 = and i8 %tmp88, 1
  store i8 %tmp89, i8* %tmp42, align 1, !tbaa !1256
  %tmp90 = icmp eq i64 %tmp76, 0
  %tmp91 = zext i1 %tmp90 to i8
  store i8 %tmp91, i8* %tmp43, align 1, !tbaa !1257
  %tmp92 = lshr i64 %tmp76, 63
  %tmp93 = trunc i64 %tmp92 to i8
  store i8 %tmp93, i8* %tmp44, align 1, !tbaa !1258
  %tmp94 = lshr i64 %tmp75, 63
  %tmp95 = xor i64 %tmp94, %tmp74
  %tmp96 = xor i64 %tmp92, %tmp74
  %tmp97 = add nuw nsw i64 %tmp96, %tmp95
  %tmp98 = icmp eq i64 %tmp97, 2
  %tmp99 = zext i1 %tmp98 to i8
  store i8 %tmp99, i8* %tmp45, align 1, !tbaa !1259
  %tmp100 = select i1 %tmp90, i64 9, i64 -13
  %tmp101 = add i64 %tmp100, %tmp72
  br i1 %tmp90, label %block_400c86, label %block_400c70

block_400c86:                                     ; preds = %block_400c70, %block_400c30
  %tmp102 = load i64, i64* %tmp11, align 8
  %tmp103 = add i64 %tmp102, 8
  %tmp104 = icmp ugt i64 %tmp102, -9
  %tmp105 = zext i1 %tmp104 to i8
  store i8 %tmp105, i8* %tmp40, align 1, !tbaa !1240
  %tmp106 = trunc i64 %tmp103 to i32
  %tmp107 = and i32 %tmp106, 255
  %tmp108 = tail call i32 @llvm.ctpop.i32(i32 %tmp107) #15, !range !1254
  %tmp109 = trunc i32 %tmp108 to i8
  %tmp110 = and i8 %tmp109, 1
  %tmp111 = xor i8 %tmp110, 1
  store i8 %tmp111, i8* %tmp41, align 1, !tbaa !1255
  %tmp112 = xor i64 %tmp103, %tmp102
  %tmp113 = lshr i64 %tmp112, 4
  %tmp114 = trunc i64 %tmp113 to i8
  %tmp115 = and i8 %tmp114, 1
  store i8 %tmp115, i8* %tmp42, align 1, !tbaa !1256
  %tmp116 = icmp eq i64 %tmp103, 0
  %tmp117 = zext i1 %tmp116 to i8
  store i8 %tmp117, i8* %tmp43, align 1, !tbaa !1257
  %tmp118 = lshr i64 %tmp103, 63
  %tmp119 = trunc i64 %tmp118 to i8
  store i8 %tmp119, i8* %tmp44, align 1, !tbaa !1258
  %tmp120 = lshr i64 %tmp102, 63
  %tmp121 = xor i64 %tmp118, %tmp120
  %tmp122 = add nuw nsw i64 %tmp121, %tmp118
  %tmp123 = icmp eq i64 %tmp122, 2
  %tmp124 = zext i1 %tmp123 to i8
  store i8 %tmp124, i8* %tmp45, align 1, !tbaa !1259
  %tmp125 = add i64 %tmp102, 16
  %tmp126 = inttoptr i64 %tmp103 to i64*
  %tmp127 = load i64, i64* %tmp126, align 8
  store i64 %tmp127, i64* %tmp7, align 8, !tbaa !1231
  %tmp128 = add i64 %tmp102, 24
  %tmp129 = inttoptr i64 %tmp125 to i64*
  %tmp130 = load i64, i64* %tmp129, align 8
  store i64 %tmp130, i64* %tmp12, align 8, !tbaa !1231
  %tmp131 = add i64 %tmp102, 32
  %tmp132 = inttoptr i64 %tmp128 to i64*
  %tmp133 = load i64, i64* %tmp132, align 8
  store i64 %tmp133, i64* %tmp13, align 8, !tbaa !1231
  %tmp134 = add i64 %tmp102, 40
  %tmp135 = inttoptr i64 %tmp131 to i64*
  %tmp136 = load i64, i64* %tmp135, align 8
  store i64 %tmp136, i64* %tmp14, align 8, !tbaa !1231
  %tmp137 = add i64 %tmp102, 48
  %tmp138 = inttoptr i64 %tmp134 to i64*
  %tmp139 = load i64, i64* %tmp138, align 8
  store i64 %tmp139, i64* %tmp15, align 8, !tbaa !1231
  %tmp140 = add i64 %tmp102, 56
  %tmp141 = inttoptr i64 %tmp137 to i64*
  %tmp142 = load i64, i64* %tmp141, align 8
  store i64 %tmp142, i64* %tmp16, align 8, !tbaa !1231
  %tmp143 = inttoptr i64 %tmp140 to i64*
  %tmp144 = load i64, i64* %tmp143, align 8
  store i64 %tmp144, i64* %tmp, align 8, !tbaa !1231
  %tmp145 = add i64 %tmp102, 64
  store i64 %tmp145, i64* %tmp11, align 8, !tbaa !1231
  ret %struct.Memory* %tmp50
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400790(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400790:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_602000__got_plt_type* @seg_602000__got_plt to i64), i64 8) to i64*), align 8
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = load i64, i64* %tmp4, align 8, !tbaa !1231
  %tmp6 = add i64 %tmp5, -8
  %tmp7 = inttoptr i64 %tmp6 to i64*
  store i64 %tmp3, i64* %tmp7, align 8
  store i64 %tmp6, i64* %tmp4, align 8, !tbaa !1231
  %tmp8 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_602000__got_plt_type* @seg_602000__got_plt to i64), i64 16) to i64*), align 16
  store i64 %tmp8, i64* %tmp, align 8, !tbaa !1231
  %tmp9 = icmp eq i64 %tmp8, 4196252
  br i1 %tmp9, label %block_40079c, label %bb

block_40079c:                                     ; preds = %block_400790
  store i64 4196256, i64* %tmp, align 8
  %tmp10 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull undef, i64 undef, %struct.Memory* undef)
  unreachable

bb:                                               ; preds = %block_400790
  %tmp11 = tail call %struct.Memory* @__mcsema_detach_call_value(%struct.State* nonnull %arg, i64 %tmp8, %struct.Memory* %arg2)
  ret %struct.Memory* %tmp11
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400910___do_global_dtors_aux(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400910:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp4 = load i8, i8* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 8) to i8*), align 8
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  store i8 0, i8* %tmp5, align 1, !tbaa !1240
  %tmp6 = zext i8 %tmp4 to i32
  %tmp7 = tail call i32 @llvm.ctpop.i32(i32 %tmp6) #15, !range !1254
  %tmp8 = trunc i32 %tmp7 to i8
  %tmp9 = and i8 %tmp8, 1
  %tmp10 = xor i8 %tmp9, 1
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  store i8 %tmp10, i8* %tmp11, align 1, !tbaa !1255
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  store i8 0, i8* %tmp12, align 1, !tbaa !1256
  %tmp13 = icmp eq i8 %tmp4, 0
  %tmp14 = zext i1 %tmp13 to i8
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  store i8 %tmp14, i8* %tmp15, align 1, !tbaa !1257
  %tmp16 = lshr i8 %tmp4, 7
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  store i8 %tmp16, i8* %tmp17, align 1, !tbaa !1258
  %tmp18 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i8 0, i8* %tmp18, align 1, !tbaa !1259
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  br i1 %tmp13, label %block_400919, label %block_400930

block_400930:                                     ; preds = %block_400910
  %tmp20 = load i64, i64* %tmp19, align 8, !tbaa !1231
  %tmp21 = inttoptr i64 %tmp20 to i64*
  %tmp22 = load i64, i64* %tmp21, align 8
  store i64 %tmp22, i64* %tmp, align 8, !tbaa !1231
  %tmp23 = add i64 %tmp20, 8
  store i64 %tmp23, i64* %tmp19, align 8, !tbaa !1231
  ret %struct.Memory* %arg2

block_400919:                                     ; preds = %block_400910
  %tmp24 = load i64, i64* %tmp3, align 8
  %tmp25 = load i64, i64* %tmp19, align 8, !tbaa !1231
  %tmp26 = add i64 %tmp25, -8
  %tmp27 = inttoptr i64 %tmp26 to i64*
  store i64 %tmp24, i64* %tmp27, align 8
  store i64 %tmp26, i64* %tmp3, align 8, !tbaa !1231
  %tmp28 = add i64 %arg1, 18
  %tmp29 = add i64 %tmp25, -16
  %tmp30 = inttoptr i64 %tmp29 to i64*
  store i64 %tmp28, i64* %tmp30, align 8
  store i64 %tmp29, i64* %tmp19, align 8, !tbaa !1231
  %tmp31 = tail call %struct.Memory* @sub_4008a0_deregister_tm_clones(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  store i8 1, i8* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 8) to i8*), align 8
  %tmp32 = load i64, i64* %tmp19, align 8, !tbaa !1231
  %tmp33 = add i64 %tmp32, 8
  %tmp34 = inttoptr i64 %tmp32 to i64*
  %tmp35 = load i64, i64* %tmp34, align 8
  store i64 %tmp35, i64* %tmp3, align 8, !tbaa !1231
  %tmp36 = inttoptr i64 %tmp33 to i64*
  %tmp37 = load i64, i64* %tmp36, align 8
  store i64 %tmp37, i64* %tmp, align 8, !tbaa !1231
  %tmp38 = add i64 %tmp32, 16
  store i64 %tmp38, i64* %tmp19, align 8, !tbaa !1231
  ret %struct.Memory* %tmp31
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400ca4__term_proc(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400ca4:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp4 = load i64, i64* %tmp3, align 8
  %tmp5 = add i64 %tmp4, -8
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp8 = xor i64 %tmp5, %tmp4
  %tmp9 = lshr i64 %tmp8, 4
  %tmp10 = trunc i64 %tmp9 to i8
  %tmp11 = and i8 %tmp10, 1
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp13 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp14 = lshr i64 %tmp5, 63
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp16 = lshr i64 %tmp4, 63
  %tmp17 = xor i64 %tmp14, %tmp16
  %tmp18 = add nuw nsw i64 %tmp17, %tmp16
  %tmp19 = icmp eq i64 %tmp18, 2
  %tmp20 = zext i1 %tmp19 to i8
  %tmp21 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp22 = icmp ult i64 %tmp4, 8
  %tmp23 = zext i1 %tmp22 to i8
  store i8 %tmp23, i8* %tmp6, align 1, !tbaa !1240
  %tmp24 = trunc i64 %tmp4 to i32
  %tmp25 = and i32 %tmp24, 255
  %tmp26 = tail call i32 @llvm.ctpop.i32(i32 %tmp25) #15, !range !1254
  %tmp27 = trunc i32 %tmp26 to i8
  %tmp28 = and i8 %tmp27, 1
  %tmp29 = xor i8 %tmp28, 1
  store i8 %tmp29, i8* %tmp7, align 1, !tbaa !1255
  store i8 %tmp11, i8* %tmp12, align 1, !tbaa !1256
  %tmp30 = icmp eq i64 %tmp4, 0
  %tmp31 = zext i1 %tmp30 to i8
  store i8 %tmp31, i8* %tmp13, align 1, !tbaa !1257
  %tmp32 = trunc i64 %tmp16 to i8
  store i8 %tmp32, i8* %tmp15, align 1, !tbaa !1258
  store i8 %tmp20, i8* %tmp21, align 1, !tbaa !1259
  %tmp33 = inttoptr i64 %tmp4 to i64*
  %tmp34 = load i64, i64* %tmp33, align 8
  store i64 %tmp34, i64* %tmp, align 8, !tbaa !1231
  %tmp35 = add i64 %tmp4, 8
  store i64 %tmp35, i64* %tmp3, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400990_foo(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_400990:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 5, i32 7, i32 0, i32 0
  %tmp6 = load i64, i64* %tmp4, align 8
  %tmp7 = load i64, i64* %tmp3, align 8, !tbaa !1231
  %tmp8 = add i64 %tmp7, -8
  %tmp9 = inttoptr i64 %tmp8 to i64*
  store i64 %tmp6, i64* %tmp9, align 8
  store i64 %tmp8, i64* %tmp4, align 8, !tbaa !1231
  %tmp10 = add i64 %tmp7, -24
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp13 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp16 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp17 = load i64, i64* %tmp5, align 8
  %tmp18 = add i64 %tmp17, -8
  %tmp19 = inttoptr i64 %tmp18 to i32*
  %tmp20 = load i32, i32* %tmp19, align 4
  %tmp21 = zext i32 %tmp20 to i64
  %tmp22 = add i64 %tmp17, -4
  %tmp23 = inttoptr i64 %tmp22 to i32*
  %tmp24 = load i32, i32* %tmp23, align 4
  %tmp25 = zext i32 %tmp24 to i64
  %tmp26 = add i64 %arg1, 41
  %tmp27 = add i64 %tmp7, -32
  %tmp28 = inttoptr i64 %tmp27 to i64*
  store i64 %tmp26, i64* %tmp28, align 8
  %tmp29 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp30 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp31 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  %tmp32 = load i64, i64* %tmp29, align 8, !alias.scope !1266, !noalias !1269
  %tmp33 = load i64, i64* %tmp30, align 8, !alias.scope !1266, !noalias !1269
  %tmp34 = load i64, i64* %tmp31, align 8, !alias.scope !1266, !noalias !1269
  %tmp35 = inttoptr i64 %tmp10 to i64*
  %tmp36 = load i64, i64* %tmp35, align 8
  %tmp37 = add i64 %tmp7, -16
  %tmp38 = inttoptr i64 %tmp37 to i64*
  %tmp39 = load i64, i64* %tmp38, align 8
  %tmp40 = load i64, i64* %tmp9, align 8
  %tmp41 = inttoptr i64 %tmp7 to i64*
  %tmp42 = load i64, i64* %tmp41, align 8
  %tmp43 = add i64 %tmp7, 8
  %tmp44 = inttoptr i64 %tmp43 to i64*
  %tmp45 = load i64, i64* %tmp44, align 8
  %tmp46 = add i64 %tmp7, 16
  %tmp47 = inttoptr i64 %tmp46 to i64*
  %tmp48 = load i64, i64* %tmp47, align 8
  %tmp49 = add i64 %tmp7, 24
  %tmp50 = inttoptr i64 %tmp49 to i64*
  %tmp51 = load i64, i64* %tmp50, align 8
  %tmp52 = add i64 %tmp7, 32
  %tmp53 = inttoptr i64 %tmp52 to i64*
  %tmp54 = load i64, i64* %tmp53, align 8
  %tmp55 = add i64 %tmp7, 40
  %tmp56 = inttoptr i64 %tmp55 to i64*
  %tmp57 = load i64, i64* %tmp56, align 8
  %tmp58 = add i64 %tmp7, 48
  %tmp59 = inttoptr i64 %tmp58 to i64*
  %tmp60 = load i64, i64* %tmp59, align 8
  %tmp61 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 27), i64 %tmp21, i64 %tmp25, i64 %tmp32, i64 %tmp33, i64 %tmp34, i64 %tmp36, i64 %tmp39, i64 %tmp40, i64 %tmp42, i64 %tmp45, i64 %tmp48, i64 %tmp51, i64 %tmp54, i64 %tmp57, i64 %tmp60), !noalias !1266
  %tmp62 = add i64 %tmp7, -12
  %tmp63 = trunc i64 %tmp61 to i32
  %tmp64 = inttoptr i64 %tmp62 to i32*
  store i32 %tmp63, i32* %tmp64, align 4
  %tmp65 = add i64 %arg1, -64
  %tmp66 = add i64 %arg1, 49
  store i64 %tmp66, i64* %tmp28, align 8
  store i64 %tmp27, i64* %tmp3, align 8, !tbaa !1231
  %tmp67 = tail call %struct.Memory* @sub_400950_bar(%struct.State* nonnull %arg, i64 %tmp65, %struct.Memory* %arg2)
  %tmp68 = load i64, i64* %tmp3, align 8
  %tmp69 = add i64 %tmp68, 16
  %tmp70 = icmp ugt i64 %tmp68, -17
  %tmp71 = zext i1 %tmp70 to i8
  store i8 %tmp71, i8* %tmp11, align 1, !tbaa !1240
  %tmp72 = trunc i64 %tmp69 to i32
  %tmp73 = and i32 %tmp72, 255
  %tmp74 = tail call i32 @llvm.ctpop.i32(i32 %tmp73) #15, !range !1254
  %tmp75 = trunc i32 %tmp74 to i8
  %tmp76 = and i8 %tmp75, 1
  %tmp77 = xor i8 %tmp76, 1
  store i8 %tmp77, i8* %tmp12, align 1, !tbaa !1255
  %tmp78 = xor i64 %tmp68, 16
  %tmp79 = xor i64 %tmp78, %tmp69
  %tmp80 = lshr i64 %tmp79, 4
  %tmp81 = trunc i64 %tmp80 to i8
  %tmp82 = and i8 %tmp81, 1
  store i8 %tmp82, i8* %tmp13, align 1, !tbaa !1256
  %tmp83 = icmp eq i64 %tmp69, 0
  %tmp84 = zext i1 %tmp83 to i8
  store i8 %tmp84, i8* %tmp14, align 1, !tbaa !1257
  %tmp85 = lshr i64 %tmp69, 63
  %tmp86 = trunc i64 %tmp85 to i8
  store i8 %tmp86, i8* %tmp15, align 1, !tbaa !1258
  %tmp87 = lshr i64 %tmp68, 63
  %tmp88 = xor i64 %tmp85, %tmp87
  %tmp89 = add nuw nsw i64 %tmp88, %tmp85
  %tmp90 = icmp eq i64 %tmp89, 2
  %tmp91 = zext i1 %tmp90 to i8
  store i8 %tmp91, i8* %tmp16, align 1, !tbaa !1259
  %tmp92 = add i64 %tmp68, 24
  %tmp93 = inttoptr i64 %tmp69 to i64*
  %tmp94 = load i64, i64* %tmp93, align 8
  store i64 %tmp94, i64* %tmp4, align 8, !tbaa !1231
  %tmp95 = inttoptr i64 %tmp92 to i64*
  %tmp96 = load i64, i64* %tmp95, align 8
  store i64 %tmp96, i64* %tmp, align 8, !tbaa !1231
  %tmp97 = add i64 %tmp68, 32
  store i64 %tmp97, i64* %tmp3, align 8, !tbaa !1231
  ret %struct.Memory* %tmp67
}

; Function Attrs: noinline
define %struct.Memory* @sub_4009d0_theThread(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_4009d0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 5, i32 7, i32 0, i32 0
  %tmp10 = load i64, i64* %tmp8, align 8
  %tmp11 = load i64, i64* %tmp7, align 8, !tbaa !1231
  %tmp12 = add i64 %tmp11, -8
  %tmp13 = inttoptr i64 %tmp12 to i64*
  store i64 %tmp10, i64* %tmp13, align 8
  store i64 %tmp12, i64* %tmp8, align 8, !tbaa !1231
  %tmp14 = add i64 %tmp11, -56
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp16 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp18 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp20 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp21 = add i64 %tmp11, -16
  %tmp22 = load i64, i64* %tmp6, align 8
  %tmp23 = inttoptr i64 %tmp21 to i64*
  store i64 %tmp22, i64* %tmp23, align 8
  %tmp24 = add i64 %tmp11, -32
  %tmp25 = inttoptr i64 %tmp24 to i64*
  store i64 zext (i32 trunc (i64 and (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16), i64 4294967295) to i32) to i64), i64* %tmp25, align 8
  %tmp26 = add i64 %arg1, 28
  %tmp27 = add i64 %tmp11, -64
  %tmp28 = inttoptr i64 %tmp27 to i64*
  store i64 %tmp26, i64* %tmp28, align 8
  store i64 %tmp26, i64* %tmp, align 8, !alias.scope !1271, !noalias !1274
  store i64 %tmp14, i64* %tmp7, align 8, !alias.scope !1271, !noalias !1274
  %tmp29 = tail call i64 @pthread_mutex_lock(i64 zext (i32 trunc (i64 and (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16), i64 4294967295) to i32) to i64)), !noalias !1271
  %tmp30 = load i64, i64* %tmp8, align 8
  %tmp31 = add i64 %tmp30, -24
  %tmp32 = inttoptr i64 %tmp31 to i64*
  %tmp33 = load i64, i64* %tmp32, align 8
  %tmp34 = add i64 %tmp30, -28
  %tmp35 = trunc i64 %tmp29 to i32
  %tmp36 = inttoptr i64 %tmp34 to i32*
  store i32 %tmp35, i32* %tmp36, align 4
  %tmp37 = add i64 %arg1, 47
  %tmp38 = load i64, i64* %tmp7, align 8, !tbaa !1231
  %tmp39 = add i64 %tmp38, -8
  %tmp40 = inttoptr i64 %tmp39 to i64*
  store i64 %tmp37, i64* %tmp40, align 8
  store i64 %tmp37, i64* %tmp, align 8, !alias.scope !1276, !noalias !1279
  store i64 %tmp38, i64* %tmp7, align 8, !alias.scope !1276, !noalias !1279
  %tmp41 = tail call i64 @pthread_cond_wait(i64 zext (i32 trunc (i64 and (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 56), i64 4294967295) to i32) to i64), i64 %tmp33), !noalias !1276
  %tmp42 = load i32, i32* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 104) to i32*), align 8
  %tmp43 = add i32 %tmp42, 1
  store i32 %tmp43, i32* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 104) to i32*), align 8
  %tmp44 = load i64, i64* %tmp8, align 8
  %tmp45 = add i64 %tmp44, -8
  %tmp46 = inttoptr i64 %tmp45 to i64*
  %tmp47 = load i64, i64* %tmp46, align 8
  %tmp48 = add i64 %tmp44, -16
  %tmp49 = inttoptr i64 %tmp48 to i64*
  store i64 %tmp47, i64* %tmp49, align 8
  %tmp50 = inttoptr i64 %tmp47 to i32*
  %tmp51 = load i32, i32* %tmp50, align 4
  %tmp52 = load i64, i64* %tmp9, align 8
  %tmp53 = add i64 %tmp52, -8
  %tmp54 = inttoptr i64 %tmp53 to i32*
  store i32 %tmp51, i32* %tmp54, align 4
  %tmp55 = load i64, i64* %tmp49, align 8
  %tmp56 = add i64 %tmp55, 4
  %tmp57 = inttoptr i64 %tmp56 to i32*
  %tmp58 = load i32, i32* %tmp57, align 4
  %tmp59 = zext i32 %tmp58 to i64
  store i64 %tmp59, i64* %tmp4, align 8, !tbaa !1231
  %tmp60 = add i64 %tmp52, -4
  %tmp61 = inttoptr i64 %tmp60 to i32*
  store i32 %tmp58, i32* %tmp61, align 4
  %tmp62 = add i64 %tmp44, -32
  %tmp63 = trunc i64 %tmp41 to i32
  %tmp64 = inttoptr i64 %tmp62 to i32*
  store i32 %tmp63, i32* %tmp64, align 4
  %tmp65 = add i64 %arg1, -64
  %tmp66 = add i64 %arg1, 106
  %tmp67 = load i64, i64* %tmp7, align 8, !tbaa !1231
  %tmp68 = add i64 %tmp67, -8
  %tmp69 = inttoptr i64 %tmp68 to i64*
  store i64 %tmp66, i64* %tmp69, align 8
  store i64 %tmp68, i64* %tmp7, align 8, !tbaa !1231
  %tmp70 = tail call %struct.Memory* @sub_400990_foo(%struct.State* nonnull %arg, i64 %tmp65, %struct.Memory* %arg2)
  %tmp71 = load i64, i64* %tmp, align 8
  store i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16), i64* %tmp6, align 8, !tbaa !1231
  %tmp72 = add i64 %tmp71, 15
  %tmp73 = load i64, i64* %tmp7, align 8, !tbaa !1231
  %tmp74 = add i64 %tmp73, -8
  %tmp75 = inttoptr i64 %tmp74 to i64*
  store i64 %tmp72, i64* %tmp75, align 8
  store i64 %tmp73, i64* %tmp7, align 8, !alias.scope !1281, !noalias !1284
  %tmp76 = tail call i64 @pthread_mutex_unlock(i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16)), !noalias !1281
  store i64 0, i64* %tmp4, align 8, !tbaa !1231
  store i64 0, i64* %tmp5, align 8, !tbaa !1231
  %tmp77 = load i64, i64* %tmp8, align 8
  %tmp78 = add i64 %tmp77, -36
  %tmp79 = trunc i64 %tmp76 to i32
  %tmp80 = inttoptr i64 %tmp78 to i32*
  store i32 %tmp79, i32* %tmp80, align 4
  store i64 0, i64* %tmp3, align 8, !tbaa !1231
  %tmp81 = load i64, i64* %tmp7, align 8
  %tmp82 = add i64 %tmp81, 48
  %tmp83 = icmp ugt i64 %tmp81, -49
  %tmp84 = zext i1 %tmp83 to i8
  store i8 %tmp84, i8* %tmp15, align 1, !tbaa !1240
  %tmp85 = trunc i64 %tmp82 to i32
  %tmp86 = and i32 %tmp85, 255
  %tmp87 = tail call i32 @llvm.ctpop.i32(i32 %tmp86) #15, !range !1254
  %tmp88 = trunc i32 %tmp87 to i8
  %tmp89 = and i8 %tmp88, 1
  %tmp90 = xor i8 %tmp89, 1
  store i8 %tmp90, i8* %tmp16, align 1, !tbaa !1255
  %tmp91 = xor i64 %tmp81, 16
  %tmp92 = xor i64 %tmp91, %tmp82
  %tmp93 = lshr i64 %tmp92, 4
  %tmp94 = trunc i64 %tmp93 to i8
  %tmp95 = and i8 %tmp94, 1
  store i8 %tmp95, i8* %tmp17, align 1, !tbaa !1256
  %tmp96 = icmp eq i64 %tmp82, 0
  %tmp97 = zext i1 %tmp96 to i8
  store i8 %tmp97, i8* %tmp18, align 1, !tbaa !1257
  %tmp98 = lshr i64 %tmp82, 63
  %tmp99 = trunc i64 %tmp98 to i8
  store i8 %tmp99, i8* %tmp19, align 1, !tbaa !1258
  %tmp100 = lshr i64 %tmp81, 63
  %tmp101 = xor i64 %tmp98, %tmp100
  %tmp102 = add nuw nsw i64 %tmp101, %tmp98
  %tmp103 = icmp eq i64 %tmp102, 2
  %tmp104 = zext i1 %tmp103 to i8
  store i8 %tmp104, i8* %tmp20, align 1, !tbaa !1259
  %tmp105 = add i64 %tmp81, 56
  %tmp106 = inttoptr i64 %tmp82 to i64*
  %tmp107 = load i64, i64* %tmp106, align 8
  store i64 %tmp107, i64* %tmp8, align 8, !tbaa !1231
  %tmp108 = inttoptr i64 %tmp105 to i64*
  %tmp109 = load i64, i64* %tmp108, align 8
  store i64 %tmp109, i64* %tmp, align 8, !tbaa !1231
  %tmp110 = add i64 %tmp81, 64
  store i64 %tmp110, i64* %tmp7, align 8, !tbaa !1231
  ret %struct.Memory* %tmp70
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4008d0_register_tm_clones(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_4008d0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64* %tmp3, align 8, !tbaa !1231
  store i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1), i64* %tmp4, align 8, !tbaa !1231
  store i8 and (i8 trunc (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)) to i8), i8 1), i8* %tmp5, align 1, !tbaa !1286
  %tmp11 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1) to i32), i32 255)) #15, !range !1254
  %tmp12 = trunc i32 %tmp11 to i8
  %tmp13 = and i8 %tmp12, 1
  %tmp14 = xor i8 %tmp13, 1
  store i8 %tmp14, i8* %tmp6, align 1, !tbaa !1286
  store i8 0, i8* %tmp7, align 1, !tbaa !1286
  store i8 zext (i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1), i64 0) to i8), i8* %tmp8, align 1, !tbaa !1286
  store i8 trunc (i64 lshr (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1), i64 63) to i8), i8* %tmp9, align 1, !tbaa !1286
  store i8 0, i8* %tmp10, align 1, !tbaa !1286
  br i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (i64* @stdout to i64), i64 4294967295), i64 ptrtoint (i64* @stdout to i64)), i64 3)), i64 1), i64 0), label %block_400900, label %block_4008ef

block_4008ef:                                     ; preds = %block_4008d0
  store i64 0, i64* %tmp3, align 8, !tbaa !1231
  store i8 0, i8* %tmp5, align 1, !tbaa !1240
  store i8 1, i8* %tmp6, align 1, !tbaa !1255
  store i8 1, i8* %tmp8, align 1, !tbaa !1257
  store i8 0, i8* %tmp9, align 1, !tbaa !1258
  store i8 0, i8* %tmp10, align 1, !tbaa !1259
  store i8 0, i8* %tmp7, align 1, !tbaa !1256
  br label %block_400900

block_400900:                                     ; preds = %block_4008ef, %block_4008d0
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp16 = load i64, i64* %tmp15, align 8, !tbaa !1231
  %tmp17 = inttoptr i64 %tmp16 to i64*
  %tmp18 = load i64, i64* %tmp17, align 8
  store i64 %tmp18, i64* %tmp, align 8, !tbaa !1231
  %tmp19 = add i64 %tmp16, 8
  store i64 %tmp19, i64* %tmp15, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline noreturn
define noalias nonnull %struct.Memory* @sub_400870__start(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias nocapture readnone %arg2) local_unnamed_addr #6 {
block_400870:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  store i64 0, i64* %tmp9, align 8, !tbaa !1231
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp13 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp16 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp18 = load i64, i64* %tmp5, align 8
  store i64 %tmp18, i64* %tmp11, align 8, !tbaa !1231
  %tmp19 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp20 = add i64 %tmp19, 8
  %tmp21 = inttoptr i64 %tmp19 to i64*
  %tmp22 = load i64, i64* %tmp21, align 8
  store i64 %tmp22, i64* %tmp6, align 8, !tbaa !1231
  store i64 %tmp20, i64* %tmp5, align 8, !tbaa !1231
  %tmp23 = and i64 %tmp20, -16
  store i8 0, i8* %tmp12, align 1, !tbaa !1240
  %tmp24 = trunc i64 %tmp20 to i32
  %tmp25 = and i32 %tmp24, 240
  %tmp26 = tail call i32 @llvm.ctpop.i32(i32 %tmp25) #15, !range !1287
  %tmp27 = trunc i32 %tmp26 to i8
  %tmp28 = and i8 %tmp27, 1
  %tmp29 = xor i8 %tmp28, 1
  store i8 %tmp29, i8* %tmp13, align 1, !tbaa !1255
  %tmp30 = icmp eq i64 %tmp23, 0
  %tmp31 = zext i1 %tmp30 to i8
  store i8 %tmp31, i8* %tmp14, align 1, !tbaa !1257
  %tmp32 = lshr i64 %tmp20, 63
  %tmp33 = trunc i64 %tmp32 to i8
  store i8 %tmp33, i8* %tmp15, align 1, !tbaa !1258
  store i8 0, i8* %tmp16, align 1, !tbaa !1259
  store i8 0, i8* %tmp17, align 1, !tbaa !1256
  %tmp34 = load i64, i64* %tmp3, align 8
  %tmp35 = add i64 %tmp23, -8
  %tmp36 = inttoptr i64 %tmp35 to i64*
  store i64 %tmp34, i64* %tmp36, align 8
  %tmp37 = add i64 %tmp23, -16
  %tmp38 = inttoptr i64 %tmp37 to i64*
  store i64 %tmp35, i64* %tmp38, align 16
  store i64 ptrtoint (i64 ()* @callback_sub_400ca0___libc_csu_fini to i64), i64* %tmp10, align 8, !tbaa !1231
  store i64 ptrtoint (i64 ()* @callback_sub_400c30___libc_csu_init to i64), i64* %tmp4, align 8, !tbaa !1231
  store i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64* %tmp7, align 8, !tbaa !1231
  %tmp39 = add i64 %arg1, 41
  %tmp40 = add i64 %tmp23, -24
  %tmp41 = inttoptr i64 %tmp40 to i64*
  store i64 %tmp39, i64* %tmp41, align 8
  %tmp42 = load i64, i64* %tmp38, align 16
  %tmp43 = load i64, i64* %tmp36, align 8
  store i64 %tmp37, i64* %tmp8, align 8, !alias.scope !1288, !noalias !1291
  %tmp44 = tail call i64 @__libc_start_main(i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64 %tmp22, i64 %tmp20, i64 ptrtoint (i64 ()* @callback_sub_400c30___libc_csu_init to i64), i64 ptrtoint (i64 ()* @callback_sub_400ca0___libc_csu_fini to i64), i64 %tmp18, i64 %tmp42, i64 %tmp43), !noalias !1288
  store i64 %tmp44, i64* %tmp3, align 8, !alias.scope !1288, !noalias !1291
  %tmp45 = add i64 %arg1, 42
  store i64 %tmp45, i64* %tmp, align 8
  %tmp46 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull undef, i64 undef, %struct.Memory* undef)
  unreachable
}

; Function Attrs: noinline
define %struct.Memory* @sub_400a60_main(%struct.State* noalias dereferenceable(3376) %arg, i64 %arg70, %struct.Memory* noalias readnone returned %arg71) local_unnamed_addr #4 {
block_400a60:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp72 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0
  %tmp73 = bitcast %union.anon* %tmp72 to i32*
  %tmp74 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp75 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp76 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp77 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp78 = getelementptr inbounds %union.anon, %union.anon* %tmp72, i64 0, i32 0
  %tmp79 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp80 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp81 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp82 = load i64, i64* %tmp80, align 8
  %tmp83 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp84 = add i64 %tmp83, -8
  %tmp85 = inttoptr i64 %tmp84 to i64*
  store i64 %tmp82, i64* %tmp85, align 8
  store i64 %tmp84, i64* %tmp80, align 8, !tbaa !1231
  %tmp86 = add i64 %tmp83, -120
  %tmp87 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp88 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp89 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp90 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp91 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp92 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp93 = add i64 %tmp83, -12
  %tmp94 = inttoptr i64 %tmp93 to i32*
  store i32 0, i32* %tmp94, align 4
  %tmp95 = add i64 %tmp83, -16
  %tmp96 = load i32, i32* %tmp73, align 4
  %tmp97 = inttoptr i64 %tmp95 to i32*
  store i32 %tmp96, i32* %tmp97, align 4
  %tmp98 = add i64 %tmp83, -24
  %tmp99 = load i64, i64* %tmp77, align 8
  %tmp100 = inttoptr i64 %tmp98 to i64*
  store i64 %tmp99, i64* %tmp100, align 8
  %tmp101 = add i64 %tmp83, -28
  %tmp102 = inttoptr i64 %tmp101 to i32*
  store i32 0, i32* %tmp102, align 4
  %tmp103 = add i64 %arg70, 49
  %tmp104 = add i64 %tmp83, -128
  %tmp105 = inttoptr i64 %tmp104 to i64*
  store i64 %tmp103, i64* %tmp105, align 8
  %tmp106 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  %tmp107 = load i64, i64* %tmp76, align 8, !alias.scope !1293, !noalias !1296
  %tmp108 = load i64, i64* %tmp75, align 8, !alias.scope !1293, !noalias !1296
  %tmp109 = load i64, i64* %tmp81, align 8, !alias.scope !1293, !noalias !1296
  %tmp110 = load i64, i64* %tmp106, align 8, !alias.scope !1293, !noalias !1296
  %tmp111 = inttoptr i64 %tmp86 to i64*
  %tmp112 = load i64, i64* %tmp111, align 8
  %tmp113 = add i64 %tmp83, -112
  %tmp114 = inttoptr i64 %tmp113 to i64*
  %tmp115 = load i64, i64* %tmp114, align 8
  %tmp116 = add i64 %tmp83, -104
  %tmp117 = inttoptr i64 %tmp116 to i64*
  %tmp118 = load i64, i64* %tmp117, align 8
  %tmp119 = add i64 %tmp83, -96
  %tmp120 = inttoptr i64 %tmp119 to i64*
  %tmp121 = load i64, i64* %tmp120, align 8
  %tmp122 = add i64 %tmp83, -88
  %tmp123 = inttoptr i64 %tmp122 to i64*
  %tmp124 = load i64, i64* %tmp123, align 8
  %tmp125 = add i64 %tmp83, -80
  %tmp126 = inttoptr i64 %tmp125 to i64*
  %tmp127 = load i64, i64* %tmp126, align 8
  %tmp128 = add i64 %tmp83, -72
  %tmp129 = inttoptr i64 %tmp128 to i64*
  %tmp130 = load i64, i64* %tmp129, align 8
  %tmp131 = add i64 %tmp83, -64
  %tmp132 = inttoptr i64 %tmp131 to i64*
  %tmp133 = load i64, i64* %tmp132, align 8
  %tmp134 = add i64 %tmp83, -56
  %tmp135 = inttoptr i64 %tmp134 to i64*
  %tmp136 = load i64, i64* %tmp135, align 8
  %tmp137 = add i64 %tmp83, -48
  %tmp138 = inttoptr i64 %tmp137 to i64*
  %tmp139 = load i64, i64* %tmp138, align 8
  store i64 %tmp103, i64* %tmp, align 8, !alias.scope !1293, !noalias !1296
  store i64 %tmp86, i64* %tmp79, align 8, !alias.scope !1293, !noalias !1296
  %tmp140 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 50), i64 %tmp99, i64 %tmp107, i64 %tmp108, i64 %tmp109, i64 %tmp110, i64 %tmp112, i64 %tmp115, i64 %tmp118, i64 %tmp121, i64 %tmp124, i64 %tmp127, i64 %tmp130, i64 %tmp133, i64 %tmp136, i64 %tmp139), !noalias !1293
  %tmp141 = load i64, i64* %tmp, align 8
  %tmp142 = load i64, i64* %tmp80, align 8
  %tmp143 = add i64 %tmp142, -68
  %tmp144 = trunc i64 %tmp140 to i32
  %tmp145 = inttoptr i64 %tmp143 to i32*
  store i32 %tmp144, i32* %tmp145, align 4
  %tmp146 = add i64 %tmp141, 22
  %tmp147 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp148 = add i64 %tmp147, -8
  %tmp149 = inttoptr i64 %tmp148 to i64*
  store i64 %tmp146, i64* %tmp149, align 8
  store i64 %tmp146, i64* %tmp, align 8, !alias.scope !1298, !noalias !1301
  store i64 %tmp147, i64* %tmp79, align 8, !alias.scope !1298, !noalias !1301
  %tmp150 = tail call i64 @pthread_mutex_init(i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 16), i64 0), !noalias !1298
  %tmp151 = load i64, i64* %tmp, align 8
  store i64 0, i64* %tmp75, align 8, !tbaa !1231
  store i64 0, i64* %tmp77, align 8, !tbaa !1231
  %tmp152 = load i64, i64* %tmp80, align 8
  %tmp153 = add i64 %tmp152, -72
  %tmp154 = trunc i64 %tmp150 to i32
  %tmp155 = inttoptr i64 %tmp153 to i32*
  store i32 %tmp154, i32* %tmp155, align 4
  %tmp156 = add i64 %tmp151, 22
  %tmp157 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp158 = add i64 %tmp157, -8
  %tmp159 = inttoptr i64 %tmp158 to i64*
  store i64 %tmp156, i64* %tmp159, align 8
  store i64 %tmp156, i64* %tmp, align 8, !alias.scope !1303, !noalias !1306
  store i64 %tmp157, i64* %tmp79, align 8, !alias.scope !1303, !noalias !1306
  %tmp160 = tail call i64 @pthread_cond_init(i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 56), i64 0), !noalias !1303
  %tmp161 = load i64, i64* %tmp80, align 8
  %tmp162 = add i64 %tmp161, -24
  %tmp163 = load i64, i64* %tmp, align 8
  %tmp164 = inttoptr i64 %tmp162 to i32*
  store i32 0, i32* %tmp164, align 4
  %tmp165 = add i64 %tmp161, -76
  %tmp166 = trunc i64 %tmp160 to i32
  %tmp167 = add i64 %tmp163, 10
  %tmp168 = inttoptr i64 %tmp165 to i32*
  store i32 %tmp166, i32* %tmp168, align 4
  %tmp169 = load i32, i32* %tmp164, align 4
  %tmp170 = add i32 %tmp169, -2
  %tmp171 = lshr i32 %tmp170, 31
  %tmp172 = lshr i32 %tmp169, 31
  %tmp173 = xor i32 %tmp171, %tmp172
  %tmp174 = add nuw nsw i32 %tmp173, %tmp172
  %tmp175 = icmp eq i32 %tmp174, 2
  %tmp176 = icmp ne i32 %tmp171, 0
  %tmp177 = xor i1 %tmp176, %tmp175
  %tmp178 = select i1 %tmp177, i64 10, i64 154
  %tmp179 = add i64 %tmp178, %tmp167
  br i1 %tmp177, label %block_400ad1, label %block_400b61

block_400bda:                                     ; preds = %block_400bbb
  %tmp180 = and i64 %tmp310, 4294967295
  store i64 %tmp180, i64* %tmp77, align 8, !tbaa !1231
  %tmp181 = add i64 %tmp326, 20
  %tmp182 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp183 = add i64 %tmp182, -8
  %tmp184 = inttoptr i64 %tmp183 to i64*
  store i64 %tmp181, i64* %tmp184, align 8
  %tmp185 = load i64, i64* %tmp76, align 8, !alias.scope !1308, !noalias !1311
  %tmp186 = load i64, i64* %tmp75, align 8, !alias.scope !1308, !noalias !1311
  %tmp187 = load i64, i64* %tmp81, align 8, !alias.scope !1308, !noalias !1311
  %tmp188 = load i64, i64* %tmp106, align 8, !alias.scope !1308, !noalias !1311
  %tmp189 = inttoptr i64 %tmp182 to i64*
  %tmp190 = load i64, i64* %tmp189, align 8
  %tmp191 = add i64 %tmp182, 8
  %tmp192 = inttoptr i64 %tmp191 to i64*
  %tmp193 = load i64, i64* %tmp192, align 8
  %tmp194 = add i64 %tmp182, 16
  %tmp195 = inttoptr i64 %tmp194 to i64*
  %tmp196 = load i64, i64* %tmp195, align 8
  %tmp197 = add i64 %tmp182, 24
  %tmp198 = inttoptr i64 %tmp197 to i64*
  %tmp199 = load i64, i64* %tmp198, align 8
  %tmp200 = add i64 %tmp182, 32
  %tmp201 = inttoptr i64 %tmp200 to i64*
  %tmp202 = load i64, i64* %tmp201, align 8
  %tmp203 = add i64 %tmp182, 40
  %tmp204 = inttoptr i64 %tmp203 to i64*
  %tmp205 = load i64, i64* %tmp204, align 8
  %tmp206 = add i64 %tmp182, 48
  %tmp207 = inttoptr i64 %tmp206 to i64*
  %tmp208 = load i64, i64* %tmp207, align 8
  %tmp209 = add i64 %tmp182, 56
  %tmp210 = inttoptr i64 %tmp209 to i64*
  %tmp211 = load i64, i64* %tmp210, align 8
  %tmp212 = add i64 %tmp182, 64
  %tmp213 = inttoptr i64 %tmp212 to i64*
  %tmp214 = load i64, i64* %tmp213, align 8
  %tmp215 = add i64 %tmp182, 72
  %tmp216 = inttoptr i64 %tmp215 to i64*
  %tmp217 = load i64, i64* %tmp216, align 8
  store i64 %tmp181, i64* %tmp, align 8, !alias.scope !1308, !noalias !1311
  store i64 %tmp182, i64* %tmp79, align 8, !alias.scope !1308, !noalias !1311
  %tmp218 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 164), i64 %tmp180, i64 %tmp185, i64 %tmp186, i64 %tmp187, i64 %tmp188, i64 %tmp190, i64 %tmp193, i64 %tmp196, i64 %tmp199, i64 %tmp202, i64 %tmp205, i64 %tmp208, i64 %tmp211, i64 %tmp214, i64 %tmp217), !noalias !1308
  %tmp219 = load i64, i64* %tmp, align 8
  store i64 1, i64* %tmp78, align 8, !tbaa !1231
  %tmp220 = load i64, i64* %tmp80, align 8
  %tmp221 = add i64 %tmp220, -96
  %tmp222 = trunc i64 %tmp218 to i32
  %tmp223 = inttoptr i64 %tmp221 to i32*
  store i32 %tmp222, i32* %tmp223, align 4
  %tmp224 = add i64 %tmp219, 13
  %tmp225 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp226 = add i64 %tmp225, -8
  %tmp227 = inttoptr i64 %tmp226 to i64*
  store i64 %tmp224, i64* %tmp227, align 8
  store i64 %tmp224, i64* %tmp, align 8, !alias.scope !1313, !noalias !1316
  store i64 %tmp225, i64* %tmp79, align 8, !alias.scope !1313, !noalias !1316
  %tmp228 = tail call i64 @exit(i64 1), !noalias !1313
  store i64 %tmp228, i64* %tmp74, align 8, !alias.scope !1313, !noalias !1316
  %tmp229 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull undef, i64 undef, %struct.Memory* undef)
  unreachable

block_400b61:                                     ; preds = %block_400b4e, %block_400a60
  %.lcssa7 = phi i64 [ %tmp179, %block_400a60 ], [ %tmp344, %block_400b4e ]
  %tmp230 = add i64 %.lcssa7, 17
  %tmp231 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp232 = add i64 %tmp231, -8
  %tmp233 = inttoptr i64 %tmp232 to i64*
  store i64 %tmp230, i64* %tmp233, align 8
  %tmp234 = load i64, i64* %tmp77, align 8, !alias.scope !1318, !noalias !1321
  %tmp235 = load i64, i64* %tmp76, align 8, !alias.scope !1318, !noalias !1321
  %tmp236 = load i64, i64* %tmp75, align 8, !alias.scope !1318, !noalias !1321
  %tmp237 = load i64, i64* %tmp81, align 8, !alias.scope !1318, !noalias !1321
  %tmp238 = load i64, i64* %tmp106, align 8, !alias.scope !1318, !noalias !1321
  %tmp239 = inttoptr i64 %tmp231 to i64*
  %tmp240 = load i64, i64* %tmp239, align 8
  %tmp241 = add i64 %tmp231, 8
  %tmp242 = inttoptr i64 %tmp241 to i64*
  %tmp243 = load i64, i64* %tmp242, align 8
  %tmp244 = add i64 %tmp231, 16
  %tmp245 = inttoptr i64 %tmp244 to i64*
  %tmp246 = load i64, i64* %tmp245, align 8
  %tmp247 = add i64 %tmp231, 24
  %tmp248 = inttoptr i64 %tmp247 to i64*
  %tmp249 = load i64, i64* %tmp248, align 8
  %tmp250 = add i64 %tmp231, 32
  %tmp251 = inttoptr i64 %tmp250 to i64*
  %tmp252 = load i64, i64* %tmp251, align 8
  %tmp253 = add i64 %tmp231, 40
  %tmp254 = inttoptr i64 %tmp253 to i64*
  %tmp255 = load i64, i64* %tmp254, align 8
  %tmp256 = add i64 %tmp231, 48
  %tmp257 = inttoptr i64 %tmp256 to i64*
  %tmp258 = load i64, i64* %tmp257, align 8
  %tmp259 = add i64 %tmp231, 56
  %tmp260 = inttoptr i64 %tmp259 to i64*
  %tmp261 = load i64, i64* %tmp260, align 8
  %tmp262 = add i64 %tmp231, 64
  %tmp263 = inttoptr i64 %tmp262 to i64*
  %tmp264 = load i64, i64* %tmp263, align 8
  %tmp265 = add i64 %tmp231, 72
  %tmp266 = inttoptr i64 %tmp265 to i64*
  %tmp267 = load i64, i64* %tmp266, align 8
  store i64 %tmp230, i64* %tmp, align 8, !alias.scope !1318, !noalias !1321
  store i64 %tmp231, i64* %tmp79, align 8, !alias.scope !1318, !noalias !1321
  %tmp268 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 101), i64 %tmp234, i64 %tmp235, i64 %tmp236, i64 %tmp237, i64 %tmp238, i64 %tmp240, i64 %tmp243, i64 %tmp246, i64 %tmp249, i64 %tmp252, i64 %tmp255, i64 %tmp258, i64 %tmp261, i64 %tmp264, i64 %tmp267), !noalias !1318
  %tmp269 = load i64, i64* %tmp, align 8
  %tmp270 = load i64, i64* @stdout, align 8
  %tmp271 = load i64, i64* %tmp80, align 8
  %tmp272 = add i64 %tmp271, -84
  %tmp273 = trunc i64 %tmp268 to i32
  %tmp274 = inttoptr i64 %tmp272 to i32*
  store i32 %tmp273, i32* %tmp274, align 4
  %tmp275 = add i64 %tmp269, 16
  %tmp276 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp277 = add i64 %tmp276, -8
  %tmp278 = inttoptr i64 %tmp277 to i64*
  store i64 %tmp275, i64* %tmp278, align 8
  store i64 %tmp275, i64* %tmp, align 8, !alias.scope !1323, !noalias !1326
  store i64 %tmp276, i64* %tmp79, align 8, !alias.scope !1323, !noalias !1326
  %tmp279 = tail call i64 @fflush(i64 %tmp270), !noalias !1323
  %tmp280 = load i64, i64* %tmp80, align 8
  %tmp281 = add i64 %tmp280, -88
  %tmp282 = trunc i64 %tmp279 to i32
  %tmp283 = load i64, i64* %tmp, align 8
  %tmp284 = add i64 %tmp283, 3
  %tmp285 = inttoptr i64 %tmp281 to i32*
  store i32 %tmp282, i32* %tmp285, align 4
  %tmp286 = load i32, i32* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 104) to i32*), align 8
  %tmp287 = add i32 %tmp286, -2
  %tmp288 = lshr i32 %tmp287, 31
  %tmp289 = lshr i32 %tmp286, 31
  %tmp290 = xor i32 %tmp288, %tmp289
  %tmp291 = add nuw nsw i32 %tmp290, %tmp289
  %tmp292 = icmp eq i32 %tmp291, 2
  %tmp293 = icmp ne i32 %tmp288, 0
  %tmp294 = xor i1 %tmp293, %tmp292
  %tmp295 = select i1 %tmp294, i64 14, i64 37
  %tmp296 = add i64 %tmp295, %tmp284
  br i1 %tmp294, label %block_400b93, label %block_400bbb.preheader

block_400bbb:                                     ; preds = %block_400bbb.preheader, %block_400bfb
  %tmp297 = phi i64 [ %tmp556, %block_400bfb ], [ %tmp329, %block_400bbb.preheader ]
  %tmp298 = phi i32 [ %tmp545, %block_400bfb ], [ 0, %block_400bbb.preheader ]
  %tmp299 = phi i64 [ %tmp311, %block_400bfb ], [ %.lcssa6, %block_400bbb.preheader ]
  store i64 0, i64* %tmp77, align 8, !tbaa !1231
  %tmp300 = sext i32 %tmp298 to i64
  store i64 %tmp300, i64* %tmp75, align 8, !tbaa !1231
  %tmp301 = shl nsw i64 %tmp300, 3
  %tmp302 = add i64 %tmp299, -48
  %tmp303 = add i64 %tmp302, %tmp301
  %tmp304 = inttoptr i64 %tmp303 to i64*
  %tmp305 = load i64, i64* %tmp304, align 8
  %tmp306 = add i64 %tmp297, 18
  %tmp307 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp308 = add i64 %tmp307, -8
  %tmp309 = inttoptr i64 %tmp308 to i64*
  store i64 %tmp306, i64* %tmp309, align 8
  store i64 %tmp306, i64* %tmp, align 8, !alias.scope !1328, !noalias !1331
  store i64 %tmp307, i64* %tmp79, align 8, !alias.scope !1328, !noalias !1331
  %tmp310 = tail call i64 @pthread_join(i64 %tmp305, i64 0), !noalias !1328
  %tmp311 = load i64, i64* %tmp80, align 8
  %tmp312 = add i64 %tmp311, -20
  %tmp313 = trunc i64 %tmp310 to i32
  %tmp314 = load i64, i64* %tmp, align 8
  %tmp315 = inttoptr i64 %tmp312 to i32*
  store i32 %tmp313, i32* %tmp315, align 4
  store i8 0, i8* %tmp87, align 1, !tbaa !1240
  %tmp316 = and i32 %tmp313, 255
  %tmp317 = tail call i32 @llvm.ctpop.i32(i32 %tmp316) #15, !range !1254
  %tmp318 = trunc i32 %tmp317 to i8
  %tmp319 = and i8 %tmp318, 1
  %tmp320 = xor i8 %tmp319, 1
  store i8 %tmp320, i8* %tmp88, align 1, !tbaa !1255
  store i8 0, i8* %tmp89, align 1, !tbaa !1256
  %tmp321 = icmp eq i32 %tmp313, 0
  %tmp322 = zext i1 %tmp321 to i8
  store i8 %tmp322, i8* %tmp90, align 1, !tbaa !1257
  %tmp323 = lshr i32 %tmp313, 31
  %tmp324 = trunc i32 %tmp323 to i8
  store i8 %tmp324, i8* %tmp91, align 1, !tbaa !1258
  store i8 0, i8* %tmp92, align 1, !tbaa !1259
  %tmp325 = select i1 %tmp321, i64 46, i64 13
  %tmp326 = add i64 %tmp325, %tmp314
  br i1 %tmp321, label %block_400bfb, label %block_400bda

block_400bbb.preheader:                           ; preds = %block_400b93, %block_400b61
  %.lcssa6 = phi i64 [ %tmp280, %block_400b61 ], [ %tmp401, %block_400b93 ]
  %.lcssa5 = phi i64 [ %tmp296, %block_400b61 ], [ %tmp417, %block_400b93 ]
  %tmp327 = add i64 %.lcssa6, -24
  %tmp328 = inttoptr i64 %tmp327 to i32*
  store i32 0, i32* %tmp328, align 4
  %tmp329 = add i64 %.lcssa5, 17
  br label %block_400bbb

block_400b4e:                                     ; preds = %block_400ad1
  %tmp330 = add i64 %tmp526, -24
  %tmp331 = inttoptr i64 %tmp330 to i32*
  %tmp332 = load i32, i32* %tmp331, align 4
  %tmp333 = add i32 %tmp332, 1
  store i32 %tmp333, i32* %tmp331, align 4
  %tmp334 = add i64 %tmp541, -135
  %tmp335 = add i32 %tmp332, -1
  %tmp336 = lshr i32 %tmp335, 31
  %tmp337 = lshr i32 %tmp333, 31
  %tmp338 = xor i32 %tmp336, %tmp337
  %tmp339 = add nuw nsw i32 %tmp338, %tmp337
  %tmp340 = icmp eq i32 %tmp339, 2
  %tmp341 = icmp ne i32 %tmp336, 0
  %tmp342 = xor i1 %tmp341, %tmp340
  %tmp343 = select i1 %tmp342, i64 10, i64 154
  %tmp344 = add i64 %tmp343, %tmp334
  br i1 %tmp342, label %block_400ad1, label %block_400b61

block_400b2d:                                     ; preds = %block_400ad1
  %tmp345 = and i64 %tmp525, 4294967295
  store i64 %tmp345, i64* %tmp77, align 8, !tbaa !1231
  %tmp346 = add i64 %tmp541, 20
  %tmp347 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp348 = add i64 %tmp347, -8
  %tmp349 = inttoptr i64 %tmp348 to i64*
  store i64 %tmp346, i64* %tmp349, align 8
  %tmp350 = load i64, i64* %tmp76, align 8, !alias.scope !1333, !noalias !1336
  %tmp351 = load i64, i64* %tmp75, align 8, !alias.scope !1333, !noalias !1336
  %tmp352 = load i64, i64* %tmp81, align 8, !alias.scope !1333, !noalias !1336
  %tmp353 = load i64, i64* %tmp106, align 8, !alias.scope !1333, !noalias !1336
  %tmp354 = inttoptr i64 %tmp347 to i64*
  %tmp355 = load i64, i64* %tmp354, align 8
  %tmp356 = add i64 %tmp347, 8
  %tmp357 = inttoptr i64 %tmp356 to i64*
  %tmp358 = load i64, i64* %tmp357, align 8
  %tmp359 = add i64 %tmp347, 16
  %tmp360 = inttoptr i64 %tmp359 to i64*
  %tmp361 = load i64, i64* %tmp360, align 8
  %tmp362 = add i64 %tmp347, 24
  %tmp363 = inttoptr i64 %tmp362 to i64*
  %tmp364 = load i64, i64* %tmp363, align 8
  %tmp365 = add i64 %tmp347, 32
  %tmp366 = inttoptr i64 %tmp365 to i64*
  %tmp367 = load i64, i64* %tmp366, align 8
  %tmp368 = add i64 %tmp347, 40
  %tmp369 = inttoptr i64 %tmp368 to i64*
  %tmp370 = load i64, i64* %tmp369, align 8
  %tmp371 = add i64 %tmp347, 48
  %tmp372 = inttoptr i64 %tmp371 to i64*
  %tmp373 = load i64, i64* %tmp372, align 8
  %tmp374 = add i64 %tmp347, 56
  %tmp375 = inttoptr i64 %tmp374 to i64*
  %tmp376 = load i64, i64* %tmp375, align 8
  %tmp377 = add i64 %tmp347, 64
  %tmp378 = inttoptr i64 %tmp377 to i64*
  %tmp379 = load i64, i64* %tmp378, align 8
  %tmp380 = add i64 %tmp347, 72
  %tmp381 = inttoptr i64 %tmp380 to i64*
  %tmp382 = load i64, i64* %tmp381, align 8
  store i64 %tmp346, i64* %tmp, align 8, !alias.scope !1333, !noalias !1336
  store i64 %tmp347, i64* %tmp79, align 8, !alias.scope !1333, !noalias !1336
  %tmp383 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 66), i64 %tmp345, i64 %tmp350, i64 %tmp351, i64 %tmp352, i64 %tmp353, i64 %tmp355, i64 %tmp358, i64 %tmp361, i64 %tmp364, i64 %tmp367, i64 %tmp370, i64 %tmp373, i64 %tmp376, i64 %tmp379, i64 %tmp382), !noalias !1333
  %tmp384 = load i64, i64* %tmp, align 8
  store i64 1, i64* %tmp78, align 8, !tbaa !1231
  %tmp385 = load i64, i64* %tmp80, align 8
  %tmp386 = add i64 %tmp385, -80
  %tmp387 = trunc i64 %tmp383 to i32
  %tmp388 = inttoptr i64 %tmp386 to i32*
  store i32 %tmp387, i32* %tmp388, align 4
  %tmp389 = add i64 %tmp384, 13
  %tmp390 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp391 = add i64 %tmp390, -8
  %tmp392 = inttoptr i64 %tmp391 to i64*
  store i64 %tmp389, i64* %tmp392, align 8
  store i64 %tmp389, i64* %tmp, align 8, !alias.scope !1338, !noalias !1341
  store i64 %tmp390, i64* %tmp79, align 8, !alias.scope !1338, !noalias !1341
  %tmp393 = tail call i64 @exit(i64 1), !noalias !1338
  store i64 %tmp393, i64* %tmp74, align 8, !alias.scope !1338, !noalias !1341
  %tmp394 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull undef, i64 undef, %struct.Memory* undef)
  unreachable

block_400b93:                                     ; preds = %block_400b61, %block_400b93
  %tmp395 = phi i64 [ %tmp417, %block_400b93 ], [ %tmp296, %block_400b61 ]
  %tmp396 = add i64 %tmp395, 15
  %tmp397 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp398 = add i64 %tmp397, -8
  %tmp399 = inttoptr i64 %tmp398 to i64*
  store i64 %tmp396, i64* %tmp399, align 8
  store i64 %tmp396, i64* %tmp, align 8, !alias.scope !1343, !noalias !1346
  store i64 %tmp397, i64* %tmp79, align 8, !alias.scope !1343, !noalias !1346
  %tmp400 = tail call i64 @pthread_cond_signal(i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 56)), !noalias !1343
  %tmp401 = load i64, i64* %tmp80, align 8
  %tmp402 = add i64 %tmp401, -92
  %tmp403 = trunc i64 %tmp400 to i32
  %tmp404 = load i64, i64* %tmp, align 8
  %tmp405 = inttoptr i64 %tmp402 to i32*
  store i32 %tmp403, i32* %tmp405, align 4
  %tmp406 = add i64 %tmp404, -29
  %tmp407 = load i32, i32* inttoptr (i64 add (i64 ptrtoint (%seg_602088__bss_type* @seg_602088__bss to i64), i64 104) to i32*), align 8
  %tmp408 = add i32 %tmp407, -2
  %tmp409 = lshr i32 %tmp408, 31
  %tmp410 = lshr i32 %tmp407, 31
  %tmp411 = xor i32 %tmp409, %tmp410
  %tmp412 = add nuw nsw i32 %tmp411, %tmp410
  %tmp413 = icmp eq i32 %tmp412, 2
  %tmp414 = icmp ne i32 %tmp409, 0
  %tmp415 = xor i1 %tmp414, %tmp413
  %tmp416 = select i1 %tmp415, i64 14, i64 37
  %tmp417 = add i64 %tmp416, %tmp406
  br i1 %tmp415, label %block_400b93, label %block_400bbb.preheader

block_400c0e:                                     ; preds = %block_400bfb
  %phitmp = add i64 %tmp556, 17
  store i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 197), i64* %tmp78, align 8, !tbaa !1231
  %tmp418 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp419 = add i64 %tmp418, -8
  %tmp420 = inttoptr i64 %tmp419 to i64*
  store i64 %phitmp, i64* %tmp420, align 8
  %tmp421 = load i64, i64* %tmp77, align 8, !alias.scope !1348, !noalias !1351
  %tmp422 = load i64, i64* %tmp76, align 8, !alias.scope !1348, !noalias !1351
  %tmp423 = load i64, i64* %tmp75, align 8, !alias.scope !1348, !noalias !1351
  %tmp424 = load i64, i64* %tmp81, align 8, !alias.scope !1348, !noalias !1351
  %tmp425 = load i64, i64* %tmp106, align 8, !alias.scope !1348, !noalias !1351
  %tmp426 = inttoptr i64 %tmp418 to i64*
  %tmp427 = load i64, i64* %tmp426, align 8
  %tmp428 = add i64 %tmp418, 8
  %tmp429 = inttoptr i64 %tmp428 to i64*
  %tmp430 = load i64, i64* %tmp429, align 8
  %tmp431 = add i64 %tmp418, 16
  %tmp432 = inttoptr i64 %tmp431 to i64*
  %tmp433 = load i64, i64* %tmp432, align 8
  %tmp434 = add i64 %tmp418, 24
  %tmp435 = inttoptr i64 %tmp434 to i64*
  %tmp436 = load i64, i64* %tmp435, align 8
  %tmp437 = add i64 %tmp418, 32
  %tmp438 = inttoptr i64 %tmp437 to i64*
  %tmp439 = load i64, i64* %tmp438, align 8
  %tmp440 = add i64 %tmp418, 40
  %tmp441 = inttoptr i64 %tmp440 to i64*
  %tmp442 = load i64, i64* %tmp441, align 8
  %tmp443 = add i64 %tmp418, 48
  %tmp444 = inttoptr i64 %tmp443 to i64*
  %tmp445 = load i64, i64* %tmp444, align 8
  %tmp446 = add i64 %tmp418, 56
  %tmp447 = inttoptr i64 %tmp446 to i64*
  %tmp448 = load i64, i64* %tmp447, align 8
  %tmp449 = add i64 %tmp418, 64
  %tmp450 = inttoptr i64 %tmp449 to i64*
  %tmp451 = load i64, i64* %tmp450, align 8
  %tmp452 = add i64 %tmp418, 72
  %tmp453 = inttoptr i64 %tmp452 to i64*
  %tmp454 = load i64, i64* %tmp453, align 8
  store i64 %tmp418, i64* %tmp79, align 8, !alias.scope !1348, !noalias !1351
  %tmp455 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400cb0__rodata_type* @seg_400cb0__rodata to i64), i64 197), i64 %tmp421, i64 %tmp422, i64 %tmp423, i64 %tmp424, i64 %tmp425, i64 %tmp427, i64 %tmp430, i64 %tmp433, i64 %tmp436, i64 %tmp439, i64 %tmp442, i64 %tmp445, i64 %tmp448, i64 %tmp451, i64 %tmp454), !noalias !1348
  store i64 0, i64* %tmp75, align 8, !tbaa !1231
  %tmp456 = load i64, i64* %tmp80, align 8
  %tmp457 = add i64 %tmp456, -100
  %tmp458 = trunc i64 %tmp455 to i32
  %tmp459 = inttoptr i64 %tmp457 to i32*
  store i32 %tmp458, i32* %tmp459, align 4
  store i64 0, i64* %tmp74, align 8, !tbaa !1231
  %tmp460 = load i64, i64* %tmp79, align 8
  %tmp461 = add i64 %tmp460, 112
  %tmp462 = icmp ugt i64 %tmp460, -113
  %tmp463 = zext i1 %tmp462 to i8
  store i8 %tmp463, i8* %tmp87, align 1, !tbaa !1240
  %tmp464 = trunc i64 %tmp461 to i32
  %tmp465 = and i32 %tmp464, 255
  %tmp466 = tail call i32 @llvm.ctpop.i32(i32 %tmp465) #15, !range !1254
  %tmp467 = trunc i32 %tmp466 to i8
  %tmp468 = and i8 %tmp467, 1
  %tmp469 = xor i8 %tmp468, 1
  store i8 %tmp469, i8* %tmp88, align 1, !tbaa !1255
  %tmp470 = xor i64 %tmp460, 16
  %tmp471 = xor i64 %tmp470, %tmp461
  %tmp472 = lshr i64 %tmp471, 4
  %tmp473 = trunc i64 %tmp472 to i8
  %tmp474 = and i8 %tmp473, 1
  store i8 %tmp474, i8* %tmp89, align 1, !tbaa !1256
  %tmp475 = icmp eq i64 %tmp461, 0
  %tmp476 = zext i1 %tmp475 to i8
  store i8 %tmp476, i8* %tmp90, align 1, !tbaa !1257
  %tmp477 = lshr i64 %tmp461, 63
  %tmp478 = trunc i64 %tmp477 to i8
  store i8 %tmp478, i8* %tmp91, align 1, !tbaa !1258
  %tmp479 = lshr i64 %tmp460, 63
  %tmp480 = xor i64 %tmp477, %tmp479
  %tmp481 = add nuw nsw i64 %tmp480, %tmp477
  %tmp482 = icmp eq i64 %tmp481, 2
  %tmp483 = zext i1 %tmp482 to i8
  store i8 %tmp483, i8* %tmp92, align 1, !tbaa !1259
  %tmp484 = add i64 %tmp460, 120
  %tmp485 = inttoptr i64 %tmp461 to i64*
  %tmp486 = load i64, i64* %tmp485, align 8
  store i64 %tmp486, i64* %tmp80, align 8, !tbaa !1231
  %tmp487 = inttoptr i64 %tmp484 to i64*
  %tmp488 = load i64, i64* %tmp487, align 8
  store i64 %tmp488, i64* %tmp, align 8, !tbaa !1231
  %tmp489 = add i64 %tmp460, 128
  store i64 %tmp489, i64* %tmp79, align 8, !tbaa !1231
  ret %struct.Memory* %arg71

block_400ad1:                                     ; preds = %block_400a60, %block_400b4e
  %tmp490 = phi i64 [ %tmp344, %block_400b4e ], [ %tmp179, %block_400a60 ]
  %tmp491 = phi i32 [ %tmp333, %block_400b4e ], [ %tmp169, %block_400a60 ]
  %tmp492 = phi i32* [ %tmp331, %block_400b4e ], [ %tmp164, %block_400a60 ]
  %tmp493 = phi i64 [ %tmp526, %block_400b4e ], [ %tmp161, %block_400a60 ]
  store i64 0, i64* %tmp77, align 8, !tbaa !1231
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @theThread to i64), i64* %tmp76, align 8, !tbaa !1231
  %tmp494 = add i64 %tmp493, -64
  store i64 %tmp494, i64* %tmp75, align 8, !tbaa !1231
  %tmp495 = add i64 %tmp493, -48
  store i64 %tmp495, i64* %tmp78, align 8, !tbaa !1231
  %tmp496 = sext i32 %tmp491 to i64
  %tmp497 = shl nsw i64 %tmp496, 3
  %tmp498 = add i64 %tmp497, %tmp494
  %tmp499 = inttoptr i64 %tmp498 to i32*
  store i32 %tmp491, i32* %tmp499, align 4
  %tmp500 = load i32, i32* %tmp492, align 4
  %tmp501 = shl i32 %tmp500, 1
  %tmp502 = add i32 %tmp501, 2
  %tmp503 = load i64, i64* %tmp80, align 8
  %tmp504 = add i64 %tmp503, -24
  %tmp505 = inttoptr i64 %tmp504 to i32*
  %tmp506 = load i32, i32* %tmp505, align 4
  %tmp507 = sext i32 %tmp506 to i64
  %tmp508 = shl nsw i64 %tmp507, 3
  %tmp509 = add i64 %tmp503, -60
  %tmp510 = add i64 %tmp509, %tmp508
  %tmp511 = inttoptr i64 %tmp510 to i32*
  store i32 %tmp502, i32* %tmp511, align 4
  %tmp512 = load i32, i32* %tmp505, align 4
  %tmp513 = sext i32 %tmp512 to i64
  %tmp514 = shl nsw i64 %tmp513, 3
  %tmp515 = load i64, i64* %tmp78, align 8
  %tmp516 = add i64 %tmp514, %tmp515
  store i64 %tmp514, i64* %tmp81, align 8, !tbaa !1231
  %tmp517 = load i64, i64* %tmp75, align 8
  %tmp518 = add i64 %tmp517, %tmp514
  store i64 %tmp518, i64* %tmp75, align 8, !tbaa !1231
  %tmp519 = add i64 %tmp490, 79
  %tmp520 = load i64, i64* %tmp79, align 8, !tbaa !1231
  %tmp521 = add i64 %tmp520, -8
  %tmp522 = inttoptr i64 %tmp521 to i64*
  store i64 %tmp519, i64* %tmp522, align 8
  %tmp523 = load i64, i64* %tmp77, align 8, !alias.scope !1353, !noalias !1356
  %tmp524 = load i64, i64* %tmp76, align 8, !alias.scope !1353, !noalias !1356
  store i64 %tmp519, i64* %tmp, align 8, !alias.scope !1353, !noalias !1356
  store i64 %tmp520, i64* %tmp79, align 8, !alias.scope !1353, !noalias !1356
  %tmp525 = tail call i64 @pthread_create(i64 %tmp516, i64 %tmp523, i64 %tmp524, i64 %tmp518), !noalias !1353
  %tmp526 = load i64, i64* %tmp80, align 8
  %tmp527 = add i64 %tmp526, -20
  %tmp528 = trunc i64 %tmp525 to i32
  %tmp529 = load i64, i64* %tmp, align 8
  %tmp530 = inttoptr i64 %tmp527 to i32*
  store i32 %tmp528, i32* %tmp530, align 4
  store i8 0, i8* %tmp87, align 1, !tbaa !1240
  %tmp531 = and i32 %tmp528, 255
  %tmp532 = tail call i32 @llvm.ctpop.i32(i32 %tmp531) #15, !range !1254
  %tmp533 = trunc i32 %tmp532 to i8
  %tmp534 = and i8 %tmp533, 1
  %tmp535 = xor i8 %tmp534, 1
  store i8 %tmp535, i8* %tmp88, align 1, !tbaa !1255
  store i8 0, i8* %tmp89, align 1, !tbaa !1256
  %tmp536 = icmp eq i32 %tmp528, 0
  %tmp537 = zext i1 %tmp536 to i8
  store i8 %tmp537, i8* %tmp90, align 1, !tbaa !1257
  %tmp538 = lshr i32 %tmp528, 31
  %tmp539 = trunc i32 %tmp538 to i8
  store i8 %tmp539, i8* %tmp91, align 1, !tbaa !1258
  store i8 0, i8* %tmp92, align 1, !tbaa !1259
  %tmp540 = select i1 %tmp536, i64 46, i64 13
  %tmp541 = add i64 %tmp540, %tmp529
  br i1 %tmp536, label %block_400b4e, label %block_400b2d

block_400bfb:                                     ; preds = %block_400bbb
  %tmp542 = add i64 %tmp311, -24
  %tmp543 = inttoptr i64 %tmp542 to i32*
  %tmp544 = load i32, i32* %tmp543, align 4
  %tmp545 = add i32 %tmp544, 1
  store i32 %tmp545, i32* %tmp543, align 4
  %tmp546 = add i64 %tmp326, -74
  %tmp547 = add i32 %tmp544, -1
  %tmp548 = lshr i32 %tmp547, 31
  %tmp549 = lshr i32 %tmp545, 31
  %tmp550 = xor i32 %tmp548, %tmp549
  %tmp551 = add nuw nsw i32 %tmp550, %tmp549
  %tmp552 = icmp eq i32 %tmp551, 2
  %tmp553 = icmp ne i32 %tmp548, 0
  %tmp554 = xor i1 %tmp553, %tmp552
  %tmp555 = select i1 %tmp554, i64 10, i64 93
  %tmp556 = add i64 %tmp555, %tmp546
  br i1 %tmp554, label %block_400bbb, label %block_400c0e
}

; Function Attrs: nobuiltin noinline noreturn
define i64 @callback_sub_400870__start(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #7 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196464, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp10 = load volatile i1, i1* @0, align 1
  br i1 %tmp10, label %__mcsema_early_init.exit, label %bb11

bb11:                                             ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb11, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %arg3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %arg4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %arg5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %tmp12 = inttoptr i64 %tmp9 to i64*
  store i64 %arg7, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp9, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %arg6, i64* %tmp14, align 8
  %tmp15 = add i64 %tmp9, -24
  store i64 %tmp15, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp16 = tail call %struct.Memory* @sub_400870__start(%struct.State* nonnull @__mcsema_reg_state, i64 4196464, %struct.Memory* undef)
  unreachable
}

; Function Attrs: norecurse nounwind
define void @__mcsema_verify_reg_state() local_unnamed_addr #8 {
entry:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp1 = icmp eq i64 %tmp, 0
  br i1 %tmp1, label %is_null, label %end

is_null:                                          ; preds = %entry
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %end

end:                                              ; preds = %is_null, %entry
  ret void
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_400940_frame_dummy(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) #9 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196672, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp10 = load volatile i1, i1* @0, align 1
  br i1 %tmp10, label %__mcsema_early_init.exit, label %bb11

bb11:                                             ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb11, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %arg3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %arg4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %arg5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %tmp12 = inttoptr i64 %tmp9 to i64*
  store i64 %arg7, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp9, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %arg6, i64* %tmp14, align 8
  %tmp15 = add i64 %tmp9, -24
  store i64 %tmp15, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp16 = tail call %struct.Memory* @sub_400940_frame_dummy(%struct.State* nonnull @__mcsema_reg_state, i64 4196672, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_400910___do_global_dtors_aux(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) #9 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196624, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp10 = load volatile i1, i1* @0, align 1
  br i1 %tmp10, label %__mcsema_early_init.exit, label %bb11

bb11:                                             ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb11, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %arg3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %arg4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %arg5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %tmp12 = inttoptr i64 %tmp9 to i64*
  store i64 %arg7, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp9, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %arg6, i64* %tmp14, align 8
  %tmp15 = add i64 %tmp9, -24
  store i64 %tmp15, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp16 = tail call %struct.Memory* @sub_400910___do_global_dtors_aux(%struct.State* nonnull @__mcsema_reg_state, i64 4196624, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007c0_printf(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  %tmp11 = load i64, i64* %tmp7, align 8
  %tmp12 = load i64, i64* %tmp6, align 8
  %tmp13 = load i64, i64* %tmp5, align 8
  %tmp14 = load i64, i64* %tmp4, align 8
  %tmp15 = load i64, i64* %tmp9, align 8
  %tmp16 = load i64, i64* %tmp10, align 8
  %tmp17 = load i64, i64* %tmp8, align 8
  %tmp18 = add i64 %tmp17, 8
  %tmp19 = inttoptr i64 %tmp18 to i64*
  %tmp20 = load i64, i64* %tmp19, align 8
  %tmp21 = add i64 %tmp17, 16
  %tmp22 = inttoptr i64 %tmp21 to i64*
  %tmp23 = load i64, i64* %tmp22, align 8
  %tmp24 = add i64 %tmp17, 24
  %tmp25 = inttoptr i64 %tmp24 to i64*
  %tmp26 = load i64, i64* %tmp25, align 8
  %tmp27 = add i64 %tmp17, 32
  %tmp28 = inttoptr i64 %tmp27 to i64*
  %tmp29 = load i64, i64* %tmp28, align 8
  %tmp30 = add i64 %tmp17, 40
  %tmp31 = inttoptr i64 %tmp30 to i64*
  %tmp32 = load i64, i64* %tmp31, align 8
  %tmp33 = add i64 %tmp17, 48
  %tmp34 = inttoptr i64 %tmp33 to i64*
  %tmp35 = load i64, i64* %tmp34, align 8
  %tmp36 = add i64 %tmp17, 56
  %tmp37 = inttoptr i64 %tmp36 to i64*
  %tmp38 = load i64, i64* %tmp37, align 8
  %tmp39 = add i64 %tmp17, 64
  %tmp40 = inttoptr i64 %tmp39 to i64*
  %tmp41 = load i64, i64* %tmp40, align 8
  %tmp42 = add i64 %tmp17, 72
  %tmp43 = inttoptr i64 %tmp42 to i64*
  %tmp44 = load i64, i64* %tmp43, align 8
  %tmp45 = add i64 %tmp17, 80
  %tmp46 = inttoptr i64 %tmp45 to i64*
  %tmp47 = load i64, i64* %tmp46, align 8
  %tmp48 = inttoptr i64 %tmp17 to i64*
  %tmp49 = load i64, i64* %tmp48, align 8
  store i64 %tmp49, i64* %tmp, align 8
  store i64 %tmp18, i64* %tmp8, align 8
  %tmp50 = tail call i64 @printf(i64 %tmp11, i64 %tmp12, i64 %tmp13, i64 %tmp14, i64 %tmp15, i64 %tmp16, i64 %tmp20, i64 %tmp23, i64 %tmp26, i64 %tmp29, i64 %tmp32, i64 %tmp35, i64 %tmp38, i64 %tmp41, i64 %tmp44, i64 %tmp47)
  store i64 %tmp50, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @__mcsema_detach_call_value(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  %tmp11 = load i64, i64* %tmp7, align 8
  %tmp12 = load i64, i64* %tmp6, align 8
  %tmp13 = load i64, i64* %tmp5, align 8
  %tmp14 = load i64, i64* %tmp4, align 8
  %tmp15 = load i64, i64* %tmp9, align 8
  %tmp16 = load i64, i64* %tmp10, align 8
  %tmp17 = load i64, i64* %tmp8, align 8
  %tmp18 = add i64 %tmp17, 8
  %tmp19 = inttoptr i64 %tmp18 to i64*
  %tmp20 = load i64, i64* %tmp19, align 8
  %tmp21 = add i64 %tmp17, 16
  %tmp22 = inttoptr i64 %tmp21 to i64*
  %tmp23 = load i64, i64* %tmp22, align 8
  %tmp24 = inttoptr i64 %arg1 to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %tmp25 = tail call i64 %tmp24(i64 %tmp11, i64 %tmp12, i64 %tmp13, i64 %tmp14, i64 %tmp15, i64 %tmp16, i64 %tmp20, i64 %tmp23) #15
  store i64 %tmp25, i64* %tmp3, align 8
  %tmp26 = inttoptr i64 %tmp17 to i64*
  %tmp27 = load i64, i64* %tmp26, align 8
  store i64 %tmp27, i64* %tmp, align 8
  store i64 %tmp18, i64* %tmp8, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602180___gmon_start__(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = load i64, i64* %tmp4, align 8
  %tmp6 = inttoptr i64 %tmp5 to i64*
  %tmp7 = load i64, i64* %tmp6, align 8
  store i64 %tmp7, i64* %tmp, align 8
  %tmp8 = add i64 %tmp5, 8
  store i64 %tmp8, i64* %tmp4, align 8
  %tmp9 = tail call i64 @__gmon_start__()
  store i64 %tmp9, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_400850_pthread_mutex_lock(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp6 = load i64, i64* %tmp4, align 8
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = inttoptr i64 %tmp7 to i64*
  %tmp9 = load i64, i64* %tmp8, align 8
  store i64 %tmp9, i64* %tmp, align 8
  %tmp10 = add i64 %tmp7, 8
  store i64 %tmp10, i64* %tmp5, align 8
  %tmp11 = tail call i64 @pthread_mutex_lock(i64 %tmp6)
  store i64 %tmp11, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602120_pthread_cond_wait(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = load i64, i64* %tmp4, align 8
  %tmp9 = load i64, i64* %tmp6, align 8
  %tmp10 = inttoptr i64 %tmp9 to i64*
  %tmp11 = load i64, i64* %tmp10, align 8
  store i64 %tmp11, i64* %tmp, align 8
  %tmp12 = add i64 %tmp9, 8
  store i64 %tmp12, i64* %tmp6, align 8
  %tmp13 = tail call i64 @pthread_cond_wait(i64 %tmp7, i64 %tmp8)
  store i64 %tmp13, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602148_pthread_mutex_unlock(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp6 = load i64, i64* %tmp4, align 8
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = inttoptr i64 %tmp7 to i64*
  %tmp9 = load i64, i64* %tmp8, align 8
  store i64 %tmp9, i64* %tmp, align 8
  %tmp10 = add i64 %tmp7, 8
  store i64 %tmp10, i64* %tmp5, align 8
  %tmp11 = tail call i64 @pthread_mutex_unlock(i64 %tmp6)
  store i64 %tmp11, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: nobuiltin noinline norecurse nounwind
define i64 @callback_sub_400ca0___libc_csu_fini() #11 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp1 = icmp eq i64 %tmp, 0
  br i1 %tmp1, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp2 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4197536, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp3 = load volatile i1, i1* @0, align 1
  br i1 %tmp3, label %__mcsema_early_init.exit, label %bb4

bb4:                                              ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb4, %__mcsema_verify_reg_state.exit
  %tmp5 = add i64 %tmp2, -8
  store i64 %tmp5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp6 = tail call %struct.Memory* @sub_400ca0___libc_csu_fini(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
  store i64 %tmp2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp7 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp7
}

; Function Attrs: nobuiltin noinline
define i64 @callback_sub_400c30___libc_csu_init() #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp1 = icmp eq i64 %tmp, 0
  br i1 %tmp1, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp2 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4197424, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp3 = load volatile i1, i1* @0, align 1
  br i1 %tmp3, label %__mcsema_early_init.exit, label %bb4

bb4:                                              ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb4, %__mcsema_verify_reg_state.exit
  %tmp5 = add i64 %tmp2, -8
  store i64 %tmp5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp6 = tail call %struct.Memory* @sub_400c30___libc_csu_init(%struct.State* nonnull @__mcsema_reg_state, i64 4197424, %struct.Memory* null)
  store i64 %tmp2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp7 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp7
}

; Function Attrs: nobuiltin noinline
define i64 @main(i64 %arg, i64 %arg1, i64 %arg2) #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp3 = icmp eq i64 %tmp, 0
  br i1 %tmp3, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp4 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196960, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp5 = load volatile i1, i1* @0, align 1
  br i1 %tmp5, label %__mcsema_early_init.exit, label %bb6

bb6:                                              ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb6, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  %tmp7 = add i64 %tmp4, -8
  store i64 %tmp7, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = tail call %struct.Memory* @sub_400a60_main(%struct.State* nonnull @__mcsema_reg_state, i64 4196960, %struct.Memory* null)
  store i64 %tmp4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp9 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp9
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007d0___libc_start_main(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  %tmp11 = load i64, i64* %tmp7, align 8
  %tmp12 = load i64, i64* %tmp6, align 8
  %tmp13 = load i64, i64* %tmp5, align 8
  %tmp14 = load i64, i64* %tmp4, align 8
  %tmp15 = load i64, i64* %tmp9, align 8
  %tmp16 = load i64, i64* %tmp10, align 8
  %tmp17 = load i64, i64* %tmp8, align 8
  %tmp18 = add i64 %tmp17, 8
  %tmp19 = inttoptr i64 %tmp18 to i64*
  %tmp20 = load i64, i64* %tmp19, align 8
  %tmp21 = add i64 %tmp17, 16
  %tmp22 = inttoptr i64 %tmp21 to i64*
  %tmp23 = load i64, i64* %tmp22, align 8
  %tmp24 = inttoptr i64 %tmp17 to i64*
  %tmp25 = load i64, i64* %tmp24, align 8
  store i64 %tmp25, i64* %tmp, align 8
  store i64 %tmp18, i64* %tmp8, align 8
  %tmp26 = tail call i64 @__libc_start_main(i64 %tmp11, i64 %tmp12, i64 %tmp13, i64 %tmp14, i64 %tmp15, i64 %tmp16, i64 %tmp20, i64 %tmp23)
  store i64 %tmp26, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_400830_exit(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp6 = load i64, i64* %tmp4, align 8
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = inttoptr i64 %tmp7 to i64*
  %tmp9 = load i64, i64* %tmp8, align 8
  store i64 %tmp9, i64* %tmp, align 8
  %tmp10 = add i64 %tmp7, 8
  store i64 %tmp10, i64* %tmp5, align 8
  %tmp11 = tail call i64 @exit(i64 %tmp6)
  store i64 %tmp11, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602168_pthread_mutex_init(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = load i64, i64* %tmp4, align 8
  %tmp9 = load i64, i64* %tmp6, align 8
  %tmp10 = inttoptr i64 %tmp9 to i64*
  %tmp11 = load i64, i64* %tmp10, align 8
  store i64 %tmp11, i64* %tmp, align 8
  %tmp12 = add i64 %tmp9, 8
  store i64 %tmp12, i64* %tmp6, align 8
  %tmp13 = tail call i64 @pthread_mutex_init(i64 %tmp7, i64 %tmp8)
  store i64 %tmp13, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007f0_pthread_cond_init(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = load i64, i64* %tmp4, align 8
  %tmp9 = load i64, i64* %tmp6, align 8
  %tmp10 = inttoptr i64 %tmp9 to i64*
  %tmp11 = load i64, i64* %tmp10, align 8
  store i64 %tmp11, i64* %tmp, align 8
  %tmp12 = add i64 %tmp9, 8
  store i64 %tmp12, i64* %tmp6, align 8
  %tmp13 = tail call i64 @pthread_cond_init(i64 %tmp7, i64 %tmp8)
  store i64 %tmp13, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602150_fflush(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp6 = load i64, i64* %tmp4, align 8
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = inttoptr i64 %tmp7 to i64*
  %tmp9 = load i64, i64* %tmp8, align 8
  store i64 %tmp9, i64* %tmp, align 8
  %tmp10 = add i64 %tmp7, 8
  store i64 %tmp10, i64* %tmp5, align 8
  %tmp11 = tail call i64 @fflush(i64 %tmp6)
  store i64 %tmp11, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_602158_pthread_join(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = load i64, i64* %tmp4, align 8
  %tmp9 = load i64, i64* %tmp6, align 8
  %tmp10 = inttoptr i64 %tmp9 to i64*
  %tmp11 = load i64, i64* %tmp10, align 8
  store i64 %tmp11, i64* %tmp, align 8
  %tmp12 = add i64 %tmp9, 8
  store i64 %tmp12, i64* %tmp6, align 8
  %tmp13 = tail call i64 @pthread_join(i64 %tmp7, i64 %tmp8)
  store i64 %tmp13, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007e0_pthread_cond_signal(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp6 = load i64, i64* %tmp4, align 8
  %tmp7 = load i64, i64* %tmp5, align 8
  %tmp8 = inttoptr i64 %tmp7 to i64*
  %tmp9 = load i64, i64* %tmp8, align 8
  store i64 %tmp9, i64* %tmp, align 8
  %tmp10 = add i64 %tmp7, 8
  store i64 %tmp10, i64* %tmp5, align 8
  %tmp11 = tail call i64 @pthread_cond_signal(i64 %tmp6)
  store i64 %tmp11, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: nobuiltin noinline
define i64 @theThread(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196816, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp10 = load volatile i1, i1* @0, align 1
  br i1 %tmp10, label %__mcsema_early_init.exit, label %bb11

bb11:                                             ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb11, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %arg3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %arg4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %arg5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %tmp12 = inttoptr i64 %tmp9 to i64*
  store i64 %arg7, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp9, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %arg6, i64* %tmp14, align 8
  %tmp15 = add i64 %tmp9, -24
  store i64 %tmp15, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp16 = tail call %struct.Memory* @sub_4009d0_theThread(%struct.State* nonnull @__mcsema_reg_state, i64 4196816, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4007a0_pthread_create(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp9 = load i64, i64* %tmp7, align 8
  %tmp10 = load i64, i64* %tmp6, align 8
  %tmp11 = load i64, i64* %tmp5, align 8
  %tmp12 = load i64, i64* %tmp4, align 8
  %tmp13 = load i64, i64* %tmp8, align 8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  %tmp15 = load i64, i64* %tmp14, align 8
  store i64 %tmp15, i64* %tmp, align 8
  %tmp16 = add i64 %tmp13, 8
  store i64 %tmp16, i64* %tmp8, align 8
  %tmp17 = tail call i64 @pthread_create(i64 %tmp9, i64 %tmp10, i64 %tmp11, i64 %tmp12)
  store i64 %tmp17, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: nobuiltin noinline
define i64 @bar(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196688, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp10 = load volatile i1, i1* @0, align 1
  br i1 %tmp10, label %__mcsema_early_init.exit, label %bb11

bb11:                                             ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb11, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %arg3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %arg4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %arg5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %tmp12 = inttoptr i64 %tmp9 to i64*
  store i64 %arg7, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp9, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %arg6, i64* %tmp14, align 8
  %tmp15 = add i64 %tmp9, -24
  store i64 %tmp15, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp16 = tail call %struct.Memory* @sub_400950_bar(%struct.State* nonnull @__mcsema_reg_state, i64 4196688, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @.term_proc(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #9 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4197540, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp10 = load volatile i1, i1* @0, align 1
  br i1 %tmp10, label %__mcsema_early_init.exit, label %bb11

bb11:                                             ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb11, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %arg3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %arg4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %arg5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %tmp12 = inttoptr i64 %tmp9 to i64*
  store i64 %arg7, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp9, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %arg6, i64* %tmp14, align 8
  %tmp15 = add i64 %tmp9, -24
  store i64 %tmp15, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp16 = tail call %struct.Memory* @sub_400ca4__term_proc(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline
define i64 @foo(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196752, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp10 = load volatile i1, i1* @0, align 1
  br i1 %tmp10, label %__mcsema_early_init.exit, label %bb11

bb11:                                             ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb11, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %arg3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %arg4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %arg5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %tmp12 = inttoptr i64 %tmp9 to i64*
  store i64 %arg7, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp9, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %arg6, i64* %tmp14, align 8
  %tmp15 = add i64 %tmp9, -24
  store i64 %tmp15, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp16 = tail call %struct.Memory* @sub_400990_foo(%struct.State* nonnull @__mcsema_reg_state, i64 4196752, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline
define i64 @.init_proc(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196200, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp10 = load volatile i1, i1* @0, align 1
  br i1 %tmp10, label %__mcsema_early_init.exit, label %bb11

bb11:                                             ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb11, %__mcsema_verify_reg_state.exit
  store i64 %arg, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 11, i32 0, i32 0), align 8
  store i64 %arg1, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 9, i32 0, i32 0), align 8
  store i64 %arg2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 7, i32 0, i32 0), align 8
  store i64 %arg3, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 5, i32 0, i32 0), align 8
  store i64 %arg4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 17, i32 0, i32 0), align 8
  store i64 %arg5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 19, i32 0, i32 0), align 8
  %tmp12 = inttoptr i64 %tmp9 to i64*
  store i64 %arg7, i64* %tmp12, align 8
  %tmp13 = add i64 %tmp9, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %arg6, i64* %tmp14, align 8
  %tmp15 = add i64 %tmp9, -24
  store i64 %tmp15, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp16 = tail call %struct.Memory* @sub_400768__init_proc(%struct.State* nonnull @__mcsema_reg_state, i64 4196200, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: norecurse nounwind
define internal void @__mcsema_destructor() #8 {
bb:
  %tmp = tail call i64 @callback_sub_400ca0___libc_csu_fini()
  ret void
}

define internal void @__mcsema_constructor() {
bb:
  %tmp = load volatile i1, i1* @0, align 1
  br i1 %tmp, label %__mcsema_early_init.exit, label %bb1

bb1:                                              ; preds = %bb
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb1, %bb
  %tmp2 = tail call i64 @callback_sub_400c30___libc_csu_init()
  ret void
}

; Function Attrs: noinline nounwind optnone
define %struct.State* @__mcsema_debug_get_reg_state() local_unnamed_addr #13 {
bb:
  ret %struct.State* @__mcsema_reg_state
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #14

attributes #0 = { nounwind readnone speculatable }
attributes #1 = { noduplicate noinline noreturn nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline }
attributes #3 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin noinline noreturn }
attributes #8 = { norecurse nounwind }
attributes #9 = { nobuiltin noinline nounwind }
attributes #10 = { alwaysinline inlinehint "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin noinline norecurse nounwind }
attributes #12 = { nobuiltin noinline }
attributes #13 = { noinline nounwind optnone }
attributes #14 = { cold noreturn nounwind }
attributes #15 = { nounwind }

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
!1254 = !{i32 0, i32 9}
!1255 = !{!1241, !1233, i64 2067}
!1256 = !{!1241, !1233, i64 2069}
!1257 = !{!1241, !1233, i64 2071}
!1258 = !{!1241, !1233, i64 2073}
!1259 = !{!1241, !1233, i64 2077}
!1260 = !{!1261}
!1261 = distinct !{!1261, !1262, !"ext_602180___gmon_start__: argument 0"}
!1262 = distinct !{!1262, !"ext_602180___gmon_start__"}
!1263 = !{!1264}
!1264 = distinct !{!1264, !1262, !"ext_602180___gmon_start__: argument 1"}
!1265 = !{i32 0, i32 6}
!1266 = !{!1267}
!1267 = distinct !{!1267, !1268, !"ext_4007c0_printf: argument 0"}
!1268 = distinct !{!1268, !"ext_4007c0_printf"}
!1269 = !{!1270}
!1270 = distinct !{!1270, !1268, !"ext_4007c0_printf: argument 1"}
!1271 = !{!1272}
!1272 = distinct !{!1272, !1273, !"ext_400850_pthread_mutex_lock: argument 0"}
!1273 = distinct !{!1273, !"ext_400850_pthread_mutex_lock"}
!1274 = !{!1275}
!1275 = distinct !{!1275, !1273, !"ext_400850_pthread_mutex_lock: argument 1"}
!1276 = !{!1277}
!1277 = distinct !{!1277, !1278, !"ext_602120_pthread_cond_wait: argument 0"}
!1278 = distinct !{!1278, !"ext_602120_pthread_cond_wait"}
!1279 = !{!1280}
!1280 = distinct !{!1280, !1278, !"ext_602120_pthread_cond_wait: argument 1"}
!1281 = !{!1282}
!1282 = distinct !{!1282, !1283, !"ext_602148_pthread_mutex_unlock: argument 0"}
!1283 = distinct !{!1283, !"ext_602148_pthread_mutex_unlock"}
!1284 = !{!1285}
!1285 = distinct !{!1285, !1283, !"ext_602148_pthread_mutex_unlock: argument 1"}
!1286 = !{!1233, !1233, i64 0}
!1287 = !{i32 0, i32 5}
!1288 = !{!1289}
!1289 = distinct !{!1289, !1290, !"ext_4007d0___libc_start_main: argument 0"}
!1290 = distinct !{!1290, !"ext_4007d0___libc_start_main"}
!1291 = !{!1292}
!1292 = distinct !{!1292, !1290, !"ext_4007d0___libc_start_main: argument 1"}
!1293 = !{!1294}
!1294 = distinct !{!1294, !1295, !"ext_4007c0_printf: argument 0"}
!1295 = distinct !{!1295, !"ext_4007c0_printf"}
!1296 = !{!1297}
!1297 = distinct !{!1297, !1295, !"ext_4007c0_printf: argument 1"}
!1298 = !{!1299}
!1299 = distinct !{!1299, !1300, !"ext_602168_pthread_mutex_init: argument 0"}
!1300 = distinct !{!1300, !"ext_602168_pthread_mutex_init"}
!1301 = !{!1302}
!1302 = distinct !{!1302, !1300, !"ext_602168_pthread_mutex_init: argument 1"}
!1303 = !{!1304}
!1304 = distinct !{!1304, !1305, !"ext_4007f0_pthread_cond_init: argument 0"}
!1305 = distinct !{!1305, !"ext_4007f0_pthread_cond_init"}
!1306 = !{!1307}
!1307 = distinct !{!1307, !1305, !"ext_4007f0_pthread_cond_init: argument 1"}
!1308 = !{!1309}
!1309 = distinct !{!1309, !1310, !"ext_4007c0_printf: argument 0"}
!1310 = distinct !{!1310, !"ext_4007c0_printf"}
!1311 = !{!1312}
!1312 = distinct !{!1312, !1310, !"ext_4007c0_printf: argument 1"}
!1313 = !{!1314}
!1314 = distinct !{!1314, !1315, !"ext_400830_exit: argument 0"}
!1315 = distinct !{!1315, !"ext_400830_exit"}
!1316 = !{!1317}
!1317 = distinct !{!1317, !1315, !"ext_400830_exit: argument 1"}
!1318 = !{!1319}
!1319 = distinct !{!1319, !1320, !"ext_4007c0_printf: argument 0"}
!1320 = distinct !{!1320, !"ext_4007c0_printf"}
!1321 = !{!1322}
!1322 = distinct !{!1322, !1320, !"ext_4007c0_printf: argument 1"}
!1323 = !{!1324}
!1324 = distinct !{!1324, !1325, !"ext_602150_fflush: argument 0"}
!1325 = distinct !{!1325, !"ext_602150_fflush"}
!1326 = !{!1327}
!1327 = distinct !{!1327, !1325, !"ext_602150_fflush: argument 1"}
!1328 = !{!1329}
!1329 = distinct !{!1329, !1330, !"ext_602158_pthread_join: argument 0"}
!1330 = distinct !{!1330, !"ext_602158_pthread_join"}
!1331 = !{!1332}
!1332 = distinct !{!1332, !1330, !"ext_602158_pthread_join: argument 1"}
!1333 = !{!1334}
!1334 = distinct !{!1334, !1335, !"ext_4007c0_printf: argument 0"}
!1335 = distinct !{!1335, !"ext_4007c0_printf"}
!1336 = !{!1337}
!1337 = distinct !{!1337, !1335, !"ext_4007c0_printf: argument 1"}
!1338 = !{!1339}
!1339 = distinct !{!1339, !1340, !"ext_400830_exit: argument 0"}
!1340 = distinct !{!1340, !"ext_400830_exit"}
!1341 = !{!1342}
!1342 = distinct !{!1342, !1340, !"ext_400830_exit: argument 1"}
!1343 = !{!1344}
!1344 = distinct !{!1344, !1345, !"ext_4007e0_pthread_cond_signal: argument 0"}
!1345 = distinct !{!1345, !"ext_4007e0_pthread_cond_signal"}
!1346 = !{!1347}
!1347 = distinct !{!1347, !1345, !"ext_4007e0_pthread_cond_signal: argument 1"}
!1348 = !{!1349}
!1349 = distinct !{!1349, !1350, !"ext_4007c0_printf: argument 0"}
!1350 = distinct !{!1350, !"ext_4007c0_printf"}
!1351 = !{!1352}
!1352 = distinct !{!1352, !1350, !"ext_4007c0_printf: argument 1"}
!1353 = !{!1354}
!1354 = distinct !{!1354, !1355, !"ext_4007a0_pthread_create: argument 0"}
!1355 = distinct !{!1355, !"ext_4007a0_pthread_create"}
!1356 = !{!1357}
!1357 = distinct !{!1357, !1355, !"ext_4007a0_pthread_create: argument 1"}
