local path = (...):match('(.-)[^%./]+$')

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
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the potentially compressed image file.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'compressed',
                            description = 'Whether the file can be loaded as CompressedImageData or not.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'A FileData potentially containing a compressed image.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'compressed',
                            description = 'Whether the FileData can be loaded as CompressedImageData or not.',
                        },
                    },
                },
            },
        },
        {
            name = 'newCompressedData',
            description = 'Create a new CompressedImageData object from a compressed image file. LÖVE supports several compressed texture formats, enumerated in the CompressedImageFormat page.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the compressed image file.',
                        },
                    },
                    returns = {
                        {
                            type = 'CompressedImageData',
                            name = 'compressedImageData',
                            description = 'The new CompressedImageData object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'A FileData containing a compressed image.',
                        },
                    },
                    returns = {
                        {
                            type = 'CompressedImageData',
                            name = 'compressedImageData',
                            description = 'The new CompressedImageData object.',
                        },
                    },
                },
            },
        },
        {
            name = 'newImageData',
            description = 'Creates a new ImageData object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the ImageData.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the ImageData.',
                        },
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new blank ImageData object. Each pixel\'s color values, (including the alpha values!) will be set to zero.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the ImageData.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the ImageData.',
                        },
                        {
                            type = 'PixelFormat',
                            name = 'format',
                            description = 'The pixel format of the ImageData.',
                            default = '\'rgba8\'',
                        },
                        {
                            type = 'string',
                            name = 'data',
                            description = 'Optional raw byte data to load into the ImageData, in the format specified by \'\'format\'\'.',
                            default = 'nil',
                        },
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the ImageData.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the ImageData.',
                        },
                        {
                            type = 'string',
                            name = 'data',
                            description = 'The data to load into the ImageData (RGBA bytes, left to right and top to bottom).',
                        },
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the image file.',
                        },
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'filedata',
                            description = 'The encoded file data to decode into image data.',
                        },
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.CompressedImageFormat'),
        require(path .. 'enums.ImageFormat'),
        require(path .. 'enums.PixelFormat'),
    },
}