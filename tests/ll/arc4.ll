; ModuleID = 'arc4.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu-elf"

%seg_400b90__rodata_type = type <{ [4 x i8], [9 x i8], [14 x i8], [4 x i8] }>
%seg_600de8__init_array_type = type <{ i64, i64 }>
%seg_601000__got_plt_type = type <{ [24 x i8], i64, i64, i64, i64 }>
%_edata_type = type <{ [8 x i8] }>
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

@seg_400b90__rodata = internal constant %seg_400b90__rodata_type <{ [4 x i8] c"\01\00\02\00", [9 x i8] c"password\00", [14 x i8] c"Hello, world!\00", [4 x i8] c"%s\0A\00" }>
@seg_600de8__init_array = internal global %seg_600de8__init_array_type <{ i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_400600_frame_dummy to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_4005d0___do_global_dtors_aux to i64) }>
@seg_601000__got_plt = internal global %seg_601000__got_plt_type <{ [24 x i8] c"\F8\0D`\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @printf to i64), i64 ptrtoint (i64 (i64, i64, i64)* @memset to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @__libc_start_main to i64), i64 ptrtoint (i64 (i64, i64, i64)* @memcmp to i64) }>
@_edata = global %_edata_type zeroinitializer
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
declare extern_weak x86_64_sysvcc i64 @__gmon_start__() #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @memcmp(i64, i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @memset(i64, i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @printf(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @__libc_start_main(i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400620__Z11arc4_setkeyPvPKhj(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg8, %struct.Memory* noalias readnone returned %arg9) local_unnamed_addr #3 {
block_400620:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0
  %tmp10 = bitcast %union.anon* %tmp to i32*
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp13 = getelementptr inbounds %union.anon, %union.anon* %tmp, i64 0, i32 0
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp16 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp18 = load i64, i64* %tmp17, align 8
  %tmp19 = load i64, i64* %tmp16, align 8, !tbaa !1231
  %tmp20 = add i64 %tmp19, -8
  %tmp21 = inttoptr i64 %tmp20 to i64*
  store i64 %tmp18, i64* %tmp21, align 8
  store i64 %tmp20, i64* %tmp16, align 8, !tbaa !1231
  %tmp22 = add i64 %tmp19, -16
  %tmp23 = load i64, i64* %tmp15, align 8
  %tmp24 = inttoptr i64 %tmp22 to i64*
  store i64 %tmp23, i64* %tmp24, align 8
  %tmp25 = add i64 %tmp19, -24
  %tmp26 = load i64, i64* %tmp14, align 8
  %tmp27 = inttoptr i64 %tmp25 to i64*
  store i64 %tmp26, i64* %tmp27, align 8
  %tmp28 = add i64 %tmp19, -28
  %tmp29 = load i32, i32* %tmp10, align 4
  %tmp30 = inttoptr i64 %tmp28 to i32*
  store i32 %tmp29, i32* %tmp30, align 4
  %tmp31 = load i64, i64* %tmp24, align 8
  %tmp32 = add i64 %tmp19, -40
  %tmp33 = inttoptr i64 %tmp32 to i64*
  store i64 %tmp31, i64* %tmp33, align 8
  %tmp34 = add i64 %tmp31, 8
  %tmp35 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp36 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp37 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp38 = add i64 %tmp19, -72
  %tmp39 = inttoptr i64 %tmp38 to i64*
  store i64 %tmp34, i64* %tmp39, align 8
  %tmp40 = inttoptr i64 %tmp32 to i32**
  %tmp41 = load i32*, i32** %tmp40, align 8
  store i32 0, i32* %tmp41, align 4
  %tmp42 = load i64, i64* %tmp33, align 8
  store i64 %tmp42, i64* %tmp14, align 8, !tbaa !1231
  %tmp43 = add i64 %tmp42, 4
  %tmp44 = inttoptr i64 %tmp43 to i32*
  store i32 0, i32* %tmp44, align 4
  %tmp45 = add i64 %tmp19, -44
  %tmp46 = inttoptr i64 %tmp45 to i32*
  store i32 0, i32* %tmp46, align 4
  br label %block_40066c

block_400689:                                     ; preds = %block_40066c
  %tmp47 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp48 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp49 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp50 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp51 = add i64 %tmp19, -60
  %tmp52 = inttoptr i64 %tmp51 to i32*
  store i32 0, i32* %tmp52, align 4
  %tmp53 = add i64 %tmp19, -56
  %tmp54 = inttoptr i64 %tmp53 to i32*
  store i32 0, i32* %tmp54, align 4
  store i32 0, i32* %tmp46, align 4
  %tmp55 = add i64 %tmp19, -48
  %tmp56 = add i64 %tmp19, -52
  %tmp57 = inttoptr i64 %tmp55 to i32*
  %tmp58 = inttoptr i64 %tmp56 to i32*
  br label %block_4006ab

block_40066c:                                     ; preds = %block_400620, %block_40066c
  %storemerge2 = phi i32 [ 0, %block_400620 ], [ %tmp65, %block_40066c ]
  %tmp59 = zext i32 %storemerge2 to i64
  %tmp60 = load i64, i64* %tmp39, align 8
  store i64 %tmp60, i64* %tmp12, align 8, !tbaa !1231
  store i64 %tmp59, i64* %tmp13, align 8, !tbaa !1231
  store i64 %tmp59, i64* %tmp14, align 8, !tbaa !1231
  %tmp61 = shl nuw nsw i64 %tmp59, 2
  %tmp62 = add i64 %tmp60, %tmp61
  %tmp63 = inttoptr i64 %tmp62 to i32*
  store i32 %storemerge2, i32* %tmp63, align 4
  %tmp64 = load i32, i32* %tmp46, align 4
  %tmp65 = add i32 %tmp64, 1
  %tmp66 = zext i32 %tmp65 to i64
  store i64 %tmp66, i64* %tmp11, align 8, !tbaa !1231
  store i32 %tmp65, i32* %tmp46, align 4
  %tmp67 = icmp ult i32 %tmp65, 256
  br i1 %tmp67, label %block_40066c, label %block_400689

block_400731:                                     ; preds = %block_4006ab
  %tmp68 = add i32 %tmp137, -255
  %tmp69 = lshr i32 %tmp68, 31
  %tmp70 = lshr i32 %tmp138, 31
  %tmp71 = and i32 %tmp68, 255
  %tmp72 = tail call i32 @llvm.ctpop.i32(i32 %tmp71) #15, !range !1235
  %tmp73 = trunc i32 %tmp72 to i8
  %tmp74 = and i8 %tmp73, 1
  %tmp75 = xor i8 %tmp74, 1
  %tmp76 = xor i32 %tmp68, %tmp138
  %tmp77 = lshr i32 %tmp76, 4
  %tmp78 = trunc i32 %tmp77 to i8
  %tmp79 = and i8 %tmp78, 1
  %tmp80 = icmp eq i32 %tmp68, 0
  %tmp81 = zext i1 %tmp80 to i8
  %tmp82 = trunc i32 %tmp69 to i8
  %tmp83 = xor i32 %tmp69, %tmp70
  %tmp84 = add nuw nsw i32 %tmp83, %tmp70
  %tmp85 = icmp eq i32 %tmp84, 2
  %tmp86 = zext i1 %tmp85 to i8
  store i8 0, i8* %tmp35, align 1, !tbaa !1236
  store i8 %tmp75, i8* %tmp48, align 1, !tbaa !1250
  store i8 %tmp79, i8* %tmp36, align 1, !tbaa !1251
  store i8 %tmp81, i8* %tmp49, align 1, !tbaa !1252
  store i8 %tmp82, i8* %tmp37, align 1, !tbaa !1253
  store i8 %tmp86, i8* %tmp50, align 1, !tbaa !1254
  %tmp87 = load i64, i64* %tmp16, align 8, !tbaa !1231
  %tmp88 = add i64 %tmp87, 8
  %tmp89 = inttoptr i64 %tmp87 to i64*
  %tmp90 = load i64, i64* %tmp89, align 8
  store i64 %tmp90, i64* %tmp17, align 8, !tbaa !1231
  %tmp91 = inttoptr i64 %tmp88 to i64*
  %tmp92 = load i64, i64* %tmp91, align 8
  store i64 %tmp92, i64* %tmp47, align 8, !tbaa !1231
  %tmp93 = add i64 %tmp87, 16
  store i64 %tmp93, i64* %tmp16, align 8, !tbaa !1231
  ret %struct.Memory* %arg9

block_4006ab:                                     ; preds = %block_400689, %block_4006ab
  %tmp94 = phi i32 [ 0, %block_400689 ], [ %tmp138, %block_4006ab ]
  %tmp95 = load i64, i64* %tmp39, align 8
  %tmp96 = zext i32 %tmp94 to i64
  %tmp97 = shl nuw nsw i64 %tmp96, 2
  %tmp98 = add i64 %tmp95, %tmp97
  %tmp99 = inttoptr i64 %tmp98 to i32*
  %tmp100 = load i32, i32* %tmp99, align 4
  store i32 %tmp100, i32* %tmp57, align 4
  %tmp101 = load i32, i32* %tmp52, align 4
  %tmp102 = load i64, i64* %tmp27, align 8
  %tmp103 = load i32, i32* %tmp54, align 4
  %tmp104 = zext i32 %tmp103 to i64
  %tmp105 = add i64 %tmp102, %tmp104
  %tmp106 = inttoptr i64 %tmp105 to i8*
  %tmp107 = load i8, i8* %tmp106, align 1
  %tmp108 = zext i8 %tmp107 to i32
  %tmp109 = add i32 %tmp101, %tmp100
  %tmp110 = add i32 %tmp109, %tmp108
  %tmp111 = and i32 %tmp110, 255
  store i32 %tmp111, i32* %tmp52, align 4
  %tmp112 = load i64, i64* %tmp39, align 8
  %tmp113 = shl nuw nsw i32 %tmp111, 2
  %tmp114 = zext i32 %tmp113 to i64
  %tmp115 = add i64 %tmp112, %tmp114
  %tmp116 = inttoptr i64 %tmp115 to i32*
  %tmp117 = load i32, i32* %tmp116, align 4
  store i32 %tmp117, i32* %tmp58, align 4
  %tmp118 = load i32, i32* %tmp57, align 4
  %tmp119 = load i64, i64* %tmp39, align 8
  %tmp120 = load i32, i32* %tmp52, align 4
  %tmp121 = zext i32 %tmp120 to i64
  %tmp122 = shl nuw nsw i64 %tmp121, 2
  %tmp123 = add i64 %tmp122, %tmp119
  %tmp124 = inttoptr i64 %tmp123 to i32*
  store i32 %tmp118, i32* %tmp124, align 4
  %tmp125 = load i32, i32* %tmp58, align 4
  %tmp126 = load i64, i64* %tmp39, align 8
  %tmp127 = load i32, i32* %tmp46, align 4
  %tmp128 = zext i32 %tmp127 to i64
  store i64 %tmp128, i64* %tmp14, align 8, !tbaa !1231
  store i64 %tmp128, i64* %tmp13, align 8, !tbaa !1231
  %tmp129 = shl nuw nsw i64 %tmp128, 2
  %tmp130 = add i64 %tmp129, %tmp126
  %tmp131 = inttoptr i64 %tmp130 to i32*
  store i32 %tmp125, i32* %tmp131, align 4
  %tmp132 = load i32, i32* %tmp54, align 4
  %tmp133 = add i32 %tmp132, 1
  %tmp134 = zext i32 %tmp133 to i64
  store i64 %tmp134, i64* %tmp12, align 8, !tbaa !1231
  store i32 %tmp133, i32* %tmp54, align 4
  %tmp135 = load i32, i32* %tmp30, align 4
  %tmp136 = icmp ult i32 %tmp133, %tmp135
  %spec.store.select = select i1 %tmp136, i32 %tmp133, i32 0
  store i32 %spec.store.select, i32* %tmp54, align 4
  %tmp137 = load i32, i32* %tmp46, align 4
  %tmp138 = add i32 %tmp137, 1
  %tmp139 = zext i32 %tmp138 to i64
  store i64 %tmp139, i64* %tmp11, align 8, !tbaa !1231
  store i32 %tmp138, i32* %tmp46, align 4
  %tmp140 = icmp ult i32 %tmp138, 256
  br i1 %tmp140, label %block_4006ab, label %block_400731
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400600_frame_dummy(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400600:
  %tmp = tail call %struct.Memory* @sub_400590_register_tm_clones(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  ret %struct.Memory* %tmp
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4005d0___do_global_dtors_aux(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_4005d0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp4 = load i8, i8* getelementptr inbounds (%_edata_type, %_edata_type* @_edata, i64 0, i32 0, i64 0), align 8
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  store i8 0, i8* %tmp5, align 1, !tbaa !1236
  %tmp6 = zext i8 %tmp4 to i32
  %tmp7 = tail call i32 @llvm.ctpop.i32(i32 %tmp6) #15, !range !1235
  %tmp8 = trunc i32 %tmp7 to i8
  %tmp9 = and i8 %tmp8, 1
  %tmp10 = xor i8 %tmp9, 1
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  store i8 %tmp10, i8* %tmp11, align 1, !tbaa !1250
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  store i8 0, i8* %tmp12, align 1, !tbaa !1251
  %tmp13 = icmp eq i8 %tmp4, 0
  %tmp14 = zext i1 %tmp13 to i8
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  store i8 %tmp14, i8* %tmp15, align 1, !tbaa !1252
  %tmp16 = lshr i8 %tmp4, 7
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  store i8 %tmp16, i8* %tmp17, align 1, !tbaa !1253
  %tmp18 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i8 0, i8* %tmp18, align 1, !tbaa !1254
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  br i1 %tmp13, label %block_4005d9, label %block_4005f0

block_4005d9:                                     ; preds = %block_4005d0
  %tmp20 = load i64, i64* %tmp3, align 8
  %tmp21 = load i64, i64* %tmp19, align 8, !tbaa !1231
  %tmp22 = add i64 %tmp21, -8
  %tmp23 = inttoptr i64 %tmp22 to i64*
  store i64 %tmp20, i64* %tmp23, align 8
  store i64 %tmp22, i64* %tmp3, align 8, !tbaa !1231
  %tmp24 = add i64 %arg1, 18
  %tmp25 = add i64 %tmp21, -16
  %tmp26 = inttoptr i64 %tmp25 to i64*
  store i64 %tmp24, i64* %tmp26, align 8
  store i64 %tmp25, i64* %tmp19, align 8, !tbaa !1231
  %tmp27 = tail call %struct.Memory* @sub_400560_deregister_tm_clones(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  store i8 1, i8* getelementptr inbounds (%_edata_type, %_edata_type* @_edata, i64 0, i32 0, i64 0), align 8
  %tmp28 = load i64, i64* %tmp19, align 8, !tbaa !1231
  %tmp29 = add i64 %tmp28, 8
  %tmp30 = inttoptr i64 %tmp28 to i64*
  %tmp31 = load i64, i64* %tmp30, align 8
  store i64 %tmp31, i64* %tmp3, align 8, !tbaa !1231
  %tmp32 = inttoptr i64 %tmp29 to i64*
  %tmp33 = load i64, i64* %tmp32, align 8
  store i64 %tmp33, i64* %tmp, align 8, !tbaa !1231
  %tmp34 = add i64 %tmp28, 16
  store i64 %tmp34, i64* %tmp19, align 8, !tbaa !1231
  ret %struct.Memory* %tmp27

block_4005f0:                                     ; preds = %block_4005d0
  %tmp35 = load i64, i64* %tmp19, align 8, !tbaa !1231
  %tmp36 = inttoptr i64 %tmp35 to i64*
  %tmp37 = load i64, i64* %tmp36, align 8
  store i64 %tmp37, i64* %tmp, align 8, !tbaa !1231
  %tmp38 = add i64 %tmp35, 8
  store i64 %tmp38, i64* %tmp19, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400590_register_tm_clones(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400590:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3), i64 63), i64* %tmp3, align 8, !tbaa !1231
  store i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3)), i64 1), i64* %tmp4, align 8, !tbaa !1231
  store i8 and (i8 trunc (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3)) to i8), i8 1), i8* %tmp5, align 1, !tbaa !1255
  %tmp11 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3)), i64 1) to i32), i32 255)) #15, !range !1235
  %tmp12 = trunc i32 %tmp11 to i8
  %tmp13 = and i8 %tmp12, 1
  %tmp14 = xor i8 %tmp13, 1
  store i8 %tmp14, i8* %tmp6, align 1, !tbaa !1255
  store i8 0, i8* %tmp7, align 1, !tbaa !1255
  store i8 zext (i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3)), i64 1), i64 0) to i8), i8* %tmp8, align 1, !tbaa !1255
  store i8 trunc (i64 lshr (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3)), i64 1), i64 63) to i8), i8* %tmp9, align 1, !tbaa !1255
  store i8 0, i8* %tmp10, align 1, !tbaa !1255
  br i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 3)), i64 1), i64 0), label %block_4005c0, label %block_4005af

block_4005af:                                     ; preds = %block_400590
  store i64 0, i64* %tmp3, align 8, !tbaa !1231
  store i8 0, i8* %tmp5, align 1, !tbaa !1236
  store i8 1, i8* %tmp6, align 1, !tbaa !1250
  store i8 1, i8* %tmp8, align 1, !tbaa !1252
  store i8 0, i8* %tmp9, align 1, !tbaa !1253
  store i8 0, i8* %tmp10, align 1, !tbaa !1254
  store i8 0, i8* %tmp7, align 1, !tbaa !1251
  br label %block_4005c0

block_4005c0:                                     ; preds = %block_4005af, %block_400590
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp16 = load i64, i64* %tmp15, align 8, !tbaa !1231
  %tmp17 = inttoptr i64 %tmp16 to i64*
  %tmp18 = load i64, i64* %tmp17, align 8
  store i64 %tmp18, i64* %tmp, align 8, !tbaa !1231
  %tmp19 = add i64 %tmp16, 8
  store i64 %tmp19, i64* %tmp15, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400560_deregister_tm_clones(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400560:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  store i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64* %tmp3, align 8, !tbaa !1231
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  store i8 zext (i1 icmp ult (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)) to i8), i8* %tmp4, align 1, !tbaa !1236
  %tmp5 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)) to i32), i32 255)) #15, !range !1256
  %tmp6 = trunc i32 %tmp5 to i8
  %tmp7 = and i8 %tmp6, 1
  %tmp8 = xor i8 %tmp7, 1
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  store i8 %tmp8, i8* %tmp9, align 1, !tbaa !1250
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  store i8 and (i8 trunc (i64 lshr (i64 xor (i64 xor (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64))), i64 4) to i8), i8 1), i8* %tmp10, align 1, !tbaa !1251
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  store i8 zext (i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 0) to i8), i8* %tmp11, align 1, !tbaa !1252
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  store i8 trunc (i64 lshr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 63) to i8), i8* %tmp12, align 1, !tbaa !1253
  %tmp13 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i8 zext (i1 icmp eq (i64 add (i64 xor (i64 lshr (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 63), i64 lshr (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 63)), i64 xor (i64 lshr (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 63), i64 lshr (i64 ptrtoint (%_edata_type* @_edata to i64), i64 63))), i64 2) to i8), i8* %tmp13, align 1, !tbaa !1254
  br i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (%_edata_type* @_edata to i64), i64 4294967295), i64 ptrtoint (%_edata_type* @_edata to i64)), i64 0), label %block_400580, label %block_40056d

block_40056d:                                     ; preds = %block_400560
  store i64 0, i64* %tmp3, align 8, !tbaa !1231
  store i8 0, i8* %tmp4, align 1, !tbaa !1236
  store i8 1, i8* %tmp9, align 1, !tbaa !1250
  store i8 1, i8* %tmp11, align 1, !tbaa !1252
  store i8 0, i8* %tmp12, align 1, !tbaa !1253
  store i8 0, i8* %tmp13, align 1, !tbaa !1254
  store i8 0, i8* %tmp10, align 1, !tbaa !1251
  br label %block_400580

block_400580:                                     ; preds = %block_40056d, %block_400560
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp15 = load i64, i64* %tmp14, align 8, !tbaa !1231
  %tmp16 = inttoptr i64 %tmp15 to i64*
  %tmp17 = load i64, i64* %tmp16, align 8
  store i64 %tmp17, i64* %tmp, align 8, !tbaa !1231
  %tmp18 = add i64 %tmp15, 8
  store i64 %tmp18, i64* %tmp14, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline norecurse nounwind
define %struct.Memory* @sub_400850__Z11arc4_streamPvPhi(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg13, %struct.Memory* noalias readnone returned %arg14) local_unnamed_addr #4 {
block_400850:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0
  %tmp16 = bitcast %union.anon* %tmp15 to i8*
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0
  %tmp18 = bitcast %union.anon* %tmp17 to i32*
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp20 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp21 = getelementptr inbounds %union.anon, %union.anon* %tmp17, i64 0, i32 0
  %tmp22 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp23 = getelementptr inbounds %union.anon, %union.anon* %tmp15, i64 0, i32 0
  %tmp24 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp25 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp26 = load i64, i64* %tmp25, align 8
  %tmp27 = load i64, i64* %tmp24, align 8, !tbaa !1231
  %tmp28 = add i64 %tmp27, -8
  %tmp29 = inttoptr i64 %tmp28 to i64*
  store i64 %tmp26, i64* %tmp29, align 8
  store i64 %tmp28, i64* %tmp24, align 8, !tbaa !1231
  store i64 %tmp28, i64* %tmp25, align 8, !tbaa !1231
  %tmp30 = add i64 %tmp27, -16
  %tmp31 = load i64, i64* %tmp23, align 8
  %tmp32 = inttoptr i64 %tmp30 to i64*
  store i64 %tmp31, i64* %tmp32, align 8
  %tmp33 = add i64 %tmp27, -24
  %tmp34 = load i64, i64* %tmp22, align 8
  %tmp35 = inttoptr i64 %tmp33 to i64*
  store i64 %tmp34, i64* %tmp35, align 8
  %tmp36 = add i64 %tmp27, -28
  %tmp37 = load i32, i32* %tmp18, align 4
  %tmp38 = inttoptr i64 %tmp36 to i32*
  store i32 %tmp37, i32* %tmp38, align 4
  %tmp39 = load i64, i64* %tmp32, align 8
  %tmp40 = add i64 %tmp27, -40
  %tmp41 = inttoptr i64 %tmp40 to i64*
  store i64 %tmp39, i64* %tmp41, align 8
  %tmp42 = add i64 %tmp39, 8
  %tmp43 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp44 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp45 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp46 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp47 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp48 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp49 = add i64 %tmp27, -64
  %tmp50 = inttoptr i64 %tmp49 to i64*
  store i64 %tmp42, i64* %tmp50, align 8
  %tmp51 = inttoptr i64 %tmp40 to i32**
  %tmp52 = load i32*, i32** %tmp51, align 8
  %tmp53 = load i32, i32* %tmp52, align 4
  %tmp54 = add i64 %tmp27, -44
  %tmp55 = inttoptr i64 %tmp54 to i32*
  store i32 %tmp53, i32* %tmp55, align 4
  %tmp56 = load i64, i64* %tmp41, align 8
  %tmp57 = add i64 %tmp56, 4
  %tmp58 = inttoptr i64 %tmp57 to i32*
  %tmp59 = load i32, i32* %tmp58, align 4
  %tmp60 = zext i32 %tmp59 to i64
  store i64 %tmp60, i64* %tmp21, align 8, !tbaa !1231
  %tmp61 = add i64 %tmp27, -48
  %tmp62 = inttoptr i64 %tmp61 to i32*
  store i32 %tmp59, i32* %tmp62, align 4
  %tmp63 = load i64, i64* %tmp35, align 8
  %tmp64 = load i32, i32* %tmp38, align 4
  %tmp65 = sext i32 %tmp64 to i64
  store i64 %tmp65, i64* %tmp23, align 8, !tbaa !1231
  %tmp66 = add i64 %tmp63, %tmp65
  store i64 %tmp66, i64* %tmp22, align 8, !tbaa !1231
  %tmp67 = load i64, i64* %tmp25, align 8
  %tmp68 = add i64 %tmp67, -64
  %tmp69 = inttoptr i64 %tmp68 to i64*
  store i64 %tmp66, i64* %tmp69, align 8
  %tmp70 = add i64 %tmp67, -16
  %tmp71 = add i64 %tmp67, -36
  %tmp72 = inttoptr i64 %tmp70 to i64*
  %tmp73 = load i64, i64* %tmp72, align 8
  %tmp74 = icmp eq i64 %tmp73, %tmp66
  %tmp75 = inttoptr i64 %tmp71 to i32*
  %tmp76 = load i32, i32* %tmp75, align 4
  br i1 %tmp74, label %block_400929, label %block_4008a3.lr.ph

block_4008a3.lr.ph:                               ; preds = %block_400850
  %tmp77 = add i64 %tmp67, -48
  %tmp78 = add i64 %tmp67, -40
  %tmp79 = add i64 %tmp67, -44
  %tmp80 = add i64 %tmp67, -56
  %tmp81 = inttoptr i64 %tmp80 to i64*
  %tmp82 = inttoptr i64 %tmp79 to i32*
  %tmp83 = inttoptr i64 %tmp78 to i32*
  %tmp84 = inttoptr i64 %tmp77 to i32*
  %tmp85 = inttoptr i64 %tmp70 to i8**
  br label %block_4008a3

block_400929:                                     ; preds = %block_4008a3, %block_400850
  %.lcssa = phi i32 [ %tmp76, %block_400850 ], [ %tmp153, %block_4008a3 ]
  store i8 0, i8* %tmp43, align 1, !tbaa !1236
  store i8 1, i8* %tmp44, align 1, !tbaa !1250
  store i8 0, i8* %tmp45, align 1, !tbaa !1251
  store i8 1, i8* %tmp46, align 1, !tbaa !1252
  store i8 0, i8* %tmp47, align 1, !tbaa !1253
  store i8 0, i8* %tmp48, align 1, !tbaa !1254
  %tmp86 = load i64, i64* %tmp25, align 8
  %tmp87 = add i64 %tmp86, -32
  %tmp88 = inttoptr i64 %tmp87 to i64*
  %tmp89 = inttoptr i64 %tmp87 to i32**
  %tmp90 = load i32*, i32** %tmp89, align 8
  store i32 %.lcssa, i32* %tmp90, align 4
  %tmp91 = add i64 %tmp86, -40
  %tmp92 = inttoptr i64 %tmp91 to i32*
  %tmp93 = load i32, i32* %tmp92, align 4
  %tmp94 = zext i32 %tmp93 to i64
  store i64 %tmp94, i64* %tmp19, align 8, !tbaa !1231
  %tmp95 = load i64, i64* %tmp88, align 8
  store i64 %tmp95, i64* %tmp20, align 8, !tbaa !1231
  %tmp96 = add i64 %tmp95, 4
  %tmp97 = inttoptr i64 %tmp96 to i32*
  store i32 %tmp93, i32* %tmp97, align 4
  %tmp98 = load i64, i64* %tmp24, align 8, !tbaa !1231
  %tmp99 = add i64 %tmp98, 8
  %tmp100 = inttoptr i64 %tmp98 to i64*
  %tmp101 = load i64, i64* %tmp100, align 8
  store i64 %tmp101, i64* %tmp25, align 8, !tbaa !1231
  %tmp102 = inttoptr i64 %tmp99 to i64*
  %tmp103 = load i64, i64* %tmp102, align 8
  store i64 %tmp103, i64* %tmp, align 8, !tbaa !1231
  %tmp104 = add i64 %tmp98, 16
  store i64 %tmp104, i64* %tmp24, align 8, !tbaa !1231
  ret %struct.Memory* %arg14

block_4008a3:                                     ; preds = %block_4008a3.lr.ph, %block_4008a3
  %tmp105 = phi i32 [ %tmp76, %block_4008a3.lr.ph ], [ %tmp153, %block_4008a3 ]
  %tmp106 = add i32 %tmp105, 1
  %tmp107 = and i32 %tmp106, 255
  store i32 %tmp107, i32* %tmp75, align 4
  %tmp108 = load i64, i64* %tmp81, align 8
  %tmp109 = shl nuw nsw i32 %tmp107, 2
  %tmp110 = zext i32 %tmp109 to i64
  %tmp111 = add i64 %tmp108, %tmp110
  %tmp112 = inttoptr i64 %tmp111 to i32*
  %tmp113 = load i32, i32* %tmp112, align 4
  store i32 %tmp113, i32* %tmp82, align 4
  %tmp114 = load i32, i32* %tmp83, align 4
  %tmp115 = add i32 %tmp114, %tmp113
  %tmp116 = and i32 %tmp115, 255
  store i32 %tmp116, i32* %tmp83, align 4
  %tmp117 = load i64, i64* %tmp81, align 8
  %tmp118 = shl nuw nsw i32 %tmp116, 2
  %tmp119 = zext i32 %tmp118 to i64
  %tmp120 = add i64 %tmp117, %tmp119
  %tmp121 = inttoptr i64 %tmp120 to i32*
  %tmp122 = load i32, i32* %tmp121, align 4
  store i32 %tmp122, i32* %tmp84, align 4
  %tmp123 = load i64, i64* %tmp81, align 8
  %tmp124 = load i32, i32* %tmp75, align 4
  %tmp125 = zext i32 %tmp124 to i64
  %tmp126 = shl nuw nsw i64 %tmp125, 2
  %tmp127 = add i64 %tmp126, %tmp123
  %tmp128 = inttoptr i64 %tmp127 to i32*
  store i32 %tmp122, i32* %tmp128, align 4
  %tmp129 = load i32, i32* %tmp82, align 4
  %tmp130 = load i64, i64* %tmp81, align 8
  %tmp131 = load i32, i32* %tmp83, align 4
  %tmp132 = zext i32 %tmp131 to i64
  store i64 %tmp132, i64* %tmp22, align 8, !tbaa !1231
  %tmp133 = shl nuw nsw i64 %tmp132, 2
  %tmp134 = add i64 %tmp133, %tmp130
  %tmp135 = inttoptr i64 %tmp134 to i32*
  store i32 %tmp129, i32* %tmp135, align 4
  %tmp136 = load i64, i64* %tmp81, align 8
  %tmp137 = load i32, i32* %tmp82, align 4
  %tmp138 = load i32, i32* %tmp84, align 4
  %tmp139 = add i32 %tmp138, %tmp137
  %tmp140 = and i32 %tmp139, 255
  %tmp141 = zext i32 %tmp140 to i64
  store i64 %tmp141, i64* %tmp21, align 8, !tbaa !1231
  %tmp142 = shl nuw nsw i32 %tmp140, 2
  %tmp143 = zext i32 %tmp142 to i64
  %tmp144 = add i64 %tmp136, %tmp143
  %tmp145 = inttoptr i64 %tmp144 to i32*
  %tmp146 = load i32, i32* %tmp145, align 4
  %tmp147 = trunc i32 %tmp146 to i8
  store i8 %tmp147, i8* %tmp16, align 1, !tbaa !1255
  %tmp148 = load i8*, i8** %tmp85, align 8
  store i8 %tmp147, i8* %tmp148, align 1
  %tmp149 = load i64, i64* %tmp72, align 8
  %tmp150 = add i64 %tmp149, 1
  store i64 %tmp150, i64* %tmp72, align 8
  %tmp151 = load i64, i64* %tmp69, align 8
  %tmp152 = icmp eq i64 %tmp150, %tmp151
  %tmp153 = load i32, i32* %tmp75, align 4
  br i1 %tmp152, label %block_400929, label %block_4008a3
}

; Function Attrs: noinline
define %struct.Memory* @sub_4004b0__init_proc(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone %arg2) local_unnamed_addr #5 {
block_4004b0:
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
  store i8 0, i8* %tmp7, align 1, !tbaa !1236
  %tmp13 = tail call i32 @llvm.ctpop.i32(i32 and (i32 ptrtoint (i64 ()* @__gmon_start__ to i32), i32 255)) #15, !range !1235
  %tmp14 = trunc i32 %tmp13 to i8
  %tmp15 = and i8 %tmp14, 1
  %tmp16 = xor i8 %tmp15, 1
  store i8 %tmp16, i8* %tmp8, align 1, !tbaa !1250
  store i8 zext (i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null) to i8), i8* %tmp10, align 1, !tbaa !1252
  store i8 trunc (i64 lshr (i64 ptrtoint (i64 ()* @__gmon_start__ to i64), i64 63) to i8), i8* %tmp11, align 1, !tbaa !1253
  store i8 0, i8* %tmp12, align 1, !tbaa !1254
  store i8 0, i8* %tmp9, align 1, !tbaa !1251
  br i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null), label %block_4004c5, label %block_4004c0

block_4004c5:                                     ; preds = %block_4004c0, %block_4004b0
  %tmp17 = phi i64 [ %tmp6, %block_4004b0 ], [ %tmp48, %block_4004c0 ]
  %tmp18 = phi %struct.Memory* [ %arg2, %block_4004b0 ], [ %tmp47, %block_4004c0 ]
  %tmp19 = add i64 %tmp17, 8
  %tmp20 = icmp ugt i64 %tmp17, -9
  %tmp21 = zext i1 %tmp20 to i8
  store i8 %tmp21, i8* %tmp7, align 1, !tbaa !1236
  %tmp22 = trunc i64 %tmp19 to i32
  %tmp23 = and i32 %tmp22, 255
  %tmp24 = tail call i32 @llvm.ctpop.i32(i32 %tmp23) #15, !range !1235
  %tmp25 = trunc i32 %tmp24 to i8
  %tmp26 = and i8 %tmp25, 1
  %tmp27 = xor i8 %tmp26, 1
  store i8 %tmp27, i8* %tmp8, align 1, !tbaa !1250
  %tmp28 = xor i64 %tmp19, %tmp17
  %tmp29 = lshr i64 %tmp28, 4
  %tmp30 = trunc i64 %tmp29 to i8
  %tmp31 = and i8 %tmp30, 1
  store i8 %tmp31, i8* %tmp9, align 1, !tbaa !1251
  %tmp32 = icmp eq i64 %tmp19, 0
  %tmp33 = zext i1 %tmp32 to i8
  store i8 %tmp33, i8* %tmp10, align 1, !tbaa !1252
  %tmp34 = lshr i64 %tmp19, 63
  %tmp35 = trunc i64 %tmp34 to i8
  store i8 %tmp35, i8* %tmp11, align 1, !tbaa !1253
  %tmp36 = lshr i64 %tmp17, 63
  %tmp37 = xor i64 %tmp34, %tmp36
  %tmp38 = add nuw nsw i64 %tmp37, %tmp34
  %tmp39 = icmp eq i64 %tmp38, 2
  %tmp40 = zext i1 %tmp39 to i8
  store i8 %tmp40, i8* %tmp12, align 1, !tbaa !1254
  %tmp41 = inttoptr i64 %tmp19 to i64*
  %tmp42 = load i64, i64* %tmp41, align 8
  store i64 %tmp42, i64* %tmp, align 8, !tbaa !1231
  %tmp43 = add i64 %tmp17, 16
  store i64 %tmp43, i64* %tmp4, align 8, !tbaa !1231
  ret %struct.Memory* %tmp18

block_4004c0:                                     ; preds = %block_4004b0
  %tmp44 = add i64 %arg1, add (i64 select (i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null), i64 21, i64 16), i64 5)
  %tmp45 = add i64 %tmp5, -16
  %tmp46 = inttoptr i64 %tmp45 to i64*
  store i64 %tmp44, i64* %tmp46, align 8
  store i64 %tmp45, i64* %tmp4, align 8, !tbaa !1231
  %tmp47 = tail call %struct.Memory* @sub_400520(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  %tmp48 = load i64, i64* %tmp4, align 8
  br label %block_4004c5
}

; Function Attrs: noinline
define %struct.Memory* @sub_400520(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #5 {
block_400520:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = load i64, i64* %tmp4, align 8, !alias.scope !1257, !noalias !1260
  %tmp6 = inttoptr i64 %tmp5 to i64*
  %tmp7 = load i64, i64* %tmp6, align 8
  store i64 %tmp7, i64* %tmp, align 8, !alias.scope !1257, !noalias !1260
  %tmp8 = add i64 %tmp5, 8
  store i64 %tmp8, i64* %tmp4, align 8, !alias.scope !1257, !noalias !1260
  %tmp9 = tail call i64 @__gmon_start__(), !noalias !1257
  store i64 %tmp9, i64* %tmp3, align 8, !alias.scope !1257, !noalias !1260
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline norecurse nounwind
define %struct.Memory* @sub_400610__Z11arc4_ctxlenv(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_400610:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp6 = load i64, i64* %tmp5, align 8
  %tmp7 = load i64, i64* %tmp4, align 8, !tbaa !1231
  %tmp8 = add i64 %tmp7, -8
  %tmp9 = inttoptr i64 %tmp8 to i64*
  store i64 %tmp6, i64* %tmp9, align 8
  store i64 1032, i64* %tmp3, align 8, !tbaa !1231
  %tmp10 = load i64, i64* %tmp9, align 8
  store i64 %tmp10, i64* %tmp5, align 8, !tbaa !1231
  %tmp11 = inttoptr i64 %tmp7 to i64*
  %tmp12 = load i64, i64* %tmp11, align 8
  store i64 %tmp12, i64* %tmp, align 8, !tbaa !1231
  %tmp13 = add i64 %tmp7, 8
  store i64 %tmp13, i64* %tmp4, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline norecurse nounwind
define %struct.Memory* @sub_400b80___libc_csu_fini(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_400b80:
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

; Function Attrs: noinline norecurse nounwind
define %struct.Memory* @sub_400740__Z12arc4_encryptPvPhPKhi(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg13, %struct.Memory* noalias readnone returned %arg14) local_unnamed_addr #4 {
block_400740:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0
  %tmp16 = bitcast %union.anon* %tmp15 to i8*
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0
  %tmp18 = bitcast %union.anon* %tmp17 to i32*
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp20 = getelementptr inbounds %union.anon, %union.anon* %tmp17, i64 0, i32 0
  %tmp21 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp22 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp23 = getelementptr inbounds %union.anon, %union.anon* %tmp15, i64 0, i32 0
  %tmp24 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp25 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp26 = load i64, i64* %tmp25, align 8
  %tmp27 = load i64, i64* %tmp24, align 8, !tbaa !1231
  %tmp28 = add i64 %tmp27, -8
  %tmp29 = inttoptr i64 %tmp28 to i64*
  store i64 %tmp26, i64* %tmp29, align 8
  store i64 %tmp28, i64* %tmp24, align 8, !tbaa !1231
  store i64 %tmp28, i64* %tmp25, align 8, !tbaa !1231
  %tmp30 = add i64 %tmp27, -16
  %tmp31 = load i64, i64* %tmp23, align 8
  %tmp32 = inttoptr i64 %tmp30 to i64*
  store i64 %tmp31, i64* %tmp32, align 8
  %tmp33 = add i64 %tmp27, -24
  %tmp34 = load i64, i64* %tmp22, align 8
  %tmp35 = inttoptr i64 %tmp33 to i64*
  store i64 %tmp34, i64* %tmp35, align 8
  %tmp36 = add i64 %tmp27, -32
  %tmp37 = load i64, i64* %tmp21, align 8
  %tmp38 = inttoptr i64 %tmp36 to i64*
  store i64 %tmp37, i64* %tmp38, align 8
  %tmp39 = add i64 %tmp27, -36
  %tmp40 = load i32, i32* %tmp18, align 4
  %tmp41 = inttoptr i64 %tmp39 to i32*
  store i32 %tmp40, i32* %tmp41, align 4
  %tmp42 = load i64, i64* %tmp32, align 8
  %tmp43 = add i64 %tmp27, -48
  %tmp44 = inttoptr i64 %tmp43 to i64*
  store i64 %tmp42, i64* %tmp44, align 8
  %tmp45 = add i64 %tmp42, 8
  %tmp46 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp47 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp48 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp49 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp50 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp51 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp52 = add i64 %tmp27, -72
  %tmp53 = inttoptr i64 %tmp52 to i64*
  store i64 %tmp45, i64* %tmp53, align 8
  %tmp54 = inttoptr i64 %tmp43 to i32**
  %tmp55 = load i32*, i32** %tmp54, align 8
  %tmp56 = load i32, i32* %tmp55, align 4
  %tmp57 = add i64 %tmp27, -52
  %tmp58 = inttoptr i64 %tmp57 to i32*
  store i32 %tmp56, i32* %tmp58, align 4
  %tmp59 = load i64, i64* %tmp44, align 8
  %tmp60 = add i64 %tmp59, 4
  %tmp61 = inttoptr i64 %tmp60 to i32*
  %tmp62 = load i32, i32* %tmp61, align 4
  %tmp63 = add i64 %tmp27, -56
  %tmp64 = inttoptr i64 %tmp63 to i32*
  store i32 %tmp62, i32* %tmp64, align 4
  %tmp65 = load i64, i64* %tmp25, align 8
  %tmp66 = add i64 %tmp65, -24
  %tmp67 = inttoptr i64 %tmp66 to i64*
  %tmp68 = load i64, i64* %tmp67, align 8
  %tmp69 = add i64 %tmp65, -28
  %tmp70 = inttoptr i64 %tmp69 to i32*
  %tmp71 = load i32, i32* %tmp70, align 4
  %tmp72 = sext i32 %tmp71 to i64
  store i64 %tmp72, i64* %tmp22, align 8, !tbaa !1231
  %tmp73 = add i64 %tmp68, %tmp72
  store i64 %tmp73, i64* %tmp21, align 8, !tbaa !1231
  %tmp74 = add i64 %tmp65, -72
  %tmp75 = inttoptr i64 %tmp74 to i64*
  store i64 %tmp73, i64* %tmp75, align 8
  %tmp76 = add i64 %tmp65, -44
  %tmp77 = add i64 %tmp65, -16
  %tmp78 = load i64, i64* %tmp67, align 8
  %tmp79 = icmp eq i64 %tmp78, %tmp73
  %tmp80 = inttoptr i64 %tmp76 to i32*
  %tmp81 = load i32, i32* %tmp80, align 4
  br i1 %tmp79, label %block_400831, label %block_400797.lr.ph

block_400797.lr.ph:                               ; preds = %block_400740
  %tmp82 = add i64 %tmp65, -56
  %tmp83 = add i64 %tmp65, -48
  %tmp84 = add i64 %tmp65, -52
  %tmp85 = add i64 %tmp65, -64
  %tmp86 = inttoptr i64 %tmp85 to i64*
  %tmp87 = inttoptr i64 %tmp84 to i32*
  %tmp88 = inttoptr i64 %tmp83 to i32*
  %tmp89 = inttoptr i64 %tmp82 to i32*
  %tmp90 = inttoptr i64 %tmp66 to i8**
  %tmp91 = inttoptr i64 %tmp77 to i64*
  %tmp92 = inttoptr i64 %tmp77 to i8**
  br label %block_400797

block_400831:                                     ; preds = %block_400797, %block_400740
  %.lcssa = phi i32 [ %tmp81, %block_400740 ], [ %tmp166, %block_400797 ]
  store i8 0, i8* %tmp46, align 1, !tbaa !1236
  store i8 1, i8* %tmp47, align 1, !tbaa !1250
  store i8 0, i8* %tmp48, align 1, !tbaa !1251
  store i8 1, i8* %tmp49, align 1, !tbaa !1252
  store i8 0, i8* %tmp50, align 1, !tbaa !1253
  store i8 0, i8* %tmp51, align 1, !tbaa !1254
  %tmp93 = load i64, i64* %tmp25, align 8
  %tmp94 = add i64 %tmp93, -40
  %tmp95 = inttoptr i64 %tmp94 to i64*
  %tmp96 = inttoptr i64 %tmp94 to i32**
  %tmp97 = load i32*, i32** %tmp96, align 8
  store i32 %.lcssa, i32* %tmp97, align 4
  %tmp98 = add i64 %tmp93, -48
  %tmp99 = inttoptr i64 %tmp98 to i32*
  %tmp100 = load i32, i32* %tmp99, align 4
  %tmp101 = zext i32 %tmp100 to i64
  store i64 %tmp101, i64* %tmp19, align 8, !tbaa !1231
  %tmp102 = load i64, i64* %tmp95, align 8
  store i64 %tmp102, i64* %tmp20, align 8, !tbaa !1231
  %tmp103 = add i64 %tmp102, 4
  %tmp104 = inttoptr i64 %tmp103 to i32*
  store i32 %tmp100, i32* %tmp104, align 4
  %tmp105 = load i64, i64* %tmp24, align 8, !tbaa !1231
  %tmp106 = add i64 %tmp105, 8
  %tmp107 = inttoptr i64 %tmp105 to i64*
  %tmp108 = load i64, i64* %tmp107, align 8
  store i64 %tmp108, i64* %tmp25, align 8, !tbaa !1231
  %tmp109 = inttoptr i64 %tmp106 to i64*
  %tmp110 = load i64, i64* %tmp109, align 8
  store i64 %tmp110, i64* %tmp, align 8, !tbaa !1231
  %tmp111 = add i64 %tmp105, 16
  store i64 %tmp111, i64* %tmp24, align 8, !tbaa !1231
  ret %struct.Memory* %arg14

block_400797:                                     ; preds = %block_400797.lr.ph, %block_400797
  %tmp112 = phi i32 [ %tmp81, %block_400797.lr.ph ], [ %tmp166, %block_400797 ]
  %tmp113 = add i32 %tmp112, 1
  %tmp114 = and i32 %tmp113, 255
  store i32 %tmp114, i32* %tmp80, align 4
  %tmp115 = load i64, i64* %tmp86, align 8
  %tmp116 = shl nuw nsw i32 %tmp114, 2
  %tmp117 = zext i32 %tmp116 to i64
  %tmp118 = add i64 %tmp115, %tmp117
  %tmp119 = inttoptr i64 %tmp118 to i32*
  %tmp120 = load i32, i32* %tmp119, align 4
  store i32 %tmp120, i32* %tmp87, align 4
  %tmp121 = load i32, i32* %tmp88, align 4
  %tmp122 = add i32 %tmp121, %tmp120
  %tmp123 = and i32 %tmp122, 255
  store i32 %tmp123, i32* %tmp88, align 4
  %tmp124 = load i64, i64* %tmp86, align 8
  %tmp125 = shl nuw nsw i32 %tmp123, 2
  %tmp126 = zext i32 %tmp125 to i64
  %tmp127 = add i64 %tmp124, %tmp126
  %tmp128 = inttoptr i64 %tmp127 to i32*
  %tmp129 = load i32, i32* %tmp128, align 4
  store i32 %tmp129, i32* %tmp89, align 4
  %tmp130 = load i64, i64* %tmp86, align 8
  %tmp131 = load i32, i32* %tmp80, align 4
  %tmp132 = zext i32 %tmp131 to i64
  %tmp133 = shl nuw nsw i64 %tmp132, 2
  %tmp134 = add i64 %tmp133, %tmp130
  %tmp135 = inttoptr i64 %tmp134 to i32*
  store i32 %tmp129, i32* %tmp135, align 4
  %tmp136 = load i32, i32* %tmp87, align 4
  %tmp137 = load i64, i64* %tmp86, align 8
  %tmp138 = load i32, i32* %tmp88, align 4
  %tmp139 = zext i32 %tmp138 to i64
  %tmp140 = shl nuw nsw i64 %tmp139, 2
  %tmp141 = add i64 %tmp140, %tmp137
  %tmp142 = inttoptr i64 %tmp141 to i32*
  store i32 %tmp136, i32* %tmp142, align 4
  %tmp143 = load i8*, i8** %tmp90, align 8
  %tmp144 = load i8, i8* %tmp143, align 1
  %tmp145 = load i64, i64* %tmp86, align 8
  %tmp146 = load i32, i32* %tmp87, align 4
  %tmp147 = load i32, i32* %tmp89, align 4
  %tmp148 = add i32 %tmp147, %tmp146
  %tmp149 = and i32 %tmp148, 255
  %tmp150 = zext i32 %tmp149 to i64
  store i64 %tmp150, i64* %tmp22, align 8, !tbaa !1231
  store i64 %tmp150, i64* %tmp21, align 8, !tbaa !1231
  %tmp151 = shl nuw nsw i32 %tmp149, 2
  %tmp152 = zext i32 %tmp151 to i64
  %tmp153 = add i64 %tmp145, %tmp152
  %tmp154 = inttoptr i64 %tmp153 to i32*
  %tmp155 = load i32, i32* %tmp154, align 4
  %tmp156 = trunc i32 %tmp155 to i8
  %tmp157 = xor i8 %tmp144, %tmp156
  store i8 %tmp157, i8* %tmp16, align 1, !tbaa !1255
  %tmp158 = load i8*, i8** %tmp92, align 8
  store i8 %tmp157, i8* %tmp158, align 1
  %tmp159 = load i64, i64* %tmp67, align 8
  %tmp160 = add i64 %tmp159, 1
  store i64 %tmp160, i64* %tmp67, align 8
  %tmp161 = load i64, i64* %tmp91, align 8
  %tmp162 = add i64 %tmp161, 1
  store i64 %tmp162, i64* %tmp91, align 8
  %tmp163 = load i64, i64* %tmp67, align 8
  %tmp164 = load i64, i64* %tmp75, align 8
  %tmp165 = icmp eq i64 %tmp163, %tmp164
  %tmp166 = load i32, i32* %tmp80, align 4
  br i1 %tmp165, label %block_400831, label %block_400797
}

; Function Attrs: noinline noreturn
define noalias nonnull %struct.Memory* @sub_400530__start(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias nocapture readnone %arg2) local_unnamed_addr #6 {
block_400530:
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
  store i8 0, i8* %tmp12, align 1, !tbaa !1236
  %tmp24 = trunc i64 %tmp20 to i32
  %tmp25 = and i32 %tmp24, 240
  %tmp26 = tail call i32 @llvm.ctpop.i32(i32 %tmp25) #15, !range !1262
  %tmp27 = trunc i32 %tmp26 to i8
  %tmp28 = and i8 %tmp27, 1
  %tmp29 = xor i8 %tmp28, 1
  store i8 %tmp29, i8* %tmp13, align 1, !tbaa !1250
  %tmp30 = icmp eq i64 %tmp23, 0
  %tmp31 = zext i1 %tmp30 to i8
  store i8 %tmp31, i8* %tmp14, align 1, !tbaa !1252
  %tmp32 = lshr i64 %tmp20, 63
  %tmp33 = trunc i64 %tmp32 to i8
  store i8 %tmp33, i8* %tmp15, align 1, !tbaa !1253
  store i8 0, i8* %tmp16, align 1, !tbaa !1254
  store i8 0, i8* %tmp17, align 1, !tbaa !1251
  %tmp34 = load i64, i64* %tmp3, align 8
  %tmp35 = add i64 %tmp23, -8
  %tmp36 = inttoptr i64 %tmp35 to i64*
  store i64 %tmp34, i64* %tmp36, align 8
  %tmp37 = add i64 %tmp23, -16
  %tmp38 = inttoptr i64 %tmp37 to i64*
  store i64 %tmp35, i64* %tmp38, align 16
  store i64 ptrtoint (i64 ()* @callback_sub_400b80___libc_csu_fini to i64), i64* %tmp10, align 8, !tbaa !1231
  store i64 ptrtoint (i64 ()* @callback_sub_400b10___libc_csu_init to i64), i64* %tmp4, align 8, !tbaa !1231
  store i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64* %tmp7, align 8, !tbaa !1231
  %tmp39 = add i64 %arg1, 41
  %tmp40 = add i64 %tmp23, -24
  %tmp41 = inttoptr i64 %tmp40 to i64*
  store i64 %tmp39, i64* %tmp41, align 8
  %tmp42 = load i64, i64* %tmp38, align 16
  %tmp43 = load i64, i64* %tmp36, align 8
  store i64 %tmp37, i64* %tmp8, align 8, !alias.scope !1263, !noalias !1266
  %tmp44 = tail call i64 @__libc_start_main(i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64 %tmp22, i64 %tmp20, i64 ptrtoint (i64 ()* @callback_sub_400b10___libc_csu_init to i64), i64 ptrtoint (i64 ()* @callback_sub_400b80___libc_csu_fini to i64), i64 %tmp18, i64 %tmp42, i64 %tmp43), !noalias !1263
  store i64 %tmp44, i64* %tmp3, align 8, !alias.scope !1263, !noalias !1266
  %tmp45 = add i64 %arg1, 42
  store i64 %tmp45, i64* %tmp, align 8
  %tmp46 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull undef, i64 undef, %struct.Memory* undef)
  unreachable
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4004d0(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_4004d0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_601000__got_plt_type* @seg_601000__got_plt to i64), i64 8) to i64*), align 8
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = load i64, i64* %tmp4, align 8, !tbaa !1231
  %tmp6 = add i64 %tmp5, -8
  %tmp7 = inttoptr i64 %tmp6 to i64*
  store i64 %tmp3, i64* %tmp7, align 8
  store i64 %tmp6, i64* %tmp4, align 8, !tbaa !1231
  %tmp8 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_601000__got_plt_type* @seg_601000__got_plt to i64), i64 16) to i64*), align 16
  store i64 %tmp8, i64* %tmp, align 8, !tbaa !1231
  %tmp9 = icmp eq i64 %tmp8, 4195548
  br i1 %tmp9, label %block_4004dc, label %bb

block_4004dc:                                     ; preds = %block_4004d0
  store i64 4195552, i64* %tmp, align 8
  %tmp10 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull undef, i64 undef, %struct.Memory* undef)
  unreachable

bb:                                               ; preds = %block_4004d0
  %tmp11 = tail call %struct.Memory* @__mcsema_detach_call_value(%struct.State* nonnull %arg, i64 %tmp8, %struct.Memory* %arg2)
  ret %struct.Memory* %tmp11
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400940__Z12arc4_decryptPvPhPKhi(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400940:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0
  %tmp4 = bitcast %union.anon* %tmp3 to i32*
  %tmp5 = getelementptr inbounds %union.anon, %union.anon* %tmp3, i64 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp11 = load i64, i64* %tmp10, align 8
  %tmp12 = load i64, i64* %tmp9, align 8, !tbaa !1231
  %tmp13 = add i64 %tmp12, -8
  %tmp14 = inttoptr i64 %tmp13 to i64*
  store i64 %tmp11, i64* %tmp14, align 8
  store i64 %tmp13, i64* %tmp10, align 8, !tbaa !1231
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp16 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp18 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp20 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp21 = add i64 %tmp12, -16
  %tmp22 = load i64, i64* %tmp8, align 8
  %tmp23 = inttoptr i64 %tmp21 to i64*
  store i64 %tmp22, i64* %tmp23, align 8
  %tmp24 = add i64 %tmp12, -24
  %tmp25 = load i64, i64* %tmp7, align 8
  %tmp26 = inttoptr i64 %tmp24 to i64*
  store i64 %tmp25, i64* %tmp26, align 8
  %tmp27 = add i64 %tmp12, -32
  %tmp28 = load i64, i64* %tmp6, align 8
  %tmp29 = inttoptr i64 %tmp27 to i64*
  store i64 %tmp28, i64* %tmp29, align 8
  %tmp30 = add i64 %tmp12, -36
  %tmp31 = load i32, i32* %tmp4, align 4
  %tmp32 = inttoptr i64 %tmp30 to i32*
  store i32 %tmp31, i32* %tmp32, align 4
  %tmp33 = load i64, i64* %tmp23, align 8
  store i64 %tmp33, i64* %tmp8, align 8, !tbaa !1231
  %tmp34 = load i64, i64* %tmp26, align 8
  store i64 %tmp34, i64* %tmp7, align 8, !tbaa !1231
  %tmp35 = load i64, i64* %tmp29, align 8
  store i64 %tmp35, i64* %tmp6, align 8, !tbaa !1231
  %tmp36 = load i32, i32* %tmp32, align 4
  %tmp37 = zext i32 %tmp36 to i64
  store i64 %tmp37, i64* %tmp5, align 8, !tbaa !1231
  %tmp38 = add i64 %arg1, 43
  %tmp39 = add i64 %tmp12, -48
  %tmp40 = inttoptr i64 %tmp39 to i64*
  store i64 %tmp38, i64* %tmp40, align 8
  store i64 %tmp39, i64* %tmp9, align 8, !tbaa !1231
  %tmp41 = tail call %struct.Memory* @sub_400740__Z12arc4_encryptPvPhPKhi(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  %tmp42 = load i64, i64* %tmp9, align 8
  %tmp43 = add i64 %tmp42, 32
  %tmp44 = icmp ugt i64 %tmp42, -33
  %tmp45 = zext i1 %tmp44 to i8
  store i8 %tmp45, i8* %tmp15, align 1, !tbaa !1236
  %tmp46 = trunc i64 %tmp43 to i32
  %tmp47 = and i32 %tmp46, 255
  %tmp48 = tail call i32 @llvm.ctpop.i32(i32 %tmp47) #15, !range !1235
  %tmp49 = trunc i32 %tmp48 to i8
  %tmp50 = and i8 %tmp49, 1
  %tmp51 = xor i8 %tmp50, 1
  store i8 %tmp51, i8* %tmp16, align 1, !tbaa !1250
  %tmp52 = xor i64 %tmp43, %tmp42
  %tmp53 = lshr i64 %tmp52, 4
  %tmp54 = trunc i64 %tmp53 to i8
  %tmp55 = and i8 %tmp54, 1
  store i8 %tmp55, i8* %tmp17, align 1, !tbaa !1251
  %tmp56 = icmp eq i64 %tmp43, 0
  %tmp57 = zext i1 %tmp56 to i8
  store i8 %tmp57, i8* %tmp18, align 1, !tbaa !1252
  %tmp58 = lshr i64 %tmp43, 63
  %tmp59 = trunc i64 %tmp58 to i8
  store i8 %tmp59, i8* %tmp19, align 1, !tbaa !1253
  %tmp60 = lshr i64 %tmp42, 63
  %tmp61 = xor i64 %tmp58, %tmp60
  %tmp62 = add nuw nsw i64 %tmp61, %tmp58
  %tmp63 = icmp eq i64 %tmp62, 2
  %tmp64 = zext i1 %tmp63 to i8
  store i8 %tmp64, i8* %tmp20, align 1, !tbaa !1254
  %tmp65 = add i64 %tmp42, 40
  %tmp66 = inttoptr i64 %tmp43 to i64*
  %tmp67 = load i64, i64* %tmp66, align 8
  store i64 %tmp67, i64* %tmp10, align 8, !tbaa !1231
  %tmp68 = inttoptr i64 %tmp65 to i64*
  %tmp69 = load i64, i64* %tmp68, align 8
  store i64 %tmp69, i64* %tmp, align 8, !tbaa !1231
  %tmp70 = add i64 %tmp42, 48
  store i64 %tmp70, i64* %tmp9, align 8, !tbaa !1231
  ret %struct.Memory* %tmp41
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400b84__term_proc(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400b84:
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
  store i8 %tmp23, i8* %tmp6, align 1, !tbaa !1236
  %tmp24 = trunc i64 %tmp4 to i32
  %tmp25 = and i32 %tmp24, 255
  %tmp26 = tail call i32 @llvm.ctpop.i32(i32 %tmp25) #15, !range !1235
  %tmp27 = trunc i32 %tmp26 to i8
  %tmp28 = and i8 %tmp27, 1
  %tmp29 = xor i8 %tmp28, 1
  store i8 %tmp29, i8* %tmp7, align 1, !tbaa !1250
  store i8 %tmp11, i8* %tmp12, align 1, !tbaa !1251
  %tmp30 = icmp eq i64 %tmp4, 0
  %tmp31 = zext i1 %tmp30 to i8
  store i8 %tmp31, i8* %tmp13, align 1, !tbaa !1252
  %tmp32 = trunc i64 %tmp16 to i8
  store i8 %tmp32, i8* %tmp15, align 1, !tbaa !1253
  store i8 %tmp20, i8* %tmp21, align 1, !tbaa !1254
  %tmp33 = inttoptr i64 %tmp4 to i64*
  %tmp34 = load i64, i64* %tmp33, align 8
  store i64 %tmp34, i64* %tmp, align 8, !tbaa !1231
  %tmp35 = add i64 %tmp4, 8
  store i64 %tmp35, i64* %tmp3, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400b10___libc_csu_init(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone %arg2) local_unnamed_addr #5 {
block_400b10:
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
  store i64 ptrtoint (%seg_600de8__init_array_type* @seg_600de8__init_array to i64), i64* %tmp13, align 8, !tbaa !1231
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
  store i64 ashr (i64 sub (i64 add (i64 ptrtoint (%seg_600de8__init_array_type* @seg_600de8__init_array to i64), i64 8), i64 ptrtoint (%seg_600de8__init_array_type* @seg_600de8__init_array to i64)), i64 3), i64* %tmp12, align 8, !tbaa !1231
  %tmp46 = add i64 %arg1, -1632
  %tmp47 = add i64 %arg1, 49
  %tmp48 = add i64 %tmp18, -64
  %tmp49 = inttoptr i64 %tmp48 to i64*
  store i64 %tmp47, i64* %tmp49, align 8
  store i64 %tmp48, i64* %tmp11, align 8, !tbaa !1231
  %tmp50 = tail call %struct.Memory* @sub_4004b0__init_proc(%struct.State* nonnull %arg, i64 %tmp46, %struct.Memory* %arg2)
  %tmp51 = load i64, i64* %tmp12, align 8
  %tmp52 = icmp eq i64 %tmp51, 0
  br i1 %tmp52, label %block_400b66, label %block_400b46

block_400b46:                                     ; preds = %block_400b10
  %tmp53 = load i64, i64* %tmp, align 8
  store i64 0, i64* %tmp7, align 8, !tbaa !1231
  store i8 0, i8* %tmp40, align 1, !tbaa !1236
  store i8 1, i8* %tmp41, align 1, !tbaa !1250
  store i8 1, i8* %tmp43, align 1, !tbaa !1252
  store i8 0, i8* %tmp44, align 1, !tbaa !1253
  store i8 0, i8* %tmp45, align 1, !tbaa !1254
  store i8 0, i8* %tmp42, align 1, !tbaa !1251
  %tmp54 = add i64 %tmp53, 15
  br label %block_400b50

block_400b50:                                     ; preds = %block_400b50, %block_400b46
  %tmp55 = phi i64 [ 0, %block_400b46 ], [ %tmp73, %block_400b50 ]
  %tmp56 = phi i64 [ %tmp54, %block_400b46 ], [ %tmp101, %block_400b50 ]
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
  store i8 %tmp78, i8* %tmp40, align 1, !tbaa !1236
  %tmp79 = trunc i64 %tmp76 to i32
  %tmp80 = and i32 %tmp79, 255
  %tmp81 = tail call i32 @llvm.ctpop.i32(i32 %tmp80) #15, !range !1235
  %tmp82 = trunc i32 %tmp81 to i8
  %tmp83 = and i8 %tmp82, 1
  %tmp84 = xor i8 %tmp83, 1
  store i8 %tmp84, i8* %tmp41, align 1, !tbaa !1250
  %tmp85 = xor i64 %tmp75, %tmp73
  %tmp86 = xor i64 %tmp85, %tmp76
  %tmp87 = lshr i64 %tmp86, 4
  %tmp88 = trunc i64 %tmp87 to i8
  %tmp89 = and i8 %tmp88, 1
  store i8 %tmp89, i8* %tmp42, align 1, !tbaa !1251
  %tmp90 = icmp eq i64 %tmp76, 0
  %tmp91 = zext i1 %tmp90 to i8
  store i8 %tmp91, i8* %tmp43, align 1, !tbaa !1252
  %tmp92 = lshr i64 %tmp76, 63
  %tmp93 = trunc i64 %tmp92 to i8
  store i8 %tmp93, i8* %tmp44, align 1, !tbaa !1253
  %tmp94 = lshr i64 %tmp75, 63
  %tmp95 = xor i64 %tmp94, %tmp74
  %tmp96 = xor i64 %tmp92, %tmp74
  %tmp97 = add nuw nsw i64 %tmp96, %tmp95
  %tmp98 = icmp eq i64 %tmp97, 2
  %tmp99 = zext i1 %tmp98 to i8
  store i8 %tmp99, i8* %tmp45, align 1, !tbaa !1254
  %tmp100 = select i1 %tmp90, i64 9, i64 -13
  %tmp101 = add i64 %tmp100, %tmp72
  br i1 %tmp90, label %block_400b66, label %block_400b50

block_400b66:                                     ; preds = %block_400b50, %block_400b10
  %tmp102 = load i64, i64* %tmp11, align 8
  %tmp103 = add i64 %tmp102, 8
  %tmp104 = icmp ugt i64 %tmp102, -9
  %tmp105 = zext i1 %tmp104 to i8
  store i8 %tmp105, i8* %tmp40, align 1, !tbaa !1236
  %tmp106 = trunc i64 %tmp103 to i32
  %tmp107 = and i32 %tmp106, 255
  %tmp108 = tail call i32 @llvm.ctpop.i32(i32 %tmp107) #15, !range !1235
  %tmp109 = trunc i32 %tmp108 to i8
  %tmp110 = and i8 %tmp109, 1
  %tmp111 = xor i8 %tmp110, 1
  store i8 %tmp111, i8* %tmp41, align 1, !tbaa !1250
  %tmp112 = xor i64 %tmp103, %tmp102
  %tmp113 = lshr i64 %tmp112, 4
  %tmp114 = trunc i64 %tmp113 to i8
  %tmp115 = and i8 %tmp114, 1
  store i8 %tmp115, i8* %tmp42, align 1, !tbaa !1251
  %tmp116 = icmp eq i64 %tmp103, 0
  %tmp117 = zext i1 %tmp116 to i8
  store i8 %tmp117, i8* %tmp43, align 1, !tbaa !1252
  %tmp118 = lshr i64 %tmp103, 63
  %tmp119 = trunc i64 %tmp118 to i8
  store i8 %tmp119, i8* %tmp44, align 1, !tbaa !1253
  %tmp120 = lshr i64 %tmp102, 63
  %tmp121 = xor i64 %tmp118, %tmp120
  %tmp122 = add nuw nsw i64 %tmp121, %tmp118
  %tmp123 = icmp eq i64 %tmp122, 2
  %tmp124 = zext i1 %tmp123 to i8
  store i8 %tmp124, i8* %tmp45, align 1, !tbaa !1254
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

; Function Attrs: noinline
define %struct.Memory* @sub_400980_main(%struct.State* noalias dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #5 {
block_400980:
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
  %tmp12 = load i64, i64* %tmp9, align 8
  %tmp13 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp14 = add i64 %tmp13, -8
  %tmp15 = inttoptr i64 %tmp14 to i64*
  store i64 %tmp12, i64* %tmp15, align 8
  store i64 %tmp14, i64* %tmp9, align 8, !tbaa !1231
  %tmp16 = add i64 %tmp13, -1144
  store i64 %tmp16, i64* %tmp8, align 8, !tbaa !1231
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp18 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp20 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp21 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp22 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp23 = add i64 %tmp13, -1048
  store i64 0, i64* %tmp4, align 8, !tbaa !1231
  store i64 14, i64* %tmp10, align 8, !tbaa !1231
  %tmp24 = add i64 %tmp13, -1062
  store i64 %tmp24, i64* %tmp11, align 8, !tbaa !1231
  %tmp25 = add i64 %tmp13, -12
  %tmp26 = inttoptr i64 %tmp25 to i32*
  store i32 0, i32* %tmp26, align 4
  %tmp27 = add i64 %tmp13, -1088
  %tmp28 = inttoptr i64 %tmp27 to i64*
  store i64 add (i64 ptrtoint (%seg_400b90__rodata_type* @seg_400b90__rodata to i64), i64 4), i64* %tmp28, align 8
  %tmp29 = add i64 %tmp13, -1092
  %tmp30 = inttoptr i64 %tmp29 to i32*
  store i32 8, i32* %tmp30, align 4
  %tmp31 = load i64, i64* %tmp9, align 8
  %tmp32 = add i64 %tmp31, -1096
  %tmp33 = inttoptr i64 %tmp32 to i64*
  store i64 %tmp23, i64* %tmp33, align 8
  %tmp34 = add i64 %arg1, 90
  %tmp35 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp36 = add i64 %tmp35, -8
  %tmp37 = inttoptr i64 %tmp36 to i64*
  store i64 %tmp34, i64* %tmp37, align 8
  store i64 %tmp34, i64* %tmp, align 8, !alias.scope !1268, !noalias !1271
  store i64 %tmp35, i64* %tmp8, align 8, !alias.scope !1268, !noalias !1271
  %tmp38 = tail call i64 @memset(i64 %tmp24, i64 0, i64 14), !noalias !1268
  %tmp39 = load i64, i64* %tmp9, align 8
  %tmp40 = add i64 %tmp39, -1096
  %tmp41 = load i64, i64* %tmp, align 8
  %tmp42 = inttoptr i64 %tmp40 to i64*
  %tmp43 = load i64, i64* %tmp42, align 8
  store i64 %tmp43, i64* %tmp3, align 8, !tbaa !1231
  store i64 %tmp43, i64* %tmp7, align 8, !tbaa !1231
  %tmp44 = add i64 %tmp39, -1080
  %tmp45 = inttoptr i64 %tmp44 to i64*
  %tmp46 = load i64, i64* %tmp45, align 8
  store i64 %tmp46, i64* %tmp6, align 8, !tbaa !1231
  %tmp47 = add i64 %tmp39, -1084
  %tmp48 = inttoptr i64 %tmp47 to i32*
  %tmp49 = load i32, i32* %tmp48, align 4
  %tmp50 = zext i32 %tmp49 to i64
  store i64 %tmp50, i64* %tmp5, align 8, !tbaa !1231
  %tmp51 = add i64 %tmp41, -954
  %tmp52 = add i64 %tmp41, 28
  %tmp53 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp54 = add i64 %tmp53, -8
  %tmp55 = inttoptr i64 %tmp54 to i64*
  store i64 %tmp52, i64* %tmp55, align 8
  store i64 %tmp54, i64* %tmp8, align 8, !tbaa !1231
  %tmp56 = tail call %struct.Memory* @sub_400620__Z11arc4_setkeyPvPKhj(%struct.State* nonnull %arg, i64 %tmp51, %struct.Memory* %arg2)
  %tmp57 = load i64, i64* %tmp, align 8
  store i64 add (i64 ptrtoint (%seg_400b90__rodata_type* @seg_400b90__rodata to i64), i64 13), i64* %tmp5, align 8, !tbaa !1231
  store i64 14, i64* %tmp4, align 8, !tbaa !1231
  %tmp58 = load i64, i64* %tmp9, align 8
  %tmp59 = add i64 %tmp58, -1054
  store i64 %tmp59, i64* %tmp6, align 8, !tbaa !1231
  %tmp60 = add i64 %tmp58, -1040
  store i64 %tmp60, i64* %tmp7, align 8, !tbaa !1231
  %tmp61 = add i64 %tmp57, 37
  %tmp62 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp63 = add i64 %tmp62, -8
  %tmp64 = inttoptr i64 %tmp63 to i64*
  store i64 %tmp61, i64* %tmp64, align 8
  store i64 %tmp63, i64* %tmp8, align 8, !tbaa !1231
  %tmp65 = tail call %struct.Memory* @sub_400740__Z12arc4_encryptPvPhPKhi(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %tmp56)
  %tmp66 = load i64, i64* %tmp, align 8
  %tmp67 = load i64, i64* %tmp9, align 8
  %tmp68 = add i64 %tmp67, -1040
  store i64 0, i64* %tmp4, align 8, !tbaa !1231
  %tmp69 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 21, i32 0, i32 0
  store i64 14, i64* %tmp69, align 8, !tbaa !1231
  %tmp70 = add i64 %tmp67, -1068
  %tmp71 = add i64 %tmp67, -1104
  %tmp72 = inttoptr i64 %tmp71 to i64*
  store i64 14, i64* %tmp72, align 8
  %tmp73 = add i64 %tmp67, -1112
  %tmp74 = inttoptr i64 %tmp73 to i64*
  store i64 add (i64 ptrtoint (%seg_400b90__rodata_type* @seg_400b90__rodata to i64), i64 4), i64* %tmp74, align 8
  %tmp75 = load i64, i64* %tmp72, align 8
  store i64 %tmp75, i64* %tmp10, align 8, !tbaa !1231
  %tmp76 = add i64 %tmp67, -1116
  %tmp77 = inttoptr i64 %tmp76 to i32*
  store i32 8, i32* %tmp77, align 4
  %tmp78 = add i64 %tmp67, -1128
  %tmp79 = inttoptr i64 %tmp78 to i64*
  store i64 %tmp68, i64* %tmp79, align 8
  %tmp80 = add i64 %tmp66, 87
  %tmp81 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp82 = add i64 %tmp81, -8
  %tmp83 = inttoptr i64 %tmp82 to i64*
  store i64 %tmp80, i64* %tmp83, align 8
  store i64 %tmp80, i64* %tmp, align 8, !alias.scope !1273, !noalias !1276
  store i64 %tmp81, i64* %tmp8, align 8, !alias.scope !1273, !noalias !1276
  %tmp84 = tail call i64 @memset(i64 %tmp70, i64 0, i64 %tmp75), !noalias !1273
  %tmp85 = load i64, i64* %tmp9, align 8
  %tmp86 = add i64 %tmp85, -1128
  %tmp87 = load i64, i64* %tmp, align 8
  %tmp88 = inttoptr i64 %tmp86 to i64*
  %tmp89 = load i64, i64* %tmp88, align 8
  store i64 %tmp89, i64* %tmp3, align 8, !tbaa !1231
  store i64 %tmp89, i64* %tmp7, align 8, !tbaa !1231
  %tmp90 = add i64 %tmp85, -1112
  %tmp91 = inttoptr i64 %tmp90 to i64*
  %tmp92 = load i64, i64* %tmp91, align 8
  store i64 %tmp92, i64* %tmp6, align 8, !tbaa !1231
  %tmp93 = add i64 %tmp85, -1116
  %tmp94 = inttoptr i64 %tmp93 to i32*
  %tmp95 = load i32, i32* %tmp94, align 4
  %tmp96 = zext i32 %tmp95 to i64
  store i64 %tmp96, i64* %tmp5, align 8, !tbaa !1231
  %tmp97 = add i64 %tmp87, -1106
  %tmp98 = add i64 %tmp87, 28
  %tmp99 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp100 = add i64 %tmp99, -8
  %tmp101 = inttoptr i64 %tmp100 to i64*
  store i64 %tmp98, i64* %tmp101, align 8
  store i64 %tmp100, i64* %tmp8, align 8, !tbaa !1231
  %tmp102 = tail call %struct.Memory* @sub_400620__Z11arc4_setkeyPvPKhj(%struct.State* nonnull %arg, i64 %tmp97, %struct.Memory* %tmp65)
  %tmp103 = load i64, i64* %tmp, align 8
  store i64 14, i64* %tmp4, align 8, !tbaa !1231
  %tmp104 = load i64, i64* %tmp9, align 8
  %tmp105 = add i64 %tmp104, -1054
  store i64 %tmp105, i64* %tmp5, align 8, !tbaa !1231
  %tmp106 = add i64 %tmp104, -1068
  store i64 %tmp106, i64* %tmp6, align 8, !tbaa !1231
  %tmp107 = add i64 %tmp104, -1040
  store i64 %tmp107, i64* %tmp7, align 8, !tbaa !1231
  %tmp108 = add i64 %tmp103, -334
  %tmp109 = add i64 %tmp103, 34
  %tmp110 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp111 = add i64 %tmp110, -8
  %tmp112 = inttoptr i64 %tmp111 to i64*
  store i64 %tmp109, i64* %tmp112, align 8
  store i64 %tmp111, i64* %tmp8, align 8, !tbaa !1231
  %tmp113 = tail call %struct.Memory* @sub_400940__Z12arc4_decryptPvPhPKhi(%struct.State* nonnull %arg, i64 %tmp108, %struct.Memory* %tmp102)
  %tmp114 = load i64, i64* %tmp, align 8
  %tmp115 = load i64, i64* %tmp9, align 8
  %tmp116 = add i64 %tmp115, -1068
  %tmp117 = add i64 %tmp114, 24
  %tmp118 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp119 = add i64 %tmp118, -8
  %tmp120 = inttoptr i64 %tmp119 to i64*
  store i64 %tmp117, i64* %tmp120, align 8
  %tmp121 = load i64, i64* %tmp5, align 8, !alias.scope !1278, !noalias !1281
  %tmp122 = load i64, i64* %tmp4, align 8, !alias.scope !1278, !noalias !1281
  %tmp123 = load i64, i64* %tmp10, align 8, !alias.scope !1278, !noalias !1281
  %tmp124 = load i64, i64* %tmp11, align 8, !alias.scope !1278, !noalias !1281
  %tmp125 = inttoptr i64 %tmp118 to i64*
  %tmp126 = load i64, i64* %tmp125, align 8
  %tmp127 = add i64 %tmp118, 8
  %tmp128 = inttoptr i64 %tmp127 to i64*
  %tmp129 = load i64, i64* %tmp128, align 8
  %tmp130 = add i64 %tmp118, 16
  %tmp131 = inttoptr i64 %tmp130 to i64*
  %tmp132 = load i64, i64* %tmp131, align 8
  %tmp133 = add i64 %tmp118, 24
  %tmp134 = inttoptr i64 %tmp133 to i64*
  %tmp135 = load i64, i64* %tmp134, align 8
  %tmp136 = add i64 %tmp118, 32
  %tmp137 = inttoptr i64 %tmp136 to i64*
  %tmp138 = load i64, i64* %tmp137, align 8
  %tmp139 = add i64 %tmp118, 40
  %tmp140 = inttoptr i64 %tmp139 to i64*
  %tmp141 = load i64, i64* %tmp140, align 8
  %tmp142 = add i64 %tmp118, 48
  %tmp143 = inttoptr i64 %tmp142 to i64*
  %tmp144 = load i64, i64* %tmp143, align 8
  %tmp145 = add i64 %tmp118, 56
  %tmp146 = inttoptr i64 %tmp145 to i64*
  %tmp147 = load i64, i64* %tmp146, align 8
  %tmp148 = add i64 %tmp118, 64
  %tmp149 = inttoptr i64 %tmp148 to i64*
  %tmp150 = load i64, i64* %tmp149, align 8
  %tmp151 = add i64 %tmp118, 72
  %tmp152 = inttoptr i64 %tmp151 to i64*
  %tmp153 = load i64, i64* %tmp152, align 8
  store i64 %tmp117, i64* %tmp, align 8, !alias.scope !1278, !noalias !1281
  store i64 %tmp118, i64* %tmp8, align 8, !alias.scope !1278, !noalias !1281
  %tmp154 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400b90__rodata_type* @seg_400b90__rodata to i64), i64 27), i64 %tmp116, i64 %tmp121, i64 %tmp122, i64 %tmp123, i64 %tmp124, i64 %tmp126, i64 %tmp129, i64 %tmp132, i64 %tmp135, i64 %tmp138, i64 %tmp141, i64 %tmp144, i64 %tmp147, i64 %tmp150, i64 %tmp153), !noalias !1278
  %tmp155 = load i64, i64* %tmp9, align 8
  %tmp156 = add i64 %tmp155, -1068
  %tmp157 = load i64, i64* %tmp, align 8
  store i64 %tmp156, i64* %tmp6, align 8, !tbaa !1231
  store i64 zext (i32 trunc (i64 and (i64 add (i64 ptrtoint (%seg_400b90__rodata_type* @seg_400b90__rodata to i64), i64 13), i64 4294967295) to i32) to i64), i64* %tmp7, align 8, !tbaa !1231
  store i64 14, i64* %tmp4, align 8, !tbaa !1231
  store i64 14, i64* %tmp5, align 8, !tbaa !1231
  %tmp158 = add i64 %tmp155, -1132
  %tmp159 = trunc i64 %tmp154 to i32
  %tmp160 = inttoptr i64 %tmp158 to i32*
  store i32 %tmp159, i32* %tmp160, align 4
  %tmp161 = add i64 %tmp157, 32
  %tmp162 = load i64, i64* %tmp8, align 8, !tbaa !1231
  %tmp163 = add i64 %tmp162, -8
  %tmp164 = inttoptr i64 %tmp163 to i64*
  store i64 %tmp161, i64* %tmp164, align 8
  store i64 %tmp161, i64* %tmp, align 8, !alias.scope !1283, !noalias !1286
  store i64 %tmp162, i64* %tmp8, align 8, !alias.scope !1283, !noalias !1286
  %tmp165 = tail call i64 @memcmp(i64 zext (i32 trunc (i64 and (i64 add (i64 ptrtoint (%seg_400b90__rodata_type* @seg_400b90__rodata to i64), i64 13), i64 4294967295) to i32) to i64), i64 %tmp156, i64 14), !noalias !1283
  %tmp166 = trunc i64 %tmp165 to i32
  %tmp167 = icmp ne i32 %tmp166, 0
  %tmp168 = load i64, i64* %tmp9, align 8
  %tmp169 = add i64 %tmp168, -4
  %tmp170 = inttoptr i64 %tmp169 to i32*
  %. = zext i1 %tmp167 to i32
  store i32 %., i32* %tmp170, align 4
  %tmp171 = zext i1 %tmp167 to i64
  store i64 %tmp171, i64* %tmp3, align 8, !tbaa !1231
  %tmp172 = load i64, i64* %tmp8, align 8
  %tmp173 = add i64 %tmp172, 1136
  %tmp174 = icmp ugt i64 %tmp172, -1137
  %tmp175 = zext i1 %tmp174 to i8
  store i8 %tmp175, i8* %tmp17, align 1, !tbaa !1236
  %tmp176 = trunc i64 %tmp173 to i32
  %tmp177 = and i32 %tmp176, 255
  %tmp178 = tail call i32 @llvm.ctpop.i32(i32 %tmp177) #15, !range !1235
  %tmp179 = trunc i32 %tmp178 to i8
  %tmp180 = and i8 %tmp179, 1
  %tmp181 = xor i8 %tmp180, 1
  store i8 %tmp181, i8* %tmp18, align 1, !tbaa !1250
  %tmp182 = xor i64 %tmp172, 16
  %tmp183 = xor i64 %tmp182, %tmp173
  %tmp184 = lshr i64 %tmp183, 4
  %tmp185 = trunc i64 %tmp184 to i8
  %tmp186 = and i8 %tmp185, 1
  store i8 %tmp186, i8* %tmp19, align 1, !tbaa !1251
  %tmp187 = icmp eq i64 %tmp173, 0
  %tmp188 = zext i1 %tmp187 to i8
  store i8 %tmp188, i8* %tmp20, align 1, !tbaa !1252
  %tmp189 = lshr i64 %tmp173, 63
  %tmp190 = trunc i64 %tmp189 to i8
  store i8 %tmp190, i8* %tmp21, align 1, !tbaa !1253
  %tmp191 = lshr i64 %tmp172, 63
  %tmp192 = xor i64 %tmp189, %tmp191
  %tmp193 = add nuw nsw i64 %tmp192, %tmp189
  %tmp194 = icmp eq i64 %tmp193, 2
  %tmp195 = zext i1 %tmp194 to i8
  store i8 %tmp195, i8* %tmp22, align 1, !tbaa !1254
  %tmp196 = add i64 %tmp172, 1144
  %tmp197 = inttoptr i64 %tmp173 to i64*
  %tmp198 = load i64, i64* %tmp197, align 8
  store i64 %tmp198, i64* %tmp9, align 8, !tbaa !1231
  %tmp199 = inttoptr i64 %tmp196 to i64*
  %tmp200 = load i64, i64* %tmp199, align 8
  store i64 %tmp200, i64* %tmp, align 8, !tbaa !1231
  %tmp201 = add i64 %tmp172, 1152
  store i64 %tmp201, i64* %tmp8, align 8, !tbaa !1231
  ret %struct.Memory* %tmp113
}

; Function Attrs: nobuiltin noinline noreturn
define i64 @callback_sub_400530__start(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #7 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195632, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400530__start(%struct.State* nonnull @__mcsema_reg_state, i64 4195632, %struct.Memory* undef)
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
define i64 @callback_sub_400600_frame_dummy(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) #9 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195840, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400600_frame_dummy(%struct.State* nonnull @__mcsema_reg_state, i64 4195840, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_4005d0___do_global_dtors_aux(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) #9 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195792, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_4005d0___do_global_dtors_aux(%struct.State* nonnull @__mcsema_reg_state, i64 4195792, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
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
define %struct.Memory* @ext_601078___gmon_start__(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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

; Function Attrs: nobuiltin noinline norecurse nounwind
define i64 @callback_sub_400b80___libc_csu_fini() #11 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp1 = icmp eq i64 %tmp, 0
  br i1 %tmp1, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp2 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4197248, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp3 = load volatile i1, i1* @0, align 1
  br i1 %tmp3, label %__mcsema_early_init.exit, label %bb4

bb4:                                              ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb4, %__mcsema_verify_reg_state.exit
  %tmp5 = add i64 %tmp2, -8
  store i64 %tmp5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp6 = tail call %struct.Memory* @sub_400b80___libc_csu_fini(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
  store i64 %tmp2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp7 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp7
}

; Function Attrs: nobuiltin noinline
define i64 @callback_sub_400b10___libc_csu_init() #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp1 = icmp eq i64 %tmp, 0
  br i1 %tmp1, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp2 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4197136, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp3 = load volatile i1, i1* @0, align 1
  br i1 %tmp3, label %__mcsema_early_init.exit, label %bb4

bb4:                                              ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb4, %__mcsema_verify_reg_state.exit
  %tmp5 = add i64 %tmp2, -8
  store i64 %tmp5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp6 = tail call %struct.Memory* @sub_400b10___libc_csu_init(%struct.State* nonnull @__mcsema_reg_state, i64 4197136, %struct.Memory* null)
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
  store i64 4196736, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp8 = tail call %struct.Memory* @sub_400980_main(%struct.State* nonnull @__mcsema_reg_state, i64 4196736, %struct.Memory* null)
  store i64 %tmp4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp9 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp9
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_400500___libc_start_main(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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
define %struct.Memory* @ext_4004f0_memset(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp8 = load i64, i64* %tmp6, align 8
  %tmp9 = load i64, i64* %tmp5, align 8
  %tmp10 = load i64, i64* %tmp4, align 8
  %tmp11 = load i64, i64* %tmp7, align 8
  %tmp12 = inttoptr i64 %tmp11 to i64*
  %tmp13 = load i64, i64* %tmp12, align 8
  store i64 %tmp13, i64* %tmp, align 8
  %tmp14 = add i64 %tmp11, 8
  store i64 %tmp14, i64* %tmp7, align 8
  %tmp15 = tail call i64 @memset(i64 %tmp8, i64 %tmp9, i64 %tmp10)
  store i64 %tmp15, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_601058_printf(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_601070_memcmp(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
bb:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp8 = load i64, i64* %tmp6, align 8
  %tmp9 = load i64, i64* %tmp5, align 8
  %tmp10 = load i64, i64* %tmp4, align 8
  %tmp11 = load i64, i64* %tmp7, align 8
  %tmp12 = inttoptr i64 %tmp11 to i64*
  %tmp13 = load i64, i64* %tmp12, align 8
  store i64 %tmp13, i64* %tmp, align 8
  %tmp14 = add i64 %tmp11, 8
  store i64 %tmp14, i64* %tmp7, align 8
  %tmp15 = tail call i64 @memcmp(i64 %tmp8, i64 %tmp9, i64 %tmp10)
  store i64 %tmp15, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: nobuiltin noinline norecurse nounwind
define i64 @_Z11arc4_streamPvPhi(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #11 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196432, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400850__Z11arc4_streamPvPhi(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @_Z11arc4_setkeyPvPKhj(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #9 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195872, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400620__Z11arc4_setkeyPvPKhj(%struct.State* nonnull @__mcsema_reg_state, i64 4195872, %struct.Memory* null)
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
  store i64 4197252, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400b84__term_proc(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @_Z12arc4_decryptPvPhPKhi(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #9 {
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
  %tmp16 = tail call %struct.Memory* @sub_400940__Z12arc4_decryptPvPhPKhi(%struct.State* nonnull @__mcsema_reg_state, i64 4196672, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline norecurse nounwind
define i64 @_Z12arc4_encryptPvPhPKhi(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #11 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196160, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400740__Z12arc4_encryptPvPhPKhi(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline norecurse nounwind
define i64 @_Z11arc4_ctxlenv(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #11 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4195856, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400610__Z11arc4_ctxlenv(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
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
  store i64 4195504, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_4004b0__init_proc(%struct.State* nonnull @__mcsema_reg_state, i64 4195504, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: norecurse nounwind
define internal void @__mcsema_destructor() #8 {
bb:
  %tmp = tail call i64 @callback_sub_400b80___libc_csu_fini()
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
  %tmp2 = tail call i64 @callback_sub_400b10___libc_csu_init()
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
attributes #4 = { noinline norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!1235 = !{i32 0, i32 9}
!1236 = !{!1237, !1233, i64 2065}
!1237 = !{!"_ZTS5State", !1233, i64 16, !1238, i64 2064, !1233, i64 2080, !1239, i64 2088, !1241, i64 2112, !1243, i64 2208, !1244, i64 2480, !1245, i64 2608, !1246, i64 2736, !1233, i64 2760, !1233, i64 2768, !1247, i64 3280}
!1238 = !{!"_ZTS10ArithFlags", !1233, i64 0, !1233, i64 1, !1233, i64 2, !1233, i64 3, !1233, i64 4, !1233, i64 5, !1233, i64 6, !1233, i64 7, !1233, i64 8, !1233, i64 9, !1233, i64 10, !1233, i64 11, !1233, i64 12, !1233, i64 13, !1233, i64 14, !1233, i64 15}
!1239 = !{!"_ZTS8Segments", !1240, i64 0, !1233, i64 2, !1240, i64 4, !1233, i64 6, !1240, i64 8, !1233, i64 10, !1240, i64 12, !1233, i64 14, !1240, i64 16, !1233, i64 18, !1240, i64 20, !1233, i64 22}
!1240 = !{!"short", !1233, i64 0}
!1241 = !{!"_ZTS12AddressSpace", !1232, i64 0, !1242, i64 8, !1232, i64 16, !1242, i64 24, !1232, i64 32, !1242, i64 40, !1232, i64 48, !1242, i64 56, !1232, i64 64, !1242, i64 72, !1232, i64 80, !1242, i64 88}
!1242 = !{!"_ZTS3Reg", !1233, i64 0}
!1243 = !{!"_ZTS3GPR", !1232, i64 0, !1242, i64 8, !1232, i64 16, !1242, i64 24, !1232, i64 32, !1242, i64 40, !1232, i64 48, !1242, i64 56, !1232, i64 64, !1242, i64 72, !1232, i64 80, !1242, i64 88, !1232, i64 96, !1242, i64 104, !1232, i64 112, !1242, i64 120, !1232, i64 128, !1242, i64 136, !1232, i64 144, !1242, i64 152, !1232, i64 160, !1242, i64 168, !1232, i64 176, !1242, i64 184, !1232, i64 192, !1242, i64 200, !1232, i64 208, !1242, i64 216, !1232, i64 224, !1242, i64 232, !1232, i64 240, !1242, i64 248, !1232, i64 256, !1242, i64 264}
!1244 = !{!"_ZTS8X87Stack", !1233, i64 0}
!1245 = !{!"_ZTS3MMX", !1233, i64 0}
!1246 = !{!"_ZTS14FPUStatusFlags", !1233, i64 0, !1233, i64 1, !1233, i64 2, !1233, i64 3, !1233, i64 4, !1233, i64 5, !1233, i64 6, !1233, i64 7, !1233, i64 8, !1233, i64 9, !1233, i64 10, !1233, i64 11, !1233, i64 12, !1233, i64 13, !1233, i64 14, !1233, i64 15, !1233, i64 16, !1233, i64 17, !1233, i64 18, !1233, i64 19, !1233, i64 20}
!1247 = !{!"_ZTS13SegmentCaches", !1248, i64 0, !1248, i64 16, !1248, i64 32, !1248, i64 48, !1248, i64 64, !1248, i64 80}
!1248 = !{!"_ZTS13SegmentShadow", !1233, i64 0, !1249, i64 8, !1249, i64 12}
!1249 = !{!"int", !1233, i64 0}
!1250 = !{!1237, !1233, i64 2067}
!1251 = !{!1237, !1233, i64 2069}
!1252 = !{!1237, !1233, i64 2071}
!1253 = !{!1237, !1233, i64 2073}
!1254 = !{!1237, !1233, i64 2077}
!1255 = !{!1233, !1233, i64 0}
!1256 = !{i32 0, i32 6}
!1257 = !{!1258}
!1258 = distinct !{!1258, !1259, !"ext_601078___gmon_start__: argument 0"}
!1259 = distinct !{!1259, !"ext_601078___gmon_start__"}
!1260 = !{!1261}
!1261 = distinct !{!1261, !1259, !"ext_601078___gmon_start__: argument 1"}
!1262 = !{i32 0, i32 5}
!1263 = !{!1264}
!1264 = distinct !{!1264, !1265, !"ext_400500___libc_start_main: argument 0"}
!1265 = distinct !{!1265, !"ext_400500___libc_start_main"}
!1266 = !{!1267}
!1267 = distinct !{!1267, !1265, !"ext_400500___libc_start_main: argument 1"}
!1268 = !{!1269}
!1269 = distinct !{!1269, !1270, !"ext_4004f0_memset: argument 0"}
!1270 = distinct !{!1270, !"ext_4004f0_memset"}
!1271 = !{!1272}
!1272 = distinct !{!1272, !1270, !"ext_4004f0_memset: argument 1"}
!1273 = !{!1274}
!1274 = distinct !{!1274, !1275, !"ext_4004f0_memset: argument 0"}
!1275 = distinct !{!1275, !"ext_4004f0_memset"}
!1276 = !{!1277}
!1277 = distinct !{!1277, !1275, !"ext_4004f0_memset: argument 1"}
!1278 = !{!1279}
!1279 = distinct !{!1279, !1280, !"ext_601058_printf: argument 0"}
!1280 = distinct !{!1280, !"ext_601058_printf"}
!1281 = !{!1282}
!1282 = distinct !{!1282, !1280, !"ext_601058_printf: argument 1"}
!1283 = !{!1284}
!1284 = distinct !{!1284, !1285, !"ext_601070_memcmp: argument 0"}
!1285 = distinct !{!1285, !"ext_601070_memcmp"}
!1286 = !{!1287}
!1287 = distinct !{!1287, !1285, !"ext_601070_memcmp: argument 1"}
