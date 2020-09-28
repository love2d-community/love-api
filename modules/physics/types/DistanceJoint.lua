local path = (...):match('(.-)[^%./]+$')

return {
    name = 'DistanceJoint',
    description = 'Keeps two bodies at the same distance.',
    constructors = {
        'newDistanceJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'getDampingRatio',
            description = 'Gets the damping ratio.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The damping ratio.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFrequency',
            description = 'Gets the response speed.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'Hz',
                            description = 'The response speed.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLength',
            description = 'Gets the equilibrium distance between the two Bodies.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'l',
                            description = 'The length between the two Bodies.',
                        },
                    },
                },
            },
        },
        {
            name = 'setDampingRatio',
            description = 'Sets the damping ratio.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The damping ratio.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFrequency',
            description = 'Sets the response speed.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'Hz',
                            description = 'The response speed.',
                        },
                    },
                },
            },
        },
        {
            name = 'setLength',
            description = 'Sets the equilibrium distance between the two Bodies.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'l',
                            description = 'The length between the two Bodies.',
                        },
                    },
                },
            },
        },
    },
}