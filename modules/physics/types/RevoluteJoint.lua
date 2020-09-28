local path = (...):match('(.-)[^%./]+$')

return {
    name = 'RevoluteJoint',
    description = 'Allow two Bodies to revolve around a shared point.',
    constructors = {
        'newRevoluteJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'areLimitsEnabled',
            description = 'Checks whether limits are enabled.',
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
            name = 'getJointAngle',
            description = 'Get the current joint angle.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The joint angle in radians.',
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
                            description = 'Joint angle speed in radians/second.',
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
                            description = 'The lower limit, in radians.',
                        },
                        {
                            type = 'number',
                            name = 'upper',
                            description = 'The upper limit, in radians.',
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
                            description = 'The lower limit, in radians.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMaxMotorTorque',
            description = 'Gets the maximum motor force.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'f',
                            description = 'The maximum motor force, in Nm.',
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
                            description = 'The motor speed, radians per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMotorTorque',
            description = 'Get the current motor force.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'f',
                            description = 'The current motor force, in Nm.',
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
                            description = 'The upper limit, in radians.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasLimitsEnabled',
            description = 'Checks whether limits are enabled.',
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
                            description = 'The lower limit, in radians.',
                        },
                        {
                            type = 'number',
                            name = 'upper',
                            description = 'The upper limit, in radians.',
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
            name = 'setLowerLimit',
            description = 'Sets the lower limit.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'lower',
                            description = 'The lower limit, in radians.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMaxMotorTorque',
            description = 'Set the maximum motor force.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'f',
                            description = 'The maximum motor force, in Nm.',
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
                            description = 'The motor speed, radians per second.',
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
                            description = 'The upper limit, in radians.',
                        },
                    },
                },
            },
        },
    },
}