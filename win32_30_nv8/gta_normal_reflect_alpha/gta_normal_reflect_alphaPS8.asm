//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 globalFogColor;
//   float4 globalFogParams;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   gDirectionalLight  c17      1
//   gDirectionalColour c18      1
//   gLightAmbient0     c37      1
//   gLightAmbient1     c38      1
//   globalScalars      c39      1
//   globalFogParams    c41      1
//   globalFogColor     c42      1
//   TextureSampler     s0       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 4.4841550858e-43 // 320
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.5, 0.5, 1.33333337, 0
    def c2, 3.99600005, 4, 0.125, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_color v2.xw
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c2.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c2.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c2.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c2.w
    mad r0.xy, r1, c2.w, r0
    mov r0.zw, c0.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c0.y, c0.z
    texkill r0
    texld r0, v0, s0
    add r1.xyz, c0.w, v1
    nrm r2.xyz, r1
    mul r0.w, r0.w, v2.w
    mad_sat r1.x, r2.z, c1.x, c1.y
    mov r3.xyz, c38
    mad r1.xyz, r3, r1.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    add r1.w, r1.w, -c2.w
    mul_sat r1.w, r1.w, c1.z
    mul r2.xyz, r3, r1.w
    mad r1.xyz, r1, v2.x, r2
    mov r1.w, -c0.y
    mul r2, r0, r1
    mul oC0.w, r2.w, c39.x
    add r0.w, -c41.x, v1.w
    add r1.w, -c41.x, c41.y
    rcp r1.w, r1.w
    mul_sat r0.w, r0.w, r1.w
    mad r0.xyz, r0, -r1, c42
    mad oC0.xyz, r0.w, r0, r2
    
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

// approximately 40 instruction slots used (3 texture, 37 arithmetic)
