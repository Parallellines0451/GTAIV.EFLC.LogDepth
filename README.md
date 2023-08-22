# GTAIV.LogDepth
Logarithmic depth buffer implementation for GTA IV to fix z-fighting.

These shaders are meant to be used as an editing base, so no other tweaks have been incorporated. Supported versions are 1.0.7.0, 1.0.8.0 and CE.

Notable articles:

- [Brano Kemen - Maximizing Depth Buffer Range and Precision](https://outerra.blogspot.com/2012/11/maximizing-depth-buffer-range-and.html)
- [Thatcher Ulrich - Logarithmic Depth Buffer](http://tulrich.com/geekstuff/log_depth_buffer.txt)

Functions used:
- log_depth = log2(W_clip / near) / log2(far / near)
- W_clip = pow((far / near), log_depth) * near
- linear_depth = (far * (W_clip - near)) / (W_clip * (far - near))