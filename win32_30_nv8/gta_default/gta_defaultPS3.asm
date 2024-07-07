//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureSampler;
//   float4 globalScalars;
//   float4 stencil;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   globalScalars  c39      1
//   stencil        c52      1
//   TextureSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.1019476965e-43 // 150
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 0.176470593, -1, -0, 9.99999975e-006
    def c1, 0.5, 0, 1, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_color v2.xw
    dcl_texcoord9 v9
    dcl_2d s0
    texld r0, v0, s0
    mul r0.w, r0.w, v2.w
    mul r1.x, r0.w, c39.x
    mov r2.xyz, c0
    mad r0.w, r0.w, -c39.x, r2.x
    cmp r3, r0.w, c0.y, c0.z
    texkill r3
    add r1.yzw, c0.w, v1.xxyz
    dp3 r0.w, r1.yzww, r1.yzww
    rsq r0.w, r0.w
    mad r1.yzw, r1, r0.w, -c0.y
    mul oC1.xyz, r1.yzww, c1.x
    mov oC0.xyz, r0
    mov oC0.w, r1.x
    mov oC1.w, r1.x
    mad oC2.xyz, v2.x, c1.yyzw, c1.ywyw
    mov oC2.w, r1.x
    mul oC3, -r2.yzzz, c52.x
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

// approximately 18 instruction slots used (1 texture, 17 arithmetic)
