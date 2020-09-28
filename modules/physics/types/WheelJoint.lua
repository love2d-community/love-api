local path = (...):match('(.-)[^%./]+$')

return {
    name = 'WheelJoint',
    description = 'Restricts a point on the second body to a line on the first body.',
    constructors = {
        'newWheelJoint',
    },
    supertypes = {
        'Joint',
        'Object',
    },
    functions = {
        {
            name = 'getAxis',
            description = 'Gets the world-space axis vector of the Wheel Joint.',
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
            description = 'Returns the current joint translation speed.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'speed',
                            description = 'The translation speed of the joint in meters per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'getJointTranslation',
            description = 'Returns the current joint translation.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'position',
                            description = 'The translation of the joint in meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMaxMotorTorque',
            description = 'Returns the maximum motor torque.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'maxTorque',
                            description = 'The maximum torque of the joint motor in newton meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMotorSpeed',
            description = 'Returns the speed of the motor.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'speed',
                            description = 'The speed of the joint motor in radians per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMotorTorque',
            description = 'Returns the current torque on the motor.',
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
                            name = 'torque',
                            description = 'The torque on the motor in newton meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSpringDampingRatio',
            description = 'Returns the damping ratio.',
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
            name = 'getSpringFrequency',
            description = 'Returns the spring frequency.',
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
            name = 'setMaxMotorTorque',
            description = 'Sets a new maximum motor torque.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'maxTorque',
                            description = 'The new maximum torque for the joint motor in newton meters.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMotorEnabled',
            description = 'Starts and stops the joint motor.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True turns the motor on and false turns it off.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMotorSpeed',
            description = 'Sets a new speed for the motor.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'speed',
                            description = 'The new speed for the joint motor in radians per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'setSpringDampingRatio',
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
            name = 'setSpringFrequency',
            description = 'Sets a new spring frequency.',
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
    },
}