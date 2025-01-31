//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D GBufferTextureSampler3;
//   sampler2D gDeferredLightSampler;
//   float4 gDeferredProjParams;
//   row_major float4x4 gViewInverse;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                       Reg   Size
//   -------------------------- ----- ----
//   NearFarPlane               c128     1
//   gViewInverse               c12      4
//   gooDeferredLightScreenSize c66      1
//   gDeferredProjParams        c72      1
//   gDeferredLightSampler      s0       1
//   GBufferTextureSampler3     s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.6242849323e-44 // 33
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 0.50999999, 0, 0.5, 0
    dcl_color v0
    dcl_texcoord v1.xyw
    dcl_texcoord1 v2
    dcl_texcoord2 v3.xyw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c66.zwzw
    texld r0, r0, s1
    
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r0.x
    mul r0.y, r20.x, c128.x
    
    rcp r0.x, v1.w
    mul r0.x, r0.x, r0.y
    mad r0.xy, v1, -r0.x, c15
    add r0.xy, r0, -v3
    dp2add r1.x, v2, r0, c0.y
    dp2add r1.y, v2.zwzw, r0, c0.y
    mul r0.x, c0.z, v3.w
    mad r0.xy, r1, r0.x, c0.z
    texld r0, r0, s0
    mul oC0, r0, v0
    
    // LogDepth Write
    if_ne v9.y, c127.x
      rcp r20.x, c128.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c128.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mul r20.x, r20.x, r20.y
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 16 instruction slots used (2 texture, 14 arithmetic)
