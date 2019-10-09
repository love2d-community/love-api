local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Joint',
    description = 'Attach multiple bodies together to interact in unique ways.',
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'destroy',
            description = 'Explicitly destroys the Joint. An error will occur if you attempt to use the object after calling this function.\n\nIn 0.7.2, when you don\'t have time to wait for garbage collection, this function \n\nmay be used to free the object immediately.',
            variants = {
                {
                },
            },
        },
        {
            name = 'getAnchors',
            description = 'Get the anchor points of the joint.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x-component of the anchor on Body 1.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y-component of the anchor on Body 1.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x-component of the anchor on Body 2.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y-component of the anchor on Body 2.',
                        },
                    },
                },
            },
        },
        {
            name = 'getBodies',
            description = 'Gets the bodies that the Joint is attached to.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Body',
                            name = 'bodyA',
                            description = 'The first Body.',
                        },
                        {
                            type = 'Body',
                            name = 'bodyB',
                            description = 'The second Body.',
                        },
                    },
                },
            },
        },
        {
            name = 'getCollideConnected',
            description = 'Gets whether the connected Bodies collide.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'c',
                            description = 'True if they collide, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'getReactionForce',
            description = 'Returns the reaction force in newtons on the second body',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'How long the force applies. Usually the inverse time step or 1/dt.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the force.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the force.',
                        },
                    },
                },
            },
        },
        {
            name = 'getReactionTorque',
            description = 'Returns the reaction torque on the second body.',
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
                            description = 'The reaction torque on the second body.',
                        },
                    },
                },
            },
        },
        {
            name = 'getType',
            description = 'Gets a string representing the type.',
            variants = {
                {
                    returns = {
                        {
                            type = 'JointType',
                            name = 'type',
                            description = 'A string with the name of the Joint type.',
                        },
                    },
                },
            },
        },
        {
            name = 'getUserData',
            description = 'Returns the Lua value associated with this Joint.',
            variants = {
                {
                    returns = {
                        {
                            type = 'any',
                            name = 'value',
                            description = 'The Lua value associated with the Joint.',
                        },
                    },
                },
            },
        },
        {
            name = 'isDestroyed',
            description = 'Gets whether the Joint is destroyed. Destroyed joints cannot be used.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'destroyed',
                            description = 'Whether the Joint is destroyed.',
                        },
                    },
                },
            },
        },
        {
            name = 'setUserData',
            description = 'Associates a Lua value with the Joint.\n\nTo delete the reference, explicitly pass nil.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'any',
                            name = 'value',
                            description = 'The Lua value to associate with the Joint.',
                        },
                    },
                },
            },
        },
    },
}