//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BumpSampler;
//   float3 LuminanceConstants;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
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
//   specMapIntMask       c72      1
//   reflectivePowerED    c73      1
//   LuminanceConstants   c74      1
//   TextureSampler       s0       1
//   BumpSampler          s1       1
//   SpecSampler          s2       1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.2906088185e-43 // 663
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 1, -0.5, 9.99999975e-006, 0.00499999989
    def c1, 9.99999975e-005, 10, 1, 0
    def c2, -0.5, 0.5, -0.25, 1.33333337
    def c3, 1.5, -0.326211989, -0.405809999, 0.0833333358
    def c4, 0.212500006, 0.715399981, 0.0720999986, 0
    def c5, -0.791558981, -0.597710013, 1.00000001e-007, 0
    def c6, 1, -1, 0, -0
    def c7, 0.896420002, 0.412458003, -0.321940005, -0.932614982
    def c8, 0.185461, -0.893123984, 0.507430971, 0.0644249991
    def c9, 0.473434001, -0.480026007, 0.519456029, 0.767022014
    def c10, -0.203345001, 0.620715976, 0.962339997, -0.194983006
    def c11, -0.840143979, -0.0735799968, -0.69591397, 0.457136989
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_texcoord4 v3.xyz
    dcl_texcoord5 v4.xyz
    dcl_color v5
    dcl_texcoord2 v6.xyz
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s15
    dp3 r0.x, c14, v6
    add r0.xyz, -r0.x, -c54
    cmp r0.yzw, r0.xxyz, c1.z, c1.w
    mov r0.x, c0.x
    dp4 r1.x, r0, c57
    dp4 r1.y, r0, c58
    dp4 r2.x, r0, c59
    dp4 r2.y, r0, c56
    mul r0.xyz, c61.xyww, v6.y
    mad r0.xyz, v6.x, c60.xyww, r0
    mad r0.xyz, v6.z, c62.xyww, r0
    add r0.xyz, r0, c63.xyww
    mad r0.xy, r0, r1, r2
    mov r1.y, c53.y
    mad r1.xz, r1.y, c3.yyzw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r0.w, r0.z, -r2.x
    cmp r0.w, r0.w, c1.z, c1.w
    mad r1.xz, r1.y, c11.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c11.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c10.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c10.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c9.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c9.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c8.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c8.zyww, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c7.xyyw, r0.xyyw
    texld r2, r1.xzzw, s15
    add r1.x, r0.z, -r2.x
    cmp r1.x, r1.x, c1.z, c1.w
    add r0.w, r0.w, r1.x
    mad r1.xz, r1.y, c7.zyww, r0.xyyw
    mad r0.xy, r1.y, c5, r0
    texld r2, r0, s15
    add r0.x, r0.z, -r2.x
    cmp r0.x, r0.x, c1.z, c1.w
    texld r1, r1.xzzw, s15
    add r0.y, r0.z, -r1.x
    cmp r0.y, r0.y, c1.z, c1.w
    add r0.y, r0.w, r0.y
    add r0.x, r0.x, r0.y
    add r0.yzw, c15.xxyz, -v6.xxyz
    dp3 r0.y, r0.yzww, r0.yzww
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    rcp r0.z, c53.w
    mul r0.z, r0.y, r0.z
    add r0.y, r0.y, -c53.w
    cmp r0.yw, r0.y, c6.xxzy, c6.xzzw
    mul r0.z, r0.z, r0.z
    mul r0.z, r0.z, c3.x
    mad r0.x, r0.x, c3.w, r0.z
    add r0.z, r0.w, r0.x
    cmp_sat r0.x, r0.z, r0.x, r0.y
    texld r1, v0, s1
    add r0.y, -r1.w, c0.x
    add r0.y, -r1.x, r0.y
    cmp r0.yz, r0.y, r1.xwyw, r1.xxyw
    dp2add r0.w, r0.yzzw, -r0.yzzw, c0.x
    add r0.yz, r0, c0.y
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mul r1.xyz, r0.y, v3
    mad r1.xyz, v1, r0.w, r1
    mad r0.yzw, r0.z, v4.xxyz, r1.xxyz
    add r0.yzw, r0, c0.z
    nrm r1.xyz, r0.yzww
    dp3 r0.y, r1, -c17
    add r0.y, r0.y, c2.z
    mul_sat r0.y, r0.y, c2.w
    mul r2.xyz, c18.w, c18
    mul r0.yzw, r0.y, r2.xxyz
    mul r0.yzw, r0.x, r0
    mad_sat r1.w, r1.z, c2.x, c2.y
    mov r3.xyz, c38
    mad r3.xyz, r3, r1.w, c37
    dp3 r1.w, v5, c74
    mul r1.w, r1.w, c39.z
    mad r3.xyz, r3, r1.w, r0.yzww
    texld r4, v0, s0
    mul r4.xyz, r4, c66
    mul r4, r4, v5
    mov r3.w, c0.x
    mul r3, r3, r4
    mul oC0.w, r3.w, c39.x
    add r0.yzw, c0.z, v2.xxyz
    nrm r4.xyz, r0.yzww
    dp3 r0.y, -r4, r1
    add r0.y, r0.y, r0.y
    mad r0.yzw, r1.xxyz, -r0.y, -r4.xxyz
    dp3 r1.x, r4, r1
    add r1.x, -r1_abs.x, c0.x
    mul r1.x, r1.x, r1.x
    mul r1.x, r1.x, r1.x
    mad_sat r1.x, r1.x, -c0.y, -c0.y
    dp3_sat r0.y, -c17, r0.yzww
    add r0.y, r0.y, c1.x
    texld r4, v0, s2
    mul r0.z, r4.w, c73.x
    dp3 r0.w, r4, c72
    mul r0.w, r0.w, c73.x
    mul r0.w, r0.w, c0.w
    mul r0.w, r1.x, r0.w
    mad r0.z, r0.z, c1.y, c1.x
    pow r1.x, r0.y, r0.z
    mul r1.xyz, r2, r1.x
    mul r0.xyz, r0.x, r1
    mul r0.xyz, r0, c17.w
    mad r0.xyz, r0.w, r0, r3
    dp3 r0.w, r0, c4
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    add r1.y, c16.w, -v1.w
    mul_sat r1.x, r1.x, r1.y
    add r1.x, -r1.x, c0.x
    mov r2.x, c0.x
    add r1.yz, -r2.x, c16.xxyw
    mad r1.y, r1.x, r1.y, c0.x
    mul r1.x, r1.x, r1.z
    lrp r2.xyz, r1.y, r0, r0.w
    add r0.x, r0.w, c5.z
    pow r2.w, r0_abs.x, r1.x
    mul r0.xyz, r2, r2.w
    add r0.w, -c41.x, c41.y
    rcp r0.w, r0.w
    add r1.x, -c41.x, v1.w
    mul_sat r0.w, r0.w, r1.x
    mov r1.xyz, c43
    add r1.xyz, -r1, c42
    mad r1.xyz, r0.w, r1, c43
    mad r1.xyz, r2, -r2.w, r1
    rcp r1.w, c41.x
    mul_sat r1.w, r1.w, v1.w
    lrp r2.x, c41.w, r1.w, r0.w
    add r0.w, r2.x, c41.z
    mad oC0.xyz, r0.w, r1, r0
    
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

// approximately 177 instruction slots used (15 texture, 162 arithmetic)
