//
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   TextureSampler s0       1
//   StippleTexture s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.5899595863e-43 // 613
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 0.125, 0.25, 0, 0
    def c1, 1, 0, 3.99600005, 4
    dcl_texcoord v0.xy
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    mul r0, c1.xxyy, v0.xyxx
    texldl r0, r0, s0
    mov_sat r1.x, r0.w
    mul r1.x, r1.x, c1.z
    frc r1.y, r1.x
    mul r1.z, r1.y, c1.w
    frc r1.w, r1.z
    add r2.xy, r1.zxzw, -r1.wyzw
    mul r1.xy, c0.x, vPos
    frc r1.xy, r1_abs
    cmp r1.xy, vPos, r1, -r1
    mul r1.xy, r1, c0.y
    mad r1.xy, r2, c0.y, r1
    texld r1, r1, s10
    cmp r1, -r1.y, -c1.x, -c1.y
    texkill r1
    mov oC0, r0
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

// approximately 18 instruction slots used (3 texture, 15 arithmetic)
