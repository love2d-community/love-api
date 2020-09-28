local path = (...):match('(.-)[^%./]+$')

return {
    name = 'EdgeShape',
    description = 'A EdgeShape is a line segment. They can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.',
    constructors = {
        'newEdgeShape',
    },
    supertypes = {
        'Shape',
        'Object',
    },
    functions = {
        {
            name = 'getNextVertex',
            description = 'Gets the vertex that establishes a connection to the next shape.\n\nSetting next and previous EdgeShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the vertex, or nil if EdgeShape:setNextVertex hasn\'t been called.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the vertex, or nil if EdgeShape:setNextVertex hasn\'t been called.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPoints',
            description = 'Returns the local coordinates of the edge points.',
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
        {
            name = 'getPreviousVertex',
            description = 'Gets the vertex that establishes a connection to the previous shape.\n\nSetting next and previous EdgeShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the vertex, or nil if EdgeShape:setPreviousVertex hasn\'t been called.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the vertex, or nil if EdgeShape:setPreviousVertex hasn\'t been called.',
                        },
                    },
                },
            },
        },
        {
            name = 'setNextVertex',
            description = 'Sets a vertex that establishes a connection to the next shape.\n\nThis can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the vertex.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the vertex.',
                        },
                    },
                },
            },
        },
        {
            name = 'setPreviousVertex',
            description = 'Sets a vertex that establishes a connection to the previous shape.\n\nThis can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the vertex.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the vertex.',
                        },
                    },
                },
            },
        },
    },
}