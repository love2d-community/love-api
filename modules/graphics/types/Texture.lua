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
            name = 'getFormat',
            description = 'Gets the PixelFormat of the Texture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'PixelFormat',
                            name = 'format',
                            description = 'The pixel format the Texture was created with.'
                        }
                    }
                }
            }
        },
        {
            name = 'getLayerCount',
            description = 'Gets the number of layers / slices in an Array Texture. Returns 1 for 2D, Cubemap, and Volume textures.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'layers',
                            description = 'The number of layers in the Array Texture.'
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
        },
        {
            name = 'isReadable',
            description = 'Gets whether the Texture can be drawn and sent to a Shader.\n\nCanvases created with stencil and/or depth PixelFormats are not readable by default, unless readable=true is specified in the settings table passed into love.graphics.newCanvas.\n\nNon-readable Canvases can still be rendered to.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'readable',
                            description = 'Whether the Texture is readable.'
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
