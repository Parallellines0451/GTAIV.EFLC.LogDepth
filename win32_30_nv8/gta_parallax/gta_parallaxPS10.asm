//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float bumpiness;
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
//   float parallaxScaleBias;
//   float specularColorFactor;
//   float specularFactor;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
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
//   parallaxScaleBias    c66      1
//   specularFactor       c72      1
//   specularColorFactor  c73      1
//   bumpiness            c74      1
//   TextureSampler       s0       1
//   BumpSampler          s1       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.5, -0.5, -0.00200000009, 1.33333337
    def c1, 9.99999975e-005, 1.5, -0.326211989, -0.405809999
    def c2, -0.791558981, -0.597710013, 0.0833333358, -0.100000001
    def c3, 0, -1, -0, 9.99999975e-006
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
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5.xw
    dcl_texcoord6 v6.xyz
    dcl_texcoord7 v7.xyz
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
    mov r0.zw, c3.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c3.y, c3.z
    texkill r0
    texld r0, v0, s1
    add r0.xyz, c3.w, v7
    dp3 r0.z, r0, r0
    rsq r0.z, r0.z
    mul r0.xy, r0, r0.z
    mov r1.x, c0.x
    mul r0.z, r1.x, c66.x
    mad r0.z, r0.w, c66.x, -r0.z
    mad r0.xy, r0.z, r0, v0
    texld r1, r0, s1
    texld r0, r0, s0
    add r1.zw, r1.xyxy, c0.y
    mul r1.zw, r1, c74.x
    dp2add r2.x, r1, -r1, -c3.y
    rsq r2.x, r2.x
    rcp r2.x, r2.x
    mul r2.yzw, r1.z, v3.xxyz
    mad r2.xyz, v1, r2.x, r2.yzww
    mad r2.xyz, r1.w, v4, r2
    add r2.xyz, r2, c3.w
    nrm r3.xyz, r2
    dp2add r1.x, r1, r1, c0.z
    cmp r1.x, r1.x, -c3.y, -c3.z
    mul r2.xyz, r0, r1.x
    mul r0.x, r1.x, v5.x
    mul r0.y, r1.x, c73.x
    mul r2.w, r0.w, v5.w
    add r1.xyz, c3.w, v2
    nrm r4.xyz, r1
    mad_sat r0.z, r3.z, c0.y, c0.x
    mov r1.xyz, c38
    mad r1.xyz, r1, r0.z, c37
    dp3 r0.z, -r4, r3
    add r0.z, r0.z, r0.z
    mad r4.xyz, r3, -r0.z, -r4
    mul r5.xyz, c18.w, c18
    dp3 r0.z, r3, -c17
    add r0.z, r0.z, -c4.w
    mul_sat r0.z, r0.z, c0.w
    dp3_sat r0.w, -c17, r4
    add r0.w, r0.w, c1.x
    mov r6.xzw, c1
    add r1.w, r6.x, c72.x
    pow r3.w, r0.w, r1.w
    mul r7.xyz, c61.xyww, v6.y
    mad r7.xyz, v6.x, c60.xyww, r7
    mad r7.xyz, v6.z, c62.xyww, r7
    add r7.xyz, r7, c63.xyww
    dp3 r0.w, c14, v6
    add r8.xyz, -r0.w, -c54
    cmp r8.yzw, r8.xxyz, -c3.y, -c3.z
    mov r8.x, -c3.y
    dp4 r6.x, r8, c57
    dp4 r6.y, r8, c58
    dp4 r9.x, r8, c59
    dp4 r9.y, r8, c56
    mad r6.xy, r7, r6, r9
    add r7.xyw, c15.xyzz, -v6.xyzz
    dp3 r0.w, r7.xyww, r7.xyww
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    rcp r1.w, c53.w
    mul r1.w, r0.w, r1.w
    mul r1.w, r1.w, r1.w
    mul r1.w, r1.w, c1.y
    mad r6.zw, c53.y, r6, r6.xyxy
    texld r8, r6.zwzw, s15
    add r4.w, r7.z, -r8.x
    cmp r4.w, r4.w, -c3.y, -c3.z
    mov r7.y, c53.y
    mad r6.zw, r7.y, c12.xyxy, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c12, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c11.xyxy, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c11, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c10.xyxy, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c10, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c9.xyxy, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c9, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c8.xyxy, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.zw, r7.y, c8, r6.xyxy
    texld r8, r6.zwzw, s15
    add r5.w, r7.z, -r8.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r6.xy, r7.y, c2, r6
    texld r6, r6, s15
    add r5.w, r7.z, -r6.x
    cmp r5.w, r5.w, -c3.y, -c3.z
    add r4.w, r4.w, r5.w
    mad r1.w, r4.w, c2.z, r1.w
    add r0.w, r0.w, -c53.w
    cmp r6.xy, r0.w, c7, c7.zwzw
    add r0.w, r1.w, r6.y
    cmp_sat r0.w, r0.w, r1.w, r6.x
    mul r6.xyz, r5, r3.w
    mul r6.xyz, r0.w, r6
    mul r5.xyz, r5, r0.z
    mul r5.xyz, r0.w, r5
    mad r0.xzw, r1.xyyz, r0.x, r5.xyyz
    mov r1.w, c4.w
    mul r1.x, r1.w, c72.x
    add r5, c19, -v6.x
    add r7, c20, -v6.y
    add r8, c21, -v6.z
    mul r9, r5, r5
    mad r9, r7, r7, r9
    mad r9, r8, r8, r9
    add r10, r9, c3.w
    rsq r11.x, r10.x
    rsq r11.y, r10.y
    rsq r11.z, r10.z
    rsq r11.w, r10.w
    mov r1.y, c3.y
    mad r9, r9, -c25, -r1.y
    max r10, r9, c3.x
    mul r9, r10, r10
    mad r9, r9, r9, c2.w
    mul r10, r9, c5.x
    cmp r9, r9, r10, c3.x
    mul r10, r3.x, r5
    mad r10, r7, r3.y, r10
    mad r3, r8, r3.z, r10
    mul r3, r9, r3
    mul_sat r3, r11, r3
    mul r9, r5, -c22
    mad r9, r7, -c23, r9
    mad r9, r8, -c24, r9
    mul r9, r11, r9
    mov r10, c26
    mad_sat r9, r9, r10, c27
    mul r3, r3, r9
    mul r5, r4.x, r5
    mad r5, r4.y, r7, r5
    mad r4, r4.z, r8, r5
    mul r4, r11, r4
    log r5.x, r4_abs.x
    log r5.y, r4_abs.y
    log r5.z, r4_abs.z
    log r5.w, r4_abs.w
    mul r4, r1.x, r5
    exp r5.x, r4.x
    exp r5.y, r4.y
    exp r5.z, r4.z
    exp r5.w, r4.w
    mul r4, r3, r5
    dp4 r5.x, c29, r3
    dp4 r5.y, c30, r3
    dp4 r5.z, c31, r3
    dp4 r3.x, c29, r4
    dp4 r3.y, c30, r4
    dp4 r3.z, c31, r4
    add r4.xyz, r0.xzww, r5
    mad r0.xzw, r6.xyyz, c17.w, r3.xyyz
    mov r4.w, -c3.y
    mul r2, r2, r4
    mad r0.xyz, r0.y, r0.xzww, r2
    mul oC0.w, r2.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, -c3.y
    add r1.xy, r1.y, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, -c3.y
    dp3 r1.x, r0, c5.yzww
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c6.x
    pow r2.w, r0_abs.x, r1.y
    mul r0.xyz, r2, r2.w
    rcp r0.w, c41.x
    mul_sat r0.w, r0.w, v1.w
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    lrp r3.x, c41.w, r0.w, r1.x
    add r0.w, r3.x, c41.z
    mov r3.xyz, c43
    add r1.yzw, -r3.xxyz, c42.xxyz
    mad r1.xyz, r1.x, r1.yzww, c43
    mad r1.xyz, r2, -r2.w, r1
    mad oC0.xyz, r0.w, r1, r0
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	rcp r20.z, c128.x
	mul r20.x, v9.w, r20.z
	mul r20.y, c128.y, r20.z
	log r20.x, r20.x
	log r20.y, r20.y
	rcp r20.y, r20.y
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 245 instruction slots used (17 texture, 228 arithmetic)
