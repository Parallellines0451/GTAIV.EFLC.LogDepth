//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BaseSampler;
//   float4 TexelSize;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   TexelSize    c64      1
//   BaseSampler  s0       1
//

    ps_3_0
    def c0, -0.5, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    mov r0.x, c64.x
    mad r0.xy, r0.x, c0.x, v0
    texld oC0, r0, s0

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
