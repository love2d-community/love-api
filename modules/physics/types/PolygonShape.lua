local path = (...):match('(.-)[^%./]+$')

return {
    name = 'PolygonShape',
    description = 'A PolygonShape is a convex polygon with up to 8 vertices.',
    constructors = {
        'newPolygonShape',
        'newRectangleShape',
    },
    supertypes = {
        'Shape',
        'Object',
    },
    functions = {
        {
            name = 'getPoints',
            description = 'Get the local coordinates of the polygon\'s vertices.\n\nThis function has a variable number of return values. It can be used in a nested fashion with love.graphics.polygon.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x-component of the first vertex.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y-component of the first vertex.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x-component of the second vertex.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y-component of the second vertex.',
                        },
                    },
                },
            },
        },
    },
}