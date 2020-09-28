local path = (...):match('(.-)[^%./]+$')

return {
    name = 'ParticleSystem',
    description = 'A ParticleSystem can be used to create particle effects like fire or smoke.\n\nThe particle system has to be created using update it in the update callback to see any changes in the particles emitted.\n\nThe particle system won\'t create any particles unless you call setParticleLifetime and setEmissionRate.',
    constructors = {
        'newParticleSystem',
    },
    supertypes = {
        'Drawable',
        'Object',
    },
    functions = {
        {
            name = 'clone',
            description = 'Creates an identical copy of the ParticleSystem in the stopped state.',
            variants = {
                {
                    description = 'Cloned ParticleSystem inherit all the set-able state of the original ParticleSystem, but they are initialized stopped.',
                    returns = {
                        {
                            type = 'ParticleSystem',
                            name = 'particlesystem',
                            description = 'The new identical copy of this ParticleSystem.',
                        },
                    },
                },
            },
        },
        {
            name = 'emit',
            description = 'Emits a burst of particles from the particle emitter.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'numparticles',
                            description = 'The amount of particles to emit. The number of emitted particles will be truncated if the particle system\'s max buffer size is reached.',
                        },
                    },
                },
            },
        },
        {
            name = 'getBufferSize',
            description = 'Gets the maximum number of particles the ParticleSystem can have at once.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The maximum number of particles.',
                        },
                    },
                },
            },
        },
        {
            name = 'getColors',
            description = 'Gets the series of colors applied to the particle sprite.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'r1',
                            description = 'First color, red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g1',
                            description = 'First color, green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b1',
                            description = 'First color, blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a1',
                            description = 'First color, alpha component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'r2',
                            description = 'Second color, red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g2',
                            description = 'Second color, green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b2',
                            description = 'Second color, blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a2',
                            description = 'Second color, alpha component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'r8',
                            description = 'Eighth color, red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g8',
                            description = 'Eighth color, green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b8',
                            description = 'Eighth color, blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a8',
                            description = 'Eighth color, alpha component (0-1).',
                        },
                    },
                },
            },
        },
        {
            name = 'getCount',
            description = 'Gets the number of particles that are currently in the system.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The current number of live particles.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDirection',
            description = 'Gets the direction of the particle emitter (in radians).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'direction',
                            description = 'The direction of the emitter (radians).',
                        },
                    },
                },
            },
        },
        {
            name = 'getEmissionArea',
            description = 'Gets the area-based spawn parameters for the particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'AreaSpreadDistribution',
                            name = 'distribution',
                            description = 'The type of distribution for new particles.',
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution.',
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution.',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The angle in radians of the emission area.',
                        },
                        {
                            type = 'boolean',
                            name = 'directionRelativeToCenter',
                            description = 'True if newly spawned particles will be oriented relative to the center of the emission area, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'getEmissionRate',
            description = 'Gets the amount of particles emitted per second.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'rate',
                            description = 'The amount of particles per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'getEmitterLifetime',
            description = 'Gets how long the particle system will emit particles (if -1 then it emits particles forever).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'life',
                            description = 'The lifetime of the emitter (in seconds).',
                        },
                    },
                },
            },
        },
        {
            name = 'getInsertMode',
            description = 'Gets the mode used when the ParticleSystem adds new particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ParticleInsertMode',
                            name = 'mode',
                            description = 'The mode used when the ParticleSystem adds new particles.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLinearAcceleration',
            description = 'Gets the linear acceleration (acceleration along the x and y axes) for particles.\n\nEvery particle created will accelerate along the x and y axes between xmin,ymin and xmax,ymax.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'xmin',
                            description = 'The minimum acceleration along the x axis.',
                        },
                        {
                            type = 'number',
                            name = 'ymin',
                            description = 'The minimum acceleration along the y axis.',
                        },
                        {
                            type = 'number',
                            name = 'xmax',
                            description = 'The maximum acceleration along the x axis.',
                        },
                        {
                            type = 'number',
                            name = 'ymax',
                            description = 'The maximum acceleration along the y axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'getLinearDamping',
            description = 'Gets the amount of linear damping (constant deceleration) for particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum amount of linear damping applied to particles.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum amount of linear damping applied to particles.',
                        },
                    },
                },
            },
        },
        {
            name = 'getOffset',
            description = 'Gets the particle image\'s draw offset.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'The x coordinate of the particle image\'s draw offset.',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'The y coordinate of the particle image\'s draw offset.',
                        },
                    },
                },
            },
        },
        {
            name = 'getParticleLifetime',
            description = 'Gets the lifetime of the particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum life of the particles (in seconds).',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum life of the particles (in seconds).',
                        },
                    },
                },
            },
        },
        {
            name = 'getPosition',
            description = 'Gets the position of the emitter.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Position along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Position along y-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'getQuads',
            description = 'Gets the series of Quads used for the particle sprites.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'quads',
                            description = 'A table containing the Quads used.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRadialAcceleration',
            description = 'Gets the radial acceleration (away from the emitter).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum acceleration.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum acceleration.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRotation',
            description = 'Gets the rotation of the image upon particle creation (in radians).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum initial angle (radians).',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum initial angle (radians).',
                        },
                    },
                },
            },
        },
        {
            name = 'getSizeVariation',
            description = 'Gets the amount of size variation (0 meaning no variation and 1 meaning full variation between start and end).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The amount of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                        },
                    },
                },
            },
        },
        {
            name = 'getSizes',
            description = 'Gets the series of sizes by which the sprite is scaled. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle\'s lifetime.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'size1',
                            description = 'The first size.',
                        },
                        {
                            type = 'number',
                            name = 'size2',
                            description = 'The second size.',
                        },
                        {
                            type = 'number',
                            name = 'size8',
                            description = 'The eighth size.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSpeed',
            description = 'Gets the speed of the particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum linear speed of the particles.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum linear speed of the particles.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSpin',
            description = 'Gets the spin of the sprite.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum spin (radians per second).',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum spin (radians per second).',
                        },
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                        },
                    },
                },
            },
        },
        {
            name = 'getSpinVariation',
            description = 'Gets the amount of spin variation (0 meaning no variation and 1 meaning full variation between start and end).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The amount of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                        },
                    },
                },
            },
        },
        {
            name = 'getSpread',
            description = 'Gets the amount of directional spread of the particle emitter (in radians).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'spread',
                            description = 'The spread of the emitter (radians).',
                        },
                    },
                },
            },
        },
        {
            name = 'getTangentialAcceleration',
            description = 'Gets the tangential acceleration (acceleration perpendicular to the particle\'s direction).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum acceleration.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum acceleration.',
                        },
                    },
                },
            },
        },
        {
            name = 'getTexture',
            description = 'Gets the texture (Image or Canvas) used for the particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'The Image or Canvas used for the particles.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasRelativeRotation',
            description = 'Gets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True if relative particle rotation is enabled, false if it\'s disabled.',
                        },
                    },
                },
            },
        },
        {
            name = 'isActive',
            description = 'Checks whether the particle system is actively emitting particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'active',
                            description = 'True if system is active, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'isPaused',
            description = 'Checks whether the particle system is paused.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'paused',
                            description = 'True if system is paused, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'isStopped',
            description = 'Checks whether the particle system is stopped.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'stopped',
                            description = 'True if system is stopped, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'moveTo',
            description = 'Moves the position of the emitter. This results in smoother particle spawning behaviour than if ParticleSystem:setPosition is used every frame.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Position along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Position along y-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'pause',
            description = 'Pauses the particle emitter.',
            variants = {
                {
                },
            },
        },
        {
            name = 'reset',
            description = 'Resets the particle emitter, removing any existing particles and resetting the lifetime counter.',
            variants = {
                {
                },
            },
        },
        {
            name = 'setBufferSize',
            description = 'Sets the size of the buffer (the max allowed amount of particles in the system).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The buffer size.',
                        },
                    },
                },
            },
        },
        {
            name = 'setColors',
            description = 'Sets a series of colors to apply to the particle sprite. The particle system will interpolate between each color evenly over the particle\'s lifetime.\n\nArguments can be passed in groups of four, representing the components of the desired RGBA value, or as tables of RGBA component values, with a default alpha value of 1 if only three values are given. At least one color must be specified. A maximum of eight may be used.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'r1',
                            description = 'First color, red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g1',
                            description = 'First color, green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b1',
                            description = 'First color, blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a1',
                            description = 'First color, alpha component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'r2',
                            description = 'Second color, red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g2',
                            description = 'Second color, green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b2',
                            description = 'Second color, blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a2',
                            description = 'Second color, alpha component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'r8',
                            description = 'Eighth color, red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g8',
                            description = 'Eighth color, green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b8',
                            description = 'Eighth color, blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a8',
                            description = 'Eighth color, alpha component (0-1).',
                        },
                    },
                },
            },
        },
        {
            name = 'setDirection',
            description = 'Sets the direction the particles will be emitted in.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'direction',
                            description = 'The direction of the particles (in radians).',
                        },
                    },
                },
            },
        },
        {
            name = 'setEmissionArea',
            description = 'Sets area-based spawn parameters for the particles. Newly created particles will spawn in an area around the emitter based on the parameters to this function.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'AreaSpreadDistribution',
                            name = 'distribution',
                            description = 'The type of distribution for new particles.',
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution.',
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution.',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The angle in radians of the emission area.',
                            default = '0',
                        },
                        {
                            type = 'boolean',
                            name = 'directionRelativeToCenter',
                            description = 'True if newly spawned particles will be oriented relative to the center of the emission area, false otherwise.',
                            default = 'false',
                        },
                    },
                },
            },
        },
        {
            name = 'setEmissionRate',
            description = 'Sets the amount of particles emitted per second.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'rate',
                            description = 'The amount of particles per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'setEmitterLifetime',
            description = 'Sets how long the particle system should emit particles (if -1 then it emits particles forever).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'life',
                            description = 'The lifetime of the emitter (in seconds).',
                        },
                    },
                },
            },
        },
        {
            name = 'setInsertMode',
            description = 'Sets the mode to use when the ParticleSystem adds new particles.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ParticleInsertMode',
                            name = 'mode',
                            description = 'The mode to use when the ParticleSystem adds new particles.',
                        },
                    },
                },
            },
        },
        {
            name = 'setLinearAcceleration',
            description = 'Sets the linear acceleration (acceleration along the x and y axes) for particles.\n\nEvery particle created will accelerate along the x and y axes between xmin,ymin and xmax,ymax.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'xmin',
                            description = 'The minimum acceleration along the x axis.',
                        },
                        {
                            type = 'number',
                            name = 'ymin',
                            description = 'The minimum acceleration along the y axis.',
                        },
                        {
                            type = 'number',
                            name = 'xmax',
                            description = 'The maximum acceleration along the x axis.',
                            default = 'xmin',
                        },
                        {
                            type = 'number',
                            name = 'ymax',
                            description = 'The maximum acceleration along the y axis.',
                            default = 'ymin',
                        },
                    },
                },
            },
        },
        {
            name = 'setLinearDamping',
            description = 'Sets the amount of linear damping (constant deceleration) for particles.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum amount of linear damping applied to particles.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum amount of linear damping applied to particles.',
                            default = 'min',
                        },
                    },
                },
            },
        },
        {
            name = 'setOffset',
            description = 'Set the offset position which the particle sprite is rotated around.\n\nIf this function is not used, the particles rotate around their center.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x coordinate of the rotation offset.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y coordinate of the rotation offset.',
                        },
                    },
                },
            },
        },
        {
            name = 'setParticleLifetime',
            description = 'Sets the lifetime of the particles.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum life of the particles (in seconds).',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum life of the particles (in seconds).',
                            default = 'min',
                        },
                    },
                },
            },
        },
        {
            name = 'setPosition',
            description = 'Sets the position of the emitter.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Position along x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Position along y-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'setQuads',
            description = 'Sets a series of Quads to use for the particle sprites. Particles will choose a Quad from the list based on the particle\'s current lifetime, allowing for the use of animated sprite sheets with ParticleSystems.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Quad',
                            name = 'quad1',
                            description = 'The first Quad to use.',
                        },
                        {
                            type = 'Quad',
                            name = 'quad2',
                            description = 'The second Quad to use.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'quads',
                            description = 'A table containing the Quads to use.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRadialAcceleration',
            description = 'Set the radial acceleration (away from the emitter).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum acceleration.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum acceleration.',
                            default = 'min',
                        },
                    },
                },
            },
        },
        {
            name = 'setRelativeRotation',
            description = 'Sets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True to enable relative particle rotation, false to disable it.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRotation',
            description = 'Sets the rotation of the image upon particle creation (in radians).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum initial angle (radians).',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum initial angle (radians).',
                            default = 'min',
                        },
                    },
                },
            },
        },
        {
            name = 'setSizeVariation',
            description = 'Sets the amount of size variation (0 meaning no variation and 1 meaning full variation between start and end).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The amount of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                        },
                    },
                },
            },
        },
        {
            name = 'setSizes',
            description = 'Sets a series of sizes by which to scale a particle sprite. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle\'s lifetime.\n\nAt least one size must be specified. A maximum of eight may be used.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'size1',
                            description = 'The first size.',
                        },
                        {
                            type = 'number',
                            name = 'size2',
                            description = 'The second size.',
                        },
                        {
                            type = 'number',
                            name = 'size8',
                            description = 'The eighth size.',
                        },
                    },
                },
            },
        },
        {
            name = 'setSpeed',
            description = 'Sets the speed of the particles.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum linear speed of the particles.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum linear speed of the particles.',
                            default = 'min',
                        },
                    },
                },
            },
        },
        {
            name = 'setSpin',
            description = 'Sets the spin of the sprite.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum spin (radians per second).',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum spin (radians per second).',
                            default = 'min',
                        },
                    },
                },
            },
        },
        {
            name = 'setSpinVariation',
            description = 'Sets the amount of spin variation (0 meaning no variation and 1 meaning full variation between start and end).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The amount of variation (0 meaning no variation and 1 meaning full variation between start and end).',
                        },
                    },
                },
            },
        },
        {
            name = 'setSpread',
            description = 'Sets the amount of spread for the system.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'spread',
                            description = 'The amount of spread (radians).',
                        },
                    },
                },
            },
        },
        {
            name = 'setTangentialAcceleration',
            description = 'Sets the tangential acceleration (acceleration perpendicular to the particle\'s direction).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum acceleration.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum acceleration.',
                            default = 'min',
                        },
                    },
                },
            },
        },
        {
            name = 'setTexture',
            description = 'Sets the texture (Image or Canvas) to be used for the particles.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'An Image or Canvas to use for the particles.',
                        },
                    },
                },
            },
        },
        {
            name = 'start',
            description = 'Starts the particle emitter.',
            variants = {
                {
                },
            },
        },
        {
            name = 'stop',
            description = 'Stops the particle emitter, resetting the lifetime counter.',
            variants = {
                {
                },
            },
        },
        {
            name = 'update',
            description = 'Updates the particle system; moving, creating and killing particles.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'dt',
                            description = 'The time (seconds) since last frame.',
                        },
                    },
                },
            },
        },
    },
}