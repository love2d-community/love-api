return {
    name = 'physics',
    description = 'Can simulate 2D rigid body physics in a realistic manner. This module is based on Box2D, and this API corresponds to the Box2D API as closely as possible.',
    types = {
        {
            name = 'Body',
            description = 'Bodies are objects with velocity and position.',
            constructors = {
                'newBody'
            },
            functions = {
                {
                    name = 'applyAngularImpulse',
                    description = 'Applies an angular impulse to a body. This makes a single, instantaneous addition to the body momentum.\n\nA body with with a larger mass will react less. The reaction does not depend on the timestep, and is equivalent to applying a force continuously for 1 second. Impulses are best used to give a single push to a body. For a continuous push to a body it is better to use Body:applyForce.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'impulse',
                                    description = 'The impulse in kilogram-square meter per second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'applyForce',
                    description = 'Apply force to a Body.\n\nA force pushes a body in a direction. A body with with a larger mass will react less. The reaction also depends on how long a force is applied: since the force acts continuously over the entire timestep, a short timestep will only push the body for a short time. Thus forces are best used for many timesteps to give a continuous push to a body (like gravity). For a single push that is independent of timestep, it is better to use Body:applyImpulse.\n\nIf the position to apply the force is not given, it will act on the center of mass of the body. The part of the force not directed towards the center of mass will cause the body to spin (and depends on the rotational inertia).\n\nNote that the force components and position must be given in world coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'fx',
                                    description = 'The x component of force to apply to the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'fy',
                                    description = 'The y component of force to apply to the center of mass.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'fx',
                                    description = 'The x component of force to apply.'
                                },
                                {
                                    type = 'number',
                                    name = 'fy',
                                    description = 'The y component of force to apply.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position to apply the force.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position to apply the force.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'applyLinearImpulse',
                    description = 'Applies an impulse to a body. This makes a single, instantaneous addition to the body momentum.\n\nAn impulse pushes a body in a direction. A body with with a larger mass will react less. The reaction does not depend on the timestep, and is equivalent to applying a force continuously for 1 second. Impulses are best used to give a single push to a body. For a continuous push to a body it is better to use Body:applyForce.\n\nIf the position to apply the impulse is not given, it will act on the center of mass of the body. The part of the impulse not directed towards the center of mass will cause the body to spin (and depends on the rotational inertia).\n\nNote that the impulse components and position must be given in world coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ix',
                                    description = 'The x component of the impulse applied to the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'iy',
                                    description = 'The y component of the impulse applied to the center of mass.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ix',
                                    description = 'The x component of the impulse.'
                                },
                                {
                                    type = 'number',
                                    name = 'iy',
                                    description = 'The y component of the impulse.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position to apply the impulse.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position to apply the impulse.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'applyTorque',
                    description = 'Apply torque to a body.\n\nTorque is like a force that will change the angular velocity (spin) of a body. The effect will depend on the rotational inertia a body has.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'torque',
                                    description = 'The torque to apply.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'destroy',
                    description = 'Explicitly destroys the Body. When you don\'t have time to wait for garbage collection, this function may be used to free the object immediately, but note that an error will occur if you attempt to use the object after calling this function.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'getAngle',
                    description = 'Get the angle of the body.\n\nThe angle is measured in radians. If you need to transform it to degrees, use math.deg.\n\nA value of 0 radians will mean "looking to the right". Although radians increase counter-clockwise, the y-axis points down so it becomes clockwise from our point of view.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'angle',
                                    description = 'The angle in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getAngularDamping',
                    description = 'Gets the Angular damping of the Body\n\nThe angular damping is the rate of decrease of the angular velocity over time: A spinning body with no damping and no external forces will continue spinning indefinitely. A spinning body with damping will gradually stop spinning.\n\nDamping is not the same as friction - they can be modelled together. However, only damping is provided by Box2D (and LÖVE).\n\nDamping parameters should be between 0 and infinity, with 0 meaning no damping, and infinity meaning full damping. Normally you will use a damping value between 0 and 0.1.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'damping',
                                    description = 'The value of the angular damping.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getAngularVelocity',
                    description = 'Get the angular velocity of the Body.\n\nThe angular velocity is the rate of change of angle over time.\n\nIt is changed in World:update by applying torques, off centre forces/impulses, and angular damping. It can be set directly with Body:setAngularVelocity.\n\nIf you need the rate of change of position over time, use Body:getLinearVelocity.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'w',
                                    description = 'The angular velocity in radians/second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFixtureList',
                    description = 'Returns a table with all fixtures.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'table',
                                    name = 'fixtures',
                                    description = 'A sequence with all fixtures.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getGravityScale',
                    description = 'Returns the gravity scale factor.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'scale',
                                    description = 'The gravity scale factor.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getInertia',
                    description = 'Gets the rotational inertia of the body.\n\nThe rotational inertia is how hard is it to make the body spin. It is set with the 4th argument to Body:setMass, or automatically with Body:setMassFromShapes.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'inertia',
                                    description = 'The rotational inertial of the body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLinearDamping',
                    description = 'Gets the linear damping of the Body.\n\nThe linear damping is the rate of decrease of the linear velocity over time. A moving body with no damping and no external forces will continue moving indefinitely, as is the case in space. A moving body with damping will gradually stop moving.\n\nDamping is not the same as friction - they can be modelled together. However, only damping is provided by Box2D (and LÖVE).',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'damping',
                                    description = 'The value of the linear damping.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLinearVelocity',
                    description = 'Gets the linear velocity of the Body from its center of mass.\n\nThe linear velocity is the rate of change of position over time.\n\nIf you need the rate of change of angle over time, use Body:getAngularVelocity. If you need to get the linear velocity of a point different from the center of mass:\n\nBody:getLinearVelocityFromLocalPoint allows you to specify the point in local coordinates.\nBody:getLinearVelocityFromWorldPoint allows you to specify the point in world coordinates.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the velocity vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the velocity vector.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLinearVelocityFromLocalPoint',
                    description = 'Get the linear velocity of a point on the body.\n\nThe linear velocity for a point on the body is the velocity of the body center of mass plus the velocity at that point from the body spinning.\n\nThe point on the body must given in local coordinates. Use Body:getLinearVelocityFromWorldPoint to specify this with world coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position to measure velocity.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position to measure velocity.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'vx',
                                    description = 'The x component of velocity at point (x,y).'
                                },
                                {
                                    type = 'number',
                                    name = 'vy',
                                    description = 'The y component of velocity at point (x,y).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLinearVelocityFromWorldPoint',
                    description = 'Get the linear velocity of a point on the body.\n\nThe linear velocity for a point on the body is the velocity of the body center of mass plus the velocity at that point from the body spinning.\n\nThe point on the body must given in world coordinates. Use Body:getLinearVelocityFromLocalPoint to specify this with local coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position to measure velocity.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position to measure velocity.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'vx',
                                    description = 'The x component of velocity at point (x,y).'
                                },
                                {
                                    type = 'number',
                                    name = 'vy',
                                    description = 'The y component of velocity at point (x,y).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLocalCenter',
                    description = 'Get the center of mass position in local coordinates.\n\nUse Body:getWorldCenter to get the center of mass in world coordinates.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x coordinate of the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y coordinate of the center of mass.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLocalPoint',
                    description = 'Transform a point from world coordinates to local coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'world_x',
                                    description = 'The x position in world coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'world_y',
                                    description = 'The y position in world coordinates.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'local_x',
                                    description = 'The x position in local coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'local_y',
                                    description = 'The y position in local coordinates.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLocalVector',
                    description = 'Transform a vector from world coordinates to local coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'world_x',
                                    description = 'The vector x component in world coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'world_y',
                                    description = 'The vector y component in world coordinates.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'local_x',
                                    description = 'The vector x component in local coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'local_y',
                                    description = 'The vector y component in local coordinates.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMass',
                    description = 'Get the mass of the body.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'mass',
                                    description = 'The mass of the body (in kilograms).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMassData',
                    description = 'Returns the mass, its center, and the rotational inertia.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position of the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position of the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'mass',
                                    description = 'The mass of the body.'
                                },
                                {
                                    type = 'number',
                                    name = 'inertia',
                                    description = 'The rotational inertia.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPosition',
                    description = 'Get the position of the body.\n\nNote that this may not be the center of mass of the body.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getType',
                    description = 'Returns the type of the body.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'BodyType',
                                    name = 'type',
                                    description = 'The body type.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getUserData',
                    description = 'Returns the Lua value associated with this Body.\n\nUse this function in one thread only.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'value',
                                    name = 'value',
                                    description = 'The Lua value associated with the Body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWorldCenter',
                    description = 'Get the center of mass position in world coordinates.\n\nUse Body:getLocalCenter to get the center of mass in local coordinates.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x coordinate of the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y coordinate of the center of mass.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWorldPoint',
                    description = 'Transform a point from local coordinates to world coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'local_x',
                                    description = 'The x position in local coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'local_y',
                                    description = 'The y position in local coordinates.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'world_x',
                                    description = 'The x position in world coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'world_y',
                                    description = 'The y position in world coordinates.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWorldPoints',
                    description = 'Transforms multiple points from local coordinates to world coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x position of the first point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y position of the first point.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x position of the second point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y position of the second point.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'More x and y points.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The transformed x position of the first point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The transformed y position of the first point.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The transformed x position of the second point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The transformed y position of the second point.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'The transformed x and y positions of additional points.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWorldVector',
                    description = 'Transform a vector from local coordinates to world coordinates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'local_x',
                                    description = 'The vector x component in local coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'local_y',
                                    description = 'The vector y component in local coordinates.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'world_x',
                                    description = 'The vector x component in world coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'world_y',
                                    description = 'The vector y component in world coordinates.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getX',
                    description = 'Get the x position of the body in world coordinates.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position in world coordinates.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getY',
                    description = 'Get the y position of the body in world coordinates.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position in world coordinates.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isActive',
                    description = 'Returns whether the body is actively used in the simulation.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'status',
                                    description = 'True if the body is active or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isAwake',
                    description = 'Returns the sleep status of the body.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'status',
                                    description = 'True if the body is awake or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isBullet',
                    description = 'Get the bullet status of a body.\n\nThere are two methods to check for body collisions:\n\nat their location when the world is updated (default)\nusing continuous collision detection (CCD)\n\nThe default method is efficient, but a body moving very quickly may sometimes jump over another body without producing a collision. A body that is set as a bullet will use CCD. This is less efficient, but is guaranteed not to jump when moving quickly.\n\nNote that static bodies (with zero mass) always use CCD, so your walls will not let a fast moving body pass through even if it is not a bullet.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'status',
                                    description = 'The bullet status of the body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isDynamic',
                    description = 'Get the dynamic status of the body.\n\nA static body has no mass and a constant position. It will not react to collisions. Often used for walls.\n\nA dynamic body has mass and can move. It will react to collisions when the world is updated.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'status',
                                    description = 'The dynamic status of the body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isFixedRotation',
                    description = 'Returns whether the body rotation is locked.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'fixed',
                                    description = 'True if the body\'s rotation is locked or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isFrozen',
                    description = 'Get the frozen status of the body.\n\nA body becomes frozen when it goes outside the world boundary. A frozen body is no longer changed by World:update.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'status',
                                    description = 'The frozen status of the body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isSleepingAllowed',
                    description = 'Returns the sleeping behaviour of the body.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'status',
                                    description = 'True if the body is allowed to sleep or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isStatic',
                    description = 'Get the static status of the body.\n\nA static body has no mass and a constant position. It will not react to collisions. Often used for walls.\n\nA dynamic body has mass and can move. It will react to collisions when the world is updated.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'status',
                                    description = 'The static status of the body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'resetMassData',
                    description = 'Resets the mass of the body by recalculating it from the mass properties of the fixtures.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'setActive',
                    description = 'Sets whether the body is active in the world.\n\nAn inactive body does not take part in the simulation. It will not move or cause any collisions.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'active',
                                    description = 'If the body is active or not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setAngle',
                    description = 'Set the angle of the body.\n\nThe angle is measured in radians. If you need to transform it from degrees, use math.rad.\n\nA value of 0 radians will mean "looking to the right". .Although radians increase counter-clockwise, the y-axis points down so it becomes clockwise from our point of view.\n\nIt is possible to cause a collision with another body by changing its angle.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'angle',
                                    description = 'The angle in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setAngularDamping',
                    description = 'Sets the angular damping of a Body.\n\nSee Body:getAngularDamping for a definition of angular damping.\n\nAngular damping can take any value from 0 to infinity. It is recommended to stay between 0 and 0.1, though. Other values will look unrealistic.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'damping',
                                    description = 'The new angular damping.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setAngularVelocity',
                    description = 'Sets the angular velocity of a Body.\n\nThe angular velocity is the rate of change of angle over time.\n\nThis function will not accumulate anything; any impulses previously applied since the last call to World:update will be lost.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'w',
                                    description = 'The new angular velocity, in radians per second'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setAwake',
                    description = 'Wakes the body up or puts it to sleep.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'awake',
                                    description = 'The body sleep status.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setBullet',
                    description = 'Set the bullet status of a body.\n\nThere are two methods to check for body collisions:\n\nat their location when the world is updated (default)\nusing continuous collision detection (CCD)\n\nThe default method is efficient, but a body moving very quickly may sometimes jump over another body without producing a collision. A body that is set as a bullet will use CCD. This is less efficient, but is guaranteed not to jump when moving quickly.\n\nNote that static bodies (with zero mass) always use CCD, so your walls will not let a fast moving body pass through even if it is not a bullet.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'status',
                                    description = 'The bullet status of the body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFixedRotation',
                    description = 'Set whether a body has fixed rotation.\n\nBodies with fixed rotation don\'t vary the speed at which they rotate.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'fixed',
                                    description = 'Whether the body should have fixed rotation.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setGravityScale',
                    description = 'Sets a new gravity scale factor for the body.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'scale',
                                    description = 'The new gravity scale factor.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setInertia',
                    description = 'Set the inertia of a body.\n\nThis value can also be set by the fourth argument of Body:setMass.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'inertia',
                                    description = 'The new moment of inertia, in kilograms per meter squared.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLinearDamping',
                    description = 'Sets the linear damping of a Body\n\nSee Body:getLinearDamping for a definition of linear damping.\n\nLinear damping can take any value from 0 to infinity. It is recommended to stay between 0 and 0.1, though. Other values will make the objects look "floaty".',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ld',
                                    description = 'The new linear damping.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLinearVelocity',
                    description = 'Sets a new linear velocity for the Body.\n\nThis function will not accumulate anything; any impulses previously applied since the last call to World:update will be lost.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the velocity vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the velocity vector.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMass',
                    description = 'Sets the mass in kilograms.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'mass',
                                    description = 'The mass, in kilograms.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMassData',
                    description = 'Overrides the calculated mass data.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the center of mass in local coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the center of mass in local coordinates.'
                                },
                                {
                                    type = 'number',
                                    name = 'mass',
                                    description = 'The mass, in kilograms.'
                                },
                                {
                                    type = 'number',
                                    name = 'inertia',
                                    description = 'The rotational inertia, in kilograms per squared meter.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMassFromShapes',
                    description = 'Sets mass properties from attatched shapes.\n\nIf you feel that finding the correct mass properties is tricky, then this function may be able to help you. After creating the needed shapes on the Body, a call to this function will set the mass properties based on those shapes. Remember to call this function after adding the shapes.\n\nSetting the mass properties this way always results in a realistic (or at least good-looking) simulation, so using it is highly recommended.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'setPosition',
                    description = 'Set the position of the body.\n\nNote that this may not be the center of mass of the body.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSleepingAllowed',
                    description = 'Sets the sleeping behaviour of the body.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'allowed',
                                    description = 'True if the body is allowed to sleep or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setType',
                    description = 'Sets a new body type.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'BodyType',
                                    name = 'type',
                                    description = 'The new type.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setUserData',
                    description = 'Associates a Lua value with the Body.\n\nTo delete the reference, explicitly pass nil.\n\nUse this function in one thread only.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'value',
                                    name = 'value',
                                    description = 'The Lua value to associate with the Body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setX',
                    description = 'Set the x position of the body.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setY',
                    description = 'Set the y position of the body.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'ChainShape',
            description = 'A ChainShape consists of multiple line segments. It can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.\n\nUnlike the PolygonShape, the ChainShape does not have a vertices limit or has to form a convex shape, but self intersections are not supported.',
            constructors = {
                'newChainShape'
            },
            functions = {
                {
                    name = 'getChildEdge',
                    description = 'Returns a child of the shape as an EdgeShape.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'index',
                                    description = 'The index of the child.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'EdgeShape',
                                    description = 'The child as an EdgeShape.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPoint',
                    description = 'Returns a point of the shape.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'index',
                                    description = 'The index of the point to return.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-coordinate of the point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-coordinate of the point.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPoints',
                    description = 'Returns all points of the shape.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x-coordinate of the first point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y-coordinate of the first point.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x-coordinate of the second point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y-coordinate of the second point.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional x and y values.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getVertexCount',
                    description = 'Returns the number of vertices the shape has.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'count',
                                    description = 'The number of vertices.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setNextVertex',
                    description = 'Sets a vertex that establishes a connection to the next shape.\n\nThis can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the vertex.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the vertex.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setPreviousVertex',
                    description = 'Sets a vertex that establishes a connection to the previous shape.\n\nThis can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the vertex.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the vertex.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Shape',
                'Object'
            }
        },
        {
            name = 'CircleShape',
            description = 'Circle extends Shape and adds a radius and a local position.',
            constructors = {
                'newCircleShape'
            },
            functions = {
                {
                    name = 'getPoint',
                    description = 'Gets the center point of the circle shape.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-component of the center point of the circle.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-component of the center point of the circle.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRadius',
                    description = 'Gets the radius of the circle shape.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'radius',
                                    description = 'The radius of the circle.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setPoint',
                    description = 'Sets the location of the center of the circle shape.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-component of the new center point of the circle.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-component of the new center point of the circle.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRadius',
                    description = 'Sets the radius of the circle.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'radius',
                                    description = 'The radius of the circle.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Shape',
                'Object'
            }
        },
        {
            name = 'Contact',
            description = 'Contacts are objects created to manage collisions in worlds.',
            functions = {
                {
                    name = 'getFriction',
                    description = 'Get the friction between two shapes that are in contact.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'friction',
                                    description = 'The friction of the contact.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getNormal',
                    description = 'Get the normal vector between two shapes that are in contact.\n\nThis function returns the coordinates of a unit vector that points from the first shape to the second.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'nx',
                                    description = 'The x component of the normal vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'ny',
                                    description = 'The y component of the normal vector.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPositions',
                    description = 'Returns the contact points of the two colliding fixtures. There can be one or two points.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x coordinate of the first contact point. '
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y coordinate of the first contact point.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x coordinate of the second contact point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y coordinate of the second contact point.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRestitution',
                    description = 'Get the restitution between two shapes that are in contact.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'restitution',
                                    description = 'The restitution between the two shapes.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isEnabled',
                    description = 'Returns whether the contact is enabled. The collision will be ignored if a contact gets disabled in the post solve callback.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'True if enabled, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isTouching',
                    description = 'Returns whether the two colliding fixtures are touching each other.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'touching',
                                    description = 'True if they touch or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'resetFriction',
                    description = 'Resets the contact friction to the mixture value of both fixtures.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'resetRestitution',
                    description = 'Resets the contact restitution to the mixture value of both fixtures.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'setEnabled',
                    description = 'Enables or disables the contact.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'True to enable or false to disable.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFriction',
                    description = 'Sets the contact friction.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'friction',
                                    description = 'The contact friction.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRestitution',
                    description = 'Sets the contact restitution.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'restitution',
                                    description = 'The contact restitution.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'EdgeShape',
            description = 'A EdgeShape is a line segment. They can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.',
            constructors = {
                'newEdgeShape'
            },
            functions = {
                {
                    name = 'getPoints',
                    description = 'Returns the local coordinates of the edge points.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x component of the first vertex.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y component of the first vertex.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x component of the second vertex.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y component of the second vertex.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Shape',
                'Object'
            }
        },
        {
            name = 'DistanceJoint',
            description = 'Keeps two bodies at the same distance.',
            constructors = {
                'newDistanceJoint'
            },
            functions = {
                {
                    name = 'getDampingRatio',
                    description = 'Gets the damping ratio.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The damping ratio.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFrequency',
                    description = 'Gets the response speed.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'Hz',
                                    description = 'The response speed.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLength',
                    description = 'Gets the equilibrium distance between the two Bodies.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'l',
                                    description = 'The length between the two Bodies.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDampingRatio',
                    description = 'Sets the damping ratio.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The damping ratio.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFrequency',
                    description = 'Sets the response speed.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'Hz',
                                    description = 'The response speed.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLength',
                    description = 'Sets the equilibrium distance between the two Bodies.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'l',
                                    description = 'The length between the two Bodies.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'Fixture',
            description = 'Fixtures attach shapes to bodies.',
            constructors = {
                'newFixture'
            },
            functions = {
                {
                    name = 'destroy',
                    description = 'Destroys the fixture',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'getBody',
                    description = 'Returns the body to which the fixture is attached.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Body',
                                    name = 'body',
                                    description = 'The parent body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBoundingBox',
                    description = 'Returns the points of the fixture bounding box. In case the fixture has multiple childern a 1-based index can be specified.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'index',
                                    default = '1',
                                    description = 'The fixture child to get the bounding box of.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'topLeftX',
                                    description = 'The x position of the top-left point.'
                                },
                                {
                                    type = 'number',
                                    name = 'topLeftY',
                                    description = 'The y position of the top-left point.'
                                },
                                {
                                    type = 'number',
                                    name = 'bottomRightX',
                                    description = 'The x position of the bottom-right point.'
                                },
                                {
                                    type = 'number',
                                    name = 'bottomRightY',
                                    description = 'The y position of the bottom-right point.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getCategory',
                    description = 'Returns the categories the fixture belongs to.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'category1',
                                    description = 'The first category.'
                                },
                                {
                                    type = 'number',
                                    name = 'category2',
                                    description = 'The second category.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional categories.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDensity',
                    description = 'Returns the density of the fixture.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'density',
                                    description = 'The fixture density in kilograms per square meter.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFilterData',
                    description = 'Returns the filter data of the fixture. Categories and masks are encoded as the bits of a 16-bit integer.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'categories',
                                    description = 'The categories as an integer from 0 to 65535.'
                                },
                                {
                                    type = 'number',
                                    name = 'mask',
                                    description = 'The mask as an integer from 0 to 65535.'
                                },
                                {
                                    type = 'number',
                                    name = 'group',
                                    description = 'The group as an integer from -32768 to 32767.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFriction',
                    description = 'Returns the friction of the fixture.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'friction',
                                    description = 'The fixture friction.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getGroupIndex',
                    description = 'Returns the group the fixture belongs to. Fixtures with the same group will always collide if the group is positive or never collide if it\'s negative. The group zero means no group.\n\nThe groups range from -32768 to 32767.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'group',
                                    description = 'The group of the fixture.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMask',
                    description = 'Returns the category mask of the fixture.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'mask1',
                                    description = 'The first category selected by the mask.'
                                },
                                {
                                    type = 'number',
                                    name = 'mask2',
                                    description = 'The second category selected by the mask.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional categories selected by the mask.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMassData',
                    description = 'Returns the mass, its center and the rotational inertia.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position of the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position of the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'mass',
                                    description = 'The mass of the fixture.'
                                },
                                {
                                    type = 'number',
                                    name = 'inertia',
                                    description = 'The rotational inertia.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRestitution',
                    description = 'Returns the restitution of the fixture.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'restitution',
                                    description = 'The fixture restitution.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getShape',
                    description = 'Returns the shape of the fixture. This shape is a reference to the actual data used in the simulation. It\'s possible to change its values between timesteps.\n\nDo not call any functions on this shape after the parent fixture has been destroyed. This shape will point to an invalid memory address and likely cause crashes if you interact further with it.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Shape',
                                    name = 'shape',
                                    description = 'The fixture\'s shape.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getUserData',
                    description = 'Returns the Lua value associated with this fixture.\n\nUse this function in one thread only.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'mixed',
                                    name = 'value',
                                    description = 'The Lua value associated with the fixture.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isSensor',
                    description = 'Returns whether the fixture is a sensor.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'sensor',
                                    description = 'If the fixture is a sensor.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'rayCast',
                    description = 'Casts a ray against the shape of the fixture and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned.\n\nThe ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.\n\nThe childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.\n\nThe world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.\n\nhitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x position of the ray starting point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y position of the ray starting point.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x position of the ray end point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y position of the ray end point.'
                                },
                                {
                                    type = 'number',
                                    name = 'maxFraction',
                                    description = 'The maximum distance the ray is going to travel as a number from 0 to 1.'
                                },
                                {
                                    type = 'number',
                                    name = 'childIndex',
                                    default = '1',
                                    description = 'The index of the child the ray gets cast against.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position where the ray intersects with the shape.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position where the ray intersects with the shape.'
                                },
                                {
                                    type = 'number',
                                    name = 'fraction',
                                    description = 'The position on the input vector where the intersection happened as a number from 0 to 1.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setCategory',
                    description = 'Sets the categories the fixture belongs to. There can be up to 16 categories represented as a number from 1 to 16.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'category1',
                                    description = 'The first category.'
                                },
                                {
                                    type = 'number',
                                    name = 'category2',
                                    description = 'The second category.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional categories.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDensity',
                    description = 'Sets the density of the fixture. Call Body:resetMassData if this needs to take effect immediately.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'density',
                                    description = 'The fixture density in kilograms per square meter.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFilterData',
                    description = 'Sets the filter data of the fixture.\n\nGroups, categories, and mask can be used to define the collision behaviour of the fixture.\n\nIf two fixtures are in the same group they either always collide if the group is positive, or never collide if it\'s negative. Is the group zero or they do not match, then the contact filter checks if the fixtures select a category of the other fixture with their masks. The fixtures do not collide if that\'s not the case. If they do have each others categories selected, the return value of the custom contact filter will be used. They always collide if none was set.\n\nThere can be up to 16 categories. Categories and masks are encoded as the bits of a 16-bit integer.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'categories',
                                    description = 'The categories as an integer from 0 to 65535.'
                                },
                                {
                                    type = 'number',
                                    name = 'mask',
                                    description = 'The mask as an integer from 0 to 65535.'
                                },
                                {
                                    type = 'number',
                                    name = 'group',
                                    description = 'The group as an integer from -32768 to 32767.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFriction',
                    description = 'Sets the friction of the fixture.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'friction',
                                    description = 'The fixture friction.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setGroupIndex',
                    description = 'Sets the group the fixture belongs to. Fixtures with the same group will always collide if the group is positive or never collide if it\'s negative. The group zero means no group.\n\nThe groups range from -32768 to 32767.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'group',
                                    description = 'The group as an integer from -32768 to 32767.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMask',
                    description = 'Sets the category mask of the fixture. There can be up to 16 categories represented as a number from 1 to 16.\n\nThis fixture will collide with the fixtures that are in the selected categories if the other fixture also has a category of this fixture selected.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'mask1',
                                    description = 'The first category.'
                                },
                                {
                                    type = 'number',
                                    name = 'mask2',
                                    description = 'The second category.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional categories.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRestitution',
                    description = 'Sets the restitution of the fixture.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'restitution',
                                    description = 'The fixture restitution.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSensor',
                    description = 'Sets whether the fixture should act as a sensor.\n\nSensor do not produce collisions responses, but the begin and end callbacks will still be called for this fixture.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'sensor',
                                    description = 'The sensor status.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setUserData',
                    description = 'Associates a Lua value with the fixture.\n\nUse this function in one thread only.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'mixed',
                                    name = 'value',
                                    description = 'The Lua value associated with the fixture.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'testPoint',
                    description = 'Checks if a point is inside the shape of the fixture.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x position of the point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y position of the point.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'isInside',
                                    description = 'True if the point is inside or false if it is outside.',
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'FrictionJoint',
            description = 'A FrictionJoint applies friction to a body.',
            constructors = {
                'newFrictionJoint'
            },
            functions = {
                {
                    name = 'getMaxForce',
                    description = 'Gets the maximum friction force in Newtons.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'force',
                                    description = 'Maximum force in Newtons.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMaxTorque',
                    description = 'Gets the maximum friction torque in Newton-meters.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'torque',
                                    description = 'Maximum torque in Newton-meters.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMaxForce',
                    description = 'Sets the maximum friction force in Newtons.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'maxForce',
                                    description = 'Max force in Newtons.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMaxTorque',
                    description = 'Sets the maximum friction torque in Newton-meters.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'torque',
                                    description = 'Maximum torque in Newton-meters.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'GearJoint',
            description = 'Keeps bodies together in such a way that they act like gears.',
            constructors = {
                'newGearJoint'
            },
            functions = {
                {
                    name = 'getRatio',
                    description = 'Get the ratio of a gear joint.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The ratio of the joint.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRatio',
                    description = 'Set the ratio of a gear joint.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The new ratio of the joint.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'Joint',
            description = 'Attach multiple bodies together to interact in unique ways.',
            functions = {
                {
                    name = 'destroy',
                    description = 'Explicitly destroys the Joint. When you don\'t have time to wait for garbage collection, this function may be used to free the object immediately, but note that an error will occur if you attempt to use the object after calling this function.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'getAnchors',
                    description = 'Get the anchor points of the joint.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x component of the anchor on Body 1.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y component of the anchor on Body 1.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x component of the anchor on Body 2.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y component of the anchor on Body 2.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBodies',
                    description = 'Gets the bodies that the Joint is attached to.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Body',
                                    name = 'bodyA',
                                    description = 'The first Body.'
                                },
                                {
                                    type = 'Body',
                                    name = 'bodyB',
                                    description = 'The second Body.'
                                },
                            }
                        }
                    }
                },
                {
                    name = 'getCollideConnected',
                    description = 'Gets whether the connected Bodies collide.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'c',
                                    description = 'True if they collide, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getReactionForce',
                    description = 'Gets the reaction force on Body 2 at the joint anchor.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the force.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the force.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getReactionTorque',
                    description = 'Returns the reaction torque on the second body.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'invdt',
                                    description = 'How long the force applies. Usually the inverse time step or 1/dt.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'torque',
                                    description = 'The reaction torque on the second body.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getType',
                    description = 'Gets an string representing the type.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'JointType',
                                    name = 'type',
                                    description = 'A string with the name of the Joint type.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getUserData',
                    description = 'Returns the Lua value associated with this Joint.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'mixed',
                                    name = 'value',
                                    description = 'The Lua value associated with the Joint.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setCollideConnected',
                    description = 'Sets whether the connected Bodies should collide with eachother.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'collide',
                                    description = 'True for the Bodies to collide, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setUserData',
                    description = 'Associates a Lua value with the Joint.\n\nTo delete the reference, explicitly pass nil.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'mixed',
                                    name = 'value',
                                    description = 'The Lua value to associate with the Joint.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'MouseJoint',
            description = 'For controlling objects with the mouse.',
            constructors = {
                'newMouseJoint'
            },
            functions = {
                {
                    name = 'getDampingRatio',
                    description = 'Returns the damping ratio.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The new damping ratio.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFrequency',
                    description = 'Returns the frequency.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'freq',
                                    description = 'The frequency in hertz.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMaxForce',
                    description = 'Gets the highest allowed force.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'f',
                                    description = 'The max allowed force.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getTarget',
                    description = 'Gets the target point.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the target.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The x component of the target.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDampingRatio',
                    description = 'Sets a new damping ratio.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The new damping ratio.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFrequency',
                    description = 'Sets a new frequency.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'freq',
                                    description = 'The new frequency in hertz.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMaxForce',
                    description = 'Sets the highest allowed force.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'f',
                                    description = 'The max allowed force.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setTarget',
                    description = 'Sets the target point.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the target.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the target.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'PolygonShape',
            description = 'Polygon is a convex polygon with up to 8 sides.',
            constructors = {
                'newPolygonShape',
                'newRectangleShape'
            },
            functions = {
                {
                    name = 'getPoints',
                    description = 'Get the local coordinates of the polygon\'s vertices.\n\nThis function has a variable number of return values. It can be used in a nested fashion with love.graphics.polygon.\n\nThis function may have up to 16 return values, since it returns two values for each vertex in the polygon. In other words, it can return the coordinates of up to 8 points.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x component of the first vertex.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y component of the first vertex.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x component of the second vertex.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y component of the second vertex.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional x and y values.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Shape',
                'Object'
            }
        },
        {
            name = 'PrismaticJoint',
            description = 'Restricts relative motion between Bodies to one shared axis.',
            constructors = {
                'newPrismaticJoint'
            },
            functions = {
                {
                    name = 'setLimitsEnabled',
                    description = 'Enables or disables the limits of the joint.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enable',
                                    description = 'True to enable, false to disable.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMotorEnabled',
                    description = 'Starts or stops the joint motor.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enable',
                                    description = 'True to enable, false to disable.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getJointSpeed',
                    description = 'Get the current joint angle speed.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 's',
                                    description = 'Joint angle speed in meters/second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getJointTranslation',
                    description = 'Get the current joint translation.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 't',
                                    description = 'Joint translation, usually in meters.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLimits',
                    description = 'Gets the joint limits.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'lower',
                                    description = 'The lower limit, usually in meters.'
                                },
                                {
                                    type = 'number',
                                    name = 'upper',
                                    description = 'The upper limit, usually in meters.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLowerLimit',
                    description = 'Gets the lower limit.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'lower',
                                    description = 'The lower limit, usually in meters.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMaxMotorForce',
                    description = 'Gets the maximum motor force.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'f',
                                    description = 'The maximum motor force, usually in N.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMotorForce',
                    description = 'Get the current motor force.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'f',
                                    description = 'The current motor force, usually in N.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMotorSpeed',
                    description = 'Gets the motor speed.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 's',
                                    description = 'The motor speed, usually in meters per second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getUpperLimit',
                    description = 'Gets the upper limit.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'upper',
                                    description = 'The upper limit, usually in meters.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'hasLimitsEnabled',
                    description = 'Checks whether the limits are enabled.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'True if enabled, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isMotorEnabled',
                    description = 'Checks whether the motor is enabled.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'True if enabled, false if disabled.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLimits',
                    description = 'Sets the limits.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'lower',
                                    description = 'The lower limit, usually in meters.'
                                },
                                {
                                    type = 'number',
                                    name = 'upper',
                                    description = 'The upper limit, usually in meters.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLowerLimit',
                    description = 'Sets the lower limit.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'lower',
                                    description = 'The lower limit, usually in meters.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMaxMotorForce',
                    description = 'Set the maximum motor force.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'f',
                                    description = 'The maximum motor force, usually in N.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMotorSpeed',
                    description = 'Sets the motor speed.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 's',
                                    description = 'The motor speed, usually in meters per second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setUpperLimit',
                    description = 'Sets the upper limit.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'upper',
                                    description = 'The upper limit, usually in meters.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'PulleyJoint',
            description = 'Allows you to simulate bodies connected through pulleys.',
            constructors = {
                'newPulleyJoint'
            },
            functions = {
                {
                    name = 'getConstant',
                    description = 'Get the total length of the rope.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'length',
                                    description = 'The length of the rope in the joint.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getGroundAnchors',
                    description = 'Get the ground anchor positions in world coordinates.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'a1x',
                                    description = 'The x coordinate of the first anchor.'
                                },
                                {
                                    type = 'number',
                                    name = 'a1y',
                                    description = 'The y coordinate of the first anchor.'
                                },
                                {
                                    type = 'number',
                                    name = 'a2x',
                                    description = 'The x coordinate of the second anchor.'
                                },
                                {
                                    type = 'number',
                                    name = 'a2y',
                                    description = 'The y coordinate of the second anchor.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLengthA',
                    description = 'Get the current length of the rope segment attached to the first body.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'length',
                                    description = 'The length of the rope segment.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLengthB',
                    description = 'Get the current length of the rope segment attached to the second body.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'length',
                                    description = 'The length of the rope segment.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMaxLengths',
                    description = 'Get the maximum lengths of the rope segments.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'len1',
                                    description = 'The maximum length of the first rope segment.'
                                },
                                {
                                    type = 'number',
                                    name = 'len2',
                                    description = 'The maximum length of the second rope segment.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRatio',
                    description = 'Get the pulley ratio.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The pulley ratio of the joint.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setConstant',
                    description = 'Set the total length of the rope.\n\nSetting a new length for the rope updates the maximum length values of the joint.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'length',
                                    description = 'The new length of the rope in the joint.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMaxLengths',
                    description = 'Set the maximum lengths of the rope segments.\n\nThe physics module also imposes maximum values for the rope segments. If the parameters exceed these values, the maximum values are set instead of the requested values.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'max1',
                                    description = 'The new maximum length of the first segment.'
                                },
                                {
                                    type = 'number',
                                    name = 'max2',
                                    description = 'The new maximum length of the second segment.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRatio',
                    description = 'Set the pulley ratio.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The new pulley ratio of the joint.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'RevoluteJoint',
            description = 'Allow two Bodies to revolve around a shared point.',
            constructors = {
                'newRevoluteJoint'
            },
            functions = {
                {
                    name = 'setLimitsEnabled',
                    description = 'Enables or disables the joint limits.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enable',
                                    description = 'True to enable, false to disable.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMotorEnabled',
                    description = 'Starts or stops the joint motor.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enable',
                                    description = 'True to enable, false to disable.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getJointAngle',
                    description = 'Get the current joint angle.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'angle',
                                    description = 'The joint angle in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getJointSpeed',
                    description = 'Get the current joint angle speed.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 's',
                                    description = 'Joint angle speed in radians/second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLimits',
                    description = 'Gets the joint limits.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'lower',
                                    description = 'The lower limit, in radians.'
                                },
                                {
                                    type = 'number',
                                    name = 'upper',
                                    description = 'The upper limit, in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLowerLimit',
                    description = 'Gets the lower limit.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'lower',
                                    description = 'The lower limit, in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMaxMotorTorque',
                    description = 'Gets the maximum motor force.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'f',
                                    description = 'The maximum motor force, in Nm.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMotorSpeed',
                    description = 'Gets the motor speed.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 's',
                                    description = 'The motor speed, radians per second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMotorTorque',
                    description = 'Get the current motor force.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'f',
                                    description = 'The current motor force, in Nm.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getUpperLimit',
                    description = 'Gets the upper limit.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'upper',
                                    description = 'The upper limit, in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'hasLimitsEnabled',
                    description = 'Checks whether limits are enabled.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'True if enabled, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isMotorEnabled',
                    description = 'Checks whether the motor is enabled.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'True if enabled, false if disabled.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLimits',
                    description = 'Sets the limits.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'lower',
                                    description = 'The lower limit, in radians.'
                                },
                                {
                                    type = 'number',
                                    name = 'upper',
                                    description = 'The upper limit, in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLowerLimit',
                    description = 'Sets the lower limit.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'lower',
                                    description = 'The lower limit, in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMaxMotorTorque',
                    description = 'Set the maximum motor force.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'f',
                                    description = 'The maximum motor force, in Nm.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMotorSpeed',
                    description = 'Sets the motor speed.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 's',
                                    description = 'The motor speed, radians per second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setUpperLimit',
                    description = 'Sets the upper limit.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'upper',
                                    description = 'The upper limit, in radians.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'RopeJoint',
            description = 'The RopeJoint enforces a maximum distance between two points on two bodies. It has no other effect.',
            constructors = {
                'newRopeJoint'
            },
            functions = {
                {
                    name = 'getMaxLength',
                    description = 'Gets the maximum length of a RopeJoint.',
                    functions = {
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
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'Shape',
            description = 'Shapes are solid 2d geometrical objects used in love.physics.\n\nShapes are attached to a Body via a Fixture. The Shape object is copied when this happens. Shape position is relative to Body position.',
            constructors = {
                'newChainShape',
                'newEdgeShape',
                'newPolygonShape',
                'newRectangleShape'
            },
            functions = {
                {
                    name = 'computeAABB',
                    description = 'Returns the points of the bounding box for the transformed shape.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'tx',
                                    description = 'The translation of the shape on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'ty',
                                    description = 'The translation of the shape on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'tr',
                                    description = 'The shape rotation.'
                                },
                                {
                                    type = 'number',
                                    name = 'childIndex',
                                    default = '1',
                                    description = 'The index of the child to compute the bounding box of.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'topLeftX',
                                    description = 'The x position of the top-left point.'
                                },
                                {
                                    type = 'number',
                                    name = 'topLeftY',
                                    description = 'The y position of the top-left point.'
                                },
                                {
                                    type = 'number',
                                    name = 'bottomRightX',
                                    description = 'The x position of the bottom-right point.'
                                },
                                {
                                    type = 'number',
                                    name = 'bottomRightY',
                                    description = 'The y position of the bottom-right point.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'computeMass',
                    description = 'Computes the mass properties for the shape with the specified density.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'density',
                                    description = 'The shape density.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x postition of the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y postition of the center of mass.'
                                },
                                {
                                    type = 'number',
                                    name = 'mass',
                                    description = 'The mass of the shape.'
                                },
                                {
                                    type = 'number',
                                    name = 'inertia',
                                    description = 'The rotational inertia.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'destroy',
                    description = 'Explicitly destroys the Shape. When you don\'t have time to wait for garbage collection, this function may be used to free the object immediately, but note that an error will occur if you attempt to use the object after calling this function.\nNote that Box2D doesn\'t allow destroying or creating shapes during collision callbacks.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'getBody',
                    description = 'Get the Body the shape is attached to.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Body',
                                    name = 'body',
                                    description = 'The body the shape is attached to.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBoundingBox',
                    description = 'Gets the bounding box of the shape. This function can be used in a nested fashion with love.graphics.polygon.\n\nA bounding box is the smallest rectangle that encapsulates the entire polygon.\n\nVertexes are returned starting from the bottom-left in a clockwise fashion (bottom-left, top-left, top-right, bottom-right).',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x component of the first vertex, bottom-left.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y component of the first vertex, bottom-left.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x component of the second vertex, top-left.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y component of the second vertex, top-left.'
                                },
                                {
                                    type = 'number',
                                    name = 'x3',
                                    description = 'The x component of the third vertex, top-right.'
                                },
                                {
                                    type = 'number',
                                    name = 'y3',
                                    description = 'The y component of the third vertex, top-right.'
                                },
                                {
                                    type = 'number',
                                    name = 'x4',
                                    description = 'The x component of the fourth vertex, bottom-right.'
                                },
                                {
                                    type = 'number',
                                    name = 'y4',
                                    description = 'The y component of the fourth vertex, bottom-right.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getChildCount',
                    description = 'Returns the number of children the shape has.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'count',
                                    description = 'The number of children.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getData',
                    description = 'Get the data set with setData.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'any',
                                    name = 'v',
                                    description = 'The data previously set, or nil if none.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDensity',
                    description = 'Gets the density of the Shape.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'density',
                                    description = 'The density of the Shape.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFilterData',
                    description = 'Gets the filter data of the Shape.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'categoryBits',
                                    description = 'A 16-bit integer representing category membership.'
                                },
                                {
                                    type = 'number',
                                    name = 'maskBits',
                                    description = 'A 16-bit integer representing masked categories.'
                                },
                                {
                                    type = 'number',
                                    name = 'groupIndex',
                                    description = 'An integer representing the group index.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFriction',
                    description = 'Gets the friction of this shape.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'friction',
                                    description = 'The friction of the shape.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getType',
                    description = 'Gets a string representing the Shape. This function can be useful for conditional debug drawing.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'ShapeType',
                                    name = 'type',
                                    description = 'The type of the Shape.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'rayCast',
                    description = 'Casts a ray against the shape and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned. The Shape can be transformed to get it into the desired position.\n\nThe ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.\n\nThe childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.\n\nThe world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.\n\nhitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x position of the input line starting point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y position of the input line starting point.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x position of the input line end point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y position of the input line end point.'
                                },
                                {
                                    type = 'number',
                                    name = 'maxFraction',
                                    description = 'Ray length parameter.'
                                },
                                {
                                    type = 'number',
                                    name = 'tx',
                                    description = 'The translation of the shape on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'ty',
                                    description = 'The translation of the shape on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'tr',
                                    description = 'The shape rotation.'
                                },
                                {
                                    type = 'number',
                                    name = 'childIndex',
                                    default = '1',
                                    description = 'The index of the child the ray gets cast against.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'xn',
                                    description = 'The x component of the normal vector of the edge where the ray hit the shape.'
                                },
                                {
                                    type = 'number',
                                    name = 'yn',
                                    description = 'The y component of the normal vector of the edge where the ray hit the shape.'
                                },
                                {
                                    type = 'number',
                                    name = 'fraction',
                                    description = 'The position on the input line where the intersection happened as a factor of the line length.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setData',
                    description = 'Set data to be passed to the collision callback.\n\nWhen a shape collides, the value set here will be passed to the collision callback as one of the parameters. Typically, you would want to store a table reference here, but any value can be used.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'any',
                                    name = 'v',
                                    description = 'Any Lua value.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDensity',
                    description = 'Sets the density of a Shape. Do this before calling Body:setMassFromShapes.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'density',
                                    description = 'The new density of the Shape.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFilterData',
                    description = 'Sets the filter data for a Shape.\n\nCollision filtering is a system for preventing collision between shapes. For example, say you make a character that rides a bicycle. You want the bicycle to collide with the terrain and the character to collide with the terrain, but you don\'t want the character to collide with the bicycle (because they must overlap). Box2D supports such collision filtering using categories and groups.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'categoryBits',
                                    description = 'A 16-bit integer representing category membership.'
                                },
                                {
                                    type = 'number',
                                    name = 'maskBits',
                                    description = 'A 16-bit integer representing masked categories.'
                                },
                                {
                                    type = 'number',
                                    name = 'groupIndex',
                                    description = 'An integer representing the group index.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFriction',
                    description = 'Sets the friction of the shape. Friction determines how shapes react when they "slide" along other shapes. Low friction indicates a slippery surface, like ice, while high friction indicates a rough surface, like concrete. Range: 0.0 - 1.0.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'friction',
                                    description = 'The friction of the shape.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'testPoint',
                    description = 'Checks whether a point lies inside the shape. This is particularly useful for mouse interaction with the shapes. By looping through all shapes and testing the mouse position with this function, we can find which shapes the mouse touches.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the point.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the point.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'hit',
                                    description = 'True if inside, false if outside'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'testSegment',
                    description = 'Checks whether a line segment intersects a shape. This function will either return the "time" of impact and the surface normal at the point of collision, or nil if the line does not intersect the shape. The "time" is a value between 0.0 and 1.0 and can be used to calculate where the collision occured.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x component of the first endpoint.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y component of the first endpoint.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x component of the second endpoint.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y component of the second endpoint.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 't',
                                    description = 'The time of impact, or nil if no impact.'
                                },
                                {
                                    type = 'number',
                                    name = 'xn',
                                    description = 'The x component of the surface normal.'
                                },
                                {
                                    type = 'number',
                                    name = 'yn',
                                    description = 'The y component of the surface normal.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'WeldJoint',
            description = 'A WeldJoint essentially glues two bodies together.',
            constructors = {
                'newWeldJoint'
            },
            functions = {
                {
                    name = 'getDampingRatio',
                    description = 'Returns the damping ratio of the joint.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The damping ratio.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFrequency',
                    description = 'Returns the frequency.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'freq',
                                    description = 'The frequency in hertz.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDampingRatio',
                    description = 'The new damping ratio.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ratio',
                                    description = 'The new damping ratio.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFrequency',
                    description = 'Sets a new frequency.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'freq',
                                    description = 'The new frequency in hertz.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Joint'
            }
        },
        {
            name = 'World',
            description = 'A world is an object that contains all bodies and joints.',
            constructors = {
                'newWorld'
            },
            functions = {
                {
                    name = 'destroy',
                    description = 'Destroys the world, taking all bodies, joints, fixtures and their shapes with it.\n\nAn error will occur if you attempt to use any of the destroyed objects after calling this function.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'isSleepingAllowed',
                    description = 'Returns the sleep behaviour of the world.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'allowSleep',
                                    description = 'True if the bodies are allowed to sleep or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBodyCount',
                    description = 'Get the number of bodies in the world.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'n',
                                    description = 'The number of bodies in the world.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBodyList',
                    description = 'Returns a table with all bodies.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'table',
                                    name = 'bodies',
                                    description = 'A sequence with all bodies.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getCallbacks',
                    description = 'Returns functions for the callbacks during the world update.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'function',
                                    name = 'beginContact',
                                    description = 'Gets called when two fixtures begin to overlap.'
                                },
                                {
                                    type = 'function',
                                    name = 'endContact',
                                    description = 'Gets called when two fixtures cease to overlap.'
                                },
                                {
                                    type = 'function',
                                    name = 'preSolve',
                                    description = 'Gets called before a collision gets resolved.'
                                },
                                {
                                    type = 'function',
                                    name = 'postSolve',
                                    description = 'Gets called after the collision has been resolved.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getContactCount',
                    description = 'Returns the number of contacts in the world.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'n',
                                    description = 'The number of contacts in the world.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getContactFilter',
                    description = 'Returns the function for collision filtering.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'function',
                                    name = 'contactFilter',
                                    description = 'The function that handles the contact filtering.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getContactList',
                    description = 'Returns a table with all contacts.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'table',
                                    name = 'contacts',
                                    description = 'A sequence with all contacts.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getGravity',
                    description = 'Get the gravity of the world.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of gravity.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of gravity.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getJointCount',
                    description = 'Get the number of joints in the world.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'n',
                                    description = 'The number of joints in the world.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getJointList',
                    description = 'Returns a table with all joints.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'table',
                                    name = 'joints',
                                    description = 'A sequence with all joints.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isLocked',
                    description = 'Returns if the world is updating its state.\n\nThis will return true inside the callbacks from World:setCallbacks.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'locked',
                                    description = 'Will be true if the world is in the process of updating its state.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'queryBoundingBox',
                    description = 'Calls a function for each fixture inside the specified area.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'topLeftX',
                                    description = 'The x position of the top-left point.'
                                },
                                {
                                    type = 'number',
                                    name = 'topLeftY',
                                    description = 'The y position of the top-left point.'
                                },
                                {
                                    type = 'number',
                                    name = 'bottomRightX',
                                    description = 'The x position of the bottom-right point.'
                                },
                                {
                                    type = 'number',
                                    name = 'bottomRightY',
                                    description = 'The y position of the bottom-right point.'
                                },
                                {
                                    type = 'function',
                                    name = 'callback',
                                    description = 'This function gets passed one argument, the fixture, and should return a boolean. The search will continue if it is true or stop if it is false.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'rayCast',
                    description = 'Casts a ray and calls a function with the fixtures that intersect it. You cannot make any assumptions about the order of the callbacks.\n\nEach time the function gets called, 6 arguments get passed to it. The first is the fixture intersecting the ray. The second and third are the coordinates of the intersection point. The fourth and fifth is the surface normal vector of the shape edge. The sixth argument is the position of the intersection on the ray as a number from 0 to 1 (or even higher if the ray length was changed with the return value).\n\nThe ray can be controlled with the return value. A positive value sets a new ray length where 1 is the default value. A value of 0 terminates the ray. If the callback function returns -1, the intersection gets ignored as if it didn\'t happen.\n\nThere is a bug in 0.8.0 where the normal vector passed to the callback function gets scaled by love.physics.getMeter.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The x position of the starting point of the ray.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The y position of the starting point of the ray.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The x position of the end point of the ray.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The y position of the end point of the ray.'
                                },
                                {
                                    type = 'function',
                                    name = 'callback',
                                    description = 'This function gets six arguments and should return a number.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSleepingAllowed',
                    description = 'Set the sleep behaviour of the world.\n\nA sleeping body is much more efficient to simulate than when awake.\n\nIf sleeping is allowed, any body that has come to rest will sleep.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'allowSleep',
                                    description = 'True if the bodies are allowed to sleep or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setCallbacks',
                    description = 'Sets functions for the collision callbacks during the world update.\n\nFour Lua functions can be given as arguments. The value nil removes a function.\n\nWhen called, each function will be passed three arguments. The first two arguments are the colliding fixtures and the third argument is the Contact between them. The PostSolve callback additionally gets the normal and tangent impulse for each contact point.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'function',
                                    name = 'beginContact',
                                    description = 'Gets called when two fixtures begin to overlap. '
                                },
                                {
                                    type = 'function',
                                    name = 'endContact',
                                    description = 'Gets called when two fixtures cease to overlap.'
                                },
                                {
                                    type = 'function',
                                    name = 'preSolve',
                                    description = 'Gets called before a collision gets resolved.'
                                },
                                {
                                    type = 'function',
                                    name = 'postSolve',
                                    description = 'Gets called after the collision has been resolved.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setGravity',
                    description = 'Set the gravity of the world.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of gravity.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of gravity.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'update',
                    description = 'Update the state of the world.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'dt',
                                    description = 'The time (in seconds) to advance the physics simulation.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        }
    },
    functions = {
        {
            name = 'getDistance',
            description = 'Returns the two closest points between two fixtures and their distance.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Fixture',
                            name = 'fixture1',
                            description = 'The first fixture.'
                        },
                        {
                            type = 'Fixture',
                            name = 'fixture2',
                            description = 'The second fixture.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'distance',
                            description = 'The distance of the two points.'
                        },
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x-coordinate of the first point.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y-coordinate of the first point.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x-coordinate of the second point.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y-coordinate of the second point.'
                        }
                    }
                }
            }
        },
        {
            name = 'getMeter',
            description = 'Get the scale of the world.\n\nThe world scale is the number of pixels per meter. Try to keep your shape sizes less than 10 times this scale.\n\nThis is important because the physics in Box2D is tuned to work well for objects of size 0.1m up to 10m. All physics coordinates are divided by this number for the physics calculations.',
            functions = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The size of 1 meter in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'newBody',
            description = 'Creates a new body.\n\nThere are three types of bodies. Static bodies do not move, have a infinite mass, and can be used for level boundaries. Dynamic bodies are the main actors in the simulation, they collide with everything. Kinematic bodies do not react to forces and only collide with dynamic bodies.\n\nThe mass of the body gets calculated when a Fixture is attached or removed, but can be changed at any time with Body:setMass or Body:resetMassData.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'World',
                            name = 'world',
                            description = 'The world to create the body in.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            default = '0',
                            description = 'The x position of the body.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            default = '0',
                            description = 'The y position of the body.'
                        },
                        {
                            type = 'BodyType',
                            name = 'type',
                            default = '"static"',
                            description = 'The type of the body.'
                        }
                    },
                    returns = {
                        {
                            type = 'Body',
                            name = 'body',
                            description = 'A new body.'
                        }
                    }
                }
            }
        },
        {
            name = 'newChainShape',
            description = 'Creates a chain shape.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'loop',
                            description = 'If the chain should loop back to the first point.'
                        },
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x position of the first point.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the first point.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x position of the second point.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y position of the second point.'
                        }
                    },
                    returns = {
                        {
                            type = 'ChainShape',
                            name = 'shape',
                            description = 'The new shape.'
                        }
                    }
                }
            }
        },
        {
            name = 'newCircleShape',
            description = 'Create a new CircleShape at (x,y) in local coordinates.\n\nAnchors from the center of the shape by default.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body',
                            description = 'The body to attach the shape to.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x offset of the circle.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y offset of the circle.'
                        },
                        {
                            type = 'number',
                            name = 'radius',
                            description = 'The radius of the circle.'
                        }
                    },
                    returns = {
                        {
                            type = 'CircleShape',
                            name = 'shape',
                            description = 'A new CircleShape.'
                        }
                    }
                }
            }
        },
        {
            name = 'newDistanceJoint',
            description = 'Create a distance joint between two bodies.\n\nThis joint constrains the distance between two points on two bodies to be constant. These two points are specified in world coordinates and the two bodies are assumed to be in place when this joint is created. The first anchor point is connected to the first body and the second to the second body, and the points define the length of the distance joint.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body1',
                            description = 'The first body to attach to the joint.'
                        },
                        {
                            type = 'Body',
                            name = 'body2',
                            description = 'The second body to attach to the joint.'
                        },
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x position of the first anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the first anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x position of the second anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y position of the second anchor point.'
                        },
                        {
                            type = 'boolean',
                            name = 'collideConnected',
                            default = 'false',
                            description = 'Specifies whether the two bodies should collide with each other.'
                        }
                    },
                    returns = {
                        {
                            type = 'DistanceJoint',
                            name = 'joint',
                            description = 'The new distance joint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newEdgeShape',
            description = 'Creates a edge shape.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x position of the first point.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the first point.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x position of the second point.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y position of the second point.'
                        }
                    },
                    returns = {
                        {
                            type = 'EdgeShape',
                            name = 'shape',
                            description = 'The new shape.'
                        }
                    }
                }
            }
        },
        {
            name = 'newFixture',
            description = 'Creates and attaches a Fixture to a body.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body',
                            description = 'The body which gets the fixture attached.'
                        },
                        {
                            type = 'Shape',
                            name = 'shape',
                            description = 'The shape of the fixture.'
                        },
                        {
                            type = 'number',
                            name = 'density',
                            default = '1',
                            description = 'The density of the fixture.'
                        }
                    },
                    returns = {
                        {
                            type = 'Fixture',
                            name = 'fixture',
                            description = 'The new fixture.'
                        }
                    }
                }
            }
        },
        {
            name = 'newFrictionJoint',
            description = 'Create a friction joint between two bodies. A FrictionJoint applies friction to a body.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body1',
                            description = 'The first body to attach to the joint.'
                        },
                        {
                            type = 'Body',
                            name = 'body2',
                            description = 'The second body to attach to the joint.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the anchor point.'
                        },
                        {
                            type = 'boolean',
                            name = 'collideConnected',
                            default = 'false',
                            description = 'Specifies whether the two bodies should collide with eachother.'
                        }
                    },
                    returns = {
                        {
                            type = 'FrictionJoint',
                            name = 'joint',
                            description = 'The new FrictionJoint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newGearJoint',
            description = 'Create a gear joint connecting two joints.\n\nThe gear joint connects two joints that must be either prismatic or revolute joints. Using this joint requires that the joints it uses connect their respective bodies to the ground and have the ground as the first body. When destroying the bodies and joints you must make sure you destroy the gear joint before the other joints.\n\nThe gear joint has a ratio the determines how the angular or distance values of the connected joints relate to each other. The formula coordinate1 + ratio * coordinate2 always has a constant value that is set when the gear joint is created.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joint',
                            name = 'joint1',
                            description = 'The first joint to connect with a gear joint.'
                        },
                        {
                            type = 'Joint',
                            name = 'joint2',
                            description = 'The second joint to connect with a gear joint.'
                        },
                        {
                            type = 'number',
                            name = 'ratio',
                            default = '1',
                            description = 'The gear ratio.'
                        },
                        {
                            type = 'boolean',
                            name = 'collideConnected',
                            default = 'false',
                            description = 'Specifies whether the two bodies should collide with each other.'
                        }
                    },
                    returns = {
                        {
                            type = 'Joint',
                            name = 'joint',
                            description = 'The new gear joint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newMouseJoint',
            description = 'Create a joint between a body and the mouse.\n\nThis joint actually connects the body to a fixed point in the world. To make it follow the mouse, the fixed point must be updated every timestep (example below).\n\nThe advantage of using a MouseJoint instead of just changing a body position directly is that collisions and reactions to other joints are handled by the physics engine.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body',
                            description = 'The body to attach to the mouse.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the connecting point.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the connecting point.'
                        }
                    },
                    returns = {
                        {
                            type = 'Joint',
                            name = 'joint',
                            description = 'The new mouse joint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newPolygonShape',
            description = 'Creates a new PolygonShape.\nThis shape can have 8 vertices at most, and must form a convex shape.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body',
                            description = 'The body to attach the shape to.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Vertices of the polygon.'
                        }
                    },
                    returns = {
                        {
                            type = 'PolygonShape',
                            name = 'shape',
                            description = 'A new PolygonShape.'
                        }
                    }
                }
            }
        },
        {
            name = 'newPrismaticJoint',
            description = 'Create a prismatic joints between two bodies.\n\nA prismatic joint constrains two bodies to move relatively to each other on a specified axis. It does not allow for relative rotation. Its definition and operation are similar to a revolute joint, but with translation and force substituted for angle and torque.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body1',
                            description = 'The first body to connect with a prismatic joint.'
                        },
                        {
                            type = 'Body',
                            name = 'body2',
                            description = 'The second body to connect with a prismatic joint.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x coordinate of the anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y coordinate of the anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'ax',
                            description = 'The x coordinate of the axis vector.'
                        },
                        {
                            type = 'number',
                            name = 'ay',
                            description = 'The y coordinate of the axis vector.'
                        },
                        {
                            type = 'boolean',
                            name = 'collideConnected',
                            default = 'false',
                            description = 'Specifies whether the two bodies should collide with each other.'
                        }
                    },
                    returns = {
                        {
                            type = 'PrismaticJoint',
                            name = 'joint',
                            description = 'The new prismatic joint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newPulleyJoint',
            description = 'Create a pulley joint to join two bodies to each other and the ground.\n\nThe pulley joint simulates a pulley with an optional block and tackle. If the ratio parameter has a value different from one, then the simulated rope extends faster on one side than the other. In a pulley joint the total length of the simulated rope is the constant length1 + ratio * length2, which is set when the pulley joint is created.\n\nPulley joints can behave unpredictably if one side is fully extended. It is recommended that the method setMaxLengths  be used to constrain the maximum lengths each side can attain.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body1',
                            description = 'The first body to connect with a pulley joint.'
                        },
                        {
                            type = 'Body',
                            name = 'body2',
                            description = 'The second body to connect with a pulley joint.'
                        },
                        {
                            type = 'number',
                            name = 'gx1',
                            description = 'The x coordinate of the first body\'s ground anchor.'
                        },
                        {
                            type = 'number',
                            name = 'gy1',
                            description = 'The y coordinate of the first body\'s ground anchor.'
                        },
                        {
                            type = 'number',
                            name = 'gx2',
                            description = 'The x coordinate of the second body\'s ground anchor.'
                        },
                        {
                            type = 'number',
                            name = 'gy2',
                            description = 'The y coordinate of the second body\'s ground anchor.'
                        },
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x coordinate of the pulley joint anchor in the first body.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y coordinate of the pulley joint anchor in the first body.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x coordinate of the pulley joint anchor in the second body.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y coordinate of the pulley joint anchor in the second body.'
                        },
                        {
                            type = 'number',
                            name = 'ratio',
                            default = '1',
                            description = 'The joint ratio.'
                        },
                        {
                            type = 'boolean',
                            name = 'collideConnected',
                            default = 'true',
                            description = 'Specifies whether the two bodies should collide with each other.'
                        }
                    },
                    returns = {
                        {
                            type = 'Joint',
                            name = 'joint',
                            description = 'The new pulley joint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newRectangleShape',
            description = 'Shorthand for creating rectangluar PolygonShapes.\n\nThe rectangle will be created at (x,y) in local coordinates.\n\nAnchors from the center of the shape by default.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body',
                            description = 'The Body to attach the Shape to.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The offset along the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The offset along the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the rectangle.'
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            default = '0',
                            description = 'The initial angle of the rectangle.'
                        }
                    },
                    returns = {
                        {
                            type = 'PolygonShape',
                            name = 'shape',
                            description = 'A new PolygonShape.'
                        }
                    }
                }
            }
        },
        {
            name = 'newRevoluteJoint',
            description = 'Creates a pivot joint between two bodies.\n\nThis joint connects two bodies to a point around which they can pivot.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body1',
                            description = 'The first body to connect with a Revolute Joint.'
                        },
                        {
                            type = 'Body',
                            name = 'body2',
                            description = 'The second body to connect with a Revolute Joint.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the connecting point.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the connecting point.'
                        },
                        {
                            type = 'number',
                            name = 'collideConnected',
                            description = 'Specifies whether the two bodies should collide with each other.'
                        }
                    },
                    returns = {
                        {
                            type = 'Joint',
                            name = 'joint',
                            description = 'The new revolute joint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newRopeJoint',
            description = 'Create a joint between two bodies. Its only function is enforcing a max distance between these bodies.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body1',
                            description = 'The first body to attach to the joint.'
                        },
                        {
                            type = 'Body',
                            name = 'body2',
                            description = 'The second body to attach to the joint.'
                        },
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x position of the first anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the first anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x position of the second anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y position of the second anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'maxLength',
                            description = 'The maximum distance for the bodies.'
                        },
                        {
                            type = 'boolean',
                            name = 'collideConnected',
                            default = 'false',
                            description = 'Specifies whether the two bodies should collide with each other.'
                        }
                    },
                    returns = {
                        {
                            type = 'RopeJoint',
                            name = 'joint',
                            description = 'The new RopeJoint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newWeldJoint',
            description = 'Create a friction joint between two bodies. A WeldJoint essentially glues two bodies together.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body1',
                            description = 'The first body to attach to the joint.'
                        },
                        {
                            type = 'Body',
                            name = 'body2',
                            description = 'The second body to attach to the joint.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the anchor point.'
                        },
                        {
                            type = 'boolean',
                            name = 'collideConnected',
                            default = 'false',
                            description = 'Specifies whether the two bodies should collide with each other.'
                        }
                    },
                    returns = {
                        {
                            type = 'WeldJoint',
                            name = 'joint',
                            description = 'The new WeldJoint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newWheelJoint',
            description = 'Creates a wheel joint.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Body',
                            name = 'body1',
                            description = 'The first body.'
                        },
                        {
                            type = 'Body',
                            name = 'body2',
                            description = 'The second body.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the anchor point.'
                        },
                        {
                            type = 'number',
                            name = 'ax',
                            description = 'The x position of the axis unit vector.'
                        },
                        {
                            type = 'number',
                            name = 'ay',
                            description = 'The y position of the axis unit vector.'
                        },
                        {
                            type = 'boolean',
                            name = 'collideConnected',
                            default = 'false',
                            description = 'Specifies whether the two bodies should collide with each other.'
                        }
                    },
                    returns = {
                        {
                            type = 'WheelJoint',
                            name = 'joint',
                            description = 'The new WheelJoint.'
                        }
                    }
                }
            }
        },
        {
            name = 'newWorld',
            description = 'Creates a new World.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'xg',
                            default = '0',
                            description = 'The x component of gravity.'
                        },
                        {
                            type = 'number',
                            name = 'yg',
                            default = '0',
                            description = 'The y component of gravity.'
                        },
                        {
                            type = 'boolean',
                            name = 'sleep',
                            default = 'true',
                            description = 'Whether the bodies in this world are allowed to sleep.'
                        }
                    },
                    returns = {
                        {
                            type = 'World',
                            name = 'world',
                            description = 'A brave new World.'
                        }
                    }
                }
            }
        },
        {
            name = 'setMeter',
            description = 'Sets the pixels to meter scale factor.\n\nAll coordinates in the physics module are divided by this number and converted to meters, and it creates a convenient way to draw the objects directly to the screen without the need for graphics transformations.\n\nIt is recommended to create shapes no larger than 10 times the scale. This is important because Box2D is tuned to work well with shape sizes from 0.1 to 10 meters.\n\nlove.physics.setMeter does not apply retroactively to created objects. Created objects retain their meter coordinates but the scale factor will affect their pixel coordinates.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The scale factor as an integer.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        {
            name = 'BodyType',
            constants = {
                {
                    name = 'static',
                    description = 'Static bodies do not move.'
                },
                {
                    name = 'dynamic',
                    description = 'Dynamic bodies collide with all bodies.'
                },
                {
                    name = 'kinematic',
                    description = 'Kinematic bodies only collide with dynamic bodies.'
                }
            }
        },
        {
            name = 'JointType',
            constants = {
                {
                    name = 'distance',
                    description = 'A DistanceJoint.'
                },
                {
                    name = 'gear',
                    description = 'A GearJoint.'
                },
                {
                    name = 'mouse',
                    description = 'A MouseJoint.'
                },
                {
                    name = 'prismatic',
                    description = 'A PrismaticJoint.'
                },
                {
                    name = 'pulley',
                    description = 'A PulleyJoint.'
                },
                {
                    name = 'revolute',
                    description = 'A RevoluteJoint.'
                },
            }
        },
        {
            name = 'ShapeType',
            description = 'The different types of Shapes, as returned by Shape:getType.',
            constants = {
                {
                    name = 'circle',
                    description = 'The Shape is a CircleShape.'
                },
                {
                    name = 'polygon',
                    description = 'The Shape is a PolygonShape.'
                },
                {
                    name = 'edge',
                    description = 'The Shape is a EdgeShape.'
                },
                {
                    name = 'chain',
                    description = 'The Shape is a ChainShape.'
                }
            }
        }
    }
}