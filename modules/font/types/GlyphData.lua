local path = (...):match('(.-)[^%./]+$')

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
                            description = 'Glyph advance.',
                        },
                    },
                },
            },
        },
        {
            name = 'getBearing',
            description = 'Gets glyph bearing.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'bx',
                            description = 'Glyph bearing X.',
                        },
                        {
                            type = 'number',
                            name = 'by',
                            description = 'Glyph bearing Y.',
                        },
                    },
                },
            },
        },
        {
            name = 'getBoundingBox',
            description = 'Gets glyph bounding box.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Glyph position x.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Glyph position y.',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Glyph width.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Glyph height.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDimensions',
            description = 'Gets glyph dimensions.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Glyph width.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Glyph height.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFormat',
            description = 'Gets glyph pixel format.',
            variants = {
                {
                    returns = {
                        {
                            type = 'PixelFormat',
                            name = 'format',
                            description = 'Glyph pixel format.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGlyph',
            description = 'Gets glyph number.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'glyph',
                            description = 'Glyph number.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGlyphString',
            description = 'Gets glyph string.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'glyph',
                            description = 'Glyph string.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets glyph height.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Glyph height.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Gets glyph width.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Glyph width.',
                        },
                    },
                },
            },
        },
    },
}