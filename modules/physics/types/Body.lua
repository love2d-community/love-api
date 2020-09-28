local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Body',
    description = 'Bodies are objects with velocity and position.',
    constructors = {
        'newBody',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'applyAngularImpulse',
            description = 'Applies an angular impulse to a body. This makes a single, instantaneous addition to the body momentum.\n\nA body with with a larger mass will react less. The reaction does \'\'\'not\'\'\' depend on the timestep, and is equivalent to applying a force continuously for 1 second. Impulses are best used to give a single push to a body. For a continuous push to a body it is better to use Body:applyForce.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'impulse',
                            description = 'The impulse in kilogram-square meter per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'applyForce',
            description = 'Apply force to a Body.\n\nA force pushes a body in a direction. A body with with a larger mass will react less. The reaction also depends on how long a force is applied: since the force acts continuously over the entire timestep, a short timestep will only push the body for a short time. Thus forces are best used for many timesteps to give a continuous push to a body (like gravity). For a single push that is independent of timestep, it is better to use Body:applyLinearImpulse.\n\nIf the position to apply the force is not given, it will act on the center of mass of the body. The part of the force not directed towards the center of mass will cause the body to spin (and depends on the rotational inertia).\n\nNote that the force components and position must be given in world coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'fx',
                            description = 'The x component of force to apply to the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'fy',
                            description = 'The y component of force to apply to the center of mass.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'fx',
                            description = 'The x component of force to apply.',
                        },
                        {
                            type = 'number',
                            name = 'fy',
                            description = 'The y component of force to apply.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position to apply the force.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position to apply the force.',
                        },
                    },
                },
            },
        },
        {
            name = 'applyLinearImpulse',
            description = 'Applies an impulse to a body.\n\nThis makes a single, instantaneous addition to the body momentum.\n\nAn impulse pushes a body in a direction. A body with with a larger mass will react less. The reaction does \'\'\'not\'\'\' depend on the timestep, and is equivalent to applying a force continuously for 1 second. Impulses are best used to give a single push to a body. For a continuous push to a body it is better to use Body:applyForce.\n\nIf the position to apply the impulse is not given, it will act on the center of mass of the body. The part of the impulse not directed towards the center of mass will cause the body to spin (and depends on the rotational inertia). \n\nNote that the impulse components and position must be given in world coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ix',
                            description = 'The x component of the impulse applied to the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'iy',
                            description = 'The y component of the impulse applied to the center of mass.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ix',
                            description = 'The x component of the impulse.',
                        },
                        {
                            type = 'number',
                            name = 'iy',
                            description = 'The y component of the impulse.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position to apply the impulse.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position to apply the impulse.',
                        },
                    },
                },
            },
        },
        {
            name = 'applyTorque',
            description = 'Apply torque to a body.\n\nTorque is like a force that will change the angular velocity (spin) of a body. The effect will depend on the rotational inertia a body has.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'torque',
                            description = 'The torque to apply.',
                        },
                    },
                },
            },
        },
        {
            name = 'destroy',
            description = 'Explicitly destroys the Body and all fixtures and joints attached to it.\n\nAn error will occur if you attempt to use the object after calling this function. In 0.7.2, when you don\'t have time to wait for garbage collection, this function may be used to free the object immediately.',
            variants = {
                {
                },
            },
        },
        {
            name = 'getAngle',
            description = 'Get the angle of the body.\n\nThe angle is measured in radians. If you need to transform it to degrees, use math.deg.\n\nA value of 0 radians will mean \'looking to the right\'. Although radians increase counter-clockwise, the y axis points down so it becomes \'\'clockwise\'\' from our point of view.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The angle in radians.',
                        },
                    },
                },
            },
        },
        {
            name = 'getAngularDamping',
            description = 'Gets the Angular damping of the Body\n\nThe angular damping is the \'\'rate of decrease of the angular velocity over time\'\': A spinning body with no damping and no external forces will continue spinning indefinitely. A spinning body with damping will gradually stop spinning.\n\nDamping is not the same as friction - they can be modelled together. However, only damping is provided by Box2D (and LOVE).\n\nDamping parameters should be between 0 and infinity, with 0 meaning no damping, and infinity meaning full damping. Normally you will use a damping value between 0 and 0.1.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'damping',
                            description = 'The value of the angular damping.',
                        },
                    },
                },
            },
        },
        {
            name = 'getAngularVelocity',
            description = 'Get the angular velocity of the Body.\n\nThe angular velocity is the \'\'rate of change of angle over time\'\'.\n\nIt is changed in World:update by applying torques, off centre forces/impulses, and angular damping. It can be set directly with Body:setAngularVelocity.\n\nIf you need the \'\'rate of change of position over time\'\', use Body:getLinearVelocity.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'w',
                            description = 'The angular velocity in radians/second.',
                        },
                    },
                },
            },
        },
        {
            name = 'getContacts',
            description = 'Gets a list of all Contacts attached to the Body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'contacts',
                            description = 'A list with all contacts associated with the Body.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFixtures',
            description = 'Returns a table with all fixtures.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'fixtures',
                            description = 'A sequence with all fixtures.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGravityScale',
            description = 'Returns the gravity scale factor.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The gravity scale factor.',
                        },
                    },
                },
            },
        },
        {
            name = 'getInertia',
            description = 'Gets the rotational inertia of the body.\n\nThe rotational inertia is how hard is it to make the body spin.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'inertia',
                            description = 'The rotational inertial of the body.',
                        },
                    },
                },
            },
        },
        {
            name = 'getJoints',
            description = 'Returns a table containing the Joints attached to this Body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'joints',
                            description = 'A sequence with the Joints attached to the Body.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLinearDamping',
            description = 'Gets the linear damping of the Body.\n\nThe linear damping is the \'\'rate of decrease of the linear velocity over time\'\'. A moving body with no damping and no external forces will continue moving indefinitely, as is the case in space. A moving body with damping will gradually stop moving.\n\nDamping is not the same as friction - they can be modelled together.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'damping',
                            description = 'The value of the linear damping.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLinearVelocity',
            description = 'Gets the linear velocity of the Body from its center of mass.\n\nThe linear velocity is the \'\'rate of change of position over time\'\'.\n\nIf you need the \'\'rate of change of angle over time\'\', use Body:getAngularVelocity.\n\nIf you need to get the linear velocity of a point different from the center of mass:\n\n*  Body:getLinearVelocityFromLocalPoint allows you to specify the point in local coordinates.\n\n*  Body:getLinearVelocityFromWorldPoint allows you to specify the point in world coordinates.\n\nSee page 136 of \'Essential Mathematics for Games and Interactive Applications\' for definitions of local and world coordinates.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the velocity vector',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the velocity vector',
                        },
                    },
                },
            },
        },
        {
            name = 'getLinearVelocityFromLocalPoint',
            description = 'Get the linear velocity of a point on the body.\n\nThe linear velocity for a point on the body is the velocity of the body center of mass plus the velocity at that point from the body spinning.\n\nThe point on the body must given in local coordinates. Use Body:getLinearVelocityFromWorldPoint to specify this with world coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position to measure velocity.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position to measure velocity.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'vx',
                            description = 'The x component of velocity at point (x,y).',
                        },
                        {
                            type = 'number',
                            name = 'vy',
                            description = 'The y component of velocity at point (x,y).',
                        },
                    },
                },
            },
        },
        {
            name = 'getLinearVelocityFromWorldPoint',
            description = 'Get the linear velocity of a point on the body.\n\nThe linear velocity for a point on the body is the velocity of the body center of mass plus the velocity at that point from the body spinning.\n\nThe point on the body must given in world coordinates. Use Body:getLinearVelocityFromLocalPoint to specify this with local coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position to measure velocity.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position to measure velocity.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'vx',
                            description = 'The x component of velocity at point (x,y).',
                        },
                        {
                            type = 'number',
                            name = 'vy',
                            description = 'The y component of velocity at point (x,y).',
                        },
                    },
                },
            },
        },
        {
            name = 'getLocalCenter',
            description = 'Get the center of mass position in local coordinates.\n\nUse Body:getWorldCenter to get the center of mass in world coordinates.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x coordinate of the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y coordinate of the center of mass.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLocalPoint',
            description = 'Transform a point from world coordinates to local coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'worldX',
                            description = 'The x position in world coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'worldY',
                            description = 'The y position in world coordinates.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'localX',
                            description = 'The x position in local coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'localY',
                            description = 'The y position in local coordinates.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLocalVector',
            description = 'Transform a vector from world coordinates to local coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'worldX',
                            description = 'The vector x component in world coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'worldY',
                            description = 'The vector y component in world coordinates.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'localX',
                            description = 'The vector x component in local coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'localY',
                            description = 'The vector y component in local coordinates.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMass',
            description = 'Get the mass of the body.\n\nStatic bodies always have a mass of 0.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'mass',
                            description = 'The mass of the body (in kilograms).',
                        },
                    },
                },
            },
        },
        {
            name = 'getMassData',
            description = 'Returns the mass, its center, and the rotational inertia.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'mass',
                            description = 'The mass of the body.',
                        },
                        {
                            type = 'number',
                            name = 'inertia',
                            description = 'The rotational inertia.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPosition',
            description = 'Get the position of the body.\n\nNote that this may not be the center of mass of the body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position.',
                        },
                    },
                },
            },
        },
        {
            name = 'getTransform',
            description = 'Get the position and angle of the body.\n\nNote that the position may not be the center of mass of the body. An angle of 0 radians will mean \'looking to the right\'. Although radians increase counter-clockwise, the y axis points down so it becomes clockwise from our point of view.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x component of the position.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y component of the position.',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The angle in radians.',
                        },
                    },
                },
            },
        },
        {
            name = 'getType',
            description = 'Returns the type of the body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'BodyType',
                            name = 'type',
                            description = 'The body type.',
                        },
                    },
                },
            },
        },
        {
            name = 'getUserData',
            description = 'Returns the Lua value associated with this Body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'any',
                            name = 'value',
                            description = 'The Lua value associated with the Body.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWorld',
            description = 'Gets the World the body lives in.',
            variants = {
                {
                    returns = {
                        {
                            type = 'World',
                            name = 'world',
                            description = 'The world the body lives in.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWorldCenter',
            description = 'Get the center of mass position in world coordinates.\n\nUse Body:getLocalCenter to get the center of mass in local coordinates.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x coordinate of the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y coordinate of the center of mass.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWorldPoint',
            description = 'Transform a point from local coordinates to world coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'localX',
                            description = 'The x position in local coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'localY',
                            description = 'The y position in local coordinates.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'worldX',
                            description = 'The x position in world coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'worldY',
                            description = 'The y position in world coordinates.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWorldPoints',
            description = 'Transforms multiple points from local coordinates to world coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x position of the first point.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the first point.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x position of the second point.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y position of the second point.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The transformed x position of the first point.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The transformed y position of the first point.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The transformed x position of the second point.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The transformed y position of the second point.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWorldVector',
            description = 'Transform a vector from local coordinates to world coordinates.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'localX',
                            description = 'The vector x component in local coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'localY',
                            description = 'The vector y component in local coordinates.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'worldX',
                            description = 'The vector x component in world coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'worldY',
                            description = 'The vector y component in world coordinates.',
                        },
                    },
                },
            },
        },
        {
            name = 'getX',
            description = 'Get the x position of the body in world coordinates.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position in world coordinates.',
                        },
                    },
                },
            },
        },
        {
            name = 'getY',
            description = 'Get the y position of the body in world coordinates.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position in world coordinates.',
                        },
                    },
                },
            },
        },
        {
            name = 'isActive',
            description = 'Returns whether the body is actively used in the simulation.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'status',
                            description = 'True if the body is active or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'isAwake',
            description = 'Returns the sleep status of the body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'status',
                            description = 'True if the body is awake or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'isBullet',
            description = 'Get the bullet status of a body.\n\nThere are two methods to check for body collisions:\n\n*  at their location when the world is updated (default)\n\n*  using continuous collision detection (CCD)\n\nThe default method is efficient, but a body moving very quickly may sometimes jump over another body without producing a collision. A body that is set as a bullet will use CCD. This is less efficient, but is guaranteed not to jump when moving quickly.\n\nNote that static bodies (with zero mass) always use CCD, so your walls will not let a fast moving body pass through even if it is not a bullet.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'status',
                            description = 'The bullet status of the body.',
                        },
                    },
                },
            },
        },
        {
            name = 'isDestroyed',
            description = 'Gets whether the Body is destroyed. Destroyed bodies cannot be used.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'destroyed',
                            description = 'Whether the Body is destroyed.',
                        },
                    },
                },
            },
        },
        {
            name = 'isFixedRotation',
            description = 'Returns whether the body rotation is locked.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'fixed',
                            description = 'True if the body\'s rotation is locked or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'isSleepingAllowed',
            description = 'Returns the sleeping behaviour of the body.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'allowed',
                            description = 'True if the body is allowed to sleep or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'isTouching',
            description = 'Gets whether the Body is touching the given other Body.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'otherbody',
                            description = 'The other body to check.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'touching',
                            description = 'True if this body is touching the other body, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'resetMassData',
            description = 'Resets the mass of the body by recalculating it from the mass properties of the fixtures.',
            variants = {
                {
                },
            },
        },
        {
            name = 'setActive',
            description = 'Sets whether the body is active in the world.\n\nAn inactive body does not take part in the simulation. It will not move or cause any collisions.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'active',
                            description = 'If the body is active or not.',
                        },
                    },
                },
            },
        },
        {
            name = 'setAngle',
            description = 'Set the angle of the body.\n\nThe angle is measured in radians. If you need to transform it from degrees, use math.rad.\n\nA value of 0 radians will mean \'looking to the right\'. Although radians increase counter-clockwise, the y axis points down so it becomes \'\'clockwise\'\' from our point of view.\n\nIt is possible to cause a collision with another body by changing its angle. ',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The angle in radians.',
                        },
                    },
                },
            },
        },
        {
            name = 'setAngularDamping',
            description = 'Sets the angular damping of a Body\n\nSee Body:getAngularDamping for a definition of angular damping.\n\nAngular damping can take any value from 0 to infinity. It is recommended to stay between 0 and 0.1, though. Other values will look unrealistic.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'damping',
                            description = 'The new angular damping.',
                        },
                    },
                },
            },
        },
        {
            name = 'setAngularVelocity',
            description = 'Sets the angular velocity of a Body.\n\nThe angular velocity is the \'\'rate of change of angle over time\'\'.\n\nThis function will not accumulate anything; any impulses previously applied since the last call to World:update will be lost. ',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'w',
                            description = 'The new angular velocity, in radians per second',
                        },
                    },
                },
            },
        },
        {
            name = 'setAwake',
            description = 'Wakes the body up or puts it to sleep.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'awake',
                            description = 'The body sleep status.',
                        },
                    },
                },
            },
        },
        {
            name = 'setBullet',
            description = 'Set the bullet status of a body.\n\nThere are two methods to check for body collisions:\n\n*  at their location when the world is updated (default)\n\n*  using continuous collision detection (CCD)\n\nThe default method is efficient, but a body moving very quickly may sometimes jump over another body without producing a collision. A body that is set as a bullet will use CCD. This is less efficient, but is guaranteed not to jump when moving quickly.\n\nNote that static bodies (with zero mass) always use CCD, so your walls will not let a fast moving body pass through even if it is not a bullet.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'status',
                            description = 'The bullet status of the body.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFixedRotation',
            description = 'Set whether a body has fixed rotation.\n\nBodies with fixed rotation don\'t vary the speed at which they rotate. Calling this function causes the mass to be reset. ',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'isFixed',
                            description = 'Whether the body should have fixed rotation.',
                        },
                    },
                },
            },
        },
        {
            name = 'setGravityScale',
            description = 'Sets a new gravity scale factor for the body.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The new gravity scale factor.',
                        },
                    },
                },
            },
        },
        {
            name = 'setInertia',
            description = 'Set the inertia of a body.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'inertia',
                            description = 'The new moment of inertia, in kilograms * pixel squared.',
                        },
                    },
                },
            },
        },
        {
            name = 'setLinearDamping',
            description = 'Sets the linear damping of a Body\n\nSee Body:getLinearDamping for a definition of linear damping.\n\nLinear damping can take any value from 0 to infinity. It is recommended to stay between 0 and 0.1, though. Other values will make the objects look \'floaty\'(if gravity is enabled).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ld',
                            description = 'The new linear damping',
                        },
                    },
                },
            },
        },
        {
            name = 'setLinearVelocity',
            description = 'Sets a new linear velocity for the Body.\n\nThis function will not accumulate anything; any impulses previously applied since the last call to World:update will be lost.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-component of the velocity vector.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-component of the velocity vector.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMass',
            description = 'Sets a new body mass.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'mass',
                            description = 'The mass, in kilograms.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMassData',
            description = 'Overrides the calculated mass data.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the center of mass.',
                        },
                        {
                            type = 'number',
                            name = 'mass',
                            description = 'The mass of the body.',
                        },
                        {
                            type = 'number',
                            name = 'inertia',
                            description = 'The rotational inertia.',
                        },
                    },
                },
            },
        },
        {
            name = 'setPosition',
            description = 'Set the position of the body.\n\nNote that this may not be the center of mass of the body.\n\nThis function cannot wake up the body.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position.',
                        },
                    },
                },
            },
        },
        {
            name = 'setSleepingAllowed',
            description = 'Sets the sleeping behaviour of the body. Should sleeping be allowed, a body at rest will automatically sleep. A sleeping body is not simulated unless it collided with an awake body. Be wary that one can end up with a situation like a floating sleeping body if the floor was removed.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'allowed',
                            description = 'True if the body is allowed to sleep or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'setTransform',
            description = 'Set the position and angle of the body.\n\nNote that the position may not be the center of mass of the body. An angle of 0 radians will mean \'looking to the right\'. Although radians increase counter-clockwise, the y axis points down so it becomes clockwise from our point of view.\n\nThis function cannot wake up the body.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x component of the position.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y component of the position.',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The angle in radians.',
                        },
                    },
                },
            },
        },
        {
            name = 'setType',
            description = 'Sets a new body type.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'BodyType',
                            name = 'type',
                            description = 'The new type.',
                        },
                    },
                },
            },
        },
        {
            name = 'setUserData',
            description = 'Associates a Lua value with the Body.\n\nTo delete the reference, explicitly pass nil.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'any',
                            name = 'value',
                            description = 'The Lua value to associate with the Body.',
                        },
                    },
                },
            },
        },
        {
            name = 'setX',
            description = 'Set the x position of the body.\n\nThis function cannot wake up the body. ',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position.',
                        },
                    },
                },
            },
        },
        {
            name = 'setY',
            description = 'Set the y position of the body.\n\nThis function cannot wake up the body. ',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position.',
                        },
                    },
                },
            },
        },
    },
}