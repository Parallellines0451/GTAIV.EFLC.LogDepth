//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D TextureSampler;
//   float4 colorize;
//   float4 globalScalars;
//   float4 stencil;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   NearFarPlane   c128     1
//   globalScalars  c39      1
//   colorize       c51      1
//   stencil        c52      1
//   TextureSampler s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.7045060361e-43 // 193
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 0.176470593, -1, -0, 9.99999975e-006
    def c1, 0.5, 0, 1, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xyz
    dcl_color v2.w
    dcl_texcoord9 v9
    dcl_2d s0
    texld r0, v0, s0
    mul r0, r0, c51
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
    mov r0.yzw, c1
    mad oC2.xyz, c39.z, r0.yyzw, r0.ywyw
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

// approximately 20 instruction slots used (1 texture, 19 arithmetic)
