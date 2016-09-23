return {
    name = 'Font',
    description = 'Defines the shape of characters than can be drawn onto the screen.',
    constructors = {
        'newFont',
        'newImageFont',
        'setNewFont'
    },
    functions = {
        {
            name = 'getAscent',
            description = 'Gets the ascent of the Font. The ascent spans the distance between the baseline and the top of the glyph that reaches farthest from the baseline.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ascent',
                            description = 'The ascent of the Font in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getBaseline',
            description = 'Gets the baseline of the Font. Most scripts share the notion of a baseline: an imaginary horizontal line on which characters rest. In some scripts, parts of glyphs lie below the baseline.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'baseline',
                            description = 'The baseline of the Font in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDescent',
            description = 'Gets the descent of the Font. The descent spans the distance between the baseline and the lowest descending glyph in a typeface.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'descent',
                            description = 'The descent of the Font in pixels.'
                        }
                    }
                }
            }
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
                            description = 'Filter mode used when minifying the font.'
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when magnifying the font.'
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of anisotropic filtering used.'
                        }
                    }
                }
            }
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the Font. The height of the font is the size including any spacing; the height which it will need.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Font in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getLineHeight',
            description = 'Gets the line height. This will be the value previously set by Font:setLineHeight, or 1.0 by default.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The current line height.'
                        }
                    }
                }
            }
        },
        {
            name = 'getWidth',
            description = 'Determines the horizontal size a line of text needs. Does not support line-breaks.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'line',
                            description = 'A line of text.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the line.'
                        }
                    }
                }
            }
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
                            description = 'The text that will be wrapped.'
                        },
                        {
                            type = 'number',
                            name = 'wraplimit',
                            description = 'The maximum width in pixels of each line that text is allowed before wrapping.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The maximum width of the wrapped text.'
                        },
                        {
                            type = 'table',
                            name = 'wrappedtext',
                            description = 'A sequence containing each line of text that was wrapped.'
                        }
                    }
                }
            }
        },
        {
            name = 'hasGlyphs',
            description = 'Gets whether the font can render a particular character.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'character',
                            description = 'A unicode character.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasglyph',
                            description = 'Whether the font can render the glyph represented by the character.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'codepoint',
                            description = 'A unicode codepoint number.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasglyph',
                            description = 'Whether the font can render the glyph represented by the codepoint number.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFallbacks',
            description = 'Sets the fallback fonts. When the Font doesn\'t contain a glyph, it will substitute the glyph from the next subsequent fallback Fonts. This is akin to setting a "font stack" in Cascading Style Sheets (CSS).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Font',
                            name = 'fallbackfont1',
                            description = 'The first fallback Font to use.'
                        },
                        {
                            type = 'Font',
                            name = '...',
                            description = 'Additional fallback Fonts.'
                        }
                    }
                }
            }
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
                            description = 'How to scale a font down.'
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            default = 'min',
                            description = 'How to scale a font up.'
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            default = '1',
                            description = 'Maximum amount of anisotropic filtering used.'
                        }
                    }
                }
            }
        },
        {
            name = 'setLineHeight',
            description = 'Sets the line height. When rendering the font in lines the actual height will be determined by the line height multiplied by the height of the font. The default is 1.0.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The new line height.'
                        }
                    }
                }
            }
        }
    },
    supertypes = {
        'Object'
    }
}
