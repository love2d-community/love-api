local path = (...):match('(.-)[^%./]+$')

return {
    name = 'PrismaticJoint',
    description = 'Restricts relative motion between Bodies to one shared axis.',
    constructors = {
        'newPrismaticJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'areLimitsEnabled',
            description = 'Checks whether the limits are enabled.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'True if enabled, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'getAxis',
            description = 'Gets the world-space axis vector of the Prismatic Joint.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis coordinate of the world-space axis vector.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis coordinate of the world-space axis vector.',
                        },
                    },
                },
            },
        },
        {
            name = 'getJointSpeed',
            description = 'Get the current joint angle speed.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 's',
                            description = 'Joint angle speed in meters/second.',
                        },
                    },
                },
            },
        },
        {
            name = 'getJointTranslation',
            description = 'Get the current joint translation.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 't',
                            description = 'Joint translation, usually in meters..',
                        },
                    },
                },
            },
        },
        {
            name = 'getLimits',
            description = 'Gets the joint limits.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'lower',
                            description = 'The lower limit, usually in meters.',
                        },
                        {
                            type = 'number',
                            name = 'upper',
                            description = 'The upper limit, usually in meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLowerLimit',
            description = 'Gets the lower limit.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'lower',
                            description = 'The lower limit, usually in meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMaxMotorForce',
            description = 'Gets the maximum motor force.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'f',
                            description = 'The maximum motor force, usually in N.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMotorForce',
            description = 'Returns the current motor force.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'invdt',
                            description = 'How long the force applies. Usually the inverse time step or 1/dt.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'force',
                            description = 'The force on the motor in newtons.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMotorSpeed',
            description = 'Gets the motor speed.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 's',
                            description = 'The motor speed, usually in meters per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'getUpperLimit',
            description = 'Gets the upper limit.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'upper',
                            description = 'The upper limit, usually in meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'isMotorEnabled',
            description = 'Checks whether the motor is enabled.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'True if enabled, false if disabled.',
                        },
                    },
                },
            },
        },
        {
            name = 'setLimits',
            description = 'Sets the limits.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'lower',
                            description = 'The lower limit, usually in meters.',
                        },
                        {
                            type = 'number',
                            name = 'upper',
                            description = 'The upper limit, usually in meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'setLimitsEnabled',
            description = 'Enables/disables the joint limit.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True if enabled, false if disabled.',
                        },
                    },
                },
            },
        },
        {
            name = 'setLowerLimit',
            description = 'Sets the lower limit.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'lower',
                            description = 'The lower limit, usually in meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMaxMotorForce',
            description = 'Set the maximum motor force.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'f',
                            description = 'The maximum motor force, usually in N.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMotorEnabled',
            description = 'Enables/disables the joint motor.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True to enable, false to disable.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMotorSpeed',
            description = 'Sets the motor speed.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 's',
                            description = 'The motor speed, usually in meters per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'setUpperLimit',
            description = 'Sets the upper limit.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'upper',
                            description = 'The upper limit, usually in meters.',
                        },
                    },
                },
            },
        },
    },
}