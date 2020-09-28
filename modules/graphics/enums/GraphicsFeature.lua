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
    },
}