return {
    name = 'TextureFormat',
    description = 'Canvas and Image texture formats.\n\nThe HDR format is most useful when combined with pixel shaders. Effects such as tonemapped HDR with bloom can be accomplished, or the canvas can be used to store arbitrary non-color data such as positions which are then interpreted and used in a shader, as long as you draw the right things to the canvas.\n\nThe sRGB format should only be used when doing gamma-correct rendering, which is an advanced topic and it\'s easy to get color-spaces mixed up. If you\'re not sure whether you need this, you might want to avoid it.\n\nNot all systems support the HDR and sRGB formats. Use love.graphics.isSupported to check before creating the Canvas or Image.',
    constants = {
        {
            name = 'normal',
            description = 'The default texture format: 8 bits per channel (32 bpp) RGBA.'
        },
        {
            name = 'hdr',
            description = 'Only usable in Canvases. The HDR texture format: floating point 16 bits per channel (64 bpp) RGBA.'
        },
        {
            name = 'srgb',
            description = 'The same as normal, but the texture is interpreted as being in the sRGB color space. It will be decoded from sRGB to linear RGB when drawn or sampled from in a shader. For Canvases, this will also convert everything drawn to the Canvas from linear RGB to sRGB.'
        }
    }
}
