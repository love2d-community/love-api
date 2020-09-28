local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Canvas',
    description = 'A Canvas is used for off-screen rendering. Think of it as an invisible screen that you can draw to, but that will not be visible until you draw it to the actual visible screen. It is also known as "render to texture".\n\nBy drawing things that do not change position often (such as background items) to the Canvas, and then drawing the entire Canvas instead of each item,  you can reduce the number of draw operations performed each frame.\n\nIn versions prior to love.graphics.isSupported("canvas") could be used to check for support at runtime.',
    constructors = {
        'newCanvas',
        'getCanvas',
    },
    supertypes = {
        'Texture',
        'Drawable',
        'Object',
    },
    functions = {
        {
            name = 'generateMipmaps',
            description = 'Generates mipmaps for the Canvas, based on the contents of the highest-resolution mipmap level.\n\nThe Canvas must be created with mipmaps set to a MipmapMode other than \'none\' for this function to work. It should only be called while the Canvas is not the active render target.\n\nIf the mipmap mode is set to \'auto\', this function is automatically called inside love.graphics.setCanvas when switching from this Canvas to another Canvas or to the main screen.',
            variants = {
                {
                },
            },
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
                            description = 'The number of multisample antialiasing samples used by the canvas when drawing to it.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMipmapMode',
            description = 'Gets the MipmapMode this Canvas was created with.',
            variants = {
                {
                    returns = {
                        {
                            type = 'MipmapMode',
                            name = 'mode',
                            description = 'The mipmap mode this Canvas was created with.',
                        },
                    },
                },
            },
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
                            description = 'The new ImageData made from the Canvas\' contents.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'slice',
                            description = 'The cubemap face index, array index, or depth layer for cubemap, array, or volume type Canvases, respectively. This argument is ignored for regular 2D canvases.',
                        },
                        {
                            type = 'number',
                            name = 'mipmap',
                            description = 'The mipmap index to use, for Canvases with mipmaps.',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis of the top-left corner (in pixels) of the area within the Canvas to capture.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis of the top-left corner (in pixels) of the area within the Canvas to capture.',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width in pixels of the area within the Canvas to capture.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height in pixels of the area within the Canvas to capture.',
                        },
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'data',
                            description = 'The new ImageData made from the Canvas\' contents.',
                        },
                    },
                },
            },
        },
        {
            name = 'renderTo',
            description = 'Render to the Canvas using a function.\n\nThis is a shortcut to love.graphics.setCanvas:\n\ncanvas:renderTo( func )\n\nis the same as\n\nlove.graphics.setCanvas( canvas )\n\nfunc()\n\nlove.graphics.setCanvas()',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'func',
                            description = 'A function performing drawing operations.',
                        },
                    },
                },
            },
        },
    },
}