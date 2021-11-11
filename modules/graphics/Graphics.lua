local path = (...):match('(.-)[^%./]+$')

return {
    name = 'graphics',
    description = 'The primary responsibility for the love.graphics module is the drawing of lines, shapes, text, Images and other Drawable objects onto the screen. Its secondary responsibilities include loading external files (including Images and Fonts) into memory, creating specialized objects (such as ParticleSystems or Canvases) and managing screen geometry.\n\nLÖVE\'s coordinate system is rooted in the upper-left corner of the screen, which is at location (0, 0). The x axis is horizontal: larger values are further to the right. The y axis is vertical: larger values are further towards the bottom.\n\nIn many cases, you draw images or shapes in terms of their upper-left corner.\n\nMany of the functions are used to manipulate the graphics coordinate system, which is essentially the way coordinates are mapped to the display. You can change the position, scale, and even rotation in this way.',
    types = {
        require(path .. 'types.Canvas'),
        require(path .. 'types.Drawable'),
        require(path .. 'types.Font'),
        require(path .. 'types.Image'),
        require(path .. 'types.Mesh'),
        require(path .. 'types.ParticleSystem'),
        require(path .. 'types.Quad'),
        require(path .. 'types.Shader'),
        require(path .. 'types.SpriteBatch'),
        require(path .. 'types.Text'),
        require(path .. 'types.Texture'),
        require(path .. 'types.Video'),
    },
    functions = {
        {
            name = 'applyTransform',
            description = 'Applies the given Transform object to the current coordinate transformation.\n\nThis effectively multiplies the existing coordinate transformation\'s matrix with the Transform object\'s internal matrix to produce the new coordinate transformation.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object to apply to the current graphics coordinate transform.',
                        },
                    },
                },
            },
        },
        {
            name = 'arc',
            description = 'Draws a filled or unfilled arc at position (x, y). The arc is drawn from angle1 to angle2 in radians. The segments parameter determines how many segments are used to draw the arc. The more segments, the smoother the edge.',
            variants = {
                {
                    description = 'Draws an arc using the \'pie\' ArcType.',
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'drawmode',
                            description = 'How to draw the arc.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'Radius of the arc.',
                        },
                        {
                            type = 'number',
                            name = 'angle1',
                            description = 'The angle at which the arc begins.',
                        },
                        {
                            type = 'number',
                            name = 'angle2',
                            description = 'The angle at which the arc terminates.',
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            description = 'The number of segments used for drawing the arc.',
                            default = '10',
                        },
                    },
                },
                {
                    description = '',
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'drawmode',
                            description = 'How to draw the arc.',
                        },
                        {
                            type = 'ArcType',
                            name = 'arctype',
                            description = 'The type of arc to draw.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'Radius of the arc.',
                        },
                        {
                            type = 'number',
                            name = 'angle1',
                            description = 'The angle at which the arc begins.',
                        },
                        {
                            type = 'number',
                            name = 'angle2',
                            description = 'The angle at which the arc terminates.',
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            description = 'The number of segments used for drawing the arc.',
                            default = '10',
                        },
                    },
                },
            },
        },
        {
            name = 'captureScreenshot',
            description = 'Creates a screenshot once the current frame is done (after love.draw has finished).\n\nSince this function enqueues a screenshot capture rather than executing it immediately, it can be called from an input callback or love.update and it will still capture all of what\'s drawn to the screen in that frame.',
            variants = {
                {
                    description = 'Capture a screenshot and save it to a file at the end of the current frame.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename to save the screenshot to. The encoded image type is determined based on the extension of the filename, and must be one of the ImageFormats.',
                        },
                    },
                },
                {
                    description = 'Capture a screenshot and call a callback with the generated ImageData at the end of the current frame.',
                    arguments = {
                        {
                            type = 'function',
                            name = 'callback',
                            description = 'Function which gets called once the screenshot has been captured. An ImageData is passed into the function as its only argument.',
                        },
                    },
                },
                {
                    description = 'Capture a screenshot and push the generated ImageData to a Channel at the end of the current frame.',
                    arguments = {
                        {
                            type = 'Channel',
                            name = 'channel',
                            description = 'The Channel to push the generated ImageData to.',
                        },
                    },
                },
            },
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
                            description = 'How to draw the circle.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'The radius of the circle.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the circle.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'The radius of the circle.',
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            description = 'The number of segments used for drawing the circle. Note: The default variable for the segments parameter varies between different versions of LÖVE.',
                        },
                    },
                },
            },
        },
        {
            name = 'clear',
            description = 'Clears the screen or active Canvas to the specified color.\n\nThis function is called automatically before love.draw in the default love.run function. See the example in love.run for a typical use of this function.\n\nNote that the scissor area bounds the cleared region.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.\n\nIn versions prior to background color instead.',
            variants = {
                {
                    description = 'Clears the screen to the background color in 0.9.2 and earlier, or to transparent black (0, 0, 0, 0) in LÖVE 0.10.0 and newer.',
                },
                {
                    description = 'Clears the screen or active Canvas to the specified color.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red channel of the color to clear the screen to.',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green channel of the color to clear the screen to.',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue channel of the color to clear the screen to.',
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The alpha channel of the color to clear the screen to.',
                            default = '1',
                        },
                        {
                            type = 'boolean',
                            name = 'clearstencil',
                            description = 'Whether to clear the active stencil buffer, if present. It can also be an integer between 0 and 255 to clear the stencil buffer to a specific value.',
                            default = 'true',
                        },
                        {
                            type = 'boolean',
                            name = 'cleardepth',
                            description = 'Whether to clear the active depth buffer, if present. It can also be a number between 0 and 1 to clear the depth buffer to a specific value.',
                            default = 'true',
                        },
                    },
                },
                {
                    description = 'Clears multiple active Canvases to different colors, if multiple Canvases are active at once via love.graphics.setCanvas.\n\nA color must be specified for each active Canvas, when this function variant is used.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'color',
                            description = 'A table in the form of {r, g, b, a} containing the color to clear the first active Canvas to.',
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional tables for each active Canvas.',
                        },
                        {
                            type = 'boolean',
                            name = 'clearstencil',
                            description = 'Whether to clear the active stencil buffer, if present. It can also be an integer between 0 and 255 to clear the stencil buffer to a specific value.',
                            default = 'true',
                        },
                        {
                            type = 'boolean',
                            name = 'cleardepth',
                            description = 'Whether to clear the active depth buffer, if present. It can also be a number between 0 and 1 to clear the depth buffer to a specific value.',
                            default = 'true',
                        },
                    },
                },
                {
                    description = 'Clears the stencil or depth buffers without having to clear the color canvas as well.',
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'clearcolor',
                            description = 'Whether to clear the active color canvas to transparent black (0, 0, 0, 0). Typically this should be set to false with this variant of the function.',
                        },
                        {
                            type = 'boolean',
                            name = 'clearstencil',
                            description = 'Whether to clear the active stencil buffer, if present. It can also be an integer between 0 and 255 to clear the stencil buffer to a specific value.',
                        },
                        {
                            type = 'boolean',
                            name = 'cleardepth',
                            description = 'Whether to clear the active depth buffer, if present. It can also be a number between 0 and 1 to clear the depth buffer to a specific value.',
                        },
                    },
                },
            },
        },
        {
            name = 'discard',
            description = 'Discards (trashes) the contents of the screen or active Canvas. This is a performance optimization function with niche use cases.\n\nIf the active Canvas has just been changed and the \'replace\' BlendMode is about to be used to draw something which covers the entire screen, calling love.graphics.discard rather than calling love.graphics.clear or doing nothing may improve performance on mobile devices.\n\nOn some desktop systems this function may do nothing.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'discardcolor',
                            description = 'Whether to discard the texture(s) of the active Canvas(es) (the contents of the screen if no Canvas is active.)',
                            default = 'true',
                        },
                        {
                            type = 'boolean',
                            name = 'discardstencil',
                            description = 'Whether to discard the contents of the stencil buffer of the screen / active Canvas.',
                            default = 'true',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'discardcolors',
                            description = 'An array containing boolean values indicating whether to discard the texture of each active Canvas, when multiple simultaneous Canvases are active.',
                        },
                        {
                            type = 'boolean',
                            name = 'discardstencil',
                            description = 'Whether to discard the contents of the stencil buffer of the screen / active Canvas.',
                            default = 'true',
                        },
                    },
                },
            },
        },
        {
            name = 'draw',
            description = 'Draws a Drawable object (an Image, Canvas, SpriteBatch, ParticleSystem, Mesh, Text object, or Video) on the screen with optional rotation, scaling and shearing.\n\nObjects are drawn relative to their local coordinate system. The origin is by default located at the top left corner of Image and Canvas. All scaling, shearing, and rotation arguments transform the object relative to that point. Also, the position of the origin can be specified on the screen coordinate system.\n\nIt\'s possible to rotate an object about its center by offsetting the origin to the center. Angles must be given in radians for rotation. One can also use a negative scaling factor to flip about its centerline. \n\nNote that the offsets are applied before rotation, scaling, or shearing; scaling and shearing are applied before rotation.\n\nThe right and bottom edges of the object are shifted at an angle defined by the shearing factors.\n\nWhen using the default shader anything drawn with this function will be tinted according to the currently selected color.  Set it to pure white to preserve the object\'s original colors.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Drawable',
                            name = 'drawable',
                            description = 'A drawable object.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the object (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the object (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'A Texture (Image or Canvas) to texture the Quad with.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The Quad to draw on screen.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the object (x-axis).',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the object (y-axis).',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Drawable',
                            name = 'drawable',
                            description = 'A drawable object.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'A Texture (Image or Canvas) to texture the Quad with.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The Quad to draw on screen.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                    },
                },
            },
        },
        {
            name = 'drawInstanced',
            description = 'Draws many instances of a Mesh with a single draw call, using hardware geometry instancing.\n\nEach instance can have unique properties (positions, colors, etc.) but will not by default unless a custom per-instance vertex attributes or the love_InstanceID GLSL 3 vertex shader variable is used, otherwise they will all render at the same position on top of each other.\n\nInstancing is not supported by some older GPUs that are only capable of using OpenGL ES 2 or OpenGL 2. Use love.graphics.getSupported to check.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The mesh to render.',
                        },
                        {
                            type = 'number',
                            name = 'instancecount',
                            description = 'The number of instances to render.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the instances (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the instances (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The mesh to render.',
                        },
                        {
                            type = 'number',
                            name = 'instancecount',
                            description = 'The number of instances to render.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'A transform object.',
                        },
                    },
                },
            },
        },
        {
            name = 'drawLayer',
            description = 'Draws a layer of an Array Texture.',
            variants = {
                {
                    description = 'Draws a layer of an Array Texture.',
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Array Texture to draw.',
                        },
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use when drawing.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the texture (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the texture (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    description = 'Draws a layer of an Array Texture using the specified Quad.\n\nThe specified layer index overrides any layer index set on the Quad via Quad:setLayer.',
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Array Texture to draw.',
                        },
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use when drawing.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The subsection of the texture\'s layer to use when drawing.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the texture (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the texture (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    description = 'Draws a layer of an Array Texture using the specified Transform.',
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Array Texture to draw.',
                        },
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use when drawing.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'A transform object.',
                        },
                    },
                },
                {
                    description = 'Draws a layer of an Array Texture using the specified Quad and Transform.\n\nIn order to use an Array Texture or other non-2D texture types as the main texture in a custom void effect() variant must be used in the pixel shader, and MainTex must be declared as an ArrayImage or sampler2DArray like so: uniform ArrayImage MainTex;.',
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Array Texture to draw.',
                        },
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use when drawing.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The subsection of the texture\'s layer to use when drawing.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'A transform object.',
                        },
                    },
                },
            },
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
                            description = 'How to draw the ellipse.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'radiusx',
                            description = 'The radius of the ellipse along the x-axis (half the ellipse\'s width).',
                        },
                        {
                            type = 'number',
                            name = 'radiusy',
                            description = 'The radius of the ellipse along the y-axis (half the ellipse\'s height).',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the ellipse.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the center along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the center along y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'radiusx',
                            description = 'The radius of the ellipse along the x-axis (half the ellipse\'s width).',
                        },
                        {
                            type = 'number',
                            name = 'radiusy',
                            description = 'The radius of the ellipse along the y-axis (half the ellipse\'s height).',
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            description = 'The number of segments used for drawing the ellipse.',
                        },
                    },
                },
            },
        },
        {
            name = 'flushBatch',
            description = 'Immediately renders any pending automatically batched draws.\n\nLÖVE will call this function internally as needed when most state is changed, so it is not necessary to manually call it.\n\nThe current batch will be automatically flushed by love.graphics state changes (except for the transform stack and the current color), as well as Shader:send and methods on Textures which change their state. Using a different Image in consecutive love.graphics.draw calls will also flush the current batch.\n\nSpriteBatches, ParticleSystems, Meshes, and Text objects do their own batching and do not affect automatic batching of other draws, aside from flushing the current batch when they\'re drawn.',
            variants = {
                {
                },
            },
        },
        {
            name = 'getBackgroundColor',
            description = 'Gets the current background color.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The alpha component (0-1).',
                        },
                    },
                },
            },
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
                            description = 'The current blend mode.',
                        },
                        {
                            type = 'BlendAlphaMode',
                            name = 'alphamode',
                            description = 'The current blend alpha mode – it determines how the alpha of drawn objects affects blending.',
                        },
                    },
                },
            },
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
                            description = 'The Canvas set by setCanvas. Returns nil if drawing to the real screen.',
                        },
                    },
                },
            },
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
                            description = 'A table containing CanvasFormats as keys, and a boolean indicating whether the format is supported as values. Not all systems support all formats.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'readable',
                            description = 'If true, the returned formats will only be indicated as supported if readable flag set to true for that format, and vice versa if the parameter is false.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'formats',
                            description = 'A table containing CanvasFormats as keys, and a boolean indicating whether the format is supported as values (taking into account the readable parameter). Not all systems support all formats.',
                        },
                    },
                },
            },
        },
        {
            name = 'getColor',
            description = 'Gets the current color.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The alpha component (0-1).',
                        },
                    },
                },
            },
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
                            description = 'Whether the red color component is active when rendering.',
                        },
                        {
                            type = 'boolean',
                            name = 'g',
                            description = 'Whether the green color component is active when rendering.',
                        },
                        {
                            type = 'boolean',
                            name = 'b',
                            description = 'Whether the blue color component is active when rendering.',
                        },
                        {
                            type = 'boolean',
                            name = 'a',
                            description = 'Whether the alpha color component is active when rendering.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDPIScale',
            description = 'Gets the DPI scale factor of the window.\n\nThe DPI scale factor represents relative pixel density. The pixel density inside the window might be greater (or smaller) than the \'size\' of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.graphics.getDPIScale() would return 2 in that case.\n\nThe love.window.fromPixels and love.window.toPixels functions can also be used to convert between units.\n\nThe highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.',
            variants = {
                {
                    description = 'The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, mouse events, love.touch.getPosition, and touch events are always in DPI-scaled units rather than pixels. In LÖVE 0.10 and older they were in pixels.',
                    returns = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The pixel scale factor associated with the window.',
                        },
                    },
                },
            },
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
                            description = 'Filter mode used when scaling the image down.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when scaling the image up.',
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of Anisotropic Filtering used.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDepthMode',
            description = 'Gets the current depth test mode and whether writing to the depth buffer is enabled.\n\nThis is low-level functionality designed for use with custom vertex shaders and Meshes with custom vertex attributes. No higher level APIs are provided to set the depth of 2D graphics such as shapes, lines, and Images.',
            variants = {
                {
                    returns = {
                        {
                            type = 'CompareMode',
                            name = 'comparemode',
                            description = 'Depth comparison mode used for depth testing.',
                        },
                        {
                            type = 'boolean',
                            name = 'write',
                            description = 'Whether to write update / write values to the depth buffer when rendering.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDimensions',
            description = 'Gets the width and height in pixels of the window.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the window.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the window.',
                        },
                    },
                },
            },
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
                            description = 'The current Font. Automatically creates and sets the default font, if none is set yet.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFrontFaceWinding',
            description = 'Gets whether triangles with clockwise- or counterclockwise-ordered vertices are considered front-facing.\n\nThis is designed for use in combination with Mesh face culling. Other love.graphics shapes, lines, and sprites are not guaranteed to have a specific winding order to their internal vertices.',
            variants = {
                {
                    returns = {
                        {
                            type = 'VertexWinding',
                            name = 'winding',
                            description = 'The winding mode being used. The default winding is counterclockwise (\'ccw\').',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets the height in pixels of the window.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the window.',
                        },
                    },
                },
            },
        },
        {
            name = 'getImageFormats',
            description = 'Gets the raw and compressed pixel formats usable for Images, and whether each is supported.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'formats',
                            description = 'A table containing PixelFormats as keys, and a boolean indicating whether the format is supported as values. Not all systems support all formats.',
                        },
                    },
                },
            },
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
                            description = 'The LineJoin style.',
                        },
                    },
                },
            },
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
                            description = 'The current line style.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLineWidth',
            description = 'Gets the current line width.',
            variants = {
                {
                    description = 'This function does not work in 0.8.0, but has been fixed in version 0.9.0. Use the following snippet to circumvent this in 0.8.0;\n\nlove.graphics._getLineWidth = love.graphics.getLineWidth\n\nlove.graphics._setLineWidth = love.graphics.setLineWidth\n\nfunction love.graphics.getLineWidth() return love.graphics.varlinewidth or 1 end\n\nfunction love.graphics.setLineWidth(w) love.graphics.varlinewidth = w; return love.graphics._setLineWidth(w) end',
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The current line width.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMeshCullMode',
            description = 'Gets whether back-facing triangles in a Mesh are culled.\n\nMesh face culling is designed for use with low level custom hardware-accelerated 3D rendering via custom vertex attributes on Meshes, custom vertex shaders, and depth testing with a depth buffer.',
            variants = {
                {
                    returns = {
                        {
                            type = 'CullMode',
                            name = 'mode',
                            description = 'The Mesh face culling mode in use (whether to render everything, cull back-facing triangles, or cull front-facing triangles).',
                        },
                    },
                },
            },
        },
        {
            name = 'getPixelDimenions',
            description = 'Gets the width and height in pixels of the window.\n\nlove.graphics.getDimensions gets the dimensions of the window in units scaled by the screen\'s DPI scale factor, rather than pixels. Use getDimensions for calculations related to drawing to the screen and using the graphics coordinate system (calculating the center of the screen, for example), and getPixelDimensions only when dealing specifically with underlying pixels (pixel-related calculations in a pixel Shader, for example).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'pixelwidth',
                            description = 'The width of the window in pixels.',
                        },
                        {
                            type = 'number',
                            name = 'pixelheight',
                            description = 'The height of the window in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPixelHeight',
            description = 'Gets the height in pixels of the window.\n\nThe graphics coordinate system and DPI scale factor, rather than raw pixels. Use getHeight for calculations related to drawing to the screen and using the coordinate system (calculating the center of the screen, for example), and getPixelHeight only when dealing specifically with underlying pixels (pixel-related calculations in a pixel Shader, for example).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'pixelheight',
                            description = 'The height of the window in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPixelWidth',
            description = 'Gets the width in pixels of the window.\n\nThe graphics coordinate system and DPI scale factor, rather than raw pixels. Use getWidth for calculations related to drawing to the screen and using the coordinate system (calculating the center of the screen, for example), and getPixelWidth only when dealing specifically with underlying pixels (pixel-related calculations in a pixel Shader, for example).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'pixelwidth',
                            description = 'The width of the window in pixels.',
                        },
                    },
                },
            },
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
                            description = 'The current point size.',
                        },
                    },
                },
            },
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
                            description = 'The name of the renderer, e.g. \'OpenGL\' or \'OpenGL ES\'.',
                        },
                        {
                            type = 'string',
                            name = 'version',
                            description = 'The version of the renderer with some extra driver-dependent version info, e.g. \'2.1 INTEL-8.10.44\'.',
                        },
                        {
                            type = 'string',
                            name = 'vendor',
                            description = 'The name of the graphics card vendor, e.g. \'Intel Inc\'. ',
                        },
                        {
                            type = 'string',
                            name = 'device',
                            description = 'The name of the graphics card, e.g. \'Intel HD Graphics 3000 OpenGL Engine\'.',
                        },
                    },
                },
            },
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
                            description = 'The x-component of the top-left point of the box.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the top-left point of the box.',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the box.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the box.',
                        },
                    },
                },
            },
        },
        {
            name = 'getShader',
            description = 'Gets the current Shader. Returns nil if none is set.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Shader',
                            name = 'shader',
                            description = 'The currently active Shader, or nil if none is set.',
                        },
                    },
                },
            },
        },
        {
            name = 'getStackDepth',
            description = 'Gets the current depth of the transform / state stack (the number of pushes without corresponding pops).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'depth',
                            description = 'The current depth of the transform and state love.graphics stack.',
                        },
                    },
                },
            },
        },
        {
            name = 'getStats',
            description = 'Gets performance-related rendering statistics. ',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'stats',
                            description = 'A table with the following fields:',
                            table = {
                                {
                                    type = 'number',
                                    name = 'drawcalls',
                                    description = 'The number of draw calls made so far during the current frame.',
                                },
                                {
                                    type = 'number',
                                    name = 'canvasswitches',
                                    description = 'The number of times the active Canvas has been switched so far during the current frame.',
                                },
                                {
                                    type = 'number',
                                    name = 'texturememory',
                                    description = 'The estimated total size in bytes of video memory used by all loaded Images, Canvases, and Fonts.',
                                },
                                {
                                    type = 'number',
                                    name = 'images',
                                    description = 'The number of Image objects currently loaded.',
                                },
                                {
                                    type = 'number',
                                    name = 'canvases',
                                    description = 'The number of Canvas objects currently loaded.',
                                },
                                {
                                    type = 'number',
                                    name = 'fonts',
                                    description = 'The number of Font objects currently loaded.',
                                },
                                {
                                    type = 'number',
                                    name = 'shaderswitches',
                                    description = 'The number of times the active Shader has been changed so far during the current frame.',
                                },
                                {
                                    type = 'number',
                                    name = 'drawcallsbatched',
                                    description = 'The number of draw calls that were saved by LÖVE\'s automatic batching, since the start of the frame.',
                                },
                            },
                        },
                    },
                },
                {
                    description = 'This variant accepts an existing table to fill in, instead of creating a new one.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'stats',
                            description = 'A table which will be filled in with the stat fields below.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'stats',
                            description = 'The table that was passed in above, now containing the following fields:',
                            table = {
                                {
                                    type = 'number',
                                    name = 'drawcalls',
                                    description = 'The number of draw calls made so far during the current frame.',
                                },
                                {
                                    type = 'number',
                                    name = 'canvasswitches',
                                    description = 'The number of times the active Canvas has been switched so far during the current frame.',
                                },
                                {
                                    type = 'number',
                                    name = 'texturememory',
                                    description = 'The estimated total size in bytes of video memory used by all loaded Images, Canvases, and Fonts.',
                                },
                                {
                                    type = 'number',
                                    name = 'images',
                                    description = 'The number of Image objects currently loaded.',
                                },
                                {
                                    type = 'number',
                                    name = 'canvases',
                                    description = 'The number of Canvas objects currently loaded.',
                                },
                                {
                                    type = 'number',
                                    name = 'fonts',
                                    description = 'The number of Font objects currently loaded.',
                                },
                                {
                                    type = 'number',
                                    name = 'shaderswitches',
                                    description = 'The number of times the active Shader has been changed so far during the current frame.',
                                },
                                {
                                    type = 'number',
                                    name = 'drawcallsbatched',
                                    description = 'The number of draw calls that were saved by LÖVE\'s automatic batching, since the start of the frame.',
                                },
                            },
                        },
                    },
                },
            },
        },
        {
            name = 'getStencilTest',
            description = 'Gets the current stencil test configuration.\n\nWhen stencil testing is enabled, the geometry of everything that is drawn afterward will be clipped / stencilled out based on a comparison between the arguments of this function and the stencil value of each pixel that the geometry touches. The stencil values of pixels are affected via love.graphics.stencil.\n\nEach Canvas has its own per-pixel stencil values.',
            variants = {
                {
                    returns = {
                        {
                            type = 'CompareMode',
                            name = 'comparemode',
                            description = 'The type of comparison that is made for each pixel. Will be \'always\' if stencil testing is disabled.',
                        },
                        {
                            type = 'number',
                            name = 'comparevalue',
                            description = 'The value used when comparing with the stencil value of each pixel.',
                        },
                    },
                },
            },
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
                            description = 'A table containing GraphicsFeature keys, and boolean values indicating whether each feature is supported.',
                        },
                    },
                },
            },
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
                            description = 'A table containing GraphicsLimit keys, and number values.',
                        },
                    },
                },
            },
        },
        {
            name = 'getTextureTypes',
            description = 'Gets the available texture types, and whether each is supported.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'texturetypes',
                            description = 'A table containing TextureTypes as keys, and a boolean indicating whether the type is supported as values. Not all systems support all types.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Gets the width in pixels of the window.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the window.',
                        },
                    },
                },
            },
        },
        {
            name = 'intersectScissor',
            description = 'Sets the scissor to the rectangle created by the intersection of the specified rectangle with the existing scissor.  If no scissor is active yet, it behaves like love.graphics.setScissor.\n\nThe scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear.\n\nThe dimensions of the scissor is unaffected by graphical transformations (translate, scale, ...).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-coordinate of the upper left corner of the rectangle to intersect with the existing scissor rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-coordinate of the upper left corner of the rectangle to intersect with the existing scissor rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the rectangle to intersect with the existing scissor rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the rectangle to intersect with the existing scissor rectangle.',
                        },
                    },
                },
            },
        },
        {
            name = 'inverseTransformPoint',
            description = 'Converts the given 2D position from screen-space into global coordinates.\n\nThis effectively applies the reverse of the current graphics transformations to the given position. A similar Transform:inverseTransformPoint method exists for Transform objects.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'screenX',
                            description = 'The x component of the screen-space position.',
                        },
                        {
                            type = 'number',
                            name = 'screenY',
                            description = 'The y component of the screen-space position.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'globalX',
                            description = 'The x component of the position in global coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'globalY',
                            description = 'The y component of the position in global coordinates.',
                        },
                    },
                },
            },
        },
        {
            name = 'isActive',
            description = 'Gets whether the graphics module is able to be used. If it is not active, love.graphics function and method calls will not work correctly and may cause the program to crash.\nThe graphics module is inactive if a window is not open, or if the app is in the background on iOS. Typically the app\'s execution will be automatically paused by the system, in the latter case.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'active',
                            description = 'Whether the graphics module is active and able to be used.'
                        },
                    },
                },
            },
        },
        {
            name = 'isGammaCorrect',
            description = 'Gets whether gamma-correct rendering is supported and enabled. It can be enabled by setting t.gammacorrect = true in love.conf.\n\nNot all devices support gamma-correct rendering, in which case it will be automatically disabled and this function will return false. It is supported on desktop systems which have graphics cards that are capable of using OpenGL 3 / DirectX 10, and iOS devices that can use OpenGL ES 3.',
            variants = {
                {
                    description = 'When gamma-correct rendering is enabled, many functions and objects perform automatic color conversion between sRGB and linear RGB in order for blending and shader math to be mathematically correct (which they aren\'t if it\'s not enabled.)\n\n* The colors passed into converted from sRGB to linear RGB.\n\n* The colors set in text with per-character colors, points with per-point colors, standard custom Meshes which use the \'VertexColor\' attribute name will automatically be converted from sRGB to linear RGB when those objects are drawn.\n\n* creating the Image.\n\n* Everything drawn to the screen will be blended in linear RGB and then the result will be converted to sRGB for display.\n\n* Canvases which use the \'normal\' or \'srgb\' CanvasFormat will have their content blended in linear RGB and the result will be stored in the canvas in sRGB, when drawing to them. When the Canvas itself is drawn, its pixel colors will be converted from sRGB to linear RGB in the same manner as Images. Keeping the canvas pixel data stored as sRGB allows for better precision (less banding) for darker colors compared to \'rgba8\'.\n\nBecause most conversions are automatically handled, your own code doesn\'t need to worry about sRGB and linear RGB color conversions when gamma-correct rendering is enabled, except in a couple cases:\n\n* If a Mesh with custom vertex attributes is used and one of the attributes is meant to be used as a color in a Shader, and the attribute isn\'t named \'VertexColor\'.\n\n* If  a Shader is used which has uniform / extern variables or other variables that are meant to be used as colors, and Shader:sendColor isn\'t used.\n\nIn both cases, love.math.gammaToLinear can be used to convert color values to linear RGB in Lua code, or the gammaCorrectColor (or unGammaCorrectColor if necessary) shader functions can be used inside shader code. Those shader functions \'\'only\'\' do conversions if gamma-correct rendering is actually enabled. The LOVE_GAMMA_CORRECT shader preprocessor define will be set if so.\n\nRead more about gamma-correct rendering here, here, and here.',
                    returns = {
                        {
                            type = 'boolean',
                            name = 'gammacorrect',
                            description = 'True if gamma-correct rendering is supported and was enabled in love.conf, false otherwise.',
                        },
                    },
                },
            },
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
                            description = 'True if wireframe lines are used when drawing, false if it\'s not.',
                        },
                    },
                },
            },
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
                            description = 'The position of first point on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The position of first point on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The position of second point on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The position of second point on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'You can continue passing point positions to draw a polyline.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'points',
                            description = 'A table of point positions, as described above.',
                        },
                    },
                },
            },
        },
        {
            name = 'newArrayImage',
            description = 'Creates a new array Image.\n\nAn array image / array texture is a single object which contains multiple \'layers\' or \'slices\' of 2D sub-images. It can be thought of similarly to a texture atlas or sprite sheet, but it doesn\'t suffer from the same tile / quad bleeding artifacts that texture atlases do – although every sub-image must have the same dimensions.\n\nA specific layer of an array image can be drawn with love.graphics.drawLayer / SpriteBatch:addLayer, or with the Quad variant of love.graphics.draw and Quad:setLayer, or via a custom Shader.\n\nTo use an array image in a Shader, it must be declared as a ArrayImage or sampler2DArray type (instead of Image or sampler2D). The Texel(ArrayImage image, vec3 texturecoord) shader function must be used to get pixel colors from a slice of the array image. The vec3 argument contains the texture coordinate in the first two components, and the 0-based slice index in the third component.',
            variants = {
                {
                    description = 'Creates an array Image given a different image file for each slice of the resulting array image object.\n\nIllustration of how an array image works: [http://codeflow.org/entries/2010/dec/09/minecraft-like-rendering-experiments-in-opengl-4/illustrations/textures.jpg]\n\nA DPI scale of 2 (double the normal pixel density) will result in the image taking up the same space on-screen as an image with half its pixel dimensions that has a DPI scale of 1. This allows for easily swapping out image assets that take the same space on-screen but have different pixel densities, which makes supporting high-dpi / retina resolution require less code logic.\n\nIn order to use an Array Texture or other non-2D texture types as the main texture in a custom void effect() variant must be used in the pixel shader, and MainTex must be declared as an ArrayImage or sampler2DArray like so: uniform ArrayImage MainTex;.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'slices',
                            description = 'A table containing filepaths to images (or File, FileData, ImageData, or CompressedImageData objects), in an array. Each sub-image must have the same dimensions. A table of tables can also be given, where each sub-table contains all mipmap levels for the slice index of that sub-table.',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'Optional table of settings to configure the array image, containing the following fields:',
                            default = 'nil',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'mipmaps',
                                    description = 'True to make the image use mipmaps, false to disable them. Mipmaps will be automatically generated if the image isn\'t a compressed texture format.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    description = 'True to treat the image\'s pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB.',
                                    default = 'false',
                                },
                                {
                                    type = 'number',
                                    name = 'dpiscale',
                                    description = 'The DPI scale to use when drawing the array image and calling getWidth/getHeight.',
                                    default = '1',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'An Array Image object.',
                        },
                    },
                },
            },
        },
        {
            name = 'newCanvas',
            description = 'Creates a new Canvas object for offscreen rendering.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'A new Canvas with dimensions equal to the window\'s size in pixels.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The desired width of the Canvas.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The desired height of the Canvas.',
                        },
                    },
                    returns = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'A new Canvas with specified width and height.',
                        },
                    },
                },
                {
                    description = 'Creates a 2D or cubemap Canvas using the given settings.\n\nSome Canvas formats have higher system requirements than the default format. Use love.graphics.getCanvasFormats to check for support.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The desired width of the Canvas.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The desired height of the Canvas.',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'A table containing the given fields:',
                            table = {
                                {
                                    type = 'TextureType',
                                    name = 'type',
                                    description = 'The type of Canvas to create.',
                                    default = '\'2d\'',
                                },
                                {
                                    type = 'PixelFormat',
                                    name = 'format',
                                    description = 'The format of the Canvas.',
                                    default = '\'normal\'',
                                },
                                {
                                    type = 'boolean',
                                    name = 'readable',
                                    description = 'Whether the Canvas is readable (drawable and accessible in a Shader). True by default for regular formats, false by default for depth/stencil formats.',
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    description = 'The desired number of multisample antialiasing (MSAA) samples used when drawing to the Canvas.',
                                    default = '0',
                                },
                                {
                                    type = 'number',
                                    name = 'dpiscale',
                                    description = 'The DPI scale factor of the Canvas, used when drawing to the Canvas as well as when drawing the Canvas to the screen.',
                                    default = 'love.graphics.getDPIScale()',
                                },
                                {
                                    type = 'MipmapMode',
                                    name = 'mipmaps',
                                    description = 'Whether the Canvas has mipmaps, and whether to automatically regenerate them if so.',
                                    default = '\'none\'',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'A new Canvas with specified width and height.',
                        },
                    },
                },
                {
                    description = 'Creates a volume or array texture-type Canvas.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The desired width of the Canvas.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The desired height of the Canvas.',
                        },
                        {
                            type = 'number',
                            name = 'layers',
                            description = 'The number of array layers (if the Canvas is an Array Texture), or the volume depth (if the Canvas is a Volume Texture).',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'A table containing the given fields:',
                            table = {
                                {
                                    type = 'TextureType',
                                    name = 'type',
                                    description = 'The type of Canvas to create.',
                                    default = '\'array\'',
                                },
                                {
                                    type = 'PixelFormat',
                                    name = 'format',
                                    description = 'The format of the Canvas.',
                                    default = '\'normal\'',
                                },
                                {
                                    type = 'boolean',
                                    name = 'readable',
                                    description = 'Whether the Canvas is readable (drawable and accessible in a Shader). True by default for regular formats, false by default for depth/stencil formats.',
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    description = 'The desired number of multisample antialiasing (MSAA) samples used when drawing to the Canvas.',
                                    default = '0',
                                },
                                {
                                    type = 'number',
                                    name = 'dpiscale',
                                    description = 'The DPI scale factor of the Canvas, used when drawing to the Canvas as well as when drawing the Canvas to the screen.',
                                    default = 'love.graphics.getDPIScale()',
                                },
                                {
                                    type = 'MipmapMode',
                                    name = 'mipmaps',
                                    description = 'Whether the Canvas has mipmaps, and whether to automatically regenerate them if so.',
                                    default = '\'none\'',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'A new Canvas with specified width and height.',
                        },
                    },
                },
            },
        },
        {
            name = 'newCubeImage',
            description = 'Creates a new cubemap Image.\n\nCubemap images have 6 faces (sides) which represent a cube. They can\'t be rendered directly, they can only be used in Shader code (and sent to the shader via Shader:send).\n\nTo use a cubemap image in a Shader, it must be declared as a CubeImage or samplerCube type (instead of Image or sampler2D). The Texel(CubeImage image, vec3 direction) shader function must be used to get pixel colors from the cubemap. The vec3 argument is a normalized direction from the center of the cube, rather than explicit texture coordinates.\n\nEach face in a cubemap image must have square dimensions.\n\nFor variants of this function which accept a single image containing multiple cubemap faces, they must be laid out in one of the following forms in the image:\n\n   +y\n\n+z +x -z\n\n   -y\n\n   -x\n\nor:\n\n   +y\n\n-x +z +x -z\n\n   -y\n\nor:\n\n+x\n\n-x\n\n+y\n\n-y\n\n+z\n\n-z\n\nor:\n\n+x -x +y -y +z -z',
            variants = {
                {
                    description = 'Creates a cubemap Image given a single image file containing multiple cube faces.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to a cubemap image file (or a File, FileData, or ImageData).',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'Optional table of settings to configure the cubemap image, containing the following fields:',
                            default = 'nil',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'mipmaps',
                                    description = 'True to make the image use mipmaps, false to disable them. Mipmaps will be automatically generated if the image isn\'t a compressed texture format.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    description = 'True to treat the image\'s pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB.',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'An cubemap Image object.',
                        },
                    },
                },
                {
                    description = 'Creates a cubemap Image given a different image file for each cube face.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'faces',
                            description = 'A table containing 6 filepaths to images (or File, FileData, ImageData, or CompressedImageData objects), in an array. Each face image must have the same dimensions. A table of tables can also be given, where each sub-table contains all mipmap levels for the cube face index of that sub-table.',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'Optional table of settings to configure the cubemap image, containing the following fields:',
                            default = 'nil',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'mipmaps',
                                    description = 'True to make the image use mipmaps, false to disable them. Mipmaps will be automatically generated if the image isn\'t a compressed texture format.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    description = 'True to treat the image\'s pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB.',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'An cubemap Image object.',
                        },
                    },
                },
            },
        },
        {
            name = 'newFont',
            description = 'Creates a new Font from a TrueType Font or BMFont file. Created fonts are not cached, in that calling this function with the same arguments will always create a new Font object.\n\nAll variants which accept a filename can also accept a Data object instead.',
            variants = {
                {
                    description = 'Create a new BMFont or TrueType font.\n\nIf the file is a TrueType font, it will be size 12. Use the variant below to create a TrueType font with a custom size.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the BMFont or TrueType font file.',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.',
                        },
                    },
                },
                {
                    description = 'Create a new TrueType font.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the TrueType font file.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The size of the font in pixels.',
                        },
                        {
                            type = 'HintingMode',
                            name = 'hinting',
                            description = 'True Type hinting mode.',
                            default = '\'normal\'',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The DPI scale factor of the font.',
                            default = 'love.graphics.getDPIScale()',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.',
                        },
                    },
                },
                {
                    description = 'Create a new BMFont.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the BMFont file.',
                        },
                        {
                            type = 'string',
                            name = 'imagefilename',
                            description = 'The filepath to the BMFont\'s image file. If this argument is omitted, the path specified inside the BMFont file will be used.',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.',
                        },
                    },
                },
                {
                    description = 'Create a new instance of the default font (Vera Sans) with a custom size.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The size of the font in pixels.',
                            default = '12',
                        },
                        {
                            type = 'HintingMode',
                            name = 'hinting',
                            description = 'True Type hinting mode.',
                            default = '\'normal\'',
                        },
                        {
                            type = 'number',
                            name = 'dpiscale',
                            description = 'The DPI scale factor of the font.',
                            default = 'love.graphics.getDPIScale()',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.',
                        },
                    },
                },
            },
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
                            description = 'The filepath to the image file.',
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'A table containing the following fields:',
                            table = {
                                {
                                    type = 'number',
                                    name = 'dpiscale',
                                    description = 'The DPI scale to use when drawing the image and calling getWidth/getHeight.',
                                    default = '1',
                                },
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    description = 'True to treat the image\'s pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'mipmaps',
                                    description = 'If true, mipmaps for the image will be automatically generated (or taken from the images\'s file if possible, if the image originated from a CompressedImageData).',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'A new Image object which can be drawn on screen.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'The FileData containing image file.',
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'A table containing the following fields:',
                            table = {
                                {
                                    type = 'number',
                                    name = 'dpiscale',
                                    description = 'The DPI scale to use when drawing the image and calling getWidth/getHeight.',
                                    default = '1',
                                },
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    description = 'True to treat the image\'s pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'mipmaps',
                                    description = 'If true, mipmaps for the image will be automatically generated (or taken from the images\'s file if possible, if the image originated from a CompressedImageData).',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'A new Image object which can be drawn on screen.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The ImageData containing image.',
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'A table containing the following fields:',
                            table = {
                                {
                                    type = 'number',
                                    name = 'dpiscale',
                                    description = 'The DPI scale to use when drawing the image and calling getWidth/getHeight.',
                                    default = '1',
                                },
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    description = 'True to treat the image\'s pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'mipmaps',
                                    description = 'If true, mipmaps for the image will be automatically generated (or taken from the images\'s file if possible, if the image originated from a CompressedImageData).',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'A new Image object which can be drawn on screen.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'CompressedImageData',
                            name = 'compressedImageData',
                            description = 'A CompressedImageData object. The Image will use this CompressedImageData to reload itself when love.window.setMode is called.',
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'A table containing the following fields:',
                            table = {
                                {
                                    type = 'number',
                                    name = 'dpiscale',
                                    description = 'The DPI scale to use when drawing the image and calling getWidth/getHeight.',
                                    default = '1',
                                },
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    description = 'True to treat the image\'s pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'mipmaps',
                                    description = 'If true, mipmaps for the image will be automatically generated (or taken from the images\'s file if possible, if the image originated from a CompressedImageData).',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'A new Image object which can be drawn on screen.',
                        },
                    },
                },
            },
        },
        {
            name = 'newImageFont',
            description = 'Creates a new specifically formatted image.\n\nIn versions prior to 0.9.0, LÖVE expects ISO 8859-1 encoding for the glyphs string.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the image file.',
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'A string of the characters in the image in order from left to right.',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The ImageData object to create the font from.',
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'A string of the characters in the image in order from left to right.',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.',
                        },
                    },
                },
                {
                    description = 'Instead of using this function, consider using a BMFont generator such as bmfont, littera, or bmGlyph with love.graphics.newFont. Because slime said it was better.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the image file.',
                        },
                        {
                            type = 'string',
                            name = 'glyphs',
                            description = 'A string of the characters in the image in order from left to right.',
                        },
                        {
                            type = 'number',
                            name = 'extraspacing',
                            description = 'Additional spacing (positive or negative) to apply to each glyph in the Font.',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'A Font object which can be used to draw text on screen.',
                        },
                    },
                },
            },
        },
        {
            name = 'newMesh',
            description = 'Creates a new Mesh.\n\nUse Mesh:setTexture if the Mesh should be textured with an Image or Canvas when it\'s drawn.\n\nIn versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.',
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
                                    name = '1',
                                    description = 'The position of the vertex on the x-axis.',
                                },
                                {
                                    type = 'number',
                                    name = '2',
                                    description = 'The position of the vertex on the y-axis.',
                                },
                                {
                                    type = 'number',
                                    name = '3',
                                    description = 'The u texture coordinate of the vertex. Texture coordinates are normally in the range of 1, but can be greater or less (see WrapMode.)',
                                    default = '0',
                                },
                                {
                                    type = 'number',
                                    name = '4',
                                    description = 'The v texture coordinate of the vertex. Texture coordinates are normally in the range of 1, but can be greater or less (see WrapMode.)',
                                    default = '0',
                                },
                                {
                                    type = 'number',
                                    name = '5',
                                    description = 'The red component of the vertex color.',
                                    default = '1',
                                },
                                {
                                    type = 'number',
                                    name = '6',
                                    description = 'The green component of the vertex color.',
                                    default = '1',
                                },
                                {
                                    type = 'number',
                                    name = '7',
                                    description = 'The blue component of the vertex color.',
                                    default = '1',
                                },
                                {
                                    type = 'number',
                                    name = '8',
                                    description = 'The alpha component of the vertex color.',
                                    default = '1',
                                },
                            },
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            description = 'How the vertices are used when drawing. The default mode \'fan\' is sufficient for simple convex polygons.',
                            default = '\'fan\'',
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            description = 'The expected usage of the Mesh. The specified usage mode affects the Mesh\'s memory usage and performance.',
                            default = '\'dynamic\'',
                        },
                    },
                    returns = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The new mesh.',
                        },
                    },
                },
                {
                    description = 'Creates a standard Mesh with the specified number of vertices.\n\nMesh:setVertices or Mesh:setVertex and Mesh:setDrawRange can be used to specify vertex information once the Mesh is created.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'vertexcount',
                            description = 'The total number of vertices the Mesh will use. Each vertex is initialized to {0,0, 0,0, 1,1,1,1}.',
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            description = 'How the vertices are used when drawing. The default mode \'fan\' is sufficient for simple convex polygons.',
                            default = '\'fan\'',
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            description = 'The expected usage of the Mesh. The specified usage mode affects the Mesh\'s memory usage and performance.',
                            default = '\'dynamic\'',
                        },
                    },
                    returns = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The new mesh.',
                        },
                    },
                },
                {
                    description = 'Creates a Mesh with custom vertex attributes and the specified vertex data.\n\nThe values in each vertex table are in the same order as the vertex attributes in the specified vertex format. If no value is supplied for a specific vertex attribute component, it will be set to a default value of 0 if its data type is \'float\', or 1 if its data type is \'byte\'.\n\nIf the data type of an attribute is \'float\', components can be in the range 1 to 4, if the data type is \'byte\' it must be 4.\n\nIf a custom vertex attribute uses the name \'VertexPosition\', \'VertexTexCoord\', or \'VertexColor\', then the vertex data for that vertex attribute will be used for the standard vertex positions, texture coordinates, or vertex colors respectively, when drawing the Mesh. Otherwise a Vertex Shader is required in order to make use of the vertex attribute when the Mesh is drawn.\n\nA Mesh \'\'\'must\'\'\' have a \'VertexPosition\' attribute in order to be drawn, but it can be attached from a different Mesh via Mesh:attachAttribute.\n\nTo use a custom named vertex attribute in a Vertex Shader, it must be declared as an attribute variable of the same name. Variables can be sent from Vertex Shader code to Pixel Shader code by making a varying variable. For example:\n\n\'\'Vertex Shader code\'\'\n\nattribute vec2 CoolVertexAttribute;\n\nvarying vec2 CoolVariable;\n\nvec4 position(mat4 transform_projection, vec4 vertex_position)\n\n{\n\n    CoolVariable = CoolVertexAttribute;\n\n    return transform_projection * vertex_position;\n\n}\n\n\'\'Pixel Shader code\'\'\n\nvarying vec2 CoolVariable;\n\nvec4 effect(vec4 color, Image tex, vec2 texcoord, vec2 pixcoord)\n\n{\n\n    vec4 texcolor = Texel(tex, texcoord + CoolVariable);\n\n    return texcolor * color;\n\n}',
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertexformat',
                            description = 'A table in the form of {attribute, ...}. Each attribute is a table which specifies a custom vertex attribute used for each vertex.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'attribute',
                                    description = 'A table containing the attribute\'s name, it\'s data type, and the number of components in the attribute, in the form of {name, datatype, components}.',
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional vertex attribute format tables.',
                                },
                            },
                        },
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The table filled with vertex information tables for each vertex, in the form of {vertex, ...} where each vertex is a table in the form of {attributecomponent, ...}.',
                            table = {
                                {
                                    type = 'number',
                                    name = 'attributecomponent',
                                    description = 'The first component of the first vertex attribute in the vertex.',
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional components of all vertex attributes in the vertex.',
                                },
                            },
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            description = 'How the vertices are used when drawing. The default mode \'fan\' is sufficient for simple convex polygons.',
                            default = '\'fan\'',
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            description = 'The expected usage of the Mesh. The specified usage mode affects the Mesh\'s memory usage and performance.',
                            default = '\'dynamic\'',
                        },
                    },
                    returns = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The new mesh.',
                        },
                    },
                },
                {
                    description = 'Creates a Mesh with custom vertex attributes and the specified number of vertices.\n\nEach vertex attribute component is initialized to 0 if its data type is \'float\', or 1 if its data type is \'byte\'. Vertex Shader is required in order to make use of the vertex attribute when the Mesh is drawn.\n\nA Mesh \'\'\'must\'\'\' have a \'VertexPosition\' attribute in order to be drawn, but it can be attached from a different Mesh via Mesh:attachAttribute.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertexformat',
                            description = 'A table in the form of {attribute, ...}. Each attribute is a table which specifies a custom vertex attribute used for each vertex.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'attribute',
                                    description = 'A table containing the attribute\'s name, it\'s data type, and the number of components in the attribute, in the form of {name, datatype, components}.',
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional vertex attribute format tables.',
                                },
                            },
                        },
                        {
                            type = 'number',
                            name = 'vertexcount',
                            description = 'The total number of vertices the Mesh will use.',
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            description = 'How the vertices are used when drawing. The default mode \'fan\' is sufficient for simple convex polygons.',
                            default = '\'fan\'',
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            description = 'The expected usage of the Mesh. The specified usage mode affects the Mesh\'s memory usage and performance.',
                            default = '\'dynamic\'',
                        },
                    },
                    returns = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The new mesh.',
                        },
                    },
                },
                {
                    description = 'Mesh:setVertices or Mesh:setVertex and Mesh:setDrawRange can be used to specify vertex information once the Mesh is created.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'vertexcount',
                            description = 'The total number of vertices the Mesh will use. Each vertex is initialized to {0,0, 0,0, 255,255,255,255}.',
                        },
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Image or Canvas to use when drawing the Mesh. May be nil to use no texture.',
                            default = 'nil',
                        },
                        {
                            type = 'MeshDrawMode',
                            name = 'mode',
                            description = 'How the vertices are used when drawing. The default mode \'fan\' is sufficient for simple convex polygons.',
                            default = '\'fan\'',
                        },
                    },
                    returns = {
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The new mesh.',
                        },
                    },
                },
            },
        },
        {
            name = 'newParticleSystem',
            description = 'Creates a new ParticleSystem.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'The image to use.',
                        },
                        {
                            type = 'number',
                            name = 'buffer',
                            description = 'The max number of particles at the same time.',
                            default = '1000',
                        },
                    },
                    returns = {
                        {
                            type = 'ParticleSystem',
                            name = 'system',
                            description = 'A new ParticleSystem.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The texture (Image or Canvas) to use.',
                        },
                        {
                            type = 'number',
                            name = 'buffer',
                            description = 'The max number of particles at the same time.',
                            default = '1000',
                        },
                    },
                    returns = {
                        {
                            type = 'ParticleSystem',
                            name = 'system',
                            description = 'A new ParticleSystem.',
                        },
                    },
                },
            },
        },
        {
            name = 'newQuad',
            description = 'Creates a new Quad.\n\nThe purpose of a Quad is to use a fraction of an image to draw objects, as opposed to drawing entire image. It is most useful for sprite sheets and atlases: in a sprite atlas, multiple sprites reside in same image, quad is used to draw a specific sprite from that image; in animated sprites with all frames residing in the same image, quad is used to draw specific frame from the animation.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The top-left position in the Image along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The top-left position in the Image along the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Quad in the Image. (Must be greater than 0.)',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Quad in the Image. (Must be greater than 0.)',
                        },
                        {
                            type = 'number',
                            name = 'sw',
                            description = 'The reference width, the width of the Image. (Must be greater than 0.)',
                        },
                        {
                            type = 'number',
                            name = 'sh',
                            description = 'The reference height, the height of the Image. (Must be greater than 0.)',
                        },
                    },
                    returns = {
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The new Quad.',
                        },
                    },
                },
            },
        },
        {
            name = 'newShader',
            description = 'Creates a new Shader object for hardware-accelerated vertex and pixel effects. A Shader contains either vertex shader code, pixel shader code, or both.\n\nShaders are small programs which are run on the graphics card when drawing. Vertex shaders are run once for each vertex (for example, an image has 4 vertices - one at each corner. A Mesh might have many more.) Pixel shaders are run once for each pixel on the screen which the drawn object touches. Pixel shader code is executed after all the object\'s vertices have been processed by the vertex shader.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'code',
                            description = 'The pixel shader or vertex shader code, or a filename pointing to a file with the code.',
                        },
                    },
                    returns = {
                        {
                            type = 'Shader',
                            name = 'shader',
                            description = 'A Shader object for use in drawing operations.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'pixelcode',
                            description = 'The pixel shader code, or a filename pointing to a file with the code.',
                        },
                        {
                            type = 'string',
                            name = 'vertexcode',
                            description = 'The vertex shader code, or a filename pointing to a file with the code.',
                        },
                    },
                    returns = {
                        {
                            type = 'Shader',
                            name = 'shader',
                            description = 'A Shader object for use in drawing operations.',
                        },
                    },
                },
            },
        },
        {
            name = 'newSpriteBatch',
            description = 'Creates a new SpriteBatch object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'The Image to use for the sprites.',
                        },
                        {
                            type = 'number',
                            name = 'maxsprites',
                            description = 'The maximum number of sprites that the SpriteBatch can contain at any given time. Since version 11.0, additional sprites added past this number will automatically grow the spritebatch.',
                            default = '1000',
                        },
                    },
                    returns = {
                        {
                            type = 'SpriteBatch',
                            name = 'spriteBatch',
                            description = 'The new SpriteBatch.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'The Image to use for the sprites.',
                        },
                        {
                            type = 'number',
                            name = 'maxsprites',
                            description = 'The maximum number of sprites that the SpriteBatch can contain at any given time. Since version 11.0, additional sprites added past this number will automatically grow the spritebatch.',
                            default = '1000',
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            description = 'The expected usage of the SpriteBatch. The specified usage mode affects the SpriteBatch\'s memory usage and performance.',
                            default = '\'dynamic\'',
                        },
                    },
                    returns = {
                        {
                            type = 'SpriteBatch',
                            name = 'spriteBatch',
                            description = 'The new SpriteBatch.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Image or Canvas to use for the sprites.',
                        },
                        {
                            type = 'number',
                            name = 'maxsprites',
                            description = 'The maximum number of sprites that the SpriteBatch can contain at any given time. Since version 11.0, additional sprites added past this number will automatically grow the spritebatch.',
                            default = '1000',
                        },
                        {
                            type = 'SpriteBatchUsage',
                            name = 'usage',
                            description = 'The expected usage of the SpriteBatch. The specified usage mode affects the SpriteBatch\'s memory usage and performance.',
                            default = '\'dynamic\'',
                        },
                    },
                    returns = {
                        {
                            type = 'SpriteBatch',
                            name = 'spriteBatch',
                            description = 'The new SpriteBatch.',
                        },
                    },
                },
            },
        },
        {
            name = 'newText',
            description = 'Creates a new drawable Text object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The font to use for the text.',
                        },
                        {
                            type = 'string',
                            name = 'textstring',
                            description = 'The initial string of text that the new Text object will contain. May be nil.',
                            default = 'nil',
                        },
                    },
                    returns = {
                        {
                            type = 'Text',
                            name = 'text',
                            description = 'The new drawable Text object.',
                        },
                    },
                },
            },
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
                            description = 'The file path to the Ogg Theora video file.',
                        },
                    },
                    returns = {
                        {
                            type = 'Video',
                            name = 'video',
                            description = 'A new Video.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'VideoStream',
                            name = 'videostream',
                            description = 'A video stream object.',
                        },
                    },
                    returns = {
                        {
                            type = 'Video',
                            name = 'video',
                            description = 'A new Video.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The file path to the Ogg Theora video file (or VideoStream).',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'A table containing the following fields:',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'audio',
                                    description = 'Whether to try to load the video\'s audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio.',
                                    default = 'false',
                                },
                                {
                                    type = 'number',
                                    name = 'dpiscale',
                                    description = 'The DPI scale factor of the video.',
                                    default = 'love.graphics.getDPIScale()',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Video',
                            name = 'video',
                            description = 'A new Video.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The file path to the Ogg Theora video file.',
                        },
                        {
                            type = 'boolean',
                            name = 'loadaudio',
                            description = 'Whether to try to load the video\'s audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio.',
                            default = 'nil',
                        },
                    },
                    returns = {
                        {
                            type = 'Video',
                            name = 'video',
                            description = 'A new Video.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'VideoStream',
                            name = 'videostream',
                            description = 'A video stream object.',
                        },
                        {
                            type = 'boolean',
                            name = 'loadaudio',
                            description = 'Whether to try to load the video\'s audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio.',
                            default = 'nil',
                        },
                    },
                    returns = {
                        {
                            type = 'Video',
                            name = 'video',
                            description = 'A new Video.',
                        },
                    },
                },
            },
        },
        {
            name = 'newVolumeImage',
            description = 'Creates a new volume (3D) Image.\n\nVolume images are 3D textures with width, height, and depth. They can\'t be rendered directly, they can only be used in Shader code (and sent to the shader via Shader:send).\n\nTo use a volume image in a Shader, it must be declared as a VolumeImage or sampler3D type (instead of Image or sampler2D). The Texel(VolumeImage image, vec3 texcoords) shader function must be used to get pixel colors from the volume image. The vec3 argument is a normalized texture coordinate with the z component representing the depth to sample at (ranging from 1).\n\nVolume images are typically used as lookup tables in shaders for color grading, for example, because sampling using a texture coordinate that is partway in between two pixels can interpolate across all 3 dimensions in the volume image, resulting in a smooth gradient even when a small-sized volume image is used as the lookup table.\n\nArray images are a much better choice than volume images for storing multiple different sprites in a single array image for directly drawing them.',
            variants = {
                {
                    description = 'Creates a volume Image given multiple image files with matching dimensions.\n\nVolume images are not supported on some older mobile devices. Use love.graphics.getTextureTypes to check at runtime.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'layers',
                            description = 'A table containing filepaths to images (or File, FileData, ImageData, or CompressedImageData objects), in an array. A table of tables can also be given, where each sub-table represents a single mipmap level and contains all layers for that mipmap.',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'Optional table of settings to configure the volume image, containing the following fields:',
                            default = 'nil',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'mipmaps',
                                    description = 'True to make the image use mipmaps, false to disable them. Mipmaps will be automatically generated if the image isn\'t a compressed texture format.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'linear',
                                    description = 'True to treat the image\'s pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB.',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'A volume Image object.',
                        },
                    },
                },
            },
        },
        {
            name = 'origin',
            description = 'Resets the current coordinate transformation.\n\nThis function is always used to reverse any previous calls to love.graphics.rotate, love.graphics.scale, love.graphics.shear or love.graphics.translate. It returns the current transformation state to its defaults.',
            variants = {
                {
                },
            },
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
                            description = 'The position of the first point on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the first point on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'The x and y coordinates of additional points.',
                        },
                    },
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
                                    description = 'The position of the first point on the x-axis.',
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position of the first point on the y-axis.',
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'The x and y coordinates of additional points.',
                                },
                            },
                        },
                    },
                },
                {
                    description = 'Draws one or more individually colored points.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.\n\nThe pixel grid is actually offset to the center of each pixel. So to get clean pixels drawn use 0.5 + integer increments.\n\nPoints are not affected by size is always in pixels.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'points',
                            description = 'A table containing multiple individually colored points, in the form of {point, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'point',
                                    description = 'A table containing the position and color of the first point, in the form of {x, y, r, g, b, a}. The color components are optional.',
                                },
                                {
                                    type = 'table',
                                    name = '...',
                                    description = 'Additional tables containing the position and color of more points, in the form of {x, y, r, g, b, a}. The color components are optional.',
                                },
                            },
                        },
                    },
                },
            },
        },
        {
            name = 'polygon',
            description = 'Draw a polygon.\n\nFollowing the mode argument, this function can accept multiple numeric arguments or a single table of numeric arguments. In either case the arguments are interpreted as alternating x and y coordinates of the polygon\'s vertices.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the polygon.',
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'The vertices of the polygon.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the polygon.',
                        },
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The vertices of the polygon as a table.',
                        },
                    },
                },
            },
        },
        {
            name = 'pop',
            description = 'Pops the current coordinate transformation from the transformation stack.\n\nThis function is always used to reverse a previous push operation. It returns the current transformation state to what it was before the last preceding push.',
            variants = {
                {
                },
            },
        },
        {
            name = 'present',
            description = 'Displays the results of drawing operations on the screen.\n\nThis function is used when writing your own love.run function. It presents all the results of your drawing operations on the screen. See the example in love.run for a typical use of this function.',
            variants = {
                {
                    description = '* If love.window.setMode has vsync equal to true, this function can\'t run more frequently than the refresh rate (e.g. 60 Hz), and will halt the program until ready if necessary.',
                },
            },
        },
        {
            name = 'print',
            description = 'Draws text on screen. If no Font is set, one will be created and set (once) if needed.\n\nAs of LOVE 0.7.1, when using translation and scaling functions while drawing text, this function assumes the scale occurs first.  If you don\'t script with this in mind, the text won\'t be in the right position, or possibly even on screen.\n\nlove.graphics.print and love.graphics.printf both support UTF-8 encoding. You\'ll also need a proper Font for special characters.\n\nIn versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The text to draw.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the object (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the object (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the text on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the text on the y-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The orientation of the text in radians.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor on the x-axis.',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor on the y-axis.',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset on the y-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing / skew factor on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing / skew factor on the y-axis.',
                            default = '0',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The text to draw.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The text to draw.',
                        },
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The Font object to use.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                    },
                },
                {
                    description = '',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The Font object to use.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                    },
                },
            },
        },
        {
            name = 'printf',
            description = 'Draws formatted text, with word wrap and alignment.\n\nSee additional notes in love.graphics.print.\n\nThe word wrap limit is applied before any scaling, rotation, and other coordinate transformations. Therefore the amount of text per line stays constant given the same wrap limit, even if the scale arguments change.\n\nIn version 0.9.2 and earlier, wrapping was implemented by breaking up words by spaces and putting them back together to make sure things fit nicely within the limit provided. However, due to the way this is done, extra spaces between words would end up missing when printed on the screen, and some lines could overflow past the provided wrap limit. In version 0.10.0 and newer this is no longer the case.\n\nIn versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'A text string.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'Wrap the line after this many horizontal pixels.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment.',
                            default = '\'left\'',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'A text string.',
                        },
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The Font object to use.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'Wrap the line after this many horizontal pixels.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment.',
                            default = '\'left\'',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'A text string.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'Wrap the line after this many horizontal pixels.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment.',
                            default = '\'left\'',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'A text string.',
                        },
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The Font object to use.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'Wrap the line after this many horizontal pixels.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment.',
                            default = '\'left\'',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the text (x-axis).',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the text (y-axis).',
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'The maximum width in pixels of the text before it gets automatically wrapped to a new line.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment of the text.',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing / skew factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing / skew factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The Font object to use.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'Wrap the line after this many horizontal pixels.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment.',
                            default = '\'left\'',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'Wrap the line after this many horizontal pixels.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment.',
                            default = '\'left\'',
                        },
                    },
                },
                {
                    description = '',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The Font object to use.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'Transformation object.',
                        },
                        {
                            type = 'number',
                            name = 'limit',
                            description = 'Wrap the line after this many horizontal pixels.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment.',
                            default = '\'left\'',
                        },
                    },
                },
            },
        },
        {
            name = 'push',
            description = 'Copies and pushes the current coordinate transformation to the transformation stack.\n\nThis function is always used to prepare for a corresponding pop operation later. It stores the current coordinate transformation state into the transformation stack and keeps it active. Later changes to the transformation can be undone by using the pop operation, which returns the coordinate transform to the state it was in before calling push.',
            variants = {
                {
                    description = 'Pushes the current transformation to the transformation stack.',
                },
                {
                    description = 'Pushes a specific type of state to the stack.',
                    arguments = {
                        {
                            type = 'StackType',
                            name = 'stack',
                            description = 'The type of stack to push (e.g. just transformation state, or all love.graphics state).',
                        },
                    },
                },
            },
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
                            description = 'How to draw the rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of top-left corner along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of top-left corner along the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Width of the rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Height of the rectangle.',
                        },
                    },
                },
                {
                    description = 'Draws a rectangle with rounded corners.',
                    arguments = {
                        {
                            type = 'DrawMode',
                            name = 'mode',
                            description = 'How to draw the rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of top-left corner along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of top-left corner along the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Width of the rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Height of the rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'rx',
                            description = 'The x-axis radius of each round corner. Cannot be greater than half the rectangle\'s width.',
                        },
                        {
                            type = 'number',
                            name = 'ry',
                            description = 'The y-axis radius of each round corner. Cannot be greater than half the rectangle\'s height.',
                            default = 'rx',
                        },
                        {
                            type = 'number',
                            name = 'segments',
                            description = 'The number of segments used for drawing the round corners. A default amount will be chosen if no number is given.',
                            default = 'nil',
                        },
                    },
                },
            },
        },
        {
            name = 'replaceTransform',
            description = 'Replaces the current coordinate transformation with the given Transform object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object to replace the current graphics coordinate transform with.',
                        },
                    },
                },
            },
        },
        {
            name = 'reset',
            description = 'Resets the current graphics settings.\n\nCalling reset makes the current drawing color white, the current background color black, disables any active color component masks, disables wireframe mode and resets the current graphics transformation to the origin. It also sets both the point and line drawing modes to smooth and their sizes to 1.0.',
            variants = {
                {
                },
            },
        },
        {
            name = 'rotate',
            description = 'Rotates the coordinate system in two dimensions.\n\nCalling this function affects all future drawing operations by rotating the coordinate system around the origin by the given amount of radians. This change lasts until love.draw() exits.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The amount to rotate the coordinate system in radians.',
                        },
                    },
                },
            },
        },
        {
            name = 'scale',
            description = 'Scales the coordinate system in two dimensions.\n\nBy default the coordinate system in LÖVE corresponds to the display pixels in horizontal and vertical directions one-to-one, and the x-axis increases towards the right while the y-axis increases downwards. Scaling the coordinate system changes this relation.\n\nAfter scaling by sx and sy, all coordinates are treated as if they were multiplied by sx and sy. Every result of a drawing operation is also correspondingly scaled, so scaling by (2, 2) for example would mean making everything twice as large in both x- and y-directions. Scaling by a negative value flips the coordinate system in the corresponding direction, which also means everything will be drawn flipped or upside down, or both. Scaling by zero is not a useful operation.\n\nScale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.\n\nScaling lasts until love.draw() exits.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'The scaling in the direction of the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'The scaling in the direction of the y-axis. If omitted, it defaults to same as parameter sx.',
                            default = 'sx',
                        },
                    },
                },
            },
        },
        {
            name = 'setBackgroundColor',
            description = 'Sets the background color.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'red',
                            description = 'The red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'green',
                            description = 'The green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'blue',
                            description = 'The blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'alpha',
                            description = 'The alpha component (0-1).',
                            default = '1',
                        },
                    },
                },
                {
                },
                {
                },
            },
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
                            description = 'The blend mode to use.',
                        },
                    },
                },
                {
                    description = 'The default \'alphamultiply\' alpha mode should normally be preferred except when drawing content with pre-multiplied alpha. If content is drawn to a Canvas using the \'alphamultiply\' mode, the Canvas texture will have pre-multiplied alpha afterwards, so the \'premultiplied\' alpha mode should generally be used when drawing a Canvas to the screen.',
                    arguments = {
                        {
                            type = 'BlendMode',
                            name = 'mode',
                            description = 'The blend mode to use.',
                        },
                        {
                            type = 'BlendAlphaMode',
                            name = 'alphamode',
                            description = 'What to do with the alpha of drawn objects when blending.',
                            default = '\'alphamultiply\'',
                        },
                    },
                },
            },
        },
        {
            name = 'setCanvas',
            description = 'Captures drawing operations to a Canvas.',
            variants = {
                {
                    description = 'Sets the render target to a specified stencil or depth testing with an active Canvas, the stencil buffer or depth buffer must be explicitly enabled in setCanvas via the variants below.\n\nNote that no canvas should be active when \'\'love.graphics.present\'\' is called. \'\'love.graphics.present\'\' is called at the end of love.draw in the default love.run, hence if you activate a canvas using this function, you normally need to deactivate it at some point before \'\'love.draw\'\' finishes.',
                    arguments = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'The new target.',
                        },
                        {
                            type = 'number',
                            name = 'mipmap',
                            description = 'The mipmap level to render to, for Canvases with mipmaps.',
                            default = '1',
                        },
                    },
                },
                {
                    description = 'Resets the render target to the screen, i.e. re-enables drawing to the screen.',
                },
                {
                    description = 'Sets the render target to multiple simultaneous 2D Canvases. All drawing operations until the next \'\'love.graphics.setCanvas\'\' call will be redirected to the specified canvases and not shown on the screen.\n\nNormally all drawing operations will draw only to the first canvas passed to the function, but that can be changed if a pixel shader is used with the void effect function instead of the regular vec4 effect.\n\nAll canvas arguments must have the same widths and heights and the same texture type. Not all computers which support Canvases will support multiple render targets. If love.graphics.isSupported(\'multicanvas\') returns true, at least 4 simultaneously active canvases are supported.',
                    arguments = {
                        {
                            type = 'Canvas',
                            name = 'canvas1',
                            description = 'The first render target.',
                        },
                        {
                            type = 'Canvas',
                            name = 'canvas2',
                            description = 'The second render target.',
                        },
                        {
                            type = 'Canvas',
                            name = '...',
                            description = 'More canvases.',
                        },
                    },
                },
                {
                    description = 'Sets the render target to the specified layer/slice and mipmap level of the given non-2D Canvas. All drawing operations until the next \'\'love.graphics.setCanvas\'\' call will be redirected to the Canvas and not shown on the screen.',
                    arguments = {
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'The new render target.',
                        },
                        {
                            type = 'number',
                            name = 'slice',
                            description = 'For cubemaps this is the cube face index to render to (between 1 and 6). For Array textures this is the array layer. For volume textures this is the depth slice. 2D canvases should use a value of 1.',
                        },
                        {
                            type = 'number',
                            name = 'mipmap',
                            description = 'The mipmap level to render to, for Canvases with mipmaps.',
                            default = '1',
                        },
                    },
                },
                {
                    description = 'Sets the active render target(s) and active stencil and depth buffers based on the specified setup information. All drawing operations until the next \'\'love.graphics.setCanvas\'\' call will be redirected to the specified Canvases and not shown on the screen.\n\nThe RenderTargetSetup parameters can either be a Canvas|[1]|The Canvas to use for this active render target.}}\n\n{{param|number|mipmap (1)|The mipmap level to render to, for Canvases with [[Texture:getMipmapCount|mipmaps.}}\n\n{{param|number|layer (1)|Only used for Volume and Array-type Canvases. For Array textures this is the array layer to render to. For volume textures this is the depth slice.}}\n\n{{param|number|face (1)|Only used for Cubemap-type Canvases. The cube face index to render to (between 1 and 6)}}',
                    arguments = {
                        {
                            type = 'table',
                            name = 'setup',
                            description = 'A table specifying the active Canvas(es), their mipmap levels and active layers if applicable, and whether to use a stencil and/or depth buffer.',
                            table = {
                                {
                                    type = 'RenderTargetSetup',
                                    name = '1',
                                    description = 'The Canvas to render to.',
                                },
                                {
                                    type = 'RenderTargetSetup',
                                    name = '2',
                                    description = 'An additional Canvas to render to, if multiple simultaneous render targets are wanted.',
                                    default = 'nil',
                                },
                                {
                                    type = 'RenderTargetSetup',
                                    name = '...',
                                    description = 'Additional Canvases to render to, if multiple simultaneous render targets are wanted.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'stencil',
                                    description = 'Whether an internally managed stencil buffer should be used, if the depthstencil field isn\'t set.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'depth',
                                    description = 'Whether an internally managed depth buffer should be used, if the depthstencil field isn\'t set.',
                                    default = 'false',
                                },
                                {
                                    type = 'RenderTargetSetup',
                                    name = 'depthstencil',
                                    description = 'An optional custom depth/stencil formatted Canvas to use for the depth and/or stencil buffer.',
                                    default = 'nil',
                                },
                            },
                        },
                    },
                },
            },
        },
        {
            name = 'setColor',
            description = 'Sets the color used for drawing.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'red',
                            description = 'The amount of red.',
                        },
                        {
                            type = 'number',
                            name = 'green',
                            description = 'The amount of green.',
                        },
                        {
                            type = 'number',
                            name = 'blue',
                            description = 'The amount of blue.',
                        },
                        {
                            type = 'number',
                            name = 'alpha',
                            description = 'The amount of alpha.  The alpha value will be applied to all subsequent draw operations, even the drawing of an image.',
                            default = '1',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'rgba',
                            description = 'A numerical indexed table with the red, green, blue and alpha values as numbers. The alpha is optional and defaults to 1 if it is left out.',
                        },
                    },
                },
            },
        },
        {
            name = 'setColorMask',
            description = 'Sets the color mask. Enables or disables specific color components when rendering and clearing the screen. For example, if \'\'\'red\'\'\' is set to \'\'\'false\'\'\', no further changes will be made to the red component of any pixels.',
            variants = {
                {
                    description = 'Enables color masking for the specified color components.',
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'red',
                            description = 'Render red component.',
                        },
                        {
                            type = 'boolean',
                            name = 'green',
                            description = 'Render green component.',
                        },
                        {
                            type = 'boolean',
                            name = 'blue',
                            description = 'Render blue component.',
                        },
                        {
                            type = 'boolean',
                            name = 'alpha',
                            description = 'Render alpha component.',
                        },
                    },
                },
                {
                    description = 'Disables color masking.',
                },
            },
        },
        {
            name = 'setDefaultFilter',
            description = 'Sets the default scaling filters used with Images, Canvases, and Fonts.',
            variants = {
                {
                    description = 'This function does not apply retroactively to loaded images.',
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode used when scaling the image down.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when scaling the image up.',
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of Anisotropic Filtering used.',
                            default = '1',
                        },
                    },
                },
            },
        },
        {
            name = 'setDepthMode',
            description = 'Configures depth testing and writing to the depth buffer.\n\nThis is low-level functionality designed for use with custom vertex shaders and Meshes with custom vertex attributes. No higher level APIs are provided to set the depth of 2D graphics such as shapes, lines, and Images.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'CompareMode',
                            name = 'comparemode',
                            description = 'Depth comparison mode used for depth testing.',
                        },
                        {
                            type = 'boolean',
                            name = 'write',
                            description = 'Whether to write update / write values to the depth buffer when rendering.',
                        },
                    },
                },
                {
                    description = 'Disables depth testing and depth writes.',
                },
            },
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
                            description = 'The Font object to use.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFrontFaceWinding',
            description = 'Sets whether triangles with clockwise- or counterclockwise-ordered vertices are considered front-facing.\n\nThis is designed for use in combination with Mesh face culling. Other love.graphics shapes, lines, and sprites are not guaranteed to have a specific winding order to their internal vertices.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'VertexWinding',
                            name = 'winding',
                            description = 'The winding mode to use. The default winding is counterclockwise (\'ccw\').',
                        },
                    },
                },
            },
        },
        {
            name = 'setLineJoin',
            description = 'Sets the line join style. See LineJoin for the possible options.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'LineJoin',
                            name = 'join',
                            description = 'The LineJoin to use.',
                        },
                    },
                },
            },
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
                            description = 'The LineStyle to use. Line styles include smooth and rough.',
                        },
                    },
                },
            },
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
                            description = 'The width of the line.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMeshCullMode',
            description = 'Sets whether back-facing triangles in a Mesh are culled.\n\nThis is designed for use with low level custom hardware-accelerated 3D rendering via custom vertex attributes on Meshes, custom vertex shaders, and depth testing with a depth buffer.\n\nBy default, both front- and back-facing triangles in Meshes are rendered.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'CullMode',
                            name = 'mode',
                            description = 'The Mesh face culling mode to use (whether to render everything, cull back-facing triangles, or cull front-facing triangles).',
                        },
                    },
                },
            },
        },
        {
            name = 'setNewFont',
            description = 'Creates and sets a new Font.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The size of the font.',
                            default = '12',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The path and name of the file with the font.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The size of the font.',
                            default = '12',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'A File with the font.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The size of the font.',
                            default = '12',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data with the font.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The size of the font.',
                            default = '12',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Rasterizer',
                            name = 'rasterizer',
                            description = 'A rasterizer.',
                        },
                    },
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font.',
                        },
                    },
                },
            },
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
                            description = 'The new point size.',
                        },
                    },
                },
            },
        },
        {
            name = 'setScissor',
            description = 'Sets or disables scissor.\n\nThe scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear. \n\nThe dimensions of the scissor is unaffected by graphical transformations (translate, scale, ...).',
            variants = {
                {
                    description = 'Limits the drawing area to a specified rectangle. ',
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'x coordinate of upper left corner.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'y coordinate of upper left corner.',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'width of clipping rectangle.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'height of clipping rectangle.',
                        },
                    },
                },
                {
                    description = 'Disables scissor.',
                },
            },
        },
        {
            name = 'setShader',
            description = 'Sets or resets a Shader as the current pixel effect or vertex shaders. All drawing operations until the next \'\'love.graphics.setShader\'\' will be drawn using the Shader object specified.',
            variants = {
                {
                    description = 'Sets the current shader to a specified Shader. All drawing operations until the next \'\'love.graphics.setShader\'\' will be drawn using the Shader object specified.',
                    arguments = {
                        {
                            type = 'Shader',
                            name = 'shader',
                            description = 'The new shader.',
                        },
                    },
                },
                {
                    description = 'Disables shaders, allowing unfiltered drawing operations.',
                },
            },
        },
        {
            name = 'setStencilTest',
            description = 'Configures or disables stencil testing.\n\nWhen stencil testing is enabled, the geometry of everything that is drawn afterward will be clipped / stencilled out based on a comparison between the arguments of this function and the stencil value of each pixel that the geometry touches. The stencil values of pixels are affected via love.graphics.stencil.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'CompareMode',
                            name = 'comparemode',
                            description = 'The type of comparison to make for each pixel.',
                        },
                        {
                            type = 'number',
                            name = 'comparevalue',
                            description = 'The value to use when comparing with the stencil value of each pixel. Must be between 0 and 255.',
                        },
                    },
                },
                {
                    description = 'Disables stencil testing.',
                },
            },
        },
        {
            name = 'setWireframe',
            description = 'Sets whether wireframe lines will be used when drawing.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True to enable wireframe mode when drawing, false to disable it.',
                        },
                    },
                },
            },
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
                            description = 'The shear factor on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'The shear factor on the y-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'stencil',
            description = 'Draws geometry as a stencil.\n\nThe geometry drawn by the supplied function sets invisible stencil values of pixels, instead of setting pixel colors. The stencil buffer (which contains those stencil values) can act like a mask / stencil - love.graphics.setStencilTest can be used afterward to determine how further rendering is affected by the stencil values in each pixel.\n\nStencil values are integers within the range of 255.',
            variants = {
                {
                    description = 'It is possible to draw to the screen and to the stencil values of pixels at the same time, by using love.graphics.setColorMask inside the stencil function to enable drawing to all color components.',
                    arguments = {
                        {
                            type = 'function',
                            name = 'stencilfunction',
                            description = 'Function which draws geometry. The stencil values of pixels, rather than the color of each pixel, will be affected by the geometry.',
                        },
                        {
                            type = 'StencilAction',
                            name = 'action',
                            description = 'How to modify any stencil values of pixels that are touched by what\'s drawn in the stencil function.',
                            default = '\'replace\'',
                        },
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The new stencil value to use for pixels if the \'replace\' stencil action is used. Has no effect with other stencil actions. Must be between 0 and 255.',
                            default = '1',
                        },
                        {
                            type = 'boolean',
                            name = 'keepvalues',
                            description = 'True to preserve old stencil values of pixels, false to re-set every pixel\'s stencil value to 0 before executing the stencil function. love.graphics.clear will also re-set all stencil values.',
                            default = 'false',
                        },
                    },
                },
            },
        },
        {
            name = 'transformPoint',
            description = 'Converts the given 2D position from global coordinates into screen-space.\n\nThis effectively applies the current graphics transformations to the given position. A similar Transform:transformPoint method exists for Transform objects.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'globalX',
                            description = 'The x component of the position in global coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'globalY',
                            description = 'The y component of the position in global coordinates.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'screenX',
                            description = 'The x component of the position with graphics transformations applied.',
                        },
                        {
                            type = 'number',
                            name = 'screenY',
                            description = 'The y component of the position with graphics transformations applied.',
                        },
                    },
                },
            },
        },
        {
            name = 'translate',
            description = 'Translates the coordinate system in two dimensions.\n\nWhen this function is called with two numbers, dx, and dy, all the following drawing operations take effect as if their x and y coordinates were x+dx and y+dy. \n\nScale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.\n\nThis change lasts until love.draw() exits or else a love.graphics.pop reverts to a previous love.graphics.push.\n\nTranslating using whole numbers will prevent tearing/blurring of images and fonts draw after translating.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The translation relative to the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The translation relative to the y-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'validateShader',
            description = 'Validates shader code. Check if specified shader code does not contain any errors.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'gles',
                            description = 'Validate code as GLSL ES shader.',
                        },
                        {
                            type = 'string',
                            name = 'code',
                            description = 'The pixel shader or vertex shader code, or a filename pointing to a file with the code.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'status',
                            description = 'true if specified shader code doesn\'t contain any errors. false otherwise.',
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'Reason why shader code validation failed (or nil if validation succeded).',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'gles',
                            description = 'Validate code as GLSL ES shader.',
                        },
                        {
                            type = 'string',
                            name = 'pixelcode',
                            description = 'The pixel shader code, or a filename pointing to a file with the code.',
                        },
                        {
                            type = 'string',
                            name = 'vertexcode',
                            description = 'The vertex shader code, or a filename pointing to a file with the code.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'status',
                            description = 'true if specified shader code doesn\'t contain any errors. false otherwise.',
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'Reason why shader code validation failed (or nil if validation succeded).',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.AlignMode'),
        require(path .. 'enums.ArcType'),
        require(path .. 'enums.AreaSpreadDistribution'),
        require(path .. 'enums.BlendAlphaMode'),
        require(path .. 'enums.BlendMode'),
        require(path .. 'enums.CompareMode'),
        require(path .. 'enums.CullMode'),
        require(path .. 'enums.DrawMode'),
        require(path .. 'enums.FilterMode'),
        require(path .. 'enums.GraphicsFeature'),
        require(path .. 'enums.GraphicsLimit'),
        require(path .. 'enums.IndexDataType'),
        require(path .. 'enums.LineJoin'),
        require(path .. 'enums.LineStyle'),
        require(path .. 'enums.MeshDrawMode'),
        require(path .. 'enums.MipmapMode'),
        require(path .. 'enums.ParticleInsertMode'),
        require(path .. 'enums.SpriteBatchUsage'),
        require(path .. 'enums.StackType'),
        require(path .. 'enums.StencilAction'),
        require(path .. 'enums.TextureType'),
        require(path .. 'enums.VertexAttributeStep'),
        require(path .. 'enums.VertexWinding'),
        require(path .. 'enums.WrapMode'),
    },
}