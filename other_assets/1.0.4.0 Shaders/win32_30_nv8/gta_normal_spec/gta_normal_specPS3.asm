//
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
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
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 5.8153886269e-43 // 415
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, -1, -0, 1, 0
    def c1, -0.5, 9.99999975e-006, 0.5, 0.001953125
    def c2, 3.99600005, 4, 0.125, 0.25
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
    texld r0, v0, s0
    mul r0.w, r0.w, v4.w
    mul r0.w, r0.w, c39.x
    mov_sat r1.x, r0.w
    mul r1.x, r1.x, c2.x
    frc r1.y, r1.x
    mul r1.z, r1.y, c2.y
    frc r1.w, r1.z
    add r2.xy, r1.zxzw, -r1.wyzw
    mul r1.xy, c2.z, vPos
    frc r1.xy, r1_abs
    cmp r1.xy, vPos, r1, -r1
    mul r1.xy, r1, c2.w
    mad r1.xy, r2, c2.w, r1
    texld r1, r1, s10
    cmp r1, -r1.y, c0.x, c0.y
    texkill r1
    texld r1, v0, s1
    add r1.z, -r1.w, c0.z
    add r1.z, -r1.x, r1.z
    cmp r1.z, r1.z, c0.w, c0.z
    lrp r2.xy, r1.z, r1, r1.wyzw
    add r1.xy, r2, c1.x
    mul r1.xy, r1, c74.x
    dp2add r1.z, r2, -r2, c0.z
    rsq r1.z, r1.z
    rcp r1.z, r1.z
    mul r2.xyz, r1.x, v2
    mad r1.xzw, v1.xyyz, r1.z, r2.xyyz
    mad r1.xyz, r1.y, v3, r1.xzww
    add r1.xyz, r1, c1.y
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    texld r2, v0, s2
    mul r2.w, r2.w, c66.x
    dp3 r2.x, r2, c73
    mul r2.x, r2.x, c72.x
    mad r1.xyz, r1, r1.w, c0.z
    mul oC1.xyz, r1, c1.z
    mul oC2.x, r2.x, c1.z
    mul r1.x, r2.w, c1.w
    rsq r1.x, r1.x
    rcp oC2.y, r1.x
    mov oC0, r0
    mov oC1.w, r0.w
    mov oC2.z, v4.x
    mov oC2.w, r0.w
    mov r0.zw, c0
    mul oC3, r0.zwww, c52.x
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

// approximately 50 instruction slots used (4 texture, 46 arithmetic)
