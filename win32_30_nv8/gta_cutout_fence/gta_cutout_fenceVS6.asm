//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4x3 gBoneMtx[48];
//   float4 gDayNightEffects;
//   row_major float4x4 gWorldViewProj;
//   float3 globalAnimUV0;
//   float3 globalAnimUV1;
//   float4 globalScalars;
//   float4 globalScalars2;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   gWorldViewProj   c8       4
//   globalScalars    c39      1
//   globalScalars2   c40      1
//   gDayNightEffects c45      1
//   gBoneMtx         c64    144
//   globalAnimUV0    c208     1
//   globalAnimUV1    c209     1
//

    vs_3_0
    def c0, 765.005859, 1, 0, -1
    dcl_position v0
    dcl_blendweight v1
    dcl_blendindices v2
    dcl_texcoord v3
    dcl_normal v4
    dcl_color v5
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_color o3
    dcl_texcoord6 o4
    mul r0, c0.x, v2
    mova a0, r0
    mul r0, v1.y, c64[a0.y]
    mad r0, c64[a0.x], v1.x, r0
    mad r0, c64[a0.z], v1.z, r0
    mad r0, c64[a0.w], v1.w, r0
    dp3 o2.x, v4, r0
    mul r1, v1.y, c65[a0.y]
    mad r1, c65[a0.x], v1.x, r1
    mad r1, c65[a0.z], v1.z, r1
    mad r1, c65[a0.w], v1.w, r1
    dp3 o2.y, v4, r1
    mul r2, v1.y, c66[a0.y]
    mad r2, c66[a0.x], v1.x, r2
    mad r2, c66[a0.z], v1.z, r2
    mad r2, c66[a0.w], v1.w, r2
    dp3 o2.z, v4, r2
    mad r3.xyz, v3.xyxw, c0.yyzw, c0.zzyw
    dp3 o1.x, c208, r3
    dp3 o1.y, c209, r3
    mul r3.xy, c45, v5
    add r3.x, r3.y, r3.x
    mov r3.yw, c0
    mad r3.x, r3.x, c39.z, r3.w
    mad o3.xy, c40.z, r3.x, r3.y
    mad r3, v0.xyzx, c0.yyyz, c0.zzzy
    dp4 r1.y, r3, r1
    mul r4, r1.y, c9
    dp4 r1.x, r3, r0
    dp4 r1.z, r3, r2
    mad r0, r1.x, c8, r4
    mov o4.xyz, r1
    mad r0, r1.z, c10, r0
    add r0, r0, c11
    mov o0, r0
    mov o10, r0
    mov o2.w, r0.w
    mov o3.zw, v5
    mov o4.w, c0.y

// approximately 38 instruction slots used