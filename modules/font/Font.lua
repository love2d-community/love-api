local path = (...):match('(.-)[^%./]+$')

return {
    name = 'font',
    description = 'Allows you to work with fonts.',
	types = {
        require(path .. '.types.GlyphData'),
		require(path .. '.types.Rasterizer'),
    },
    functions = {
        {
            name = 'newBMFontRasterizer',
            description = 'Creates a new BMFont Rasterizer.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The image data containing the drawable pictures of font glyphs.',
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'The sequence of glyphs in the ImageData.',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'DPI scale.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'fileName',
                            description = 'The path to file containing the drawable pictures of font glyphs.',
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'The sequence of glyphs in the ImageData.',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'DPI scale.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
            },
        },
        {
            name = 'newGlyphData',
            description = 'Creates a new GlyphData.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The Rasterizer containing the font.',
                        },
                        {
                            type = 'number',
                            name = 'glyph',
                            description = 'The character code of the glyph.',
                        },
                    },
                },
            },
        },
        {
            name = 'newImageRasterizer',
            description = 'Creates a new Image Rasterizer.',
            variants = {
                {
                    description = 'Create an ImageRasterizer from the image data.',
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'Font image data.',
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'String containing font glyphs.',
                        },
                        {
                            type = 'number',
                            name = 'extraSpacing',
                            description = 'Font extra spacing.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'Font DPI scale.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
            },
        },
        {
            name = 'newRasterizer',
            description = 'Creates a new Rasterizer.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The font file.',
                        },
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'data',
                            description = 'The FileData of the font file.',
                        },
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    description = 'Create a TrueTypeRasterizer with the default font.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The font size.',
                            default = '12',
                        },
                        {
                            type = 'HintingMode',
                            name = 'hinting',
                            description = 'True Type hinting mode.',
                            default = '\'normal\'',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The font DPI scale.',
                            default = 'love.window.getDPIScale()',
                        }
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    description = 'Create a TrueTypeRasterizer with custom font.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'fileName',
                            description = 'Path to font file.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The font size.',
                            default = '12',
                        },
                        {
                            type = 'HintingMode',
                            name = 'hinting',
                            description = 'True Type hinting mode.',
                            default = '\'normal\'',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The font DPI scale.',
                            default = 'love.window.getDPIScale()',
                        }
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    description = 'Create a TrueTypeRasterizer with custom font.',
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'File data containing font.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The font size.',
                            default = '12',
                        },
                        {
                            type = 'HintingMode',
                            name = 'hinting',
                            description = 'True Type hinting mode.',
                            default = '\'normal\'',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The font DPI scale.',
                            default = 'love.window.getDPIScale()',
                        }
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    description = 'Creates a new BMFont Rasterizer.',
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The image data containing the drawable pictures of font glyphs.',
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'The sequence of glyphs in the ImageData.',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'DPI scale.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    description = 'Creates a new BMFont Rasterizer.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'fileName',
                            description = 'The path to file containing the drawable pictures of font glyphs.',
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'The sequence of glyphs in the ImageData.',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'DPI scale.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
            },
        },
        {
            name = 'newTrueTypeRasterizer',
            description = 'Creates a new TrueType Rasterizer.',
            variants = {
                {
                    description = 'Create a TrueTypeRasterizer with the default font.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The font size.',
                            default = '12',
                        },
                        {
                            type = 'HintingMode',
                            name = 'hinting',
                            description = 'True Type hinting mode.',
                            default = '\'normal\'',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The font DPI scale.',
                            default = 'love.window.getDPIScale()',
                        }
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    description = 'Create a TrueTypeRasterizer with custom font.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'fileName',
                            description = 'Path to font file.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The font size.',
                            default = '12',
                        },
                        {
                            type = 'HintingMode',
                            name = 'hinting',
                            description = 'True Type hinting mode.',
                            default = '\'normal\'',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The font DPI scale.',
                            default = 'love.window.getDPIScale()',
                        }
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
                {
                    description = 'Create a TrueTypeRasterizer with custom font.',
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'File data containing font.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The font size.',
                            default = '12',
                        },
                        {
                            type = 'HintingMode',
                            name = 'hinting',
                            description = 'True Type hinting mode.',
                            default = '\'normal\'',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The font DPI scale.',
                            default = 'love.window.getDPIScale()',
                        }
                    },
                    returns = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'The rasterizer.',
                        },
                    },
                },
            },
        },
    },
	enums = {
        require(path .. '.enums.HintingMode'),
	}
}