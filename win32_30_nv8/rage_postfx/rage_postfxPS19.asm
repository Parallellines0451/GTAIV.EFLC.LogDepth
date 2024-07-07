//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferStencilTextureSampler;
//   sampler2D GBufferTextureSampler3;
//   sampler2D HDRSampler;
//   float4 SmokeParams;
//   sampler2D SmokeSampler;
//   float4 dofProj;
//   float4 gDepthFxParams;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   gDepthFxParams               c16      1
//   globalFogParams              c41      1
//   globalFogColor               c42      1
//   globalFogColorN              c43      1
//   dofProj                      c66      1
//   SmokeParams                  c72      1
//   GBufferTextureSampler3       s0       1
//   GBufferStencilTextureSampler s1       1
//   HDRSampler                   s2       1
//   SmokeSampler                 s3       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1518673377e-42 // 822
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, -0.0196078438, 0.0313725509, 1, 0
    def c1, 0.212500006, 0.715399981, 0.0720999986, 1.00000001e-007
    def c2, 0.100000001, 0.0909089968, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    texld r0, v0, s1
    add r0.y, -r0.x, c0.y
    add r0.x, r0.x, c0.x
    cmp r0.y, r0.y, c0.z, c0.w
    cmp r0.x, r0.x, r0.y, c0.w
    mul r0.y, r0.x, c41.w
    add r0.x, -r0.x, c0.z
    add r0.z, -c16.z, c16.w
    rcp r0.z, r0.z
    texld r1, v0, s0
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r1.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r1.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r1, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.w, -c66.x, c66.y
    rcp r0.w, r0.w
    mad r1.x, c66.y, -r0.w, r1.x
    mul r0.w, r0.w, c66.y
    mul r0.w, r0.w, -c66.x
    rcp r1.x, r1.x
    mad r1.y, r0.w, -r1.x, c16.w
    mul_sat r0.z, r0.z, r1.y
    add r0.z, -r0.z, c0.z
    mul r0.z, r0.x, r0.z
    mov r1.z, c0.z
    add r1.yz, -r1.z, c16.xxyw
    mad r1.y, r0.z, r1.y, c0.z
    mul r0.z, r0.z, r1.z
    texld r2, v0, s2
    dp3 r1.z, r2, c1
    lrp r3.xyz, r1.y, r2, r1.z
    add r1.y, r1.z, c1.w
    pow r2.x, r1_abs.y, r0.z
    mul r1.yzw, r3.xxyz, r2.x
    mad r2.xyz, r3, -r2.x, c43
    mad r1.yzw, r0.y, r2.xxyz, r1
    mad r0.y, r0.w, r1.x, -c41.x
    mul r0.z, r0.w, r1.x
    add r0.w, -c41.x, c41.y
    rcp r0.w, r0.w
    mul_sat r0.y, r0.y, r0.w
    rcp r0.w, c41.x
    mul_sat r0.w, r0.z, r0.w
    lrp r1.x, c41.w, r0.w, r0.y
    add r0.w, r1.x, c41.z
    mul r0.x, r0.x, r0.w
    mov r2.xyz, c43
    add r2.xyz, -r2, c42
    mad r2.xyz, r0.y, r2, c43
    lrp r3.xyz, r0.x, r2, r1.yzww
    add r0.xyw, -r3.xyzz, c43.xyzz
    texld r1, v0, s3
    mad r1.x, r1.x, c72.x, c72.y
    min r2.x, r1.x, r0.z
    add r0.z, r2.x, -c72.y
    max r1.x, r0.z, c0.w
    min r0.z, r2.x, r1.x
    mov r1.w, c72.w
    mad r0.z, r0.z, r1.w, c2.x
    mul_sat r0.z, r0.z, c2.y
    mad oC0.xyz, r0.z, r0.xyww, r3
    mov oC0.w, c0.z

// approximately 60 instruction slots used (4 texture, 56 arithmetic)
