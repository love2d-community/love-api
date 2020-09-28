local path = (...):match('(.-)[^%./]+$')

return {
    name = 'PulleyJoint',
    description = 'Allows you to simulate bodies connected through pulleys.',
    constructors = {
        'newPulleyJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'getConstant',
            description = 'Get the total length of the rope.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'length',
                            description = 'The length of the rope in the joint.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGroundAnchors',
            description = 'Get the ground anchor positions in world coordinates.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'a1x',
                            description = 'The x coordinate of the first anchor.',
                        },
                        {
                            type = 'number',
                            name = 'a1y',
                            description = 'The y coordinate of the first anchor.',
                        },
                        {
                            type = 'number',
                            name = 'a2x',
                            description = 'The x coordinate of the second anchor.',
                        },
                        {
                            type = 'number',
                            name = 'a2y',
                            description = 'The y coordinate of the second anchor.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLengthA',
            description = 'Get the current length of the rope segment attached to the first body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'length',
                            description = 'The length of the rope segment.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLengthB',
            description = 'Get the current length of the rope segment attached to the second body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'length',
                            description = 'The length of the rope segment.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMaxLengths',
            description = 'Get the maximum lengths of the rope segments.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'len1',
                            description = 'The maximum length of the first rope segment.',
                        },
                        {
                            type = 'number',
                            name = 'len2',
                            description = 'The maximum length of the second rope segment.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRatio',
            description = 'Get the pulley ratio.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The pulley ratio of the joint.',
                        },
                    },
                },
            },
        },
        {
            name = 'setConstant',
            description = 'Set the total length of the rope.\n\nSetting a new length for the rope updates the maximum length values of the joint.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'length',
                            description = 'The new length of the rope in the joint.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMaxLengths',
            description = 'Set the maximum lengths of the rope segments.\n\nThe physics module also imposes maximum values for the rope segments. If the parameters exceed these values, the maximum values are set instead of the requested values.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'max1',
                            description = 'The new maximum length of the first segment.',
                        },
                        {
                            type = 'number',
                            name = 'max2',
                            description = 'The new maximum length of the second segment.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRatio',
            description = 'Set the pulley ratio.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The new pulley ratio of the joint.',
                        },
                    },
                },
            },
        },
    },
}