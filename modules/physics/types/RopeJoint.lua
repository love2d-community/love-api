return {
    name = 'RopeJoint',
    description = 'The RopeJoint enforces a maximum distance between two points on two bodies. It has no other effect.',
    constructors = {
        'newRopeJoint'
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
                            description = 'The maximum length of the RopeJoint.'
                        }
                    }
                }
            }
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
                            description = 'The maximum length of the RopeJoint.'
                        }
                    }
                }
            }
        }
    },
    parenttype = 'Joint',
    supertypes = {
        'Object',
        'Joint'
    }
}
