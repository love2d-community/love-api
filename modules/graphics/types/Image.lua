local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Image',
    description = 'Drawable image type.',
    supertypes = {
        'Texture',
        'Drawable',
        'Object',
    },
    functions = {
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the Image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Image, in pixels.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Image, in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFilter',
            description = 'Gets the filter mode for an image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode used when minifying the image.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when magnifying the image.',
                        },
                    },
                },
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode used when minifying the image.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when magnifying the image.',
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
            name = 'getFlags',
            description = 'Gets the flags used when the image was created.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'A table with ImageFlag keys.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the Image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Image, in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the Image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Image, in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWrap',
            description = 'Gets the wrapping properties of an Image.\n\nThis function returns the currently set horizontal and vertical wrapping modes for the image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'WrapMode',
                            name = 'horiz',
                            description = 'Horizontal wrapping mode of the image.',
                        },
                        {
                            type = 'WrapMode',
                            name = 'vert',
                            description = 'Vertical wrapping mode of the image.',
                        },
                    },
                },
            },
        },
        {
            name = 'replacePixels',
            description = 'Replace the contents of an Image.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'data',
                            description = 'The new ImageData to replace the contents with.',
                        },
                        {
                            type = 'number',
                            name = 'slice',
                            description = 'Which cubemap face, array index, or volume layer to replace, if applicable.',
                        },
                        {
                            type = 'number',
                            name = 'mipmap',
                            description = 'The mimap level to replace, if the Image has mipmaps.',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-offset in pixels from the top-left of the image to replace. The given ImageData\'s width plus this value must not be greater than the pixel width of the Image\'s specified mipmap level.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-offset in pixels from the top-left of the image to replace. The given ImageData\'s height plus this value must not be greater than the pixel height of the Image\'s specified mipmap level.',
                            default = '0',
                        },
                        {
                            type = 'boolean',
                            name = 'reloadmipmaps',
                            description = 'Whether to generate new mipmaps after replacing the Image\'s pixels. True by default if the Image was created with automatically generated mipmaps, false by default otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFilter',
            description = 'Sets the filter mode for an image.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'How to scale an image down.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'How to scale an image up.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'How to scale an image down.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'How to scale an image up.',
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
            name = 'setWrap',
            description = 'Sets the wrapping properties of an Image.\n\nThis function sets the way an Image is repeated when it is drawn with a  Quad that is larger than the image\'s extent. An image may be clamped or set to repeat in both horizontal and vertical directions. Clamped images appear only once, but repeated ones repeat as many times as there is room in the Quad.\n\nN.B. If you use a Quad that is larger than the image extent and do not use repeated tiling, there may be an unwanted visual effect of the image stretching all the way to fill the Quad. If this is the case, setting Image:setWrap(\'repeat\', \'repeat\') for all the images to be repeated, and using Quads of appropriate size will result in the best visual appearance.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'WrapMode',
                            name = 'horiz',
                            description = 'Horizontal wrapping mode of the image.',
                        },
                        {
                            type = 'WrapMode',
                            name = 'vert',
                            description = 'Vertical wrapping mode of the image.',
                        },
                    },
                },
            },
        },
    },
}