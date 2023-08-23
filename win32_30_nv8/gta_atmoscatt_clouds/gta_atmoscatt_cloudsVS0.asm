//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float3 AzimuthColor;
//   float3 AzimuthColorEast;
//   float AzimuthHeight;
//   float AzimuthStrength;
//   float CloudShadowOffset;
//   float4 CloudThicknessEdgeSmoothDetailScaleStrength;
//   float2 DetailOffset;
//   float2 GalaxyOffset;
//   float3 SkyColor;
//   float StarFieldUVRepeat;
//   float4 SunDirection;
//   float4 TopCloudBiasDetailThresholdHeight;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name                                        Reg   Size
//   ------------------------------------------- ----- ----
//   gWorld                                      c0       4
//   gWorldViewProj                              c8       4
//   SunDirection                                c64      1
//   SkyColor                                    c65      1
//   AzimuthColor                                c66      1
//   AzimuthColorEast                            c67      1
//   AzimuthHeight                               c68      1
//   TopCloudBiasDetailThresholdHeight           c69      1
//   CloudShadowOffset                           c70      1
//   AzimuthStrength                             c71      1
//   CloudThicknessEdgeSmoothDetailScaleStrength c72      1
//   StarFieldUVRepeat                           c73      1
//   GalaxyOffset                                c74      1
//   DetailOffset                                c75      1
//

    vs_3_0
    def c4, 9.99999975e-006, 1.5, 0.500010014, 1
    def c5, -0.0187292993, 0.0742610022, -0.212114394, 1.57072878
    def c6, -2, 3.14159274, 1.57079637, 0.317732662
    def c7, 0.5, 0.100000001, 2, -1
    def c12, -0.5, -0.499989986, 0, 0
    dcl_position v0
    dcl_texcoord v1
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xyz
    dcl_texcoord1 o2.xyz
    dcl_texcoord2 o3
    dcl_texcoord3 o4
    dcl_texcoord4 o5.xyz
    dcl_texcoord5 o6.xyz
    mov_sat r0.x, -v0.y
    add r0.x, -r0.x, v0.y
    mul r0.yzw, r0.x, c1.xxyz
    mul r1, r0.x, c9
    mad r1, v0.x, c8, r1
    mad r1, v0.z, c10, r1
    mad r1, v0.w, c11, r1
    mad r0.xyz, v0.x, c0, r0.yzww
    mad r0.xyz, v0.z, c2, r0
    mad r0.xyz, v0.w, c3, r0
    add r0.xyz, r0, -c3
    add r2.xyz, r0, c4.x
    mov o2.xyz, r0
    dp3 r0.x, r2, r2
    rsq r0.x, r0.x
    mul r3.xyz, r2, r0.x
    mad r0.xy, r2.xzzw, -r0.x, c64.xzzw
    mul r3.w, r3.y, c4.y
    add r2.xyz, r3.xwzw, c4.xzxw
    dp3 r0.z, r2, r2
    rsq r0.z, r0.z
    mul r0.zw, r2.xyxz, r0.z
    mad r2.xy, r0_abs.zwzw, c5.x, c5.y
    mad r2.xy, r2, r0_abs.zwzw, c5.z
    mad r2.xy, r2, r0_abs.zwzw, c5.w
    add r2.zw, -r0_abs, c4.w
    slt r0.zw, r0, -r0
    rsq r2.z, r2.z
    rsq r2.w, r2.w
    rcp r2.w, r2.w
    mul r2.y, r2.y, r2.w
    rcp r2.z, r2.z
    mul r2.x, r2.x, r2.z
    mad r2.z, r2.x, c6.x, c6.y
    mad r0.z, r2.z, r0.z, r2.x
    add r0.z, -r0.z, c6.z
    mov r2.w, c6.w
    mad r3.z, r0.z, r2.w, c74.x
    mad r0.z, r2.y, c6.x, c6.y
    mad r0.z, r0.z, r0.w, r2.y
    add r0.z, -r0.z, c6.z
    mad r3.w, r0.z, r2.w, c74.y
    add r0.zw, r3, c7.x
    mul o4.xy, r0.zwzw, c73.x
    mov o4.zw, r0
    mov r2.xy, c7
    mul r0.z, r2.y, c70.x
    mul r0.xy, r0, r0.z
    mad r0.zw, v1.xyxy, c7.z, c7.w
    mul r0.zw, r0, r0
    add r0.z, r0.w, r0.z
    add r0.z, -r0.z, c4.w
    mad o3.xy, r0, r0.z, v1
    add r0, c12.xxyy, v1.xyxy
    mul r4, r0, r0
    add r2.yz, r4.xyww, r4.xxzw
    rsq r2.z, r2.z
    mul r0.zw, r0, r2.z
    mul r0.zw, r2.y, r0
    mov r2.z, c72.z
    mad o3.zw, r0, r2.z, c75.xyxy
    mul r0.zw, r0.xyxy, c69.w
    mad o5.xy, r0, c69.w, r2.x
    mul r0.xy, r0.zwzw, r0.zwzw
    add r0.x, r0.y, r0.x
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    add o5.z, -r0.x, c4.w
    rcp r0.x, r1.w
    mad o1.z, r1.z, -r0.x, c4.w
    mov o0, r1
    mov o10, r1
    mul_sat r0.x, r3.y, c68.x
    mad r0.y, r3.x, c7.x, c7.x
    add r0.x, -r0.x, c4.w
    mul r0.x, r0.x, c71.x
    mov r1.xyz, c67
    add r1.xyz, -r1, c66
    mad r0.yzw, r0.y, r1.xxyz, c67.xxyz
    mad o6.xyz, r0.yzww, r0.x, c65
    mov o1.xy, v1

// approximately 80 instruction slots used