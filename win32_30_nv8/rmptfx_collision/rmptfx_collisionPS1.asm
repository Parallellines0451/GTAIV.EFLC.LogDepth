//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.5, 0, 1, 0
    dcl_texcoord1 v0.xyz
	dcl_texcoord9 v9
    mad oC0, v0.xyzx, c0.xxxy, c0.xxxz
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	rcp r20.z, c128.x
	mul r20.x, v9.w, r20.z
	mul r20.y, c128.y, r20.z
	log r20.x, r20.x
	log r20.y, r20.y
	rcp r20.y, r20.y
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 1 instruction slot used
