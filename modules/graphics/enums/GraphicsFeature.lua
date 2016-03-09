return {
    name = 'GraphicsFeature',
    description = 'Graphics features that can be checked for with love.graphics.getSupported.',
    constants = {
        {
            name = 'clampzero',
            description = 'Whether the "clampzero" WrapMode is supported.'
        },
        {
            name = 'lighten',
            description = 'Whether the "lighten" and "darken" BlendModes are supported.'
        },
        {
            name = 'multicanvasformats',
            description = 'Whether multiple Canvases with different formats can be used in the same love.graphics.setCanvas call.'
        }
    }
}
