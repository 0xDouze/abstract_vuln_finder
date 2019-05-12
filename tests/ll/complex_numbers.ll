; ModuleID = 'complex_numbers.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu-elf"

%seg_400b20__rodata_type = type <{ [40 x i8], [7 x i8], [5 x i8], [4 x i8] }>
%seg_600e08__init_array_type = type <{ i64, i64 }>
%seg_601000__got_plt_type = type <{ [24 x i8], i64, i64, i64, i64, i64, i64, i64 }>
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

@seg_400b20__rodata = internal constant %seg_400b20__rodata_type <{ [40 x i8] c"\01\00\02\00\00\00\00\00\ECQ\B8\1E\85\EB\F1\BF\00\00\00\00\00\00\00@\CD\CC\CC\CC\CC\CC\10@\1F\85\EBQ\B8\1E\09@", [7 x i8] c"%i %i\0A\00", [5 x i8] c"Okay\00", [4 x i8] c"Nok\00" }>
@seg_600e08__init_array = internal global %seg_600e08__init_array_type <{ i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_4006d0_frame_dummy to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_4006a0___do_global_dtors_aux to i64) }>
@seg_601000__got_plt = internal global %seg_601000__got_plt_type <{ [24 x i8] c"\18\0E`\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i64 ptrtoint (i64 (i64)* @puts to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @printf to i64), i64 ptrtoint (i64 (i64, i64)* @cpow to i64), i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @__libc_start_main to i64), i64 ptrtoint (i64 (i64)* @csinf to i64), i64 ptrtoint (i64 (i64)* @csin to i64), i64 ptrtoint (i64 (i64, i64)* @cpowf to i64) }>
@__bss_start = global %__bss_start_type zeroinitializer
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

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fabs.f64(double) #0

; Function Attrs: nounwind readnone speculatable
declare double @llvm.trunc.f64(double) #0

; Function Attrs: nounwind readnone speculatable
declare float @llvm.fabs.f32(float) #0

; Function Attrs: nounwind readnone speculatable
declare float @llvm.trunc.f32(float) #0

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @__gmon_start__() #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @cpowf(i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @csinf(i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @puts(i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @cpow(i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @csin(i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @printf(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: noinline
declare extern_weak x86_64_sysvcc i64 @__libc_start_main(i64, i64, i64, i64, i64, i64, i64, i64) #2

; Function Attrs: noinline
define %struct.Memory* @sub_4006e0_FooFloat(%struct.State* noalias dereferenceable(3376) %arg, i64 %arg12, %struct.Memory* noalias readnone returned %arg13) local_unnamed_addr #3 {
block_4006e0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp16 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp18 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp20 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1
  %tmp21 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 1
  %tmp22 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 2
  %tmp23 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 3
  %tmp24 = load i64, i64* %tmp19, align 8
  %tmp25 = load i64, i64* %tmp18, align 8, !tbaa !1231
  %tmp26 = add i64 %tmp25, -8
  %tmp27 = inttoptr i64 %tmp26 to i64*
  store i64 %tmp24, i64* %tmp27, align 8
  store i64 %tmp26, i64* %tmp19, align 8, !tbaa !1231
  %tmp28 = add i64 %tmp25, -136
  store i64 %tmp28, i64* %tmp18, align 8, !tbaa !1231
  %tmp29 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp30 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp31 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp32 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp33 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp34 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 40), i64* %tmp17, align 8, !tbaa !1231
  %tmp35 = add i64 %tmp25, -16
  %tmp36 = inttoptr i64 %tmp35 to i32*
  store i32 1078523331, i32* %tmp36, align 4
  %tmp37 = add i64 %tmp25, -12
  %tmp38 = inttoptr i64 %tmp37 to i32*
  store i32 1082549862, i32* %tmp38, align 4
  %tmp39 = add i64 %tmp25, -24
  %tmp40 = inttoptr i64 %tmp39 to i32*
  store i32 1073741824, i32* %tmp40, align 4
  %tmp41 = add i64 %tmp25, -20
  %tmp42 = inttoptr i64 %tmp41 to i32*
  store i32 -1081123799, i32* %tmp42, align 4
  %tmp43 = bitcast [32 x %union.VectorReg]* %tmp20 to i8*
  %tmp44 = load i32, i32* %tmp36, align 4
  %tmp45 = bitcast [32 x %union.VectorReg]* %tmp20 to i32*
  store i32 %tmp44, i32* %tmp45, align 1, !tbaa !1235
  %tmp46 = getelementptr inbounds i8, i8* %tmp43, i64 4
  %tmp47 = bitcast i8* %tmp46 to float*
  store float 0.000000e+00, float* %tmp47, align 1, !tbaa !1235
  %tmp48 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 0, i32 0, i32 0, i32 0, i64 1
  %tmp49 = bitcast i64* %tmp48 to float*
  %tmp50 = getelementptr inbounds i8, i8* %tmp43, i64 12
  %tmp51 = bitcast i8* %tmp50 to float*
  %tmp52 = bitcast %union.VectorReg* %tmp21 to i8*
  %tmp53 = load i32, i32* %tmp38, align 4
  %tmp54 = bitcast %union.VectorReg* %tmp21 to i32*
  store i32 %tmp53, i32* %tmp54, align 1, !tbaa !1235
  %tmp55 = getelementptr inbounds i8, i8* %tmp52, i64 4
  %tmp56 = bitcast i8* %tmp55 to float*
  store float 0.000000e+00, float* %tmp56, align 1, !tbaa !1235
  %tmp57 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 1, i32 0, i32 0, i32 0, i64 1
  %tmp58 = bitcast i64* %tmp57 to float*
  %tmp59 = getelementptr inbounds i8, i8* %tmp52, i64 12
  %tmp60 = bitcast i8* %tmp59 to float*
  %tmp61 = bitcast %union.VectorReg* %tmp22 to i8*
  %tmp62 = load i32, i32* %tmp40, align 4
  %tmp63 = bitcast %union.VectorReg* %tmp22 to i32*
  store i32 %tmp62, i32* %tmp63, align 1, !tbaa !1235
  %tmp64 = getelementptr inbounds i8, i8* %tmp61, i64 4
  %tmp65 = bitcast i8* %tmp64 to float*
  store float 0.000000e+00, float* %tmp65, align 1, !tbaa !1235
  %tmp66 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 2, i32 0, i32 0, i32 0, i64 1
  %tmp67 = bitcast i64* %tmp66 to float*
  store float 0.000000e+00, float* %tmp67, align 1, !tbaa !1235
  %tmp68 = getelementptr inbounds i8, i8* %tmp61, i64 12
  %tmp69 = bitcast i8* %tmp68 to float*
  store float 0.000000e+00, float* %tmp69, align 1, !tbaa !1235
  %tmp70 = bitcast %union.VectorReg* %tmp23 to i8*
  %tmp71 = load i32, i32* %tmp42, align 4
  %tmp72 = bitcast %union.VectorReg* %tmp23 to i32*
  store i32 %tmp71, i32* %tmp72, align 1, !tbaa !1235
  %tmp73 = getelementptr inbounds i8, i8* %tmp70, i64 4
  %tmp74 = bitcast i8* %tmp73 to float*
  store float 0.000000e+00, float* %tmp74, align 1, !tbaa !1235
  %tmp75 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 3, i32 0, i32 0, i32 0, i64 1
  %tmp76 = bitcast i64* %tmp75 to float*
  store float 0.000000e+00, float* %tmp76, align 1, !tbaa !1235
  %tmp77 = getelementptr inbounds i8, i8* %tmp70, i64 12
  %tmp78 = bitcast i8* %tmp77 to float*
  store float 0.000000e+00, float* %tmp78, align 1, !tbaa !1235
  %tmp79 = load i64, i64* %tmp19, align 8
  %tmp80 = add i64 %tmp79, -32
  %tmp81 = bitcast [32 x %union.VectorReg]* %tmp20 to <2 x float>*
  %tmp82 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp83 = extractelement <2 x float> %tmp82, i32 0
  %tmp84 = inttoptr i64 %tmp80 to float*
  store float %tmp83, float* %tmp84, align 4
  %tmp85 = add i64 %tmp79, -28
  %tmp86 = bitcast %union.VectorReg* %tmp21 to <2 x float>*
  %tmp87 = load <2 x float>, <2 x float>* %tmp86, align 1
  %tmp88 = extractelement <2 x float> %tmp87, i32 0
  %tmp89 = inttoptr i64 %tmp85 to float*
  store float %tmp88, float* %tmp89, align 4
  %tmp90 = inttoptr i64 %tmp80 to i64*
  %tmp91 = load i64, i64* %tmp90, align 8
  %tmp92 = getelementptr inbounds [32 x %union.VectorReg], [32 x %union.VectorReg]* %tmp20, i64 0, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %tmp91, i64* %tmp92, align 1, !tbaa !1231
  store i64 0, i64* %tmp48, align 1, !tbaa !1231
  %tmp93 = add i64 %tmp79, -40
  %tmp94 = bitcast %union.VectorReg* %tmp22 to <2 x float>*
  %tmp95 = load <2 x float>, <2 x float>* %tmp94, align 1
  %tmp96 = extractelement <2 x float> %tmp95, i32 0
  %tmp97 = inttoptr i64 %tmp93 to float*
  store float %tmp96, float* %tmp97, align 4
  %tmp98 = add i64 %tmp79, -36
  %tmp99 = bitcast %union.VectorReg* %tmp23 to <2 x float>*
  %tmp100 = load <2 x float>, <2 x float>* %tmp99, align 1
  %tmp101 = extractelement <2 x float> %tmp100, i32 0
  %tmp102 = inttoptr i64 %tmp98 to float*
  store float %tmp101, float* %tmp102, align 4
  %tmp103 = inttoptr i64 %tmp93 to i64*
  %tmp104 = load i64, i64* %tmp103, align 8
  %tmp105 = getelementptr inbounds %union.VectorReg, %union.VectorReg* %tmp21, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %tmp104, i64* %tmp105, align 1, !tbaa !1231
  store i64 0, i64* %tmp57, align 1, !tbaa !1231
  %tmp106 = add i64 %tmp79, -88
  %tmp107 = load i64, i64* %tmp17, align 8
  %tmp108 = inttoptr i64 %tmp106 to i64*
  store i64 %tmp107, i64* %tmp108, align 8
  %tmp109 = add i64 %arg12, 116
  %tmp110 = load i64, i64* %tmp18, align 8, !tbaa !1231
  %tmp111 = add i64 %tmp110, -8
  %tmp112 = inttoptr i64 %tmp111 to i64*
  store i64 %tmp109, i64* %tmp112, align 8
  %tmp113 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp114 = load i64, i64* %tmp16, align 8, !alias.scope !1237, !noalias !1240
  store i64 %tmp109, i64* %tmp, align 8, !alias.scope !1237, !noalias !1240
  store i64 %tmp110, i64* %tmp18, align 8, !alias.scope !1237, !noalias !1240
  %tmp115 = tail call i64 @cpowf(i64 %tmp107, i64 %tmp114), !noalias !1237
  %tmp116 = load i64, i64* %tmp19, align 8
  %tmp117 = add i64 %tmp116, -48
  %tmp118 = load i64, i64* %tmp, align 8
  %tmp119 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp120 = extractelement <2 x float> %tmp119, i32 0
  %tmp121 = extractelement <2 x float> %tmp119, i32 1
  %tmp122 = add i64 %tmp116, -44
  %tmp123 = inttoptr i64 %tmp117 to float*
  store float %tmp120, float* %tmp123, align 4
  %tmp124 = inttoptr i64 %tmp122 to float*
  store float %tmp121, float* %tmp124, align 4
  %tmp125 = inttoptr i64 %tmp117 to i32*
  %tmp126 = load i32, i32* %tmp125, align 4
  store i32 %tmp126, i32* %tmp45, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp47, align 1, !tbaa !1235
  %tmp127 = inttoptr i64 %tmp122 to i32*
  %tmp128 = load i32, i32* %tmp127, align 4
  store i32 %tmp128, i32* %tmp54, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp56, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp58, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp60, align 1, !tbaa !1235
  %tmp129 = add i64 %tmp116, -24
  %tmp130 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp131 = extractelement <2 x float> %tmp130, i32 0
  %tmp132 = inttoptr i64 %tmp129 to float*
  store float %tmp131, float* %tmp132, align 4
  %tmp133 = add i64 %tmp116, -20
  %tmp134 = load <2 x float>, <2 x float>* %tmp86, align 1
  %tmp135 = extractelement <2 x float> %tmp134, i32 0
  %tmp136 = inttoptr i64 %tmp133 to float*
  store float %tmp135, float* %tmp136, align 4
  %tmp137 = inttoptr i64 %tmp129 to i32*
  %tmp138 = load i32, i32* %tmp137, align 4
  store i32 %tmp138, i32* %tmp45, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp47, align 1, !tbaa !1235
  %tmp139 = add i64 %tmp116, -52
  %tmp140 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp141 = extractelement <2 x float> %tmp140, i32 0
  %tmp142 = inttoptr i64 %tmp139 to float*
  store float %tmp141, float* %tmp142, align 4
  %tmp143 = inttoptr i64 %tmp133 to i32*
  %tmp144 = load i32, i32* %tmp143, align 4
  store i32 %tmp144, i32* %tmp45, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp47, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp49, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp51, align 1, !tbaa !1235
  %tmp145 = add i64 %tmp116, -56
  %tmp146 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp147 = extractelement <2 x float> %tmp146, i32 0
  %tmp148 = inttoptr i64 %tmp145 to float*
  store float %tmp147, float* %tmp148, align 4
  %tmp149 = load float, float* %tmp142, align 4
  %tmp150 = tail call float @llvm.trunc.f32(float %tmp149) #15
  %tmp151 = tail call float @llvm.fabs.f32(float %tmp150) #15
  %tmp152 = fcmp ogt float %tmp151, 0x41E0000000000000
  %tmp153 = fptosi float %tmp150 to i32
  %tmp154 = add i64 %tmp116, -60
  %tmp155 = select i1 %tmp152, i32 -2147483648, i32 %tmp153
  %tmp156 = inttoptr i64 %tmp154 to i32*
  store i32 %tmp155, i32* %tmp156, align 4
  %tmp157 = load float, float* %tmp148, align 4
  %tmp158 = tail call float @llvm.trunc.f32(float %tmp157) #15
  %tmp159 = tail call float @llvm.fabs.f32(float %tmp158) #15
  %tmp160 = fcmp ogt float %tmp159, 0x41E0000000000000
  %tmp161 = fptosi float %tmp158 to i32
  %tmp162 = zext i32 %tmp161 to i64
  %tmp163 = select i1 %tmp160, i64 2147483648, i64 %tmp162
  %tmp164 = add i64 %tmp116, -64
  %tmp165 = trunc i64 %tmp163 to i32
  %tmp166 = inttoptr i64 %tmp164 to i32*
  store i32 %tmp165, i32* %tmp166, align 4
  %tmp167 = load i32, i32* %tmp156, align 4
  %tmp168 = zext i32 %tmp167 to i64
  %tmp169 = load i64, i64* %tmp19, align 8
  %tmp170 = add i64 %tmp169, -88
  %tmp171 = inttoptr i64 %tmp170 to i64*
  %tmp172 = load i64, i64* %tmp171, align 8
  %tmp173 = add i64 %tmp118, 77
  %tmp174 = load i64, i64* %tmp18, align 8, !tbaa !1231
  %tmp175 = add i64 %tmp174, -8
  %tmp176 = inttoptr i64 %tmp175 to i64*
  store i64 %tmp173, i64* %tmp176, align 8
  %tmp177 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp178 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  %tmp179 = load i64, i64* %tmp177, align 8, !alias.scope !1242, !noalias !1245
  %tmp180 = load i64, i64* %tmp178, align 8, !alias.scope !1242, !noalias !1245
  %tmp181 = inttoptr i64 %tmp174 to i64*
  %tmp182 = load i64, i64* %tmp181, align 8
  %tmp183 = add i64 %tmp174, 8
  %tmp184 = inttoptr i64 %tmp183 to i64*
  %tmp185 = load i64, i64* %tmp184, align 8
  %tmp186 = add i64 %tmp174, 16
  %tmp187 = inttoptr i64 %tmp186 to i64*
  %tmp188 = load i64, i64* %tmp187, align 8
  %tmp189 = add i64 %tmp174, 24
  %tmp190 = inttoptr i64 %tmp189 to i64*
  %tmp191 = load i64, i64* %tmp190, align 8
  %tmp192 = add i64 %tmp174, 32
  %tmp193 = inttoptr i64 %tmp192 to i64*
  %tmp194 = load i64, i64* %tmp193, align 8
  %tmp195 = add i64 %tmp174, 40
  %tmp196 = inttoptr i64 %tmp195 to i64*
  %tmp197 = load i64, i64* %tmp196, align 8
  %tmp198 = add i64 %tmp174, 48
  %tmp199 = inttoptr i64 %tmp198 to i64*
  %tmp200 = load i64, i64* %tmp199, align 8
  %tmp201 = add i64 %tmp174, 56
  %tmp202 = inttoptr i64 %tmp201 to i64*
  %tmp203 = load i64, i64* %tmp202, align 8
  %tmp204 = add i64 %tmp174, 64
  %tmp205 = inttoptr i64 %tmp204 to i64*
  %tmp206 = load i64, i64* %tmp205, align 8
  %tmp207 = add i64 %tmp174, 72
  %tmp208 = inttoptr i64 %tmp207 to i64*
  %tmp209 = load i64, i64* %tmp208, align 8
  store i64 %tmp173, i64* %tmp, align 8, !alias.scope !1242, !noalias !1245
  store i64 %tmp174, i64* %tmp18, align 8, !alias.scope !1242, !noalias !1245
  %tmp210 = tail call i64 @printf(i64 %tmp172, i64 %tmp168, i64 %tmp163, i64 %tmp163, i64 %tmp179, i64 %tmp180, i64 %tmp182, i64 %tmp185, i64 %tmp188, i64 %tmp191, i64 %tmp194, i64 %tmp197, i64 %tmp200, i64 %tmp203, i64 %tmp206, i64 %tmp209), !noalias !1242
  %tmp211 = load i64, i64* %tmp19, align 8
  %tmp212 = add i64 %tmp211, -60
  %tmp213 = load i64, i64* %tmp, align 8
  %tmp214 = inttoptr i64 %tmp212 to i32*
  %tmp215 = load i32, i32* %tmp214, align 4
  %tmp216 = icmp eq i32 %tmp215, 77
  %tmp217 = add i64 %tmp211, -92
  %tmp218 = trunc i64 %tmp210 to i32
  %tmp219 = inttoptr i64 %tmp217 to i32*
  store i32 %tmp218, i32* %tmp219, align 4
  %tmp220 = select i1 %tmp216, i64 13, i64 46
  %tmp221 = add i64 %tmp220, %tmp213
  br i1 %tmp216, label %block_4007ae, label %block_4007cf

block_40089e:                                     ; preds = %block_40086b, %block_40088c
  %.sink11 = phi i64 [ add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 52), %block_40088c ], [ add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 47), %block_40086b ]
  %.sink = phi i64 [ %tmp289, %block_40088c ], [ %tmp295, %block_40086b ]
  %.sink4 = phi i64 [ -124, %block_40088c ], [ -120, %block_40086b ]
  store i64 %.sink11, i64* %tmp17, align 8, !tbaa !1231
  %tmp222 = add i64 %.sink, 15
  %tmp223 = load i64, i64* %tmp18, align 8, !tbaa !1231
  %tmp224 = add i64 %tmp223, -8
  %tmp225 = inttoptr i64 %tmp224 to i64*
  store i64 %tmp222, i64* %tmp225, align 8
  store i64 %tmp222, i64* %tmp, align 8, !alias.scope !1247, !noalias !7
  store i64 %tmp223, i64* %tmp18, align 8, !alias.scope !1247, !noalias !7
  %tmp226 = tail call i64 @puts(i64 %.sink11), !noalias !7
  store i64 %tmp226, i64* %tmp113, align 8, !alias.scope !1247, !noalias !7
  %tmp227 = load i64, i64* %tmp19, align 8
  %tmp228 = add i64 %tmp227, %.sink4
  %tmp229 = trunc i64 %tmp226 to i32
  %tmp230 = inttoptr i64 %tmp228 to i32*
  store i32 %tmp229, i32* %tmp230, align 4
  %tmp231 = load i64, i64* %tmp18, align 8
  %tmp232 = add i64 %tmp231, 128
  %tmp233 = icmp ugt i64 %tmp231, -129
  %tmp234 = zext i1 %tmp233 to i8
  store i8 %tmp234, i8* %tmp29, align 1, !tbaa !1252
  %tmp235 = trunc i64 %tmp232 to i32
  %tmp236 = and i32 %tmp235, 255
  %tmp237 = tail call i32 @llvm.ctpop.i32(i32 %tmp236) #15, !range !1266
  %tmp238 = trunc i32 %tmp237 to i8
  %tmp239 = and i8 %tmp238, 1
  %tmp240 = xor i8 %tmp239, 1
  store i8 %tmp240, i8* %tmp30, align 1, !tbaa !1267
  %tmp241 = xor i64 %tmp232, %tmp231
  %tmp242 = lshr i64 %tmp241, 4
  %tmp243 = trunc i64 %tmp242 to i8
  %tmp244 = and i8 %tmp243, 1
  store i8 %tmp244, i8* %tmp31, align 1, !tbaa !1268
  %tmp245 = icmp eq i64 %tmp232, 0
  %tmp246 = zext i1 %tmp245 to i8
  store i8 %tmp246, i8* %tmp32, align 1, !tbaa !1269
  %tmp247 = lshr i64 %tmp232, 63
  %tmp248 = trunc i64 %tmp247 to i8
  store i8 %tmp248, i8* %tmp33, align 1, !tbaa !1270
  %tmp249 = lshr i64 %tmp231, 63
  %tmp250 = xor i64 %tmp247, %tmp249
  %tmp251 = add nuw nsw i64 %tmp250, %tmp247
  %tmp252 = icmp eq i64 %tmp251, 2
  %tmp253 = zext i1 %tmp252 to i8
  store i8 %tmp253, i8* %tmp34, align 1, !tbaa !1271
  %tmp254 = add i64 %tmp231, 136
  %tmp255 = inttoptr i64 %tmp232 to i64*
  %tmp256 = load i64, i64* %tmp255, align 8
  store i64 %tmp256, i64* %tmp19, align 8, !tbaa !1231
  %tmp257 = inttoptr i64 %tmp254 to i64*
  %tmp258 = load i64, i64* %tmp257, align 8
  store i64 %tmp258, i64* %tmp, align 8, !tbaa !1231
  %tmp259 = add i64 %tmp231, 144
  store i64 %tmp259, i64* %tmp18, align 8, !tbaa !1231
  ret %struct.Memory* %arg13

block_4007b8:                                     ; preds = %block_4007ae
  %tmp260 = add i64 %tmp288, 15
  %tmp261 = load i64, i64* %tmp18, align 8, !tbaa !1231
  %tmp262 = add i64 %tmp261, -8
  %tmp263 = inttoptr i64 %tmp262 to i64*
  store i64 %tmp260, i64* %tmp263, align 8
  store i64 %tmp260, i64* %tmp, align 8, !alias.scope !1272, !noalias !1275
  store i64 %tmp261, i64* %tmp18, align 8, !alias.scope !1272, !noalias !1275
  %tmp264 = tail call i64 @puts(i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 47)), !noalias !1272
  %tmp265 = load i64, i64* %tmp19, align 8
  %tmp266 = add i64 %tmp265, -96
  %tmp267 = trunc i64 %tmp264 to i32
  %tmp268 = load i64, i64* %tmp, align 8
  %tmp269 = inttoptr i64 %tmp266 to i32*
  store i32 %tmp267, i32* %tmp269, align 4
  %tmp270 = add i64 %tmp268, 26
  br label %block_4007e1

block_4007cf:                                     ; preds = %block_4007ae, %block_4006e0
  %tmp271 = phi i64 [ %tmp221, %block_4006e0 ], [ %tmp288, %block_4007ae ]
  %tmp272 = add i64 %tmp271, 15
  %tmp273 = load i64, i64* %tmp18, align 8, !tbaa !1231
  %tmp274 = add i64 %tmp273, -8
  %tmp275 = inttoptr i64 %tmp274 to i64*
  store i64 %tmp272, i64* %tmp275, align 8
  store i64 %tmp272, i64* %tmp, align 8, !alias.scope !1277, !noalias !1280
  store i64 %tmp273, i64* %tmp18, align 8, !alias.scope !1277, !noalias !1280
  %tmp276 = tail call i64 @puts(i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 52)), !noalias !1277
  %tmp277 = load i64, i64* %tmp19, align 8
  %tmp278 = add i64 %tmp277, -100
  %tmp279 = trunc i64 %tmp276 to i32
  %tmp280 = load i64, i64* %tmp, align 8
  %tmp281 = add i64 %tmp280, 3
  %tmp282 = inttoptr i64 %tmp278 to i32*
  store i32 %tmp279, i32* %tmp282, align 4
  br label %block_4007e1

block_4007ae:                                     ; preds = %block_4006e0
  %tmp283 = add i64 %tmp211, -64
  %tmp284 = inttoptr i64 %tmp283 to i32*
  %tmp285 = load i32, i32* %tmp284, align 4
  %tmp286 = icmp eq i32 %tmp285, 0
  %tmp287 = select i1 %tmp286, i64 10, i64 33
  %tmp288 = add i64 %tmp287, %tmp221
  br i1 %tmp286, label %block_4007b8, label %block_4007cf

block_40088c:                                     ; preds = %block_4007e1, %block_40086b
  %tmp289 = phi i64 [ %tmp426, %block_4007e1 ], [ %tmp295, %block_40086b ]
  br label %block_40089e

block_40086b:                                     ; preds = %block_4007e1
  %tmp290 = add i64 %tmp416, -64
  %tmp291 = inttoptr i64 %tmp290 to i32*
  %tmp292 = load i32, i32* %tmp291, align 4
  %tmp293 = icmp eq i32 %tmp292, -33
  %tmp294 = select i1 %tmp293, i64 10, i64 33
  %tmp295 = add i64 %tmp294, %tmp426
  br i1 %tmp293, label %block_40089e, label %block_40088c

block_4007e1:                                     ; preds = %block_4007cf, %block_4007b8
  %tmp296 = phi i64 [ %tmp277, %block_4007cf ], [ %tmp265, %block_4007b8 ]
  %tmp297 = phi i64 [ %tmp281, %block_4007cf ], [ %tmp270, %block_4007b8 ]
  %tmp298 = add i64 %tmp296, -8
  %tmp299 = inttoptr i64 %tmp298 to i32*
  %tmp300 = load i32, i32* %tmp299, align 4
  store i32 %tmp300, i32* %tmp45, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp47, align 1, !tbaa !1235
  %tmp301 = add i64 %tmp296, -4
  %tmp302 = inttoptr i64 %tmp301 to i32*
  %tmp303 = load i32, i32* %tmp302, align 4
  store i32 %tmp303, i32* %tmp54, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp56, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp58, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp60, align 1, !tbaa !1235
  %tmp304 = add i64 %tmp296, -72
  %tmp305 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp306 = extractelement <2 x float> %tmp305, i32 0
  %tmp307 = inttoptr i64 %tmp304 to float*
  store float %tmp306, float* %tmp307, align 4
  %tmp308 = add i64 %tmp296, -68
  %tmp309 = load <2 x float>, <2 x float>* %tmp86, align 1
  %tmp310 = extractelement <2 x float> %tmp309, i32 0
  %tmp311 = inttoptr i64 %tmp308 to float*
  store float %tmp310, float* %tmp311, align 4
  %tmp312 = inttoptr i64 %tmp304 to i64*
  %tmp313 = load i64, i64* %tmp312, align 8
  store i64 %tmp313, i64* %tmp92, align 1, !tbaa !1231
  store i64 0, i64* %tmp48, align 1, !tbaa !1231
  %tmp314 = add i64 %tmp296, -112
  %tmp315 = inttoptr i64 %tmp314 to i64*
  store i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 40), i64* %tmp315, align 8
  %tmp316 = add i64 %tmp297, 48
  %tmp317 = load i64, i64* %tmp18, align 8, !tbaa !1231
  %tmp318 = add i64 %tmp317, -8
  %tmp319 = inttoptr i64 %tmp318 to i64*
  store i64 %tmp316, i64* %tmp319, align 8
  store i64 %tmp316, i64* %tmp, align 8, !alias.scope !1282, !noalias !1285
  store i64 %tmp317, i64* %tmp18, align 8, !alias.scope !1282, !noalias !1285
  %tmp320 = tail call i64 @csinf(i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 40)), !noalias !1282
  %tmp321 = load i64, i64* %tmp19, align 8
  %tmp322 = add i64 %tmp321, -80
  %tmp323 = load i64, i64* %tmp, align 8
  %tmp324 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp325 = extractelement <2 x float> %tmp324, i32 0
  %tmp326 = extractelement <2 x float> %tmp324, i32 1
  %tmp327 = add i64 %tmp321, -76
  %tmp328 = inttoptr i64 %tmp322 to float*
  store float %tmp325, float* %tmp328, align 4
  %tmp329 = inttoptr i64 %tmp327 to float*
  store float %tmp326, float* %tmp329, align 4
  %tmp330 = inttoptr i64 %tmp322 to i32*
  %tmp331 = load i32, i32* %tmp330, align 4
  store i32 %tmp331, i32* %tmp45, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp47, align 1, !tbaa !1235
  %tmp332 = inttoptr i64 %tmp327 to i32*
  %tmp333 = load i32, i32* %tmp332, align 4
  store i32 %tmp333, i32* %tmp54, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp56, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp58, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp60, align 1, !tbaa !1235
  %tmp334 = add i64 %tmp321, -24
  %tmp335 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp336 = extractelement <2 x float> %tmp335, i32 0
  %tmp337 = inttoptr i64 %tmp334 to float*
  store float %tmp336, float* %tmp337, align 4
  %tmp338 = add i64 %tmp321, -20
  %tmp339 = load <2 x float>, <2 x float>* %tmp86, align 1
  %tmp340 = extractelement <2 x float> %tmp339, i32 0
  %tmp341 = inttoptr i64 %tmp338 to float*
  store float %tmp340, float* %tmp341, align 4
  %tmp342 = inttoptr i64 %tmp334 to i32*
  %tmp343 = load i32, i32* %tmp342, align 4
  store i32 %tmp343, i32* %tmp45, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp47, align 1, !tbaa !1235
  %tmp344 = add i64 %tmp321, -52
  %tmp345 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp346 = extractelement <2 x float> %tmp345, i32 0
  %tmp347 = inttoptr i64 %tmp344 to float*
  store float %tmp346, float* %tmp347, align 4
  %tmp348 = inttoptr i64 %tmp338 to i32*
  %tmp349 = load i32, i32* %tmp348, align 4
  store i32 %tmp349, i32* %tmp45, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp47, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp49, align 1, !tbaa !1235
  store float 0.000000e+00, float* %tmp51, align 1, !tbaa !1235
  %tmp350 = add i64 %tmp321, -56
  %tmp351 = load <2 x float>, <2 x float>* %tmp81, align 1
  %tmp352 = extractelement <2 x float> %tmp351, i32 0
  %tmp353 = inttoptr i64 %tmp350 to float*
  store float %tmp352, float* %tmp353, align 4
  %tmp354 = load float, float* %tmp347, align 4
  %tmp355 = tail call float @llvm.trunc.f32(float %tmp354) #15
  %tmp356 = tail call float @llvm.fabs.f32(float %tmp355) #15
  %tmp357 = fcmp ogt float %tmp356, 0x41E0000000000000
  %tmp358 = fptosi float %tmp355 to i32
  %tmp359 = add i64 %tmp321, -60
  %tmp360 = select i1 %tmp357, i32 -2147483648, i32 %tmp358
  %tmp361 = inttoptr i64 %tmp359 to i32*
  store i32 %tmp360, i32* %tmp361, align 4
  %tmp362 = load float, float* %tmp353, align 4
  %tmp363 = tail call float @llvm.trunc.f32(float %tmp362) #15
  %tmp364 = tail call float @llvm.fabs.f32(float %tmp363) #15
  %tmp365 = fcmp ogt float %tmp364, 0x41E0000000000000
  %tmp366 = fptosi float %tmp363 to i32
  %tmp367 = zext i32 %tmp366 to i64
  %tmp368 = select i1 %tmp365, i64 2147483648, i64 %tmp367
  store i64 %tmp368, i64* %tmp14, align 8, !tbaa !1231
  %tmp369 = add i64 %tmp321, -64
  %tmp370 = trunc i64 %tmp368 to i32
  %tmp371 = inttoptr i64 %tmp369 to i32*
  store i32 %tmp370, i32* %tmp371, align 4
  %tmp372 = load i32, i32* %tmp361, align 4
  %tmp373 = zext i32 %tmp372 to i64
  store i64 %tmp373, i64* %tmp16, align 8, !tbaa !1231
  %tmp374 = load i32, i32* %tmp371, align 4
  %tmp375 = zext i32 %tmp374 to i64
  store i64 %tmp375, i64* %tmp15, align 8, !tbaa !1231
  %tmp376 = load i64, i64* %tmp19, align 8
  %tmp377 = add i64 %tmp376, -112
  %tmp378 = inttoptr i64 %tmp377 to i64*
  %tmp379 = load i64, i64* %tmp378, align 8
  %tmp380 = add i64 %tmp323, 77
  %tmp381 = load i64, i64* %tmp18, align 8, !tbaa !1231
  %tmp382 = add i64 %tmp381, -8
  %tmp383 = inttoptr i64 %tmp382 to i64*
  store i64 %tmp380, i64* %tmp383, align 8
  %tmp384 = load i64, i64* %tmp177, align 8, !alias.scope !1287, !noalias !1290
  %tmp385 = load i64, i64* %tmp178, align 8, !alias.scope !1287, !noalias !1290
  %tmp386 = inttoptr i64 %tmp381 to i64*
  %tmp387 = load i64, i64* %tmp386, align 8
  %tmp388 = add i64 %tmp381, 8
  %tmp389 = inttoptr i64 %tmp388 to i64*
  %tmp390 = load i64, i64* %tmp389, align 8
  %tmp391 = add i64 %tmp381, 16
  %tmp392 = inttoptr i64 %tmp391 to i64*
  %tmp393 = load i64, i64* %tmp392, align 8
  %tmp394 = add i64 %tmp381, 24
  %tmp395 = inttoptr i64 %tmp394 to i64*
  %tmp396 = load i64, i64* %tmp395, align 8
  %tmp397 = add i64 %tmp381, 32
  %tmp398 = inttoptr i64 %tmp397 to i64*
  %tmp399 = load i64, i64* %tmp398, align 8
  %tmp400 = add i64 %tmp381, 40
  %tmp401 = inttoptr i64 %tmp400 to i64*
  %tmp402 = load i64, i64* %tmp401, align 8
  %tmp403 = add i64 %tmp381, 48
  %tmp404 = inttoptr i64 %tmp403 to i64*
  %tmp405 = load i64, i64* %tmp404, align 8
  %tmp406 = add i64 %tmp381, 56
  %tmp407 = inttoptr i64 %tmp406 to i64*
  %tmp408 = load i64, i64* %tmp407, align 8
  %tmp409 = add i64 %tmp381, 64
  %tmp410 = inttoptr i64 %tmp409 to i64*
  %tmp411 = load i64, i64* %tmp410, align 8
  %tmp412 = add i64 %tmp381, 72
  %tmp413 = inttoptr i64 %tmp412 to i64*
  %tmp414 = load i64, i64* %tmp413, align 8
  store i64 %tmp380, i64* %tmp, align 8, !alias.scope !1287, !noalias !1290
  store i64 %tmp381, i64* %tmp18, align 8, !alias.scope !1287, !noalias !1290
  %tmp415 = tail call i64 @printf(i64 %tmp379, i64 %tmp373, i64 %tmp375, i64 %tmp368, i64 %tmp384, i64 %tmp385, i64 %tmp387, i64 %tmp390, i64 %tmp393, i64 %tmp396, i64 %tmp399, i64 %tmp402, i64 %tmp405, i64 %tmp408, i64 %tmp411, i64 %tmp414), !noalias !1287
  %tmp416 = load i64, i64* %tmp19, align 8
  %tmp417 = add i64 %tmp416, -60
  %tmp418 = load i64, i64* %tmp, align 8
  %tmp419 = inttoptr i64 %tmp417 to i32*
  %tmp420 = load i32, i32* %tmp419, align 4
  %tmp421 = icmp eq i32 %tmp420, 0
  %tmp422 = add i64 %tmp416, -116
  %tmp423 = trunc i64 %tmp415 to i32
  %tmp424 = inttoptr i64 %tmp422 to i32*
  store i32 %tmp423, i32* %tmp424, align 4
  %tmp425 = select i1 %tmp421, i64 13, i64 46
  %tmp426 = add i64 %tmp425, %tmp418
  br i1 %tmp421, label %block_40086b, label %block_40088c
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_4006d0_frame_dummy(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_4006d0:
  %tmp = tail call %struct.Memory* @sub_400660_register_tm_clones(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  ret %struct.Memory* %tmp
}

; Function Attrs: noinline norecurse nounwind
define %struct.Memory* @sub_400b10___libc_csu_fini(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #5 {
block_400b10:
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

; Function Attrs: noinline noreturn
define noalias nonnull %struct.Memory* @sub_400600__start(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias nocapture readnone %arg2) local_unnamed_addr #6 {
block_400600:
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
  store i8 0, i8* %tmp12, align 1, !tbaa !1252
  %tmp24 = trunc i64 %tmp20 to i32
  %tmp25 = and i32 %tmp24, 240
  %tmp26 = tail call i32 @llvm.ctpop.i32(i32 %tmp25) #15, !range !1292
  %tmp27 = trunc i32 %tmp26 to i8
  %tmp28 = and i8 %tmp27, 1
  %tmp29 = xor i8 %tmp28, 1
  store i8 %tmp29, i8* %tmp13, align 1, !tbaa !1267
  %tmp30 = icmp eq i64 %tmp23, 0
  %tmp31 = zext i1 %tmp30 to i8
  store i8 %tmp31, i8* %tmp14, align 1, !tbaa !1269
  %tmp32 = lshr i64 %tmp20, 63
  %tmp33 = trunc i64 %tmp32 to i8
  store i8 %tmp33, i8* %tmp15, align 1, !tbaa !1270
  store i8 0, i8* %tmp16, align 1, !tbaa !1271
  store i8 0, i8* %tmp17, align 1, !tbaa !1268
  %tmp34 = load i64, i64* %tmp3, align 8
  %tmp35 = add i64 %tmp23, -8
  %tmp36 = inttoptr i64 %tmp35 to i64*
  store i64 %tmp34, i64* %tmp36, align 8
  %tmp37 = add i64 %tmp23, -16
  %tmp38 = inttoptr i64 %tmp37 to i64*
  store i64 %tmp35, i64* %tmp38, align 16
  store i64 ptrtoint (i64 ()* @callback_sub_400b10___libc_csu_fini to i64), i64* %tmp10, align 8, !tbaa !1231
  store i64 ptrtoint (i64 ()* @callback_sub_400aa0___libc_csu_init to i64), i64* %tmp4, align 8, !tbaa !1231
  store i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64* %tmp7, align 8, !tbaa !1231
  %tmp39 = add i64 %arg1, 41
  %tmp40 = add i64 %tmp23, -24
  %tmp41 = inttoptr i64 %tmp40 to i64*
  store i64 %tmp39, i64* %tmp41, align 8
  %tmp42 = load i64, i64* %tmp38, align 16
  %tmp43 = load i64, i64* %tmp36, align 8
  store i64 %tmp37, i64* %tmp8, align 8, !alias.scope !1293, !noalias !1296
  %tmp44 = tail call i64 @__libc_start_main(i64 ptrtoint (i64 (i64, i64, i64)* @main to i64), i64 %tmp22, i64 %tmp20, i64 ptrtoint (i64 ()* @callback_sub_400aa0___libc_csu_init to i64), i64 ptrtoint (i64 ()* @callback_sub_400b10___libc_csu_fini to i64), i64 %tmp18, i64 %tmp42, i64 %tmp43), !noalias !1293
  store i64 %tmp44, i64* %tmp3, align 8, !alias.scope !1293, !noalias !1296
  %tmp45 = add i64 %arg1, 42
  store i64 %tmp45, i64* %tmp, align 8
  %tmp46 = tail call %struct.Memory* @__remill_error(%struct.State* nonnull undef, i64 undef, %struct.Memory* undef)
  unreachable
}

; Function Attrs: noinline
define %struct.Memory* @sub_400aa0___libc_csu_init(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone %arg2) local_unnamed_addr #3 {
block_400aa0:
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
  store i64 ptrtoint (%seg_600e08__init_array_type* @seg_600e08__init_array to i64), i64* %tmp13, align 8, !tbaa !1231
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
  store i64 ashr (i64 sub (i64 add (i64 ptrtoint (%seg_600e08__init_array_type* @seg_600e08__init_array to i64), i64 8), i64 ptrtoint (%seg_600e08__init_array_type* @seg_600e08__init_array to i64)), i64 3), i64* %tmp12, align 8, !tbaa !1231
  %tmp46 = add i64 %arg1, -1360
  %tmp47 = add i64 %arg1, 49
  %tmp48 = add i64 %tmp18, -64
  %tmp49 = inttoptr i64 %tmp48 to i64*
  store i64 %tmp47, i64* %tmp49, align 8
  store i64 %tmp48, i64* %tmp11, align 8, !tbaa !1231
  %tmp50 = tail call %struct.Memory* @sub_400550__init_proc(%struct.State* nonnull %arg, i64 %tmp46, %struct.Memory* %arg2)
  %tmp51 = load i64, i64* %tmp12, align 8
  %tmp52 = icmp eq i64 %tmp51, 0
  br i1 %tmp52, label %block_400af6, label %block_400ad6

block_400ad6:                                     ; preds = %block_400aa0
  %tmp53 = load i64, i64* %tmp, align 8
  store i64 0, i64* %tmp7, align 8, !tbaa !1231
  store i8 0, i8* %tmp40, align 1, !tbaa !1252
  store i8 1, i8* %tmp41, align 1, !tbaa !1267
  store i8 1, i8* %tmp43, align 1, !tbaa !1269
  store i8 0, i8* %tmp44, align 1, !tbaa !1270
  store i8 0, i8* %tmp45, align 1, !tbaa !1271
  store i8 0, i8* %tmp42, align 1, !tbaa !1268
  %tmp54 = add i64 %tmp53, 15
  br label %block_400ae0

block_400ae0:                                     ; preds = %block_400ae0, %block_400ad6
  %tmp55 = phi i64 [ 0, %block_400ad6 ], [ %tmp73, %block_400ae0 ]
  %tmp56 = phi i64 [ %tmp54, %block_400ad6 ], [ %tmp101, %block_400ae0 ]
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
  store i8 %tmp78, i8* %tmp40, align 1, !tbaa !1252
  %tmp79 = trunc i64 %tmp76 to i32
  %tmp80 = and i32 %tmp79, 255
  %tmp81 = tail call i32 @llvm.ctpop.i32(i32 %tmp80) #15, !range !1266
  %tmp82 = trunc i32 %tmp81 to i8
  %tmp83 = and i8 %tmp82, 1
  %tmp84 = xor i8 %tmp83, 1
  store i8 %tmp84, i8* %tmp41, align 1, !tbaa !1267
  %tmp85 = xor i64 %tmp75, %tmp73
  %tmp86 = xor i64 %tmp85, %tmp76
  %tmp87 = lshr i64 %tmp86, 4
  %tmp88 = trunc i64 %tmp87 to i8
  %tmp89 = and i8 %tmp88, 1
  store i8 %tmp89, i8* %tmp42, align 1, !tbaa !1268
  %tmp90 = icmp eq i64 %tmp76, 0
  %tmp91 = zext i1 %tmp90 to i8
  store i8 %tmp91, i8* %tmp43, align 1, !tbaa !1269
  %tmp92 = lshr i64 %tmp76, 63
  %tmp93 = trunc i64 %tmp92 to i8
  store i8 %tmp93, i8* %tmp44, align 1, !tbaa !1270
  %tmp94 = lshr i64 %tmp75, 63
  %tmp95 = xor i64 %tmp94, %tmp74
  %tmp96 = xor i64 %tmp92, %tmp74
  %tmp97 = add nuw nsw i64 %tmp96, %tmp95
  %tmp98 = icmp eq i64 %tmp97, 2
  %tmp99 = zext i1 %tmp98 to i8
  store i8 %tmp99, i8* %tmp45, align 1, !tbaa !1271
  %tmp100 = select i1 %tmp90, i64 9, i64 -13
  %tmp101 = add i64 %tmp100, %tmp72
  br i1 %tmp90, label %block_400af6, label %block_400ae0

block_400af6:                                     ; preds = %block_400ae0, %block_400aa0
  %tmp102 = load i64, i64* %tmp11, align 8
  %tmp103 = add i64 %tmp102, 8
  %tmp104 = icmp ugt i64 %tmp102, -9
  %tmp105 = zext i1 %tmp104 to i8
  store i8 %tmp105, i8* %tmp40, align 1, !tbaa !1252
  %tmp106 = trunc i64 %tmp103 to i32
  %tmp107 = and i32 %tmp106, 255
  %tmp108 = tail call i32 @llvm.ctpop.i32(i32 %tmp107) #15, !range !1266
  %tmp109 = trunc i32 %tmp108 to i8
  %tmp110 = and i8 %tmp109, 1
  %tmp111 = xor i8 %tmp110, 1
  store i8 %tmp111, i8* %tmp41, align 1, !tbaa !1267
  %tmp112 = xor i64 %tmp103, %tmp102
  %tmp113 = lshr i64 %tmp112, 4
  %tmp114 = trunc i64 %tmp113 to i8
  %tmp115 = and i8 %tmp114, 1
  store i8 %tmp115, i8* %tmp42, align 1, !tbaa !1268
  %tmp116 = icmp eq i64 %tmp103, 0
  %tmp117 = zext i1 %tmp116 to i8
  store i8 %tmp117, i8* %tmp43, align 1, !tbaa !1269
  %tmp118 = lshr i64 %tmp103, 63
  %tmp119 = trunc i64 %tmp118 to i8
  store i8 %tmp119, i8* %tmp44, align 1, !tbaa !1270
  %tmp120 = lshr i64 %tmp102, 63
  %tmp121 = xor i64 %tmp118, %tmp120
  %tmp122 = add nuw nsw i64 %tmp121, %tmp118
  %tmp123 = icmp eq i64 %tmp122, 2
  %tmp124 = zext i1 %tmp123 to i8
  store i8 %tmp124, i8* %tmp45, align 1, !tbaa !1271
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
define %struct.Memory* @sub_4008b0_FooDouble(%struct.State* noalias dereferenceable(3376) %arg, i64 %arg12, %struct.Memory* noalias readnone returned %arg13) local_unnamed_addr #3 {
block_4008b0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 7, i32 0, i32 0
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp16 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp18 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp19 = load i64, i64* %tmp18, align 8
  %tmp20 = load i64, i64* %tmp17, align 8, !tbaa !1231
  %tmp21 = add i64 %tmp20, -8
  %tmp22 = inttoptr i64 %tmp21 to i64*
  store i64 %tmp19, i64* %tmp22, align 8
  store i64 %tmp21, i64* %tmp18, align 8, !tbaa !1231
  %tmp23 = add i64 %tmp20, -152
  store i64 %tmp23, i64* %tmp17, align 8, !tbaa !1231
  %tmp24 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp25 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp26 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp27 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp28 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp29 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  %tmp30 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 8) to i64*), align 8
  %tmp31 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 0, i32 0, i32 0, i32 0, i64 1
  %tmp32 = bitcast i64* %tmp31 to double*
  %tmp33 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 16) to i64*), align 16
  %tmp34 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 1, i32 0, i32 0, i32 0, i64 1
  %tmp35 = bitcast i64* %tmp34 to double*
  %tmp36 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 24) to i64*), align 8
  %tmp37 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 2, i32 0, i32 0, i32 0, i64 1
  %tmp38 = bitcast i64* %tmp37 to double*
  %tmp39 = load i64, i64* inttoptr (i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 32) to i64*), align 16
  %tmp40 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 3, i32 0, i32 0, i32 0, i64 1
  %tmp41 = bitcast i64* %tmp40 to double*
  %tmp42 = add i64 %tmp20, -24
  %tmp43 = inttoptr i64 %tmp42 to i64*
  store i64 %tmp39, i64* %tmp43, align 8
  %tmp44 = add i64 %tmp20, -16
  %tmp45 = inttoptr i64 %tmp44 to i64*
  store i64 %tmp36, i64* %tmp45, align 8
  %tmp46 = add i64 %tmp20, -40
  %tmp47 = inttoptr i64 %tmp46 to i64*
  store i64 %tmp33, i64* %tmp47, align 8
  %tmp48 = add i64 %tmp20, -32
  %tmp49 = inttoptr i64 %tmp48 to i64*
  store i64 %tmp30, i64* %tmp49, align 8
  %tmp50 = load i64, i64* %tmp43, align 8
  %tmp51 = load i64, i64* %tmp45, align 8
  %tmp52 = load i64, i64* %tmp47, align 8
  %tmp53 = load i64, i64* %tmp18, align 8
  %tmp54 = add i64 %tmp53, -24
  %tmp55 = inttoptr i64 %tmp54 to i64*
  %tmp56 = load i64, i64* %tmp55, align 8
  %tmp57 = add i64 %tmp53, -64
  %tmp58 = inttoptr i64 %tmp57 to i64*
  store i64 %tmp50, i64* %tmp58, align 8
  %tmp59 = add i64 %tmp53, -56
  %tmp60 = inttoptr i64 %tmp59 to i64*
  store i64 %tmp51, i64* %tmp60, align 8
  %tmp61 = load i64, i64* %tmp58, align 8
  %tmp62 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %tmp61, i64* %tmp62, align 1, !tbaa !1298
  store double 0.000000e+00, double* %tmp32, align 1, !tbaa !1298
  %tmp63 = load i64, i64* %tmp60, align 8
  %tmp64 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 1, i32 0, i32 0, i32 0, i64 0
  store i64 %tmp63, i64* %tmp64, align 1, !tbaa !1298
  store double 0.000000e+00, double* %tmp35, align 1, !tbaa !1298
  %tmp65 = add i64 %tmp53, -80
  %tmp66 = inttoptr i64 %tmp65 to i64*
  store i64 %tmp52, i64* %tmp66, align 8
  %tmp67 = add i64 %tmp53, -72
  %tmp68 = inttoptr i64 %tmp67 to i64*
  store i64 %tmp56, i64* %tmp68, align 8
  %tmp69 = load i64, i64* %tmp66, align 8
  %tmp70 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 2, i32 0, i32 0, i32 0, i64 0
  store i64 %tmp69, i64* %tmp70, align 1, !tbaa !1298
  store double 0.000000e+00, double* %tmp38, align 1, !tbaa !1298
  %tmp71 = load i64, i64* %tmp68, align 8
  %tmp72 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 1, i64 3, i32 0, i32 0, i32 0, i64 0
  store i64 %tmp71, i64* %tmp72, align 1, !tbaa !1298
  store double 0.000000e+00, double* %tmp41, align 1, !tbaa !1298
  %tmp73 = add i64 %arg12, 128
  %tmp74 = load i64, i64* %tmp17, align 8, !tbaa !1231
  %tmp75 = add i64 %tmp74, -8
  %tmp76 = inttoptr i64 %tmp75 to i64*
  store i64 %tmp73, i64* %tmp76, align 8
  %tmp77 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp78 = load i64, i64* %tmp16, align 8, !alias.scope !1300, !noalias !1303
  %tmp79 = load i64, i64* %tmp15, align 8, !alias.scope !1300, !noalias !1303
  store i64 %tmp73, i64* %tmp, align 8, !alias.scope !1300, !noalias !1303
  store i64 %tmp74, i64* %tmp17, align 8, !alias.scope !1300, !noalias !1303
  %tmp80 = tail call i64 @cpow(i64 %tmp78, i64 %tmp79), !noalias !1300
  %tmp81 = load i64, i64* %tmp, align 8
  %tmp82 = load i64, i64* %tmp18, align 8
  %tmp83 = add i64 %tmp82, -48
  %tmp84 = load i64, i64* %tmp62, align 1
  %tmp85 = inttoptr i64 %tmp83 to i64*
  store i64 %tmp84, i64* %tmp85, align 8
  %tmp86 = add i64 %tmp82, -40
  %tmp87 = load i64, i64* %tmp64, align 1
  %tmp88 = inttoptr i64 %tmp86 to i64*
  store i64 %tmp87, i64* %tmp88, align 8
  %tmp89 = load i64, i64* %tmp85, align 8
  %tmp90 = add i64 %tmp82, -88
  %tmp91 = inttoptr i64 %tmp90 to double*
  %tmp92 = inttoptr i64 %tmp90 to i64*
  store i64 %tmp89, i64* %tmp92, align 8
  %tmp93 = load i64, i64* %tmp88, align 8
  store i64 %tmp93, i64* %tmp62, align 1, !tbaa !1298
  store double 0.000000e+00, double* %tmp32, align 1, !tbaa !1298
  %tmp94 = add i64 %tmp82, -96
  %tmp95 = inttoptr i64 %tmp94 to double*
  %tmp96 = inttoptr i64 %tmp94 to i64*
  store i64 %tmp93, i64* %tmp96, align 8
  %tmp97 = load double, double* %tmp91, align 8
  %tmp98 = tail call double @llvm.trunc.f64(double %tmp97) #15
  %tmp99 = tail call double @llvm.fabs.f64(double %tmp98) #15
  %tmp100 = fcmp ogt double %tmp99, 0x41DFFFFFFFC00000
  %tmp101 = fptosi double %tmp98 to i32
  %tmp102 = add i64 %tmp82, -100
  %tmp103 = select i1 %tmp100, i32 -2147483648, i32 %tmp101
  %tmp104 = inttoptr i64 %tmp102 to i32*
  store i32 %tmp103, i32* %tmp104, align 4
  %tmp105 = load double, double* %tmp95, align 8
  %tmp106 = tail call double @llvm.trunc.f64(double %tmp105) #15
  %tmp107 = tail call double @llvm.fabs.f64(double %tmp106) #15
  %tmp108 = fcmp ogt double %tmp107, 0x41DFFFFFFFC00000
  %tmp109 = fptosi double %tmp106 to i32
  %tmp110 = add i64 %tmp82, -104
  %tmp111 = select i1 %tmp108, i32 -2147483648, i32 %tmp109
  %tmp112 = inttoptr i64 %tmp110 to i32*
  store i32 %tmp111, i32* %tmp112, align 4
  %tmp113 = load i32, i32* %tmp104, align 4
  %tmp114 = zext i32 %tmp113 to i64
  %tmp115 = zext i32 %tmp111 to i64
  %tmp116 = add i64 %tmp81, 69
  %tmp117 = load i64, i64* %tmp17, align 8, !tbaa !1231
  %tmp118 = add i64 %tmp117, -8
  %tmp119 = inttoptr i64 %tmp118 to i64*
  store i64 %tmp116, i64* %tmp119, align 8
  %tmp120 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 5, i32 0, i32 0
  %tmp121 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 17, i32 0, i32 0
  %tmp122 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 19, i32 0, i32 0
  %tmp123 = load i64, i64* %tmp120, align 8, !alias.scope !1305, !noalias !1308
  %tmp124 = load i64, i64* %tmp121, align 8, !alias.scope !1305, !noalias !1308
  %tmp125 = load i64, i64* %tmp122, align 8, !alias.scope !1305, !noalias !1308
  %tmp126 = inttoptr i64 %tmp117 to i64*
  %tmp127 = load i64, i64* %tmp126, align 8
  %tmp128 = add i64 %tmp117, 8
  %tmp129 = inttoptr i64 %tmp128 to i64*
  %tmp130 = load i64, i64* %tmp129, align 8
  %tmp131 = add i64 %tmp117, 16
  %tmp132 = inttoptr i64 %tmp131 to i64*
  %tmp133 = load i64, i64* %tmp132, align 8
  %tmp134 = add i64 %tmp117, 24
  %tmp135 = inttoptr i64 %tmp134 to i64*
  %tmp136 = load i64, i64* %tmp135, align 8
  %tmp137 = add i64 %tmp117, 32
  %tmp138 = inttoptr i64 %tmp137 to i64*
  %tmp139 = load i64, i64* %tmp138, align 8
  %tmp140 = add i64 %tmp117, 40
  %tmp141 = inttoptr i64 %tmp140 to i64*
  %tmp142 = load i64, i64* %tmp141, align 8
  %tmp143 = add i64 %tmp117, 48
  %tmp144 = inttoptr i64 %tmp143 to i64*
  %tmp145 = load i64, i64* %tmp144, align 8
  %tmp146 = add i64 %tmp117, 56
  %tmp147 = inttoptr i64 %tmp146 to i64*
  %tmp148 = load i64, i64* %tmp147, align 8
  %tmp149 = add i64 %tmp117, 64
  %tmp150 = inttoptr i64 %tmp149 to i64*
  %tmp151 = load i64, i64* %tmp150, align 8
  %tmp152 = add i64 %tmp117, 72
  %tmp153 = inttoptr i64 %tmp152 to i64*
  %tmp154 = load i64, i64* %tmp153, align 8
  store i64 %tmp116, i64* %tmp, align 8, !alias.scope !1305, !noalias !1308
  store i64 %tmp117, i64* %tmp17, align 8, !alias.scope !1305, !noalias !1308
  %tmp155 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 40), i64 %tmp114, i64 %tmp115, i64 %tmp123, i64 %tmp124, i64 %tmp125, i64 %tmp127, i64 %tmp130, i64 %tmp133, i64 %tmp136, i64 %tmp139, i64 %tmp142, i64 %tmp145, i64 %tmp148, i64 %tmp151, i64 %tmp154), !noalias !1305
  %tmp156 = load i64, i64* %tmp18, align 8
  %tmp157 = add i64 %tmp156, -100
  %tmp158 = load i64, i64* %tmp, align 8
  %tmp159 = inttoptr i64 %tmp157 to i32*
  %tmp160 = load i32, i32* %tmp159, align 4
  %tmp161 = icmp eq i32 %tmp160, 77
  %tmp162 = add i64 %tmp156, -124
  %tmp163 = trunc i64 %tmp155 to i32
  %tmp164 = inttoptr i64 %tmp162 to i32*
  store i32 %tmp163, i32* %tmp164, align 4
  %tmp165 = select i1 %tmp161, i64 13, i64 46
  %tmp166 = add i64 %tmp165, %tmp158
  br i1 %tmp161, label %block_400982, label %block_4009a3

block_400a54:                                     ; preds = %block_4009b8, %block_400a30
  %tmp167 = phi i64 [ %tmp334, %block_4009b8 ], [ %tmp173, %block_400a30 ]
  br label %block_400a69

block_400a30:                                     ; preds = %block_4009b8
  %tmp168 = add i64 %tmp324, -104
  %tmp169 = inttoptr i64 %tmp168 to i32*
  %tmp170 = load i32, i32* %tmp169, align 4
  %tmp171 = icmp eq i32 %tmp170, -33
  %tmp172 = select i1 %tmp171, i64 10, i64 36
  %tmp173 = add i64 %tmp172, %tmp334
  br i1 %tmp171, label %block_400a69, label %block_400a54

block_400a69:                                     ; preds = %block_400a30, %block_400a54
  %.sink11 = phi i64 [ add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 52), %block_400a54 ], [ add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 47), %block_400a30 ]
  %.sink = phi i64 [ %tmp167, %block_400a54 ], [ %tmp173, %block_400a30 ]
  %.sink4 = phi i64 [ -144, %block_400a54 ], [ -140, %block_400a30 ]
  store i64 %.sink11, i64* %tmp16, align 8, !tbaa !1231
  %tmp174 = add i64 %.sink, 15
  %tmp175 = load i64, i64* %tmp17, align 8, !tbaa !1231
  %tmp176 = add i64 %tmp175, -8
  %tmp177 = inttoptr i64 %tmp176 to i64*
  store i64 %tmp174, i64* %tmp177, align 8
  store i64 %tmp174, i64* %tmp, align 8, !alias.scope !1310, !noalias !7
  store i64 %tmp175, i64* %tmp17, align 8, !alias.scope !1310, !noalias !7
  %tmp178 = tail call i64 @puts(i64 %.sink11), !noalias !7
  store i64 %tmp178, i64* %tmp77, align 8, !alias.scope !1310, !noalias !7
  %tmp179 = load i64, i64* %tmp18, align 8
  %tmp180 = add i64 %tmp179, %.sink4
  %tmp181 = trunc i64 %tmp178 to i32
  %tmp182 = inttoptr i64 %tmp180 to i32*
  store i32 %tmp181, i32* %tmp182, align 4
  %tmp183 = load i64, i64* %tmp17, align 8
  %tmp184 = add i64 %tmp183, 144
  %tmp185 = icmp ugt i64 %tmp183, -145
  %tmp186 = zext i1 %tmp185 to i8
  store i8 %tmp186, i8* %tmp24, align 1, !tbaa !1252
  %tmp187 = trunc i64 %tmp184 to i32
  %tmp188 = and i32 %tmp187, 255
  %tmp189 = tail call i32 @llvm.ctpop.i32(i32 %tmp188) #15, !range !1266
  %tmp190 = trunc i32 %tmp189 to i8
  %tmp191 = and i8 %tmp190, 1
  %tmp192 = xor i8 %tmp191, 1
  store i8 %tmp192, i8* %tmp25, align 1, !tbaa !1267
  %tmp193 = xor i64 %tmp183, 16
  %tmp194 = xor i64 %tmp193, %tmp184
  %tmp195 = lshr i64 %tmp194, 4
  %tmp196 = trunc i64 %tmp195 to i8
  %tmp197 = and i8 %tmp196, 1
  store i8 %tmp197, i8* %tmp26, align 1, !tbaa !1268
  %tmp198 = icmp eq i64 %tmp184, 0
  %tmp199 = zext i1 %tmp198 to i8
  store i8 %tmp199, i8* %tmp27, align 1, !tbaa !1269
  %tmp200 = lshr i64 %tmp184, 63
  %tmp201 = trunc i64 %tmp200 to i8
  store i8 %tmp201, i8* %tmp28, align 1, !tbaa !1270
  %tmp202 = lshr i64 %tmp183, 63
  %tmp203 = xor i64 %tmp200, %tmp202
  %tmp204 = add nuw nsw i64 %tmp203, %tmp200
  %tmp205 = icmp eq i64 %tmp204, 2
  %tmp206 = zext i1 %tmp205 to i8
  store i8 %tmp206, i8* %tmp29, align 1, !tbaa !1271
  %tmp207 = add i64 %tmp183, 152
  %tmp208 = inttoptr i64 %tmp184 to i64*
  %tmp209 = load i64, i64* %tmp208, align 8
  store i64 %tmp209, i64* %tmp18, align 8, !tbaa !1231
  %tmp210 = inttoptr i64 %tmp207 to i64*
  %tmp211 = load i64, i64* %tmp210, align 8
  store i64 %tmp211, i64* %tmp, align 8, !tbaa !1231
  %tmp212 = add i64 %tmp183, 160
  store i64 %tmp212, i64* %tmp17, align 8, !tbaa !1231
  ret %struct.Memory* %arg13

block_4009a3:                                     ; preds = %block_400982, %block_4008b0
  %tmp213 = phi i64 [ %tmp166, %block_4008b0 ], [ %tmp230, %block_400982 ]
  store i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 52), i64* %tmp16, align 8, !tbaa !1231
  %tmp214 = add i64 %tmp213, 15
  %tmp215 = load i64, i64* %tmp17, align 8, !tbaa !1231
  %tmp216 = add i64 %tmp215, -8
  %tmp217 = inttoptr i64 %tmp216 to i64*
  store i64 %tmp214, i64* %tmp217, align 8
  store i64 %tmp214, i64* %tmp, align 8, !alias.scope !1315, !noalias !1318
  store i64 %tmp215, i64* %tmp17, align 8, !alias.scope !1315, !noalias !1318
  %tmp218 = tail call i64 @puts(i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 52)), !noalias !1315
  %tmp219 = load i64, i64* %tmp18, align 8
  %tmp220 = add i64 %tmp219, -132
  %tmp221 = trunc i64 %tmp218 to i32
  %tmp222 = load i64, i64* %tmp, align 8
  %tmp223 = add i64 %tmp222, 6
  %tmp224 = inttoptr i64 %tmp220 to i32*
  store i32 %tmp221, i32* %tmp224, align 4
  br label %block_4009b8

block_400982:                                     ; preds = %block_4008b0
  %tmp225 = add i64 %tmp156, -104
  %tmp226 = inttoptr i64 %tmp225 to i32*
  %tmp227 = load i32, i32* %tmp226, align 4
  %tmp228 = icmp eq i32 %tmp227, 0
  %tmp229 = select i1 %tmp228, i64 10, i64 33
  %tmp230 = add i64 %tmp229, %tmp166
  br i1 %tmp228, label %block_40098c, label %block_4009a3

block_4009b8:                                     ; preds = %block_40098c, %block_4009a3
  %tmp231 = phi i64 [ %tmp223, %block_4009a3 ], [ %tmp345, %block_40098c ]
  %tmp232 = phi i64 [ %tmp219, %block_4009a3 ], [ %tmp340, %block_40098c ]
  %tmp233 = add i64 %tmp232, -16
  %tmp234 = inttoptr i64 %tmp233 to i64*
  %tmp235 = load i64, i64* %tmp234, align 8
  %tmp236 = add i64 %tmp232, -8
  %tmp237 = inttoptr i64 %tmp236 to i64*
  %tmp238 = load i64, i64* %tmp237, align 8
  %tmp239 = add i64 %tmp232, -120
  %tmp240 = inttoptr i64 %tmp239 to i64*
  store i64 %tmp235, i64* %tmp240, align 8
  %tmp241 = add i64 %tmp232, -112
  %tmp242 = inttoptr i64 %tmp241 to i64*
  store i64 %tmp238, i64* %tmp242, align 8
  %tmp243 = load i64, i64* %tmp240, align 8
  store i64 %tmp243, i64* %tmp62, align 1, !tbaa !1298
  store double 0.000000e+00, double* %tmp32, align 1, !tbaa !1298
  %tmp244 = load i64, i64* %tmp242, align 8
  store i64 %tmp244, i64* %tmp64, align 1, !tbaa !1298
  store double 0.000000e+00, double* %tmp35, align 1, !tbaa !1298
  %tmp245 = add i64 %tmp231, 35
  %tmp246 = load i64, i64* %tmp17, align 8, !tbaa !1231
  %tmp247 = add i64 %tmp246, -8
  %tmp248 = inttoptr i64 %tmp247 to i64*
  store i64 %tmp245, i64* %tmp248, align 8
  %tmp249 = load i64, i64* %tmp16, align 8, !alias.scope !1320, !noalias !1323
  store i64 %tmp245, i64* %tmp, align 8, !alias.scope !1320, !noalias !1323
  store i64 %tmp246, i64* %tmp17, align 8, !alias.scope !1320, !noalias !1323
  %tmp250 = tail call i64 @csin(i64 %tmp249), !noalias !1320
  %tmp251 = load i64, i64* %tmp, align 8
  %tmp252 = load i64, i64* %tmp18, align 8
  %tmp253 = add i64 %tmp252, -48
  %tmp254 = load i64, i64* %tmp62, align 1
  %tmp255 = inttoptr i64 %tmp253 to i64*
  store i64 %tmp254, i64* %tmp255, align 8
  %tmp256 = add i64 %tmp252, -40
  %tmp257 = load i64, i64* %tmp64, align 1
  %tmp258 = inttoptr i64 %tmp256 to i64*
  store i64 %tmp257, i64* %tmp258, align 8
  %tmp259 = load i64, i64* %tmp255, align 8
  %tmp260 = add i64 %tmp252, -88
  %tmp261 = inttoptr i64 %tmp260 to double*
  %tmp262 = inttoptr i64 %tmp260 to i64*
  store i64 %tmp259, i64* %tmp262, align 8
  %tmp263 = load i64, i64* %tmp258, align 8
  store i64 %tmp263, i64* %tmp62, align 1, !tbaa !1298
  store double 0.000000e+00, double* %tmp32, align 1, !tbaa !1298
  %tmp264 = add i64 %tmp252, -96
  %tmp265 = inttoptr i64 %tmp264 to double*
  %tmp266 = inttoptr i64 %tmp264 to i64*
  store i64 %tmp263, i64* %tmp266, align 8
  %tmp267 = load double, double* %tmp261, align 8
  %tmp268 = tail call double @llvm.trunc.f64(double %tmp267) #15
  %tmp269 = tail call double @llvm.fabs.f64(double %tmp268) #15
  %tmp270 = fcmp ogt double %tmp269, 0x41DFFFFFFFC00000
  %tmp271 = fptosi double %tmp268 to i32
  %tmp272 = add i64 %tmp252, -100
  %tmp273 = select i1 %tmp270, i32 -2147483648, i32 %tmp271
  %tmp274 = inttoptr i64 %tmp272 to i32*
  store i32 %tmp273, i32* %tmp274, align 4
  %tmp275 = load double, double* %tmp265, align 8
  %tmp276 = tail call double @llvm.trunc.f64(double %tmp275) #15
  %tmp277 = tail call double @llvm.fabs.f64(double %tmp276) #15
  %tmp278 = fcmp ogt double %tmp277, 0x41DFFFFFFFC00000
  %tmp279 = fptosi double %tmp276 to i32
  %tmp280 = add i64 %tmp252, -104
  %tmp281 = select i1 %tmp278, i32 -2147483648, i32 %tmp279
  %tmp282 = inttoptr i64 %tmp280 to i32*
  store i32 %tmp281, i32* %tmp282, align 4
  %tmp283 = load i32, i32* %tmp274, align 4
  %tmp284 = zext i32 %tmp283 to i64
  store i64 %tmp284, i64* %tmp15, align 8, !tbaa !1231
  %tmp285 = load i32, i32* %tmp282, align 4
  %tmp286 = zext i32 %tmp285 to i64
  store i64 %tmp286, i64* %tmp14, align 8, !tbaa !1231
  %tmp287 = add i64 %tmp251, 69
  %tmp288 = load i64, i64* %tmp17, align 8, !tbaa !1231
  %tmp289 = add i64 %tmp288, -8
  %tmp290 = inttoptr i64 %tmp289 to i64*
  store i64 %tmp287, i64* %tmp290, align 8
  %tmp291 = load i64, i64* %tmp120, align 8, !alias.scope !1325, !noalias !1328
  %tmp292 = load i64, i64* %tmp121, align 8, !alias.scope !1325, !noalias !1328
  %tmp293 = load i64, i64* %tmp122, align 8, !alias.scope !1325, !noalias !1328
  %tmp294 = inttoptr i64 %tmp288 to i64*
  %tmp295 = load i64, i64* %tmp294, align 8
  %tmp296 = add i64 %tmp288, 8
  %tmp297 = inttoptr i64 %tmp296 to i64*
  %tmp298 = load i64, i64* %tmp297, align 8
  %tmp299 = add i64 %tmp288, 16
  %tmp300 = inttoptr i64 %tmp299 to i64*
  %tmp301 = load i64, i64* %tmp300, align 8
  %tmp302 = add i64 %tmp288, 24
  %tmp303 = inttoptr i64 %tmp302 to i64*
  %tmp304 = load i64, i64* %tmp303, align 8
  %tmp305 = add i64 %tmp288, 32
  %tmp306 = inttoptr i64 %tmp305 to i64*
  %tmp307 = load i64, i64* %tmp306, align 8
  %tmp308 = add i64 %tmp288, 40
  %tmp309 = inttoptr i64 %tmp308 to i64*
  %tmp310 = load i64, i64* %tmp309, align 8
  %tmp311 = add i64 %tmp288, 48
  %tmp312 = inttoptr i64 %tmp311 to i64*
  %tmp313 = load i64, i64* %tmp312, align 8
  %tmp314 = add i64 %tmp288, 56
  %tmp315 = inttoptr i64 %tmp314 to i64*
  %tmp316 = load i64, i64* %tmp315, align 8
  %tmp317 = add i64 %tmp288, 64
  %tmp318 = inttoptr i64 %tmp317 to i64*
  %tmp319 = load i64, i64* %tmp318, align 8
  %tmp320 = add i64 %tmp288, 72
  %tmp321 = inttoptr i64 %tmp320 to i64*
  %tmp322 = load i64, i64* %tmp321, align 8
  store i64 %tmp287, i64* %tmp, align 8, !alias.scope !1325, !noalias !1328
  store i64 %tmp288, i64* %tmp17, align 8, !alias.scope !1325, !noalias !1328
  %tmp323 = tail call i64 @printf(i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 40), i64 %tmp284, i64 %tmp286, i64 %tmp291, i64 %tmp292, i64 %tmp293, i64 %tmp295, i64 %tmp298, i64 %tmp301, i64 %tmp304, i64 %tmp307, i64 %tmp310, i64 %tmp313, i64 %tmp316, i64 %tmp319, i64 %tmp322), !noalias !1325
  %tmp324 = load i64, i64* %tmp18, align 8
  %tmp325 = add i64 %tmp324, -100
  %tmp326 = load i64, i64* %tmp, align 8
  %tmp327 = inttoptr i64 %tmp325 to i32*
  %tmp328 = load i32, i32* %tmp327, align 4
  %tmp329 = icmp eq i32 %tmp328, 0
  %tmp330 = add i64 %tmp324, -136
  %tmp331 = trunc i64 %tmp323 to i32
  %tmp332 = inttoptr i64 %tmp330 to i32*
  store i32 %tmp331, i32* %tmp332, align 4
  %tmp333 = select i1 %tmp329, i64 16, i64 52
  %tmp334 = add i64 %tmp333, %tmp326
  br i1 %tmp329, label %block_400a30, label %block_400a54

block_40098c:                                     ; preds = %block_400982
  store i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 47), i64* %tmp16, align 8, !tbaa !1231
  %tmp335 = add i64 %tmp230, 15
  %tmp336 = load i64, i64* %tmp17, align 8, !tbaa !1231
  %tmp337 = add i64 %tmp336, -8
  %tmp338 = inttoptr i64 %tmp337 to i64*
  store i64 %tmp335, i64* %tmp338, align 8
  store i64 %tmp335, i64* %tmp, align 8, !alias.scope !1330, !noalias !1333
  store i64 %tmp336, i64* %tmp17, align 8, !alias.scope !1330, !noalias !1333
  %tmp339 = tail call i64 @puts(i64 add (i64 ptrtoint (%seg_400b20__rodata_type* @seg_400b20__rodata to i64), i64 47)), !noalias !1330
  %tmp340 = load i64, i64* %tmp18, align 8
  %tmp341 = add i64 %tmp340, -128
  %tmp342 = trunc i64 %tmp339 to i32
  %tmp343 = load i64, i64* %tmp, align 8
  %tmp344 = inttoptr i64 %tmp341 to i32*
  store i32 %tmp342, i32* %tmp344, align 4
  %tmp345 = add i64 %tmp343, 29
  br label %block_4009b8
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400660_register_tm_clones(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_400660:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 9, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  %tmp6 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  %tmp7 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  %tmp8 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64* %tmp3, align 8, !tbaa !1231
  store i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1), i64* %tmp4, align 8, !tbaa !1231
  store i8 and (i8 trunc (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)) to i8), i8 1), i8* %tmp5, align 1, !tbaa !1335
  %tmp11 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1) to i32), i32 255)) #15, !range !1266
  %tmp12 = trunc i32 %tmp11 to i8
  %tmp13 = and i8 %tmp12, 1
  %tmp14 = xor i8 %tmp13, 1
  store i8 %tmp14, i8* %tmp6, align 1, !tbaa !1335
  store i8 0, i8* %tmp7, align 1, !tbaa !1335
  store i8 zext (i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1), i64 0) to i8), i8* %tmp8, align 1, !tbaa !1335
  store i8 trunc (i64 lshr (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1), i64 63) to i8), i8* %tmp9, align 1, !tbaa !1335
  store i8 0, i8* %tmp10, align 1, !tbaa !1335
  br i1 icmp eq (i64 ashr (i64 add (i64 lshr (i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3), i64 63), i64 ashr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 3)), i64 1), i64 0), label %block_400690, label %block_40067f

block_40067f:                                     ; preds = %block_400660
  store i64 0, i64* %tmp3, align 8, !tbaa !1231
  store i8 0, i8* %tmp5, align 1, !tbaa !1252
  store i8 1, i8* %tmp6, align 1, !tbaa !1267
  store i8 1, i8* %tmp8, align 1, !tbaa !1269
  store i8 0, i8* %tmp9, align 1, !tbaa !1270
  store i8 0, i8* %tmp10, align 1, !tbaa !1271
  store i8 0, i8* %tmp7, align 1, !tbaa !1268
  br label %block_400690

block_400690:                                     ; preds = %block_40067f, %block_400660
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
define %struct.Memory* @sub_4006a0___do_global_dtors_aux(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_4006a0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp4 = load i8, i8* getelementptr inbounds (%__bss_start_type, %__bss_start_type* @__bss_start, i64 0, i32 0, i64 0), align 8
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  store i8 0, i8* %tmp5, align 1, !tbaa !1252
  %tmp6 = zext i8 %tmp4 to i32
  %tmp7 = tail call i32 @llvm.ctpop.i32(i32 %tmp6) #15, !range !1266
  %tmp8 = trunc i32 %tmp7 to i8
  %tmp9 = and i8 %tmp8, 1
  %tmp10 = xor i8 %tmp9, 1
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  store i8 %tmp10, i8* %tmp11, align 1, !tbaa !1267
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  store i8 0, i8* %tmp12, align 1, !tbaa !1268
  %tmp13 = icmp eq i8 %tmp4, 0
  %tmp14 = zext i1 %tmp13 to i8
  %tmp15 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  store i8 %tmp14, i8* %tmp15, align 1, !tbaa !1269
  %tmp16 = lshr i8 %tmp4, 7
  %tmp17 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  store i8 %tmp16, i8* %tmp17, align 1, !tbaa !1270
  %tmp18 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i8 0, i8* %tmp18, align 1, !tbaa !1271
  %tmp19 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  br i1 %tmp13, label %block_4006a9, label %block_4006c0

block_4006a9:                                     ; preds = %block_4006a0
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
  %tmp27 = tail call %struct.Memory* @sub_400630_deregister_tm_clones(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  store i8 1, i8* getelementptr inbounds (%__bss_start_type, %__bss_start_type* @__bss_start, i64 0, i32 0, i64 0), align 8
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

block_4006c0:                                     ; preds = %block_4006a0
  %tmp35 = load i64, i64* %tmp19, align 8, !tbaa !1231
  %tmp36 = inttoptr i64 %tmp35 to i64*
  %tmp37 = load i64, i64* %tmp36, align 8
  store i64 %tmp37, i64* %tmp, align 8, !tbaa !1231
  %tmp38 = add i64 %tmp35, 8
  store i64 %tmp38, i64* %tmp19, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400a80_main(%struct.State* noalias dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400a80:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 15, i32 0, i32 0
  %tmp6 = load i64, i64* %tmp5, align 8
  %tmp7 = load i64, i64* %tmp4, align 8, !tbaa !1231
  %tmp8 = add i64 %tmp7, -8
  %tmp9 = inttoptr i64 %tmp8 to i64*
  store i64 %tmp6, i64* %tmp9, align 8
  store i64 %tmp8, i64* %tmp5, align 8, !tbaa !1231
  %tmp10 = add i64 %arg1, -928
  %tmp11 = add i64 %arg1, 9
  %tmp12 = add i64 %tmp7, -16
  %tmp13 = inttoptr i64 %tmp12 to i64*
  store i64 %tmp11, i64* %tmp13, align 8
  store i64 %tmp12, i64* %tmp4, align 8, !tbaa !1231
  %tmp14 = tail call %struct.Memory* @sub_4006e0_FooFloat(%struct.State* nonnull %arg, i64 %tmp10, %struct.Memory* %arg2)
  %tmp15 = load i64, i64* %tmp, align 8
  %tmp16 = add i64 %tmp15, -473
  %tmp17 = add i64 %tmp15, 5
  %tmp18 = load i64, i64* %tmp4, align 8, !tbaa !1231
  %tmp19 = add i64 %tmp18, -8
  %tmp20 = inttoptr i64 %tmp19 to i64*
  store i64 %tmp17, i64* %tmp20, align 8
  store i64 %tmp19, i64* %tmp4, align 8, !tbaa !1231
  %tmp21 = tail call %struct.Memory* @sub_4008b0_FooDouble(%struct.State* nonnull %arg, i64 %tmp16, %struct.Memory* %tmp14)
  store i64 0, i64* %tmp3, align 8, !tbaa !1231
  %tmp22 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  store i8 0, i8* %tmp22, align 1, !tbaa !1252
  %tmp23 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  store i8 1, i8* %tmp23, align 1, !tbaa !1267
  %tmp24 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  store i8 1, i8* %tmp24, align 1, !tbaa !1269
  %tmp25 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  store i8 0, i8* %tmp25, align 1, !tbaa !1270
  %tmp26 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i8 0, i8* %tmp26, align 1, !tbaa !1271
  %tmp27 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  store i8 0, i8* %tmp27, align 1, !tbaa !1268
  %tmp28 = load i64, i64* %tmp4, align 8, !tbaa !1231
  %tmp29 = add i64 %tmp28, 8
  %tmp30 = inttoptr i64 %tmp28 to i64*
  %tmp31 = load i64, i64* %tmp30, align 8
  store i64 %tmp31, i64* %tmp5, align 8, !tbaa !1231
  %tmp32 = inttoptr i64 %tmp29 to i64*
  %tmp33 = load i64, i64* %tmp32, align 8
  store i64 %tmp33, i64* %tmp, align 8, !tbaa !1231
  %tmp34 = add i64 %tmp28, 16
  store i64 %tmp34, i64* %tmp4, align 8, !tbaa !1231
  ret %struct.Memory* %tmp21
}

; Function Attrs: noinline
define %struct.Memory* @sub_4005f0(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_4005f0:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp5 = load i64, i64* %tmp4, align 8, !alias.scope !1336, !noalias !1339
  %tmp6 = inttoptr i64 %tmp5 to i64*
  %tmp7 = load i64, i64* %tmp6, align 8
  store i64 %tmp7, i64* %tmp, align 8, !alias.scope !1336, !noalias !1339
  %tmp8 = add i64 %tmp5, 8
  store i64 %tmp8, i64* %tmp4, align 8, !alias.scope !1336, !noalias !1339
  %tmp9 = tail call i64 @__gmon_start__(), !noalias !1336
  store i64 %tmp9, i64* %tmp3, align 8, !alias.scope !1336, !noalias !1339
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400570(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #3 {
block_400570:
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
  %tmp9 = icmp eq i64 %tmp8, 4195708
  br i1 %tmp9, label %block_40057c, label %bb

block_40057c:                                     ; preds = %block_400570
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 11, i32 0, i32 0
  %tmp12 = load i64, i64* %tmp11, align 8, !alias.scope !1341, !noalias !1344
  %tmp13 = load i64, i64* %tmp7, align 8
  store i64 %tmp13, i64* %tmp, align 8, !alias.scope !1341, !noalias !1344
  store i64 %tmp5, i64* %tmp4, align 8, !alias.scope !1341, !noalias !1344
  %tmp14 = tail call i64 @puts(i64 %tmp12), !noalias !1341
  store i64 %tmp14, i64* %tmp10, align 8, !alias.scope !1341, !noalias !1344
  ret %struct.Memory* %arg2

bb:                                               ; preds = %block_400570
  %tmp15 = tail call %struct.Memory* @__mcsema_detach_call_value(%struct.State* nonnull %arg, i64 %tmp8, %struct.Memory* %arg2)
  ret %struct.Memory* %tmp15
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400630_deregister_tm_clones(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_400630:
  %tmp = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 33, i32 0, i32 0
  %tmp3 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 1, i32 0, i32 0
  store i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64* %tmp3, align 8, !tbaa !1231
  %tmp4 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 1
  store i8 zext (i1 icmp ult (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)) to i8), i8* %tmp4, align 1, !tbaa !1252
  %tmp5 = tail call i32 @llvm.ctpop.i32(i32 and (i32 trunc (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)) to i32), i32 255)) #15, !range !1346
  %tmp6 = trunc i32 %tmp5 to i8
  %tmp7 = and i8 %tmp6, 1
  %tmp8 = xor i8 %tmp7, 1
  %tmp9 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 3
  store i8 %tmp8, i8* %tmp9, align 1, !tbaa !1267
  %tmp10 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 5
  store i8 and (i8 trunc (i64 lshr (i64 xor (i64 xor (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64))), i64 4) to i8), i8 1), i8* %tmp10, align 1, !tbaa !1268
  %tmp11 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 7
  store i8 zext (i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 0) to i8), i8* %tmp11, align 1, !tbaa !1269
  %tmp12 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 9
  store i8 trunc (i64 lshr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 63) to i8), i8* %tmp12, align 1, !tbaa !1270
  %tmp13 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 2, i32 13
  store i8 zext (i1 icmp eq (i64 add (i64 xor (i64 lshr (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 63), i64 lshr (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 63)), i64 xor (i64 lshr (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 63), i64 lshr (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 63))), i64 2) to i8), i8* %tmp13, align 1, !tbaa !1271
  br i1 icmp eq (i64 sub (i64 and (i64 ptrtoint (%__bss_start_type* @__bss_start to i64), i64 4294967295), i64 ptrtoint (%__bss_start_type* @__bss_start to i64)), i64 0), label %block_400650, label %block_40063d

block_40063d:                                     ; preds = %block_400630
  store i64 0, i64* %tmp3, align 8, !tbaa !1231
  store i8 0, i8* %tmp4, align 1, !tbaa !1252
  store i8 1, i8* %tmp9, align 1, !tbaa !1267
  store i8 1, i8* %tmp11, align 1, !tbaa !1269
  store i8 0, i8* %tmp12, align 1, !tbaa !1270
  store i8 0, i8* %tmp13, align 1, !tbaa !1271
  store i8 0, i8* %tmp10, align 1, !tbaa !1268
  br label %block_400650

block_400650:                                     ; preds = %block_40063d, %block_400630
  %tmp14 = getelementptr inbounds %struct.State, %struct.State* %arg, i64 0, i32 6, i32 13, i32 0, i32 0
  %tmp15 = load i64, i64* %tmp14, align 8, !tbaa !1231
  %tmp16 = inttoptr i64 %tmp15 to i64*
  %tmp17 = load i64, i64* %tmp16, align 8
  store i64 %tmp17, i64* %tmp, align 8, !tbaa !1231
  %tmp18 = add i64 %tmp15, 8
  store i64 %tmp18, i64* %tmp14, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline nounwind
define %struct.Memory* @sub_400b14__term_proc(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
block_400b14:
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
  store i8 %tmp23, i8* %tmp6, align 1, !tbaa !1252
  %tmp24 = trunc i64 %tmp4 to i32
  %tmp25 = and i32 %tmp24, 255
  %tmp26 = tail call i32 @llvm.ctpop.i32(i32 %tmp25) #15, !range !1266
  %tmp27 = trunc i32 %tmp26 to i8
  %tmp28 = and i8 %tmp27, 1
  %tmp29 = xor i8 %tmp28, 1
  store i8 %tmp29, i8* %tmp7, align 1, !tbaa !1267
  store i8 %tmp11, i8* %tmp12, align 1, !tbaa !1268
  %tmp30 = icmp eq i64 %tmp4, 0
  %tmp31 = zext i1 %tmp30 to i8
  store i8 %tmp31, i8* %tmp13, align 1, !tbaa !1269
  %tmp32 = trunc i64 %tmp16 to i8
  store i8 %tmp32, i8* %tmp15, align 1, !tbaa !1270
  store i8 %tmp20, i8* %tmp21, align 1, !tbaa !1271
  %tmp33 = inttoptr i64 %tmp4 to i64*
  %tmp34 = load i64, i64* %tmp33, align 8
  store i64 %tmp34, i64* %tmp, align 8, !tbaa !1231
  %tmp35 = add i64 %tmp4, 8
  store i64 %tmp35, i64* %tmp3, align 8, !tbaa !1231
  ret %struct.Memory* %arg2
}

; Function Attrs: noinline
define %struct.Memory* @sub_400550__init_proc(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone %arg2) local_unnamed_addr #3 {
block_400550:
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
  store i8 0, i8* %tmp7, align 1, !tbaa !1252
  %tmp13 = tail call i32 @llvm.ctpop.i32(i32 and (i32 ptrtoint (i64 ()* @__gmon_start__ to i32), i32 255)) #15, !range !1266
  %tmp14 = trunc i32 %tmp13 to i8
  %tmp15 = and i8 %tmp14, 1
  %tmp16 = xor i8 %tmp15, 1
  store i8 %tmp16, i8* %tmp8, align 1, !tbaa !1267
  store i8 zext (i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null) to i8), i8* %tmp10, align 1, !tbaa !1269
  store i8 trunc (i64 lshr (i64 ptrtoint (i64 ()* @__gmon_start__ to i64), i64 63) to i8), i8* %tmp11, align 1, !tbaa !1270
  store i8 0, i8* %tmp12, align 1, !tbaa !1271
  store i8 0, i8* %tmp9, align 1, !tbaa !1268
  br i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null), label %block_400565, label %block_400560

block_400565:                                     ; preds = %block_400560, %block_400550
  %tmp17 = phi i64 [ %tmp6, %block_400550 ], [ %tmp48, %block_400560 ]
  %tmp18 = phi %struct.Memory* [ %arg2, %block_400550 ], [ %tmp47, %block_400560 ]
  %tmp19 = add i64 %tmp17, 8
  %tmp20 = icmp ugt i64 %tmp17, -9
  %tmp21 = zext i1 %tmp20 to i8
  store i8 %tmp21, i8* %tmp7, align 1, !tbaa !1252
  %tmp22 = trunc i64 %tmp19 to i32
  %tmp23 = and i32 %tmp22, 255
  %tmp24 = tail call i32 @llvm.ctpop.i32(i32 %tmp23) #15, !range !1266
  %tmp25 = trunc i32 %tmp24 to i8
  %tmp26 = and i8 %tmp25, 1
  %tmp27 = xor i8 %tmp26, 1
  store i8 %tmp27, i8* %tmp8, align 1, !tbaa !1267
  %tmp28 = xor i64 %tmp19, %tmp17
  %tmp29 = lshr i64 %tmp28, 4
  %tmp30 = trunc i64 %tmp29 to i8
  %tmp31 = and i8 %tmp30, 1
  store i8 %tmp31, i8* %tmp9, align 1, !tbaa !1268
  %tmp32 = icmp eq i64 %tmp19, 0
  %tmp33 = zext i1 %tmp32 to i8
  store i8 %tmp33, i8* %tmp10, align 1, !tbaa !1269
  %tmp34 = lshr i64 %tmp19, 63
  %tmp35 = trunc i64 %tmp34 to i8
  store i8 %tmp35, i8* %tmp11, align 1, !tbaa !1270
  %tmp36 = lshr i64 %tmp17, 63
  %tmp37 = xor i64 %tmp34, %tmp36
  %tmp38 = add nuw nsw i64 %tmp37, %tmp34
  %tmp39 = icmp eq i64 %tmp38, 2
  %tmp40 = zext i1 %tmp39 to i8
  store i8 %tmp40, i8* %tmp12, align 1, !tbaa !1271
  %tmp41 = inttoptr i64 %tmp19 to i64*
  %tmp42 = load i64, i64* %tmp41, align 8
  store i64 %tmp42, i64* %tmp, align 8, !tbaa !1231
  %tmp43 = add i64 %tmp17, 16
  store i64 %tmp43, i64* %tmp4, align 8, !tbaa !1231
  ret %struct.Memory* %tmp18

block_400560:                                     ; preds = %block_400550
  %tmp44 = add i64 %arg1, add (i64 select (i1 icmp eq (i64 ()* @__gmon_start__, i64 ()* null), i64 21, i64 16), i64 5)
  %tmp45 = add i64 %tmp5, -16
  %tmp46 = inttoptr i64 %tmp45 to i64*
  store i64 %tmp44, i64* %tmp46, align 8
  store i64 %tmp45, i64* %tmp4, align 8, !tbaa !1231
  %tmp47 = tail call %struct.Memory* @sub_4005f0(%struct.State* nonnull %arg, i64 undef, %struct.Memory* %arg2)
  %tmp48 = load i64, i64* %tmp4, align 8
  br label %block_400565
}

; Function Attrs: nobuiltin noinline noreturn
define i64 @callback_sub_400600__start(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #7 {
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
  %tmp16 = tail call %struct.Memory* @sub_400600__start(%struct.State* nonnull @__mcsema_reg_state, i64 4195840, %struct.Memory* undef)
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
define i64 @callback_sub_4006d0_frame_dummy(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) #9 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196048, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_4006d0_frame_dummy(%struct.State* nonnull @__mcsema_reg_state, i64 4196048, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline nounwind
define i64 @callback_sub_4006a0___do_global_dtors_aux(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) #9 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196000, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_4006a0___do_global_dtors_aux(%struct.State* nonnull @__mcsema_reg_state, i64 4196000, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_601070_puts(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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
  %tmp11 = tail call i64 @puts(i64 %tmp6)
  store i64 %tmp11, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_601090_csinf(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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
  %tmp11 = tail call i64 @csinf(i64 %tmp6)
  store i64 %tmp11, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_601078_printf(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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
define %struct.Memory* @ext_4005e0_cpowf(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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
  %tmp13 = tail call i64 @cpowf(i64 %tmp7, i64 %tmp8)
  store i64 %tmp13, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: nobuiltin noinline norecurse nounwind
define i64 @callback_sub_400b10___libc_csu_fini() #11 {
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
  %tmp6 = tail call %struct.Memory* @sub_400b10___libc_csu_fini(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
  store i64 %tmp2, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp7 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp7
}

; Function Attrs: nobuiltin noinline
define i64 @callback_sub_400aa0___libc_csu_init() #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp1 = icmp eq i64 %tmp, 0
  br i1 %tmp1, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp2 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4197024, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
  store i64 ptrtoint ([512 x i64]* @__mcsema_tls to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 5, i32 7, i32 0, i32 0), align 8
  %tmp3 = load volatile i1, i1* @0, align 1
  br i1 %tmp3, label %__mcsema_early_init.exit, label %bb4

bb4:                                              ; preds = %__mcsema_verify_reg_state.exit
  store volatile i1 true, i1* @0, align 1
  br label %__mcsema_early_init.exit

__mcsema_early_init.exit:                         ; preds = %bb4, %__mcsema_verify_reg_state.exit
  %tmp5 = add i64 %tmp2, -8
  store i64 %tmp5, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp6 = tail call %struct.Memory* @sub_400aa0___libc_csu_init(%struct.State* nonnull @__mcsema_reg_state, i64 4197024, %struct.Memory* null)
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
  store i64 4196992, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp8 = tail call %struct.Memory* @sub_400a80_main(%struct.State* nonnull @__mcsema_reg_state, i64 4196992, %struct.Memory* null)
  store i64 %tmp4, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp9 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp9
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_4005b0___libc_start_main(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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

; Function Attrs: noinline nounwind
define %struct.Memory* @__mcsema_detach_call_value(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #4 {
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
define %struct.Memory* @ext_601098_csin(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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
  %tmp11 = tail call i64 @csin(i64 %tmp6)
  store i64 %tmp11, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_601080_cpow(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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
  %tmp13 = tail call i64 @cpow(i64 %tmp7, i64 %tmp8)
  store i64 %tmp13, i64* %tmp3, align 8
  ret %struct.Memory* %arg2
}

; Function Attrs: alwaysinline inlinehint
define %struct.Memory* @ext_6010b0___gmon_start__(%struct.State* noalias nocapture dereferenceable(3376) %arg, i64 %arg1, %struct.Memory* noalias readnone returned %arg2) local_unnamed_addr #10 {
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

; Function Attrs: nobuiltin noinline
define i64 @FooFloat(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196064, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_4006e0_FooFloat(%struct.State* nonnull @__mcsema_reg_state, i64 4196064, %struct.Memory* null)
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
  store i64 4195664, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400550__init_proc(%struct.State* nonnull @__mcsema_reg_state, i64 4195664, %struct.Memory* null)
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
  store i64 4197140, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_400b14__term_proc(%struct.State* nonnull @__mcsema_reg_state, i64 undef, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: nobuiltin noinline
define i64 @FooDouble(i64 %arg, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6, i64 %arg7) local_unnamed_addr #12 {
bb:
  %tmp = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp8 = icmp eq i64 %tmp, 0
  br i1 %tmp8, label %is_null.i, label %__mcsema_verify_reg_state.exit

is_null.i:                                        ; preds = %bb
  store i64 ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  br label %__mcsema_verify_reg_state.exit

__mcsema_verify_reg_state.exit:                   ; preds = %is_null.i, %bb
  %tmp9 = phi i64 [ %tmp, %bb ], [ ptrtoint (i64* getelementptr inbounds ([131072 x i64], [131072 x i64]* @__mcsema_stack, i64 0, i64 131064) to i64), %is_null.i ]
  store i64 4196528, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 33, i32 0, i32 0), align 8
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
  %tmp16 = tail call %struct.Memory* @sub_4008b0_FooDouble(%struct.State* nonnull @__mcsema_reg_state, i64 4196528, %struct.Memory* null)
  store i64 %tmp9, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 13, i32 0, i32 0), align 8
  %tmp17 = load i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i64 0, i32 6, i32 1, i32 0, i32 0), align 8
  ret i64 %tmp17
}

; Function Attrs: norecurse nounwind
define internal void @__mcsema_destructor() #8 {
bb:
  %tmp = tail call i64 @callback_sub_400b10___libc_csu_fini()
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
  %tmp2 = tail call i64 @callback_sub_400aa0___libc_csu_init()
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
attributes #3 = { noinline "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!1235 = !{!1236, !1236, i64 0}
!1236 = !{!"float", !1233, i64 0}
!1237 = !{!1238}
!1238 = distinct !{!1238, !1239, !"ext_4005e0_cpowf: argument 0"}
!1239 = distinct !{!1239, !"ext_4005e0_cpowf"}
!1240 = !{!1241}
!1241 = distinct !{!1241, !1239, !"ext_4005e0_cpowf: argument 1"}
!1242 = !{!1243}
!1243 = distinct !{!1243, !1244, !"ext_601078_printf: argument 0"}
!1244 = distinct !{!1244, !"ext_601078_printf"}
!1245 = !{!1246}
!1246 = distinct !{!1246, !1244, !"ext_601078_printf: argument 1"}
!1247 = !{!1248, !1250}
!1248 = distinct !{!1248, !1249, !"ext_601070_puts: argument 0"}
!1249 = distinct !{!1249, !"ext_601070_puts"}
!1250 = distinct !{!1250, !1251, !"ext_601070_puts: argument 0"}
!1251 = distinct !{!1251, !"ext_601070_puts"}
!1252 = !{!1253, !1233, i64 2065}
!1253 = !{!"_ZTS5State", !1233, i64 16, !1254, i64 2064, !1233, i64 2080, !1255, i64 2088, !1257, i64 2112, !1259, i64 2208, !1260, i64 2480, !1261, i64 2608, !1262, i64 2736, !1233, i64 2760, !1233, i64 2768, !1263, i64 3280}
!1254 = !{!"_ZTS10ArithFlags", !1233, i64 0, !1233, i64 1, !1233, i64 2, !1233, i64 3, !1233, i64 4, !1233, i64 5, !1233, i64 6, !1233, i64 7, !1233, i64 8, !1233, i64 9, !1233, i64 10, !1233, i64 11, !1233, i64 12, !1233, i64 13, !1233, i64 14, !1233, i64 15}
!1255 = !{!"_ZTS8Segments", !1256, i64 0, !1233, i64 2, !1256, i64 4, !1233, i64 6, !1256, i64 8, !1233, i64 10, !1256, i64 12, !1233, i64 14, !1256, i64 16, !1233, i64 18, !1256, i64 20, !1233, i64 22}
!1256 = !{!"short", !1233, i64 0}
!1257 = !{!"_ZTS12AddressSpace", !1232, i64 0, !1258, i64 8, !1232, i64 16, !1258, i64 24, !1232, i64 32, !1258, i64 40, !1232, i64 48, !1258, i64 56, !1232, i64 64, !1258, i64 72, !1232, i64 80, !1258, i64 88}
!1258 = !{!"_ZTS3Reg", !1233, i64 0}
!1259 = !{!"_ZTS3GPR", !1232, i64 0, !1258, i64 8, !1232, i64 16, !1258, i64 24, !1232, i64 32, !1258, i64 40, !1232, i64 48, !1258, i64 56, !1232, i64 64, !1258, i64 72, !1232, i64 80, !1258, i64 88, !1232, i64 96, !1258, i64 104, !1232, i64 112, !1258, i64 120, !1232, i64 128, !1258, i64 136, !1232, i64 144, !1258, i64 152, !1232, i64 160, !1258, i64 168, !1232, i64 176, !1258, i64 184, !1232, i64 192, !1258, i64 200, !1232, i64 208, !1258, i64 216, !1232, i64 224, !1258, i64 232, !1232, i64 240, !1258, i64 248, !1232, i64 256, !1258, i64 264}
!1260 = !{!"_ZTS8X87Stack", !1233, i64 0}
!1261 = !{!"_ZTS3MMX", !1233, i64 0}
!1262 = !{!"_ZTS14FPUStatusFlags", !1233, i64 0, !1233, i64 1, !1233, i64 2, !1233, i64 3, !1233, i64 4, !1233, i64 5, !1233, i64 6, !1233, i64 7, !1233, i64 8, !1233, i64 9, !1233, i64 10, !1233, i64 11, !1233, i64 12, !1233, i64 13, !1233, i64 14, !1233, i64 15, !1233, i64 16, !1233, i64 17, !1233, i64 18, !1233, i64 19, !1233, i64 20}
!1263 = !{!"_ZTS13SegmentCaches", !1264, i64 0, !1264, i64 16, !1264, i64 32, !1264, i64 48, !1264, i64 64, !1264, i64 80}
!1264 = !{!"_ZTS13SegmentShadow", !1233, i64 0, !1265, i64 8, !1265, i64 12}
!1265 = !{!"int", !1233, i64 0}
!1266 = !{i32 0, i32 9}
!1267 = !{!1253, !1233, i64 2067}
!1268 = !{!1253, !1233, i64 2069}
!1269 = !{!1253, !1233, i64 2071}
!1270 = !{!1253, !1233, i64 2073}
!1271 = !{!1253, !1233, i64 2077}
!1272 = !{!1273}
!1273 = distinct !{!1273, !1274, !"ext_601070_puts: argument 0"}
!1274 = distinct !{!1274, !"ext_601070_puts"}
!1275 = !{!1276}
!1276 = distinct !{!1276, !1274, !"ext_601070_puts: argument 1"}
!1277 = !{!1278}
!1278 = distinct !{!1278, !1279, !"ext_601070_puts: argument 0"}
!1279 = distinct !{!1279, !"ext_601070_puts"}
!1280 = !{!1281}
!1281 = distinct !{!1281, !1279, !"ext_601070_puts: argument 1"}
!1282 = !{!1283}
!1283 = distinct !{!1283, !1284, !"ext_601090_csinf: argument 0"}
!1284 = distinct !{!1284, !"ext_601090_csinf"}
!1285 = !{!1286}
!1286 = distinct !{!1286, !1284, !"ext_601090_csinf: argument 1"}
!1287 = !{!1288}
!1288 = distinct !{!1288, !1289, !"ext_601078_printf: argument 0"}
!1289 = distinct !{!1289, !"ext_601078_printf"}
!1290 = !{!1291}
!1291 = distinct !{!1291, !1289, !"ext_601078_printf: argument 1"}
!1292 = !{i32 0, i32 5}
!1293 = !{!1294}
!1294 = distinct !{!1294, !1295, !"ext_4005b0___libc_start_main: argument 0"}
!1295 = distinct !{!1295, !"ext_4005b0___libc_start_main"}
!1296 = !{!1297}
!1297 = distinct !{!1297, !1295, !"ext_4005b0___libc_start_main: argument 1"}
!1298 = !{!1299, !1299, i64 0}
!1299 = !{!"double", !1233, i64 0}
!1300 = !{!1301}
!1301 = distinct !{!1301, !1302, !"ext_601080_cpow: argument 0"}
!1302 = distinct !{!1302, !"ext_601080_cpow"}
!1303 = !{!1304}
!1304 = distinct !{!1304, !1302, !"ext_601080_cpow: argument 1"}
!1305 = !{!1306}
!1306 = distinct !{!1306, !1307, !"ext_601078_printf: argument 0"}
!1307 = distinct !{!1307, !"ext_601078_printf"}
!1308 = !{!1309}
!1309 = distinct !{!1309, !1307, !"ext_601078_printf: argument 1"}
!1310 = !{!1311, !1313}
!1311 = distinct !{!1311, !1312, !"ext_601070_puts: argument 0"}
!1312 = distinct !{!1312, !"ext_601070_puts"}
!1313 = distinct !{!1313, !1314, !"ext_601070_puts: argument 0"}
!1314 = distinct !{!1314, !"ext_601070_puts"}
!1315 = !{!1316}
!1316 = distinct !{!1316, !1317, !"ext_601070_puts: argument 0"}
!1317 = distinct !{!1317, !"ext_601070_puts"}
!1318 = !{!1319}
!1319 = distinct !{!1319, !1317, !"ext_601070_puts: argument 1"}
!1320 = !{!1321}
!1321 = distinct !{!1321, !1322, !"ext_601098_csin: argument 0"}
!1322 = distinct !{!1322, !"ext_601098_csin"}
!1323 = !{!1324}
!1324 = distinct !{!1324, !1322, !"ext_601098_csin: argument 1"}
!1325 = !{!1326}
!1326 = distinct !{!1326, !1327, !"ext_601078_printf: argument 0"}
!1327 = distinct !{!1327, !"ext_601078_printf"}
!1328 = !{!1329}
!1329 = distinct !{!1329, !1327, !"ext_601078_printf: argument 1"}
!1330 = !{!1331}
!1331 = distinct !{!1331, !1332, !"ext_601070_puts: argument 0"}
!1332 = distinct !{!1332, !"ext_601070_puts"}
!1333 = !{!1334}
!1334 = distinct !{!1334, !1332, !"ext_601070_puts: argument 1"}
!1335 = !{!1233, !1233, i64 0}
!1336 = !{!1337}
!1337 = distinct !{!1337, !1338, !"ext_6010b0___gmon_start__: argument 0"}
!1338 = distinct !{!1338, !"ext_6010b0___gmon_start__"}
!1339 = !{!1340}
!1340 = distinct !{!1340, !1338, !"ext_6010b0___gmon_start__: argument 1"}
!1341 = !{!1342}
!1342 = distinct !{!1342, !1343, !"ext_601070_puts: argument 0"}
!1343 = distinct !{!1343, !"ext_601070_puts"}
!1344 = !{!1345}
!1345 = distinct !{!1345, !1343, !"ext_601070_puts: argument 1"}
!1346 = !{i32 0, i32 6}
