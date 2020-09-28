local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Font',
    description = 'Defines the shape of characters that can be drawn onto the screen.',
    constructors = {
        'getFont',
        'newFont',
        'setNewFont',
        'newImageFont',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getAscent',
            description = 'Gets the ascent of the Font.\n\nThe ascent spans the distance between the baseline and the top of the glyph that reaches farthest from the baseline.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ascent',
                            description = 'The ascent of the Font in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getBaseline',
            description = 'Gets the baseline of the Font.\n\nMost scripts share the notion of a baseline: an imaginary horizontal line on which characters rest. In some scripts, parts of glyphs lie below the baseline.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'baseline',
                            description = 'The baseline of the Font in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDPIScale',
            description = 'Gets the DPI scale factor of the Font.\n\nThe DPI scale factor represents relative pixel density. A DPI scale factor of 2 means the font\'s glyphs have twice the pixel density in each dimension (4 times as many pixels in the same area) compared to a font with a DPI scale factor of 1.\n\nThe font size of TrueType fonts is scaled internally by the font\'s specified DPI scale factor. By default, LÖVE uses the screen\'s DPI scale factor when creating TrueType fonts.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The DPI scale factor of the Font.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDescent',
            description = 'Gets the descent of the Font.\n\nThe descent spans the distance between the baseline and the lowest descending glyph in a typeface.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'descent',
                            description = 'The descent of the Font in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFilter',
            description = 'Gets the filter mode for a font.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode used when minifying the font.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when magnifying the font.',
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of anisotropic filtering used.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the Font.\n\nThe height of the font is the size including any spacing; the height which it will need.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Font in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLineHeight',
            description = 'Gets the line height.\n\nThis will be the value previously set by Font:setLineHeight, or 1.0 by default.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The current line height.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Determines the maximum width (accounting for newlines) taken by the given string.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'A string.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the text.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWrap',
            description = 'Gets formatting information for text, given a wrap limit.\n\nThis function accounts for newlines correctly (i.e. \'\\n\').',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The text that will be wrapped.',
                        },
                        {
                            type = 'number',
                            name = 'wraplimit',
                            description = 'The maximum width in pixels of each line that \'\'text\'\' is allowed before wrapping.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The maximum width of the wrapped text.',
                        },
                        {
                            type = 'table',
                            name = 'wrappedtext',
                            description = 'A sequence containing each line of text that was wrapped.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasGlyphs',
            description = 'Gets whether the Font can render a character or string.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'A UTF-8 encoded unicode string.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasglyph',
                            description = 'Whether the font can render all the UTF-8 characters in the string.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'character1',
                            description = 'A unicode character.',
                        },
                        {
                            type = 'string',
                            name = 'character2',
                            description = 'Another unicode character.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasglyph',
                            description = 'Whether the font can render all the glyphs represented by the characters.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'codepoint1',
                            description = 'A unicode codepoint number.',
                        },
                        {
                            type = 'number',
                            name = 'codepoint2',
                            description = 'Another unicode codepoint number.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasglyph',
                            description = 'Whether the font can render all the glyphs represented by the codepoint numbers.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFallbacks',
            description = 'Sets the fallback fonts. When the Font doesn\'t contain a glyph, it will substitute the glyph from the next subsequent fallback Fonts. This is akin to setting a \'font stack\' in Cascading Style Sheets (CSS).',
            variants = {
                {
                    description = 'If this is called it should be before love.graphics.print, Font:getWrap, and other Font methods which use glyph positioning information are called.\n\nEvery fallback Font must be created from the same file type as the primary Font. For example, a Font created from a .ttf file can only use fallback Fonts that were created from .ttf files.',
                    arguments = {
                        {
                            type = 'Font',
                            name = 'fallbackfont1',
                            description = 'The first fallback Font to use.',
                        },
                        {
                            type = 'Font',
                            name = '...',
                            description = 'Additional fallback Fonts.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFilter',
            description = 'Sets the filter mode for a font.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'How to scale a font down.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'How to scale a font up.',
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of anisotropic filtering used.',
                            default = '1',
                        },
                    },
                },
            },
        },
        {
            name = 'setLineHeight',
            description = 'Sets the line height.\n\nWhen rendering the font in lines the actual height will be determined by the line height multiplied by the height of the font. The default is 1.0.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The new line height.',
                        },
                    },
                },
            },
        },
    },
}