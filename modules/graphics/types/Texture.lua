local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Texture',
    description = 'Superclass for drawable objects which represent a texture. All Textures can be drawn with Quads. This is an abstract type that can\'t be created directly.',
    supertypes = {
        'Drawable',
        'Object',
    },
    functions = {
        {
            name = 'getDPIScale',
            description = 'Gets the DPI scale factor of the Texture.\n\nThe DPI scale factor represents relative pixel density. A DPI scale factor of 2 means the texture has twice the pixel density in each dimension (4 times as many pixels in the same area) compared to a texture with a DPI scale factor of 1.\n\nFor example, a texture with pixel dimensions of 100x100 with a DPI scale factor of 2 will be drawn as if it was 50x50. This is useful with high-dpi /  retina displays to easily allow swapping out higher or lower pixel density Images and Canvases without needing any extra manual scaling logic.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The DPI scale factor of the Texture.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDepth',
            description = 'Gets the depth of a Volume Texture. Returns 1 for 2D, Cubemap, and Array textures.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'depth',
                            description = 'The depth of the volume Texture.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDepthSampleMode',
            description = 'Gets the comparison mode used when sampling from a depth texture in a shader.\n\nDepth texture comparison modes are advanced low-level functionality typically used with shadow mapping in 3D.',
            variants = {
                {
                    returns = {
                        {
                            type = 'CompareMode',
                            name = 'compare',
                            description = 'The comparison mode used when sampling from this texture in a shader, or nil if setDepthSampleMode has not been called on this Texture.',
                            default = 'nil',
                        },
                    },
                },
            },
        },
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the Texture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Texture.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Texture.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFilter',
            description = 'Gets the filter mode of the Texture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode to use when minifying the texture (rendering it at a smaller size on-screen than its size in pixels).',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode to use when magnifying the texture (rendering it at a smaller size on-screen than its size in pixels).',
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
            name = 'getFormat',
            description = 'Gets the pixel format of the Texture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'PixelFormat',
                            name = 'format',
                            description = 'The pixel format the Texture was created with.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the Texture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Texture.',
                        },
                    },
                },
            },
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
                            description = 'The number of layers in the Array Texture.',
                        },
                    },
                },
            },
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
                            description = 'The number of mipmaps in the Texture.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMipmapFilter',
            description = 'Gets the mipmap filter mode for a Texture. Prior to 11.0 this method only worked on Images.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'mode',
                            description = 'The filter mode used in between mipmap levels. nil if mipmap filtering is not enabled.',
                        },
                        {
                            type = 'number',
                            name = 'sharpness',
                            description = 'Value used to determine whether the image should use more or less detailed mipmap levels than normal when drawing.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPixelDimensions',
            description = 'Gets the width and height in pixels of the Texture.\n\nTexture:getDimensions gets the dimensions of the texture in units scaled by the texture\'s DPI scale factor, rather than pixels. Use getDimensions for calculations related to drawing the texture (calculating an origin offset, for example), and getPixelDimensions only when dealing specifically with pixels, for example when using Canvas:newImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'pixelwidth',
                            description = 'The width of the Texture, in pixels.',
                        },
                        {
                            type = 'number',
                            name = 'pixelheight',
                            description = 'The height of the Texture, in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPixelHeight',
            description = 'Gets the height in pixels of the Texture.\n\nDPI scale factor, rather than pixels. Use getHeight for calculations related to drawing the texture (calculating an origin offset, for example), and getPixelHeight only when dealing specifically with pixels, for example when using Canvas:newImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'pixelheight',
                            description = 'The height of the Texture, in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPixelWidth',
            description = 'Gets the width in pixels of the Texture.\n\nDPI scale factor, rather than pixels. Use getWidth for calculations related to drawing the texture (calculating an origin offset, for example), and getPixelWidth only when dealing specifically with pixels, for example when using Canvas:newImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'pixelwidth',
                            description = 'The width of the Texture, in pixels.',
                        },
                    },
                },
            },
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
                            description = 'The type of the Texture.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the Texture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Texture.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWrap',
            description = 'Gets the wrapping properties of a Texture.\n\nThis function returns the currently set horizontal and vertical wrapping modes for the texture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'WrapMode',
                            name = 'horiz',
                            description = 'Horizontal wrapping mode of the texture.',
                        },
                        {
                            type = 'WrapMode',
                            name = 'vert',
                            description = 'Vertical wrapping mode of the texture.',
                        },
                        {
                            type = 'WrapMode',
                            name = 'depth',
                            description = 'Wrapping mode for the z-axis of a Volume texture.',
                        },
                    },
                },
            },
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
                            description = 'Whether the Texture is readable.',
                        },
                    },
                },
            },
        },
        {
            name = 'setDepthSampleMode',
            description = 'Sets the comparison mode used when sampling from a depth texture in a shader. Depth texture comparison modes are advanced low-level functionality typically used with shadow mapping in 3D.\n\nWhen using a depth texture with a comparison mode set in a shader, it must be declared as a sampler2DShadow and used in a GLSL 3 Shader. The result of accessing the texture in the shader will return a float between 0 and 1, proportional to the number of samples (up to 4 samples will be used if bilinear filtering is enabled) that passed the test set by the comparison operation.\n\nDepth texture comparison can only be used with readable depth-formatted Canvases.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'CompareMode',
                            name = 'compare',
                            description = 'The comparison mode used when sampling from this texture in a shader.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFilter',
            description = 'Sets the filter mode of the Texture.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode to use when minifying the texture (rendering it at a smaller size on-screen than its size in pixels).',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode to use when magnifying the texture (rendering it at a larger size on-screen than its size in pixels).',
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of anisotropic filtering to use.',
                            default = '1',
                        },
                    },
                },
            },
        },
        {
            name = 'setMipmapFilter',
            description = 'Sets the mipmap filter mode for a Texture. Prior to 11.0 this method only worked on Images.\n\nMipmapping is useful when drawing a texture at a reduced scale. It can improve performance and reduce aliasing issues.\n\nIn created with the mipmaps flag enabled for the mipmap filter to have any effect. In versions prior to 0.10.0 it\'s best to call this method directly after creating the image with love.graphics.newImage, to avoid bugs in certain graphics drivers.\n\nDue to hardware restrictions and driver bugs, in versions prior to 0.10.0 images that weren\'t loaded from a CompressedData must have power-of-two dimensions (64x64, 512x256, etc.) to use mipmaps.',
            variants = {
                {
                    description = 'On mobile devices (Android and iOS), the sharpness parameter is not supported and will do nothing. You can use a custom compressed and its CompressedData has mipmap data included, it will use that.',
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'filtermode',
                            description = 'The filter mode to use in between mipmap levels. \'nearest\' will often give better performance.',
                        },
                        {
                            type = 'number',
                            name = 'sharpness',
                            description = 'A positive sharpness value makes the texture use a more detailed mipmap level when drawing, at the expense of performance. A negative value does the reverse.',
                            default = '0',
                        },
                    },
                },
                {
                    description = 'Disables mipmap filtering.',
                },
            },
        },
        {
            name = 'setWrap',
            description = 'Sets the wrapping properties of a Texture.\n\nThis function sets the way a Texture is repeated when it is drawn with a Quad that is larger than the texture\'s extent, or when a custom Shader is used which uses texture coordinates outside of [0, 1]. A texture may be clamped or set to repeat in both horizontal and vertical directions.\n\nClamped textures appear only once (with the edges of the texture stretching to fill the extent of the Quad), whereas repeated ones repeat as many times as there is room in the Quad.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'WrapMode',
                            name = 'horiz',
                            description = 'Horizontal wrapping mode of the texture.',
                        },
                        {
                            type = 'WrapMode',
                            name = 'vert',
                            description = 'Vertical wrapping mode of the texture.',
                            default = 'horiz',
                        },
                        {
                            type = 'WrapMode',
                            name = 'depth',
                            description = 'Wrapping mode for the z-axis of a Volume texture.',
                            default = 'horiz',
                        },
                    },
                },
            },
        },
    },
}