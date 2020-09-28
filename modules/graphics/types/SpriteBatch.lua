local path = (...):match('(.-)[^%./]+$')

return {
    name = 'SpriteBatch',
    description = 'Using a single image, draw any number of identical copies of the image using a single call to love.graphics.draw(). This can be used, for example, to draw repeating copies of a single background image with high performance.\n\nA SpriteBatch can be even more useful when the underlying image is a texture atlas (a single image file containing many independent images); by adding Quads to the batch, different sub-images from within the atlas can be drawn.',
    constructors = {
        'newSpriteBatch',
    },
    supertypes = {
        'Drawable',
        'Object',
    },
    functions = {
        {
            name = 'add',
            description = 'Adds a sprite to the batch. Sprites are drawn in the order they are added.',
            variants = {
                {
                    arguments = {
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
                            description = 'Shear factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shear factor (y-axis).',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'An identifier for the added sprite.',
                        },
                    },
                },
                {
                    description = 'Adds a Quad to the batch.',
                    arguments = {
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The Quad to add.',
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
                            description = 'Shear factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shear factor (y-axis).',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'An identifier for the added sprite.',
                        },
                    },
                },
            },
        },
        {
            name = 'addLayer',
            description = 'Adds a sprite to a batch created with an Array Texture.',
            variants = {
                {
                    description = 'Adds a layer of the SpriteBatch\'s Array Texture.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use for this sprite.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the sprite (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the sprite (y-axis).',
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
                    returns = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the added sprite, for use with SpriteBatch:set or SpriteBatch:setLayer.',
                        },
                    },
                },
                {
                    description = 'Adds a layer of the SpriteBatch\'s Array Texture using the specified Quad.\n\nThe specified layer index overrides any layer index set on the Quad via Quad:setLayer.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use for this sprite.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The subsection of the texture\'s layer to use when drawing the sprite.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the sprite (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the sprite (y-axis).',
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
                    returns = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the added sprite, for use with SpriteBatch:set or SpriteBatch:setLayer.',
                        },
                    },
                },
                {
                    description = 'Adds a layer of the SpriteBatch\'s Array Texture using the specified Transform.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use for this sprite.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'A transform object.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the added sprite, for use with SpriteBatch:set or SpriteBatch:setLayer.',
                        },
                    },
                },
                {
                    description = 'Adds a layer of the SpriteBatch\'s Array Texture using the specified Quad and Transform.\n\nIn order to use an Array Texture or other non-2D texture types as the main texture in a custom void effect() variant must be used in the pixel shader, and MainTex must be declared as an ArrayImage or sampler2DArray like so: uniform ArrayImage MainTex;.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use for this sprite.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The subsection of the texture\'s layer to use when drawing the sprite.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'A transform object.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the added sprite, for use with SpriteBatch:set or SpriteBatch:setLayer.',
                        },
                    },
                },
            },
        },
        {
            name = 'attachAttribute',
            description = 'Attaches a per-vertex attribute from a Mesh onto this SpriteBatch, for use when drawing. This can be combined with a Shader to augment a SpriteBatch with per-vertex or additional per-sprite information instead of just having per-sprite colors.\n\nEach sprite in a SpriteBatch has 4 vertices in the following order: top-left, bottom-left, top-right, bottom-right. The index returned by SpriteBatch:add (and used by SpriteBatch:set) can used to determine the first vertex of a specific sprite with the formula 1 + 4 * ( id - 1 ).',
            variants = {
                {
                    description = 'If a created with a custom vertex format, it will have 3 vertex attributes named VertexPosition, VertexTexCoord, and VertexColor. If vertex attributes with those names are attached to the SpriteBatch, it will override the SpriteBatch\'s sprite positions, texture coordinates, and sprite colors, respectively.\n\nCustom named attributes can be accessed in a vertex shader by declaring them as attribute vec4 MyCustomAttributeName; at the top-level of the vertex shader code. The name must match what was specified in the Mesh\'s vertex format and in the name argument of SpriteBatch:attachAttribute.\n\nA Mesh must have at least 4 * SpriteBatch:getBufferSize vertices in order to be attachable to a SpriteBatch.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the vertex attribute to attach.',
                        },
                        {
                            type = 'Mesh',
                            name = 'mesh',
                            description = 'The Mesh to get the vertex attribute from.',
                        },
                    },
                },
            },
        },
        {
            name = 'clear',
            description = 'Removes all sprites from the buffer.',
            variants = {
                {
                },
            },
        },
        {
            name = 'flush',
            description = 'Immediately sends all new and modified sprite data in the batch to the graphics card.\n\nNormally it isn\'t necessary to call this method as love.graphics.draw(spritebatch, ...) will do it automatically if needed, but explicitly using SpriteBatch:flush gives more control over when the work happens.\n\nIf this method is used, it generally shouldn\'t be called more than once (at most) between love.graphics.draw(spritebatch, ...) calls.',
            variants = {
                {
                },
            },
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
                            description = 'The maximum number of sprites the batch can hold.',
                        },
                    },
                },
            },
        },
        {
            name = 'getColor',
            description = 'Gets the color that will be used for the next add and set operations.\n\nIf no color has been set with SpriteBatch:setColor or the current SpriteBatch color has been cleared, this method will return nil.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
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
            name = 'getCount',
            description = 'Gets the number of sprites currently in the SpriteBatch.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of sprites currently in the batch.',
                        },
                    },
                },
            },
        },
        {
            name = 'getTexture',
            description = 'Gets the texture (Image or Canvas) used by the SpriteBatch.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Image or Canvas used by the SpriteBatch.',
                        },
                    },
                },
            },
        },
        {
            name = 'set',
            description = 'Changes a sprite in the batch. This requires the sprite index returned by SpriteBatch:add or SpriteBatch:addLayer.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the sprite that will be changed.',
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
                            description = 'Shear factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shear factor (y-axis).',
                            default = '0',
                        },
                    },
                },
                {
                    description = 'Changes a sprite with a Quad in the batch. This requires the index returned by SpriteBatch:add or SpriteBatch:addLayer.\n\nSpriteBatches do not support removing individual sprites. One can do a pseudo removal (instead of clearing and re-adding everything) by:\n\nSpriteBatch:set(id, 0, 0, 0, 0, 0)\n\nThis makes all the sprite\'s vertices equal (because the x and y scales are 0), which prevents the GPU from fully processing the sprite when drawing the SpriteBatch.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the sprite that will be changed.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The Quad used on the image of the batch.',
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
                            description = 'Shear factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shear factor (y-axis).',
                            default = '0',
                        },
                    },
                },
            },
        },
        {
            name = 'setColor',
            description = 'Sets the color that will be used for the next add and set operations. Calling the function without arguments will disable all per-sprite colors for the SpriteBatch.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.\n\nIn version 0.9.2 and older, the global color set with love.graphics.setColor will not work on the SpriteBatch if any of the sprites has its own color.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The amount of red.',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The amount of green.',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The amount of blue.',
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The amount of alpha.',
                            default = '1',
                        },
                    },
                },
                {
                    description = 'Disables all per-sprite colors for this SpriteBatch.',
                },
            },
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
                            description = 'The index of the first sprite to draw. Index 1 corresponds to the first sprite added with SpriteBatch:add.',
                        },
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of sprites to draw.',
                        },
                    },
                },
                {
                    description = 'Allows all sprites in the SpriteBatch to be drawn.',
                },
            },
        },
        {
            name = 'setLayer',
            description = 'Changes a sprite previously added with add or addLayer, in a batch created with an Array Texture.',
            variants = {
                {
                    description = 'Changes the sprite in the SpriteBatch.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the existing sprite to replace.',
                        },
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer in the Array Texture to use for this sprite.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the sprite (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the sprite (y-axis).',
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
                    description = 'Adds a layer of the SpriteBatch\'s Array Texture using the specified Quad.\n\nThe specified layer index overrides any layer index set on the Quad via Quad:setLayer.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the existing sprite to replace.',
                        },
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use for this sprite.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The subsection of the texture\'s layer to use when drawing the sprite.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position to draw the sprite (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position to draw the sprite (y-axis).',
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
                    description = 'Adds a layer of the SpriteBatch\'s Array Texture using the specified Transform.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the existing sprite to replace.',
                        },
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use for the sprite.',
                        },
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'A transform object.',
                        },
                    },
                },
                {
                    description = 'Adds a layer of the SpriteBatch\'s Array Texture using the specified Quad and Transform.\n\nThe specified layer index overrides any layer index set on the Quad via Quad:setLayer.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'spriteindex',
                            description = 'The index of the existing sprite to replace.',
                        },
                        {
                            type = 'number',
                            name = 'layerindex',
                            description = 'The index of the layer to use for the sprite.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad',
                            description = 'The subsection of the texture\'s layer to use when drawing the sprite.',
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
            name = 'setTexture',
            description = 'Sets the texture (Image or Canvas) used for the sprites in the batch, when drawing.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The new Image or Canvas to use for the sprites in the batch.',
                        },
                    },
                },
            },
        },
    },
}