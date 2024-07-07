//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 gColorTint;
//   float4 gColorTintPhase2;
//   float gMotionBlur;
//   float4 gRadius;
//   float4 gTextureAnimation;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   gWorldViewProj    c8       4
//   gViewInverse      c12      4
//   gMotionBlur       c64      1
//   gRadius           c65      1
//   gTextureAnimation c66      1
//   gColorTint        c67      1
//   gColorTintPhase2  c68      1
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.8376293903e-42 // 2025
    def c0, 100, 32, 64, -32
    def c1, 0.03125, -0.5, 0.699999988, -10
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2
    dcl_position o0
    dcl_texcoord9 o10
    dcl_color o1
    dcl_texcoord o2.xy
    dcl_texcoord1 o3.xyz
    mul r0.x, c0.x, v0.x
    frc r0.y, r0.x
    add r0.z, r0.x, -r0.y
    slt r0.x, r0.x, -r0.x
    slt r0.y, -r0.y, r0.y
    mad r0.x, r0.x, r0.y, r0.z
    mul r0.y, r0.x, c0.y
    sge r0.y, r0.y, -r0.y
    mad r0.y, r0.y, c0.z, c0.w
    rcp r0.z, r0.y
    mul r0.x, r0.z, r0.x
    frc r0.x, r0.x
    mul r0.x, r0.x, r0.y
    frc r0.y, r0.x
    add r0.z, r0.x, -r0.y
    slt r0.x, r0.x, -r0.x
    slt r0.y, -r0.y, r0.y
    mad r0.x, r0.x, r0.y, r0.z
    mul r0.x, r0.x, c1.x
    if_ge -v1_abs.w, v1_abs.w
      mad r0.y, c65.y, r0.x, c65.x
      add r0.z, c1.y, v2.x
      nrm r1.xyz, v1
      add r2.xyz, c15.yzxw, -v0.yzxw
      dp3 r0.w, r2, r2
      rsq r0.w, r0.w
      mul r2.xyz, r0.w, r2
      mul r3.xyz, r1.zxyw, r2
      mad r2.xyz, r1.yzxw, r2.yzxw, -r3
      nrm r3.xyz, r2
      mul r2.xyz, c64.x, v1
      mad r1.xyz, r0.y, r1, r2
      mul r2.xyz, r0.y, r3
      add r0.y, c1.z, -v2.y
      mul r1.xyz, -r1, r0.y
      mad r0.yzw, r0.z, r2.xxyz, r1.xxyz
      add r0.yzw, r0, v0.xxyz
      mul r1, r0.z, c9
      mad r1, r0.y, c8, r1
      mad r1, r0.w, c10, r1
      add o0, r1, c11
      add o10.zw, r1, c11
      mov o1, c67
      mov o3.xyz, r0.yzww
      mov r1.x, v2.x
    else
      mad r0.x, c65.w, r0.x, c65.z
      add r0.yz, c1.y, v2.xxyw
      nrm r2.xyz, c12
      mul r2.xyz, r0.x, r2
      nrm r3.xyz, -c13
      mul r3.xyz, r0.x, r3
      mul r0.xzw, r0.z, r3.xyyz
      mad r0.xyz, r0.y, r2, r0.xzww
      add r0.xyz, r0, v0
      mul r2, r0.y, c9
      mad r2, r0.x, c8, r2
      mad r2, r0.z, c10, r2
      add o0, r2, c11
      add o10.zw, r2, c11
      mad r0.w, v0.w, c66.x, -c66.y
      frc r1.z, r0.w
      add r1.w, r0.w, -r1.z
      slt r0.w, r0.w, -r0.w
      slt r1.z, -r1.z, r1.z
      mad r0.w, r0.w, r1.z, r1.w
      mul_sat r0.w, r0.w, c66.z
      mad r0.w, c66.z, v2.x, r0.w
      add r1.x, r0.w, c1.w
      mov o1, c68
      mov o3.xyz, r0
    endif
    mov r1.y, v2.y
    mov o2.xy, r1
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 82 instruction slots used
