return {
    name = 'ParticleSystem',
    description = 'Used to create cool effects, like fire. The particle systems are created and drawn on the screen using functions in love.graphics. They also need to be updated in the update(dt) callback for you to see any changes in the particles emitted.',
    constructors = {
        'newParticleSystem'
    },
    functions = {
        {
            name = 'clone',
            description = 'Creates an identical copy of the ParticleSystem in the stopped state.\n\nCloned ParticleSystem inherit all the set-able state of the original ParticleSystem, but they are initialized stopped.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ParticleSystem',
                            name = 'particlesystem',
                            description = 'The new identical copy of this ParticleSystem.'
                        }
                    }
                }
            }
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
                            description = 'The amount of particles to emit. The number of emitted particles will be truncated if the particle system\'s max buffer size is reached.'
                        }
                    }
                }
            }
        },
        {
            name = 'getCount',
            description = 'Gets the amount of particles that are currently in the system.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The current number of live particles.'
                        }
                    }
                }
            }
        },
        {
            name = 'getAreaSpread',
            description = 'Gets the area-based spawn parameters for the particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'AreaSpreadDistribution',
                            name = 'distribution',
                            description = 'The type of distribution for new particles.'
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution.'
                        }
                    }
                }
            }
        },
        {
            name = 'getBufferSize',
            description = 'Gets the size of the buffer (the max allowed amount of particles in the system).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'buffer',
                            description = 'The buffer size.'
                        }
                    }
                }
            }
        },
        {
            name = 'getColors',
            description = 'Gets a series of colors to apply to the particle sprite. The particle system will interpolate between each color evenly over the particle\'s lifetime. Color modulation needs to be activated for this function to have any effect.\n\nArguments are passed in groups of four, representing the components of the desired RGBA value. At least one color must be specified. A maximum of eight may be used.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'r1',
                            description = 'First color, red component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'g1',
                            description = 'First color, green component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'b1',
                            description = 'First color, blue component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'a1',
                            description = 'First color, alpha component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'r2',
                            description = 'Second color, red component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'g2',
                            description = 'Second color, green component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'b2',
                            description = 'Second color, blue component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'a2',
                            description = 'Second color, alpha component (0-255).'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Etc.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDirection',
            description = 'Gets the direction the particles will be emitted in.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'direction',
                            description = 'The direction of the particles (in radians).'
                        }
                    }
                }
            }
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
                            description = 'The amount of particles per second.'
                        }
                    }
                }
            }
        },
        {
            name = 'getInsertMode',
            description = 'Gets the mode to use when the ParticleSystem adds new particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ParticleInsertMode',
                            name = 'mode',
                            description = 'The mode to use when the ParticleSystem adds new particles.'
                        }
                    }
                }
            }
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
                            description = 'The minimum acceleration along the x axis.'
                        },
                        {
                            type = 'number',
                            name = 'ymin',
                            description = 'The minimum acceleration along the y axis.'
                        },
                        {
                            type = 'number',
                            name = 'xmax',
                            description = 'The maximum acceleration along the x axis.'
                        },
                        {
                            type = 'number',
                            name = 'ymax',
                            description = 'The maximum acceleration along the y axis.'
                        }
                    }
                }
            }
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
                            description = 'The minimum amount of linear damping applied to particles.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum amount of linear damping applied to particles.'
                        },
                    }
                }
            }
        },
        {
            name = 'getEmitterLifetime',
            description = 'Gets how long the particle system should emit particles (if -1 then it emits particles forever).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'life',
                            description = 'The lifetime of the emitter (in seconds).'
                        }
                    }
                }
            }
        },
        {
            name = 'getOffset',
            description = 'Get the offget position which the particle sprite is rotated around. If this function is not used, the particles rotate around their center.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x coordinate of the rotation offget.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y coordinate of the rotation offget.'
                        }
                    }
                }
            }
        },
        {
            name = 'getParticleLifetime',
            description = 'Gets the life of the particles.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum life of the particles (seconds).'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum life of the particles (seconds).'
                        }
                    }
                }
            }
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
                            description = 'A table containing the Quads used.'
                        }
                    }
                }
            }
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
                            description = 'Position along x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Position along y-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'getRadialAcceleration',
            description = 'Get the radial acceleration (away from the emitter).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum acceleration.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum acceleration.'
                        }
                    }
                }
            }
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
                            description = 'The minimum initial angle (radians).'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum initial angle (radians).'
                        }
                    }
                }
            }
        },
        {
            name = 'getSizes',
            description = 'Gets a series of sizes by which to scale a particle sprite. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle\'s lifetime.\n\nAt least one size must be specified. A maximum of eight may be used.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'size1',
                            description = 'The first size.'
                        },
                        {
                            type = 'number',
                            name = 'size2',
                            description = 'The second size.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Etc.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSizeVariation',
            description = 'Gets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).'
                        }
                    }
                }
            }
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
                            description = 'The minimum linear speed of the particles.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum linear speed of the particles.'
                        }
                    }
                }
            }
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
                            description = 'The minimum spin (radians per second).'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum spin (radians per second).'
                        }
                    }
                }
            }
        },
        {
            name = 'getSpinVariation',
            description = 'Gets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).'
                        }
                    }
                }
            }
        },
        {
            name = 'getSpread',
            description = 'Gets the amount of spread for the system.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'spread',
                            description = 'The amount of spread (radians).'
                        }
                    }
                }
            }
        },
        {
            name = 'getTexture',
            description = 'Gets the Image or Canvas which is to be emitted.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'An Image or Canvas to use for the particle.'
                        }
                    }
                }
            }
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
                            description = 'The minimum acceleration.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum acceleration.'
                        }
                    }
                }
            }
        },
        {
            name = 'hasRelativeRotation',
            description = 'Gets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'True if relative particle rotation is enabled, false if it\'s disabled.'
                        }
                    }
                }
            }
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
                            description = 'True if system is active, false otherwise.'
                        }
                    }
                }
            }
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
                            description = 'True if system is paused, false otherwise.'
                        }
                    }
                }
            }
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
                            description = 'True if system is stopped, false otherwise.'
                        }
                    }
                }
            }
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
                            description = 'Position along x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Position along y-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'pause',
            description = 'Pauses the particle emitter.',
            variants = {
                {}
            }
        },
        {
            name = 'reset',
            description = 'Resets the particle emitter, removing any existing particles and resetting the lifetime counter.',
            variants = {
                {}
            }
        },
        {
            name = 'setAreaSpread',
            description = 'Sets area-based spawn parameters for the particles. Newly created particles will spawn in an area around the emitter based on the parameters to this function.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'AreaSpreadDistribution',
                            name = 'distribution',
                            description = 'The type of distribution for new particles.'
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution.'
                        }
                    }
                }
            }
        },
        {
            name = 'setBufferSize',
            description = 'Sets the size of the buffer (the max allowed amount of particles in the system).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'buffer',
                            description = 'The buffer size.'
                        }
                    }
                }
            }
        },
        {
            name = 'setColors',
            description = 'Sets a series of colors to apply to the particle sprite. The particle system will interpolate between each color evenly over the particle\'s lifetime. Color modulation needs to be activated for this function to have any effect.\n\nArguments are passed in groups of four, representing the components of the desired RGBA value. At least one color must be specified. A maximum of eight may be used.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'r1',
                            description = 'First color, red component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'g1',
                            description = 'First color, green component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'b1',
                            description = 'First color, blue component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'a1',
                            description = 'First color, alpha component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'r2',
                            description = 'Second color, red component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'g2',
                            description = 'Second color, green component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'b2',
                            description = 'Second color, blue component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'a2',
                            description = 'Second color, alpha component (0-255).'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Etc.'
                        }
                    }
                }
            }
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
                            description = 'The direction of the particles (in radians).'
                        }
                    }
                }
            }
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
                            description = 'The amount of particles per second.'
                        }
                    }
                }
            }
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
                            description = 'The lifetime of the emitter (in seconds).'
                        }
                    }
                }
            }
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
                            description = 'The mode to use when the ParticleSystem adds new particles.'
                        }
                    }
                }
            }
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
                            description = 'The minimum acceleration along the x axis.'
                        },
                        {
                            type = 'number',
                            name = 'ymin',
                            default = '0',
                            description = 'The minimum acceleration along the y axis.'
                        },
                        {
                            type = 'number',
                            name = 'xmax',
                            default = 'xmin',
                            description = 'The maximum acceleration along the x axis.'
                        },
                        {
                            type = 'number',
                            name = 'ymax',
                            default = 'ymax',
                            description = 'The maximum acceleration along the y axis.'
                        }
                    }
                }
            }
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
                            description = 'The minimum amount of linear damping applied to particles.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum amount of linear damping applied to particles.'
                        },
                    }
                }
            }
        },
        {
            name = 'setOffset',
            description = 'Set the offset position which the particle sprite is rotated around. If this function is not used, the particles rotate around their center.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x coordinate of the rotation offset.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y coordinate of the rotation offset.'
                        }
                    }
                }
            }
        },
        {
            name = 'setParticleLifetime',
            description = 'Sets the life of the particles.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum life of the particles (seconds).'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum life of the particles (seconds).'
                        }
                    }
                }
            }
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
                            description = 'Position along x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Position along y-axis.'
                        }
                    }
                }
            }
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
                            description = 'The first Quad to use.'
                        },
                        {
                            type = 'Quad',
                            name = 'quad2',
                            description = 'The second Quad to use.'
                        },
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'quads',
                            description = 'A table containing the Quads to use.'
                        }
                    }
                }
            }
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
                            description = 'The minimum acceleration.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum acceleration.'
                        }
                    }
                }
            }
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
                            description = 'True to enable relative particle rotation, false to disable it.'
                        }
                    }
                }
            }
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
                            description = 'The minimum initial angle (radians).'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum initial angle (radians).'
                        }
                    }
                }
            }
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
                            description = 'The first size.'
                        },
                        {
                            type = 'number',
                            name = 'size2',
                            description = 'The second size.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Etc.'
                        }
                    }
                }
            }
        },
        {
            name = 'setSizeVariation',
            description = 'Sets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).'
                        }
                    }
                }
            }
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
                            description = 'The minimum linear speed of the particles.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum linear speed of the particles.'
                        }
                    }
                }
            }
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
                            description = 'The minimum spin (radians per second).'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum spin (radians per second).'
                        }
                    }
                }
            }
        },
        {
            name = 'setSpinVariation',
            description = 'Sets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'variation',
                            description = 'The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).'
                        }
                    }
                }
            }
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
                            description = 'The amount of spread (radians).'
                        }
                    }
                }
            }
        },
        {
            name = 'setTexture',
            description = 'Sets the Image or Canvas which is to be emitted.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'An Image or Canvas to use for the particle.'
                        }
                    }
                }
            }
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
                            description = 'The minimum acceleration.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            default = 'min',
                            description = 'The maximum acceleration.'
                        }
                    }
                }
            }
        },
        {
            name = 'start',
            description = 'Starts the particle emitter.',
            variants = {
                {}
            }
        },
        {
            name = 'stop',
            description = 'Stops the particle emitter, resetting the lifetime counter.',
            variants = {
                {}
            }
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
                            description = 'The time (seconds) since last frame.'
                        }
                    }
                }
            }
        }
    },
    parenttype = 'Drawable',
    supertypes = {
        'Drawable',
        'Object'
    }
}
