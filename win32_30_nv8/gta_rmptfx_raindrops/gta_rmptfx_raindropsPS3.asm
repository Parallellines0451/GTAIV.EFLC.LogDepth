//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DiffuseTexSampler;
//   sampler2D FrameMapTexSampler;
//   float gBlurAmount;
//   float2 gHeatHazeRippleLength;
//   float2 gHeatHazeRippleRate;
//   float gRefraction;
//   float4 globalScreenSize;
//
//
// Registers:
//
//   Name                  Reg   Size
//   --------------------- ----- ----
//   globalScreenSize      c44      1
//   gBlurAmount           c66      1
//   gRefraction           c72      1
//   gHeatHazeRippleRate   c73      1
//   gHeatHazeRippleLength c74      1
//   DiffuseTexSampler     s0       1
//   FrameMapTexSampler    s1       1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.5, 1, 1.5915494, 0.125
    def c1, 6.28318548, -3.14159274, -0.00326212007, -0.00405809982
    def c2, -0.00791558996, -0.00597710023, 0, 0
    def c3, -0.00695913984, 0.00457136985, -0.00203344994, 0.00620716019
    def c4, 0.00962339994, -0.00194982998, 0.00519456016, 0.00767021999
    def c5, 0.00185461005, -0.00893124007, 0.00896419957, 0.00412457995
    dcl_color v0
    dcl_texcoord v1
    dcl_texcoord2 v2
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    rcp r0.x, v2.z
    mad r0.y, v2.x, r0.x, v2.w
    mul r0.y, r0.y, c73.x
    mad r0.y, r0.y, c0.z, c0.x
    frc r0.y, r0.y
    mad r0.y, r0.y, c1.x, c1.y
    sincos r1.y, r0.y
    mul r0.y, r1.y, c74.x
    mul r0.y, r0.y, c44.z
    mad r0.zw, v2.xyxy, r0.x, c0.y
    mad r0.x, v2.y, -r0.x, v2.w
    mul r0.x, r0.x, c73.y
    mad r0.x, r0.x, c0.z, c0.x
    frc r0.x, r0.x
    mad r0.x, r0.x, c1.x, c1.y
    sincos r1.x, r0.x
    mul r0.x, r1.x, c74.y
    mul r0.x, r0.x, c44.w
    mul r0.z, r0.z, c0.x
    mad r0.w, r0.w, -c0.x, c0.y
    mad r1.y, r0.x, c72.x, r0.w
    mad r1.x, r0.y, c72.x, r0.z
    mov r0.x, c66.x
    mad r0.yz, r0.x, c1.xzww, r1.xxyw
    texld r2, r0.yzzw, s1
    texld r3, r1, s1
    add r0.yzw, r2.xxyz, r3.xxyz
    mad r1.zw, r0.x, c3.xyxy, r1.xyxy
    texld r2, r1.zwzw, s1
    add r0.yzw, r0, r2.xxyz
    mad r1.zw, r0.x, c3, r1.xyxy
    texld r2, r1.zwzw, s1
    add r0.yzw, r0, r2.xxyz
    mad r1.zw, r0.x, c4.xyxy, r1.xyxy
    texld r2, r1.zwzw, s1
    add r0.yzw, r0, r2.xxyz
    mad r1.zw, r0.x, c4, r1.xyxy
    texld r2, r1.zwzw, s1
    add r0.yzw, r0, r2.xxyz
    mad r1.zw, r0.x, c5.xyxy, r1.xyxy
    texld r2, r1.zwzw, s1
    add r0.yzw, r0, r2.xxyz
    mad r1.zw, r0.x, c5, r1.xyxy
    mad r1.xy, r0.x, c2, r1
    texld r2, r1, s1
    texld r1, r1.zwzw, s1
    add r0.xyz, r0.yzww, r1
    add r0.xyz, r2, r0
    mul r0.xyz, r0, v0
    mul r0.xyz, r0, c0.w
    texld r1, v1, s0
    texld r2, v1.zwzw, s0
    lrp r3.x, c0.x, r2.w, r1.w
    mul_sat r0.w, r3.x, v0.w
    max oC0, r0, c2.z
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	rcp r20.z, c128.x
	mul r20.x, v9.w, r20.z
	mul r20.y, c128.y, r20.z
	log r20.x, r20.x
	log r20.y, r20.y
	rcp r20.y, r20.y
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 69 instruction slots used (11 texture, 58 arithmetic)
