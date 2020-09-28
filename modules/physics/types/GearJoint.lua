local path = (...):match('(.-)[^%./]+$')

return {
    name = 'GearJoint',
    description = 'Keeps bodies together in such a way that they act like gears.',
    constructors = {
        'newGearJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'getJoints',
            description = 'Get the Joints connected by this GearJoint.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Joint',
                            name = 'joint1',
                            description = 'The first connected Joint.',
                        },
                        {
                            type = 'Joint',
                            name = 'joint2',
                            description = 'The second connected Joint.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRatio',
            description = 'Get the ratio of a gear joint.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The ratio of the joint.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRatio',
            description = 'Set the ratio of a gear joint.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The new ratio of the joint.',
                        },
                    },
                },
            },
        },
    },
}