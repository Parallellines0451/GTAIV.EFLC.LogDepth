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
    dcl_position o0
    dcl_texcoord9 o10
    mul r0, c9.xyww, v0.y
    mad r0, v0.x, c8.xyww, r0
    mad r0, v0.z, c10.xyww, r0
    mad o0, v0.w, c11.xyww, r0
	mad o10, v0.w, c11.xyww, r0

// approximately 4 instruction slots used