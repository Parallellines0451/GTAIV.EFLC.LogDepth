# GTAIV.LogDepth
Logarithmic depth buffer implementation for GTA IV to fix z-fighting.

These shaders are meant to be used as an editing base. Supported versions are 1.0.7.0, 1.0.8.0 and CE.
The .asi disables depth bounds test on Nvidia and passes the near and far plane values to the corona vertex shader. [FusionFix](https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix) already contains this functionality.

Special thanks for [RaphaelK12](https://github.com/RaphaelK12) and [AssaultKifle47](https://github.com/akifle47/) for their support, [robi29](https://github.com/robi29/) for the soft particles fix and [ThirteenAG](https://github.com/ThirteenAG) for providing the asi.

Notable articles:

- [Brano Kemen - Maximizing Depth Buffer Range and Precision](https://outerra.blogspot.com/2012/11/maximizing-depth-buffer-range-and.html)
- [Thatcher Ulrich - Logarithmic Depth Buffer](http://tulrich.com/geekstuff/log_depth_buffer.txt)

Functions used:
- log_depth = log2(W_clip / near) / log2(far / near)
- linear_depth = (far * (W_clip - near)) / (W_clip * (far - near))

# Notes
- ZShift sign was made negative in emissivestrong shaders since it was mistakenly made positive post 1.0.6.0
- Vanilla traffic lights have improper ZShift so using the fixed ones is highly recommended (they are also part of FusionFix)
- Emissive shaders use slightly different Linear2Log code mainly due to ZShift
- Soft particles were broken because they were using clip instead of view space depth
- The corona vertex shader needs to use a custom register (c227) instead of NearFarPlane
- The Linear2Log conditional statement is to make sure that log depth is only written if a perspective projection is used
