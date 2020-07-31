return {
    name = 'Rasterizer',
    supertypes = {'Object',},
    functions = {
        {
            name = 'getAdvance',
            variants = {
                {
                    returns = {
                        {type = 'number'}
                    }
                }
            }
        },
        {
            name = 'getGlyphCount',
            variants = {
                {
                    returns = {
                        {type = 'number'}
                    }
                }
            }
        },
        {
            name = 'getGlyphData',
            variants = {
                {
                    arguments = {
                        {type = 'string', name = 'glyph'}
                    },
                    returns = {
                        {type = 'GlyphData'}
                    }
                },
                {
                    arguments = {
                        {type = 'number', name = 'glyphNumber'}
                    },
                    returns = {
                        {type = 'GlyphData'}
                    }
                }
            }
        },
        {
            name = 'hasGlyphs',
            variants = {
                {
                    arguments = {
                        {type = 'string or number', name = '...'}
                    },
                    returns = {
                        {type = 'boolean'}
                    }
                }
            }
        }
    }
}