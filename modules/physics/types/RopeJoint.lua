local path = (...):match('(.-)[^%./]+$')

return {
    name = 'RopeJoint',
    description = 'The RopeJoint enforces a maximum distance between two points on two bodies. It has no other effect.',
    constructors = {
        'newRopeJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'getMaxLength',
            description = 'Gets the maximum length of a RopeJoint.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'maxLength',
                            description = 'The maximum length of the RopeJoint.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMaxLength',
            description = 'Sets the maximum length of a RopeJoint.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'maxLength',
                            description = 'The new maximum length of the RopeJoint.',
                        },
                    },
                },
            },
        },
    },
}