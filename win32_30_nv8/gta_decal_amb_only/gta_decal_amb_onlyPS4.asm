//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float3 ambientDecalMask;
//   float4 globalScalars;
//   float4 globalScalars2;
//   float4 stencil;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   globalScalars    c39      1
//   globalScalars2   c40      1
//   stencil          c52      1
//   ambientDecalMask c66      1
//   TextureSampler   s0       1
//   StippleTexture   s10      1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 3.99600005, 4, 0.125, 0.25
    def c1, 0, -1, -0, 1
    dcl_texcoord v0.xy
    dcl_color v1.w
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s10
    mov_sat r0.x, c39.x
    mul r0.x, r0.x, c0.x
    frc r0.y, r0.x
    mul r0.z, r0.y, c0.y
    frc r0.w, r0.z
    add r1.xy, r0.zxzw, -r0.wyzw
    mul r0.xy, c0.z, vPos
    frc r0.xy, r0_abs
    cmp r0.xy, vPos, r0, -r0
    mul r0.xy, r0, c0.w
    mad r0.xy, r1, c0.w, r0
    mov r0.zw, c1.x
    texldl r0, r0, s10
    cmp r0, -r0.y, c1.y, c1.z
    texkill r0
    texld r0, v0, s0
    mul r0.w, r0.w, v1.w
    dp3 r0.x, r0, c66
    add_sat r0.x, -r0.x, c1.w
    mul r0.x, r0.w, r0.x
    mul r0.x, r0.x, c39.x
    mul oC2.w, r0.x, c40.z
    mov oC2.xyz, c1.x
    mov r0.xw, c1
    mul oC3, r0.wxxx, c52.x
    mov oC0, c1.x
    mov oC1, c1.x
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	rcp r20.z, c128.x
	mul r20.x, v9.w, r20.z
	mul r20.y, c128.y, r20.z
	log r20.x, r20.x
	log r20.y, r20.y
	rcp r20.y, r20.y
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 28 instruction slots used (3 texture, 25 arithmetic)
