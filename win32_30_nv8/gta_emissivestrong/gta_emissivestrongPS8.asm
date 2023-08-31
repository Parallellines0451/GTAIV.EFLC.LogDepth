//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float emissiveMultiplier;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 globalFogColor;
//   float4 globalFogParams;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   gDirectionalLight  c17      1
//   gDirectionalColour c18      1
//   gLightAmbient0     c37      1
//   gLightAmbient1     c38      1
//   globalScalars      c39      1
//   globalFogParams    c41      1
//   globalFogColor     c42      1
//   emissiveMultiplier c66      1
//   TextureSampler     s0       1
//   StippleTexture     s10      1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 9.99999975e-006, -0.5, 0.5, -0.25
    def c1, 1.33333337, 1, 3.99600005, 4
    def c2, 0.125, 0, -1, -0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_color v2
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    texld r0, v0, s0
    add r1.xyz, c0.x, v1
    nrm r2.xyz, r1
    mul r0.w, r0.w, v2.w
    mad_sat r1.x, r2.z, c0.y, c0.z
    mov r3.xyz, c38
    mad r1.xyz, r3, r1.x, c37
    mul r3.xyz, c18.w, c18
    dp3 r1.w, r2, -c17
    add r1.w, r1.w, c0.w
    mul_sat r1.w, r1.w, c1.x
    mul r2.xyz, r3, r1.w
    mad r1.xyz, r1, c39.z, r2
    mov r1.w, c1.y
    mul r1, r0, r1
    mul r0.w, r1.w, c39.x
    mov_sat r1.w, r0.w
    mul r1.w, r1.w, c1.z
    frc r2.x, r1.w
    mul r2.y, r2.x, c1.w
    frc r2.z, r2.y
    add r3.x, r2.y, -r2.z
    add r3.y, r1.w, -r2.x
    mul r2.xy, c2.x, vPos
    frc r2.xy, r2_abs
    cmp r2.xy, vPos, r2, -r2
    mul r2.xy, r2, -c0.w
    mad r2.xy, r3, -c0.w, r2
    mov r2.zw, c2.y
    texldl r2, r2, s10
    cmp r2, -r2.y, c2.z, c2.w
    texkill r2
    mul r0.xyz, r0, v2
    mad r0.xyz, r0, c66.x, r1
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    add r1.yzw, -r0.xxyz, c42.xxyz
    mad oC0.xyz, r1.x, r1.yzww, r0
    mov oC0.w, r0.w
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	if_ne v9.y, c127.y
		rcp r20.z, c128.x
		mul r20.x, v9.w, r20.z
		mul r20.y, c128.y, r20.z
		log r20.x, r20.x
		log r20.y, r20.y
		rcp r20.y, r20.y
		mad r20.z, r20.x, r20.y, -v9.x
	else
		mov r20.x, v9.z
		rcp r20.y, v9.w
		mul r20.z, r20.x, r20.y
	endif
	mov oDepth, r20.z
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 44 instruction slots used (3 texture, 41 arithmetic)
