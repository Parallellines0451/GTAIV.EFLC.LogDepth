//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureSampler_layer0;
//   sampler2D TextureSampler_layer1;
//   float4 globalScalars;
//   float4 stencil;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   globalScalars         c39      1
//   stencil               c52      1
//   TextureSampler_layer0 s0       1
//   TextureSampler_layer1 s1       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 8.4218037706e-43 // 601
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 0.5, 0, 1, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord3 v1.xy
    dcl_color v2
    dcl_color1 v3.y
    dcl_texcoord2 v4.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    texld r0, v0, s0
    texld r1, v1, s1
    mul r0.w, r1.w, v3.y
    lrp r2.xyz, r0.w, r1, r0
    mul oC0.xyz, r2, v2
    mov oC0.w, c39.x
    mad oC1.xyz, v4, c0.x, c0.x
    mov oC1.w, c39.x
    mad oC2.xyz, v2.w, c0.yyzw, c0.ywyw
    mov oC2.w, c39.x
    mov r0.yz, c0
    mul oC3, r0.zyyy, c52.x
    
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

// approximately 12 instruction slots used (2 texture, 10 arithmetic)
