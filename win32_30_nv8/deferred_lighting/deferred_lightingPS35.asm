//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler3;
//   sampler2D gDeferredLightSampler;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                       Reg   Size
//   -------------------------- ----- ----
//   gooDeferredLightScreenSize c66      1
//   gDeferredLightSampler      s0       1
//   GBufferTextureSampler3     s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.6051938573e-44 // 40
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 0.50999999, 1, 1199.94995, -1200
    def c1, -60, 5, 1, -0.00100000005
    def c2, 1, 0, 0, 0
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c66.zwzw
    texld r1, r0, s0
    texld r0, r0, s1
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
    add r0.x, -r0.x, c0.y
    mad r0.x, r0.x, c0.z, c0.w
    rcp r0.x, r0.x
    add r0.y, -r1.x, c0.y
    mad r0.y, r0.y, c0.z, c0.w
    rcp r0.y, r0.y
    mul r0.y, r0.y, c1.x
    mad r0.x, r0.x, c1.x, -r0.y
    add r0.y, r0_abs.x, c1.w
    mad r0.x, r0_abs.x, -c1.y, c1.z
    cmp r0.y, r0.y, c2.x, c2.y
    mul r0.y, r0.x, r0.y
    cmp oC0.w, r0.x, r0.y, c2.y
    mov oC0.xyz, c2.xyyw

// approximately 18 instruction slots used (2 texture, 16 arithmetic)
