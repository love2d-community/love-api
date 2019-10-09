local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Shape',
    description = 'Shapes are solid 2d geometrical objects which handle the mass and collision of a Body in love.physics.\n\nShapes are attached to a Body via a Fixture. The Shape object is copied when this happens. \n\nThe Shape\'s position is relative to the position of the Body it has been attached to.',
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'computeAABB',
            description = 'Returns the points of the bounding box for the transformed shape.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'tx',
                            description = 'The translation of the shape on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'ty',
                            description = 'The translation of the shape on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'tr',
                            description = 'The shape rotation.',
                        },
                        {
                            type = 'number',
                            name = 'childIndex',
                            description = 'The index of the child to compute the bounding box of.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'topLeftX',
                            description = 'The x position of the top-left point.',
                        },
                        {
                            type = 'number',
                            name = 'topLeftY',
                            description = 'The y position of the top-left point.',
                        },
                        {
                            type = 'number',
                            name = 'bottomRightX',
                            description = 'The x position of the bottom-right point.',
                        },
                        {
                            type = 'number',
                            name = 'bottomRightY',
                            description = 'The y position of the bottom-right point.',
                        },
                    },
                },
            },
        },
        {
            name = 'computeMass',
            description = 'Computes the mass properties for the shape with the specified density.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'density',
                            description = 'The shape density.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x postition of the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y postition of the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'mass',
                            description = 'The mass of the shape.',
                        },
                        {
                            type = 'number',
                            name = 'inertia',
                            description = 'The rotational inertia.',
                        },
                    },
                },
            },
        },
        {
            name = 'getChildCount',
            description = 'Returns the number of children the shape has.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of children.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRadius',
            description = 'Gets the radius of the shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'The radius of the shape.',
                        },
                    },
                },
            },
        },
        {
            name = 'getType',
            description = 'Gets a string representing the Shape.\n\nThis function can be useful for conditional debug drawing.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ShapeType',
                            name = 'type',
                            description = 'The type of the Shape.',
                        },
                    },
                },
            },
        },
        {
            name = 'rayCast',
            description = 'Casts a ray against the shape and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned. The Shape can be transformed to get it into the desired position.\n\nThe ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.\n\nThe childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.\n\nThe world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.\n\nhitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x position of the input line starting point.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the input line starting point.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x position of the input line end point.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y position of the input line end point.',
                        },
                        {
                            type = 'number',
                            name = 'maxFraction',
                            description = 'Ray length parameter.',
                        },
                        {
                            type = 'number',
                            name = 'tx',
                            description = 'The translation of the shape on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'ty',
                            description = 'The translation of the shape on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'tr',
                            description = 'The shape rotation.',
                        },
                        {
                            type = 'number',
                            name = 'childIndex',
                            description = 'The index of the child the ray gets cast against.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'xn',
                            description = 'The x component of the normal vector of the edge where the ray hit the shape.',
                        },
                        {
                            type = 'number',
                            name = 'yn',
                            description = 'The y component of the normal vector of the edge where the ray hit the shape.',
                        },
                        {
                            type = 'number',
                            name = 'fraction',
                            description = 'The position on the input line where the intersection happened as a factor of the line length.',
                        },
                    },
                },
            },
        },
        {
            name = 'testPoint',
            description = 'This is particularly useful for mouse interaction with the shapes. By looping through all shapes and testing the mouse position with this function, we can find which shapes the mouse touches.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'tx',
                            description = 'Translates the shape along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'ty',
                            description = 'Translates the shape along the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'tr',
                            description = 'Rotates the shape.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the point.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the point.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hit',
                            description = 'True if inside, false if outside',
                        },
                    },
                },
            },
        },
    },
}