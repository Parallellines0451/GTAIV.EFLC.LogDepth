//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   gWorldViewProj c8       4
//

    vs_3_0
    dcl_position v0
    dcl_texcoord v1
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    mul r0, c9, v0.y
    mad r0, v0.x, c8, r0
    mad r0, v0.z, c10, r0
    add o0, r0, c11
    add o10, r0, c11
    mov o1.xy, v1

// approximately 5 instruction slots used
