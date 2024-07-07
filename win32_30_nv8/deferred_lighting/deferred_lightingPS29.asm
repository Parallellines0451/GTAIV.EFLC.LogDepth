//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler3;
//   float4 gDeferredLightColourAndIntensity;
//   float gDeferredLightConeOffset;
//   float gDeferredLightConeScale;
//   float3 gDeferredLightDirection;
//   float3 gDeferredLightPosition;
//   float gDeferredLightRadius;
//   sampler2D gDeferredLightSampler;
//   float3 gDeferredLightTangent;
//   float4 gDeferredProjParams;
//   row_major float4x4 gViewInverse;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                             Reg   Size
//   -------------------------------- ----- ----
//   gViewInverse                     c12      4
//   gDeferredLightPosition           c66      1
//   gDeferredLightDirection          c72      1
//   gDeferredLightTangent            c73      1
//   gDeferredLightRadius             c74      1
//   gDeferredLightConeOffset         c75      1
//   gDeferredLightConeScale          c76      1
//   gDeferredLightColourAndIntensity c77      1
//   gooDeferredLightScreenSize       c78      1
//   gDeferredProjParams              c79      1
//   gDeferredLightSampler            s0       1
//   GBufferTextureSampler1           s1       1
//   GBufferTextureSampler3           s2       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.7644147787e-44 // 34
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 0.50999999, 2, -0.999989986, 2.20000005
    def c1, 1.79999995, 0.5, 0, 1
    def c2, 3, 0, 0, 0
    dcl_texcoord v0
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    mov r0.xyz, c72
    mul r1.xyz, r0.zxyw, c73.yzxw
    mad r0.xyz, r0.yzxw, c73.zxyw, -r1
    add r1.xy, c0.x, vPos
    mul r1.xy, r1, c78.zwzw
    texld r2, r1, s2
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r2.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r2.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r2, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    texld r1, r1, s1
    mad r1.xyz, r1, c0.y, c0.z
    nrm r3.xyz, r1
    dp3 r0.w, c72, r3
    mad r1.x, r2.x, c79.z, -c79.w
    mul r1.x, r1.x, v0.w
    rcp r1.x, r1.x
    mad r1.xyz, v0, -r1.x, c15
    add r1.xyz, -r1, c66
    dp3 r0.x, r0, r1
    mov r1.w, c0.w
    mul r0.y, r1.w, c75.x
    rcp r0.y, r0.y
    mul r0.x, r0.x, r0.y
    dp3 r0.z, c73, r1
    dp3 r1.x, -c72, r1
    mov r2.x, c1.x
    mul r1.y, r2.x, c76.x
    rcp r1.y, r1.y
    mul r0.y, r0.z, r1.y
    mad r2.xy, r0, c1.y, c1.y
    mov r2.zw, c1.z
    texldl r2, r2, s0
    cmp r0.x, r1.x, c1.z, c1.w
    cmp r0.y, -r1.x, -c1.z, -c1.w
    add r0.z, r1.x, -c74.x
    add r0.x, r0.x, r0.y
    mul_sat r0.x, r0.w, r0.x
    mul r0.x, r0.x, r0.x
    mul r0.x, r2.x, r0.x
    add r0.y, c74.x, c74.x
    rcp r0.y, r0.y
    mad_sat r0.y, r0.z, -r0.y, c1.w
    mul r0.y, r0.y, r0.y
    mul r0.x, r0.x, r0.y
    mul r0.x, r0.x, c77.w
    mul oC0.w, r0.x, c2.x
    mov oC0.xyz, c1.z
    // ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
    if_ne v9.y, c127.y
      rcp r20.z, c128.x
      mul r20.x, v9.w, r20.z
      mul r20.y, c128.y, r20.z
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.y, r20.y
    else
      mov r20.x, v9.z
      rcp r20.y, v9.w
    endif
    mul oDepth, r20.x, r20.y
    // ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 47 instruction slots used (4 texture, 43 arithmetic)
