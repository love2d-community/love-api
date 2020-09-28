local path = (...):match('(.-)[^%./]+$')

return {
    name = 'FrictionJoint',
    description = 'A FrictionJoint applies friction to a body.',
    constructors = {
        'newFrictionJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'getMaxForce',
            description = 'Gets the maximum friction force in Newtons.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'force',
                            description = 'Maximum force in Newtons.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMaxTorque',
            description = 'Gets the maximum friction torque in Newton-meters.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'torque',
                            description = 'Maximum torque in Newton-meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMaxForce',
            description = 'Sets the maximum friction force in Newtons.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'maxForce',
                            description = 'Max force in Newtons.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMaxTorque',
            description = 'Sets the maximum friction torque in Newton-meters.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'torque',
                            description = 'Maximum torque in Newton-meters.',
                        },
                    },
                },
            },
        },
    },
}