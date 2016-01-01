return {
    name = 'PolygonShape',
    description = 'Polygon is a convex polygon with up to 8 sides.',
    constructors = {
        'newPolygonShape',
        'newRectangleShape'
    },
    functions = {
        {
            name = 'getPoints',
            description = 'Get the local coordinates of the polygon\'s vertices.\n\nThis function has a variable number of return values. It can be used in a nested fashion with love.graphics.polygon.\n\nThis function may have up to 16 return values, since it returns two values for each vertex in the polygon. In other words, it can return the coordinates of up to 8 points.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x component of the first vertex.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y component of the first vertex.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x component of the second vertex.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y component of the second vertex.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional x and y values.'
                        }
                    }
                }
            }
        }
    },
    supertypes = {
        'Shape',
        'Object'
    }
}
