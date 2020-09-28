local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Rasterizer',
    description = 'A Rasterizer handles font rendering, containing the font data (image or TrueType font) and drawable glyphs.',
    constructors = {
        'newTrueTypeRasterizer',
        'newRasterizer',
        'newImageRasterizer',
        'newBMFontRasterizer',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getAdvance',
            description = 'Gets font advance.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'advance',
                            description = 'Font advance.',
                        },
                    },
                },
            },
        },
        {
            name = 'getAscent',
            description = 'Gets ascent height.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Ascent height.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDescent',
            description = 'Gets descent height.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Descent height.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGlyphCount',
            description = 'Gets number of glyphs in font.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'Glyphs count.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGlyphData',
            description = 'Gets glyph data of a specified glyph.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'glyph',
                            description = 'Glyph',
                        },
                    },
                    returns = {
                        {
                            type = 'GlyphData',
                            name = 'glyphData',
                            description = 'Glyph data',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'glyphNumber',
                            description = 'Glyph number',
                        },
                    },
                    returns = {
                        {
                            type = 'GlyphData',
                            name = 'glyphData',
                            description = 'Glyph data',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets font height.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Font height',
                        },
                    },
                },
            },
        },
        {
            name = 'getLineHeight',
            description = 'Gets line height of a font.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Line height of a font.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasGlyphs',
            description = 'Checks if font contains specified glyphs.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string or number',
                            name = 'glyph1',
                            description = 'Glyph',
                        },
                        {
                            type = 'string or number',
                            name = 'glyph2',
                            description = 'Glyph',
                        },
                        {
                            type = 'string or number',
                            name = '...',
                            description = 'Additional glyphs',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasGlyphs',
                            description = 'Whatever font contains specified glyphs.',
                        },
                    },
                },
            },
        },
    },
}