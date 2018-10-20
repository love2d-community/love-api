return {
    name = 'Canvas',
    description = 'A Canvas is used for off-screen rendering. Think of it as an invisible screen that you can draw to, but that will not be visible until you draw it to the actual visible screen. It is also known as "render to texture".\n\nBy drawing things that do not change position often (such as background items) to the Canvas, and then drawing the entire Canvas instead of each item, you can reduce the number of draw operations performed each frame.\n\nIn versions prior to 0.10.0, not all graphics cards that LÖVE supported could use Canvases. love.graphics.isSupported("canvas") could be used to check for support at runtime.',
    constructors = {
        'newCanvas'
    },
    functions = {
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the Canvas.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Canvas, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Canvas, in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFilter',
            description = 'Gets the filter mode of the Canvas.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode used when minifying the canvas.'
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when magnifying the canvas.'
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
            description = 'Gets the height of the Canvas.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Canvas, in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getMSAA',
            description = 'Gets the number of multisample antialiasing (MSAA) samples used when drawing to the Canvas.\n\nThis may be different than the number used as an argument to love.graphics.newCanvas if the system running LÖVE doesn\'t support that number.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'samples',
                            description = 'The number of multisample antialiasing samples used by the canvas when drawing to it.'
                        }
                    }
                }
            }
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the Canvas.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Canvas, in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getWrap',
            description = 'Gets the wrapping properties of a Canvas.\n\nThis function returns the currently set horizontal and vertical wrapping modes for the Canvas.',
            variants = {
                {
                    returns = {
                        {
                            type = 'WrapMode',
                            name = 'horizontal',
                            description = 'Horizontal wrapping mode of the Canvas.'
                        },
                        {
                            type = 'WrapMode',
                            name = 'vertical',
                            description = 'Vertical wrapping mode of the Canvas.'
                        }
                    }
                }
            }
        },
        {
            name = 'newImageData',
            description = 'Generates ImageData from the contents of the Canvas.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'data',
                            description = 'The image data stored in the Canvas.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis of the top-left corner of the area within the Canvas to capture.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis of the top-left corner of the area within the Canvas to capture.'
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the area within the Canvas to capture.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the area within the Canvas to capture.'
                        },
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'data',
                            description = 'The new ImageData made from the Canvas\' contents.'
                        }
                    }
                },
            }
        },
        {
            name = 'renderTo',
            description = 'Render to the Canvas using a function.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'func',
                            description = 'A function performing drawing operations.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFilter',
            description = 'Sets the filter of the Canvas.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'How to scale a canvas down.'
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            default = 'min',
                            description = 'How to scale a canvas up.'
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
            name = 'setWrap',
            description = 'Sets the wrapping properties of a Canvas.\n\nThis function sets the way the edges of a Canvas are treated if it is scaled or rotated. If the WrapMode is set to "clamp", the edge will not be interpolated. If set to "repeat", the edge will be interpolated with the pixels on the opposing side of the framebuffer.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'WrapMode',
                            name = 'horizontal',
                            description = 'Horizontal wrapping mode of the Canvas.'
                        },
                        {
                            type = 'WrapMode',
                            name = 'vertical',
                            default = 'horizontal',
                            description = 'Vertical wrapping mode of the Canvas.'
                        }
                    }
                }
            }
        }
    },
    parenttype = 'Texture',
    supertypes = {
        'Object',
        'Drawable',
        'Texture'
    }
}
