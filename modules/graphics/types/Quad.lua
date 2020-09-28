local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Quad',
    description = 'A quadrilateral (a polygon with four sides and four corners) with texture coordinate information.\n\nQuads can be used to select part of a texture to draw. In this way, one large texture atlas can be loaded, and then split up into sub-images.',
    constructors = {
        'newQuad',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getTextureDimensions',
            description = 'Gets reference texture dimensions initially specified in love.graphics.newQuad.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'sw',
                            description = 'The Texture width used by the Quad.',
                        },
                        {
                            type = 'number',
                            name = 'sh',
                            description = 'The Texture height used by the Quad.',
                        },
                    },
                },
            },
        },
        {
            name = 'getViewport',
            description = 'Gets the current viewport of this Quad.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The top-left corner along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The top-left corner along the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'w',
                            description = 'The width of the viewport.',
                        },
                        {
                            type = 'number',
                            name = 'h',
                            description = 'The height of the viewport.',
                        },
                    },
                },
            },
        },
        {
            name = 'setViewport',
            description = 'Sets the texture coordinates according to a viewport.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The top-left corner along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The top-left corner along the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'w',
                            description = 'The width of the viewport.',
                        },
                        {
                            type = 'number',
                            name = 'h',
                            description = 'The height of the viewport.',
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
                },
            },
        },
    },
}