//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D StippleTexture;
//   sampler2D TextureGrassSampler;
//   float4 stencil;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   NearFarPlane        c128     1
//   stencil             c52      1
//   TextureGrassSampler s0       1
//   StippleTexture      s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.7835058537e-43 // 270
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, 3.99600005, 4, 0.125, 0.25
    def c2, 0.5, 0, 1, 0.25
    dcl_color v0.w
    dcl_texcoord v1
    dcl_texcoord1 v2.w
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    mov r0.x, v1.w
    mov r0.y, v2.w
    texld r0, r0, s0
    mul r0.w, r0.w, v0.w
    mov_sat r1.x, r0.w
    mul r1.x, r1.x, c1.x
    frc r1.y, r1.x
    mul r1.z, r1.y, c1.y
    frc r1.w, r1.z
    add r2.xy, r1.zxzw, -r1.wyzw
    mul r1.xy, c1.z, vPos
    frc r1.xy, r1_abs
    cmp r1.xy, vPos, r1, -r1
    mul r1.xy, r1, c1.w
    mad r1.xy, r2, c1.w, r1
    mov r1.zw, c0.x
    texldl r1, r1, s10
    cmp r1, -r1.y, c0.y, c0.z
    texkill r1
    add r1.xyz, c0.w, v1
    dp3 r1.w, r1, r1
    rsq r1.w, r1.w
    mad r1.xyz, r1, r1.w, -c0.y
    mul oC1.xyz, r1, c2.x
    mov oC0, r0
    mov oC1.w, r0.w
    mad oC2, r0.w, c2.yyyz, c2.ywzy
    mov r0.yz, c0
    mul oC3, -r0.yzzz, c52.x
    
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

// approximately 30 instruction slots used (3 texture, 27 arithmetic)
