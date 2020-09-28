local path = (...):match('(.-)[^%./]+$')

return {
    name = 'MouseJoint',
    description = 'For controlling objects with the mouse.',
    constructors = {
        'newMouseJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'getDampingRatio',
            description = 'Returns the damping ratio.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The new damping ratio.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFrequency',
            description = 'Returns the frequency.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'freq',
                            description = 'The frequency in hertz.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMaxForce',
            description = 'Gets the highest allowed force.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'f',
                            description = 'The max allowed force.',
                        },
                    },
                },
            },
        },
        {
            name = 'getTarget',
            description = 'Gets the target point.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the target.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The x-component of the target.',
                        },
                    },
                },
            },
        },
        {
            name = 'setDampingRatio',
            description = 'Sets a new damping ratio.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The new damping ratio.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFrequency',
            description = 'Sets a new frequency.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'freq',
                            description = 'The new frequency in hertz.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMaxForce',
            description = 'Sets the highest allowed force.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'f',
                            description = 'The max allowed force.',
                        },
                    },
                },
            },
        },
        {
            name = 'setTarget',
            description = 'Sets the target point.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the target.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the target.',
                        },
                    },
                },
            },
        },
    },
}