return {
    name = 'GlyphData',
    description = 'A GlyphData represents a drawable symbol of a font Rasterizer.',
    supertypes = {
        'Data',
        'Object',
    },
    functions = {
        {
            name = 'getAdvance',
            description = 'Gets glyph advance.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'advance',
                            description = 'Glyph advance.'
                        },
                    },
                },
            },
        },
    },
}