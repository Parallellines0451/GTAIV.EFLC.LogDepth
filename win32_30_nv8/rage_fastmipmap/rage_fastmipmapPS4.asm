//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DepthTextureSampler0;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   DepthTextureSampler0 s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.1126309807e-42 // 794
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, -0.5, 0.5, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s15
    add r0.xy, c0, v0
    texld r0, r0, s15
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r0.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r0.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r0, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.zw, c0.y, v0.xyxy
    texld r1, r0.zwzw, s15
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r1.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r1.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r1, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mov r0.y, r1.x
    add r0.zw, c0.x, v0.xyxy
    texld r1, r0.zwzw, s15
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r1.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r1.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r1, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.zw, c0.xyyx, v0.xyxy
    texld r2, r0.zwzw, s15
    // ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
    if_ne r2.x, c127.y
      rcp r20.x, c128.x
      mul r20.x, r20.x, c128.y
      pow r20.x, r20.x, r2.x
      mul r20.x, r20.x, c128.x // W_clip
      
      add r20.y, r20.x, -c128.x
      add r20.z, c128.y, -c128.x
      mul r20.y, r20.y, c128.y
      mul r20.z, r20.z, r20.x
      rcp r20.z, r20.z
      mul r20.w, r20.y, r20.z // Linear depth
      
      min r2, r20.w, c127.x // FP error hack
    endif
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    mov r1.y, r2.x
    max r2.xy, r1, r0
    max oC0, r2.x, r2.y

// approximately 12 instruction slots used (4 texture, 8 arithmetic)
