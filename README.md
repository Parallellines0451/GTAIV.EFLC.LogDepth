# GTAIV.EFLC.LogDepth
Grand Theft Auto IV on PC suffers from severe z-fighting due to the use of a conventional 24-bit depth buffer. This repository provides a logarithmic depth implementation for the game's shaders, which brings it up to par with the console versions. A showcase is available [here](http://www.youtube.com/watch?v=sAfKfvAIsXw).

## Requirements
There are some prerequisites for these shaders to work correctly and examples of each of them are implemented in [FusionFix](https://github.com/ThirteenAG/GTAIV.EFLC.FusionFix):
- Depth bounds test (specifically [D3DRS_ADAPTIVETESS_X](https://developer.download.nvidia.com/GPU_Programming_Guide/GPU_Programming_Guide_G80.pdf)) needs to be disabled to fix light pop-in on Nvidia graphics cards, and on AMD if using DXVK.
- The game's current near and far clip values need to be sent to the c227 vertex shader register for corona depth test to work (in deferred_lightingVS11).
- Near and far clip overrides need to be removed from cutscenes and timecycmodifiers in order to prevent flickering, as the game tends to update their values erratically.

## Notes and complementary fixes
- Since the game uses the same registers for orthographic and perspective projection, we only write logarithmic depth in the case of the latter to not break rain, UI and such.
- The incorrect ZShift sign in gta_emissivestrong was fixed. We also provide edited traffic light models to go with this because newer versions have emissive depth write always enabled.
- Emissives have a few other tweaks to prevent them from being visible through the fog at the far clip.
- Soft particles have been fixed as well, courtesy of Robi.

## Conclusion
Special thanks to [RaphaelK12](https://github.com/RaphaelK12), [AssaultKifle47](https://github.com/akifle47/), [robi29](https://github.com/robi29/), [ThirteenAG](https://github.com/ThirteenAG) and [Shvab](https://github.com/d3g0n-byte). Fixing this monumental issue wouldn't have been possible without their help.

#### References:
- [Brano Kemen - Maximizing Depth Buffer Range and Precision](https://outerra.blogspot.com/2012/11/maximizing-depth-buffer-range-and.html)
- [Thatcher Ulrich - Logarithmic Depth Buffer](http://tulrich.com/geekstuff/log_depth_buffer.txt) (we used the function from here)