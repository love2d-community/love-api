local path = (...):match('(.-)[^%./]+$')

return {
    name = 'ChainShape',
    description = 'A ChainShape consists of multiple line segments. It can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.\n\nUnlike the PolygonShape, the ChainShape does not have a vertices limit or has to form a convex shape, but self intersections are not supported.',
    constructors = {
        'newChainShape',
    },
    supertypes = {
        'Shape',
        'Object',
    },
    functions = {
        {
            name = 'getChildEdge',
            description = 'Returns a child of the shape as an EdgeShape.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'The index of the child.',
                        },
                    },
                    returns = {
                        {
                            type = 'EdgeShape',
                            name = 'shape',
                            description = 'The child as an EdgeShape.',
                        },
                    },
                },
            },
        },
        {
            name = 'getNextVertex',
            description = 'Gets the vertex that establishes a connection to the next shape.\n\nSetting next and previous ChainShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the vertex, or nil if ChainShape:setNextVertex hasn\'t been called.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the vertex, or nil if ChainShape:setNextVertex hasn\'t been called.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPoint',
            description = 'Returns a point of the shape.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'The index of the point to return.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-coordinate of the point.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-coordinate of the point.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPoints',
            description = 'Returns all points of the shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x-coordinate of the first point.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y-coordinate of the first point.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x-coordinate of the second point.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y-coordinate of the second point.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPreviousVertex',
            description = 'Gets the vertex that establishes a connection to the previous shape.\n\nSetting next and previous ChainShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the vertex, or nil if ChainShape:setPreviousVertex hasn\'t been called.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the vertex, or nil if ChainShape:setPreviousVertex hasn\'t been called.',
                        },
                    },
                },
            },
        },
        {
            name = 'getVertexCount',
            description = 'Returns the number of vertices the shape has.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of vertices.',
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