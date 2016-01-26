local path = (...):match('(.-)[^%.]+$') .. '.'

return {
    name = 'image',
    description = 'Provides an interface to decode encoded image data.',
    types = {
        require(path .. 'types.CompressedImageData'),
        require(path .. 'types.ImageData'),
    },
    functions = {
        {
            name = 'isCompressed',
            description = 'Determines whether a file can be loaded as CompressedImageData.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'file',
                            name = 'file',
                            description = 'The file path/File/FileData of the potentially compressed image file.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'compressed',
                            description = 'Whether the file can be loaded as CompressedImageData or not.'
                        }
                    }
                }
            }
        },
        {
            name = 'newCompressedData',
            description = 'Create a new CompressedImageData object from a compressed image file. LÖVE supports several compressed texture formats, enumerated in the CompressedImageFormat page.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'file',
                            name = 'file',
                            description = 'The file path/File/FileData of the compressed image file.'
                        }
                    },
                    returns = {
                        {
                            type = 'CompressedImageData',
                            name = 'compressedImageData',
                            description = 'The new CompressedImageData object.'
                        }
                    }
                }
            }
        },
        {
            name = 'newImageData',
            description = 'Create a new ImageData object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'file',
                            name = 'file',
                            description = 'The file path/File/FileData of the image file.'
                        }
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the ImageData.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the ImageData.'
                        },
                        {
                            type = 'string',
                            name = 'data',
                            default = 'nil',
                            description = 'The data to load into the ImageData.'
                        }
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        require(path .. 'enums.CompressedImageFormat'),
        require(path .. 'enums.ImageFormat')
    }
}
