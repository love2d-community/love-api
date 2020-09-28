local path = (...):match('(.-)[^%./]+$')

return {
    name = 'World',
    description = 'A world is an object that contains all bodies and joints.',
    constructors = {
        'newWorld',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'destroy',
            description = 'Destroys the world, taking all bodies, joints, fixtures and their shapes with it. \n\nAn error will occur if you attempt to use any of the destroyed objects after calling this function.',
            variants = {
                {
                },
            },
        },
        {
            name = 'getBodies',
            description = 'Returns a table with all bodies.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'bodies',
                            description = 'A sequence with all bodies.',
                        },
                    },
                },
            },
        },
        {
            name = 'getBodyCount',
            description = 'Returns the number of bodies in the world.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'n',
                            description = 'The number of bodies in the world.',
                        },
                    },
                },
            },
        },
        {
            name = 'getCallbacks',
            description = 'Returns functions for the callbacks during the world update.',
            variants = {
                {
                    returns = {
                        {
                            type = 'function',
                            name = 'beginContact',
                            description = 'Gets called when two fixtures begin to overlap.',
                        },
                        {
                            type = 'function',
                            name = 'endContact',
                            description = 'Gets called when two fixtures cease to overlap.',
                        },
                        {
                            type = 'function',
                            name = 'preSolve',
                            description = 'Gets called before a collision gets resolved.',
                        },
                        {
                            type = 'function',
                            name = 'postSolve',
                            description = 'Gets called after the collision has been resolved.',
                        },
                    },
                },
            },
        },
        {
            name = 'getContactCount',
            description = 'Returns the number of contacts in the world.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'n',
                            description = 'The number of contacts in the world.',
                        },
                    },
                },
            },
        },
        {
            name = 'getContactFilter',
            description = 'Returns the function for collision filtering.',
            variants = {
                {
                    returns = {
                        {
                            type = 'function',
                            name = 'contactFilter',
                            description = 'The function that handles the contact filtering.',
                        },
                    },
                },
            },
        },
        {
            name = 'getContacts',
            description = 'Returns a table with all Contacts.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'contacts',
                            description = 'A sequence with all Contacts.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGravity',
            description = 'Get the gravity of the world.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x component of gravity.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y component of gravity.',
                        },
                    },
                },
            },
        },
        {
            name = 'getJointCount',
            description = 'Returns the number of joints in the world.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'n',
                            description = 'The number of joints in the world.',
                        },
                    },
                },
            },
        },
        {
            name = 'getJoints',
            description = 'Returns a table with all joints.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'joints',
                            description = 'A sequence with all joints.',
                        },
                    },
                },
            },
        },
        {
            name = 'isDestroyed',
            description = 'Gets whether the World is destroyed. Destroyed worlds cannot be used.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'destroyed',
                            description = 'Whether the World is destroyed.',
                        },
                    },
                },
            },
        },
        {
            name = 'isLocked',
            description = 'Returns if the world is updating its state.\n\nThis will return true inside the callbacks from World:setCallbacks.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'locked',
                            description = 'Will be true if the world is in the process of updating its state.',
                        },
                    },
                },
            },
        },
        {
            name = 'isSleepingAllowed',
            description = 'Gets the sleep behaviour of the world.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'allow',
                            description = 'True if bodies in the world are allowed to sleep, or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'queryBoundingBox',
            description = 'Calls a function for each fixture inside the specified area by searching for any overlapping bounding box (Fixture:getBoundingBox).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'topLeftX',
                            description = 'The x position of the top-left point.',
                        },
                        {
                            type = 'number',
                            name = 'topLeftY',
                            description = 'The y position of the top-left point.',
                        },
                        {
                            type = 'number',
                            name = 'bottomRightX',
                            description = 'The x position of the bottom-right point.',
                        },
                        {
                            type = 'number',
                            name = 'bottomRightY',
                            description = 'The y position of the bottom-right point.',
                        },
                        {
                            type = 'function',
                            name = 'callback',
                            description = 'This function gets passed one argument, the fixture, and should return a boolean. The search will continue if it is true or stop if it is false.',
                        },
                    },
                },
            },
        },
        {
            name = 'rayCast',
            description = 'Casts a ray and calls a function for each fixtures it intersects. ',
            variants = {
                {
                    description = 'There is a bug in LÖVE 0.8.0 where the normal vector passed to the callback function gets scaled by love.physics.getMeter.',
                    arguments = {
                        {
                            type = 'Fixture',
                            name = 'fixture',
                            description = 'The fixture intersecting the ray.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the intersection point.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the intersection point.',
                        },
                        {
                            type = 'number',
                            name = 'xn',
                            description = 'The x value of the surface normal vector of the shape edge.',
                        },
                        {
                            type = 'number',
                            name = 'yn',
                            description = 'The y value of the surface normal vector of the shape edge.',
                        },
                        {
                            type = 'number',
                            name = 'fraction',
                            description = 'The position of the intersection on the ray as a number from 0 to 1 (or even higher if the ray length was changed with the return value).',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'control',
                            description = 'The ray can be controlled with the return value. A positive value sets a new ray length where 1 is the default value. A value of 0 terminates the ray. If the callback function returns -1, the intersection gets ignored as if it didn\'t happen.',
                        },
                    },
                },
            },
        },
        {
            name = 'setCallbacks',
            description = 'Sets functions for the collision callbacks during the world update.\n\nFour Lua functions can be given as arguments. The value nil removes a function.\n\nWhen called, each function will be passed three arguments. The first two arguments are the colliding fixtures and the third argument is the Contact between them. The postSolve callback additionally gets the normal and tangent impulse for each contact point. See notes.\n\nIf you are interested to know when exactly each callback is called, consult a Box2d manual',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'beginContact',
                            description = 'Gets called when two fixtures begin to overlap.',
                        },
                        {
                            type = 'function',
                            name = 'endContact',
                            description = 'Gets called when two fixtures cease to overlap. This will also be called outside of a world update, when colliding objects are destroyed.',
                        },
                        {
                            type = 'function',
                            name = 'preSolve',
                            description = 'Gets called before a collision gets resolved.',
                        },
                        {
                            type = 'function',
                            name = 'postSolve',
                            description = 'Gets called after the collision has been resolved.',
                        },
                    },
                },
            },
        },
        {
            name = 'setContactFilter',
            description = 'Sets a function for collision filtering.\n\nIf the group and category filtering doesn\'t generate a collision decision, this function gets called with the two fixtures as arguments. The function should return a boolean value where true means the fixtures will collide and false means they will pass through each other.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'filter',
                            description = 'The function handling the contact filtering.',
                        },
                    },
                },
            },
        },
        {
            name = 'setGravity',
            description = 'Set the gravity of the world.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x component of gravity.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y component of gravity.',
                        },
                    },
                },
            },
        },
        {
            name = 'setSleepingAllowed',
            description = 'Sets the sleep behaviour of the world.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'allow',
                            description = 'True if bodies in the world are allowed to sleep, or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'translateOrigin',
            description = 'Translates the World\'s origin. Useful in large worlds where floating point precision issues become noticeable at far distances from the origin.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x component of the new origin with respect to the old origin.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y component of the new origin with respect to the old origin.',
                        },
                    },
                },
            },
        },
        {
            name = 'update',
            description = 'Update the state of the world.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'dt',
                            description = 'The time (in seconds) to advance the physics simulation.',
                        },
                        {
                            type = 'number',
                            name = 'velocityiterations',
                            description = 'The maximum number of steps used to determine the new velocities when resolving a collision.',
                            default = '8',
                        },
                        {
                            type = 'number',
                            name = 'positioniterations',
                            description = 'The maximum number of steps used to determine the new positions when resolving a collision.',
                            default = '3',
                        },
                    },
                },
            },
        },
    },
}