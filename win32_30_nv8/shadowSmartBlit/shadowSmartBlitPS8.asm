//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D SmartBlitSampler;
//   float4 clearcol;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   clearcol         c66      1
//   SmartBlitSampler s0       1
//

    ps_3_0
    def c0, 0.5, -0.5, 0, 1
    dcl_texcoord v0.xy
    dcl_2d s0
    mov r0.xy, c0
    mad r0.zw, c66.xyxy, r0.x, v0.xyxy
    mad r1.xy, c66, r0.y, r0.zwzw
    texld r1, r1, s0
    mad r1.zw, c66.xyxy, r0.xyxy, r0
    texld r2, r1.zwzw, s0
    min r3.x, r2.x, r1.x
    max r3.y, r1.y, r2.y
    mad r1.xy, c66, r0.yxzw, r0.zwzw
    mad r0.xy, c66, r0.x, r0.zwzw
    texld r0, r0, s0
    texld r1, r1, s0
    min r0.z, r1.x, r3.x
    max r0.w, r3.y, r1.y
    max oC0.y, r0.w, r0.y
    min oC0.x, r0.x, r0.z
    mov oC0.zw, c0

// approximately 17 instruction slots used (4 texture, 13 arithmetic)
