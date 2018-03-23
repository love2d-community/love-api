return {
    name = 'SpriteBatch',
    description = 'Using a single image, draw any number of identical copies of the image using a single call to love.graphics.draw. This can be used, for example, to draw repeating copies of a single background image.\n\nA SpriteBatch can be even more useful when the underlying image is a Texture Atlas (a single image file containing many independent images); by adding Quad to the batch, different sub-images from within the atlas can be drawn.',
    constructors = {
        'newSpriteBatch'
    },
    functions = {
        {
            name = 'add',
            description = 'Add a sprite to the batch.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the object (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the object (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'r',
                            default = '0',
                            description = 'Orientation (radians).'
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            default = '1',
                            description = 'Scale factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'Scale factor (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'Origin offset (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Origin offset (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            default = '0',
                            description = 'Shear factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            default = '0',
                            description = 'Shear factor (y-axis).'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'An identifier for the added sprite.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The Quad to add.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the object (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the object (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'r',
                            default = '0',
                            description = 'Orientation (radians).'
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            default = '1',
                            description = 'Scale factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'Scale factor (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'Origin offset (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Origin offset (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            default = '0',
                            description = 'Shear factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            default = '0',
                            description = 'Shear factor (y-axis).'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'An identifier for the added sprite.'
                        }
                    }
                }
            }
        },
        {
            name = 'attachAttribute',
            description = 'Attaches a per-vertex attribute from a Mesh onto this SpriteBatch, for use when drawing. This can be combined with a Shader to augment a SpriteBatch with per-vertex or additional per-sprite information instead of just having per-sprite colors.\n\nEach sprite in a SpriteBatch has 4 vertices in the following order: top-left, bottom-left, top-right, bottom-right. The index returned by SpriteBatch:add (and used by SpriteBatch:set) can used to determine the first vertex of a specific sprite with the formula "1 + 4 * ( id - 1 )".',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the vertex attribute to attach.'
                        },
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The Mesh to get the vertex attribute from.'
                        }
                    }
                }
            }
        },
        {
            name = 'clear',
            description = 'Removes all sprites from the buffer.',
            variants = {
                {}
            }
        },
        {
            name = 'flush',
            description = 'Immediately sends all new and modified sprite data in the batch to the graphics card.',
            variants = {
                {}
            }
        },
        {
            name = 'getBufferSize',
            description = 'Gets the maximum number of sprites the SpriteBatch can hold.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The maximum number of sprites the batch can hold.'
                        }
                    }
                }
            }
        },
        {
            name = 'getColor',
            description = 'Gets the color that will be used for the next add and set operations.\n\nIf no color has been set with SpriteBatch:setColor or the current SpriteBatch color has been cleared, this method will return nil.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The alpha component (0-255).'
                        },
                    }
                }
            }
        },
        {
            name = 'getCount',
            description = 'Gets the amount of sprites currently in the SpriteBatch.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The amount of sprites currently in the batch.'
                        }
                    }
                }
            }
        },
        {
            name = 'getTexture',
            description = 'Returns the Image or Canvas used by the SpriteBatch.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Image or Canvas for the sprites.'
                        }
                    }
                }
            }
        },
        {
            name = 'set',
            description = 'Changes a sprite in the batch. This requires the identifier returned by add and addq.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'The identifier of the sprite that will be changed.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the object (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the object (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'r',
                            default = '0',
                            description = 'Orientation (radians).'
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            default = '1',
                            description = 'Scale factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'Scale factor (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'Origin offset (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Origin offset (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            default = '0',
                            description = 'Shear factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            default = '0',
                            description = 'Shear factor (y-axis).'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'The identifier of the sprite that will be changed.'
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The quad used on the image of the batch.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the object (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the object (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'r',
                            default = '0',
                            description = 'Orientation (radians).'
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            default = '1',
                            description = 'Scale factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'Scale factor (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'Origin offset (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Origin offset (y-axis).'
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            default = '0',
                            description = 'Shear factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            default = '0',
                            description = 'Shear factor (y-axis).'
                        }
                    }
                }
            }
        },
        {
            name = 'setBufferSize',
            description = 'Sets the maximum number of sprites the SpriteBatch can hold. Existing sprites in the batch (up to the new maximum) will not be cleared when this function is called.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The new maximum number of sprites the batch can hold.'
                        }
                    }
                }
            }
        },
        {
            name = 'setColor',
            description = 'Sets the color that will be used for the next add and set operations. Calling the function without arguments will clear the color.\n\nIn version [[0.9.2]] and older, the global color set with love.graphics.setColor will not work on the SpriteBatch if any of the sprites has its own color.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The amount of red.'
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The amount of green.'
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The amount of blue.'
                        },
                        {
                            type = 'number',
                            name = 'a',
                            default = '255',
                            description = 'The amount of alpha.'
                        }
                    }
                },
                {
                    description = 'Disables all per-sprite colors for this SpriteBatch.'
                }
            }
        },
        {
            name = 'setDrawRange',
            description = 'Restricts the drawn sprites in the SpriteBatch to a subset of the total.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'start',
                            description = 'The index of the first sprite to draw. Index 1 corresponds to the first sprite added with SpriteBatch:add.'
                        },
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of sprites to draw.'
                        }
                    }
                },
                {
                    description = 'Allows all sprites in the SpriteBatch to be drawn.'
                }
            }
        },
        {
            name = 'setTexture',
            description = 'Replaces the Image or Canvas used for the sprites.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The new Image or Canvas to use for the sprites.'
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
    }
}
