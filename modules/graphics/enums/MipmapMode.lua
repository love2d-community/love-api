return {
    name = 'MipmapMode',
    description = 'Controls whether a Canvas has mipmaps, and its behaviour when it does.',
    constants = {
        {
            name = 'none',
            description = 'The Canvas has no mipmaps.',
        },
        {
            name = 'auto',
            description = 'The Canvas has mipmaps. love.graphics.setCanvas can be used to render to a specific mipmap level, or Canvas:generateMipmaps can (re-)compute all mipmap levels based on the base level.',
        },
        {
            name = 'manual',
            description = 'The Canvas has mipmaps, and all mipmap levels will automatically be recomputed when switching away from the Canvas with love.graphics.setCanvas.',
        },
    },
}