# GTAIV.LogDepth
Logarithmic depth buffer implementation for GTA IV to fix z-fighting.

The .asi disables depth bounds test on Nvidia and passes the near and far plane values to the corona vertex shader. It's required for 1.0.7.0 and 1.0.8.0; Complete Edition requires only [FusionFix](https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix).

Special thanks to [RaphaelK12](https://github.com/RaphaelK12) and [AssaultKifle47](https://github.com/akifle47/) for their support, [robi29](https://github.com/robi29/) for the soft particles fix, [ThirteenAG](https://github.com/ThirteenAG) for providing the asi and [Shvab](https://github.com/d3g0n-byte) for making Rage Shader Editor.

Notable articles:

- [Brano Kemen - Maximizing Depth Buffer Range and Precision](https://outerra.blogspot.com/2012/11/maximizing-depth-buffer-range-and.html)
- [Thatcher Ulrich - Logarithmic Depth Buffer](http://tulrich.com/geekstuff/log_depth_buffer.txt)

Functions used:
- log_depth = log2(W_clip / near) / log2(far / near)
- linear_depth = (far * (W_clip - near)) / (W_clip * (far - near))

# Notes
- ZShift sign was made negative in gta_emissivestrong to fix invisible/clipping lights around the map since it was mistakenly made positive after 1.0.6.0; this causes clipping on traffic lights because their models have improper ZShift, so fixed ones were provided
- Linear2Log code is the same across all shaders except emissive ones due to ZShift; Log2Linear is identical in all except gta_rmptfx_litsprite since the vanilla game mistakenly used ndc space depth instead of view space for soft particles
- All shaders use c128 (the native NearFarPlane register) except deferred_lightingVS11 (the corona vertex shader); a custom register (c227) was needed to pass these values consistently
- The Linear2Log conditional statement is there to make sure that log depth is only written if a perspective projection is used, since the game uses the same registers for orthographic projection

# Showcase video
[![Showcase](https://img.youtube.com/vi/sAfKfvAIsXw/maxresdefault.jpg)](http://www.youtube.com/watch?v=sAfKfvAIsXw)
