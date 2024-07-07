//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D SpecSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
//   float4 globalScalars;
//   float3 specMapIntMask;
//   float specularColorFactor;
//   float specularFactor;
//   float4 stencil;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   globalScalars       c39      1
//   stencil             c52      1
//   specularFactor      c66      1
//   specularColorFactor c72      1
//   specMapIntMask      c73      1
//   bumpiness           c74      1
//   TextureSampler      s0       1
//   BumpSampler         s1       1
//   SpecSampler         s2       1
//   StippleTexture      s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.0446744716e-43 // 360
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, -0.5, 9.99999975e-006, 0.5, 0.001953125
    def c1, 3.99600005, 4, 0.125, 0.25
    def c2, 0, -1, -0, 1
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord4 v2.xyz
    dcl_texcoord5 v3.xyz
    dcl_color v4.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s10
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c1.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c1.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c1.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c1.w
    mad r0.xy, r1, c1.w, r0
    mov r0.zw, c2.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c2.y, c2.z
    texkill r0
    texld r0, v0, s1
    add r0.z, -r0.w, c2.w
    add r0.z, -r0.x, r0.z
    cmp r0.xy, r0.z, r0.wyzw, r0
    texld r1, v0, s0
    add r0.zw, r0.xyxy, c0.x
    mul r0.zw, r0, c74.x
    dp2add r0.x, r0, -r0, c2.w
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r2.xyz, r0.z, v2
    mad r0.xyz, v1, r0.x, r2
    mad r0.xyz, r0.w, v3, r0
    add r0.xyz, r0, c0.y
    dp3 r0.w, r0, r0
    rsq r0.w, r0.w
    texld r2, v0, s2
    mul r2.w, r2.w, c66.x
    dp3 r2.x, r2, c73
    mul r2.x, r2.x, c72.x
    mul r1.w, r1.w, v4.w
    mad r0.xyz, r0, r0.w, c2.w
    mul oC1.xyz, r0, c0.z
    mul oC2.x, r2.x, c0.z
    mul r0.x, r2.w, c0.w
    rsq r0.x, r0.x
    rcp oC2.y, r0.x
    mul r0.x, r1.w, c39.x
    mov oC0.xyz, r1
    mov oC0.w, r0.x
    mov oC1.w, r0.x
    mov oC2.z, v4.x
    mov oC2.w, r0.x
    mov r0.xw, c2
    mul oC3, r0.wxxx, c52.x
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

// approximately 52 instruction slots used (5 texture, 47 arithmetic)
