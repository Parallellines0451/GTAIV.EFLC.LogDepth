# GTAIV.LogDepth
Logarithmic depth buffer implementation for GTA IV to fix z-fighting.

These shaders are meant to be used as an editing base, so no other tweaks have been incorporated aside from fixed soft particles and emissivestrong ZShift. Supported versions are 1.0.7.0, 1.0.8.0 and CE.

Notable articles:

- [Brano Kemen - Maximizing Depth Buffer Range and Precision](https://outerra.blogspot.com/2012/11/maximizing-depth-buffer-range-and.html)
- [Thatcher Ulrich - Logarithmic Depth Buffer](http://tulrich.com/geekstuff/log_depth_buffer.txt)

# Templates
Functions used:
- log_depth = log2(W_clip / near) / log2(far / near)
- W_clip = pow((far / near), log_depth) * near
- linear_depth = (far * (W_clip - near)) / (W_clip * (far - near))

Linear to Log:

	// ----------- Linear to Log -----------
	rcp r20.z, c128.x
	mul r20.x, v9.w, r20.z
	mul r20.y, c128.y, r20.z
	log r20.x, r20.x
	log r20.y, r20.y
	rcp r20.y, r20.y
	mul oDepth, r20.x, r20.y
	// -------------------------------------

Log to Linear:

	def c127, 0.9999999, 1, 0, 0

	// ----------- Log to Linear -----------
	if_ne REPLACEME.x, c127.y
		rcp r20.x, c128.x
		mul r20.x, r20.x, c128.y
		pow r20.x, r20.x, REPLACEME.x
		mul r20.x, r20.x, c128.x	// W_clip
		
		add r20.y, r20.x, -c128.x
		add r20.z, c128.y, -c128.x
		mul r20.y, r20.y, c128.y
		mul r20.z, r20.z, r20.x
		rcp r20.z, r20.z
		mul r20.w, r20.y, r20.z		// Linear depth
		
		min REPLACEME, r20.w, c127.x	// FP error hack
	endif
	// -------------------------------------
	
# Notes

- ZShift sign was made negative in emissivestrong shaders (since it was mistakenly made positive post 1.0.6.0)
- Emissive shaders with ZShift use slightly different Linear->Log code
- Soft particles were fixed because they had to have Log->Linear code added anyway
- Corona and UI vertex shaders use a custom register (c227) instead of NearFarPlane
- gta_im and rage_im pass a recalculated W_clip to pixel shaders in order to fix UI issues
- The depth buffer texture goes by many names: DepthBufferSampler, DepthMapTexSampler, DepthTextureSampler0 or GBufferTextureSampler3
