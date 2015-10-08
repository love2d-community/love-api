return {
    name = 'graphics',
    description = 'The primary responsibility for the love.graphics module is the drawing of lines, shapes, text, Images and other Drawable objects onto the screen. Its secondary responsibilities include loading external files (including Images and Fonts) into memory, creating specialized objects (such as ParticleSystems or Framebuffers) and managing screen geometry.\n\nLÖVE\'s coordinate system is rooted in the upper-left corner of the screen, which is at location (0, 0). The x-axis is horizontal: larger values are further to the right. The y-axis is vertical: larger values are further towards the bottom.\n\nIn many cases, you draw images or shapes in terms of their upper-left corner (See the picture above).\n\nMany of the functions are used to manipulate the graphics coordinate system, which is essentially the way coordinates are mapped to the display. You can change the position, scale, and even rotation in this way.',
    types = {
        {
            name = 'Canvas',
            description = 'A Canvas is used for off-screen rendering. Think of it as an invisible screen that you can draw to, but that will not be visible until you draw it to the actual visible screen. It is also known as "render to texture".\n\nBy drawing things that do not change position often (such as background items) to the Canvas, and then drawing the entire Canvas instead of each item, you can reduce the number of draw operations performed each frame.',
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
                    name = 'isActive',
                    description = 'Gets whether the graphics module is able to be used. If it is not active, love.graphics function and method calls will not work correctly and may cause the program to crash. The graphics module is inactive if a window is not open, or if the app is in the background on iOS. Typically the app\'s execution will be automatically paused by the system, in the latter case.',
                    variants = {
                        {
                            returns = {
                                type = 'boolean',
                                name = 'active',
                                description = 'Whether the graphics module is active and able to be used.'
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
            supertypes = {
                'Drawable',
                'Object'
            }
        },
        {
            name = 'Font',
            description = 'Defines the shape of characters than can be drawn onto the screen.',
            constructors = {
                'newFont',
                'newImageFont'
            },
            functions = {
                {
                    name = 'getAscent',
                    description = 'Gets the ascent of the Font. The ascent spans the distance between the baseline and the top of the glyph that reaches farthest from the baseline.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'ascent',
                                    description = 'The ascent of the Font in pixels.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBaseline',
                    description = 'Gets the baseline of the Font. Most scripts share the notion of a baseline: an imaginary horizontal line on which characters rest. In some scripts, parts of glyphs lie below the baseline.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'baseline',
                                    description = 'The baseline of the Font in pixels.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDescent',
                    description = 'Gets the descent of the Font. The descent spans the distance between the baseline and the lowest descending glyph in a typeface.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'descent',
                                    description = 'The descent of the Font in pixels.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFilter',
                    description = 'Gets the filter mode for a font.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'FilterMode',
                                    name = 'min',
                                    description = 'Filter mode used when minifying the font.'
                                },
                                {
                                    type = 'FilterMode',
                                    name = 'mag',
                                    description = 'Filter mode used when magnifying the font.'
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
                    description = 'Gets the height of the Font. The height of the font is the size including any spacing; the height which it will need.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the Font in pixels.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLineHeight',
                    description = 'Gets the line height. This will be the value previously set by Font:setLineHeight, or 1.0 by default.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The current line height.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWidth',
                    description = 'Determines the horizontal size a line of text needs. Does not support line-breaks.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'line',
                                    description = 'A line of text.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the line.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWrap',
                    description = 'Returns how many lines text would be wrapped to. This function accounts for newlines correctly (i.e. \'\\n\')',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'text',
                                    description = 'The text that would be wrapped.'
                                },
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width to which text should be wrapped.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The actual width the wrapped text.'
                                },
                                {
                                    type = 'number',
                                    name = 'lines',
                                    description = 'The number of lines text was wrapped to.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'hasGlyph',
                    description = 'Gets whether the font can render a particular character.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'character',
                                    description = 'A unicode character.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'hasglyph',
                                    description = 'Whether the font can render the glyph represented by the character.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'codepoint',
                                    description = 'A unicode codepoint number.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'hasglyph',
                                    description = 'Whether the font can render the glyph represented by the codepoint number.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFilter',
                    description = 'Sets the filter mode for a font.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'FilterMode',
                                    name = 'min',
                                    description = 'How to scale a font down.'
                                },
                                {
                                    type = 'FilterMode',
                                    name = 'mag',
                                    default = 'min',
                                    description = 'How to scale a font up.'
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
                    name = 'setLineHeight',
                    description = 'Sets the line height. When rendering the font in lines the actual height will be determined by the line height multiplied by the height of the font. The default is 1.0.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The new line height.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'Mesh',
            description = '',
            constructors = {
                'newMesh'
            },
            functions = {
                {
                    name = 'getDrawMode',
                    description = 'Gets the mode used when drawing the Mesh.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'MeshDrawMode',
                                    name = 'mode',
                                    description = 'The mode used when drawing the Mesh.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDrawRange',
                    description = 'Gets the range of vertices used when drawing the Mesh.\n\nIf the Mesh\'s draw range has not been set previously with Mesh:setDrawRange, this function will return nil.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The index of the first vertex used when drawing, or the index of the first value in the vertex map used if one is set for this Mesh.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The index of the last vertex used when drawing, or the index of the last value in the vertex map used if one is set for this Mesh.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getTexture',
                    description = 'Gets the texture (Image or Canvas) used when drawing the Mesh.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'Texture',
                                    name = 'texture',
                                    description = 'The Image or Canvas to texture the Mesh with when drawing, or nil if none is set.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getVertex',
                    description = 'Returns vertex information from the Mesh.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'i',
                                    description = 'The index of the the vertex you want to retrieve the information for.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x vertex coordinate.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y vertex coordinate.'
                                },
                                {
                                    type = 'number',
                                    name = 'u',
                                    description = 'The u vertex coordinate.'
                                },
                                {
                                    type = 'number',
                                    name = 'v',
                                    description = 'The v vertex coordinate.'
                                },
                                {
                                    type = 'number',
                                    name = 'r',
                                    description = 'The red color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'g',
                                    description = 'The green color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'b',
                                    description = 'The blue color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'a',
                                    description = 'The alpha color component.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getVertexCount',
                    description = 'Returns the total number of vertices in the Mesh.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'num',
                                    description = 'The total number of vertices in this Mesh.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getVertexMap',
                    description = 'Gets the Mesh\'s vertex map.\n\n If no vertex map has been set previously (either in love.graphics.newMesh or with Mesh:setVertexMap), then this function will return the default vertex map: {1, 2, 3, ..., Mesh:getVertexCount()}.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'table',
                                    name = 'vertex_map',
                                    description = 'A table containing a list of vertex indices used when drawing.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDrawMode',
                    description = 'Sets the mode used when drawing the Mesh.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'MeshDrawMode',
                                    name = 'mode',
                                    description = 'The mode to use when drawing the Mesh.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDrawRange',
                    description = 'Restricts the drawn vertices of the Mesh to a subset of the total.\n\nIf a vertex map is used with the Mesh, this method will set a subset of the values in the vertex map array to use, instead of a subset of the total vertices in the Mesh.\n\nFor example, if Mesh:setVertexMap(1, 2, 3, 1, 3, 4) and Mesh:setDrawRange(4, 6) are called, vertices 1, 3, and 4 will be drawn.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The index of the first vertex to use when drawing, or the index of the first value in the vertex map to use if one is set for this Mesh.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The index of the last vertex to use when drawing, or the index of the last value in the vertex map to use if one is set for this Mesh.'
                                }
                            }
                        },
                        {
                            description = 'Allows all vertices in the Mesh to be drawn.'
                        }
                    }
                },
                {
                    name = 'setTexture',
                    description = 'Sets the texture (Image or Canvas) used when drawing the Mesh.\n\nWhen called without an argument disables the texture. Untextured meshes have a white color by default.',
                    variants = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'Texture',
                                    name = 'texture',
                                    description = 'The Image or Canvas to texture the Mesh with when drawing.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setVertex',
                    description = 'Sets the vertex information for a Mesh.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'i',
                                    description = 'The index of the the vertex you want to alter the information for.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x vertex coordinate.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y vertex coordinate.'
                                },
                                {
                                    type = 'number',
                                    name = 'u',
                                    description = 'The u vertex coordinate.'
                                },
                                {
                                    type = 'number',
                                    name = 'v',
                                    description = 'The v vertex coordinate.'
                                },
                                {
                                    type = 'number',
                                    name = 'r',
                                    default = '255',
                                    description = 'The red color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'g',
                                    default = '255',
                                    description = 'The green color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'b',
                                    default = '255',
                                    description = 'The blue color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'a',
                                    default = '255',
                                    description = 'The alpha color component.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setVertexColors',
                    description = 'Sets if the per-vertex colors are used when rendering instead of the constant color (constant color being love.graphics.setColor or SpriteBatch:setColor)\n\nThe per-vertex colors are automatically enabled by default when making a new Mesh or when doing Mesh:setVertex, but only if at least one vertex color is not the default (255,255,255,255).',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'on',
                                    description = 'True to use per-vertex coloring.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setVertexMap',
                    description = 'Sets the vertex map for a Mesh. The vertex map describes the order in which the vertices are used when the Mesh is drawn.\n\nThe vertex map allows you to re-order or reuse vertices when drawing without changing the actual vertex parameters or duplicating vertices. It is especially useful when combined with different Mesh draw modes.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'vertex_map',
                                    description = 'A table containing a list of vertex indices to use when drawing. Values must be in the range of [1, Mesh:getVertexCount()].'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'vi1',
                                    description = 'The index of the first vertex to use when drawing. Must be in the range of [1, Mesh:getVertexCount()].'
                                },
                                {
                                    type = 'number',
                                    name = 'vi2',
                                    description = 'The index of the second vertex to use when drawing.'
                                },
                                {
                                    type = 'number',
                                    name = 'vi3',
                                    description = 'The index of the third vertex to use when drawing.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setVertices',
                    description = 'Replaces all vertices in the Mesh with new ones.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'vertex_map',
                                    description = 'The table filled with vertex information tables for each vertex.',
                                    table = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position of the vertex on the x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position of the vertex on the y-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'u',
                                            default = '0',
                                            description = 'The horizontal component of the texture coordinate. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                        },
                                        {
                                            type = 'number',
                                            name = 'v',
                                            default = '0',
                                            description = 'The vertical component of the texture coordinate. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            default = '255',
                                            description = 'The red color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            default = '255',
                                            description = 'The green color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            default = '255',
                                            description = 'The blue color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            default = '255',
                                            description = 'The alpha color component.'
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'Image',
            description = 'Drawable image type.',
            constructors = {
                'newImage'
            },
            functions = {
                {
                    name = 'getData',
                    description = 'Gets the original ImageData or CompressedData used to create the Image.\n\nAll Images keep a reference to the Data that was used to create the Image. The Data is used to refresh the Image when love.window.setMode or Image:refresh is called.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'ImageData',
                                    name = 'data',
                                    description = 'The original ImageData used to create the Image, if the image is not compressed.'
                                }
                            }
                        },
                        {
                            returns = {
                                {
                                    type = 'CompressedData',
                                    name = 'data',
                                    description = 'The original CompressedData used to create the Image, if the image is compressed.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDimensions',
                    description = 'Gets the width and height of the Image.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the Image, in pixels.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the Image, in pixels.'
                                }
                            }
                        }
                    }
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
                                    description = 'Filter mode used when minifying the image.'
                                },
                                {
                                    type = 'FilterMode',
                                    name = 'mag',
                                    description = 'Filter mode used when magnifying the image.'
                                }
                            }
                        }
                    }
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
                                    description = 'The height of the Image, in pixels.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMipmapFilter',
                    description = 'Gets the mipmap filter mode for an Image.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'FilterMode',
                                    name = 'mode',
                                    description = 'The filter mode used in between mipmap levels. nil if mipmap filtering is not enabled.'
                                },
                                {
                                    type = 'number',
                                    name = 'sharpness',
                                    description = 'Value used to determine whether the image should use more or less detailed mipmap levels than normal when drawing.'
                                }
                            }
                        }
                    }
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
                                    description = 'The width of the Image, in pixels.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWrap',
                    description = 'Gets the wrapping properties of an Image.\n\nThis function returns the currently set horizontal and vertical wrapping modes for the image.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'WrapMode',
                                    name = 'horizontal',
                                    description = 'Horizontal wrapping mode of the image.'
                                },
                                {
                                    type = 'WrapMode',
                                    name = 'vertical',
                                    description = 'Vertical wrapping mode of the image.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'refresh',
                    description = 'Reloads the Image\'s contents from the ImageData or CompressedData used to create the image.',
                    variants = {
                        {}
                    }
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
                                    description = 'How to scale an image down.'
                                },
                                {
                                    type = 'FilterMode',
                                    name = 'mag',
                                    default = 'min',
                                    description = 'How to scale an image up.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMipmapFilter',
                    description = 'Sets the mipmap filter mode for an Image.\n\nMipmapping is useful when drawing an image at a reduced scale. It can improve performance and reduce aliasing issues.\n\nAutomatically creates mipmaps for the Image if none exist yet. If the image is compressed and its CompressedData has mipmap data included, it will use that.\n\nDisables mipmap filtering when called without arguments.',
                    variants = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'FilterMode',
                                    name = 'filtermode',
                                    description = 'The filter mode to use in between mipmap levels. "nearest" will often give better performance.'
                                },
                                {
                                    type = 'number',
                                    name = 'sharpness',
                                    default = '0',
                                    description = 'A positive sharpness value makes the image use a more detailed mipmap level when drawing, at the expense of performance. A negative value does the reverse.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setWrap',
                    description = 'Sets the wrapping properties of an Image.\n\nThis function sets the way an Image is repeated when it is drawn with a Quad that is larger than the image\'s extent. An image may be clamped or set to repeat in both horizontal and vertical directions. Clamped images appear only once, but repeated ones repeat as many times as there is room in the Quad.\n\nIf you use a Quad that is larger than the image extent and do not use repeated tiling, there may be an unwanted visual effect of the image stretching all the way to fill the Quad. If this is the case, setting Image:getWrap("repeat", "repeat") for all the images to be repeated, and using Quad of appropriate size will result in the best visual appearance.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'WrapMode',
                                    name = 'horizontal',
                                    description = 'Horizontal wrapping mode of the image.'
                                },
                                {
                                    type = 'WrapMode',
                                    name = 'vertical',
                                    default = 'horizontal',
                                    description = 'Vertical wrapping mode of the image.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Drawable',
                'Object'
            }
        },
        {
            name = 'ParticleSystem',
            description = 'Used to create cool effects, like fire. The particle systems are created and drawn on the screen using functions in love.graphics. They also need to be updated in the update(dt) callback for you to see any changes in the particles emitted.',
            constructors = {
                'newParticleSystem'
            },
            functions = {
                {
                    name = 'clone',
                    description = 'Creates an identical copy of the ParticleSystem in the stopped state.\n\nCloned ParticleSystem inherit all the set-able state of the original ParticleSystem, but they are initialized stopped.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'ParticleSystem',
                                    name = 'particlesystem',
                                    description = 'The new identical copy of this ParticleSystem.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'emit',
                    description = 'Emits a burst of particles from the particle emitter.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'numparticles',
                                    description = 'The amount of particles to emit. The number of emitted particles will be truncated if the particle system\'s max buffer size is reached.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getCount',
                    description = 'Gets the amount of particles that are currently in the system.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'count',
                                    description = 'The current number of live particles.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getAreaSpread',
                    description = 'Gets the area-based spawn parameters for the particles.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'AreaSpreadDistribution',
                                    name = 'distribution',
                                    description = 'The type of distribution for new particles.'
                                },
                                {
                                    type = 'number',
                                    name = 'dx',
                                    description = 'The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution.'
                                },
                                {
                                    type = 'number',
                                    name = 'dy',
                                    description = 'The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBufferSize',
                    description = 'Gets the size of the buffer (the max allowed amount of particles in the system).',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'buffer',
                                    description = 'The buffer size.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getColors',
                    description = 'Gets a series of colors to apply to the particle sprite. The particle system will interpolate between each color evenly over the particle\'s lifetime. Color modulation needs to be activated for this function to have any effect.\n\nArguments are passed in groups of four, representing the components of the desired RGBA value. At least one color must be specified. A maximum of eight may be used.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'r1',
                                    description = 'First color, red component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'g1',
                                    description = 'First color, green component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'b1',
                                    description = 'First color, blue component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'a1',
                                    description = 'First color, alpha component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'r2',
                                    description = 'Second color, red component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'g2',
                                    description = 'Second color, green component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'b2',
                                    description = 'Second color, blue component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'a2',
                                    description = 'Second color, alpha component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Etc.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDirection',
                    description = 'Gets the direction the particles will be emitted in.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'direction',
                                    description = 'The direction of the particles (in radians).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getEmissionRate',
                    description = 'Gets the amount of particles emitted per second.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'rate',
                                    description = 'The amount of particles per second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getInsertMode',
                    description = 'Gets the mode to use when the ParticleSystem adds new particles.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'ParticleInsertMode',
                                    name = 'mode',
                                    description = 'The mode to use when the ParticleSystem adds new particles.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLinearAcceleration',
                    description = 'Gets the linear acceleration (acceleration along the x and y axes) for particles.\n\nEvery particle created will accelerate along the x and y axes between xmin,ymin and xmax,ymax.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'xmin',
                                    description = 'The minimum acceleration along the x axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'ymin',
                                    description = 'The minimum acceleration along the y axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'xmax',
                                    description = 'The maximum acceleration along the x axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'ymax',
                                    description = 'The maximum acceleration along the y axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLinearDamping',
                    description = 'Gets the amount of linear damping (constant deceleration) for particles.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum amount of linear damping applied to particles.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum amount of linear damping applied to particles.'
                                },
                            }
                        }
                    }
                },
                {
                    name = 'getEmitterLifetime',
                    description = 'Gets how long the particle system should emit particles (if -1 then it emits particles forever).',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'life',
                                    description = 'The lifetime of the emitter (in seconds).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getOffset',
                    description = 'Get the offget position which the particle sprite is rotated around. If this function is not used, the particles rotate around their center.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x coordinate of the rotation offget.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y coordinate of the rotation offget.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getParticleLifetime',
                    description = 'Gets the life of the particles.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum life of the particles (seconds).'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum life of the particles (seconds).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPosition',
                    description = 'Gets the position of the emitter.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'Position along x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'Position along y-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRadialAcceleration',
                    description = 'Get the radial acceleration (away from the emitter).',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum acceleration.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum acceleration.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRotation',
                    description = 'Gets the rotation of the image upon particle creation (in radians).',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum initial angle (radians).'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum initial angle (radians).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSizes',
                    description = 'Gets a series of sizes by which to scale a particle sprite. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle\'s lifetime.\n\nAt least one size must be specified. A maximum of eight may be used.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'size1',
                                    description = 'The first size.'
                                },
                                {
                                    type = 'number',
                                    name = 'size2',
                                    description = 'The second size.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Etc.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSizeVariation',
                    description = 'Gets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'variation',
                                    description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSpeed',
                    description = 'Gets the speed of the particles.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum linear speed of the particles.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum linear speed of the particles.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSpin',
                    description = 'Gets the spin of the sprite.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum spin (radians per second).'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum spin (radians per second).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSpinVariation',
                    description = 'Gets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'variation',
                                    description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSpread',
                    description = 'Gets the amount of spread for the system.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'spread',
                                    description = 'The amount of spread (radians).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getTexture',
                    description = 'Gets the Image or Canvas which is to be emitted.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'Texture',
                                    name = 'texture',
                                    description = 'An Image or Canvas to use for the particle.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getTangentialAcceleration',
                    description = 'Gets the tangential acceleration (acceleration perpendicular to the particle\'s direction).',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum acceleration.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum acceleration.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'hasRelativeRotation',
                    description = 'Gets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'True if relative particle rotation is enabled, false if it\'s disabled.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isActive',
                    description = 'Checks whether the particle system is actively emitting particles.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'active',
                                    description = 'True if system is active, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isPaused',
                    description = 'Checks whether the particle system is paused.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'paused',
                                    description = 'True if system is paused, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isStopped',
                    description = 'Checks whether the particle system is stopped.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'stopped',
                                    description = 'True if system is stopped, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'moveTo',
                    description = 'Moves the position of the emitter. This results in smoother particle spawning behaviour than if ParticleSystem:setPosition is used every frame.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'Position along x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'Position along y-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'pause',
                    description = 'Pauses the particle emitter.',
                    variants = {
                        {}
                    }
                },
                {
                    name = 'reset',
                    description = 'Resets the particle emitter, removing any existing particles and resetting the lifetime counter.',
                    variants = {
                        {}
                    }
                },
                {
                    name = 'setAreaSpread',
                    description = 'Sets area-based spawn parameters for the particles. Newly created particles will spawn in an area around the emitter based on the parameters to this function.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'AreaSpreadDistribution',
                                    name = 'distribution',
                                    description = 'The type of distribution for new particles.'
                                },
                                {
                                    type = 'number',
                                    name = 'dx',
                                    description = 'The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution.'
                                },
                                {
                                    type = 'number',
                                    name = 'dy',
                                    description = 'The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setBufferSize',
                    description = 'Sets the size of the buffer (the max allowed amount of particles in the system).',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'buffer',
                                    description = 'The buffer size.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setColors',
                    description = 'Sets a series of colors to apply to the particle sprite. The particle system will interpolate between each color evenly over the particle\'s lifetime. Color modulation needs to be activated for this function to have any effect.\n\nArguments are passed in groups of four, representing the components of the desired RGBA value. At least one color must be specified. A maximum of eight may be used.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'r1',
                                    description = 'First color, red component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'g1',
                                    description = 'First color, green component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'b1',
                                    description = 'First color, blue component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'a1',
                                    description = 'First color, alpha component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'r2',
                                    description = 'Second color, red component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'g2',
                                    description = 'Second color, green component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'b2',
                                    description = 'Second color, blue component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'a2',
                                    description = 'Second color, alpha component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Etc.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDirection',
                    description = 'Sets the direction the particles will be emitted in.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'direction',
                                    description = 'The direction of the particles (in radians).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setEmissionRate',
                    description = 'Sets the amount of particles emitted per second.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'rate',
                                    description = 'The amount of particles per second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setEmitterLifetime',
                    description = 'Sets how long the particle system should emit particles (if -1 then it emits particles forever).',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'life',
                                    description = 'The lifetime of the emitter (in seconds).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setInsertMode',
                    description = 'Sets the mode to use when the ParticleSystem adds new particles.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'ParticleInsertMode',
                                    name = 'mode',
                                    description = 'The mode to use when the ParticleSystem adds new particles.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLinearAcceleration',
                    description = 'Sets the linear acceleration (acceleration along the x and y axes) for particles.\n\nEvery particle created will accelerate along the x and y axes between xmin,ymin and xmax,ymax.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'xmin',
                                    description = 'The minimum acceleration along the x axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'ymin',
                                    default = '0',
                                    description = 'The minimum acceleration along the y axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'xmax',
                                    default = 'xmin',
                                    description = 'The maximum acceleration along the x axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'ymax',
                                    default = 'ymax',
                                    description = 'The maximum acceleration along the y axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLinearDamping',
                    description = 'Sets the amount of linear damping (constant deceleration) for particles.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum amount of linear damping applied to particles.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum amount of linear damping applied to particles.'
                                },
                            }
                        }
                    }
                },
                {
                    name = 'setOffset',
                    description = 'Set the offset position which the particle sprite is rotated around. If this function is not used, the particles rotate around their center.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x coordinate of the rotation offset.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y coordinate of the rotation offset.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setParticleLifetime',
                    description = 'Sets the life of the particles.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum life of the particles (seconds).'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum life of the particles (seconds).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setPosition',
                    description = 'Sets the position of the emitter.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'Position along x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'Position along y-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setQuads',
                    description = 'Sets a series of Quads to use for the particle sprites. Particles will choose a Quad from the list based on the particle\'s current lifetime, allowing for the use of animated sprite sheets with ParticleSystems.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'Quad',
                                    name = 'quad1',
                                    description = 'The first Quad to use.'
                                },
                                {
                                    type = 'Quad',
                                    name = 'quad2',
                                    description = 'The second Quad to use.'
                                },
                            }
                        }
                    }
                },
                {
                    name = 'setRadialAcceleration',
                    description = 'Set the radial acceleration (away from the emitter).',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum acceleration.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum acceleration.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRelativeRotation',
                    description = 'Sets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enable',
                                    description = 'True to enable relative particle rotation, false to disable it.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRotation',
                    description = 'Sets the rotation of the image upon particle creation (in radians).',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum initial angle (radians).'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum initial angle (radians).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSizes',
                    description = 'Sets a series of sizes by which to scale a particle sprite. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle\'s lifetime.\n\nAt least one size must be specified. A maximum of eight may be used.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'size1',
                                    description = 'The first size.'
                                },
                                {
                                    type = 'number',
                                    name = 'size2',
                                    description = 'The second size.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Etc.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSizeVariation',
                    description = 'Sets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'variation',
                                    description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSpeed',
                    description = 'Sets the speed of the particles.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum linear speed of the particles.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum linear speed of the particles.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSpin',
                    description = 'Sets the spin of the sprite.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum spin (radians per second).'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum spin (radians per second).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSpinVariation',
                    description = 'Sets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'variation',
                                    description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSpread',
                    description = 'Sets the amount of spread for the system.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'spread',
                                    description = 'The amount of spread (radians).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setTexture',
                    description = 'Sets the Image or Canvas which is to be emitted.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'Texture',
                                    name = 'texture',
                                    description = 'An Image or Canvas to use for the particle.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setTangentialAcceleration',
                    description = 'Sets the tangential acceleration (acceleration perpendicular to the particle\'s direction).',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum acceleration.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    default = 'min',
                                    description = 'The maximum acceleration.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'start',
                    description = 'Starts the particle emitter.',
                    variants = {
                        {}
                    }
                },
                {
                    name = 'stop',
                    description = 'Stops the particle emitter, resetting the lifetime counter.',
                    variants = {
                        {}
                    }
                },
                {
                    name = 'update',
                    description = 'Updates the particle system; moving, creating and killing particles.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'dt',
                                    description = 'The time (seconds) since last frame.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Drawable',
                'Object'
            }
        },
        {
            name = 'Quad',
            description = 'A quadrilateral (a polygon with four sides and four corners) with texture coordinate information.\n\nQuads can be used to select part of a texture to draw. In this way, one large texture atlas can be loaded, and then split up into sub-images.',
            constructors = {
                'newQuad'
            },
            functions = {
                {
                    name = 'getViewport',
                    description = 'Gets the current viewport of this Quad.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The top-left corner along the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The top-right corner along the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'w',
                                    description = 'The width of the viewport.'
                                },
                                {
                                    type = 'number',
                                    name = 'h',
                                    description = 'The height of the viewport.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setViewport',
                    description = 'Sets the texture coordinates according to a viewport.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The top-left corner along the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The top-right corner along the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'w',
                                    description = 'The width of the viewport.'
                                },
                                {
                                    type = 'number',
                                    name = 'h',
                                    description = 'The height of the viewport.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'Shader',
            description = 'A Shader is used for advanced hardware-accelerated pixel or vertex manipulation. These effects are written in a language based on GLSL (OpenGL Shading Language) with a few things simplified for easier coding.\n\nPotential uses for pixel effects include HDR/bloom, motion blur, grayscale/invert/sepia/any kind of color effect, reflection/refraction, distortions, and much more!',
            constructors = {
                'newShader'
            },
            functions = {
                {
                    name = 'getExternVariable',
                    description = 'Gets information about an \'extern\' (\'uniform\') variable in the shader.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the extern variable.'
                                }
                            },
                            returns = {
                                {
                                    type = 'ShaderVariableType',
                                    name = 'type',
                                    description = 'The base type of the variable.'
                                },
                                {
                                    type = 'number',
                                    name = 'components',
                                    description = 'The number of components in the variable (e.g. 2 for a vec2 or mat2.)'
                                },
                                {
                                    type = 'number',
                                    name = 'arrayelements',
                                    description = 'The number of elements in the array if the variable is an array, or 1 if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWarnings',
                    description = 'Returns any warning and error messages from compiling the shader code. This can be used for debugging your shaders if there\'s anything the graphics hardware doesn\'t like.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'warnings',
                                    description = 'Warning messages (if any).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'send',
                    description = 'Sends one or more values to a special (extern) variable inside the shader.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'Name of the number to send to the pixel effect.'
                                },
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'Number to send to the pixel effect.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional numbers to send in case the extern is an array.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'Name of the vector to send to the shader.'
                                },
                                {
                                    type = 'table',
                                    name = 'vector',
                                    description = 'Numbers to send to the extern as a vector. The number of elements in the table determines the type of the vector (e.g. two numbers -> vec2). At least two and at most four numbers can be used.'
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional vectors to send in case the extern is an array. All vectors need to be of the same size (e.g. only vec3\'s)'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'Name of the matrix to send to the shader.'
                                },
                                {
                                    type = 'table',
                                    name = 'matrix',
                                    description = '2x2, 3x3, or 4x4 matrix to send to the extern. Using table form: {{a,b,c,d}, {e,f,g,h}, ... }'
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional matrices of the same type as matrix to store in the extern array.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'Name of the Image to send to the shader.'
                                },
                                {
                                    type = 'Image',
                                    name = 'image',
                                    description = 'Image to send to the extern.'
                                },
                                {
                                    type = 'Image',
                                    name = '...',
                                    description = 'Additional images in case the extern is an array.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'Name of the Canvas to send to the shader.'
                                },
                                {
                                    type = 'Canvas',
                                    name = 'canvas',
                                    description = 'Canvas to send to the extern. The shader extern type is Image.'
                                },
                                {
                                    type = 'Canvas',
                                    name = '...',
                                    description = 'Additional canvases to send to the extern array.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'Name of the boolean to send to the shader.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'boolean',
                                    description = 'Boolean to send to store in the extern.'
                                },
                                {
                                    type = 'boolean',
                                    name = '...',
                                    description = 'Additional booleans to send in case the extern is an array.'
                                }
                            }
                        },
                    }
                },
                {
                    name = 'sendColor',
                    description = 'Sends one or more colors to a special (extern / uniform) vec3 or vec4 variable inside the shader. The color components must be in the range of [0, 255], unlike Shader:send. The colors are gamma-corrected if global gamma-correction is enabled.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the color extern variable to send to in the shader.'
                                },
                                {
                                    type = 'table',
                                    name = 'color',
                                    description = 'A table with red, green, blue, and optional alpha color components in the range of [0, 255] to send to the extern as a vector.'
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional colors to send in case the extern is an array. All colors need to be of the same size (e.g. only vec3\'s).'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
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
                        {},
                        {
                            arguments = {
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
                    description = 'Sets the color that will be used for the next add and set operations. Calling the function without arguments will clear the color.\n\nThe global color set with love.graphics.setColor will not work on the SpriteBatch if any of the sprites has its own color.',
                    variants = {
                        {},
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
                                },
                            }
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
            supertypes = {
                'Drawable',
                'Object'
            }
        },
        {
            name = 'Text',
            description = 'Drawable text.',
            constructors = {
                'newText'
            },
            functions = {},
            supertypes = {
                'Drawable',
                'Object'
            }
        }
    },
    functions = {
        {
            name = 'arc',
            description = 'Draws an arc.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the arc.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'Radius of the arc.'
                        },
                        {
                            type = 'number',
                            name = 'angle1',
                            description = 'The angle at which the arc begins.'
                        },
                        {
                            type = 'number',
                            name = 'angle2',
                            description = 'The angle at which the arc terminates.'
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            default = '10',
                            description = 'The number of segments used for drawing the arc.'
                        }
                    }
                }
            }
        },
        {
            name = 'circle',
            description = 'Draws a circle.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the circle.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'The radius of the circle.'
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            default = 'max(radius, 10)',
                            description = 'The number of segments used for drawing the circle.'
                        }
                    }
                }
            }
        },
        {
            name = 'clear',
            description = 'Clears the screen to background color and restores the default coordinate system.\n\nThis function is called automatically before love.draw in the default love.run function. See the example in love.run for a typical use of this function.\n\nNote that the scissor area bounds the cleared region.',
            variants = {
                {}
            }
        },
        {
            name = 'draw',
            description = 'Draws objects on screen. Drawable objects are loaded images, but may be other kinds of Drawable objects, such as a ParticleSystem.\n\nIn addition to simple drawing, this function can rotate and scale the object at the same time, as well as offset the image (for example, to center the image at the chosen coordinates).\n\nlove.graphics.draw anchors from the top left corner by default.\n\nYou can specify a negative value for sx or sy to flip the drawable horizontally or vertically.\n\nThe pivotal point is (x, y) on the screen and (ox, oy) in the internal coordinate system of the drawable object, before rotation and scaling. The object is scaled by (sx, sy), then rotated by r around the pivotal point.\n\nThe origin offset values are most often used to shift the images up and left by half of its height and width, so that (effectively) the specified x and y coordinates are where the center of the image will end up.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Drawable',
                            name = 'drawable',
                            description = 'A drawable object.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            default = '0',
                            description = 'The position to draw the object (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            default = '0',
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
                            description = 'Scale factor (x-axis). Can be negative.'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'Scale factor (y-axis). Can be negative.'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'Origin offset (x-axis). (A value of 20 would effectively move your drawable object 20 pixels to the left.)'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Origin offset (y-axis). (A value of 20 would effectively move your drawable object 20 pixels up.)'
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            default = '0',
                            description = 'Shearing factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            default = '0',
                            description = 'Shearing factor (y-axis).'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'A Texture (Image or Canvas) to texture the Quad with.'
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The Quad to draw on screen.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            default = '0',
                            description = 'The position to draw the object (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            default = '0',
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
                            description = 'Scale factor (x-axis). Can be negative.'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'Scale factor (y-axis). Can be negative.'
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
                            description = 'Origin offset (y-axis)'
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            default = '0',
                            description = 'Shearing factor (x-axis).'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            default = '0',
                            description = 'Shearing factor (y-axis).'
                        }
                    }
                }
            }
        },
        {
            name = 'ellipse',
            description = 'Draws an ellipse.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the ellipse.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'radiusx',
                            description = 'The radius of the ellipse along the x-axis (half the ellipse\'s width.)'
                        },
                        {
                            type = 'number',
                            name = 'radiusy',
                            description = 'The radius of the ellipse along the y-axis (half the ellipse\'s height.)'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the ellipse.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'radiusx',
                            description = 'The radius of the ellipse along the x-axis (half the ellipse\'s width.)'
                        },
                        {
                            type = 'number',
                            name = 'radiusy',
                            description = 'The radius of the ellipse along the y-axis (half the ellipse\'s height.)'
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            description = 'The number of segments used for drawing the ellipse.'
                        }
                    }
                }
            }
        },
        {
            name = 'getBackgroundColor',
            description = 'Gets the current background color.',
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
                        }
                    }
                }
            }
        },
        {
            name = 'getBlendMode',
            description = 'Gets the blending mode.',
            variants = {
                {
                    returns = {
                        {
                            type = 'BlendMode',
                            name = 'mode',
                            description = 'The current blend mode.'
                        }
                    }
                }
            }
        },
        {
            name = 'getCanvas',
            description = 'Gets the current target Canvas.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'The Canvas set by setCanvas. Returns nil if drawing to the real screen.'
                        }
                    }
                }
            }
        },
        {
            name = 'getCanvasFormats',
            description = 'Gets the available Canvas formats, and whether each is supported.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'formats',
                            description = 'A table containing CanvasFormats as keys, and a boolean indicating whether the format is supported as values. Not all systems support all formats.'
                        }
                    }
                }
            }
        },
        {
            name = 'getColor',
            description = 'Gets the current color.',
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
                            description = 'The red component (0-255).'
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
                        }
                    }
                }
            }
        },
        {
            name = 'getColorMask',
            description = 'Gets the active color components used when drawing. Normally all 4 components are active unless love.graphics.setColorMask has been used.\n\nThe color mask determines whether individual components of the colors of drawn objects will affect the color of the screen. They affect love.graphics.clear and Canvas:clear as well.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'r',
                            description = 'Whether the red color component is active when rendering.'
                        },
                        {
                            type = 'boolean',
                            name = 'g',
                            description = 'Whether the green color component is active when rendering.'
                        },
                        {
                            type = 'boolean',
                            name = 'b',
                            description = 'Whether the blue color component is active when rendering.'
                        },
                        {
                            type = 'boolean',
                            name = 'a',
                            description = 'Whether the alpha color component is active when rendering.'
                        }
                    }
                }
            }
        },
        {
            name = 'getCompressedImageFormats',
            description = 'Gets the available compressed image formats, and whether each is supported.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'formats',
                            description = 'A table containing CompressedFormats as keys, and a boolean indicating whether the format is supported as values. Not all systems support all formats.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDefaultFilter',
            description = 'Returns the default scaling filters used with Images, Canvases, and Fonts.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode used when scaling the image down.'
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when scaling the image up.'
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of Anisotropic Filtering used.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the window.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the window.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the window.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFSAA',
            description = 'Gets the number of antialiasing samples used when drawing to the Canvas.\n\nThis may be different than the number used as an argument to love.graphics.newCanvas if the system running LÖVE doesn\'t support that number.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'samples',
                            description = 'The number of antialiasing samples used by the canvas when drawing to it.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFont',
            description = 'Gets the current Font object.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The current Font, or nil if none is set.'
                        }
                    }
                }
            }
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the window.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the window.'
                        }
                    }
                }
            }
        },
        {
            name = 'getLineJoin',
            description = 'Gets the line join style.',
            variants = {
                {
                    returns = {
                        {
                            type = 'LineJoin',
                            name = 'join',
                            description = 'The LineJoin style.'
                        }
                    }
                }
            }
        },
        {
            name = 'getLineStyle',
            description = 'Gets the line style.',
            variants = {
                {
                    returns = {
                        {
                            type = 'LineStyle',
                            name = 'style',
                            description = 'The current line style.'
                        }
                    }
                }
            }
        },
        {
            name = 'getLineWidth',
            description = 'Gets the current line width.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The current line width.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFullscreenModes',
            description = 'Gets a list of supported fullscreen modes.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'modes',
                            description = 'A table of width/height pairs. (Note that this may not be in order.)'
                        }
                    }
                }
            }
        },
        {
            name = 'getShader',
            description = 'Returns the current Shader. Returns nil if none is set.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Shader',
                            name = 'shader',
                            description = 'The current Shader.'
                        }
                    }
                }
            }
        },
        {
            name = 'getStats',
            description = 'Gets performance-related rendering statistics.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'drawcalls',
                            description = 'The number of draw calls made so far during the current frame. This includes all internal draw calls – for example, drawing smooth lines takes two draw calls.'
                        },
                        {
                            type = 'number',
                            name = 'canvasswitches',
                            description = 'The number of times the active Canvas has been switched so far during the current frame. This includes all internal canvas switches – for example, calling Canvas:clear if the Canvas isn\'t active will trigger two canvas switches.'
                        },
                        {
                            type = 'number',
                            name = 'texturememory',
                            description = 'The estimated total size in bytes of video memory used by all loaded Images, Canvases, and Fonts.'
                        },
                        {
                            type = 'number',
                            name = 'images',
                            description = 'The number of Image objects currently loaded.'
                        },
                        {
                            type = 'number',
                            name = 'canvases',
                            description = 'The number of Canvas objects currently loaded.'
                        },
                        {
                            type = 'number',
                            name = 'fonts',
                            description = 'The number of Font objects currently loaded.'
                        },
                    }
                }
            }
        },
        {
            name = 'getSupported',
            description = 'Gets the optional graphics features and whether they\'re supported on the system.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'features',
                            description = 'A table containing GraphicsFeature keys, and boolean values indicating whether each feature is supported.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSystemLimits',
            description = 'Gets the system-dependent maximum values for love.graphics features.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'limits',
                            description = 'A table containing GraphicsLimit keys, and number values.'
                        }
                    }
                }
            }
        },
        {
            name = 'getPointSize',
            description = 'Gets the point size.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The current point size.'
                        }
                    }
                }
            }
        },
        {
            name = 'getRendererInfo',
            description = 'Gets information about the system\'s video card and drivers.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the renderer, e.g. "OpenGL".'
                        },
                        {
                            type = 'string',
                            name = 'version',
                            description = 'The version of the renderer with some extra driver-dependent version info, e.g. "2.1 INTEL-8.10.44".'
                        },
                        {
                            type = 'string',
                            name = 'vendor',
                            description = 'The name of the graphics card vendor, e.g. "Intel Inc."'
                        },
                        {
                            type = 'string',
                            name = 'device',
                            description = 'The name of the graphics card, e.g. "Intel HD Graphics 3000 OpenGL Engine".'
                        }
                    }
                }
            }
        },
        {
            name = 'getScissor',
            description = 'Gets the current scissor box.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x component of the top-left point of the box.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y component of the top-left point of the box.'
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the box.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the box.'
                        }
                    }
                }
            }
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the window.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the window.'
                        }
                    }
                }
            }
        },
        {
            name = 'isWireframe',
            description = 'Gets whether wireframe mode is used when drawing.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'wireframe',
                            description = 'True if wireframe lines are used when drawing, false if it\'s not.'
                        }
                    }
                }
            }
        },
        {
            name = 'line',
            description = 'Draws lines between points.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The position of first point on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The position of first point on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The position of second point on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The position of second point on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'You can continue passing point positions to draw a polyline.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'points',
                            description = 'A table of point positions.'
                        }
                    }
                }
            }
        },
        {
            name = 'newCanvas',
            description = 'Creates a new Canvas object for offscreen rendering.\n\nAntialiased Canvases have slightly higher system requirements than normal Canvases. Additionally, the supported maximum number of FSAA samples varies depending on the system. Use love.graphics.getSystemLimit to check.\n\nIf the number of FSAA samples specified is greater than the maximum supported by the system, the Canvas will still be created but only using the maximum supported amount (this includes 0.)',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            default = 'window width',
                            description = 'The width of the Canvas.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            default = 'window height',
                            description = 'The height of the Canvas.'
                        },
                        {
                            type = 'TextureFormat',
                            name = 'texture_type',
                            default = '"normal"',
                            description = 'The desired texture mode of the Canvas.'
                        },
                        {
                            type = 'number',
                            name = 'fsaa',
                            default = '0',
                            description = 'The desired number of antialiasing samples used when drawing to the Canvas.'
                        }
                    },
                    returns = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'A new Canvas object.'
                        }
                    }
                }
            }
        },
        {
            name = 'newFont',
            description = 'Creates a new Font.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the font file.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = '12',
                            description = 'The size of the font in pixels.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'A File pointing to a font.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = '12',
                            description = 'The size of the font in pixels.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'filedata',
                            description = 'The encoded data to decode into a font.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = '12',
                            description = 'The size of the font in pixels.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                },
                {
                    description = 'This variant uses the default font (Vera Sans) with a custom size.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            default = '12',
                            description = 'The size of the font in pixels.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                }
            }
        },
        {
            name = 'newMesh',
            description = 'Creates a new Mesh.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The table filled with vertex information tables.',
                            table = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position of the vertex on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position of the vertex on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'u',
                                    default = '0',
                                    description = 'The horizontal component of the texture coordinate. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                },
                                {
                                    type = 'number',
                                    name = 'v',
                                    default = '0',
                                    description = 'The vertical component of the texture coordinate. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                },
                                {
                                    type = 'number',
                                    name = 'r',
                                    default = '255',
                                    description = 'The red color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'g',
                                    default = '255',
                                    description = 'The green color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'b',
                                    default = '255',
                                    description = 'The blue color component.'
                                },
                                {
                                    type = 'number',
                                    name = 'a',
                                    default = '255',
                                    description = 'The alpha color component.'
                                }
                            }
                        },
                        {
                            type = 'Texture',
                            name = 'texture',
                            default = 'nil',
                            description = 'The Image or Canvas to use when drawing the Mesh. May be nil to use no texture.'
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            default = '"fan"',
                            description = 'How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.'
                        },
                    },
                    returns = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The new Mesh.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'vertexcount',
                            description = 'The total number of vertices the Mesh will use. Each vertex is initialized to {0,0, 0,0, 255,255,255,255}.'
                        },
                        {
                            type = 'Texture',
                            name = 'texture',
                            default = 'nil',
                            description = 'The Image or Canvas to use when drawing the Mesh. May be nil to use no texture.'
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            default = '"fan"',
                            description = 'How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.'
                        },
                    },
                    returns = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The new Mesh.'
                        }
                    }
                }
            }
        },
        {
            name = 'newImage',
            description = 'Creates a new Image from a filepath, FileData, an ImageData, or a CompressedImageData.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the image file.'
                        }
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'An Image object which can be drawn on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the image file (or a FileData or ImageData or CompressedImageData object.)'
                        },
                        {
                            type = 'TextureFormat',
                            name = 'format',
                            default = '"normal"',
                            description = 'The format to interpret the image\'s data as.'
                        }
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'An Image object which can be drawn on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'A FileData pointing to an image.'
                        },
                        {
                            type = 'TextureFormat',
                            name = 'format',
                            default = '"normal"',
                            description = 'The format to interpret the image\'s data as.'
                        }
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'An Image object which can be drawn on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'An ImageData object.'
                        },
                        {
                            type = 'TextureFormat',
                            name = 'format',
                            default = '"normal"',
                            description = 'The format to interpret the image\'s data as.'
                        }
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'An Image object which can be drawn on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'CompressedImageData',
                            name = 'compressedImageData',
                            description = 'A CompressedImageData object. The Image will use this CompressedImageData to reload itself when love.window.setMode is called.'
                        },
                        {
                            type = 'TextureFormat',
                            name = 'format',
                            default = '"normal"',
                            description = 'The format to interpret the image\'s data as.'
                        }
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'An Image object which can be drawn on screen.'
                        }
                    }
                }
            }
        },
        {
            name = 'newImageFont',
            description = 'Creates a new font by loading a specifically formatted image. There can be up to 256 glyphs.\n\nExpects ISO 8859-1 encoding for the glyphs string.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the image file.'
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'A string of the characters in the image in order from left to right.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'A File pointing to an image.'
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'A string of the characters in the image in order from left to right.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'The encoded data to decode into image data.'
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'A string of the characters in the image in order from left to right.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = '     The ImageData object to create the font from.'
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'A string of the characters in the image in order from left to right.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'The Image object to create the font from.'
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'A string of the characters in the image in order from left to right.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.'
                        }
                    }
                }
            }
        },
        {
            name = 'newParticleSystem',
            description = 'Creates a new ParticleSystem.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Image or Canvas to use.'
                        },
                        {
                            type = 'number',
                            name = 'buffer',
                            description = 'The max number of particles at the same time.'
                        }
                    },
                    returns = {
                        {
                            type = 'ParticleSystem',
                            name = 'system',
                            description = 'A new ParticleSystem.'
                        }
                    }
                }
            }
        },
        {
            name = 'newShader',
            description = 'Creates a new Shader object for hardware-accelerated vertex and pixel effects. A Shader contains either vertex shader code, pixel shader code, or both.\n\nVertex shader code must contain at least one function, named position, which is the function that will produce transformed vertex positions of drawn objects in screen-space.\n\nPixel shader code must contain at least one function, named effect, which is the function that will produce the color which is blended onto the screen for each pixel a drawn object touches.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'code',
                            description = 'The pixel shader or vertex shader code, or a filename pointing to a file with the code.'
                        }
                    },
                    returns = {
                        {
                            type = 'Shader',
                            name = 'shader',
                            description = 'A Shader object for use in drawing operations.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'pixelcode',
                            description = 'The pixel shader code, or a filename pointing to a file with the code.'
                        },
                        {
                            type = 'string',
                            name = 'vertexcode',
                            description = 'The vertex shader code, or a filename pointing to a file with the code.'
                        }
                    },
                    returns = {
                        {
                            type = 'Shader',
                            name = 'shader',
                            description = 'A Shader object for use in drawing operations.'
                        }
                    }
                }
            }
        },
        {
            name = 'newText',
            description = 'Creates a new Font.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The font to use for the text.'
                        },
                        {
                            type = 'string',
                            name = 'textstring',
                            default = 'nil',
                            description = 'The initial string of text that the new Text object will contain. May be nil.'
                        }
                    },
                    returns = {
                        {
                            type = 'Text',
                            name = 'text',
                            description = 'The new drawable Text object.'
                        }
                    }
                }
            }
        },
        {
            name = 'newQuad',
            description = 'Creates a new Quad.\n\nThe purpose of a Quad is to describe the result of the following transformation on any drawable object. The object is first scaled to dimensions sw * sh. The Quad then describes the rectangular area of dimensions width * height whose upper left corner is at position (x, y) inside the scaled object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The top-left position along the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The top-left position along the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Quad.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Quad.'
                        },
                        {
                            type = 'number',
                            name = 'sw',
                            description = 'The reference width, the width of the Image.'
                        },
                        {
                            type = 'number',
                            name = 'sh',
                            description = 'The reference height, the height of the Image.'
                        }
                    },
                    returns = {
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The new Quad.'
                        }
                    }
                }
            }
        },
        {
            name = 'newScreenshot',
            description = 'Creates a screenshot and returns the image data.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'screenshot',
                            description = 'The image data of the screenshot.'
                        }
                    }
                }
            }
        },
        {
            name = 'newSpriteBatch',
            description = 'Creates a new SpriteBatch object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Image or Canvas to use for the sprites.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = '1000',
                            description = 'The max number of sprites.'
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            default = '"dynamic"',
                            description = 'The expected usage of the SpriteBatch.'
                        }
                    },
                    returns = {
                        {
                            type = 'SpriteBatch',
                            name = 'spriteBatch',
                            description = 'The new SpriteBatch.'
                        }
                    }
                }
            }
        },
        {
            name = 'origin',
            description = 'Resets the current coordinate transformation.\n\nThis function is always used to reverse any previous calls to love.graphics.rotate, love.graphics.scale, love.graphics.shear or love.graphics.translate. It returns the current transformation state to its defaults.',
            variants = {
                {}
            }
        },
        {
            name = 'point',
            description = 'Draws a point.\n\nThe pixel grid is actually offset to the center of each pixel. So to get clean pixels drawn use 0.5 + integer increments.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position on the y-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'polygon',
            description = 'Draw a polygon.\n\nFollowing the mode argument, this function can accept multiple numeric arguments or a single table of numeric arguments. In either case the arguments are interpreted as alternating x and y coordinates of the polygon\'s vertices.\n\nWhen in fill mode, the polygon must be convex and simple or rendering artifacts may occur.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the polygon.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'The vertices of the polygon.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the polygon.'
                        },
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The vertices of the polygon as a table.'
                        }
                    }
                }
            }
        },
        {
            name = 'pop',
            description = 'Pops the current coordinate transformation from the transformation stack.\n\nThis function is always used to reverse a previous push operation. It returns the current transformation state to what it was before the last preceding push. For an example, see the description of love.graphics.push.',
            variants = {
                {}
            }
        },
        {
            name = 'present',
            description = 'Displays the results of drawing operations on the screen.\n\nThis function is used when writing your own love.run function. It presents all the results of your drawing operations on the screen. See the example in love.run for a typical use of this function.',
            variants = {
                {}
            }
        },
        {
            name = 'print',
            description = 'Draws text on screen. If no Font is set, one will be created and set (once) if needed.\n\nWhen using translation and scaling functions while drawing text, this function assumes the scale occurs first. If you don\'t script with this in mind, the text won\'t be in the right position, or possibly even on screen.\n\nlove.graphics.print stops at the first \'\0\' (null) character. This can bite you if you are appending keystrokes to form your string, as some of those are multi-byte unicode characters which will likely contain null bytes.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The text to draw.'
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
            name = 'printf',
            description = 'Draws formatted text, with word wrap and alignment.\n\nSee additional notes in love.graphics.print.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'A text string.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'Wrap the line after this many horizontal pixels.'
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            default = '"left"',
                            description = 'The alignment.'
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
            name = 'push',
            description = 'Copies and pushes the current coordinate transformation to the transformation stack.\n\nThis function is always used to prepare for a corresponding pop operation later. It stores the current coordinate transformation state into the transformation stack and keeps it active. Later changes to the transformation can be undone by using the pop operation, which returns the coordinate transform to the state it was in before calling push.',
            variants = {
                {
                    description = 'Pushes the current transformation to the transformation stack.'
                },
                {
                    description = 'Pushes a specific type of state to the stack.',
                    arguments = {
                        {
                            type = 'StackType',
                            name = 'stack',
                            description = 'The type of stack to push (e.g. just transformation state, or all love.graphics state).'
                        },
                    }
                }
            }
        },
        {
            name = 'rectangle',
            description = 'Draws a rectangle.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of top-left corner along x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of top-left corner along y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Width of the rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Height of the rectangle.'
                        }
                    }
                }
            }
        },
        {
            name = 'reset',
            description = 'Resets the current graphics settings.\n\nCalling reset makes the current drawing color white, the current background color black, resets any active Canvas or Shader, and removes any scissor settings. It sets the BlendMode to alpha. It also sets both the point and line drawing modes to smooth and their sizes to 1.0.',
            variants = {
                {}
            }
        },
        {
            name = 'rotate',
            description = 'Rotates the coordinate system in two dimensions.\n\nCalling this function affects all future drawing operations by rotating the coordinate system around the origin by the given amount of radians. This change lasts until love.draw exits.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The amount to rotate the coordinate system in radians.'
                        }
                    }
                }
            }
        },
        {
            name = 'scale',
            description = 'Scales the coordinate system in two dimensions.\n\nBy default the coordinate system in LÖVE corresponds to the display pixels in horizontal and vertical directions one-to-one, and the x-axis increases towards the right while the y-axis increases downwards. Scaling the coordinate system changes this relation.\n\nAfter scaling by sx and sy, all coordinates are treated as if they were multiplied by sx and sy. Every result of a drawing operation is also correspondingly scaled, so scaling by (2, 2) for example would mean making everything twice as large in both x- and y-directions. Scaling by a negative value flips the coordinate system in the corresponding direction, which also means everything will be drawn flipped or upside down, or both. Scaling by zero is not a useful operation.\n\nScale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.\n\nScaling lasts until love.draw exits.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'The scaling in the direction of the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'The scaling in the direction of the y-axis. If omitted, it defaults to same as parameter sx.'
                        }
                    }
                }
            }
        },
        {
            name = 'setBackgroundColor',
            description = 'Sets the background color.',
            variants = {
                {
                    arguments = {
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
                            default = '255',
                            description = 'The alpha component (0-255).'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'rgba',
                            description = 'A numerical indexed table with the red, green and blue values as numbers. Alpha is 255 if it is not in the table'
                        }
                    }
                }
            }
        },
        {
            name = 'setBlendMode',
            description = 'Sets the blending mode.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'BlendMode',
                            name = 'mode',
                            description = 'The blend mode to use.'
                        }
                    }
                }
            }
        },
        {
            name = 'setCanvas',
            description = 'Sets the render target to one or more Canvases. All drawing operations until the next love.graphics.setCanvas call will be redirected to the specified canvases and not shown on the screen.\n\nAll canvas arguments must have the same widths and heights and the same texture type. Normally the same thing will be drawn on each canvas, but that can be changed if a pixel shader is used with the "effects" function instead of the regular effect.\n\nNot all computers support Canvases, and not all computers which support Canvases will support multiple render targets. Use love.graphics.isSupported to check.\n\nnWhen called without arguments, the render target is reset to the screen.',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'A render target.'
                        },
                        {
                            type = 'Canvas',
                            name = '...',
                            description = 'Additional render targets.'
                        }
                    }
                }
            }
        },
        {
            name = 'setColor',
            description = 'Sets the color used for drawing.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'red',
                            description = 'The amount of red.'
                        },
                        {
                            type = 'number',
                            name = 'green',
                            description = 'The amount of green.'
                        },
                        {
                            type = 'number',
                            name = 'blue',
                            description = 'The amount of blue.'
                        },
                        {
                            type = 'number',
                            name = 'alpha',
                            description = 'The amount of alpha. The alpha value will be applied to all subsequent draw operations, even the drawing of an image.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'rgba',
                            description = 'A numerical indexed table with the red, green, blue and alpha values as numbers. The alpha is optional and defaults to 255 if it is left out.'
                        }
                    }
                }
            }
        },
        {
            name = 'setColorMask',
            description = 'Sets the color mask. Enables or disables specific color components when rendering and clearing the screen. For example, if red is set to false, no further changes will be made to the red component of any pixels.\n\nEnables all color components when called without arguments.',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'red',
                            description = 'Render red component.'
                        },
                        {
                            type = 'boolean',
                            name = 'green',
                            description = 'Render green component.'
                        },
                        {
                            type = 'boolean',
                            name = 'blue',
                            description = 'Render blue component.'
                        },
                        {
                            type = 'boolean',
                            name = 'alpha',
                            description = 'Render alpha component.'
                        }
                    }
                }
            }
        },
        {
            name = 'setDefaultFilter',
            description = 'Sets the default scaling filters used with Images, Canvases, and Fonts.\n\nThis function does not apply retroactively to loaded images.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode used when scaling the image down.'
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            default = 'min',
                            description = 'Filter mode used when scaling the image up.'
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            default = 1,
                            description = 'Maximum amount of Anisotropic Filtering used.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFont',
            description = 'Set an already-loaded Font as the current font or create and load a new one from the file and size.\n\nIt\'s recommended that Font objects are created with love.graphics.newFont in the loading stage and then passed to this function in the drawing stage.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The Font object to use.'
                        }
                    }
                }
            }
        },
        {
            name = 'setInvertedStencil',
            description = 'Defines an inverted stencil for the drawing operations or releases the active one.\n\nIt\'s the same as love.graphics.setStencil with the mask inverted.\n\nCalling the function without arguments releases the active stencil.',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'stencilFunction',
                            description = 'Function that draws the stencil.'
                        }
                    }
                }
            }
        },
        {
            name = 'setLineJoin',
            description = 'Sets the line join style.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'LineJoin',
                            name = 'join',
                            description = 'The LineJoin to use.'
                        }
                    }
                }
            }
        },
        {
            name = 'setLineStyle',
            description = 'Sets the line style.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'LineStyle',
                            name = 'style',
                            description = 'The LineStyle to use.'
                        }
                    }
                }
            }
        },
        {
            name = 'setLineWidth',
            description = 'Sets the line width.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the line.'
                        }
                    }
                }
            }
        },
        {
            name = 'setNewFont',
            description = 'Creates and sets a new font.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            default = '12',
                            description = 'The size of the font.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'Creates and sets a new font.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = '12',
                            description = 'The size of the font.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'A File with the font.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = '12',
                            description = 'The size of the font.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data with the font.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = '12',
                            description = 'The size of the font.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'A rasterizer.'
                        }
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.'
                        }
                    }
                }
            }
        },
        {
            name = 'setShader',
            description = 'Sets or resets a Shader as the current pixel effect or vertex shaders. All drawing operations until the next love.graphics.setShader will be drawn using the Shader object specified.\n\nDisables the shaders when called without arguments.',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'Shader',
                            name = 'shader',
                            description = 'The new shader.'
                        }
                    }
                }
            }
        },
        {
            name = 'setPointSize',
            description = 'Sets the point size.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The new point size.'
                        }
                    }
                }
            }
        },
        {
            name = 'setScissor',
            description = 'Sets or disables scissor.\n\nThe scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear.',
            variants = {
                {
                    description = 'Disables scissor.',
                },
                {
                    description = 'Limits the drawing area to a specified rectangle.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X coordinate of upper left corner.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y coordinate of upper left corner.'
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of clipping rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of clipping rectangle.'
                        }
                    }
                }
            }
        },
        {
            name = 'setStencilTest',
            description = 'Enables or disables stencil testing.\n\nWhen stencil testing is enabled, the geometry of everything that is drawn will be clipped / stencilled out based on whether it intersects with what has been previously drawn to the stencil buffer.\n\nEach Canvas has its own stencil buffer.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            default = 'false',
                            description = 'Whether to enable stencil testing.'
                        },
                        {
                            type = 'boolean',
                            name = 'invert',
                            default = 'false',
                            description = 'Whether to invert the stencil test. If true, the parts of drawn geometry that touch what has been previously drawn to the stencil buffer will be clipped. Otherwise everything else will be clipped.'
                        }
                    }
                }
            }
        },
        {
            name = 'setWireframe',
            description = 'Sets whether wireframe lines will be used when drawing.\n\nWireframe mode should only be used for debugging. The lines drawn with it enabled do not behave like regular love.graphics lines: their widths don\'t scale with the coordinate transformations or with love.graphics.setLineWidth, and they don\'t use the smooth LineStyle.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True to enable wireframe mode when drawing, false to disable it.'
                        }
                    }
                }
            }
        },
        {
            name = 'shear',
            description = 'Shears the coordinate system.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'The shear factor on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'The shear factor on the y-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'stencil',
            description = 'Draws geometry to the stencil buffer.\n\nThe passed function draws to the (invisible) stencil buffer instead of the regular screen. The stencil buffer acts like a mask or stencil – the geometry of everything drawn to the stencil buffer determines whether pixels in the buffer are \'enabled\' or not. When the Stencil Test is enabled after love.graphics.stencil is used, everything drawn after that point will clipped / stencilled out based on whether it intersects what has been drawn to the stencil buffer.\n\nEach Canvas has its own stencil buffer.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'stencilfunction',
                            description = 'Function which draws the stencil geometry to the stencil buffer.'
                        },
                        {
                            type = 'boolean',
                            name = 'keepbuffer',
                            default = 'false',
                            description = 'Whether to preserve the previous contents of the stencil buffer. Note that love.graphics.clear will also clear the stencil buffer.'
                        }
                    }
                }
            };
        },
        {
            name = 'translate',
            description = 'Translates the coordinate system in two dimensions.\n\nWhen this function is called with two numbers, dx, and dy, all the following drawing operations take effect as if their x and y coordinates were x+dx and y+dy.\n\nScale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.\n\nThis change lasts until love.graphics.clear is called (which is called automatically before love.draw in the default love.run function), or a love.graphics.pop reverts to a previous coordinate system state.\n\nTranslating using whole numbers will prevent tearing/blurring of images and fonts draw after translating.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The translation relative to the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The translation relative to the y-axis.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        {
            name = 'AlignMode',
            description = 'Text alignment.',
            constants = {
                {
                    name = 'center',
                    description = 'Align text center.'
                },
                {
                    name = 'left',
                    description = 'Align text left.'
                },
                {
                    name = 'right',
                    description = 'Align text right.'
                }
            }
        },
        {
            name = 'AreaSpreadDistribution',
            description = 'Types of particle area spread distribution.',
            constants = {
                {
                    name = 'uniform',
                    description = 'Uniform distribution.'
                },
                {
                    name = 'normal',
                    description = 'Normal (gaussian) distribution.'
                },
                {
                    name = 'none',
                    description = 'No distribution - area spread is disabled.'
                }
            }
        },
        {
            name = 'BlendMode',
            description = 'Different ways you do alpha blending.',
            constants = {
                {
                    name = 'add',
                    description = 'Additive blend mode.'
                },
                {
                    name = 'alpha',
                    description = 'Alpha blend mode ("normal").'
                },
                {
                    name = 'replace',
                    description = 'Replace blend mode.'
                },
                {
                    name = 'screen',
                    description = 'Screen blend mode.'
                },
                {
                    name = 'subtract',
                    description = 'Subtractive blend mode.'
                },
                {
                    name = 'multiply',
                    description = 'Multiply blend mode.'
                }
            }
        },
        {
            name = 'CanvasFormat',
            description = 'Canvas formats.',
            constants = {
                {
                    name = 'normal',
                    description = 'The default Canvas format - an alias for the rgba8 format, normally.'
                },
                {
                    name = 'rgba8',
                    description = '8 bits per channel (32 bpp) RGBA. Color channel values range from 0-255 (0-1 in shaders.)'
                },
                {
                    name = 'rgba4',
                    description = '4 bits per channel (16 bpp) RGBA.'
                },
                {
                    name = 'rgb5a1',
                    description = 'RGB with 5 bits each, and a 1-bit alpha channel (16 bpp.)'
                },
                {
                    name = 'rgb565',
                    description = 'RGB with 5, 6, and 5 bits each, respectively (16 bpp). There is no alpha channel in this format.'
                },
                {
                    name = 'rgb10a2',
                    description = 'RGB with 10 bits per channel, and a 2-bit alpha channel (32 bpp.)'
                },
                {
                    name = 'hdr',
                    description = 'A format suitable for high dynamic range content - an alias for the rgba16f format, normally.'
                },
                {
                    name = 'rgba16f',
                    description = 'Floating point RGBA with 16 bits per channel (64 bpp.) Color values can range from [-infinity, +infinity].'
                },
                {
                    name = 'rgba32f',
                    description = 'Floating point RGBA with 32 bits per channel (128 bpp.) Color values can range from [-infinity, +infinity].'
                },
                {
                    name = 'rg11b10f',
                    description = 'Floating point RGB with 11 bits in the red and green channels, and 10 bits in the blue channel (32 bpp.) There is no alpha channel. Color values can range from [0, +infinity].'
                },
                {
                    name = 'srgb',
                    description = 'The same as rgba8, but the Canvas is interpreted as being in the sRGB color space. Everything drawn to the Canvas will be converted from linear RGB to sRGB. When the Canvas is drawn (or used in a shader), it will be decoded from sRGB to linear RGB.'
                },
            }
        },
        {
            name = 'DrawMode',
            description = 'Controls whether shapes are drawn as an outline, or filled.',
            constants = {
                {
                    name = 'fill',
                    description = 'Draw filled shape.'
                },
                {
                    name = 'line',
                    description = 'Draw outlined shape.'
                }
            }
        },
        {
            name = 'FilterMode',
            description = 'How the image is filtered when scaling.',
            constants = {
                {
                    name = 'linear',
                    description = 'Scale image with linear interpolation.'
                },
                {
                    name = 'nearest',
                    description = 'Scale image with nearest neighbor interpolation.'
                }
            }
        },
        {
            name = 'MeshDrawMode',
            description = 'How a Mesh\'s vertices are used when drawing.',
            constants = {
                {
                    name = 'fan',
                    description = 'The vertices create a "fan" shape with the first vertex acting as the hub point. Can be easily used to draw simple convex polygons.'
                },
                {
                    name = 'strip',
                    description = 'The vertices create a series of connected triangles using vertices 1, 2, 3, then 3, 2, 4 (note the order), then 3, 4, 5 and so on.'
                },
                {
                    name = 'triangles',
                    description = 'The vertices create unconnected triangles.'
                },
                {
                    name = 'points',
                    description = 'The vertices are drawn as unconnected points (see love.graphics.setPointSize.)'
                }
            }
        },
        {
            name = 'GraphicsFeature',
            description = 'Graphics features that can be checked for with love.graphics.isSupported.\n\nsubtractive, mipmap, and dxt are supported on nearly every system.\n\ncanvas, multicanvas, npot, and shader have roughly the same minimum requirements for support: a DirectX 9.0c+ capable graphics card with drivers that support ~OpenGL 2.1+.\n\nhdrcanvas, bc5, and srgb all share mostly the same minimum requirements for support as well: a DirectX 10+ capable graphics card with drivers that support ~OpenGL 3+.\n\nDirectX 9.0c+ capable graphics cards include the nvidia GeForce 5000-series (2003) and newer, the ATI Radeon 9000-series and newer, and the Intel GMA x3100 GPU and newer.\n\nDirectX 10+ capable graphics cards include the nvidia GeForce 8000-series (2006) and newer, the ATI/AMD HD 2000-series and newer, and the Intel HD 2000/3000 GPUs and newer.',
            constants = {
                {
                    name = 'multicanvas',
                    description = 'Support for simultaneous rendering to at least 4 canvases at once, with love.graphics.setCanvas.'
                },
                {
                    name = 'srgb',
                    description = 'Support for gamma-correct rendering with the srgb window flag in love.window.setMode, and the "srgb" TextureFormat for Canvases and Images.'
                }
            }
        },
        {
            name = 'GraphicsLimit',
            description = 'Types of system-dependent graphics limits checked for using love.graphics.getSystemLimit.',
            constants = {
                {
                    name = 'pointsize',
                    description = 'The maximum size of points.'
                },
                {
                    name = 'texturesize',
                    description = 'The maximum width or height of Images and Canvases.'
                },
                {
                    name = 'multicanvas',
                    description = 'The maximum number of simultaneously active canvases (via love.graphics.setCanvas).'
                },
                {
                    name = 'canvasfsaa',
                    description = 'The maximum number of antialiasing samples for a Canvas.'
                }
            }
        },
        {
            name = 'LineJoin',
            description = 'Line join style.',
            constants = {
                {
                    name = 'miter',
                    description = 'Miter style.'
                },
                {
                    name = 'bevel',
                    description = 'Bevel style.'
                },
                {
                    name = 'none',
                    description = 'None style.'
                }
            }
        },
        {
            name = 'LineStyle',
            description = 'The styles in which lines are drawn.',
            constants = {
                {
                    name = 'rough',
                    description = 'Draw rough lines.'
                },
                {
                    name = 'smooth',
                    description = 'Draw smooth lines.'
                }
            }
        },
        {
            name = 'ParticleInsertMode',
            description = 'How newly created particles are added to the ParticleSystem.',
            constants = {
                {
                    name = 'top',
                    description = 'Particles are inserted at the top of the ParticleSystem\'s list of particles.'
                },
                {
                    name = 'bottom',
                    description = 'Particles are inserted at the bottom of the ParticleSystem\'s list of particles.'
                },
                {
                    name = 'random',
                    description = 'Particles are inserted at random positions in the ParticleSystem\'s list of particles.'
                }
            }
        },
        {
            name = 'PointStyle',
            description = 'How points should be drawn.',
            constants = {
                {
                    name = 'rough',
                    description = 'Draw rough points.'
                },
                {
                    name = 'smooth',
                    description = 'Draw smooth points.'
                }
            }
        },
        {
            name = 'SpriteBatchUsage',
            description = 'Usage hints for SpriteBatches to optimize sprite data storage on the GPU.',
            constants = {
                {
                    name = 'dynamic',
                    description = 'The SpriteBatch data will change repeatedly during its lifetime.'
                },
                {
                    name = 'static',
                    description = 'The SpriteBatch will not be modified after initial sprites are added.'
                },
                {
                    name = 'stream',
                    description = 'The SpriteBatch data will always change between draws.'
                }
            }
        },
        {
            name = 'StackType',
            description = 'Graphics state stack types used with love.graphics.push.',
            constants = {
                {
                    name = 'transform',
                    description = 'The transformation stack (love.graphics.translate, love.graphics.rotate, etc.)'
                },
                {
                    name = 'all',
                    description = 'All love.graphics state, including transform state.'
                }
            }
        },
        {
            name = 'TextureFormat',
            description = 'Canvas and Image texture formats.\n\nThe HDR format is most useful when combined with pixel shaders. Effects such as tonemapped HDR with bloom can be accomplished, or the canvas can be used to store arbitrary non-color data such as positions which are then interpreted and used in a shader, as long as you draw the right things to the canvas.\n\nThe sRGB format should only be used when doing gamma-correct rendering, which is an advanced topic and it\'s easy to get color-spaces mixed up. If you\'re not sure whether you need this, you might want to avoid it.\n\nNot all systems support the HDR and sRGB formats. Use love.graphics.isSupported to check before creating the Canvas or Image.',
            constants = {
                {
                    name = 'normal',
                    description = 'The default texture format: 8 bits per channel (32 bpp) RGBA.'
                },
                {
                    name = 'hdr',
                    description = 'Only usable in Canvases. The HDR texture format: floating point 16 bits per channel (64 bpp) RGBA.'
                },
                {
                    name = 'srgb',
                    description = 'The same as normal, but the texture is interpreted as being in the sRGB color space. It will be decoded from sRGB to linear RGB when drawn or sampled from in a shader. For Canvases, this will also convert everything drawn to the Canvas from linear RGB to sRGB.'
                }
            }
        },
        {
            name = 'WrapMode',
            description = 'How the image wraps inside a larger Quad or Mesh.',
            constants = {
                {
                    name = 'clamp',
                    description = 'Clamp the image. Appears only once.'
                },
                {
                    name = 'repeat',
                    description = 'Repeat the image. Fills the whole available extent.'
                },
                {
                    name = 'mirroredrepeat',
                    description = 'Repeat the image, flipping it each time it repeats. May produce better visual results than the repeat mode when the image doesn\'t seamlessly tile.'
                },
            }
        }
    }
}
