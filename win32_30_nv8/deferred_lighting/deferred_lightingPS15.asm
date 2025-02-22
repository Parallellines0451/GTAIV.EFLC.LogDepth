//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler3;
//   row_major float4x4 dShadowMatrix;
//   float4 dShadowOffsetScale;
//   float4 dShadowParam0123;
//   float4 dShadowParam891113;
//   float4 gDeferredLightColourAndIntensity;
//   float gDeferredLightConeOffset;
//   float gDeferredLightConeScale;
//   float3 gDeferredLightDirection;
//   float gDeferredLightInvSqrRadius;
//   float3 gDeferredLightPosition;
//   float4 gDeferredProjParams;
//   sampler2D gShadowZSamplerCache;
//   row_major float4x4 gViewInverse;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                             Reg   Size
//   -------------------------------- ----- ----
//   NearFarPlane                     c128     1
//   gViewInverse                     c12      4
//   dShadowParam0123                 c66      1
//   dShadowMatrix                    c72      4
//   dShadowParam891113               c76      1
//   dShadowOffsetScale               c77      1
//   gDeferredLightPosition           c78      1
//   gDeferredLightDirection          c79      1
//   gDeferredLightInvSqrRadius       c80      1
//   gDeferredLightConeOffset         c81      1
//   gDeferredLightConeScale          c82      1
//   gDeferredLightColourAndIntensity c83      1
//   gooDeferredLightScreenSize       c84      1
//   gDeferredProjParams              c85      1
//   GBufferTextureSampler0           s0       1
//   GBufferTextureSampler1           s1       1
//   GBufferTextureSampler3           s2       1
//   gShadowZSamplerCache             s14      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.8025969286e-44 // 20
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 0.50999999, 2, -0.999989986, 9.99999975e-006
    def c1, 1, -0.333333343, 1.5, 0.100000001
    def c2, 1, 0, 0.5, -0.5
    def c3, 3, 4.27199984, 0, 0.75
    def c4, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c5, -1, 1, 0.25, 0
    dcl_texcoord v0
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s14
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c84.zwzw
    texld r1, r0, s2
    
    // LogDepth Read
    rcp r20.x, c128.x
    mul r20.x, r20.x, c128.y
    pow r20.x, r20.x, r1.x
    mul r1.y, r20.x, c128.x
    
    rcp r0.z, v0.w
    mul r0.z, r0.z, r1.y
    mad r1.xyz, v0, -r0.z, c15
    texld r2, r0, s1
    texld r0, r0, s0
    mad r2.xyz, r2, c0.y, c0.z
    nrm r3.xyz, r2
    mad r2.xyz, r3, c1.w, r1
    add r1.xyz, -r1, c78
    mul r4.xyz, r2.y, c73
    mad r2.xyw, r2.x, c72.xyzz, r4.xyzz
    mad r2.xyz, r2.z, c74, r2.xyww
    add r2.xyz, r2, c75
    add r0.w, r2.z, c76.z
    mov r2.w, -r0_abs.w
    dp3 r1.w, r2.xyww, r2.xyww
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    add r2.z, r0_abs.w, r1.w
    cmp r4.xy, -r0.w, c2, c2.yxzw
    rcp r0.w, r2.z
    mul r2.xy, r2, r0.w
    mad r2.xy, r2, c2.zwzw, c2.z
    dp2add r0.w, vPos, c3, c3.z
    mad r0.w, r0.w, c4.x, c4.y
    frc r0.w, r0.w
    mad r0.w, r0.w, c4.z, c4.w
    sincos r5.xy, r0.w
    mul r2.zw, r5.xyyx, c77.z
    mad_sat r2.zw, r2, c3.w, r2.xyxy
    mad r2.zw, r2, c77.w, c77.xyxy
    texld r6, r2.zwzw, s14
    dp2add r6.y, r6, r4, c2.y
    mul r2.zw, -r5.xyyx, c77.z
    mul r5, r5.xyxy, c5.xyyx
    mad_sat r2.zw, r2, c5.z, r2.xyxy
    mad r2.zw, r2, c77.w, c77.xyxy
    texld r7, r2.zwzw, s14
    dp2add r6.w, r7, r4, c2.y
    mul r2.zw, r5.xyxy, c77.z
    mad_sat r4.zw, r5, c77.z, r2.xyxy
    mad_sat r2.xy, r2.zwzw, c2.z, r2
    mad r2.xy, r2, c77.w, c77
    texld r2, r2, s14
    dp2add r6.z, r2, r4, c2.y
    mad r2.xy, r4.zwzw, c77.w, c77
    texld r2, r2, s14
    dp2add r6.x, r2, r4, c2.y
    mad r2, r1.w, c66.w, r6
    cmp r2, r2, c2.x, c2.y
    dp4 r0.w, r2, c5.z
    add r2.xyz, r1, c0.w
    dp3 r1.x, r1, r1
    mov r4.x, c1.x
    mad_sat r1.x, r1.x, -c80.x, r4.x
    mad r1.x, r1.x, r1.x, c1.y
    nrm r4.xyz, r2
    dp3 r1.y, r4, -c79
    dp3 r1.z, r3, r4
    add r1.z, r1.z, c1.y
    mul_sat r1.z, r1.z, c1.z
    add r1.y, r1.y, -c81.x
    mul_sat r1.y, r1.y, c82.x
    mul r1.w, r1.x, c1.z
    mul r1.y, r1.y, r1.w
    mul r1.y, r1.z, r1.y
    mul r0.w, r0.w, r1.y
    mul r1.yzw, c83.w, c83.xxyz
    mul r1.yzw, r0.w, r1
    mul r0.xyz, r0, r1.yzww
    cmp oC0.xyz, r1.x, r0, c2.y
    mov oC0.w, c1.x
    
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

// approximately 92 instruction slots used (7 texture, 85 arithmetic)
