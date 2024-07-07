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
//   float4 NoiseParams;
//   float4 TexelSize;
//   float4 ToneMapParams;
//   float4 deSatContrastGamma;
//   float4 dofBlur;
//   float4 dofDist;
//   float4 dofProj;
//
//
// Registers:
//
//   Name                   Reg   Size
//   ---------------------- ----- ----
//   Exposure               c66      1
//   TexelSize              c72      1
//   dofProj                c73      1
//   dofDist                c74      1
//   dofBlur                c75      1
//   ToneMapParams          c76      1
//   deSatContrastGamma     c77      1
//   ColorCorrect           c78      1
//   ColorShift             c79      1
//   NoiseParams            c80      1
//   GBufferTextureSampler2 s0       1
//   GBufferTextureSampler3 s1       1
//   HDRSampler             s2       1
//   BlurSampler            s3       1
//   BloomSampler           s4       1
//   AdapLumSampler         s5       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1602751285e-42 // 828
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, -0.5, -1.5, 1.5, 0.5
    def c1, 0, 0.212500006, 0.715399981, 0.0720999986
    def c2, 0, 2, 4, 8
    def c3, 0.25, 1, 256, 0
    def c4, 3.20000005, 1.79999995, 1.10000002, 0
    def c5, 256, 2, 4, 8
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
    dcl_2d s5
    texld r0, v0, s1
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r0.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r0.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r0, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.y, -c73.x, c73.y
    rcp r0.y, r0.y
    mad r0.x, c73.y, -r0.y, r0.x
    mul r0.y, r0.y, c73.y
    mul r0.y, r0.y, -c73.x
    rcp r0.x, r0.x
    mad r0.z, r0.y, -r0.x, c74.w
    mad r0.x, r0.y, r0.x, -c74.w
    mov r1, c0
    mad r0.x, c74.y, -r1.w, r0.x
    max r2.x, r0.x, c1.x
    mad r0.x, c74.y, -r1.w, r0.z
    max r2.y, r0.x, c1.x
    rcp r0.x, c74.x
    mul r0.x, r2.y, r0.x
    lrp r2.y, r0.x, c75.x, c75.y
    min r0.x, c75.x, r2.y
    rcp r0.y, c74.z
    mul r0.y, r2.x, r0.y
    lrp r2.x, r0.y, c75.z, c75.y
    min r0.y, c75.z, r2.x
    max r2.x, r0.x, r0.y
    mul r0.x, r2.x, r2.x
    mad r0.yz, c72.xxyw, r1.xxyw, v0.xxyw
    texld r2, r0.yzzw, s2
    dp3 r3.x, r2, c1.yzww
    mad r0.yz, c72.xxyw, r1.xzxw, v0.xxyw
    texld r4, r0.yzzw, s2
    dp3 r3.y, r4, c1.yzww
    mad r0.yz, c72.xxyw, r1.xwzw, v0.xxyw
    texld r5, r0.yzzw, s2
    dp3 r3.z, r5, c1.yzww
    mad r0.yz, c72.xxyw, r1.xyww, v0.xxyw
    texld r1, r0.yzzw, s2
    dp3 r3.w, r1, c1.yzww
    dp4 r0.y, r3, c3.x
    add r3, r3, -r0.y
    dp4 r0.z, r3, r3
    texld r3, v0, s2
    dp3 r0.w, r3, c1.yzww
    add r0.y, -r0.y, r0.w
    mad r0.y, r0.y, r0.y, -r0.z
    cmp r0.x, r0.y, c3.y, r0.x
    add r0.y, -r0.x, c3.y
    mul r0.x, r0.x, c3.x
    mul r6.xyz, r2, r0.x
    texld r7, v0, s0
    mov r7.yz, c3
    mad r8, r7.w, -r7.z, c2
    mad r9, r7.w, -c5.x, c5.yzwx
    cmp r9, r9, -c3.y, -c3.w
    cmp r8, r8, c3.y, c3.w
    add r8, r9, r8
    mul r8, r8, c0.x
    mul r2.xyz, r2, r8.x
    mad r2.xyz, r3, c0.w, r2
    mad r2.xyz, r4, r8.y, r2
    mad r2.xyz, r5, r8.z, r2
    mad r2.xyz, r1, r8.w, r2
    dp4 r0.z, r8, c3.y
    add r0.z, r0.z, c0.w
    rcp r0.z, r0.z
    mul r2.xyz, r2, r0.z
    mad r0.yzw, r2.xxyz, r0.y, r6.xxyz
    mad r0.yzw, r4.xxyz, r0.x, r0
    mad r0.yzw, r5.xxyz, r0.x, r0
    mad r0.xyz, r1, r0.x, r0.yzww
    mov r1.xy, c4
    mad r1.xy, v0, r1, c80
    frc r1.xy, r1
    texld r1, r1, s3
    add r0.w, r1.z, c0.x
    mul r0.w, r0.w, c80.z
    mad r0.xyz, r0.w, c4.z, r0
    texld r1, v0, s4
    texld r2, c1.x, s5
    rcp r0.w, r2.x
    mul r0.w, r0.w, c76.y
    rcp r1.w, r0.w
    mul r1.w, r1.w, c76.x
    mad r1.xyz, r1, c66.x, -r1.w
    mul r2.xyz, r1, c76.z
    mul r2.xyz, r2, c3.x
    cmp r1.xyz, r1, r2, c1.x
    mad r0.xyz, r0, c66.x, r1
    mul r1.xyz, r0.w, r0
    dp3 r1.x, r1, c1.yzww
    mad r0.xyz, r0, r0.w, -r1.x
    mad r0.xyz, c77.x, r0, r1.x
    mul r0.w, r1.x, c79.w
    mov_sat r1.x, r1.x
    mad r0.xyz, c79, -r0.w, r0
    mul r1.yzw, r0.w, c79.xxyz
    mov_sat r0.w, r0.w
    mad r0.xyz, r0.w, r0, r1.yzww
    mul r0.xyz, r0, c78
    add r0.xyz, r0, r0
    add r0.w, -r7.y, c77.z
    pow r2.x, r1.x, r0.w
    mul oC0.xyz, r0, r2.x
    mov oC0.w, c3.y

// approximately 104 instruction slots used (10 texture, 94 arithmetic)
