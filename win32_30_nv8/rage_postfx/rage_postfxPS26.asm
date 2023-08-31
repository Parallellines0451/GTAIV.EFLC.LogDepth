//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D AdapLumSampler;
//   sampler2D BloomSampler;
//   sampler2D BlurSampler;
//   float4 ColorCorrect;
//   float4 ColorShift;
//   float Exposure;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   sampler2D HDRSampler;
//   sampler2D JitterSampler;
//   float4 NoiseParams;
//   float PLAYER_MASK;
//   sampler2D StencilCopySampler;
//   float4 TexelSize;
//   float4 ToneMapParams;
//   float4 deSatContrastGamma;
//   float4 dofBlur;
//   float4 dofDist;
//   float4 dofProj;
//   float gDirectionalMotionBlurLength;
//   float4 globalScreenSize;
//   row_major float4x4 motionBlurMatrix;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   globalScreenSize             c44      1
//   Exposure                     c66      1
//   motionBlurMatrix             c72      4
//   TexelSize                    c76      1
//   dofProj                      c77      1
//   dofDist                      c78      1
//   dofBlur                      c79      1
//   gDirectionalMotionBlurLength c80      1
//   ToneMapParams                c81      1
//   deSatContrastGamma           c82      1
//   ColorCorrect                 c83      1
//   ColorShift                   c84      1
//   NoiseParams                  c85      1
//   PLAYER_MASK                  c86      1
//   GBufferTextureSampler2       s0       1
//   GBufferTextureSampler3       s1       1
//   HDRSampler                   s2       1
//   BlurSampler                  s3       1
//   BloomSampler                 s4       1
//   AdapLumSampler               s5       1
//   JitterSampler                s6       1
//   StencilCopySampler           s7       1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 58.1640015, 47.1300011, 3.20000005, 1.79999995
    def c1, 0, 0.212500006, 0.715399981, 0.0720999986
    def c2, 0.25, 1, 256, 0
    def c3, 0, 2, 4, 8
    def c4, -0.5, -1.5, 1.5, 0.5
    def c5, 2, -1, 0.125, 0
    def c6, 1.10000002, 0, 0, 0
    def c7, 256, 2, 4, 8
    defi i0, 7, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
    dcl_2d s5
    dcl_2d s6
    dcl_2d s7
    texld r0, v0, s1
	// ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
	if_ne r0.x, c127.y
		rcp r20.x, c128.x
		mul r20.x, r20.x, c128.y
		pow r20.x, r20.x, r0.x
		mul r20.x, r20.x, c128.x	// W_clip
		
		add r20.y, r20.x, -c128.x
		add r20.z, c128.y, -c128.x
		mul r20.y, r20.y, c128.y
		mul r20.z, r20.z, r20.x
		rcp r20.z, r20.z
		mul r20.w, r20.y, r20.z		// Linear depth
		
		min r0, r20.w, c127.x		// FP error hack
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.y, -c77.x, c77.y
    rcp r0.y, r0.y
    mul r0.z, r0.y, c77.y
    mul r0.z, r0.z, -c77.x
    mad r0.x, c77.y, -r0.y, r0.x
    rcp r0.x, r0.x
    mul r0.y, r0.z, r0.x
    texld r1, v0, s2
    texld r2, v0, s4
    abs r0.w, c79.w
    mov r3, c4
    mad r4.xy, c76, r3, v0
    texld r4, r4, s2
    mad r5.xy, c76, r3.zxzw, v0
    texld r5, r5, s2
    mad r3.xz, c76.xyyw, r3.wyzw, v0.xyyw
    texld r6, r3.xzzw, s2
    mad r3.xy, c76, r3.ywzw, v0
    texld r7, r3, s2
    dp3 r1.w, r4, r4
    rcp r1.w, r1.w
    cmp r3.xyz, -r1_abs.w, c1.x, r4
    dp3 r1.w, r5, r5
    rcp r1.w, r1.w
    cmp r4.xyz, -r1_abs.w, c1.x, r5
    dp3 r1.w, r6, r6
    rcp r1.w, r1.w
    cmp r5.xyz, -r1_abs.w, c1.x, r6
    dp3 r1.w, r7, r7
    rcp r1.w, r1.w
    cmp r6.xyz, -r1_abs.w, c1.x, r7
    dp3 r1.w, r1, r1
    rcp r1.w, r1.w
    cmp r7.xyz, -r1_abs.w, c1.x, r1
    mad r1.w, r0.z, -r0.x, c78.w
    mad r1.w, c78.y, -r3.w, r1.w
    max r2.w, r1.w, c1.x
    mad r0.x, r0.z, r0.x, -c78.w
    mad r0.x, c78.y, -r3.w, r0.x
    max r1.w, r0.x, c1.x
    rcp r0.x, c78.x
    mul r0.x, r2.w, r0.x
    lrp r2.w, r0.x, c79.x, c79.y
    min r0.x, c79.x, r2.w
    rcp r0.z, c78.z
    mul r0.z, r1.w, r0.z
    lrp r1.w, r0.z, c79.z, c79.y
    min r0.z, c79.z, r1.w
    max r1.w, r0.x, r0.z
    dp3 r0.x, r7, c1.yzww
    dp3 r8.x, r3, c1.yzww
    dp3 r8.y, r4, c1.yzww
    dp3 r8.z, r5, c1.yzww
    dp3 r8.w, r6, c1.yzww
    dp4 r0.z, r8, c2.x
    add r8, r8, -r0.z
    dp4 r2.w, r8, r8
    add r0.x, r0.x, -r0.z
    mad r0.x, r0.x, r0.x, -r2.w
    mul r0.z, r1.w, r1.w
    cmp r0.x, r0.x, c2.y, r0.z
    texld r8, v0, s0
    mov r8.yz, c2
    mad r9, r8.w, -r8.z, c3
    cmp r9, r9, c2.y, c2.w
    mad r10, r8.w, -c7.x, c7.yzwx
    cmp r10, r10, -c2.y, -c2.w
    add r9, r9, r10
    mul r9, r9, c4.x
    dp4 r0.z, r9, c2.y
    add r0.z, r0.z, c4.w
    rcp r0.z, r0.z
    mul r8.xzw, r3.xyyz, r9.x
    mad r7.xyz, r7, c4.w, r8.xzww
    mad r7.xyz, r4, r9.y, r7
    mad r7.xyz, r5, r9.z, r7
    mad r7.xyz, r6, r9.w, r7
    mul r7.xyz, r0.z, r7
    add r0.z, -r0.x, c2.y
    mul r1.w, r0.x, c2.x
    mul r3.xyz, r3, r1.w
    mad r3.xyz, r7, r0.z, r3
    mad r3.xyz, r4, r1.w, r3
    mad r3.xyz, r5, r1.w, r3
    mad r3.xyz, r6, r1.w, r3
    mad r4.xyz, v0.yxyw, c5.x, c5.y
    mul r0.z, r4.y, c77.z
    mul r0.z, r0.y, r0.z
    mul r1.w, -r4.x, c77.w
    mul r1.w, r0.y, r1.w
    mul r5.xyz, r1.w, c73
    mad r5.xyz, r0.z, c72, r5
    mad r5.xyz, -r0.y, c74, r5
    add r5.xyz, r5, c75
    mul r0.y, -r5.z, c77.z
    rcp r0.y, r0.y
    mul r6.x, r5.x, r0.y
    mul r0.y, r5.z, c77.w
    rcp r0.y, r0.y
    mul r6.y, r5.y, r0.y
    add r0.yz, -r4, r6.xxyw
    mul r0.yz, r0, c80.x
    mul r4.xy, r0.yzzw, c5.z
    texld r5, v0, s7
    add r1.w, r5.x, -c86.x
    mul r4.zw, c0.xyxy, v0.xyxy
    mad r4.zw, r3.xyxy, c3.w, r4
    texld r5, r4.zwzw, s6
    add r2.w, r5.x, c4.x
    mad r4.zw, r4.xyxy, r2.w, v0.xyxy
    mov r5.xyz, r3
    mov r2.w, c2.y
    mov r3.w, c2.y
    rep i0
      mad r6.xy, r4, r3.w, r4.zwzw
      texld r7, r6, s7
      add r5.w, r7.x, -c86.x
      cmp r5.w, r5.w, c2.w, c2.y
      texld r6, r6, s2
      mad r5.xyz, r6, r5.w, r5
      add r2.w, r2.w, r5.w
      add r3.w, r3.w, c2.y
    endrep
    rcp r2.w, r2.w
    mul r0.yz, r0, c44.xxyw
    dp2add r0.y, r0.yzzw, r0.yzzw, c1.x
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    mul r0.y, r0.y, c4.w
    add r0.x, r0.x, c2.y
    rcp r0.x, r0.x
    mul_sat r0.x, r0.y, r0.x
    mad r4.xyz, r5, r2.w, -r3
    mad r0.xyz, r0.x, r4, r3
    cmp r0.xyz, r1.w, r3, r0
    cmp r0.xyz, -r0.w, r0, r1
    mov r1.zw, c0
    mad r1.xy, v0, r1.zwzw, c85
    frc r1.xy, r1
    texld r1, r1, s3
    add r0.w, r1.z, c4.x
    mul r0.w, r0.w, c85.z
    mad r0.xyz, r0.w, c6.x, r0
    texld r1, c1.x, s5
    rcp r0.w, r1.x
    mul r0.w, r0.w, c81.y
    rcp r1.x, r0.w
    mul r1.x, r1.x, c81.x
    mad r1.xyz, r2, c66.x, -r1.x
    mul r2.xyz, r1, c81.z
    mul r2.xyz, r2, c2.x
    cmp r1.xyz, r1, r2, c1.x
    mad r0.xyz, r0, c66.x, r1
    mul r1.xyz, r0.w, r0
    dp3 r1.x, r1, c1.yzww
    mad r0.xyz, r0, r0.w, -r1.x
    mad r0.xyz, c82.x, r0, r1.x
    mul r0.w, r1.x, c84.w
    mul r1.yzw, r0.w, c84.xxyz
    mov_sat r2.x, r0.w
    mad r0.xyz, c84, -r0.w, r0
    mad r0.xyz, r2.x, r0, r1.yzww
    mul r0.xyz, r0, c83
    add r0.xyz, r0, r0
    mov_sat r1.x, r1.x
    add r0.w, -r8.y, c82.z
    pow r2.x, r1.x, r0.w
    mul oC0.xyz, r0, r2.x
    mov oC0.w, c2.y

// approximately 176 instruction slots used (14 texture, 162 arithmetic)
