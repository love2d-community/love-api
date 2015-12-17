return {
    name = 'GraphicsFeature',
    description = 'Graphics features that can be checked for with love.graphics.getSupported (love.graphics.isSupported in versions prior to 0.10.0).',
    constants = {
        {
            name = 'clampzero',
            description = 'Whether the "clampzero" WrapMode is supported.'
        },
        {
            name = 'multicanvasformats',
            description = 'Whether multiple Canvases with different formats can be used in the same love.graphics.setCanvas call.'
        }
    }
}
