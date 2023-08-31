//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   row_major float4x4 gWorldViewProj;
//   row_major float4x4 matWheelTransform;
//   float4 tyreDeformParams;
//   float4 tyreDeformParams2;
//   bool tyreDeformSwitchOn;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   tyreDeformSwitchOn b9       1
//   gWorldViewProj     c8       4
//   matWheelTransform  c64      4
//   tyreDeformParams   c68      1
//   tyreDeformParams2  c69      1
//

    vs_3_0
    def c0, 9.99999975e-006, 1.10000002, 0.0299999993, 0
    def c1, 1, 0, 0, 0
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_normal v3
    dcl_tangent v4
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord4 o3.xyz
    dcl_texcoord5 o4.xyz
    dcl_color o5
    dcl_texcoord6 o6
    mul r0.xyz, c65, v0.y
    mad r0.xyz, v0.x, c64, r0
    mad r0.xyz, v0.z, c66, r0
    add r0.xyz, r0, c67
    mul r1.xyz, c65, v3.y
    mad r1.xyz, v3.x, c64, r1
    mad r1.xyz, v3.z, c66, r1
    add r1.xyz, r1, c0.x
    nrm r2.xyz, r1
    mul r1.xyz, c65, v4.y
    mad r1.xyz, v4.x, c64, r1
    mad r1.xyz, v4.z, c66, r1
    add r1.xyz, r1, c0.x
    nrm r3.xyz, r1
    mul r1.xyz, r2.yzxw, r3.zxyw
    mad r1.xyz, r3.yzxw, r2.zxyw, -r1
    mul o4.xyz, r1, v4.w
    if b9
      mul r1.xy, v0.yzzw, v0.yzzw
      add r0.w, r1.y, r1.x
      mul r1.x, c69.x, c69.x
      slt r1.x, r1.x, r0.w
      mul r1.yzw, c69.w, v0.xxyz
      mul r0.w, r0.w, c69.w
      mov r4.xyz, c69
      mul r2.w, r4.x, c0.y
      mul r2.w, r2.w, r2.w
      slt r0.w, r2.w, r0.w
      add r2.w, r4.y, c0.z
      slt r3.w, r0.z, r2.w
      add r4.x, -r0.z, c69.y
      slt r4.y, r4.x, c0.w
      mad r4.x, r4.y, -r4.x, r4.x
      add r2.w, -r0.z, r2.w
      mul r4.y, r2.w, c69.z
      slt r4.w, c1.x, r4.y
      mad r2.w, r2.w, -r4.z, c1.x
      mad r2.w, r4.w, r2.w, r4.y
      mad r4.yz, c68, r4.x, r1.xzww
      mad r4.w, c68.w, -r2.w, r1.y
      mul r5.x, c68.x, v0.x
      mad r4.x, r5.x, r2.w, r4.w
      mad r4.xyz, v0, -c69.w, r4
      mul r4.xyz, r3.w, r4
      mad r1.yzw, r0.w, r4.xxyz, r1
      lrp r4.xyz, r1.x, r1.yzww, v0
    else
      mov r4.xyz, v0
    endif
    mul r1.xyz, r4.y, c65
    mad r1.xyz, r4.x, c64, r1
    mad r1.xyz, r4.z, c66, r1
    add r1.xyz, r1, c67
    mul r4, r1.y, c9
    mad r4, r1.x, c8, r4
    mad r1, r1.z, c10, r4
    add r1, r1, c11
    mov o0, r1
    mov o10, r1
    mov o1.xy, v2
    mov o2.w, r1.w
    mov o2.xyz, r2
    mov o3.xyz, r3
    mad o5, v1.xyzx, c1.xxxy, c1.yyyx
    mov o6.xyz, r0
    mov o6.w, c1.x

// approximately 71 instruction slots used
