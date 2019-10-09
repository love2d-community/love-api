local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Contact',
    description = 'Contacts are objects created to manage collisions in worlds.',
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getFixtures',
            description = 'Gets the two Fixtures that hold the shapes that are in contact.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Fixture',
                            name = 'fixtureA',
                            description = 'The first Fixture.',
                        },
                        {
                            type = 'Fixture',
                            name = 'fixtureB',
                            description = 'The second Fixture.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFriction',
            description = 'Get the friction between two shapes that are in contact.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'friction',
                            description = 'The friction of the contact.',
                        },
                    },
                },
            },
        },
        {
            name = 'getNormal',
            description = 'Get the normal vector between two shapes that are in contact.\n\nThis function returns the coordinates of a unit vector that points from the first shape to the second.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'nx',
                            description = 'The x component of the normal vector.',
                        },
                        {
                            type = 'number',
                            name = 'ny',
                            description = 'The y component of the normal vector.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPositions',
            description = 'Returns the contact points of the two colliding fixtures. There can be one or two points.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x coordinate of the first contact point.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y coordinate of the first contact point.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x coordinate of the second contact point.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y coordinate of the second contact point.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRestitution',
            description = 'Get the restitution between two shapes that are in contact.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'restitution',
                            description = 'The restitution between the two shapes.',
                        },
                    },
                },
            },
        },
        {
            name = 'isEnabled',
            description = 'Returns whether the contact is enabled. The collision will be ignored if a contact gets disabled in the preSolve callback.',
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
            name = 'isTouching',
            description = 'Returns whether the two colliding fixtures are touching each other.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'touching',
                            description = 'True if they touch or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'resetFriction',
            description = 'Resets the contact friction to the mixture value of both fixtures.',
            variants = {
                {
                },
            },
        },
        {
            name = 'resetRestitution',
            description = 'Resets the contact restitution to the mixture value of both fixtures.',
            variants = {
                {
                },
            },
        },
        {
            name = 'setEnabled',
            description = 'Enables or disables the contact.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'True to enable or false to disable.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFriction',
            description = 'Sets the contact friction.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'friction',
                            description = 'The contact friction.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRestitution',
            description = 'Sets the contact restitution.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'restitution',
                            description = 'The contact restitution.',
                        },
                    },
                },
            },
        },
    },
}