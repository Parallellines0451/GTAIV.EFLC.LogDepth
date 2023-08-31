//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
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
//   TextureSampler       s0       1
//   StippleTexture       s10      1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.5, 0.5, 1.33333337, 1.5
    def c2, 0.0833333358, 640, 576, 1.00000001e-007
    def c3, 0.349999994, 1, 0, 0
    def c4, 3.99600005, 4, 0.125, 0.25
    def c5, 0.212500006, 0.715399981, 0.0720999986, 0
    def c6, 1, -1, 0, -0
    def c7, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c8, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c9, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c10, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c11, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c12, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_color v2.x
    dcl_texcoord6 v3.xyz
    dcl_texcoord8 v4.xyw
    dcl_texcoord7 v5
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
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
    mad_sat r0.w, r2.z, c1.x, c1.y
    mov r1.xyz, c38
    mad r1.xyz, r1, r0.w, c37
    mul r3.xyz, c18.w, c18
    dp3 r0.w, r2, -c17
    add r0.w, r0.w, -c4.w
    mul_sat r0.w, r0.w, c1.z
    mul r2.xyz, c61.xyww, v3.y
    mad r2.xyz, v3.x, c60.xyww, r2
    mad r2.xyz, v3.z, c62.xyww, r2
    add r2.xyz, r2, c63.xyww
    dp3 r1.w, c14, v3
    add r4.xyz, -r1.w, -c54
    cmp r4.yzw, r4.xxyz, -c0.y, -c0.z
    mov r4.x, -c0.y
    dp4 r5.x, r4, c57
    dp4 r5.y, r4, c58
    dp4 r6.x, r4, c59
    dp4 r6.y, r4, c56
    mad r2.xy, r2, r5, r6
    add r4.xyz, c15, -v3
    dp3 r1.w, r4, r4
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r2.w, c53.w
    mul r2.w, r1.w, r2.w
    mul r2.w, r2.w, r2.w
    mul r2.w, r2.w, c1.w
    mov r4.y, c53.y
    mad r4.xz, r4.y, c12.xyyw, r2.xyyw
    texld r5, r4.xzzw, s15
    add r3.w, r2.z, -r5.x
    cmp r3.w, r3.w, -c0.y, -c0.z
    mad r4.xz, r4.y, c12.zyww, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c11.xyyw, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c11.zyww, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c10.xyyw, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c10.zyww, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c9.xyyw, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c9.zyww, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c8.xyyw, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c8.zyww, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r4.xz, r4.y, c7.xyyw, r2.xyyw
    texld r5, r4.xzzw, s15
    add r4.x, r2.z, -r5.x
    cmp r4.x, r4.x, -c0.y, -c0.z
    add r3.w, r3.w, r4.x
    mad r2.xy, r4.y, c7.zwzw, r2
    texld r4, r2, s15
    add r2.x, r2.z, -r4.x
    cmp r2.x, r2.x, -c0.y, -c0.z
    add r2.x, r3.w, r2.x
    mad r2.x, r2.x, c2.x, r2.w
    add r1.w, r1.w, -c53.w
    cmp r2.yz, r1.w, c6.xxyw, c6.xzww
    add r1.w, r2.x, r2.z
    cmp_sat r1.w, r1.w, r2.x, r2.y
    mul r2.xyz, r3, r0.w
    mul r2.xyz, r1.w, r2
    mad r1.xyz, r1, v2.x, r2
    mul r2.xyz, r0, r1
    rcp r0.w, v5.w
    mul r3.xy, r0.w, v5
    rcp r0.w, v4.w
    mul r3.zw, r0.w, v4.xyxy
    mul r3.zw, r3, c2.xyyz
    mad r3.xy, r3, c2.yzzw, -r3.zwzw
    dp2add r0.w, r3, r3, c0.x
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    mad r0.w, r0.w, -c3.x, c3.y
    mul r1.w, r0.w, v5.z
    mul r1.w, r1.w, c39.x
    cmp oC0.w, r0.w, r1.w, c0.x
    add r0.w, c16.w, -v1.w
    add r1.w, -c16.z, c16.w
    rcp r1.w, r1.w
    mul_sat r0.w, r0.w, r1.w
    add r0.w, -r0.w, -c0.y
    mov r3.y, c0.y
    add r3.xy, r3.y, c16
    mul r1.w, r0.w, r3.y
    mad r0.w, r0.w, r3.x, -c0.y
    dp3 r2.x, r2, c5
    mad r0.xyz, r0, r1, -r2.x
    mad r0.xyz, r0.w, r0, r2.x
    add r0.w, r2.x, c2.w
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
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	rcp r20.z, c128.x
	mul r20.x, v9.w, r20.z
	mul r20.y, c128.y, r20.z
	log r20.x, r20.x
	log r20.y, r20.y
	rcp r20.y, r20.y
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 162 instruction slots used (15 texture, 147 arithmetic)
