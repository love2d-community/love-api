return {
    name = 'CanvasFormat',
    description = 'Canvas formats.',
    constants = {
        {
            name = 'normal',
            description = 'The default Canvas format - usually an alias for the rgba8 format, or the srgb format if gamma-correct rendering is enabled in LÖVE 0.10.0 and newer.'
        },
        {
            name = 'hdr',
            description = 'A format suitable for high dynamic range content - an alias for the rgba16f format, normally.'
        },
        {
            name = 'rgba8',
            description = '8 bits per channel (32 bpp) RGBA. Color channel values range from 0-255 (0-1 in shaders).'
        },
        {
            name = 'rgba4',
            description = '4 bits per channel (16 bpp) RGBA.'
        },
        {
            name = 'rgb5a1',
            description = 'RGB with 5 bits each, and a 1-bit alpha channel (16 bpp).'
        },
        {
            name = 'rgb565',
            description = 'RGB with 5, 6, and 5 bits each, respectively (16 bpp). There is no alpha channel in this format.'
        },
        {
            name = 'rgb10a2',
            description = 'RGB with 10 bits per channel, and a 2-bit alpha channel (32 bpp).'
        },
        {
            name = 'rgba16f',
            description = 'Floating point RGBA with 16 bits per channel (64 bpp). Color values can range from [-65504, +65504].'
        },
        {
            name = 'rgba32f',
            description = 'Floating point RGBA with 32 bits per channel (128 bpp).'
        },
        {
            name = 'rg11b10f',
            description = 'Floating point RGB with 11 bits in the red and green channels, and 10 bits in the blue channel (32 bpp). There is no alpha channel. Color values can range from [0, +65024].'
        },
        {
            name = 'srgb',
            description = 'The same as rgba8, but the Canvas is interpreted as being in the sRGB color space. Everything drawn to the Canvas will be converted from linear RGB to sRGB. When the Canvas is drawn (or used in a shader), it will be decoded from sRGB to linear RGB. This reduces color banding when doing gamma-correct rendering, since sRGB encoding has more precision than linear RGB for darker colors.'
        },
        {
            name = 'r8',
            description = 'Single-channel (red component) format (8 bpp).'
        },
        {
            name = 'rg8',
            description = 'Two channels (red and green components) with 8 bits per channel (16 bpp).'
        },
        {
            name = 'r16f',
            description = 'Floating point single-channel format (16 bpp). Color values can range from [-65504, +65504].'
        },
        {
            name = 'rg16f',
            description = 'Floating point two-channel format with 16 bits per channel (32 bpp). Color values can range from [-65504, +65504].'
        },
        {
            name = 'r32f',
            description = 'Floating point single-channel format (32 bpp).'
        },
        {
            name = 'rg32f',
            description = 'Floating point two-channel format with 32 bits per channel (64 bpp).'
        }
    }
}
