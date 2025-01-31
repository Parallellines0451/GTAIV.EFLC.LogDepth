//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D EnvironmentSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 gLightColB;
//   float4 gLightColG;
//   float4 gLightColR;
//   float4 gLightConeOffset;
//   float4 gLightConeScale;
//   float4 gLightDirX;
//   float4 gLightDirY;
//   float4 gLightDirZ;
//   float4 gLightFallOff;
//   float4 gLightPosX;
//   float4 gLightPosY;
//   float4 gLightPosZ;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam18192021;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDir;
//   row_major float4x4 gViewInverse;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScalars;
//   float reflectivePower;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   NearFarPlane         c128     1
//   gViewInverse         c12      4
//   gDepthFxParams       c16      1
//   gDirectionalLight    c17      1
//   gDirectionalColour   c18      1
//   gLightPosX           c19      1
//   gLightPosY           c20      1
//   gLightPosZ           c21      1
//   gLightDirX           c22      1
//   gLightDirY           c23      1
//   gLightDirZ           c24      1
//   gLightFallOff        c25      1
//   gLightConeScale      c26      1
//   gLightConeOffset     c27      1
//   gLightColR           c29      1
//   gLightColG           c30      1
//   gLightColB           c31      1
//   gLightAmbient0       c37      1
//   gLightAmbient1       c38      1
//   globalScalars        c39      1
//   globalFogParams      c41      1
//   globalFogColor       c42      1
//   globalFogColorN      c43      1
//   gShadowParam18192021 c53      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   reflectivePower      c66      1
//   TextureSampler       s0       1
//   EnvironmentSampler   s1       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 7.4829337995e-43 // 534
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.5, -0.00999999978, 100, 0.5
    def c2, 1.33333337, 1.5, -0.326211989, -0.405809999
    def c3, -0.791558981, -0.597710013, 0.0833333358, -0.100000001
    def c4, 3.99600005, 4, 0.125, 0.25
    def c5, 1.11111116, 0.212500006, 0.715399981, 0.0720999986
    def c6, 1.00000001e-007, 0, 0, 0
    def c7, 1, -1, 0, -0
    def c8, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c9, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c10, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c11, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c12, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3.xw
    dcl_texcoord6 v4.xyz
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s10
    dcl_2d s15
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c4.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c4.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c4.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c4.w
    mad r0.xy, r1, c4.w, r0
    mov r0.zw, c0.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c0.y, c0.z
    texkill r0
    texld r0, v0, s0
    add r1.xyz, c0.w, v1
    nrm r2.xyz, r1
    add r1.xyz, c0.w, v2
    nrm r3.xyz, r1
    dp3 r1.x, -r3, r2
    add r1.x, r1.x, r1.x
    mad r1.xyz, r2, -r1.x, -r3
    add r1.xyz, r1, c0.w
    dp3 r1.y, r1, r1
    rsq r1.y, r1.y
    mad r1.xy, r1.xzzw, r1.y, -c0.y
    mul r1.xy, r1, c1.x
    texld r1, r1, s1
    mul r1.xyz, r1, c66.x
    mul r3.w, r0.w, v3.w
    mad r0.w, r0.w, v3.w, c1.y
    rcp r1.w, r3.w
    cmp r0.w, r0.w, r1.w, c1.z
    mad r3.xyz, r1, r0.w, r0
    mad_sat r0.x, r2.z, c1.x, c1.w
    mov r1.xyz, c38
    mad r0.xyz, r1, r0.x, c37
    mul r1.xyz, c18.w, c18
    dp3 r0.w, r2, -c17
    add r0.w, r0.w, -c4.w
    mul_sat r0.w, r0.w, c2.x
    mul r4.xyz, c61.xyww, v4.y
    mad r4.xyz, v4.x, c60.xyww, r4
    mad r4.xyz, v4.z, c62.xyww, r4
    add r4.xyz, r4, c63.xyww
    dp3 r1.w, c14, v4
    add r5.xyz, -r1.w, -c54
    cmp r5.yzw, r5.xxyz, -c0.y, -c0.z
    mov r5.x, -c0.y
    dp4 r6.x, r5, c57
    dp4 r6.y, r5, c58
    dp4 r7.x, r5, c59
    dp4 r7.y, r5, c56
    mad r4.xy, r4, r6, r7
    add r5.xyz, c15, -v4
    dp3 r1.w, r5, r5
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r2.w, c53.w
    mul r2.w, r1.w, r2.w
    mul r2.w, r2.w, r2.w
    mul r2.w, r2.w, c2.y
    mov r5.y, c53.y
    mad r5.xz, r5.y, c2.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r4.w, r4.z, -r6.x
    cmp r4.w, r4.w, -c0.y, -c0.z
    mad r5.xz, r5.y, c12.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c12.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c11.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c11.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c10.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c10.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c9.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c9.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c8.xyyw, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r5.xz, r5.y, c8.zyww, r4.xyyw
    texld r6, r5.xzzw, s15
    add r5.x, r4.z, -r6.x
    cmp r5.x, r5.x, -c0.y, -c0.z
    add r4.w, r4.w, r5.x
    mad r4.xy, r5.y, c3, r4
    texld r5, r4, s15
    add r4.x, r4.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r4.x, r4.w, r4.x
    mad r2.w, r4.x, c3.z, r2.w
    add r1.w, r1.w, -c53.w
    cmp r4.xy, r1.w, c7, c7.zwzw
    add r1.w, r2.w, r4.y
    cmp_sat r1.w, r1.w, r2.w, r4.x
    mul r1.xyz, r1, r0.w
    mul r1.xyz, r1.w, r1
    mad r0.xyz, r0, v3.x, r1
    add r1, c19, -v4.x
    add r4, c20, -v4.y
    add r5, c21, -v4.z
    mul r6, r1, r1
    mad r6, r4, r4, r6
    mad r6, r5, r5, r6
    add r7, r6, c0.w
    rsq r8.x, r7.x
    rsq r8.y, r7.y
    rsq r8.z, r7.z
    rsq r8.w, r7.w
    mov r7.y, c0.y
    mad r6, r6, -c25, -r7.y
    max r9, r6, c0.x
    mul r6, r9, r9
    mad r6, r6, r6, c3.w
    mul r9, r6, c5.x
    cmp r6, r6, r9, c0.x
    mul r9, r2.x, r1
    mad r9, r4, r2.y, r9
    mad r2, r5, r2.z, r9
    mul r2, r6, r2
    mul_sat r2, r8, r2
    mul r1, r1, -c22
    mad r1, r4, -c23, r1
    mad r1, r5, -c24, r1
    mul r1, r8, r1
    mov r4, c26
    mad_sat r1, r1, r4, c27
    mul r1, r2, r1
    dp4 r2.x, c29, r1
    dp4 r2.y, c30, r1
    dp4 r2.z, c31, r1
    add r0.xyz, r0, r2
    mov r0.w, -c0.y
    mul r1, r3, r0
    mul oC0.w, r1.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.w, -c16.z, c16.w
    rcp r1.w, r1.w
    mul_sat r0.w, r0.w, r1.w
    add r0.w, -r0.w, -c0.y
    add r2.xy, r7.y, c16
    mul r1.w, r0.w, r2.y
    mad r0.w, r0.w, r2.x, -c0.y
    dp3 r1.x, r1, c5.yzww
    mad r0.xyz, r3, r0, -r1.x
    mad r0.xyz, r0.w, r0, r1.x
    add r0.w, r1.x, c6.x
    pow r2.x, r0_abs.w, r1.w
    mul r1.xyz, r0, r2.x
    rcp r0.w, c41.x
    mul_sat r0.w, r0.w, v1.w
    add r1.w, -c41.x, v1.w
    add r2.y, -c41.x, c41.y
    rcp r2.y, r2.y
    mul_sat r1.w, r1.w, r2.y
    lrp r2.y, c41.w, r0.w, r1.w
    add r0.w, r2.y, c41.z
    mov r3.xyz, c43
    add r2.yzw, -r3.xxyz, c42.xxyz
    mad r2.yzw, r1.w, r2, c43.xxyz
    mad r0.xyz, r0, -r2.x, r2.yzww
    mad oC0.xyz, r0.w, r0, r1
    
    // LogDepth Write
    if_ne v9.y, c127.x
      rcp r20.x, c128.x
      mul r20.y, r20.x, v9.w
      mul r20.x, r20.x, c128.y
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.x, r20.x
      mul r20.x, r20.x, r20.y
    else
      rcp r20.x, v9.w
      mul r20.x, r20.x, v9.z
    endif
    mov oDepth, r20.x

// approximately 202 instruction slots used (16 texture, 186 arithmetic)
