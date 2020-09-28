local path = (...):match('(.-)[^%./]+$')

return {
    name = 'PixelFormat',
    description = 'Pixel formats for Textures, ImageData, and CompressedImageData.',
    constants = {
        {
            name = 'unknown',
            description = 'Indicates unknown pixel format, used internally.',
        },
        {
            name = 'normal',
            description = 'Alias for rgba8, or srgba8 if gamma-correct rendering is enabled.',
        },
        {
            name = 'hdr',
            description = 'A format suitable for high dynamic range content - an alias for the rgba16f format, normally.',
        },
        {
            name = 'r8',
            description = 'Single-channel (red component) format (8 bpp).',
        },
        {
            name = 'rg8',
            description = 'Two channels (red and green components) with 8 bits per channel (16 bpp).',
        },
        {
            name = 'rgba8',
            description = '8 bits per channel (32 bpp) RGBA. Color channel values range from 0-255 (0-1 in shaders).',
        },
        {
            name = 'srgba8',
            description = 'gamma-correct version of rgba8.',
        },
        {
            name = 'r16',
            description = 'Single-channel (red component) format (16 bpp).',
        },
        {
            name = 'rg16',
            description = 'Two channels (red and green components) with 16 bits per channel (32 bpp).',
        },
        {
            name = 'rgba16',
            description = '16 bits per channel (64 bpp) RGBA. Color channel values range from 0-65535 (0-1 in shaders).',
        },
        {
            name = 'r16f',
            description = 'Floating point single-channel format (16 bpp). Color values can range from [-65504, +65504].',
        },
        {
            name = 'rg16f',
            description = 'Floating point two-channel format with 16 bits per channel (32 bpp). Color values can range from [-65504, +65504].',
        },
        {
            name = 'rgba16f',
            description = 'Floating point RGBA with 16 bits per channel (64 bpp). Color values can range from [-65504, +65504].',
        },
        {
            name = 'r32f',
            description = 'Floating point single-channel format (32 bpp).',
        },
        {
            name = 'rg32f',
            description = 'Floating point two-channel format with 32 bits per channel (64 bpp).',
        },
        {
            name = 'rgba32f',
            description = 'Floating point RGBA with 32 bits per channel (128 bpp).',
        },
        {
            name = 'la8',
            description = 'Same as rg8, but accessed as (L, L, L, A)',
        },
        {
            name = 'rgba4',
            description = '4 bits per channel (16 bpp) RGBA.',
        },
        {
            name = 'rgb5a1',
            description = 'RGB with 5 bits each, and a 1-bit alpha channel (16 bpp).',
        },
        {
            name = 'rgb565',
            description = 'RGB with 5, 6, and 5 bits each, respectively (16 bpp). There is no alpha channel in this format.',
        },
        {
            name = 'rgb10a2',
            description = 'RGB with 10 bits per channel, and a 2-bit alpha channel (32 bpp).',
        },
        {
            name = 'rg11b10f',
            description = 'Floating point RGB with 11 bits in the red and green channels, and 10 bits in the blue channel (32 bpp). There is no alpha channel. Color values can range from [0, +65024].',
        },
        {
            name = 'stencil8',
            description = 'No depth buffer and 8-bit stencil buffer.'
        },
        {
            name = 'depth16',
            description = '16-bit depth buffer and no stencil buffer.',
        },
        {
            name = 'depth24',
            description = '24-bit depth buffer and no stencil buffer.',
        },
        {
            name = 'depth32f',
            description = '32-bit float depth buffer and no stencil buffer.',
        },
        {
            name = 'depth24stencil8',
            description = '24-bit depth buffer and 8-bit stencil buffer.',
        },
        {
            name = 'depth32fstencil8',
            description = '32-bit float depth buffer and 8-bit stencil buffer.',
        },
        {
            name = 'DXT1',
            description = 'The DXT1 format. RGB data at 4 bits per pixel (compared to 32 bits for ImageData and regular Images.) Suitable for fully opaque images on desktop systems.',
        },
        {
            name = 'DXT3',
            description = 'The DXT3 format. RGBA data at 8 bits per pixel. Smooth variations in opacity do not mix well with this format.',
        },
        {
            name = 'DXT5',
            description = 'The DXT5 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on desktop systems.',
        },
        {
            name = 'BC4',
            description = 'The BC4 format (also known as 3Dc+ or ATI1.) Stores just the red channel, at 4 bits per pixel.',
        },
        {
            name = 'BC4s',
            description = 'The signed variant of the BC4 format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.',
        },
        {
            name = 'BC5',
            description = 'The BC5 format (also known as 3Dc or ATI2.) Stores red and green channels at 8 bits per pixel.',
        },
        {
            name = 'BC5s',
            description = 'The signed variant of the BC5 format.',
        },
        {
            name = 'BC6h',
            description = 'The BC6H format. Stores half-precision floating-point RGB data in the range of 65504 at 8 bits per pixel. Suitable for HDR images on desktop systems.',
        },
        {
            name = 'BC6hs',
            description = 'The signed variant of the BC6H format. Stores RGB data in the range of +65504.',
        },
        {
            name = 'BC7',
            description = 'The BC7 format (also known as BPTC.) Stores RGB or RGBA data at 8 bits per pixel.',
        },
        {
            name = 'ETC1',
            description = 'The ETC1 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on older Android devices.',
        },
        {
            name = 'ETC2rgb',
            description = 'The RGB variant of the ETC2 format. RGB data at 4 bits per pixel. Suitable for fully opaque images on newer mobile devices.',
        },
        {
            name = 'ETC2rgba',
            description = 'The RGBA variant of the ETC2 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity on newer mobile devices.',
        },
        {
            name = 'ETC2rgba1',
            description = 'The RGBA variant of the ETC2 format where pixels are either fully transparent or fully opaque. RGBA data at 4 bits per pixel.',
        },
        {
            name = 'EACr',
            description = 'The single-channel variant of the EAC format. Stores just the red channel, at 4 bits per pixel.',
        },
        {
            name = 'EACrs',
            description = 'The signed single-channel variant of the EAC format. Same as above but pixel values in the texture are in the range of 1 instead of 1 in shaders.',
        },
        {
            name = 'EACrg',
            description = 'The two-channel variant of the EAC format. Stores red and green channels at 8 bits per pixel.',
        },
        {
            name = 'EACrgs',
            description = 'The signed two-channel variant of the EAC format.',
        },
        {
            name = 'PVR1rgb2',
            description = 'The 2 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 2 bits per pixel. Textures compressed with PVRTC1 formats must be square and power-of-two sized.',
        },
        {
            name = 'PVR1rgb4',
            description = 'The 4 bit per pixel RGB variant of the PVRTC1 format. Stores RGB data at 4 bits per pixel.',
        },
        {
            name = 'PVR1rgba2',
            description = 'The 2 bit per pixel RGBA variant of the PVRTC1 format.',
        },
        {
            name = 'PVR1rgba4',
            description = 'The 4 bit per pixel RGBA variant of the PVRTC1 format.',
        },
        {
            name = 'ASTC4x4',
            description = 'The 4x4 pixels per block variant of the ASTC format. RGBA data at 8 bits per pixel.',
        },
        {
            name = 'ASTC5x4',
            description = 'The 5x4 pixels per block variant of the ASTC format. RGBA data at 6.4 bits per pixel.',
        },
        {
            name = 'ASTC5x5',
            description = 'The 5x5 pixels per block variant of the ASTC format. RGBA data at 5.12 bits per pixel.',
        },
        {
            name = 'ASTC6x5',
            description = 'The 6x5 pixels per block variant of the ASTC format. RGBA data at 4.27 bits per pixel.',
        },
        {
            name = 'ASTC6x6',
            description = 'The 6x6 pixels per block variant of the ASTC format. RGBA data at 3.56 bits per pixel.',
        },
        {
            name = 'ASTC8x5',
            description = 'The 8x5 pixels per block variant of the ASTC format. RGBA data at 3.2 bits per pixel.',
        },
        {
            name = 'ASTC8x6',
            description = 'The 8x6 pixels per block variant of the ASTC format. RGBA data at 2.67 bits per pixel.',
        },
        {
            name = 'ASTC8x8',
            description = 'The 8x8 pixels per block variant of the ASTC format. RGBA data at 2 bits per pixel.',
        },
        {
            name = 'ASTC10x5',
            description = 'The 10x5 pixels per block variant of the ASTC format. RGBA data at 2.56 bits per pixel.',
        },
        {
            name = 'ASTC10x6',
            description = 'The 10x6 pixels per block variant of the ASTC format. RGBA data at 2.13 bits per pixel.',
        },
        {
            name = 'ASTC10x8',
            description = 'The 10x8 pixels per block variant of the ASTC format. RGBA data at 1.6 bits per pixel.',
        },
        {
            name = 'ASTC10x10',
            description = 'The 10x10 pixels per block variant of the ASTC format. RGBA data at 1.28 bits per pixel.',
        },
        {
            name = 'ASTC12x10',
            description = 'The 12x10 pixels per block variant of the ASTC format. RGBA data at 1.07 bits per pixel.',
        },
        {
            name = 'ASTC12x12',
            description = 'The 12x12 pixels per block variant of the ASTC format. RGBA data at 0.89 bits per pixel.',
        },
    },
}