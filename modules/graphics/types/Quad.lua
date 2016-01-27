return {
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
}
