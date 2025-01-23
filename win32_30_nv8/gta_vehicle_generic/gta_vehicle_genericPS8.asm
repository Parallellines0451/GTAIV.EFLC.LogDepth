//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureSampler;
//   float4 globalScalars;
//   float3 matDiffuseColor;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   globalScalars   c39      1
//   matDiffuseColor c66      1
//   TextureSampler  s0       1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.1364659874e-43 // 652
    def c127, 1, 1, 0, 0 // LogDepth constants
    dcl_texcoord v0.xy
    dcl_color v1
    dcl_texcoord9 v9
    dcl_2d s0
    texld r0, v0, s0
    mul r1.xyz, r0, c66
    mul r1.w, r0.w, c39.x
    mul oC0, r1, v1
    
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

// approximately 4 instruction slots used (1 texture, 3 arithmetic)
