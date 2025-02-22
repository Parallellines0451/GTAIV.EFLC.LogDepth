//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 NearFarPlane;
//   sampler2D DirtSampler;
//   sampler2D EnvironmentSampler;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float3 dirtColor;
//   float dirtLevel;
//   float emissiveMultiplier;
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
//   NearFarPlane         c128     1
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
//   emissiveMultiplier   c72      1
//   dirtLevel            c73      1
//   dirtColor            c74      1
//   specMapIntMask       c75      1
//   reflectivePowerED    c76      1
//   TextureSampler       s0       1
//   DirtSampler          s1       1
//   SpecSampler          s2       1
//   EnvironmentSampler   s4       1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.4027126956e-43 // 671
    def c127, 1, 1, 0, 0 // LogDepth constants
    def c0, 9.99999975e-005, 190, 1.5, 0.0833333358
    def c1, 9.99999975e-006, 0.224999994, 1, 0.5
    def c2, 0.800000012, 0.5, 0.200000003, 0
    def c3, 5, 18, 0, 1
    def c4, -0.5, 0.5, -0.25, 1.33333337
    def c5, 0.212500006, 0.715399981, 0.0720999986, 1.00000001e-007
    def c6, 1, -1, 0, -0
    def c7, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c8, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c9, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c10, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c11, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c12, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_texcoord2 v4.xyz
    dcl_texcoord7 v5.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c1.x, v1
    nrm r2.xyz, r1
    texld r1, v0, s2
    mul r1.w, r1.w, c76.x
    dp3 r1.x, r1, c75
    mul r1.x, r1.x, c76.x
    mul r1.x, r1.x, c1.y
    add r3.xyz, c1.x, v2
    nrm r4.xyz, r3
    dp3 r1.y, r4, r2
    add r1.y, -r1_abs.y, c1.z
    mul r1.y, r1.y, r1.y
    mul r1.y, r1.y, r1.y
    mad r1.yz, r1.y, c2.xyxw, c2
    add r1.z, r1.z, r1.z
    min r2.w, r1.x, c1.z
    dp3 r1.x, -r4, r2
    add r1.x, r1.x, r1.x
    mad r3.xyz, r2, -r1.x, -r4
    add r4.xyz, r3, c1.x
    nrm r5.xyz, r4
    mov_sat r1.x, r5.z
    add r1.x, r1.x, c1.z
    add r1.x, r1.x, r1.x
    rcp r1.x, r1.x
    mad r4.xy, r5, r1.x, c1.w
    add r4.xy, -r4, c1.z
    mov r4.zw, c2.w
    texldl r4, r4, s4
    mul_sat r1.x, r5.z, c3.x
    mul r4.xyz, r4, r1.x
    mul r4.xyz, r1.z, r4
    mul r4.xyz, r4, c76.x
    mul r4.xyz, r4, c3.y
    mul r0.xyz, r0, c66
    mul r5, r0, v3
    mov r3.w, c2.w
    if_lt -c73.x, r3.w
      texld r6, v5, s1
      mul r1.x, r6.x, c73.x
      mov r1.z, c1.z
      mad r7.x, r6.x, -c73.x, r1.z
      lrp r7.yzw, r1.x, c74.xxyz, r0.xxyz
      mad r8, r0.xxyz, c3.zwww, c3.wzzz
      cmp r0, -r6.x, r8.yzwx, r7.yzwx
    else
      mov r0.w, c1.z
    endif
    mul r1.x, r2.w, r0.w
    mad_sat r1.z, r2.z, c4.x, c4.y
    mov r6.xyz, c38
    mad r6.xyz, r6, r1.z, c37
    mul r7.xyz, c18.w, c18
    dp3 r1.z, r2, -c17
    add r1.z, r1.z, c4.z
    mul_sat r1.z, r1.z, c4.w
    dp3_sat r2.x, -c17, r3
    add r2.x, r2.x, c0.x
    mad r1.w, r1.w, c0.y, c0.x
    pow r3.x, r2.x, r1.w
    mul r2.xyz, c61.xyww, v4.y
    mad r2.xyz, v4.x, c60.xyww, r2
    mad r2.xyz, v4.z, c62.xyww, r2
    add r2.xyz, r2, c63.xyww
    dp3 r1.w, c14, v4
    add r3.yzw, -r1.w, -c54.xxyz
    cmp r8.yzw, r3, c3.w, c3.z
    mov r8.x, c1.z
    dp4 r9.x, r8, c57
    dp4 r9.y, r8, c58
    dp4 r10.x, r8, c59
    dp4 r10.y, r8, c56
    mad r2.xy, r2, r9, r10
    add r3.yzw, c15.xxyz, -v4.xxyz
    dp3 r1.w, r3.yzww, r3.yzww
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r2.w, c53.w
    mul r2.w, r1.w, r2.w
    mul r2.w, r2.w, r2.w
    mul r2.w, r2.w, c0.z
    mov r3.y, c53.y
    mad r3.zw, r3.y, c12.xyxy, r2.xyxy
    texld r8, r3.zwzw, s15
    add r3.z, r2.z, -r8.x
    cmp r3.z, r3.z, c3.w, c3.z
    mad r8.xy, r3.y, c12.zwzw, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c11, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c11.zwzw, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c10, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c10.zwzw, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c9, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c9.zwzw, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c8, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c8.zwzw, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r8.xy, r3.y, c7, r2
    texld r8, r8, s15
    add r3.w, r2.z, -r8.x
    cmp r3.w, r3.w, c3.w, c3.z
    add r3.z, r3.z, r3.w
    mad r2.xy, r3.y, c7.zwzw, r2
    texld r8, r2, s15
    add r2.x, r2.z, -r8.x
    cmp r2.x, r2.x, c3.w, c3.z
    add r2.x, r3.z, r2.x
    mad r2.x, r2.x, c0.w, r2.w
    add r1.w, r1.w, -c53.w
    cmp r2.yz, r1.w, c6.xxyw, c6.xzww
    add r1.w, r2.x, r2.z
    cmp_sat r1.w, r1.w, r2.x, r2.y
    mul r2.xyz, r7, r3.x
    mul r2.xyz, r1.w, r2
    mul r3.xyz, r7, r1.z
    mul r3.xyz, r1.w, r3
    mad r3.xyz, r6, c39.z, r3
    mov_sat r1.y, r1.y
    mul r1.x, r1.x, r1.y
    mul r1.yzw, r4.xxyz, r1.x
    mul r1.yzw, r1, c39.z
    mad r1.yzw, r2.xxyz, c17.w, r1
    mov r0.w, r5.w
    mov r3.w, c1.z
    mul r0, r0, r3
    mad r0.xyz, r1.x, r1.yzww, r0
    mad r0.xyz, r5, c72.x, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c1.z
    mov r1.z, c1.z
    add r1.xy, -r1.z, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c1.z
    dp3 r1.x, r0, c5
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c5.w
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

// approximately 203 instruction slots used (17 texture, 186 arithmetic)
