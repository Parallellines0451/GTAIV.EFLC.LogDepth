//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.2191296640e-43 // 87
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 0, 0, 0, 0
    dcl_texcoord9 v9
    mov oC0, c0.x
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

// approximately 1 instruction slot used
