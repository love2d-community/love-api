return {
    name = 'GraphicsFeature',
    description = 'Graphics features that can be checked for with love.graphics.getSupported.',
    constants = {
        {
            name = 'clampzero',
            description = 'Whether the "clampzero" WrapMode is supported.',
        },
        {
            name = 'lighten',
            description = 'Whether the "lighten" and "darken" BlendModes are supported.',
        },
        {
            name = 'multicanvasformats',
            description = 'Whether multiple formats can be used in the same love.graphics.setCanvas call.',
        },
        {
            name = 'glsl3',
            description = 'Whether GLSL 3 Shaders can be used.',
        },
        {
            name = 'instancing',
            description = 'Whether mesh instancing is supported.',
        },
        {
            name = 'fullnpot',
            description = 'Whether textures with non-power-of-two dimensions can use mipmapping and the \'repeat\' WrapMode.',
        },
        {
            name = 'pixelshaderhighp',
            description = 'Whether pixel shaders can use "highp" 32 bit floating point numbers (as opposed to just 16 bit or lower precision).',
        },
        {
            name = 'shaderderivatives',
            description = 'Whether shaders can use the dFdx, dFdy, and fwidth functions for computing derivatives.',
        },
        {
            name = 'canvas',
            description = 'Support for Canvas.',
        },
        {
            name = 'npot',
            description = 'Support for textures with non-power-of-two sizes. See PO2 Syndrome. ',
        },
        {
            name = 'subtractive',
            description = 'Support for the subtractive blend mode.',
        },
        {
            name = 'shader',
            description = 'Support for Shaders.',
        },
        {
            name = 'hdrcanvas',
            description = 'Support for HDR Canvases. Use love.graphics.getCanvasFormats instead.',
        },
        {
            name = 'multicanvas',
            description = 'Support for simultaneous rendering to at least 4 canvases at once, with love.graphics.setCanvas. Use love.graphics.getSystemLimits instead.',
        },
        {
            name = 'mipmap',
            description = 'Support for Mipmaps.',
        },
        {
            name = 'dxt',
            description = 'Support for DXT compressed images (see CompressedFormat.) Use love.graphics.getCompressedImageFormats instead.',
        },
        {
            name = 'bc5',
            description = 'Support for BC4 and BC5 compressed images. Use love.graphics.getCompressedImageFormats instead.',
        },
        {
            name = 'srgb',
            description = 'Support for gamma-correct rendering with the srgb window flag in Canvases and Images.',
        },
        {
            name = 'pixeleffect',
            description = 'Support for PixelEffects.',
        },
    },
}