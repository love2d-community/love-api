local path = (...):match('(.-)[^%./]+$')

return {
    name = 'CompressedImageData',
    description = 'Represents compressed image data designed to stay compressed in RAM.\n\nCompressedImageData encompasses standard compressed texture formats such as  DXT1, DXT5, and BC5 / 3Dc.\n\nYou can\'t draw CompressedImageData directly to the screen. See Image for that.',
    constructors = {
        'newCompressedData',
    },
    supertypes = {
        'Data',
        'Object',
    },
    functions = {
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the CompressedImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the CompressedImageData.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the CompressedImageData.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'level',
                            description = 'A mipmap level. Must be in the range of CompressedImageData:getMipmapCount().',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of a specific mipmap level of the CompressedImageData.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of a specific mipmap level of the CompressedImageData.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFormat',
            description = 'Gets the format of the CompressedImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'CompressedImageFormat',
                            name = 'format',
                            description = 'The format of the CompressedImageData.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the CompressedImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the CompressedImageData.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'level',
                            description = 'A mipmap level. Must be in the range of CompressedImageData:getMipmapCount().',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of a specific mipmap level of the CompressedImageData.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMipmapCount',
            description = 'Gets the number of mipmap levels in the CompressedImageData. The base mipmap level (original image) is included in the count.',
            variants = {
                {
                    description = 'Mipmap filtering cannot be activated for an Image:setMipmapFilter will error. Most tools which can create compressed textures are able to automatically generate mipmaps for them in the same file.',
                    returns = {
                        {
                            type = 'number',
                            name = 'mipmaps',
                            description = 'The number of mipmap levels stored in the CompressedImageData.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the CompressedImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the CompressedImageData.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'level',
                            description = 'A mipmap level. Must be in the range of  CompressedImageData:getMipmapCount().',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of a specific mipmap level of the CompressedImageData.',
                        },
                    },
                },
            },
        },
    },
}