return {
    name = 'audio',
    description = 'Provides an interface to create noise with the user\'s speakers.',
    types = {
        {
            name = 'Source',
            description = 'A Source represents audio you can play back. You can do interesting things with Sources, like set the volume, pitch, and its position relative to the listener.',
            constructors = {
                'newSource'
            },
            functions = {
                {
                    name = 'clone',
                    description = 'Creates an identical copy of the Source in the stopped state.\n\nStatic Sources will use significantly less memory and take much less time to be created if Source:clone is used to create them instead of love.audio.newSource, so this method should be preferred when making multiple Sources which play the same sound.\n\nCloned Sources inherit all the set-able state of the original Source, but they are initialized stopped.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'Source',
                                    name = 'source',
                                    description = 'The new identical copy of this Source.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getAttenuationDistances',
                    description = 'Returns the reference and maximum distance of the source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'ref',
                                    description = 'The reference distance.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum distance.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getChannels',
                    description = 'Gets the number of channels in the Source. Only 1-channel (mono) Sources can use directional and positional effects.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'channels',
                                    description = '1 for mono, 2 for stereo.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getCone',
                    description = 'Gets the Source\'s directional volume cones. Together with Source:setDirection, the cone angles allow for the Source\'s volume to vary depending on its direction.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'innerAngle',
                                    description = 'The inner angle from the Source\'s direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle.'
                                },
                                {
                                    type = 'number',
                                    name = 'outerAngle',
                                    description = 'The outer angle from the Source\'s direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles.'
                                },
                                {
                                    type = 'number',
                                    name = 'outerVolume',
                                    description = 'The Source\'s volume when the listener is outside both the inner and outer cone angles.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDirection',
                    description = 'Gets the direction of the Source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The X part of the direction vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The Y part of the direction vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'z',
                                    description = 'The Z part of the direction vector.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPitch',
                    description = 'Gets the current pitch of the Source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'pitch',
                                    description = 'The pitch, where 1.0 is normal.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPosition',
                    description = 'Gets the position of the Source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The X position of the Source.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The Y position of the Source.'
                                },
                                {
                                    type = 'number',
                                    name = 'z',
                                    description = 'The Z position of the Source.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRolloff',
                    description = 'Returns the rolloff factor of the source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'rolloff',
                                    description = 'The rolloff factor.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getVelocity',
                    description = 'Gets the velocity of the Source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The X part of the velocity vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The Y part of the velocity vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'z',
                                    description = 'The Z part of the velocity vector.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getVolume',
                    description = 'Gets the current volume of the Source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'volume',
                                    description = 'The volume of the Source, where 1.0 is normal volume.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getVolumeLimits',
                    description = 'Returns the volume limits of the source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum volume.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum volume.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isLooping',
                    description = 'Returns whether the Source will loop.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'loop',
                                    description = 'True if the Source will loop, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isPaused',
                    description = 'Returns whether the Source is paused.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'paused',
                                    description = 'True if the Source is paused, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isPlaying',
                    description = 'Returns whether the Source is playing.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'playing',
                                    description = 'True if the Source is playing, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isStatic',
                    description = 'Returns whether the Source is static.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'static',
                                    description = 'True if the Source is static, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isStopped',
                    description = 'Returns whether the Source is stopped.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'stopped',
                                    description = 'True if the Source is stopped, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'pause',
                    description = 'Pauses the Source.',
                    variants = {
                        {}
                    }
                },
                {
                    name = 'play',
                    description = 'Starts playing the Source.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'True if the Source started playing successfully, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'resume',
                    description = 'Resumes a paused Source.',
                    variants = {
                        {}
                    }
                },
                {
                    name = 'rewind',
                    description = 'Rewinds a Source.',
                    variants = {
                        {}
                    }
                },
                {
                    name = 'seek',
                    description = 'Sets the playing position of the Source.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'position',
                                    description = 'The position to seek to.'
                                },
                                {
                                    type = 'TimeUnit',
                                    name = 'unit',
                                    default = '"seconds"',
                                    description = 'The unit of the position value.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDirection',
                    description = 'Sets the direction vector of the Source. A zero vector makes the source non-directional.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The X part of the direction vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The Y part of the direction vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'z',
                                    description = 'The Z part of the direction vector.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setAttenuationDistances',
                    description = 'Sets the reference and maximum distance of the source.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'ref',
                                    description = 'The new reference distance.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The new maximum distance.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setCone',
                    description = 'Sets the Source\'s directional volume cones. Together with Source:setDirection, the cone angles allow for the Source\'s volume to vary depending on its direction.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'innerAngle',
                                    description = 'The inner angle from the Source\'s direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle.'
                                },
                                {
                                    type = 'number',
                                    name = 'outerAngle',
                                    description = 'The outer angle from the Source\'s direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles.'
                                },
                                {
                                    type = 'number',
                                    name = 'outerVolume',
                                    default = '0',
                                    description = 'The Source\'s volume when the listener is outside both the inner and outer cone angles.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLooping',
                    description = 'Sets whether the Source should loop.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'loop',
                                    description = 'True if the source should loop, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setPitch',
                    description = 'Sets the pitch of the Source.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'pitch',
                                    description = 'Calculated with regard to 1 being the base pitch. Each reduction by 50 percent equals a pitch shift of -12 semitones (one octave reduction). Each doubling equals a pitch shift of 12 semitones (one octave increase). Zero is not a legal value.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setPosition',
                    description = 'Sets the position of the Source.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The X position of the Source.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The Y position of the Source.'
                                },
                                {
                                    type = 'number',
                                    name = 'z',
                                    description = 'The Z position of the Source.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRolloff',
                    description = 'Sets the rolloff factor.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'rolloff',
                                    description = 'The new rolloff factor.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setVelocity',
                    description = 'Sets the velocity of the Source.\n\nThis does not change the position of the Source, but is used to calculate the doppler effect.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The X part of the velocity vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The Y part of the velocity vector.'
                                },
                                {
                                    type = 'number',
                                    name = 'z',
                                    description = 'The Z part of the velocity vector.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setVolume',
                    description = 'Sets the volume of the Source.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'volume',
                                    description = 'The volume of the Source, where 1.0 is normal volume.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setVolumeLimits',
                    description = 'Sets the volume limits of the source. The limits have to be numbers from 0 to 1.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum volume.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum volume.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'stop',
                    description = 'Stops a Source.',
                    variants = {
                        {}
                    }
                },
                {
                    name = 'tell',
                    description = 'Gets the currently playing position of the Source.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'TimeUnit',
                                    name = 'unit',
                                    default = '"seconds"',
                                    description = 'The type of unit for the return value.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'position',
                                    description = 'The currently playing position of the Source.'
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
            name = 'getDistanceModel',
            description = 'Returns the distance attenuation model.',
            variants = {
                {
                    returns = {
                        {
                            type = 'DistanceModel',
                            name = 'model',
                            description = 'The current distance model. The default is \'inverse clamped\'.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDopplerScale',
            description = 'Gets the current global scale factor for velocity-based doppler effects.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The current doppler scale factor.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSourceCount',
            description = 'Returns the number of sources which are currently playing or paused.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'numSources',
                            description = 'The number of sources which are currently playing or paused.'
                        }
                    }
                }
            }
        },
        {
            name = 'getOrientation',
            description = 'Returns the orientation of the listener.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'fx',
                            description = 'The X component of the forward vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'fy',
                            description = 'The Y component of the forward vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'fz',
                            description = 'The Z component of the forward vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'ux',
                            description = 'The X component of the up vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'uy',
                            description = 'The Y component of the up vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'uz',
                            description = 'The Z component of the up vector of the listener orientation.'
                        }
                    }
                }
            }
        },
        {
            name = 'getPosition',
            description = 'Returns the position of the listener.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X position of the listener.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y position of the listener.'
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z position of the listener.'
                        }
                    }
                }
            }
        },
        {
            name = 'getVelocity',
            description = 'Returns the velocity of the listener.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X velocity of the listener.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y velocity of the listener.'
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z velocity of the listener.'
                        }
                    }
                }
            }
        },
        {
            name = 'getVolume',
            description = 'Returns the master volume.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'volume',
                            description = 'The current master volume.'
                        }
                    }
                }
            }
        },
        {
            name = 'newSource',
            description = 'Creates a new Source from a file or SoundData. Sources created from SoundData are always static.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to create a Source from.'
                        },
                        {
                            type = 'SourceType',
                            name = 'type',
                            default = '"stream"',
                            description = 'Streaming or static source.'
                        }
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'A File pointing to an audio file.'
                        },
                        {
                            type = 'SourceType',
                            name = 'type',
                            default = '"stream"',
                            description = 'Streaming or static source.'
                        }
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'The FileData to create a Source from.'
                        }
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio. The SourceType of the returned audio is "static".'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'SoundData',
                            name = 'soundData',
                            description = 'The SoundData to create a Source from.'
                        }
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio. The SourceType of the returned audio is "static".'
                        }
                    }
                }
            }
        },
        {
            name = 'pause',
            description = 'Pauses all audio',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The source on which to pause the playback.'
                        }
                    }
                }
            }
        },
        {
            name = 'play',
            description = 'Plays the specified Source.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The Source to play.'
                        }
                    }
                }
            }
        },
        {
            name = 'resume',
            description = 'Resumes all audio',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The source on which to resume the playback.'
                        }
                    }
                }
            }
        },
        {
            name = 'rewind',
            description = 'Rewinds all playing audio.',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The source to rewind.'
                        }
                    }
                }
            }
        },
        {
            name = 'setDistanceModel',
            description = 'Sets the distance attenuation model.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'DistanceModel',
                            name = 'model',
                            description = 'The new distance model.'
                        }
                    }
                }
            }
        },
        {
            name = 'setDopplerScale',
            description = 'Sets a global scale factor for velocity-based doppler effects. The default scale value is 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The new doppler scale factor. The scale must be greater than 0.'
                        },
                    }
                }
            }
        },
        {
            name = 'setOrientation',
            description = 'Sets the orientation of the listener.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'fx',
                            description = 'The X component of the forward vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'fy',
                            description = 'The Y component of the forward vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'fz',
                            description = 'The Z component of the forward vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'ux',
                            description = 'The X component of the up vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'uy',
                            description = 'The Y component of the up vector of the listener orientation.'
                        },
                        {
                            type = 'number',
                            name = 'uz',
                            description = 'The Z component of the up vector of the listener orientation.'
                        }
                    }
                }
            }
        },
        {
            name = 'setPosition',
            description = 'Sets the position of the listener, which determines how sounds play.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X position of the listener.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y position of the listener.'
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z position of the listener.'
                        }
                    }
                }
            }
        },
        {
            name = 'setVelocity',
            description = 'Sets the velocity of the listener.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X velocity of the listener.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y velocity of the listener.'
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z velocity of the listener.'
                        }
                    }
                }
            }
        },
        {
            name = 'setVolume',
            description = 'Sets the master volume.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'volume',
                            description = '1.0f is max and 0.0f is off.'
                        }
                    }
                }
            }
        },
        {
            name = 'stop',
            description = 'Stops all playing audio.',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The source on which to stop the playback.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        {
            name = 'DistanceModel',
            description = 'The different distance models.',
            constants = {
                {
                    name = 'none',
                    description = 'Sources do not get attenuated.'
                },
                {
                    name = 'inverse',
                    description = 'Inverse distance attenuation.'
                },
                {
                    name = 'inverse clamped',
                    description = 'Inverse distance attenuation. Gain is clamped.'
                },
                {
                    name = 'linear',
                    description = 'Linear attenuation.'
                },
                {
                    name = 'linear clamped',
                    description = 'Linear attenuation. Gain is clamped.'
                },
                {
                    name = 'exponent',
                    description = 'Exponential attenuation.'
                },
                {
                    name = 'exponent clamped',
                    description = 'Exponential attenuation. Gain is clamped.'
                }
            }
        },
        {
            name = 'SourceType',
            description = 'Types of audio sources.',
            constants = {
                {
                    name = 'static',
                    description = 'Decode the entire sound at once.'
                },
                {
                    name = 'stream',
                    description = 'Stream the sound; decode it gradually.'
                }
            }
        },
        {
            name = 'TimeUnit',
            description = 'Units that represent time.',
            constants = {
                {
                    name = 'seconds',
                    description = 'Regular seconds.'
                },
                {
                    name = 'samples',
                    description = 'Audio samples.'
                }
            }
        }
    }
};