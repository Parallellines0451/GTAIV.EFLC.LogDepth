//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DirtSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float3 dirtColor;
//   float dirtLevel;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
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
//   float3 matDiffuseColor;
//   float reflectivePowerED;
//   float3 specMapIntMask;
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
//   matDiffuseColor      c66      1
//   dirtLevel            c72      1
//   dirtColor            c73      1
//   specularFactor       c74      1
//   specularColorFactor  c75      1
//   specMapIntMask       c76      1
//   reflectivePowerED    c77      1
//   LuminanceConstants   c78      1
//   TextureSampler       s0       1
//   DirtSampler          s1       1
//   SpecSampler          s2       1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 1.0075335958e-42 // 719
    def c127, 0.9999999, 1, 0, 0 // LogDepth constants
    def c0, 9.99999975e-006, 0, 1, -0.25
    def c1, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c2, 1.5, -0.326211989, -0.405809999, 0.0833333358
    def c3, 0.212500006, 0.715399981, 0.0720999986, 0
    def c4, -0.791558981, -0.597710013, 1.00000001e-007, 0
    def c5, 1, -1, 0, -0
    def c6, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c7, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c8, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c9, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c10, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_texcoord2 v4.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c0.x, v1
    nrm r2.xyz, r1
    texld r1, v0, s2
    mul r1.w, r1.w, c74.x
    dp3 r1.x, r1, c76
    mul r1.x, r1.x, c75.x
    mul r1.x, r1.x, c77.x
    mul r0.xyz, r0, c66
    mul r0, r0, v3
    dp3 r1.y, v3, c78
    mul r1.y, r1.y, c39.z
    mov r3.yz, c0
    if_lt -c72.x, r3.y
      texld r4, v0, s1
      mul r1.z, r4.x, c72.x
      mad r5.x, r4.x, -c72.x, r3.z
      lrp r5.yzw, r1.z, c73.xxyz, r0.xxyz
      mad r6, r0.xxyz, c0.yzzz, c0.zyyy
      cmp r4, -r4.x, r6, r5
      mov r0.xyz, r4.yzww
    else
      mov r4.x, c0.z
    endif
    mul r1.x, r1.x, r4.x
    add r3.xyw, c0.x, v2.xyzz
    nrm r4.xyz, r3.xyww
    mad_sat r1.z, r2.z, c1.x, c1.y
    mov r5.xyz, c38
    mad r3.xyw, r5.xyzz, r1.z, c37.xyzz
    dp3 r1.z, -r4, r2
    add r1.z, r1.z, r1.z
    mad r5.xyz, r2, -r1.z, -r4
    mul r6.xyz, c18.w, c18
    dp3 r1.z, r2, -c17
    add r1.z, r1.z, c0.w
    mul_sat r1.z, r1.z, c1.z
    dp3_sat r2.w, -c17, r5
    add r2.w, r2.w, c1.w
    mov r4.w, c1.w
    mad r1.w, r1.w, c77.x, r4.w
    pow r4.w, r2.w, r1.w
    mul r5.xyz, c61.xyww, v4.y
    mad r5.xyz, v4.x, c60.xyww, r5
    mad r5.xyz, v4.z, c62.xyww, r5
    add r5.xyz, r5, c63.xyww
    dp3 r1.w, c14, v4
    add r7.xyz, -r1.w, -c54
    cmp r7.yzw, r7.xxyz, c0.z, c0.y
    mov r7.x, c0.z
    dp4 r8.x, r7, c57
    dp4 r8.y, r7, c58
    dp4 r9.x, r7, c59
    dp4 r9.y, r7, c56
    mad r5.xy, r5, r8, r9
    add r7.xyz, c15, -v4
    dp3 r1.w, r7, r7
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r2.w, c53.w
    mul r2.w, r1.w, r2.w
    mul r2.w, r2.w, r2.w
    mul r2.w, r2.w, c2.x
    mov r7.y, c53.y
    mad r7.xz, r7.y, c2.yyzw, r5.xyyw
    texld r8, r7.xzzw, s15
    add r5.w, r5.z, -r8.x
    cmp r5.w, r5.w, c0.z, c0.y
    mad r7.xz, r7.y, c10.xyyw, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c10.zyww, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c9.xyyw, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c9.zyww, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c8.xyyw, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c8.zyww, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c7.xyyw, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c7.zyww, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c6.xyyw, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r7.xz, r7.y, c6.zyww, r5.xyyw
    texld r8, r7.xzzw, s15
    add r6.w, r5.z, -r8.x
    cmp r6.w, r6.w, c0.z, c0.y
    add r5.w, r5.w, r6.w
    mad r5.xy, r7.y, c4, r5
    texld r7, r5, s15
    add r5.x, r5.z, -r7.x
    cmp r5.x, r5.x, c0.z, c0.y
    add r5.x, r5.w, r5.x
    mad r2.w, r5.x, c2.w, r2.w
    add r1.w, r1.w, -c53.w
    cmp r5.xy, r1.w, c5, c5.zwzw
    add r1.w, r2.w, r5.y
    cmp_sat r1.w, r1.w, r2.w, r5.x
    mul r5.xyz, r6, r4.w
    mul r5.xyz, r1.w, r5
    mul r6.xyz, r6, r1.z
    mul r6.xyz, r1.w, r6
    mul r5.xyz, r5, c17.w
    mad r6.xyz, r3.xyww, r1.y, r6
    dp3 r1.y, r4, r2
    add r1.y, -r1_abs.y, c0.z
    mul r1.y, r1.y, r1.y
    mul r1.y, r1.y, r1.y
    mad_sat r1.y, r1.y, c1.y, c1.y
    mul r1.x, r1.x, r1.y
    mov r6.w, c0.z
    mul r0, r0, r6
    mad r0.xyz, r1.x, r5, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c0.z
    add r1.xy, -r3.z, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c0.z
    dp3 r1.x, r0, c3
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c4.z
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
    if_ne v9.y, c127.y
      rcp r20.z, c128.x
      mul r20.x, v9.w, r20.z
      mul r20.y, c128.y, r20.z
      log r20.x, r20.x
      log r20.y, r20.y
      rcp r20.y, r20.y
    else
      mov r20.x, v9.z
      rcp r20.y, v9.w
    endif
    mul oDepth, r20.x, r20.y
    // ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 180 instruction slots used (15 texture, 165 arithmetic)
