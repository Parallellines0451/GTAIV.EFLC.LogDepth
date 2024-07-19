# GTAIV.EFLC.LogDepth
Grand Theft Auto IV on PC suffers from severe z-fighting due to the use of a conventional depth buffer, as opposed to the console versions, which use reversed depth. This repository provides a logarithmic depth implementation for the game's shaders, which mitigates the issue similarly to reversed depth, and it's also the base for [Fusion Shaders](https://github.com/Parallellines0451/GTAIV.EFLC.FusionShaders).

A showcase is available [here](http://www.youtube.com/watch?v=sAfKfvAIsXw).

## Requirements
All game versions post 1.0.6.0 are supported.

There are some prerequisites for these shaders to work correctly and examples of each of them are implemented in [FusionFix](https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix):
- Depth bounds test (specifically [D3DRS_ADAPTIVETESS_X](https://developer.download.nvidia.com/GPU_Programming_Guide/GPU_Programming_Guide_G80.pdf)) needs to be disabled to fix light pop-in on Nvidia graphics cards, and on AMD if using DXVK
- The game's current near and far clip values need to be sent to the c227 vertex shader register for corona depth test to work (in deferred_lightingVS11)
- Near and far clip overrides need to be removed from cutscenes and timecycmodifiers in order to prevent flickering as the game tends to update their values erratically

## Notes and complementary fixes
- The ZShift sign in gta_emissivestrong shaders was erroneously inverted by patch 1.0.6.0, which made several lights invisible; this was reverted, but it causes clipping on traffic lights because that patch also enabled D3DRS_ZWRITEENABLE for emissives, thus optional adjusted models are provided here
- Linear2Log code is the same across all shaders except emissive ones due to ZShift; Log2Linear is the same across all but gta_rmptfx_litsprite, as a fix for soft particles was included, courtesy of robi29
- Since the game uses the same registers for orthographic and perspective projection, Linear2Log only writes logarithmic depth in the case of the latter to prevent rain and UI issues

## Conclusion
Special thanks to [RaphaelK12](https://github.com/RaphaelK12), [AssaultKifle47](https://github.com/akifle47/), [robi29](https://github.com/robi29/), [ThirteenAG](https://github.com/ThirteenAG) and [Shvab](https://github.com/d3g0n-byte). Fixing this monumental issue wouldn't have been possible without their help.

#### References:
- [Brano Kemen - Maximizing Depth Buffer Range and Precision](https://outerra.blogspot.com/2012/11/maximizing-depth-buffer-range-and.html)
- [Thatcher Ulrich - Logarithmic Depth Buffer](http://tulrich.com/geekstuff/log_depth_buffer.txt)

#### Functions used:
- Linear2Log = log2(W_clip / near) / log2(far / near)
- Log2Linear = (far * (W_clip - near)) / (W_clip * (far - near))