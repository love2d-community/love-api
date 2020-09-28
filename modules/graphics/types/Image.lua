local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Image',
    description = 'Drawable image type.',
    constructors = {
        'newImage',
        'newVolumeImage',
        'newCubeImage',
        'newArrayImage',
    },
    supertypes = {
        'Texture',
        'Drawable',
        'Object',
    },
    functions = {
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
            name = 'isCompressed',
            description = 'Gets whether the Image was created from CompressedData.\n\nCompressed images take up less space in VRAM, and drawing a compressed image will generally be more efficient than drawing one created from raw pixel data.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'compressed',
                            description = 'Whether the Image is stored as a compressed texture on the GPU.',
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
    },
}