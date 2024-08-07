//
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
//
// Parameters:
//
//   sampler2D EnvironmentSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 globalScalars;
//   float reflectivePower;
//   float4 stencil;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   globalScalars      c39      1
//   stencil            c52      1
//   reflectivePower    c66      1
//   TextureSampler     s0       1
//   EnvironmentSampler s1       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.3848429070e-43 // 527
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, -1, -0, 9.99999975e-006, 1
    def c1, -0.5, 0.5, 0, 0
    def c2, 3.99600005, 4, 0.125, 0.25
    def c3, 0, 1, 0.25, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s10
    texld r0, v0, s0
    mul r0.w, r0.w, v3.w
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
    add r1.xyz, c0.z, v1
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mul r2.xyz, r1, r1.w
    add r3.xyz, c0.z, v2
    nrm r4.xyz, r3
    dp3 r2.w, -r4, r2
    add r2.w, r2.w, r2.w
    mad r2.xyz, r2, -r2.w, -r4
    add r2.xyz, r2, c0.z
    dp3 r2.y, r2, r2
    rsq r2.y, r2.y
    mad r2.xy, r2.xzzw, r2.y, c0.w
    mul r2.xy, r2, c1.x
    texld r2, r2, s1
    mad oC0.xyz, r2, c66.x, r0
    mad r0.xyz, r1, r1.w, c0.w
    mul oC1.xyz, r0, c1.y
    mov oC0.w, r0.w
    mov oC1.w, r0.w
    mad oC2.xyz, v3.x, c3.xxyw, c3.xzxw
    mov oC2.w, r0.w
    mov r0.xy, c0
    mul oC3, -r0.xyyy, c52.x
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

// approximately 43 instruction slots used (3 texture, 40 arithmetic)
