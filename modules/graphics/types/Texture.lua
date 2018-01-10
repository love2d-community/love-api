return {
    name = 'Texture',
    description = 'Superclass for drawable objects which represent a texture. All Textures can be drawn with Quads. This is an abstract type that can\'t be created directly.',
    constructors = {},
    functions = {
        {
            name = 'getDepth',
            description = 'Gets the depth of a Volume Texture. Returns 1 for 2D, Cubemap, and Array textures.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'depth',
                            description = 'The depth of the volume Texture.'
                        }
                    }
                }
            }
        },
        {
            name = 'getMipmapCount',
            description = 'Gets the number of mipmaps contained in the Texture. If the texture was not created with mipmaps, it will return 1.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'mipmaps',
                            description = 'The number of mipmaps in the Texture.'
                        }
                    }
                }
            }
        },
        {
            name = 'getTextureType',
            description = 'Gets the type of the Texture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'TextureType',
                            name = 'texturetype',
                            description = 'The type of the Texture.'
                        }
                    }
                }
            }
        }
    },
    parenttype = 'Drawable',
    supertypes = {
        'Drawable',
        'Object'
    },
    subtypes = {
        'Canvas',
        'Image'
    }
}
