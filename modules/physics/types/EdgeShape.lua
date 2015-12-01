return {
    name = 'EdgeShape',
    description = 'A EdgeShape is a line segment. They can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.',
    constructors = {
        'newEdgeShape'
    },
    functions = {
        {
            name = 'getPoints',
            description = 'Returns the local coordinates of the edge points.',
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
