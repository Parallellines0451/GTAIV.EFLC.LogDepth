//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D TextureSampler;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   TextureSampler s0       1
//

    ps_3_0
    dcl_texcoord v0.xy
    dcl_texcoord9 v9
    dcl_2d s0
    texld oC0, v0, s0
	// -------- Encode depth as log --------
	rcp r20.z, c128.x
	mul r20.x, v9.w, r20.z
	mul r20.y, c128.y, r20.z
	log r20.x, r20.x
	log r20.y, r20.y
	rcp r20.y, r20.y
	mul oDepth, r20.x, r20.y
	// -------------------------------------

// approximately 1 instruction slot used (1 texture, 0 arithmetic)