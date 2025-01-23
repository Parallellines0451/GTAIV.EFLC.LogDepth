//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D EnvironmentSampler;
//   sampler2D TextureSampler;
//   float bumpiness;
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
//   bumpiness          c66      1
//   reflectivePower    c72      1
//   TextureSampler     s0       1
//   BumpSampler        s1       1
//   EnvironmentSampler s2       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.7223758248e-43 // 337
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, -0.5, 9.99999975e-006, 0.5, 0
    def c1, 0.176470593, -1, -0, 1
    def c2, 0, 1, 0.25, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    texld r0, v0, s0
    mul r0.w, r0.w, v5.w
    mul r1.x, r0.w, c39.x
    mov r2.xyz, c1
    mad r0.w, r0.w, -c39.x, r2.x
    cmp r3, r0.w, c1.y, c1.z
    texkill r3
    texld r3, v0, s1
    add r0.w, -r3.w, c1.w
    add r0.w, -r3.x, r0.w
    cmp r1.yz, r0.w, r3.xwyw, r3.xxyw
    add r2.xw, r1.yyzz, c0.x
    mul r2.xw, r2, c66.x
    dp2add r0.w, r1.yzzw, -r1.yzzw, c1.w
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mul r1.yzw, r2.x, v3.xxyz
    mad r1.yzw, v1.xxyz, r0.w, r1
    mad r1.yzw, r2.w, v4.xxyz, r1
    add r1.yzw, r1, c0.y
    dp3 r0.w, r1.yzww, r1.yzww
    rsq r0.w, r0.w
    mul r3.xyz, r1.yzww, r0.w
    add r4.xyz, c0.y, v2
    nrm r5.xyz, r4
    dp3 r2.x, -r5, r3
    add r2.x, r2.x, r2.x
    mad r3.xyz, r3, -r2.x, -r5
    add r3.xyz, r3, c0.y
    dp3 r2.x, r3, r3
    rsq r2.x, r2.x
    mad r2.xw, r3.xyzz, r2.x, c1.w
    mul r2.xw, r2, c0.x
    texld r3, r2.xwzw, s2
    mad oC0.xyz, r3, c72.x, r0
    mad r0.xyz, r1.yzww, r0.w, c1.w
    mul oC1.xyz, r0, c0.z
    mov oC0.w, r1.x
    mov oC1.w, r1.x
    mad oC2.xyz, v5.x, c2.xxyw, c2.xzxw
    mov oC2.w, r1.x
    mul oC3, -r2.yzzz, c52.x
    
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

// approximately 45 instruction slots used (3 texture, 42 arithmetic)
