local path = (...):match('(.-)[^%./]+$')

return {
    name = 'CircleShape',
    description = 'Circle extends Shape and adds a radius and a local position.',
    constructors = {
        'newCircleShape',
    },
    supertypes = {
        'Shape',
        'Object',
    },
    functions = {
        {
            name = 'getPoint',
            description = 'Gets the center point of the circle shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the center point of the circle.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the center point of the circle.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRadius',
            description = 'Gets the radius of the circle shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'The radius of the circle',
                        },
                    },
                },
            },
        },
        {
            name = 'setPoint',
            description = 'Sets the location of the center of the circle shape.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the new center point of the circle.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the new center point of the circle.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRadius',
            description = 'Sets the radius of the circle.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'The radius of the circle',
                        },
                    },
                },
            },
        },
    },
}