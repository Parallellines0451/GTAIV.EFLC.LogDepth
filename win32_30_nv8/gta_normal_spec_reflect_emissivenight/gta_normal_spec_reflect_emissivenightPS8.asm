//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float emissiveMultiplier;
//   float4 gDayNightEffects;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 globalFogColor;
//   float4 globalFogParams;
//   float4 globalScalars;
//   float specularColorFactor;
//   float specularFactor;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   gDirectionalLight   c17      1
//   gDirectionalColour  c18      1
//   gLightAmbient0      c37      1
//   gLightAmbient1      c38      1
//   globalScalars       c39      1
//   globalFogParams     c41      1
//   globalFogColor      c42      1
//   gDayNightEffects    c45      1
//   emissiveMultiplier  c66      1
//   specularFactor      c72      1
//   specularColorFactor c73      1
//   TextureSampler      s0       1
//   StippleTexture      s10      1
//

    ps_3_0
    def c0, 0, -1, -0, 9.99999975e-006
    def c1, -0.5, 0.5, 1.33333337, 9.99999975e-005
    def c2, 3.99600005, 4, 0.125, 0.25
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c2.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c2.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c2.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c2.w
    mad r0.xy, r1, c2.w, r0
    mov r0.zw, c0.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c0.y, c0.z
    texkill r0
    texld r0, v0, s0
    add r1.xyz, c0.w, v1
    nrm r2.xyz, r1
    mul r1, r0, v3
    add r3.xyz, c0.w, v2
    nrm r4.xyz, r3
    mad_sat r2.w, r2.z, c1.x, c1.y
    mov r3.xyz, c38
    mad r3.xyz, r3, r2.w, c37
    dp3 r2.w, r4, r2
    add r2.w, r2.w, r2.w
    mad r4.xyz, r2, -r2.w, r4
    mul r5.xyz, c18.w, c18
    dp3 r2.x, r2, -c17
    add r2.x, r2.x, -c2.w
    mul_sat r2.x, r2.x, c1.z
    dp3_sat r2.y, -c17, r4
    add r2.y, r2.y, c1.w
    mov r2.w, c1.w
    add r2.z, r2.w, c72.x
    pow r3.w, r2.y, r2.z
    mul r2.yzw, r5.xxyz, r3.w
    mul r4.xyz, r5, r2.x
    mul r2.xyz, r2.yzww, c17.w
    mad r3.xyz, r3, c39.z, r4
    mov r0.w, r1.w
    mov r3.w, -c0.y
    mul r0, r3, r0
    mad r0.xyz, c73.x, r2, r0
    mul r1.xyz, r1, c66.x
    mad r0.xyz, r1, c45.w, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, -c41.x, v1.w
    add r1.x, -c41.x, c41.y
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r1.xyz, -r0, c42
    mad oC0.xyz, r0.w, r1, r0
	// -------- Encode depth as log --------
	rcp r20.z, c128.x
	min r20.x, v9.w, c128.y
	mul r20.x, r20.x, r20.z
	mul r20.y, c128.y, r20.z
	log r20.x, r20.x
	log r20.y, r20.y
	rcp r20.y, r20.y
	mad oDepth, r20.x, r20.y, -c210.x
	// -------------------------------------

// approximately 60 instruction slots used (3 texture, 57 arithmetic)
