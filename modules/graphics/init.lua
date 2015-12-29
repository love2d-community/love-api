return {
    name = 'graphics',
    description = 'The primary responsibility for the love.graphics module is the drawing of lines, shapes, text, Images and other Drawable objects onto the screen. Its secondary responsibilities include loading external files (including Images and Fonts) into memory, creating specialized objects (such as ParticleSystems or Framebuffers) and managing screen geometry.\n\nLÖVE\'s coordinate system is rooted in the upper-left corner of the screen, which is at location (0, 0). The x-axis is horizontal: larger values are further to the right. The y-axis is vertical: larger values are further towards the bottom.\n\nIn many cases, you draw images or shapes in terms of their upper-left corner (See the picture above).\n\nMany of the functions are used to manipulate the graphics coordinate system, which is essentially the way coordinates are mapped to the display. You can change the position, scale, and even rotation in this way.',
    types = {
        require('modules.graphics.Canvas'),
        require('modules.graphics.Font'),
        require('modules.graphics.Mesh'),
        require('modules.graphics.Image'),
        require('modules.graphics.ParticleSystem'),
        require('modules.graphics.Quad'),
        require('modules.graphics.Shader'),
        require('modules.graphics.SpriteBatch'),
        require('modules.graphics.Text')
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
            description = 'Clears the screen to the background color in LÖVE 0.9.2 and earlier, or to the specified color in 0.10.0 and newer.\n\nThis function is called automatically before love.draw in the default love.run function. See the example in love.run for a typical use of this function.\n\nNote that the scissor area bounds the cleared region.',
            variants = {
                {
                    description = 'Clears the screen to the background color in 0.9.2 and earlier, or to transparent black (0, 0, 0, 0) in LÖVE 0.10.0 and newer.'
                },
                {
                    description = 'Clears the screen or active Canvas to the specified color.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red channel of the color to clear the screen to.'
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green channel of the color to clear the screen to.'
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue channel of the color to clear the screen to.'
                        },
                        {
                            type = 'number',
                            name = 'a',
                            default = '255',
                            description = 'The alpha channel of the color to clear the screen to.'
                        },
                    }
                },
                {
                    description = 'Clears multiple active Canvases to different colors, if multiple Canvases are active at once via love.graphics.setCanvas.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'color',
                            description = 'A table in the form of {r, g, b, a} containing the color to clear the first active Canvas to.'
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional tables for each active Canvas.'
                        }
                    }
                }
            }
        },
        {
            name = 'discard',
            description = 'Discards (trashes) the contents of the screen or active Canvas. This is a performance optimization function with niche use cases.\n\nIf the active Canvas has just been changed and the "replace" BlendMode is about to be used to draw something which covers the entire screen, calling love.graphics.discard rather than calling love.graphics.clear or doing nothing may improve performance on mobile devices.\n\nOn some desktop systems this function may do nothing.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'discardcolor',
                            default = 'true',
                            description = 'Whether to discard the texture(s) of the active Canvas(es) (the contents of the screen if no Canvas is active).'
                        },
                        {
                            type = 'boolean',
                            name = 'discardstencil',
                            default = 'true',
                            description = 'Whether to discard the contents of the stencil buffer of the screen / active Canvas.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'discardcolors',
                            description = 'An array containing boolean values indicating whether to discard the texture of each active Canvas, when multiple simultaneous Canvases are active.'
                        },
                        {
                            type = 'boolean',
                            name = 'discardstencil',
                            default = 'true',
                            description = 'Whether to discard the contents of the stencil buffer of the screen / active Canvas.'
                        }
                    }
                }
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
            name = 'getStencilTest',
            description = 'Gets whether stencil testing is enabled.\n\nWhen stencil testing is enabled, the geometry of everything that is drawn will be clipped / stencilled out based on whether it intersects with what has been previously drawn to the stencil buffer.\n\nEach Canvas has its own stencil buffer.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'Whether stencil testing is enabled.'
                        },
                        {
                            type = 'boolean',
                            name = 'inverted',
                            description = 'Whether the stencil test is inverted or not.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSupported',
            description = 'Gets the optional graphics features and whether they\'re supported on the system.\n\nSome older or low-end systems don\'t always support all graphics features.',
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
                            description = 'The name of the renderer, e.g. "OpenGL" or "OpenGL ES".'
                        },
                        {
                            type = 'string',
                            name = 'version',
                            description = 'The version of the renderer with some extra driver-dependent version info, e.g. "2.1 INTEL-8.10.44".'
                        },
                        {
                            type = 'string',
                            name = 'vendor',
                            description = 'The name of the graphics card vendor, e.g. "Intel Inc".'
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
            name = 'intersectScissor',
            description = 'Sets the scissor to the rectangle created by the intersection of the specified rectangle with the existing scissor. If no scissor is active yet, it behaves like love.graphics.setScissor.\n\nThe scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear.\n\nThe dimensions of the scissor is unaffected by graphical transformations (translate, scale, ...).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-coordinate of the upper left corner of the rectangle to intersect with the existing scissor rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-coordinate of the upper left corner of the rectangle to intersect with the existing scissor rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the rectangle to intersect with the existing scissor rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the rectangle to intersect with the existing scissor rectangle.'
                        }
                    }
                }
            }
        },
        {
            name = 'isGammaCorrect',
            description = 'Gets whether gamma-correct rendering is supported and enabled. It can be enabled by setting t.gammacorrect = true in love.conf.\n\nNot all devices support gamma-correct rendering, in which case it will be automatically disabled and this function will return false. It is supported on desktop systems which have graphics cards that are capable of using OpenGL 3 / DIrectX 10, and iOS devices that can use OpenGL ES 3.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'gammacorrect',
                            description = 'True if gamma-correct rendering is supported and was enabled in love.conf, false otherwise.'
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
            description = 'Creates a new Mesh.\n\nUse Mesh:setTexture if the Mesh should be textured with an Image or Canvas when it\'s drawn.',
            variants = {
                {
                    description = 'Creates a standard Mesh with the specified vertices.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The table filled with vertex information tables for each vertex as follows:',
                            table = {
                                {
                                    type = 'number',
                                    name = '[1]',
                                    description = 'The position of the vertex on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = '[2]',
                                    description = 'The position of the vertex on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = '[3]',
                                    default = '0',
                                    description = 'The u texture coordinate of the vertex. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                },
                                {
                                    type = 'number',
                                    name = '[4]',
                                    default = '0',
                                    description = 'The v texture coordinate of the vertex. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                },
                                {
                                    type = 'number',
                                    name = '[5]',
                                    default = '255',
                                    description = 'The red component of the vertex color.'
                                },
                                {
                                    type = 'number',
                                    name = '[6]',
                                    default = '255',
                                    description = 'The green component of the vertex color.'
                                },
                                {
                                    type = 'number',
                                    name = '[7]',
                                    default = '255',
                                    description = 'The blue component of the vertex color.'
                                },
                                {
                                    type = 'number',
                                    name = '[8]',
                                    default = '255',
                                    description = 'The alpha component of the vertex color.'
                                }
                            }
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            default = '"fan"',
                            description = 'How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.'
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            default = '"dynamic"',
                            description = 'The expected usage of the Mesh. The specified usage mode affects the Mesh\'s memory usage and performance.'
                        }
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
                    description = 'Creates a standard Mesh with the specified number of vertices.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'vertexcount',
                            description = 'The total number of vertices the Mesh will use. Each vertex is initialized to {0,0, 0,0, 255,255,255,255}.'
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            default = '"fan"',
                            description = 'How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.'
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            default = '"dynamic"',
                            description = 'The expected usage of the Mesh. The specified usage mode affects the Mesh\'s memory usage and performance.'
                        }
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
                    description = 'Creates a Mesh with custom vertex attributes and the specified vertex data.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertexformat',
                            description = 'A table in the form of {attribute, ...}. Each attribute is a table which specifies a custom vertex attribute used for each vertex.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'attribute',
                                    description = 'A table containing the attribute\'s name, it\'s data type, and the number of components in the attribute, in the form of {name, datatype, components}.'
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional vertex attribute format tables.'
                                }
                            }
                        },
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The table filled with vertex information tables for each vertex, in the form of {vertex, ...} where each vertex is a table in the form of {attributecomponent, ...}.',
                            table = {
                                {
                                    type = 'number',
                                    name = 'attributecomponent',
                                    description = 'The first component of the first vertex attribute in the vertex.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional components of all vertex attributes in the vertex.'
                                }
                            }
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            default = '"fan"',
                            description = 'How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.'
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            default = '"dynamic"',
                            description = 'The expected usage of the Mesh. The specified usage mode affects the Mesh\'s memory usage and performance.'
                        }
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
                    description = 'Creates a Mesh with custom vertex attributes and the specified number of vertices.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertexformat',
                            description = 'A table in the form of {attribute, ...}. Each attribute is a table which specifies a custom vertex attribute used for each vertex.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'attribute',
                                    description = 'A table containing the attribute\'s name, it\'s data type, and the number of components in the attribute, in the form of {name, datatype, components}.'
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional vertex attribute format tables.'
                                }
                            }
                        },
                        {
                            type = 'number',
                            name = 'vertexcount',
                            description = 'The total number of vertices the Mesh will use.'
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            default = '"fan"',
                            description = 'How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.'
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            default = '"dynamic"',
                            description = 'The expected usage of the Mesh. The specified usage mode affects the Mesh\'s memory usage and performance.'
                        }
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
            description = 'Creates a new Image from a filepath, FileData, an ImageData, or a CompressedImageData, and optionally generates or specifies mipmaps for the image.',
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
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'An ImageData object. The Image will use this ImageData to reload itself when love.window.setMode is called.'
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
                            description = 'The filepath to the image file (or a FileData or ImageData or CompressedImageData object).'
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'A table containing the following fields:',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    default = 'false',
                                    description = 'True if the image\'s pixels should be interpreted as being linear RGB rather than sRGB-encoded, if gamma-correct rendering is enabled. Has no effect otherwise.'
                                },
                                {
                                    type = 'boolean or table',
                                    name = 'mipmaps',
                                    default = 'false',
                                    description = 'If true, mipmaps for the image will be automatically generated (or taken from the images\'s file if possible, if the image originated from a CompressedImageData). If this value is a table, it should contain a list of other filenames of images of the same format that have progressively half-sized dimensions, all the way down to 1x1. Those images will be used as this Image\'s mipmap levels.'
                                }
                            }
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
            description = 'Creates a new Font by loading a specifically formatted image. There can be up to 256 glyphs.\n\nIn versions prior to 0.9.0, LÖVE expects ISO 8859-1 encoding for the glyphs string.',
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
                },
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
                        },
                        {
                            type = 'number',
                            name = 'extraspacing',
                            description = 'Additional spacing (positive or negative) to apply to each glyph in the Font.'
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
            name = 'newVideo',
            description = 'Creates a new drawable Video. Currently only Ogg Theora video files are supported.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The file path to the Ogg Theora video file.'
                        },
                        {
                            type = 'boolean',
                            name = 'loadaudio',
                            default = 'nil',
                            description = 'Whether to try to load the video\'s audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio.'
                        }
                    },
                    returns = {
                        {
                            type = 'Video',
                            name = 'video',
                            description = 'A new Video.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'VideoStream',
                            name = 'videostream',
                            description = 'A video stream object.'
                        },
                        {
                            type = 'boolean',
                            name = 'loadaudio',
                            default = 'nil',
                            description = 'Whether to try to load the video\'s audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio.'
                        }
                    },
                    returns = {
                        {
                            type = 'Video',
                            name = 'video',
                            description = 'A new Video.'
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
            name = 'points',
            description = 'Draws one or more points.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the first point on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the first point on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'The x and y coordinates of additional points.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'points',
                            description = 'A table containing multiple point positions, in the form of {x, y, ...}.',
                            table = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position of the first point on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position of the first point on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'The x and y coordinates of additional points.'
                                }
                            }
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'points',
                            description = 'A table containing multiple individually colored points, in the form of {point, ...}. Each table contains the position and color of a point in the form of {x, y, r, g, b, a}. The color components are optional.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'point',
                                    description = 'A table containing the position and color of the first point, in the form of {x, y, r, g, b, a}. The color components are optional.'
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional tables containing the position and color of more points, in the form of {x, y, r, g, b, a}. The color components are optional.'
                                }
                            }
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
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.'
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.'
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.'
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.'
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.'
                                }
                            }
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the new text on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the new text on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            default = '0',
                            description = 'The orientation of the object in radians.'
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            default = '1',
                            description = 'Scale factor on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'Scale factor on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'Origin offset on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Origin offset on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            default = '0',
                            description = 'Shearing / skew factor on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            default = '0',
                            description = 'Shearing / skew factor on the y-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'printf',
            description = 'Draws formatted text, with word wrap and alignment.\n\nSee additional notes in love.graphics.print.\n\nIn version 0.9.2 and earlier, wrapping was implemented by breaking up words by spaces and putting them back together to make sure things fit nicely within the limit provided. However, due to the way this is done, extra spaces between words would end up missing when printed on the screen, and some lines could overflow past the provided wrap limit. In version 0.10.0 and newer this is no longer the case.',
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
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.'
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.'
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.'
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.'
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.'
                                }
                            }
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the new text on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the new text on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'wraplimit',
                            description = 'The maximum width in pixels of the text before it gets automatically wrapped to a new line.'
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment of the text.'
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            default = '0',
                            description = 'The orientation of the object in radians.'
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            default = '1',
                            description = 'Scale factor on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            default = 'sx',
                            description = 'Scale factor on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'Origin offset on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Origin offset on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            default = '0',
                            description = 'Shearing / skew factor on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            default = '0',
                            description = 'Shearing / skew factor on the y-axis.'
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
                            description = 'The position of top-left corner along the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of top-left corner along the y-axis.'
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
                },
                {
                    description = 'Draws a rectangle with rounded corners.',
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of top-left corner along the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of top-left corner along the y-axis.'
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
                        },
                        {
                            type = 'number',
                            name = 'rx',
                            description = 'The x-axis radius of each round corner. Cannot be greater than half the rectangle\'s width.'
                        },
                        {
                            type = 'number',
                            name = 'ry',
                            default = 'rx',
                            description = 'The y-axis radius of each round corner. Cannot be greater than half the rectangle\'s height.'
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            default = 'nil',
                            description = 'The number of segments used for drawing the round corners. A default amount will be chosen if no number is given.'
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
                },
                {
                    arguments = {
                        {
                            type = 'BlendMode',
                            name = 'mode',
                            description = 'The blend mode to use.'
                        },
                        {
                            type = 'BlendAlphaMode',
                            name = 'alphamode',
                            default = '"alphamultiply"',
                            description = 'What to do with the alpha of drawn objects when blending.'
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
                },
                {
                    description = 'Disables scissor.',
                }
            }
        },
        {
            name = 'setStencilTest',
            description = 'Configures or disables stencil testing.\n\nWhen stencil testing is enabled, the geometry of everything that is drawn afterward will be clipped / stencilled out based on a comparison between the arguments of this function and the stencil value of each pixel that the geometry touches. The stencil values of pixels are affected via love.graphics.stencil.\n\nEach Canvas has its own per-pixel stencil values.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'CompareMode',
                            name = 'comparemode',
                            description = 'The type of comparison to make for each pixel.'
                        },
                        {
                            type = 'number',
                            name = 'comparevalue',
                            description = 'The value to use when comparing with the stencil value of each pixel. Must be between 0 and 255.'
                        }
                    }
                },
                {
                  description = 'Disables stencil testing.'
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
            description = 'Draws geometry as a stencil.\n\nThe geometry drawn by the supplied function sets invisible stencil values of pixels, instead of setting pixel colors. The stencil values of pixels can act like a mask / stencil - love.graphics.setStencilTest can be used afterward to determine how further rendering is affected by the stencil values in each pixel.\n\nEach Canvas has its own per-pixel stencil values. Stencil values are within the range of [0, 255].',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'stencilfunction',
                            description = 'Function which draws geometry. The stencil values of pixels, rather than the color of each pixel, will be affected by the geometry.'
                        },
                        {
                            type = 'StencilAction',
                            name = 'action',
                            default = '"replace"',
                            description = 'How to modify any stencil values of pixels that are touched by what\'s drawn in the stencil function.'
                        },
                        {
                            type = 'number',
                            name = 'value',
                            default = '1',
                            description = 'The new stencil value to use for pixels if the "replace" stencil action is used. Must be between 0 and 255.'
                        },
                        {
                            type = 'boolean',
                            name = 'keepvalues',
                            default = 'false',
                            description = 'True to preserve old stencil values of pixels, false to re-set every pixel\'s stencil value to 0 before executing the stencil function. love.graphics.clear will also re-set all stencil values.'
                        }
                    }
                }
            },
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
        require('modules.graphics.AlignMode'),
        require('modules.graphics.AreaSpreadDistribution'),
        require('modules.graphics.BlendMode'),
        require('modules.graphics.CanvasFormat'),
        require('modules.graphics.DrawMode'),
        require('modules.graphics.FilterMode'),
        require('modules.graphics.GraphicsFeature'),
        require('modules.graphics.GraphicsLimit'),
        require('modules.graphics.LineJoin'),
        require('modules.graphics.LineStyle'),
        require('modules.graphics.MeshDrawMode'),
        require('modules.graphics.ParticleInsertMode'),
        require('modules.graphics.PointStyle'),
        require('modules.graphics.SpriteBatchUsage'),
        require('modules.graphics.StackType'),
        require('modules.graphics.TextureFormat'),
        require('modules.graphics.WrapMode')
    }
}
