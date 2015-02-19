return {
    functions = {
        {
            name = 'getVersion',
            description = 'Gets the current running version of LÖVE.',
            functions = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'major',
                            description = 'The major version of LÖVE, e.g. 0 for version 0.9.1.'
                        },
                        {
                            type = 'number',
                            name = 'minor',
                            description = 'The minor version of LÖVE, e.g. 9 for version 0.9.1.'
                        },
                        {
                            type = 'number',
                            name = 'revision',
                            description = 'The revision version of LÖVE, e.g. 1 for version 0.9.1.'
                        },
                        {
                            type = 'string',
                            name = 'codename',
                            description = 'The codename of the current version.'
                        }
                    }
                }
            }
        }
    },
    modules = {
        {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'play',
                            description = 'Starts playing the Source.',
                            functions = {
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
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'rewind',
                            description = 'Rewinds a Source.',
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'seek',
                            description = 'Sets the playing position of the Source.',
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'tell',
                            description = 'Gets the currently playing position of the Source.',
                            functions = {
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
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'DistanceModel',
                                    name = 'model',
                                    description = 'The current distance model.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSourceCount',
                    description = 'Returns the number of sources which are currently playing or paused.',
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    name = 'setOrientation',
                    description = 'Sets the orientation of the listener.',
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    functions = {
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
        },
        {
            name = 'event',
            description = 'Manages events, like keypresses.',
            functions = {
                {
                    name = 'clear',
                    description = 'Clears the event queue.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'poll',
                    description = 'Returns an iterator for messages in the event queue.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'function',
                                    name = 'i',
                                    description = 'Iterator function usable in a for loop.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'pump',
                    description = 'Pump events into the event queue. This is a low-level function, and is usually not called by the user, but by love.run. Note that this does need to be called for any OS to think you\'re still running, and if you want to handle OS-generated events at all (think callbacks). love.event.pump can only be called from the main thread, but afterwards, the rest of love.event can be used from any other thread.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'push',
                    description = 'Adds an event to the event queue.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'Event',
                                    name = 'e',
                                    description = 'The name of the event.'
                                },
                                {
                                    type = 'mixed',
                                    name = 'a',
                                    default = nil,
                                    description = 'First event argument.'
                                },
                                {
                                    type = 'mixed',
                                    name = 'b',
                                    default = nil,
                                    description = 'Second event argument.'
                                },
                                {
                                    type = 'mixed',
                                    name = 'c',
                                    default = nil,
                                    description = 'Third event argument.'
                                },
                                {
                                    type = 'mixed',
                                    name = 'd',
                                    default = nil,
                                    description = 'Fourth event argument.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'quit',
                    description = 'Adds the quit event to the queue.\n\nThe quit event is a signal for the event handler to close LÖVE. It\'s possible to abort the exit process with the love.quit callback.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'wait',
                    description = 'Like love.event.poll but blocks until there is an event in the queue.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Event',
                                    name = 'e',
                                    description = 'The type of event.'
                                },
                                {
                                    type = 'mixed',
                                    name = 'a',
                                    description = 'First event argument.'
                                },
                                {
                                    type = 'mixed',
                                    name = 'b',
                                    description = 'Second event argument.'
                                },
                                {
                                    type = 'mixed',
                                    name = 'c',
                                    description = 'Third event argument.'
                                },
                                {
                                    type = 'mixed',
                                    name = 'd',
                                    description = 'Fourth event argument.'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'Event',
                    constants = {
                        {
                            name = 'focus',
                            description = 'Window focus gained or lost'
                        },
                        {
                            name = 'joystickpressed',
                            description = 'Joystick pressed'
                        },
                        {
                            name = 'joystickreleased',
                            description = 'Joystick released'
                        },
                        {
                            name = 'keypressed',
                            description = 'Key pressed'
                        },
                        {
                            name = 'keyreleased',
                            description = 'Key released'
                        },
                        {
                            name = 'mousepressed',
                            description = 'Mouse pressed'
                        },
                        {
                            name = 'mousereleased',
                            description = 'Mouse released'
                        },
                        {
                            name = 'quit',
                            description = 'Quit'
                        },
                    }
                }
            }
        },
        {
            name = 'filesystem',
            description = 'Provides an interface to the user\'s filesystem.',
            types = {
                {
                    name = 'File',
                    description = 'Represents a file on the filesystem.',
                    constructors = {
                        'newFile'
                    },
                    functions = {
                        {
                            name = 'close',
                            description = 'Closes a file.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'success',
                                            description = 'Whether closing was successful.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'eof',
                            description = 'If the end-of-file has been reached',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'eof',
                                            description = 'Whether EOF has been reached.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'flush',
                            description = 'Flushes any buffered written data in the file to the disk.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'success',
                                            description = 'Whether the file successfully flushed any buffered data to the disk.'
                                        },
                                        {
                                            type = 'string',
                                            name = 'err',
                                            description = 'The error string, if an error occurred and the file could not be flushed.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getBuffer',
                            description = 'Gets the buffer mode of a file.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'BufferMode',
                                            name = 'mode',
                                            description = 'The current buffer mode of the file.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'size',
                                            description = 'The maximum size in bytes of the file\'s buffer.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getMode',
                            description = 'Gets the FileMode the file has been opened with.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'FileMode',
                                            name = 'mode',
                                            description = 'The mode this file has been opened with.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getSize',
                            description = 'Returns the file size.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'size',
                                            description = 'The file size'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'isOpen',
                            description = 'Gets whether the file is open.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'open',
                                            description = 'True if the file is currently open, false otherwise.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'lines',
                            description = 'Iterate over all the lines in a file',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'function',
                                            name = 'iterator',
                                            description = 'The iterator (can be used in for loops)'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'open',
                            description = 'Open the file for write, read or append.\n\nIf you are getting the error message "Could not set write directory", try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'FileMode',
                                            name = 'mode',
                                            description = 'The mode to open the file in.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'ok',
                                            description = 'True on success, false otherwise.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'read',
                            description = 'Read a number of bytes from a file.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'bytes',
                                            default = 'all',
                                            description = 'The number of bytes to read'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'string',
                                            name = 'contents',
                                            description = 'The contents of the read bytes.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'size',
                                            description = 'How many bytes have been read.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'seek',
                            description = 'Seek to a position in a file.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'position',
                                            description = 'The position to seek to.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'success',
                                            description = 'Whether the operation was successful.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setBuffer',
                            description = 'Sets the buffer mode for a file opened for writing or appending. Files with buffering enabled will not write data to the disk until the buffer size limit is reached, depending on the buffer mode.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'BufferMode',
                                            name = 'mode',
                                            description = 'The buffer mode to use.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'size',
                                            description = 'The maximum size in bytes of the file\'s buffer.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'success',
                                            description = 'Whether the buffer mode was successfully set.'
                                        },
                                        {
                                            type = 'string',
                                            name = 'errorstr',
                                            description = 'The error string, if the buffer mode could not be set and an error occurred.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'write',
                            description = 'Write data to a file.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'data',
                                            description = 'The data to write.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'size',
                                            default = 'all',
                                            description = 'How many bytes to write.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'success',
                                            description = 'Whether the operation was successful.'
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
                    name = 'FileData',
                    description = 'Data representing the contents of a file.',
                    functions = {
                        {
                            name = 'getExtension',
                            description = 'Gets the extension of the FileData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'string',
                                            name = 'ext',
                                            description = 'The extension of the file the FileData represents.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getFilename',
                            description = 'Gets the filename of the FileData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'string',
                                            name = 'name',
                                            description = 'The name of the file the FileData represents.'
                                        }
                                    }
                                }
                            }
                        }
                    },
                    supertypes = {
                        'Data',
                        'Object'
                    }
                }
            },
            functions = {
                {
                    name = 'append',
                    description = 'Append data to an existing file.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name (and path) of the file.'
                                },
                                {
                                    type = 'string',
                                    name = 'data',
                                    description = 'The data that should be written to the file'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = 'all',
                                    description = 'How many bytes to write.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'True if the operation was successful, or nil if there was an error.'
                                },
                                {
                                    type = 'string',
                                    name = 'errormsg',
                                    description = 'The error message on failure.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'createDirectory',
                    description = 'Creates a directory.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The directory to create.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'ok',
                                    description = 'True if the directory was created, false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'exists',
                    description = 'Check whether a file or directory exists.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The path to a potential file or directory.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'e',
                                    description = 'True if there is a file or directory with the specified name. False otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getAppdataDirectory',
                    description = 'Returns the application data directory (could be the same as getUserDirectory)',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'path',
                                    description = 'The path of the application data directory.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDirectoryItems',
                    description = 'Returns a table with the names of files and subdirectories in the specified path. The table is not sorted in any way; the order is undefined.\n\nIf the path passed to the function exists in the game and the save directory, it will list the files and directories from both places.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'dir',
                                    description = 'The directory.'
                                }
                            },
                            returns = {
                                {
                                    type = 'table',
                                    name = 'items',
                                    description = 'A sequence with the names of all files and subdirectories as strings.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'dir',
                                    description = 'The directory.'
                                },
                                {
                                    type = 'function',
                                    name = 'callback',
                                    description = 'A function which is called for each file and folder in the directory. The filename is passed to the function as an argument.'
                                }
                            },
                            returns = {
                                {
                                    type = 'table',
                                    name = 'items',
                                    description = 'A sequence with the names of all files and subdirectories as strings.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getIdentity',
                    description = 'Gets the write directory name for your game. Note that this only returns the name of the folder to store your files in, not the full location.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The identity that is used as write directory.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLastModified',
                    description = 'Gets the last modification time of a file.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The path and name to a file.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'modtime',
                                    description = 'The last modification time in seconds since the unix epoch or nil on failure.'
                                },
                                {
                                    type = 'string',
                                    name = 'errormsg',
                                    description = 'The error message on failure.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSaveDirectory',
                    description = 'Gets the full path to the designated save directory. This can be useful if you want to use the standard io library (or something else) to read or write in the save directory.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'path',
                                    description = 'The absolute path to the save directory.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSize',
                    description = 'Gets the size in bytes of a file.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The path and name to a file.'
                                },
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The size in bytes of the file, or nil on failure.'
                                },
                                {
                                    type = 'string',
                                    name = 'errormsg',
                                    description = 'The error message on failure.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getUserDirectory',
                    description = 'Returns the path of the user\'s directory.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'path',
                                    description = 'The path of the user\'s directory.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWorkingDirectory',
                    description = 'Gets the current working directory.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'path',
                                    description = 'The current working directory.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isDirectory',
                    description = 'Check whether something is a directory.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'path',
                                    description = 'The path to a potential directory.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'is_dir',
                                    description = 'True if there is a directory with the specified name. False otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isFile',
                    description = 'Check whether something is a file.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'path',
                                    description = 'The path to a potential file.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'is_file',
                                    description = 'True if there is a file with the specified name. False otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isFused',
                    description = 'Gets whether the game is in fused mode or not.\n\nIf a game is in fused mode, its save directory will be directly in the Appdata directory instead of Appdata/LOVE/. The game will also be able to load C Lua dynamic libraries which are located in the save directory.\n\nA game is in fused mode if the source .love has been fused to the executable (see Game Distribution), or if "--fused" has been given as a command-line argument when starting the game.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'fused',
                                    description = 'True if the game is in fused mode, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'lines',
                    description = 'Iterate over the lines in a file.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name (and path) of the file.'
                                }
                            },
                            returns = {
                                {
                                    type = 'function',
                                    name = 'iterator',
                                    description = 'A function that iterates over all the lines in the file.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'load',
                    description = 'Load a file (but not run it).',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name (and path) of the file.'
                                }
                            },
                            returns = {
                                {
                                    type = 'function',
                                    name = 'chunk',
                                    description = 'The loaded chunk.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newFile',
                    description = 'Creates a new File object. It needs to be opened before it can be accessed.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The filename of the file to read.'
                                },
                                {
                                    type = 'FileMode',
                                    name = 'mode',
                                    default = 'c',
                                    description = 'The mode to open the file in.'
                                }
                            },
                            returns = {
                                {
                                    type = 'File',
                                    name = 'file',
                                    description = 'The new File object, or nil if an error occurred.'
                                },
                                {
                                    type = 'string',
                                    name = 'errorstr',
                                    description = 'The error string if an error occurred.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newFileData',
                    description = 'Creates a new FileData object.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'contents',
                                    description = 'The contents of the file.'
                                },
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the file.'
                                },
                                {
                                    type = 'FileDecoder',
                                    name = 'decoder',
                                    default = '"file"',
                                    description = 'The method to use when decoding the contents.'
                                }
                            },
                            returns = {
                                {
                                    type = 'FileData',
                                    name = 'data',
                                    description = 'Your new FileData.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'read',
                    description = 'Read the contents of a file.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name (and path) of the file.'
                                },
                                {
                                    type = 'number',
                                    name = 'bytes',
                                    default = 'all',
                                    description = 'How many bytes to read.'
                                }
                            },
                            returns = {
                                {
                                    type = 'string',
                                    name = 'contents',
                                    description = 'The file contents.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'How many bytes have been read.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'remove',
                    description = 'Removes a file or directory.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The file or directory to remove.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'ok',
                                    description = 'True if the file/directory was removed, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setIdentity',
                    description = 'Sets the write directory for your game. Note that you can only set the name of the folder to store your files in, not the location.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The new identity that will be used as write directory.'
                                },
                                {
                                    type = 'SearchOrder',
                                    name = 'searchorder',
                                    default = '"first"',
                                    description = 'Whether love.filesystem will look for files in the write directory before or after looking in the main game source.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'write',
                    description = 'Write data to a file.\n\nIf you are getting the error message "Could not set write directory", try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name (and path) of the file.'
                                },
                                {
                                    type = 'string',
                                    name = 'data',
                                    description = 'The data that should be written to the file'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = 'all',
                                    description = 'How many bytes to write.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'If the operation was successful'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'BufferMode',
                    description = 'Buffer modes for File objects.',
                    constants = {
                        {
                            name = 'none',
                            description = 'No buffering. The result of write and append operations appears immediately.'
                        },
                        {
                            name = 'line',
                            description = 'Line buffering. Write and append operations are buffered until a newline is output or the buffer size limit is reached.'
                        },
                        {
                            name = 'full',
                            description = 'Full buffering. Write and append operations are always buffered until the buffer size limit is reached.'
                        }
                    }
                },
                {
                    name = 'FileDecoder',
                    description = 'How to decode a given FileData.',
                    constants = {
                        {
                            name = 'file',
                            description = 'The data is unencoded.'
                        },
                        {
                            name = 'base64',
                            description = 'The data is base64-encoded.'
                        }
                    }
                },
                {
                    name = 'FileMode',
                    description = 'The different modes you can open a file in.',
                    constants = {
                        {
                            name = 'r',
                            description = 'Open a file for read.'
                        },
                        {
                            name = 'w',
                            description = 'Open a file for write.'
                        },
                        {
                            name = 'a',
                            description = 'Open a file for append.'
                        },
                        {
                            name = 'c',
                            description = 'Do not open a file (represents a closed file.)'
                        }
                    }
                }
            }
        },
        {
            name = 'graphics',
            description = 'The primary responsibility for the love.graphics module is the drawing of lines, shapes, text, Images and other Drawable objects onto the screen. Its secondary responsibilities include loading external files (including Images and Fonts) into memory, creating specialized objects (such as ParticleSystems or Framebuffers) and managing screen geometry.\n\nLÖVE\'s coordinate system is rooted in the upper-left corner of the screen, which is at location (0, 0). The x-axis is horizontal: larger values are further to the right. The y-axis is vertical: larger values are further towards the bottom.\n\nIn many cases, you draw images or shapes in terms of their upper-left corner (See the picture above).\n\nMany of the functions are used to manipulate the graphics coordinate system, which is essentially the way coordinates are mapped to the display. You can change the position, scale, and even rotation in this way.',
            types = {
                {
                    name = 'Canvas',
                    description = 'A Canvas is used for off-screen rendering. Think of it as an invisible screen that you can draw to, but that will not be visible until you draw it to the actual visible screen. It is also known as "render to texture".\n\nBy drawing things that do not change position often (such as background items) to the Canvas, and then drawing the entire Canvas instead of each item, you can reduce the number of draw operations performed each frame.',
                    constructors = {
                        'newCanvas'
                    },
                    functions = {
                        {
                            name = 'clear',
                            description = 'Clears content of a Canvas.\n\nWhen called without arguments, the Canvas will be cleared with color rgba = {0,0,0,0}, i.e. it will be fully transparent. If called with color parameters (be it numbers or a color table), the alpha component may be omitted in which case it defaults to 255 (fully opaque).',
                            functions = {
                                {
                                    {},
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'red',
                                            description = 'Red component of the clear color (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'green',
                                            description = 'Green component of the clear color (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'blue',
                                            description = 'Blue component of the clear color (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'alpha',
                                            default = '255',
                                            description = 'Alpha component of the clear color (0-255).'
                                        }
                                    },
                                    {
                                        arguments = {
                                            {
                                                type = 'table',
                                                name = 'rgba',
                                                description = 'A sequence with the red, green, blue and alpha values as numbers (alpha may be ommitted).'
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getDimensions',
                            description = 'Gets the width and height of the Canvas.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the Canvas, in pixels.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the Canvas, in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getFSAA',
                            description = 'Gets the number of antialiasing samples used when drawing to the Canvas.\n\nThis may be different than the number used as an argument to love.graphics.newCanvas if the system running LÖVE doesn\'t support that number.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'samples',
                                            description = 'The number of antialiasing samples used by the canvas when drawing to it.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getFilter',
                            description = 'Gets the filter mode of the Canvas.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'FilterMode',
                                            name = 'min',
                                            description = 'Filter mode used when minifying the canvas.'
                                        },
                                        {
                                            type = 'FilterMode',
                                            name = 'mag',
                                            description = 'Filter mode used when magnifying the canvas.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'anisotropy',
                                            description = 'Maximum amount of anisotropic filtering used.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getHeight',
                            description = 'Gets the height of the Canvas.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the Canvas, in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getImageData',
                            description = 'Returns the image data stored in the Canvas. Think of it as taking a screenshot of the hidden screen that is the Canvas.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'ImageData',
                                            name = 'data',
                                            description = 'The image data stored in the Canvas.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getPixel',
                            description = 'Gets the pixel at the specified position from a Canvas.\n\nValid x and y values start at 0 and go up to canvas width and height minus 1.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position of the pixel on the x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position of the pixel on the y-axis.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'r',
                                            description = 'The red component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            description = 'The green component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            description = 'The blue component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            description = 'The alpha component (0-255).'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getWidth',
                            description = 'Gets the width of the Canvas.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the Canvas, in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getWrap',
                            description = 'Gets the wrapping properties of a Canvas.\n\nThis function returns the currently set horizontal and vertical wrapping modes for the Canvas.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'WrapMode',
                                            name = 'horizontal',
                                            description = 'Horizontal wrapping mode of the Canvas.'
                                        },
                                        {
                                            type = 'WrapMode',
                                            name = 'vertical',
                                            description = 'Vertical wrapping mode of the Canvas.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'renderTo',
                            description = 'Render to the Canvas using a function.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'function',
                                            name = 'func',
                                            description = 'A function performing drawing operations.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setFilter',
                            description = 'Sets the filter of the Canvas.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'FilterMode',
                                            name = 'min',
                                            description = 'How to scale a canvas down.'
                                        },
                                        {
                                            type = 'FilterMode',
                                            name = 'mag',
                                            default = 'min',
                                            description = 'How to scale a canvas up.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'anisotropy',
                                            default = '1',
                                            description = 'Maximum amount of anisotropic filtering used.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setWrap',
                            description = 'Sets the wrapping properties of a Canvas.\n\nThis function sets the way the edges of a Canvas are treated if it is scaled or rotated. If the WrapMode is set to "clamp", the edge will not be interpolated. If set to "repeat", the edge will be interpolated with the pixels on the opposing side of the framebuffer.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'WrapMode',
                                            name = 'horizontal',
                                            description = 'Horizontal wrapping mode of the Canvas.'
                                        },
                                        {
                                            type = 'WrapMode',
                                            name = 'vertical',
                                            default = 'horizontal',
                                            description = 'Vertical wrapping mode of the Canvas.'
                                        }
                                    }
                                }
                            }
                        }
                    },
                    supertypes = {
                        'Drawable',
                        'Object'
                    }
                },
                {
                    name = 'Font',
                    description = 'Defines the shape of characters than can be drawn onto the screen.',
                    constructors = {
                        'newFont',
                        'newImageFont'
                    },
                    functions = {
                        {
                            name = 'getAscent',
                            description = 'Gets the ascent of the Font. The ascent spans the distance between the baseline and the top of the glyph that reaches farthest from the baseline.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'ascent',
                                            description = 'The ascent of the Font in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getBaseline',
                            description = 'Gets the baseline of the Font. Most scripts share the notion of a baseline: an imaginary horizontal line on which characters rest. In some scripts, parts of glyphs lie below the baseline.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'baseline',
                                            description = 'The baseline of the Font in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getDescent',
                            description = 'Gets the descent of the Font. The descent spans the distance between the baseline and the lowest descending glyph in a typeface.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'descent',
                                            description = 'The descent of the Font in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getFilter',
                            description = 'Gets the filter mode for a font.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'FilterMode',
                                            name = 'min',
                                            description = 'Filter mode used when minifying the font.'
                                        },
                                        {
                                            type = 'FilterMode',
                                            name = 'mag',
                                            description = 'Filter mode used when magnifying the font.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'anisotropy',
                                            description = 'Maximum amount of anisotropic filtering used.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getHeight',
                            description = 'Gets the height of the Font. The height of the font is the size including any spacing; the height which it will need.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the Font in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getLineHeight',
                            description = 'Gets the line height. This will be the value previously set by Font:setLineHeight, or 1.0 by default.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The current line height.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getWidth',
                            description = 'Determines the horizontal size a line of text needs. Does not support line-breaks.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'line',
                                            description = 'A line of text.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the line.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getWrap',
                            description = 'Returns how many lines text would be wrapped to. This function accounts for newlines correctly (i.e. \'\\n\')',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'text',
                                            description = 'The text that would be wrapped.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width to which text should be wrapped.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The actual width the wrapped text.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'lines',
                                            description = 'The number of lines text was wrapped to.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'hasGlyph',
                            description = 'Gets whether the font can render a particular character.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'character',
                                            description = 'A unicode character.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'hasglyph',
                                            description = 'Whether the font can render the glyph represented by the character.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'codepoint',
                                            description = 'A unicode codepoint number.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'hasglyph',
                                            description = 'Whether the font can render the glyph represented by the codepoint number.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setFilter',
                            description = 'Sets the filter mode for a font.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'FilterMode',
                                            name = 'min',
                                            description = 'How to scale a font down.'
                                        },
                                        {
                                            type = 'FilterMode',
                                            name = 'mag',
                                            default = 'min',
                                            description = 'How to scale a font up.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'anisotropy',
                                            default = '1',
                                            description = 'Maximum amount of anisotropic filtering used.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setLineHeight',
                            description = 'Sets the line height. When rendering the font in lines the actual height will be determined by the line height multiplied by the height of the font. The default is 1.0.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The new line height.'
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
                    name = 'Mesh',
                    description = '',
                    constructors = {
                        'newMesh'
                    },
                    functions = {
                        {
                            name = 'getDrawMode',
                            description = 'Gets the mode used when drawing the Mesh.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'MeshDrawMode',
                                            name = 'mode',
                                            description = 'The mode used when drawing the Mesh.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getDrawRange',
                            description = 'Gets the range of vertices used when drawing the Mesh.\n\nIf the Mesh\'s draw range has not been set previously with Mesh:setDrawRange, this function will return nil.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'min',
                                            description = 'The index of the first vertex used when drawing, or the index of the first value in the vertex map used if one is set for this Mesh.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'max',
                                            description = 'The index of the last vertex used when drawing, or the index of the last value in the vertex map used if one is set for this Mesh.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getTexture',
                            description = 'Gets the texture (Image or Canvas) used when drawing the Mesh.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'Texture',
                                            name = 'texture',
                                            description = 'The Image or Canvas to texture the Mesh with when drawing, or nil if none is set.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getVertex',
                            description = 'Returns vertex information from the Mesh.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'i',
                                            description = 'The index of the the vertex you want to retrieve the information for.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The x vertex coordinate.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The y vertex coordinate.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'u',
                                            description = 'The u vertex coordinate.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'v',
                                            description = 'The v vertex coordinate.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            description = 'The red color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            description = 'The green color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            description = 'The blue color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            description = 'The alpha color component.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getVertexCount',
                            description = 'Returns the total number of vertices in the Mesh.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'num',
                                            description = 'The total number of vertices in this Mesh.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getVertexMap',
                            description = 'Gets the Mesh\'s vertex map.\n\n If no vertex map has been set previously (either in love.graphics.newMesh or with Mesh:setVertexMap), then this function will return the default vertex map: {1, 2, 3, ..., Mesh:getVertexCount()}.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'table',
                                            name = 'vertex_map',
                                            description = 'A table containing a list of vertex indices used when drawing.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getVertices',
                            description = 'Gets all the vertices in the Mesh.\n\nThis method can be slow if the Mesh has a large number of vertices. Keep the original table used to create the Mesh around and update it when necessary instead of using this method frequently, if possible.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'table',
                                            name = 'vertices',
                                            description = 'The table filled with vertex information tables.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setDrawMode',
                            description = 'Sets the mode used when drawing the Mesh.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'MeshDrawMode',
                                            name = 'mode',
                                            description = 'The mode to use when drawing the Mesh.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setDrawRange',
                            description = 'Restricts the drawn vertices of the Mesh to a subset of the total.\n\nIf a vertex map is used with the Mesh, this method will set a subset of the values in the vertex map array to use, instead of a subset of the total vertices in the Mesh.\n\nFor example, if Mesh:setVertexMap(1, 2, 3, 1, 3, 4) and Mesh:setDrawRange(4, 6) are called, vertices 1, 3, and 4 will be drawn.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'min',
                                            description = 'The index of the first vertex to use when drawing, or the index of the first value in the vertex map to use if one is set for this Mesh.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'max',
                                            description = 'The index of the last vertex to use when drawing, or the index of the last value in the vertex map to use if one is set for this Mesh.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setTexture',
                            description = 'Sets the texture (Image or Canvas) used when drawing the Mesh.\n\nWhen called without an argument disables the texture. Untextured meshes have a white color by default.',
                            functions = {
                                {},
                                {
                                    arguments = {
                                        {
                                            type = 'Texture',
                                            name = 'texture',
                                            description = 'The Image or Canvas to texture the Mesh with when drawing.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setVertexColors',
                            description = 'Sets if the per-vertex colors are used when rendering instead of the constant color (constant color being love.graphics.setColor or SpriteBatch:setColor)\n\nThe per-vertex colors are automatically enabled by default when making a new Mesh or when doing Mesh:setVertex, but only if at least one vertex color is not the default (255,255,255,255).',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'boolean',
                                            name = 'on',
                                            description = 'True to use per-vertex coloring.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setVertex',
                            description = 'Sets the vertex information for a Mesh.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'i',
                                            description = 'The index of the the vertex you want to alter the information for.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The x vertex coordinate.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The y vertex coordinate.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'u',
                                            description = 'The u vertex coordinate.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'v',
                                            description = 'The v vertex coordinate.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            default = '255',
                                            description = 'The red color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            default = '255',
                                            description = 'The green color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            default = '255',
                                            description = 'The blue color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            default = '255',
                                            description = 'The alpha color component.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setVertexColors',
                            description = 'Sets if the per-vertex colors are used when rendering instead of the constant color (constant color being love.graphics.setColor or SpriteBatch:setColor)\n\nThe per-vertex colors are automatically enabled by default when making a new Mesh or when doing Mesh:setVertex, but only if at least one vertex color is not the default (255,255,255,255).',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'boolean',
                                            name = 'on',
                                            description = 'True to use per-vertex coloring.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setVertexMap',
                            description = 'Sets the vertex map for a Mesh. The vertex map describes the order in which the vertices are used when the Mesh is drawn.\n\nThe vertex map allows you to re-order or reuse vertices when drawing without changing the actual vertex parameters or duplicating vertices. It is especially useful when combined with different Mesh draw modes.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'table',
                                            name = 'vertex_map',
                                            description = 'A table containing a list of vertex indices to use when drawing. Values must be in the range of [1, Mesh:getVertexCount()].'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'vi1',
                                            description = 'The index of the first vertex to use when drawing. Must be in the range of [1, Mesh:getVertexCount()].'
                                        },
                                        {
                                            type = 'number',
                                            name = 'vi2',
                                            description = 'The index of the second vertex to use when drawing.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'vi3',
                                            description = 'The index of the third vertex to use when drawing.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setVertices',
                            description = 'Replaces all vertices in the Mesh with new ones.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'table',
                                            name = 'vertex_map',
                                            description = 'The table filled with vertex information tables for each vertex.',
                                            table = {
                                                {
                                                    type = 'number',
                                                    name = 'x',
                                                    description = 'The position of the vertex on the x-axis.'
                                                },
                                                {
                                                    type = 'number',
                                                    name = 'y',
                                                    description = 'The position of the vertex on the y-axis.'
                                                },
                                                {
                                                    type = 'number',
                                                    name = 'u',
                                                    default = '0',
                                                    description = 'The horizontal component of the texture coordinate. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                                },
                                                {
                                                    type = 'number',
                                                    name = 'v',
                                                    default = '0',
                                                    description = 'The vertical component of the texture coordinate. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                                },
                                                {
                                                    type = 'number',
                                                    name = 'r',
                                                    default = '255',
                                                    description = 'The red color component.'
                                                },
                                                {
                                                    type = 'number',
                                                    name = 'g',
                                                    default = '255',
                                                    description = 'The green color component.'
                                                },
                                                {
                                                    type = 'number',
                                                    name = 'b',
                                                    default = '255',
                                                    description = 'The blue color component.'
                                                },
                                                {
                                                    type = 'number',
                                                    name = 'a',
                                                    default = '255',
                                                    description = 'The alpha color component.'
                                                }
                                            }
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
                    name = 'Image',
                    description = 'Drawable image type.',
                    constructors = {
                        'newImage'
                    },
                    functions = {
                        {
                            name = 'getData',
                            description = 'Gets the original ImageData or CompressedData used to create the Image.\n\nAll Images keep a reference to the Data that was used to create the Image. The Data is used to refresh the Image when love.window.setMode or Image:refresh is called.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'ImageData',
                                            name = 'data',
                                            description = 'The original ImageData used to create the Image, if the image is not compressed.'
                                        }
                                    }
                                },
                                {
                                    returns = {
                                        {
                                            type = 'CompressedData',
                                            name = 'data',
                                            description = 'The original CompressedData used to create the Image, if the image is compressed.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getDimensions',
                            description = 'Gets the width and height of the Image.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the Image, in pixels.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the Image, in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getFilter',
                            description = 'Gets the filter mode for an image.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'FilterMode',
                                            name = 'min',
                                            description = 'Filter mode used when minifying the image.'
                                        },
                                        {
                                            type = 'FilterMode',
                                            name = 'mag',
                                            description = 'Filter mode used when magnifying the image.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getHeight',
                            description = 'Gets the height of the Image.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the Image, in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getMipmapFilter',
                            description = 'Gets the mipmap filter mode for an Image.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'FilterMode',
                                            name = 'mode',
                                            description = 'The filter mode used in between mipmap levels. nil if mipmap filtering is not enabled.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sharpness',
                                            description = 'Value used to determine whether the image should use more or less detailed mipmap levels than normal when drawing.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getWidth',
                            description = 'Gets the width of the Image.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the Image, in pixels.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getWrap',
                            description = 'Gets the wrapping properties of an Image.\n\nThis function returns the currently set horizontal and vertical wrapping modes for the image.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'WrapMode',
                                            name = 'horizontal',
                                            description = 'Horizontal wrapping mode of the image.'
                                        },
                                        {
                                            type = 'WrapMode',
                                            name = 'vertical',
                                            description = 'Vertical wrapping mode of the image.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'refresh',
                            description = 'Reloads the Image\'s contents from the ImageData or CompressedData used to create the image.',
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'setFilter',
                            description = 'Sets the filter mode for an image.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'FilterMode',
                                            name = 'min',
                                            description = 'How to scale an image down.'
                                        },
                                        {
                                            type = 'FilterMode',
                                            name = 'mag',
                                            default = 'min',
                                            description = 'How to scale an image up.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setMipmapFilter',
                            description = 'Sets the mipmap filter mode for an Image.\n\nMipmapping is useful when drawing an image at a reduced scale. It can improve performance and reduce aliasing issues.\n\nAutomatically creates mipmaps for the Image if none exist yet. If the image is compressed and its CompressedData has mipmap data included, it will use that.\n\nDisables mipmap filtering when called without arguments.',
                            functions = {
                                {},
                                {
                                    arguments = {
                                        {
                                            type = 'FilterMode',
                                            name = 'filtermode',
                                            description = 'The filter mode to use in between mipmap levels. "nearest" will often give better performance.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sharpness',
                                            default = '0',
                                            description = 'A positive sharpness value makes the image use a more detailed mipmap level when drawing, at the expense of performance. A negative value does the reverse.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setWrap',
                            description = 'Sets the wrapping properties of an Image.\n\nThis function sets the way an Image is repeated when it is drawn with a Quad that is larger than the image\'s extent. An image may be clamped or set to repeat in both horizontal and vertical directions. Clamped images appear only once, but repeated ones repeat as many times as there is room in the Quad.\n\nIf you use a Quad that is larger than the image extent and do not use repeated tiling, there may be an unwanted visual effect of the image stretching all the way to fill the Quad. If this is the case, setting Image:getWrap("repeat", "repeat") for all the images to be repeated, and using Quad of appropriate size will result in the best visual appearance.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'WrapMode',
                                            name = 'horizontal',
                                            description = 'Horizontal wrapping mode of the image.'
                                        },
                                        {
                                            type = 'WrapMode',
                                            name = 'vertical',
                                            default = 'horizontal',
                                            description = 'Vertical wrapping mode of the image.'
                                        }
                                    }
                                }
                            }
                        }
                    },
                    supertypes = {
                        'Drawable',
                        'Object'
                    }
                },
                {
                    name = 'ParticleSystem',
                    description = 'Used to create cool effects, like fire. The particle systems are created and drawn on the screen using functions in love.graphics. They also need to be updated in the update(dt) callback for you to see any changes in the particles emitted.',
                    constructors = {
                        'newParticleSystem'
                    },
                    functions = {
                        {
                            name = 'clone',
                            description = 'Creates an identical copy of the ParticleSystem in the stopped state.\n\nCloned ParticleSystem inherit all the set-able state of the original ParticleSystem, but they are initialized stopped.',
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            name = 'getEmitterLifetime',
                            description = 'Gets how long the particle system should emit particles (if -1 then it emits particles forever).',
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            name = 'getPosition',
                            description = 'Gets the position of the emitter.',
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'reset',
                            description = 'Resets the particle emitter, removing any existing particles and resetting the lifetime counter.',
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'setAreaSpread',
                            description = 'Sets area-based spawn parameters for the particles. Newly created particles will spawn in an area around the emitter based on the parameters to this function.',
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            name = 'setInsertMode',
                            description = 'Sets the mode to use when the ParticleSystem adds new particles.',
                            functions = {
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
                            functions = {
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
                            name = 'setEmitterLifetime',
                            description = 'Sets how long the particle system should emit particles (if -1 then it emits particles forever).',
                            functions = {
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
                            name = 'setOffset',
                            description = 'Set the offset position which the particle sprite is rotated around. If this function is not used, the particles rotate around their center.',
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            name = 'setRadialAcceleration',
                            description = 'Set the radial acceleration (away from the emitter).',
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
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
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'stop',
                            description = 'Stops the particle emitter, resetting the lifetime counter.',
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'update',
                            description = 'Updates the particle system; moving, creating and killing particles.',
                            functions = {
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
                    supertypes = {
                        'Drawable',
                        'Object'
                    }
                },
                {
                    name = 'Quad',
                    description = 'A quadrilateral (a polygon with four sides and four corners) with texture coordinate information.\n\nQuads can be used to select part of a texture to draw. In this way, one large texture atlas can be loaded, and then split up into sub-images.',
                    constructors = {
                        'newQuad'
                    },
                    functions = {
                        {
                            name = 'getViewport',
                            description = 'Gets the current viewport of this Quad.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The top-left corner along the x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The top-right corner along the y-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'w',
                                            description = 'The width of the viewport.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'h',
                                            description = 'The height of the viewport.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setViewport',
                            description = 'Sets the texture coordinates according to a viewport.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The top-left corner along the x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The top-right corner along the y-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'w',
                                            description = 'The width of the viewport.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'h',
                                            description = 'The height of the viewport.'
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
                    name = 'Shader',
                    description = 'A Shader is used for advanced hardware-accelerated pixel or vertex manipulation. These effects are written in a language based on GLSL (OpenGL Shading Language) with a few things simplified for easier coding.\n\nPotential uses for pixel effects include HDR/bloom, motion blur, grayscale/invert/sepia/any kind of color effect, reflection/refraction, distortions, and much more!',
                    constructors = {
                        'newShader'
                    },
                    functions = {
                        {
                            name = 'getWarnings',
                            description = 'Returns any warning and error messages from compiling the shader code. This can be used for debugging your shaders if there\'s anything the graphics hardware doesn\'t like.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'string',
                                            name = 'warnings',
                                            description = 'Warning messages (if any).'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'send',
                            description = 'Sends one or more values to a special (extern) variable inside the shader.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'name',
                                            description = 'Name of the number to send to the pixel effect.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'number',
                                            description = 'Number to send to the pixel effect.'
                                        },
                                        {
                                            type = 'number',
                                            name = '...',
                                            description = 'Additional numbers to send in case the extern is an array.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'name',
                                            description = 'Name of the vector to send to the shader.'
                                        },
                                        {
                                            type = 'table',
                                            name = 'vector',
                                            description = 'Numbers to send to the extern as a vector. The number of elements in the table determines the type of the vector (e.g. two numbers -> vec2). At least two and at most four numbers can be used.'
                                        },
                                        {
                                            type = 'table',
                                            name = '...',
                                            description = 'Additional vectors to send in case the extern is an array. All vectors need to be of the same size (e.g. only vec3\'s)'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'name',
                                            description = 'Name of the matrix to send to the shader.'
                                        },
                                        {
                                            type = 'table',
                                            name = 'matrix',
                                            description = '2x2, 3x3, or 4x4 matrix to send to the extern. Using table form: {{a,b,c,d}, {e,f,g,h}, ... }'
                                        },
                                        {
                                            type = 'table',
                                            name = '...',
                                            description = 'Additional matrices of the same type as matrix to store in the extern array.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'name',
                                            description = 'Name of the Image to send to the shader.'
                                        },
                                        {
                                            type = 'Image',
                                            name = 'image',
                                            description = 'Image to send to the extern.'
                                        },
                                        {
                                            type = 'Image',
                                            name = '...',
                                            description = 'Additional images in case the extern is an array.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'name',
                                            description = 'Name of the Canvas to send to the shader.'
                                        },
                                        {
                                            type = 'Canvas',
                                            name = 'canvas',
                                            description = 'Canvas to send to the extern. The shader extern type is Image.'
                                        },
                                        {
                                            type = 'Canvas',
                                            name = '...',
                                            description = 'Additional canvases to send to the extern array.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'name',
                                            description = 'Name of the boolean to send to the shader.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'boolean',
                                            description = 'Boolean to send to store in the extern.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = '...',
                                            description = 'Additional booleans to send in case the extern is an array.'
                                        }
                                    }
                                },
                            }
                        }
                    },
                    supertypes = {
                        'Object'
                    }
                },
                {
                    name = 'SpriteBatch',
                    description = 'Using a single image, draw any number of identical copies of the image using a single call to love.graphics.draw. This can be used, for example, to draw repeating copies of a single background image.\n\nA SpriteBatch can be even more useful when the underlying image is a Texture Atlas (a single image file containing many independent images); by adding Quad to the batch, different sub-images from within the atlas can be drawn.',
                    constructors = {
                        'newSpriteBatch'
                    },
                    functions = {
                        {
                            name = 'add',
                            description = 'Add a sprite to the batch.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position to draw the object (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position to draw the object (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            default = '0',
                                            description = 'Orientation (radians).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sx',
                                            default = '1',
                                            description = 'Scale factor (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sy',
                                            default = 'sx',
                                            description = 'Scale factor (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ox',
                                            default = '0',
                                            description = 'Origin offset (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'oy',
                                            default = '0',
                                            description = 'Origin offset (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'kx',
                                            default = '0',
                                            description = 'Shear factor (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ky',
                                            default = '0',
                                            description = 'Shear factor (y-axis).'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'id',
                                            description = 'An identifier for the added sprite.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'Quad',
                                            name = 'quad',
                                            description = 'The Quad to add.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position to draw the object (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position to draw the object (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            default = '0',
                                            description = 'Orientation (radians).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sx',
                                            default = '1',
                                            description = 'Scale factor (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sy',
                                            default = 'sx',
                                            description = 'Scale factor (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ox',
                                            default = '0',
                                            description = 'Origin offset (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'oy',
                                            default = '0',
                                            description = 'Origin offset (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'kx',
                                            default = '0',
                                            description = 'Shear factor (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ky',
                                            default = '0',
                                            description = 'Shear factor (y-axis).'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'id',
                                            description = 'An identifier for the added sprite.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'bind',
                            description = 'Binds the SpriteBatch to the memory.\n\nBinding a SpriteBatch before updating its content can improve the performance as it doesn\'t push each update to the graphics card separately. Don\'t forget to unbind the SpriteBatch or the updates won\'t show up.',
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'clear',
                            description = 'Removes all sprites from the buffer.',
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'getBufferSize',
                            description = 'Gets the maximum number of sprites the SpriteBatch can hold.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'size',
                                            description = 'The maximum number of sprites the batch can hold.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getColor',
                            description = 'Gets the color that will be used for the next add and set operations.\n\nIf no color has been set with SpriteBatch:setColor or the current SpriteBatch color has been cleared, this method will return nil.',
                            functions = {
                                {},
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'r',
                                            description = 'The red component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            description = 'The green component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            description = 'The blue component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            description = 'The alpha component (0-255).'
                                        },
                                    }
                                }
                            }
                        },
                        {
                            name = 'getCount',
                            description = 'Gets the amount of sprites currently in the SpriteBatch.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'count',
                                            description = 'The amount of sprites currently in the batch.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getTexture',
                            description = 'Returns the Image or Canvas used by the SpriteBatch.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'Texture',
                                            name = 'texture',
                                            description = 'The Image or Canvas for the sprites.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'set',
                            description = 'Changes a sprite in the batch. This requires the identifier returned by add and addq.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'id',
                                            description = 'The identifier of the sprite that will be changed.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position to draw the object (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position to draw the object (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            default = '0',
                                            description = 'Orientation (radians).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sx',
                                            default = '1',
                                            description = 'Scale factor (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sy',
                                            default = 'sx',
                                            description = 'Scale factor (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ox',
                                            default = '0',
                                            description = 'Origin offset (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'oy',
                                            default = '0',
                                            description = 'Origin offset (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'kx',
                                            default = '0',
                                            description = 'Shear factor (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ky',
                                            default = '0',
                                            description = 'Shear factor (y-axis).'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'id',
                                            description = 'The identifier of the sprite that will be changed.'
                                        },
                                        {
                                            type = 'Quad',
                                            name = 'quad',
                                            description = 'The quad used on the image of the batch.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position to draw the object (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position to draw the object (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            default = '0',
                                            description = 'Orientation (radians).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sx',
                                            default = '1',
                                            description = 'Scale factor (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sy',
                                            default = 'sx',
                                            description = 'Scale factor (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ox',
                                            default = '0',
                                            description = 'Origin offset (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'oy',
                                            default = '0',
                                            description = 'Origin offset (y-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'kx',
                                            default = '0',
                                            description = 'Shear factor (x-axis).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ky',
                                            default = '0',
                                            description = 'Shear factor (y-axis).'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setBufferSize',
                            description = 'Sets the maximum number of sprites the SpriteBatch can hold. Existing sprites in the batch (up to the new maximum) will not be cleared when this function is called.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'size',
                                            description = 'The new maximum number of sprites the batch can hold.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setColor',
                            description = 'Sets the color that will be used for the next add and set operations. Calling the function without arguments will clear the color.\n\nThe global color set with love.graphics.setColor will not work on the SpriteBatch if any of the sprites has its own color.',
                            functions = {
                                {},
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'r',
                                            description = 'The amount of red.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            description = 'The amount of green.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            description = 'The amount of blue.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            default = '255',
                                            description = 'The amount of alpha.'
                                        },
                                    }
                                }
                            }
                        },
                        {
                            name = 'setTexture',
                            description = 'Replaces the Image or Canvas used for the sprites.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'Texture',
                                            name = 'texture',
                                            description = 'The new Image or Canvas to use for the sprites.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'unbind',
                            description = 'Unbinds the SpriteBatch.',
                            functions = {
                                {}
                            }
                        }
                    },
                    supertypes = {
                        'Drawable',
                        'Object'
                    }
                }
            },
            functions = {
                {
                    name = 'arc',
                    description = 'Draws an arc.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'DrawMode',
                                    name = 'mode',
                                    description = 'How to draw the arc.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position of the center along x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position of the center along y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'radius',
                                    description = 'Radius of the arc.'
                                },
                                {
                                    type = 'number',
                                    name = 'angle1',
                                    description = 'The angle at which the arc begins.'
                                },
                                {
                                    type = 'number',
                                    name = 'angle2',
                                    description = 'The angle at which the arc terminates.'
                                },
                                {
                                    type = 'number',
                                    name = 'segments',
                                    default = '10',
                                    description = 'The number of segments used for drawing the arc.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'circle',
                    description = 'Draws a circle.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'DrawMode',
                                    name = 'mode',
                                    description = 'How to draw the circle.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position of the center along x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position of the center along y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'radius',
                                    description = 'The radius of the circle.'
                                },
                                {
                                    type = 'number',
                                    name = 'segments',
                                    default = 'max(radius, 10)',
                                    description = 'The number of segments used for drawing the circle.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'clear',
                    description = 'Clears the screen to background color and restores the default coordinate system.\n\nThis function is called automatically before love.draw in the default love.run function. See the example in love.run for a typical use of this function.\n\nNote that the scissor area bounds the cleared region.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'draw',
                    description = 'Draws objects on screen. Drawable objects are loaded images, but may be other kinds of Drawable objects, such as a ParticleSystem.\n\nIn addition to simple drawing, this function can rotate and scale the object at the same time, as well as offset the image (for example, to center the image at the chosen coordinates).\n\nlove.graphics.draw anchors from the top left corner by default.\n\nYou can specify a negative value for sx or sy to flip the drawable horizontally or vertically.\n\nThe pivotal point is (x, y) on the screen and (ox, oy) in the internal coordinate system of the drawable object, before rotation and scaling. The object is scaled by (sx, sy), then rotated by r around the pivotal point.\n\nThe origin offset values are most often used to shift the images up and left by half of its height and width, so that (effectively) the specified x and y coordinates are where the center of the image will end up.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'Drawable',
                                    name = 'drawable',
                                    description = 'A drawable object.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    default = '0',
                                    description = 'The position to draw the object (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    default = '0',
                                    description = 'The position to draw the object (y-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'r',
                                    default = '0',
                                    description = 'Orientation (radians).'
                                },
                                {
                                    type = 'number',
                                    name = 'sx',
                                    default = '1',
                                    description = 'Scale factor (x-axis). Can be negative.'
                                },
                                {
                                    type = 'number',
                                    name = 'sy',
                                    default = 'sx',
                                    description = 'Scale factor (y-axis). Can be negative.'
                                },
                                {
                                    type = 'number',
                                    name = 'ox',
                                    default = '0',
                                    description = 'Origin offset (x-axis). (A value of 20 would effectively move your drawable object 20 pixels to the left.)'
                                },
                                {
                                    type = 'number',
                                    name = 'oy',
                                    default = '0',
                                    description = 'Origin offset (y-axis). (A value of 20 would effectively move your drawable object 20 pixels up.)'
                                },
                                {
                                    type = 'number',
                                    name = 'kx',
                                    default = '0',
                                    description = 'Shearing factor (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'ky',
                                    default = '0',
                                    description = 'Shearing factor (y-axis).'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'Image',
                                    name = 'image',
                                    description = 'An image to texture the quad with.'
                                },
                                {
                                    type = 'Quad',
                                    name = 'quad',
                                    description = 'The Quad to draw on screen.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    default = '0',
                                    description = 'The position to draw the object (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    default = '0',
                                    description = 'The position to draw the object (y-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'r',
                                    default = '0',
                                    description = 'Orientation (radians).'
                                },
                                {
                                    type = 'number',
                                    name = 'sx',
                                    default = '1',
                                    description = 'Scale factor (x-axis). Can be negative.'
                                },
                                {
                                    type = 'number',
                                    name = 'sy',
                                    default = 'sx',
                                    description = 'Scale factor (y-axis). Can be negative.'
                                },
                                {
                                    type = 'number',
                                    name = 'ox',
                                    default = '0',
                                    description = 'Origin offset (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'oy',
                                    default = '0',
                                    description = 'Origin offset (y-axis)'
                                },
                                {
                                    type = 'number',
                                    name = 'kx',
                                    default = '0',
                                    description = 'Shearing factor (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'ky',
                                    default = '0',
                                    description = 'Shearing factor (y-axis).'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'Canvas',
                                    name = 'canvas',
                                    description = 'A canvas to texture the quad with.'
                                },
                                {
                                    type = 'Quad',
                                    name = 'quad',
                                    description = 'The Quad to draw on screen.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    default = '0',
                                    description = 'The position to draw the object (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    default = '0',
                                    description = 'The position to draw the object (y-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'r',
                                    default = '0',
                                    description = 'Orientation (radians).'
                                },
                                {
                                    type = 'number',
                                    name = 'sx',
                                    default = '1',
                                    description = 'Scale factor (x-axis). Can be negative.'
                                },
                                {
                                    type = 'number',
                                    name = 'sy',
                                    default = 'sx',
                                    description = 'Scale factor (y-axis). Can be negative.'
                                },
                                {
                                    type = 'number',
                                    name = 'ox',
                                    default = '0',
                                    description = 'Origin offset (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'oy',
                                    default = '0',
                                    description = 'Origin offset (y-axis)'
                                },
                                {
                                    type = 'number',
                                    name = 'kx',
                                    default = '0',
                                    description = 'Shearing factor (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'ky',
                                    default = '0',
                                    description = 'Shearing factor (y-axis).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBackgroundColor',
                    description = 'Gets the current background color.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'r',
                                    description = 'The red component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'g',
                                    description = 'The green component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'b',
                                    description = 'The blue component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'a',
                                    description = 'The alpha component (0-255).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBlendMode',
                    description = 'Gets the blending mode.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'BlendMode',
                                    name = 'mode',
                                    description = 'The current blend mode.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getCanvas',
                    description = 'Gets the current target Canvas.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Canvas',
                                    name = 'canvas',
                                    description = 'The Canvas set by setCanvas. Returns nil if drawing to the real screen.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getColor',
                    description = 'Gets the current color.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'r',
                                    description = 'The red component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'g',
                                    description = 'The red component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'b',
                                    description = 'The blue component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'a',
                                    description = 'The alpha component (0-255).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getColorMask',
                    description = 'Gets the active color components used when drawing. Normally all 4 components are active unless love.graphics.setColorMask has been used.\n\nThe color mask determines whether individual components of the colors of drawn objects will affect the color of the screen. They affect love.graphics.clear and Canvas:clear as well.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'r',
                                    description = 'Whether the red color component is active when rendering.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'g',
                                    description = 'Whether the green color component is active when rendering.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'b',
                                    description = 'Whether the blue color component is active when rendering.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'a',
                                    description = 'Whether the alpha color component is active when rendering.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDefaultFilter',
                    description = 'Returns the default scaling filters used with Images, Canvases, and Fonts.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'FilterMode',
                                    name = 'min',
                                    description = 'Filter mode used when scaling the image down.'
                                },
                                {
                                    type = 'FilterMode',
                                    name = 'mag',
                                    description = 'Filter mode used when scaling the image up.'
                                },
                                {
                                    type = 'number',
                                    name = 'anisotropy',
                                    description = 'Maximum amount of Anisotropic Filtering used.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDimensions',
                    description = 'Gets the width and height of the window.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the window.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the window.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFSAA',
                    description = 'Gets the number of antialiasing samples used when drawing to the Canvas.\n\nThis may be different than the number used as an argument to love.graphics.newCanvas if the system running LÖVE doesn\'t support that number.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'samples',
                                    description = 'The number of antialiasing samples used by the canvas when drawing to it.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFont',
                    description = 'Gets the current Font object.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'The current Font, or nil if none is set.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getHeight',
                    description = 'Gets the height of the window.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the window.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLineJoin',
                    description = 'Gets the line join style.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'LineJoin',
                                    name = 'join',
                                    description = 'The LineJoin style.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLineStyle',
                    description = 'Gets the line style.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'LineStyle',
                                    name = 'style',
                                    description = 'The current line style.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getLineWidth',
                    description = 'Gets the current line width.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The current line width.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFullscreenModes',
                    description = 'Gets a list of supported fullscreen modes.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'table',
                                    name = 'modes',
                                    description = 'A table of width/height pairs. (Note that this may not be in order.)'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getShader',
                    description = 'Returns the current Shader. Returns nil if none is set.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Shader',
                                    name = 'shader',
                                    description = 'The current Shader.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSystemLimit',
                    description = 'Gets the system-dependent maximum value for a love.graphics feature.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'GraphicsLimit',
                                    name = 'limittype',
                                    description = 'The graphics feature to get the maximum value of.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'limit',
                                    description = 'The system-dependent max value for the feature.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPointSize',
                    description = 'Gets the point size.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The current point size.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPointStyle',
                    description = 'Gets the current point style.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'PointStyle',
                                    name = 'style',
                                    description = 'The current point style.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRendererInfo',
                    description = 'Gets information about the system\'s video card and drivers.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the renderer, e.g. "OpenGL".'
                                },
                                {
                                    type = 'string',
                                    name = 'version',
                                    description = 'The version of the renderer with some extra driver-dependent version info, e.g. "2.1 INTEL-8.10.44".'
                                },
                                {
                                    type = 'string',
                                    name = 'vendor',
                                    description = 'The name of the graphics card vendor, e.g. "Intel Inc."'
                                },
                                {
                                    type = 'string',
                                    name = 'device',
                                    description = 'The name of the graphics card, e.g. "Intel HD Graphics 3000 OpenGL Engine".'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getScissor',
                    description = 'Gets the current scissor box.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x component of the top-left point of the box.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y component of the top-left point of the box.'
                                },
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the box.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the box.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWidth',
                    description = 'Gets the width of the window.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the window.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isSupported',
                    description = 'Checks if certain graphics functions can be used.\n\nOlder and low-end systems do not always support all graphics extensions.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'GraphicsFeature',
                                    name = 'supportN',
                                    description = 'The graphics feature to check for.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'isSupported',
                                    description = 'True if everything is supported, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isWireframe',
                    description = 'Gets whether wireframe mode is used when drawing.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'wireframe',
                                    description = 'True if wireframe lines are used when drawing, false if it\'s not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'line',
                    description = 'Draws lines between points.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The position of first point on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The position of first point on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The position of second point on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The position of second point on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'You can continue passing point positions to draw a polyline.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'points',
                                    description = 'A table of point positions.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newCanvas',
                    description = 'Creates a new Canvas object for offscreen rendering.\n\nAntialiased Canvases have slightly higher system requirements than normal Canvases. Additionally, the supported maximum number of FSAA samples varies depending on the system. Use love.graphics.getSystemLimit to check.\n\nIf the number of FSAA samples specified is greater than the maximum supported by the system, the Canvas will still be created but only using the maximum supported amount (this includes 0.)',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    default = 'window width',
                                    description = 'The width of the Canvas.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    default = 'window height',
                                    description = 'The height of the Canvas.'
                                },
                                {
                                    type = 'TextureFormat',
                                    name = 'texture_type',
                                    default = '"normal"',
                                    description = 'The desired texture mode of the Canvas.'
                                },
                                {
                                    type = 'number',
                                    name = 'fsaa',
                                    default = '0',
                                    description = 'The desired number of antialiasing samples used when drawing to the Canvas.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Canvas',
                                    name = 'canvas',
                                    description = 'A new Canvas object.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newFont',
                    description = 'Creates a new Font.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The filepath to the font file.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '12',
                                    description = 'The size of the font in pixels.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'File',
                                    name = 'file',
                                    description = 'A File pointing to a font.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '12',
                                    description = 'The size of the font in pixels.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'FileData',
                                    name = 'filedata',
                                    description = 'The encoded data to decode into a font.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '12',
                                    description = 'The size of the font in pixels.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '12',
                                    description = 'The size of the font in pixels.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newMesh',
                    description = 'Creates a new Mesh.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'vertices',
                                    description = 'The table filled with vertex information tables.',
                                    table = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position of the vertex on the x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position of the vertex on the y-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'u',
                                            default = '0',
                                            description = 'The horizontal component of the texture coordinate. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                        },
                                        {
                                            type = 'number',
                                            name = 'v',
                                            default = '0',
                                            description = 'The vertical component of the texture coordinate. Texture coordinates are normally in the range of [0, 1], but can be greater or less (see WrapMode.)'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            default = '255',
                                            description = 'The red color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            default = '255',
                                            description = 'The green color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            default = '255',
                                            description = 'The blue color component.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            default = '255',
                                            description = 'The alpha color component.'
                                        }
                                    }
                                },
                                {
                                    type = 'Texture',
                                    name = 'texture',
                                    default = 'nil',
                                    description = 'The Image or Canvas to use when drawing the Mesh. May be nil to use no texture.'
                                },
                                {
                                    type = 'MeshDrawMode',
                                    name = 'mode',
                                    default = '"fan"',
                                    description = 'How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.'
                                },
                            },
                            returns = {
                                {
                                    type = 'Mesh',
                                    name = 'mesh',
                                    description = 'The new Mesh.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newImage',
                    description = 'Creates a new Image.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The filepath to the image file.'
                                },
                                {
                                    type = 'TextureFormat',
                                    name = 'format',
                                    default = '"normal"',
                                    description = 'The format to interpret the image\'s data as.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Image',
                                    name = 'image',
                                    description = 'An Image object which can be drawn on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'File',
                                    name = 'file',
                                    description = 'A File pointing to an image.'
                                },
                                {
                                    type = 'TextureFormat',
                                    name = 'format',
                                    default = '"normal"',
                                    description = 'The format to interpret the image\'s data as.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Image',
                                    name = 'image',
                                    description = 'An Image object which can be drawn on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'FileData',
                                    name = 'fileData',
                                    description = 'A FileData pointing to an image.'
                                },
                                {
                                    type = 'TextureFormat',
                                    name = 'format',
                                    default = '"normal"',
                                    description = 'The format to interpret the image\'s data as.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Image',
                                    name = 'image',
                                    description = 'An Image object which can be drawn on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'ImageData',
                                    name = 'imageData',
                                    description = 'An ImageData object.'
                                },
                                {
                                    type = 'TextureFormat',
                                    name = 'format',
                                    default = '"normal"',
                                    description = 'The format to interpret the image\'s data as.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Image',
                                    name = 'image',
                                    description = 'An Image object which can be drawn on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'CompressedData',
                                    name = 'compressedData',
                                    description = 'A CompressedData object. The Image will use this CompressedData to reload itself when love.window.setMode is called.'
                                },
                                {
                                    type = 'TextureFormat',
                                    name = 'format',
                                    default = '"normal"',
                                    description = 'The format to interpret the image\'s data as.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Image',
                                    name = 'image',
                                    description = 'An Image object which can be drawn on screen.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newImageFont',
                    description = 'Creates a new font by loading a specifically formatted image. There can be up to 256 glyphs.\n\nExpects ISO 8859-1 encoding for the glyphs string.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The filepath to the image file.'
                                },
                                {
                                    type = 'string',
                                    name = 'glyphs',
                                    description = 'A string of the characters in the image in order from left to right.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'File',
                                    name = 'file',
                                    description = 'A File pointing to an image.'
                                },
                                {
                                    type = 'string',
                                    name = 'glyphs',
                                    description = 'A string of the characters in the image in order from left to right.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'Data',
                                    name = 'data',
                                    description = 'The encoded data to decode into image data.'
                                },
                                {
                                    type = 'string',
                                    name = 'glyphs',
                                    description = 'A string of the characters in the image in order from left to right.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'ImageData',
                                    name = 'imageData',
                                    description = '     The ImageData object to create the font from.'
                                },
                                {
                                    type = 'string',
                                    name = 'glyphs',
                                    description = 'A string of the characters in the image in order from left to right.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'Image',
                                    name = 'image',
                                    description = 'The Image object to create the font from.'
                                },
                                {
                                    type = 'string',
                                    name = 'glyphs',
                                    description = 'A string of the characters in the image in order from left to right.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'A Font object which can be used to draw text on screen.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newParticleSystem',
                    description = 'Creates a new ParticleSystem.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'Texture',
                                    name = 'texture',
                                    description = 'The Image or Canvas to use.'
                                },
                                {
                                    type = 'number',
                                    name = 'buffer',
                                    description = 'The max number of particles at the same time.'
                                }
                            },
                            returns = {
                                {
                                    type = 'ParticleSystem',
                                    name = 'system',
                                    description = 'A new ParticleSystem.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newShader',
                    description = 'Creates a new Shader object for hardware-accelerated vertex and pixel effects. A Shader contains either vertex shader code, pixel shader code, or both.\n\nVertex shader code must contain at least one function, named position, which is the function that will produce transformed vertex positions of drawn objects in screen-space.\n\nPixel shader code must contain at least one function, named effect, which is the function that will produce the color which is blended onto the screen for each pixel a drawn object touches.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'code',
                                    description = 'The pixel shader or vertex shader code, or a filename pointing to a file with the code.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Shader',
                                    name = 'shader',
                                    description = 'A Shader object for use in drawing operations.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'pixelcode',
                                    description = 'The pixel shader code, or a filename pointing to a file with the code.'
                                },
                                {
                                    type = 'string',
                                    name = 'vertexcode',
                                    description = 'The vertex shader code, or a filename pointing to a file with the code.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Shader',
                                    name = 'shader',
                                    description = 'A Shader object for use in drawing operations.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newQuad',
                    description = 'Creates a new Quad.\n\nThe purpose of a Quad is to describe the result of the following transformation on any drawable object. The object is first scaled to dimensions sw * sh. The Quad then describes the rectangular area of dimensions width * height whose upper left corner is at position (x, y) inside the scaled object.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The top-left position along the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The top-left position along the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the Quad.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the Quad.'
                                },
                                {
                                    type = 'number',
                                    name = 'sw',
                                    description = 'The reference width, the width of the Image.'
                                },
                                {
                                    type = 'number',
                                    name = 'sh',
                                    description = 'The reference height, the height of the Image.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Quad',
                                    name = 'quad',
                                    description = 'The new Quad.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newScreenshot',
                    description = 'Creates a screenshot and returns the image data.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'ImageData',
                                    name = 'screenshot',
                                    description = 'The image data of the screenshot.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newSpriteBatch',
                    description = 'Creates a new SpriteBatch object.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'Texture',
                                    name = 'texture',
                                    description = 'The Image or Canvas to use for the sprites.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '1000',
                                    description = 'The max number of sprites.'
                                },
                                {
                                    type = 'SpriteBatchUsage',
                                    name = 'usage',
                                    default = '"dynamic"',
                                    description = 'The expected usage of the SpriteBatch.'
                                }
                            },
                            returns = {
                                {
                                    type = 'SpriteBatch',
                                    name = 'spriteBatch',
                                    description = 'The new SpriteBatch.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'origin',
                    description = 'Resets the current coordinate transformation.\n\nThis function is always used to reverse any previous calls to love.graphics.rotate, love.graphics.scale, love.graphics.shear or love.graphics.translate. It returns the current transformation state to its defaults.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'point',
                    description = 'Draws a point.\n\nThe pixel grid is actually offset to the center of each pixel. So to get clean pixels drawn use 0.5 + integer increments.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position on the y-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'polygon',
                    description = 'Draw a polygon.\n\nFollowing the mode argument, this function can accept multiple numeric arguments or a single table of numeric arguments. In either case the arguments are interpreted as alternating x and y coordinates of the polygon\'s vertices.\n\nWhen in fill mode, the polygon must be convex and simple or rendering artifacts may occur.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'DrawMode',
                                    name = 'mode',
                                    description = 'How to draw the polygon.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'The vertices of the polygon.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'DrawMode',
                                    name = 'mode',
                                    description = 'How to draw the polygon.'
                                },
                                {
                                    type = 'table',
                                    name = 'vertices',
                                    description = 'The vertices of the polygon as a table.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'pop',
                    description = 'Pops the current coordinate transformation from the transformation stack.\n\nThis function is always used to reverse a previous push operation. It returns the current transformation state to what it was before the last preceding push. For an example, see the description of love.graphics.push.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'present',
                    description = 'Displays the results of drawing operations on the screen.\n\nThis function is used when writing your own love.run function. It presents all the results of your drawing operations on the screen. See the example in love.run for a typical use of this function.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'print',
                    description = 'Draws text on screen. If no Font is set, one will be created and set (once) if needed.\n\nWhen using translation and scaling functions while drawing text, this function assumes the scale occurs first. If you don\'t script with this in mind, the text won\'t be in the right position, or possibly even on screen.\n\nlove.graphics.print stops at the first \'\0\' (null) character. This can bite you if you are appending keystrokes to form your string, as some of those are multi-byte unicode characters which will likely contain null bytes.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'text',
                                    description = 'The text to draw.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position to draw the object (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position to draw the object (y-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'r',
                                    default = '0',
                                    description = 'Orientation (radians).'
                                },
                                {
                                    type = 'number',
                                    name = 'sx',
                                    default = '1',
                                    description = 'Scale factor (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'sy',
                                    default = 'sx',
                                    description = 'Scale factor (y-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'ox',
                                    default = '0',
                                    description = 'Origin offset (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'oy',
                                    default = '0',
                                    description = 'Origin offset (y-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'kx',
                                    default = '0',
                                    description = 'Shear factor (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'ky',
                                    default = '0',
                                    description = 'Shear factor (y-axis).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'printf',
                    description = 'Draws formatted text, with word wrap and alignment.\n\nSee additional notes in love.graphics.print.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'text',
                                    description = 'A text string.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'limit',
                                    description = 'Wrap the line after this many horizontal pixels.'
                                },
                                {
                                    type = 'AlignMode',
                                    name = 'align',
                                    default = '"left"',
                                    description = 'The alignment.'
                                },
                                {
                                    type = 'number',
                                    name = 'r',
                                    default = '0',
                                    description = 'Orientation (radians).'
                                },
                                {
                                    type = 'number',
                                    name = 'sx',
                                    default = '1',
                                    description = 'Scale factor (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'sy',
                                    default = 'sx',
                                    description = 'Scale factor (y-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'ox',
                                    default = '0',
                                    description = 'Origin offset (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'oy',
                                    default = '0',
                                    description = 'Origin offset (y-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'kx',
                                    default = '0',
                                    description = 'Shear factor (x-axis).'
                                },
                                {
                                    type = 'number',
                                    name = 'ky',
                                    default = '0',
                                    description = 'Shear factor (y-axis).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'push',
                    description = 'Copies and pushes the current coordinate transformation to the transformation stack.\n\nThis function is always used to prepare for a corresponding pop operation later. It stores the current coordinate transformation state into the transformation stack and keeps it active. Later changes to the transformation can be undone by using the pop operation, which returns the coordinate transform to the state it was in before calling push.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'rectangle',
                    description = 'Draws a rectangle.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'DrawMode',
                                    name = 'mode',
                                    description = 'How to draw the rectangle.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position of top-left corner along x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position of top-left corner along y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'Width of the rectangle.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'Height of the rectangle.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'reset',
                    description = 'Resets the current graphics settings.\n\nCalling reset makes the current drawing color white, the current background color black, resets any active Canvas or Shader, and removes any scissor settings. It sets the BlendMode to alpha. It also sets both the point and line drawing modes to smooth and their sizes to 1.0.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'rotate',
                    description = 'Rotates the coordinate system in two dimensions.\n\nCalling this function affects all future drawing operations by rotating the coordinate system around the origin by the given amount of radians. This change lasts until love.draw exits.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'angle',
                                    description = 'The amount to rotate the coordinate system in radians.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'scale',
                    description = 'Scales the coordinate system in two dimensions.\n\nBy default the coordinate system in LÖVE corresponds to the display pixels in horizontal and vertical directions one-to-one, and the x-axis increases towards the right while the y-axis increases downwards. Scaling the coordinate system changes this relation.\n\nAfter scaling by sx and sy, all coordinates are treated as if they were multiplied by sx and sy. Every result of a drawing operation is also correspondingly scaled, so scaling by (2, 2) for example would mean making everything twice as large in both x- and y-directions. Scaling by a negative value flips the coordinate system in the corresponding direction, which also means everything will be drawn flipped or upside down, or both. Scaling by zero is not a useful operation.\n\nScale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.\n\nScaling lasts until love.draw exits.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'sx',
                                    description = 'The scaling in the direction of the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'sy',
                                    default = 'sx',
                                    description = 'The scaling in the direction of the y-axis. If omitted, it defaults to same as parameter sx.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setBackgroundColor',
                    description = 'Sets the background color.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'r',
                                    description = 'The red component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'g',
                                    description = 'The green component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'b',
                                    description = 'The blue component (0-255).'
                                },
                                {
                                    type = 'number',
                                    name = 'a',
                                    default = '255',
                                    description = 'The alpha component (0-255).'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'rgba',
                                    description = 'A numerical indexed table with the red, green and blue values as numbers. Alpha is 255 if it is not in the table'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setBlendMode',
                    description = 'Sets the blending mode.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'BlendMode',
                                    name = 'mode',
                                    description = 'The blend mode to use.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setCanvas',
                    description = 'Sets the render target to one or more Canvases. All drawing operations until the next love.graphics.setCanvas call will be redirected to the specified canvases and not shown on the screen.\n\nAll canvas arguments must have the same widths and heights and the same texture type. Normally the same thing will be drawn on each canvas, but that can be changed if a pixel shader is used with the "effects" function instead of the regular effect.\n\nNot all computers support Canvases, and not all computers which support Canvases will support multiple render targets. Use love.graphics.isSupported to check.\n\nnWhen called without arguments, the render target is reset to the screen.',
                    functions = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'Canvas',
                                    name = 'canvas',
                                    description = 'A render target.'
                                },
                                {
                                    type = 'Canvas',
                                    name = '...',
                                    description = 'Additional render targets.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setColor',
                    description = 'Sets the color used for drawing.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'red',
                                    description = 'The amount of red.'
                                },
                                {
                                    type = 'number',
                                    name = 'green',
                                    description = 'The amount of green.'
                                },
                                {
                                    type = 'number',
                                    name = 'blue',
                                    description = 'The amount of blue.'
                                },
                                {
                                    type = 'number',
                                    name = 'alpha',
                                    description = 'The amount of alpha. The alpha value will be applied to all subsequent draw operations, even the drawing of an image.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'rgba',
                                    description = 'A numerical indexed table with the red, green, blue and alpha values as numbers. The alpha is optional and defaults to 255 if it is left out.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setColorMask',
                    description = 'Sets the color mask. Enables or disables specific color components when rendering and clearing the screen. For example, if red is set to false, no further changes will be made to the red component of any pixels.\n\nEnables all color components when called without arguments.',
                    functions = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'red',
                                    description = 'Render red component.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'green',
                                    description = 'Render green component.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'blue',
                                    description = 'Render blue component.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'alpha',
                                    description = 'Render alpha component.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setDefaultFilter',
                    description = 'Sets the default scaling filters used with Images, Canvases, and Fonts.\n\nThis function does not apply retroactively to loaded images.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'FilterMode',
                                    name = 'min',
                                    description = 'Filter mode used when scaling the image down.'
                                },
                                {
                                    type = 'FilterMode',
                                    name = 'mag',
                                    default = 'min',
                                    description = 'Filter mode used when scaling the image up.'
                                },
                                {
                                    type = 'number',
                                    name = 'anisotropy',
                                    default = 1,
                                    description = 'Maximum amount of Anisotropic Filtering used.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFont',
                    description = 'Set an already-loaded Font as the current font or create and load a new one from the file and size.\n\nIt\'s recommended that Font objects are created with love.graphics.newFont in the loading stage and then passed to this function in the drawing stage.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'The Font object to use.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setInvertedStencil',
                    description = 'Defines an inverted stencil for the drawing operations or releases the active one.\n\nIt\'s the same as love.graphics.setStencil with the mask inverted.\n\nCalling the function without arguments releases the active stencil.',
                    functions = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'function',
                                    name = 'stencilFunction',
                                    description = 'Function that draws the stencil.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLineJoin',
                    description = 'Sets the line join style.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'LineJoin',
                                    name = 'join',
                                    description = 'The LineJoin to use.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLineStyle',
                    description = 'Sets the line style.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'LineStyle',
                                    name = 'style',
                                    description = 'The LineStyle to use.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setLineWidth',
                    description = 'Sets the line width.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the line.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setNewFont',
                    description = 'Creates and sets a new font.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '12',
                                    description = 'The size of the font.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'The new font.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'Creates and sets a new font.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '12',
                                    description = 'The size of the font.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'The new font.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'File',
                                    name = 'file',
                                    description = 'A File with the font.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '12',
                                    description = 'The size of the font.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'The new font.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'Data',
                                    name = 'data',
                                    description = 'A Data with the font.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    default = '12',
                                    description = 'The size of the font.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'The new font.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'Rasterizer',
                                    name = 'rasterizer',
                                    description = 'A rasterizer.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Font',
                                    name = 'font',
                                    description = 'The new font.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setShader',
                    description = 'Sets or resets a Shader as the current pixel effect or vertex shaders. All drawing operations until the next love.graphics.setShader will be drawn using the Shader object specified.\n\nDisables the shaders when called without arguments.',
                    functions = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'Shader',
                                    name = 'shader',
                                    description = 'The new shader.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setPointSize',
                    description = 'Sets the point size.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The new point size.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setPointStyle',
                    description = 'Sets the point style.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'PointStyle',
                                    name = 'style',
                                    description = 'The new point style.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setScissor',
                    description = 'Sets or disables scissor.\n\nThe scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear.',
                    functions = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The X coordinate of upper left corner.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The Y coordinate of upper left corner.'
                                },
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of clipping rectangle.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of clipping rectangle.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setWireframe',
                    description = 'Sets whether wireframe lines will be used when drawing.\n\nWireframe mode should only be used for debugging. The lines drawn with it enabled do not behave like regular love.graphics lines: their widths don\'t scale with the coordinate transformations or with love.graphics.setLineWidth, and they don\'t use the smooth LineStyle.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enable',
                                    description = 'True to enable wireframe mode when drawing, false to disable it.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setStencil',
                    description = 'Defines or releases a stencil for the drawing operations.\n\nThe passed function draws to the stencil instead of the screen, creating an image with transparent and opaque pixels. While active, it is used to test where pixels will be drawn or discarded.\n\nCalling the function without arguments releases the active stencil.\n\nWhen called without arguments, the active stencil is released.',
                    functions = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'function',
                                    name = 'stencilFunction',
                                    description = 'Function that draws the stencil.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'shear',
                    description = 'Shears the coordinate system.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'kx',
                                    description = 'The shear factor on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'ky',
                                    description = 'The shear factor on the y-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'translate',
                    description = 'Translates the coordinate system in two dimensions.\n\nWhen this function is called with two numbers, dx, and dy, all the following drawing operations take effect as if their x and y coordinates were x+dx and y+dy.\n\nScale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.\n\nThis change lasts until love.graphics.clear is called (which is called automatically before love.draw in the default love.run function), or a love.graphics.pop reverts to a previous coordinate system state.\n\nTranslating using whole numbers will prevent tearing/blurring of images and fonts draw after translating.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'dx',
                                    description = 'The translation relative to the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'dy',
                                    description = 'The translation relative to the y-axis.'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'AlignMode',
                    description = 'Text alignment.',
                    constants = {
                        {
                            name = 'center',
                            description = 'Align text center.'
                        },
                        {
                            name = 'left',
                            description = 'Align text left.'
                        },
                        {
                            name = 'right',
                            description = 'Align text right.'
                        }
                    }
                },
                {
                    name = 'AreaSpreadDistribution',
                    description = 'Types of particle area spread distribution.',
                    constants = {
                        {
                            name = 'uniform',
                            description = 'Uniform distribution.'
                        },
                        {
                            name = 'normal',
                            description = 'Normal (gaussian) distribution.'
                        },
                        {
                            name = 'none',
                            description = 'No distribution - area spread is disabled.'
                        }
                    }
                },
                {
                    name = 'BlendMode',
                    description = 'Different ways you do alpha blending.',
                    constants = {
                        {
                            name = 'additive',
                            description = 'Additive blend mode.'
                        },
                        {
                            name = 'alpha',
                            description = 'Alpha blend mode ("normal").'
                        },
                        {
                            name = 'replace',
                            description = 'Replace blend mode.'
                        },
                        {
                            name = 'screen',
                            description = 'Screen blend mode.'
                        },
                        {
                            name = 'subtractive',
                            description = 'Subtractive blend mode.'
                        },
                        {
                            name = 'multiplicative',
                            description = 'Multiply blend mode.'
                        },
                        {
                            name = 'premultiplied',
                            description = 'Premultiplied blend mode.'
                        }
                    }
                },
                {
                    name = 'DrawMode',
                    description = 'Controls whether shapes are drawn as an outline, or filled.',
                    constants = {
                        {
                            name = 'fill',
                            description = 'Draw filled shape.'
                        },
                        {
                            name = 'line',
                            description = 'Draw outlined shape.'
                        }
                    }
                },
                {
                    name = 'FilterMode',
                    description = 'How the image is filtered when scaling.',
                    constants = {
                        {
                            name = 'linear',
                            description = 'Scale image with linear interpolation.'
                        },
                        {
                            name = 'nearest',
                            description = 'Scale image with nearest neighbor interpolation.'
                        }
                    }
                },
                {
                    name = 'MeshDrawMode',
                    description = 'How a Mesh\'s vertices are used when drawing.',
                    constants = {
                        {
                            name = 'fan',
                            description = 'The vertices create a "fan" shape with the first vertex acting as the hub point. Can be easily used to draw simple convex polygons.'
                        },
                        {
                            name = 'strip',
                            description = 'The vertices create a series of connected triangles using vertices v1, v2, v3, then v3, v2, v4 (note the order), then v3, v4, v5 and so on.'
                        },
                        {
                            name = 'triangles',
                            description = 'The vertices create unconnected triangles.'
                        },
                        {
                            name = 'points',
                            description = 'The vertices are drawn as unconnected points (see love.graphics.setPointSize.)'
                        }
                    }
                },
                {
                    name = 'GraphicsFeature',
                    description = 'Graphics features that can be checked for with love.graphics.isSupported.\n\nsubtractive, mipmap, and dxt are supported on nearly every system.\n\ncanvas, multicanvas, npot, and shader have roughly the same minimum requirements for support: a DirectX 9.0c+ capable graphics card with drivers that support ~OpenGL 2.1+.\n\nhdrcanvas, bc5, and srgb all share mostly the same minimum requirements for support as well: a DirectX 10+ capable graphics card with drivers that support ~OpenGL 3+.\n\nDirectX 9.0c+ capable graphics cards include the nvidia GeForce 5000-series (2003) and newer, the ATI Radeon 9000-series and newer, and the Intel GMA x3100 GPU and newer.\n\nDirectX 10+ capable graphics cards include the nvidia GeForce 8000-series (2006) and newer, the ATI/AMD HD 2000-series and newer, and the Intel HD 2000/3000 GPUs and newer.',
                    constants = {
                        {
                            name = 'canvas',
                            description = 'Support for Canvas.'
                        },
                        {
                            name = 'npot',
                            description = 'Support for textures with non-power-of-two textures.'
                        },
                        {
                            name = 'subtractive',
                            description = 'Support for the subtractive blend mode.'
                        },
                        {
                            name = 'shader',
                            description = 'Support for Shader.'
                        },
                        {
                            name = 'hdrcanvas',
                            description = 'Support for HDR Canvas.'
                        },
                        {
                            name = 'multicanvas',
                            description = 'Support for simultaneous rendering to at least 4 canvases at once, with love.graphics.setCanvas.'
                        },
                        {
                            name = 'mipmap',
                            description = 'Support for Mipmaps.'
                        },
                        {
                            name = 'dxt',
                            description = 'Support for DXT compressed images (see CompressedFormat.)'
                        },
                        {
                            name = 'bc5',
                            description = 'Support for BC4 and BC5 compressed images.'
                        },
                        {
                            name = 'srgb',
                            description = 'Support for gamma-correct rendering with the srgb window flag in love.window.setMode, and the "srgb" TextureFormat for Canvases and Images.'
                        }
                    }
                },
                {
                    name = 'GraphicsLimit',
                    description = 'Types of system-dependent graphics limits checked for using love.graphics.getSystemLimit.',
                    constants = {
                        {
                            name = 'pointsize',
                            description = 'The maximum size of points.'
                        },
                        {
                            name = 'texturesize',
                            description = 'The maximum width or height of Images and Canvases.'
                        },
                        {
                            name = 'multicanvas',
                            description = 'The maximum number of simultaneously active canvases (via love.graphics.setCanvas).'
                        },
                        {
                            name = 'canvasfsaa',
                            description = 'The maximum number of antialiasing samples for a Canvas.'
                        }
                    }
                },
                {
                    name = 'LineJoin',
                    description = 'Line join style.',
                    constants = {
                        {
                            name = 'miter',
                            description = 'Miter style.'
                        },
                        {
                            name = 'bevel',
                            description = 'Bevel style.'
                        },
                        {
                            name = 'none',
                            description = 'None style.'
                        }
                    }
                },
                {
                    name = 'LineStyle',
                    description = 'The styles in which lines are drawn.',
                    constants = {
                        {
                            name = 'rough',
                            description = 'Draw rough lines.'
                        },
                        {
                            name = 'smooth',
                            description = 'Draw smooth lines.'
                        }
                    }
                },
                {
                    name = 'ParticleInsertMode',
                    description = 'How newly created particles are added to the ParticleSystem.',
                    constants = {
                        {
                            name = 'top',
                            description = 'Particles are inserted at the top of the ParticleSystem\'s list of particles.'
                        },
                        {
                            name = 'bottom',
                            description = 'Particles are inserted at the bottom of the ParticleSystem\'s list of particles.'
                        },
                        {
                            name = 'random',
                            description = 'Particles are inserted at random positions in the ParticleSystem\'s list of particles.'
                        }
                    }
                },
                {
                    name = 'PointStyle',
                    description = 'How points should be drawn.',
                    constants = {
                        {
                            name = 'rough',
                            description = 'Draw rough points.'
                        },
                        {
                            name = 'smooth',
                            description = 'Draw smooth points.'
                        }
                    }
                },
                {
                    name = 'SpriteBatchUsage',
                    description = 'Usage hints for SpriteBatches to optimize sprite data storage on the GPU.',
                    constants = {
                        {
                            name = 'dynamic',
                            description = 'The SpriteBatch data will change repeatedly during its lifetime.'
                        },
                        {
                            name = 'static',
                            description = 'The SpriteBatch will not be modified after initial sprites are added.'
                        },
                        {
                            name = 'stream',
                            description = 'The SpriteBatch data will always change between draws.'
                        }
                    }
                },
                {
                    name = 'TextureFormat',
                    description = 'Canvas and Image texture formats.\n\nThe HDR format is most useful when combined with pixel shaders. Effects such as tonemapped HDR with bloom can be accomplished, or the canvas can be used to store arbitrary non-color data such as positions which are then interpreted and used in a shader, as long as you draw the right things to the canvas.\n\nThe sRGB format should only be used when doing gamma-correct rendering, which is an advanced topic and it\'s easy to get color-spaces mixed up. If you\'re not sure whether you need this, you might want to avoid it.\n\nNot all systems support the HDR and sRGB formats. Use love.graphics.isSupported to check before creating the Canvas or Image.',
                    constants = {
                        {
                            name = 'normal',
                            description = 'The default texture format: 8 bits per channel (32 bpp) RGBA.'
                        },
                        {
                            name = 'hdr',
                            description = 'Only usable in Canvases. The HDR texture format: floating point 16 bits per channel (64 bpp) RGBA.'
                        },
                        {
                            name = 'srgb',
                            description = 'The same as normal, but the texture is interpreted as being in the sRGB color space. It will be decoded from sRGB to linear RGB when drawn or sampled from in a shader. For Canvases, this will also convert everything drawn to the Canvas from linear RGB to sRGB.'
                        }
                    }
                },
                {
                    name = 'WrapMode',
                    description = 'How the image wraps inside a larger Quad or Mesh.',
                    constants = {
                        {
                            name = 'clamp',
                            description = 'Clamp the image. Appears only once.'
                        },
                        {
                            name = 'repeat',
                            description = 'Repeat the image. Fills the whole available extent.'
                        }
                    }
                }
            }
        },
        {
            name = 'image',
            description = 'Provides an interface to decode encoded image data.',
            types = {
                {
                    name = 'CompressedData',
                    description = 'Represents compressed image data designed to stay compressed in RAM. CompressedData encompasses standard compressed formats such as DXT1, DXT5, and BC5 / 3Dc.\n\nYou can\'t draw CompressedData directly to the screen. See Image for that.',
                    constructors = {
                        'newCompressedData'
                    },
                    functions = {
                        {
                            name = 'getDimensions',
                            description = 'Gets the width and height of the CompressedData.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'level',
                                            description = 'A mipmap level. Must be in the range of [1, CompressedData:getMipmapCount()].'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the CompressedData.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the CompressedData.'
                                        }
                                    }
                                },
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the CompressedData.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the CompressedData.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getHeight',
                            description = 'Gets the height of the CompressedData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the CompressedData.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'level',
                                            description = 'A mipmap level. Must be in the range of [1, CompressedData:getMipmapCount()].'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the CompressedData.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getMipmapCount',
                            description = 'Gets the number of mipmap levels in the CompressedData. The base mipmap level (original image) is included in the count.\n\nMipmap filtering cannot be activated for an Image created from a CompressedData which does not have enough mipmap levels to go down to 1x1. For example, a 256x256 image created from a CompressedData should have 8 mipmap levels or Image:setMipmapFilter will error. Most tools which can create compressed textures are able to automatically generate mipmaps for them in the same file.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'mipmaps',
                                            description = 'The number of mipmap levels stored in the CompressedData.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getWidth',
                            description = 'Gets the width of the CompressedData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the CompressedData.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'level',
                                            description = 'A mipmap level. Must be in the range of [1, CompressedData:getMipmapCount()].'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the CompressedData.'
                                        }
                                    }
                                }
                            }
                        }
                    },
                    supertypes = {
                        'Data',
                        'Object'
                    }
                },
                {
                    name = 'ImageData',
                    description = 'Raw (decoded) image data.\n\nYou can\'t draw ImageData directly to screen. See Image for that.',
                    constructors = {
                        'newImageData'
                    },
                    functions = {
                        {
                            name = 'encode',
                            description = 'Encodes the ImageData and writes it to the save directory.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'filename',
                                            description = 'Name of a file to write encoded data to. The format will be automatically deduced from the file extension.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'filename',
                                            description = 'Name of a file to write encoded data to.'
                                        },
                                        {
                                            type = 'ImageFormat',
                                            name = 'format',
                                            description = 'The format to encode the image in.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getDimensions',
                            description = 'Gets the width and height of the ImageData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the ImageData.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the ImageData.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getHeight',
                            description = 'Gets the height of the ImageData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'height',
                                            description = 'The height of the ImageData.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getPixel',
                            description = 'Gets the pixel at the specified position.\n\nValid x and y values start at 0 and go up to image width and height minus 1.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position of the pixel on the x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position of the pixel on the y-axis.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'r',
                                            description = 'The red component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            description = 'The green component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            description = 'The blue component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            description = 'The alpha component (0-255).'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getWidth',
                            description = 'Gets the width of the ImageData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'width',
                                            description = 'The width of the ImageData.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'mapPixel',
                            description = 'Transform an image by applying a function to every pixel.\n\nThis function is a higher order function. It takes another function as a parameter, and calls it once for each pixel in the ImageData.\n\nThe function parameter is called with six parameters for each pixel in turn. The parameters are numbers that represent the x and y coordinates of the pixel and its red, green, blue and alpha values. The function parameter can return up to four number values, which become the new r, g, b and a values of the pixel. If the function returns fewer values, the remaining components are set to 0.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'function',
                                            name = 'pixelFunction',
                                            description = 'Function parameter to apply to every pixel.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'paste',
                            description = 'Paste into ImageData from another source ImageData.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'ImageData',
                                            name = 'source',
                                            description = 'Source ImageData from which to copy.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'dx',
                                            description = 'Destination top-left position on x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'dy',
                                            description = 'Destination top-left position on y-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sx',
                                            description = 'Source top-left position on x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sy',
                                            description = 'Source top-left position on y-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sw',
                                            description = 'Source width.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sh',
                                            description = 'Source height.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setPixel',
                            description = 'Sets the color of a pixel.\n\nValid x and y values start at 0 and go up to image width and height minus 1.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'The position of the pixel on the x-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'The position of the pixel on the y-axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'r',
                                            description = 'The red component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'g',
                                            description = 'The green component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'b',
                                            description = 'The blue component (0-255).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'a',
                                            description = 'The alpha component (0-255).'
                                        }
                                    }
                                }
                            }
                        }
                    },
                    supertypes = {
                        'Data',
                        'Object'
                    }
                }
            },
            functions = {
                {
                    name = 'isCompressed',
                    description = 'Determines whether a file can be loaded as CompressedData.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The filename of the potentially compressed image file.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'compressed',
                                    description = 'Whether the file can be loaded as CompressedData or not.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'FileData',
                                    name = 'fileData',
                                    description = 'A FileData potentially containing a compressed image.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'compressed',
                                    description = 'Whether the FileData can be loaded as CompressedData or not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newCompressedData',
                    description = 'Create a new CompressedData object from a compressed image file. LÖVE currently supports DDS files compressed with the DXT1, DXT5, and BC5 / 3Dc formats.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The filename of the compressed image file.'
                                }
                            },
                            returns = {
                                {
                                    type = 'CompressedData',
                                    name = 'compressedData',
                                    description = 'The new CompressedData object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'FileData',
                                    name = 'fileData',
                                    description = 'A FileData containing a compressed image.'
                                }
                            },
                            returns = {
                                {
                                    type = 'CompressedData',
                                    name = 'compressedData',
                                    description = 'The new CompressedData object.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newImageData',
                    description = 'Create a new ImageData object.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the ImageData.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the ImageData.'
                                }
                            },
                            returns = {
                                {
                                    type = 'ImageData',
                                    name = 'imageData',
                                    description = 'The new ImageData object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The filename of the image file.'
                                }
                            },
                            returns = {
                                {
                                    type = 'ImageData',
                                    name = 'imageData',
                                    description = 'The new ImageData object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'File',
                                    name = 'file',
                                    description = 'A File pointing to an image.'
                                }
                            },
                            returns = {
                                {
                                    type = 'ImageData',
                                    name = 'imageData',
                                    description = 'The new ImageData object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'Data',
                                    name = 'data',
                                    description = 'The encoded data to decode into image data.'
                                }
                            },
                            returns = {
                                {
                                    type = 'ImageData',
                                    name = 'imageData',
                                    description = 'The new ImageData object.'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'ImageFormat',
                    description = 'Encoded image formats.',
                    constants = {
                        {
                            name = 'bmp',
                            description = 'BMP image format.'
                        },
                        {
                            name = 'tga',
                            description = 'Targa image format.'
                        },
                        {
                            name = 'png',
                            description = 'PNG image format.'
                        },
                        {
                            name = 'jpg',
                            description = 'JPG image format.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystick',
            description = 'Provides an interface to the user\'s joystick.',
            types = {
                {
                    name = 'Joystick',
                    description = 'Represents a physical joystick.',
                    constructors = {
                        'getJoysticks'
                    },
                    functions = {
                        {
                            name = 'getAxes',
                            description = 'Gets the direction of each axis.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'axisDir1',
                                            description = 'Direction of axis1.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'axisDir2',
                                            description = 'Direction of axis2.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'axisDirN',
                                            description = 'Direction of axisN.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getAxis',
                            description = 'Gets the direction of an axis.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'axis',
                                            description = 'The index of the axis to be checked.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'direction',
                                            description = 'Current value of the axis.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getAxisCount',
                            description = 'Gets the number of axes on the joystick.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'axes',
                                            description = 'The number of axes available.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getButtonCount',
                            description = 'Gets the number of buttons on the joystick.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'buttons',
                                            description = 'The number of buttons available.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getGUID',
                            description = 'Gets a stable GUID unique to the type of the physical joystick which does not change over time. For example, all Sony Dualshock 3 controllers in OS X have the same GUID. The value is platform-dependent.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'string',
                                            name = 'guid',
                                            description = 'The Joystick type\'s OS-dependent unique identifier.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getGamepadAxis',
                            description = 'Gets the direction of a virtual gamepad axis. If the Joystick isn\'t recognized as a gamepad or isn\'t connected, this function will always return 0.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'GamepadAxis',
                                            name = 'axis',
                                            description = 'The virtual axis to be checked.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'direction',
                                            description = 'Current value of the axis.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getGamepadMapping',
                            description = 'Gets the button, axis or hat that a virtual gamepad input is bound to.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'GamepadAxis',
                                            name = 'axis',
                                            description = 'The virtual gamepad axis to get the binding for.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'JoystickInputType',
                                            name = 'inputtype',
                                            description = 'The type of input the virtual gamepad axis is bound to.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'inputindex',
                                            description = 'The index of the Joystick\'s button, axis or hat that the virtual gamepad axis is bound to.'
                                        },
                                        {
                                            type = 'JoystickHat',
                                            name = 'hatdirection',
                                            description = 'The direction of the hat, if the virtual gamepad axis is bound to a hat. nil otherwise.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'GamepadAxis',
                                            name = 'button',
                                            description = 'The virtual gamepad button to get the binding for.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'JoystickInputType',
                                            name = 'inputtype',
                                            description = 'The type of input the virtual gamepad button is bound to.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'inputindex',
                                            description = 'The index of the Joystick\'s button, axis or hat that the virtual gamepad button is bound to.'
                                        },
                                        {
                                            type = 'JoystickHat',
                                            name = 'hatdirection',
                                            description = 'The direction of the hat, if the virtual gamepad button is bound to a hat. nil otherwise.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getHat',
                            description = 'Gets the direction of a hat.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'hat',
                                            description = 'The index of the hat to be checked.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'JoystickHat',
                                            name = 'direction',
                                            description = 'The direction the hat is pushed.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getHatCount',
                            description = 'Gets the number of hats on the joystick.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'hats',
                                            description = 'How many hats the joystick has.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getID',
                            description = 'Gets the joystick\'s unique identifier. The identifier will remain the same for the life of the game, even when the Joystick is disconnected and reconnected, but it will change when the game is re-launched.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'id',
                                            description = 'The Joystick\'s unique identifier. Remains the same as long as the game is running.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'instanceid',
                                            description = 'Unique instance identifier. Changes every time the Joystick is reconnected. nil if the Joystick is not connected.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getName',
                            description = 'Gets the name of the joystick.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'string',
                                            name = 'name',
                                            description = 'The name of the joystick.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'isConnected',
                            description = 'Gets whether the Joystick is connected.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'connected',
                                            description = 'True if the Joystick is currently connected, false otherwise.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'isDown',
                            description = 'Checks if a button on the Joystick is pressed.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = '...',
                                            description = 'The index of a button to check.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'anyDown',
                                            description = 'True if any supplied button is down, false if not.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'isGamepad',
                            description = 'Gets whether the Joystick is recognized as a gamepad. If this is the case, the Joystick\'s buttons and axes can be used in a standardized manner across different operating systems and joystick models via Joystick:getGamepadAxis and related functions.\n\nLÖVE automatically recognizes most popular controllers with a similar layout to the Xbox 360 controller as gamepads, but you can add more with love.joystick.setGamepadMapping.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'isgamepad',
                                            description = 'True if the Joystick is recognized as a gamepad, false otherwise.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'isGamepadDown',
                            description = 'Checks if a virtual gamepad button on the Joystick is pressed. If the Joystick is not recognized as a Gamepad or isn\'t connected, then this function will always return false.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'GamepadButton',
                                            name = '...',
                                            description = 'The gamepad button to check.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'boolean',
                                            name = 'anyDown',
                                            description = 'True if any supplied button is down, false if not.'
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
                    name = 'setGamepadMapping',
                    description = 'Binds a virtual gamepad input to a button, axis or hat for all Joysticks of a certain type. For example, if this function is used with a GUID returned by a Dualshock 3 controller in OS X, the binding will affect Joystick:getGamepadAxis and Joystick:isGamepadDown for all Dualshock 3 controllers used with the game when run in OS X.\n\nLÖVE includes built-in gamepad bindings for many common controllers. This function lets you change the bindings or add new ones for types of Joysticks which aren\'t recognized as gamepads by default.\n\nThe virtual gamepad buttons and axes are designed around the Xbox 360 controller layout.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'guid',
                                    description = 'The OS-dependent GUID for the type of Joystick the binding will affect.'
                                },
                                {
                                    type = 'GamepadButton',
                                    name = 'button',
                                    description = 'The virtual gamepad button to bind.'
                                },
                                {
                                    type = 'JoystickInputType',
                                    name = 'inputtype',
                                    description = 'The type of input to bind the virtual gamepad button to.'
                                },
                                {
                                    type = 'number',
                                    name = 'inputindex',
                                    description = 'The index of the axis, button, or hat to bind the virtual gamepad button to.'
                                },
                                {
                                    type = 'JoystickHat',
                                    name = 'hatdirection',
                                    description = 'The direction of the hat, if the virtual gamepad button will be bound to a hat. nil otherwise.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'Whether the virtual gamepad button was successfully bound.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'guid',
                                    description = 'The OS-dependent GUID for the type of Joystick the binding will affect.'
                                },
                                {
                                    type = 'GamepadButton',
                                    name = 'button',
                                    description = 'The virtual gamepad axis to bind.'
                                },
                                {
                                    type = 'JoystickInputType',
                                    name = 'inputtype',
                                    description = 'The type of input to bind the virtual gamepad axis to.'
                                },
                                {
                                    type = 'number',
                                    name = 'inputindex',
                                    description = 'The index of the axis, button, or hat to bind the virtual gamepad axis to.'
                                },
                                {
                                    type = 'JoystickHat',
                                    name = 'hatdirection',
                                    description = 'The direction of the hat, if the virtual gamepad axis will be bound to a hat. nil otherwise.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'Whether the virtual gamepad button was successfully bound.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getJoystickCount',
                    description = 'Gets the number of connected joysticks.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'joystickcount',
                                    description = 'The number of connected joysticks.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getJoysticks',
                    description = 'Gets a list of connected Joysticks.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'table',
                                    name = 'joysticks',
                                    description = 'The list of currently connected Joysticks.'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'GamepadAxis',
                    description = 'Virtual gamepad axes.',
                    constants = {
                        {
                            name = 'leftx',
                            description = 'The x-axis of the left thumbstick.'
                        },
                        {
                            name = 'lefty',
                            description = 'The y-axis of the left thumbstick.'
                        },
                        {
                            name = 'rightx',
                            description = 'The x-axis of the right thumbstick.'
                        },
                        {
                            name = 'righty',
                            description = 'The y-axis of the right thumbstick.'
                        },
                        {
                            name = 'triggerleft',
                            description = 'Left analog trigger.'
                        },
                        {
                            name = 'triggerright',
                            description = 'Right analog trigger.'
                        }
                    }
                },
                {
                    name = 'GamepadButton',
                    description = 'Virtual gamepad buttons.',
                    constants = {
                        {
                            name = 'a',
                            description = 'Bottom face button (A).'
                        },
                        {
                            name = 'b',
                            description = 'Right face button (B).'
                        },
                        {
                            name = 'x',
                            description = 'Left face button (X).'
                        },
                        {
                            name = 'y',
                            description = 'Top face button (Y).'
                        },
                        {
                            name = 'back',
                            description = 'Back button.'
                        },
                        {
                            name = 'guide',
                            description = 'Guide button.'
                        },
                        {
                            name = 'start',
                            description = 'Start button.'
                        },
                        {
                            name = 'leftstick',
                            description = 'Left stick click button.'
                        },
                        {
                            name = 'rightstick',
                            description = 'Right stick click button.'
                        },
                        {
                            name = 'leftshoulder',
                            description = 'Left bumper.'
                        },
                        {
                            name = 'rightshoulder',
                            description = 'Right bumper.'
                        },
                        {
                            name = 'dpup',
                            description = 'D-pad up.'
                        },
                        {
                            name = 'dpdown',
                            description = 'D-pad down.'
                        },
                        {
                            name = 'dpleft',
                            description = 'D-pad left.'
                        },
                        {
                            name = 'dpright',
                            description = 'D-pad right.'
                        }
                    }
                },
                {
                    name = 'JoystickHat',
                    description = 'Joystick hat positions.',
                    constants = {
                        {
                            name = 'c',
                            description = 'Centered'
                        },
                        {
                            name = 'd',
                            description = 'Down'
                        },
                        {
                            name = 'l',
                            description = 'Left'
                        },
                        {
                            name = 'ld',
                            description = 'Left+Down'
                        },
                        {
                            name = 'lu',
                            description = 'Left+Up'
                        },
                        {
                            name = 'r',
                            description = 'Right'
                        },
                        {
                            name = 'rd',
                            description = 'Right+Down'
                        },
                        {
                            name = 'ru',
                            description = 'Right+Up'
                        },
                        {
                            name = 'u',
                            description = 'Up'
                        }
                    }
                },
                {
                    name = 'JoystickInputType',
                    description = 'Types of Joystick inputs.',
                    constants = {
                        {
                            name = 'axis',
                            description = 'Analog axis.'
                        },
                        {
                            name = 'button',
                            description = 'Button.'
                        },
                        {
                            name = 'hat',
                            description = '8-direction hat value.'
                        }
                    }
                }
            }
        },
        {
            name = 'keyboard',
            description = 'Provides an interface to the user\'s keyboard.',
            functions = {
                {
                    name = 'hasKeyRepeat',
                    description = 'Gets whether key repeat is enabled.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'Whether key repeat is enabled.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'hasTextInput',
                    description = 'Gets whether text input events are enabled.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'enabled',
                                    description = 'Whether text input events are enabled.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isDown',
                    description = 'Checks whether a certain key is down. Not to be confused with love.keypressed or love.keyreleased.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'KeyConstant',
                                    name = 'key',
                                    description = 'The key to check.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'down',
                                    description = 'True if the key is down, false if not.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'KeyConstant',
                                    name = '...',
                                    description = 'A key to check.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'anyDown',
                                    description = 'True if any supplied key is down, false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setKeyRepeat',
                    description = 'Enables or disables key repeat. It is disabled by default.\n\nThe interval between repeats depends on the user\'s system settings.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enable',
                                    description = 'Whether repeat keypress events should be enabled when a key is held down.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setTextInput',
                    description = 'Enables or disables text input events. It is enabled by default.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'enable',
                                    description = 'Whether text input events should be enabled.'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'KeyConstant',
                    description = 'All the keys you can press. Note that some keys may not be available on your keyboard or system.',
                    constants = {
                        {
                            name = 'a',
                            description = 'The A key'
                        },
                        {
                            name = 'b',
                            description = 'The B key'
                        },
                        {
                            name = 'c',
                            description = 'The C key'
                        },
                        {
                            name = 'd',
                            description = 'The D key'
                        },
                        {
                            name = 'e',
                            description = 'The E key'
                        },
                        {
                            name = 'f',
                            description = 'The F key'
                        },
                        {
                            name = 'g',
                            description = 'The G key'
                        },
                        {
                            name = 'h',
                            description = 'The H key'
                        },
                        {
                            name = 'i',
                            description = 'The I key'
                        },
                        {
                            name = 'j',
                            description = 'The J key'
                        },
                        {
                            name = 'k',
                            description = 'The K key'
                        },
                        {
                            name = 'l',
                            description = 'The L key'
                        },
                        {
                            name = 'm',
                            description = 'The M key'
                        },
                        {
                            name = 'n',
                            description = 'The N key'
                        },
                        {
                            name = 'o',
                            description = 'The O key'
                        },
                        {
                            name = 'p',
                            description = 'The P key'
                        },
                        {
                            name = 'q',
                            description = 'The Q key'
                        },
                        {
                            name = 'r',
                            description = 'The R key'
                        },
                        {
                            name = 's',
                            description = 'The S key'
                        },
                        {
                            name = 't',
                            description = 'The T key'
                        },
                        {
                            name = 'u',
                            description = 'The U key'
                        },
                        {
                            name = 'v',
                            description = 'The V key'
                        },
                        {
                            name = 'w',
                            description = 'The W key'
                        },
                        {
                            name = 'x',
                            description = 'The X key'
                        },
                        {
                            name = 'y',
                            description = 'The Y key'
                        },
                        {
                            name = 'z',
                            description = 'The Z key'
                        },
                        {
                            name = '0',
                            description = 'The zero key'
                        },
                        {
                            name = '1',
                            description = 'The one key'
                        },
                        {
                            name = '2',
                            description = 'The two key'
                        },
                        {
                            name = '3',
                            description = 'The three key'
                        },
                        {
                            name = '4',
                            description = 'The four key'
                        },
                        {
                            name = '5',
                            description = 'The five key'
                        },
                        {
                            name = '6',
                            description = 'The six key'
                        },
                        {
                            name = '7',
                            description = 'The seven key'
                        },
                        {
                            name = '8',
                            description = 'The eight key'
                        },
                        {
                            name = '9',
                            description = 'The nine key'
                        },
                        {
                            name = '(space)',
                            description = 'Space key',
                            notes = 'Replace (space) with the actual space character'
                        },
                        {
                            name = '!',
                            description = 'Exclamation mark key'
                        },
                        {
                            name = '"',
                            description = 'Double quote key'
                        },
                        {
                            name = '#',
                            description = 'Hash key'
                        },
                        {
                            name = '$',
                            description = 'Dollar key'
                        },
                        {
                            name = '&',
                            description = 'Ampersand key'
                        },
                        {
                            name = '\'',
                            description = 'Single quote key'
                        },
                        {
                            name = '(',
                            description = 'Left parenthesis key'
                        },
                        {
                            name = ')',
                            description = 'Right parenthesis key'
                        },
                        {
                            name = '*',
                            description = 'Asterisk key'
                        },
                        {
                            name = '+',
                            description = 'Plus key'
                        },
                        {
                            name = ',',
                            description = 'Comma key'
                        },
                        {
                            name = '-',
                            description = 'Hyphen-minus key'
                        },
                        {
                            name = '.',
                            description = 'Full stop key'
                        },
                        {
                            name = '/',
                            description = 'Slash key'
                        },
                        {
                            name = ':',
                            description = 'Colon key'
                        },
                        {
                            name = ';',
                            description = 'Semicolon key'
                        },
                        {
                            name = '<',
                            description = 'Less-than key'
                        },
                        {
                            name = '=',
                            description = 'Equal key'
                        },
                        {
                            name = '>',
                            description = 'Greater-than key'
                        },
                        {
                            name = '?',
                            description = 'Question mark key'
                        },
                        {
                            name = '@',
                            description = 'At sign key'
                        },
                        {
                            name = '?',
                            description = 'Question mark key'
                        },
                        {
                            name = '[',
                            description = 'Left square bracket key'
                        },
                        {
                            name = '\\',
                            description = 'Backslash key'
                        },
                        {
                            name = ']',
                            description = 'Right square bracket key'
                        },
                        {
                            name = '^',
                            description = 'Caret key'
                        },
                        {
                            name = '_',
                            description = 'Underscore key'
                        },
                        {
                            name = '`',
                            description = 'Grave accent key',
                            notes = 'Also known as the "Back tick" key'
                        },
                        {
                            name = 'kp0',
                            description = 'The numpad zero key'
                        },
                        {
                            name = 'kp1',
                            description = 'The numpad one key'
                        },
                        {
                            name = 'kp2',
                            description = 'The numpad two key'
                        },
                        {
                            name = 'kp3',
                            description = 'The numpad three key'
                        },
                        {
                            name = 'kp4',
                            description = 'The numpad four key'
                        },
                        {
                            name = 'kp5',
                            description = 'The numpad five key'
                        },
                        {
                            name = 'kp6',
                            description = 'The numpad six key'
                        },
                        {
                            name = 'kp7',
                            description = 'The numpad seven key'
                        },
                        {
                            name = 'kp8',
                            description = 'The numpad eight key'
                        },
                        {
                            name = 'kp9',
                            description = 'The numpad nine key'
                        },
                        {
                            name = 'kp.',
                            description = 'The numpad decimal point key'
                        },
                        {
                            name = 'kp/',
                            description = 'The numpad division key'
                        },
                        {
                            name = 'kp*',
                            description = 'The numpad multiplication key'
                        },
                        {
                            name = 'kp-',
                            description = 'The numpad substraction key'
                        },
                        {
                            name = 'kp+',
                            description = 'The numpad addition key'
                        },
                        {
                            name = 'kpenter',
                            description = 'The numpad enter key'
                        },
                        {
                            name = 'kp=',
                            description = 'The numpad equals key'
                        },
                        {
                            name = 'up',
                            description = 'Up cursor key'
                        },
                        {
                            name = 'down',
                            description = 'Down cursor key'
                        },
                        {
                            name = 'right',
                            description = 'Right cursor key'
                        },
                        {
                            name = 'left',
                            description = 'Left cursor key'
                        },
                        {
                            name = 'home',
                            description = 'Home key'
                        },
                        {
                            name = 'end',
                            description = 'End key'
                        },
                        {
                            name = 'pageup',
                            description = 'Page up key'
                        },
                        {
                            name = 'pagedown',
                            description = 'Page down key'
                        },
                        {
                            name = 'insert',
                            description = 'Insert key'
                        },
                        {
                            name = 'backspace',
                            description = 'Backspace key'
                        },
                        {
                            name = 'tab',
                            description = 'Tab key'
                        },
                        {
                            name = 'clear',
                            description = 'Clear key'
                        },
                        {
                            name = 'return',
                            description = 'Return key',
                            notes = 'Also known as the Enter key'
                        },
                        {
                            name = 'delete',
                            description = 'Delete key'
                        },
                        {
                            name = 'f1',
                            description = 'The 1st function key'
                        },
                        {
                            name = 'f2',
                            description = 'The 2nd function key'
                        },
                        {
                            name = 'f3',
                            description = 'The 3rd function key'
                        },
                        {
                            name = 'f4',
                            description = 'The 4th function key'
                        },
                        {
                            name = 'f5',
                            description = 'The 5th function key'
                        },
                        {
                            name = 'f6',
                            description = 'The 6th function key'
                        },
                        {
                            name = 'f7',
                            description = 'The 7th function key'
                        },
                        {
                            name = 'f8',
                            description = 'The 8th function key'
                        },
                        {
                            name = 'f9',
                            description = 'The 9th function key'
                        },
                        {
                            name = 'f10',
                            description = 'The 10th function key'
                        },
                        {
                            name = 'f11',
                            description = 'The 11th function key'
                        },
                        {
                            name = 'f12',
                            description = 'The 12th function key'
                        },
                        {
                            name = 'f13',
                            description = 'The 13th function key'
                        },
                        {
                            name = 'f14',
                            description = 'The 14th function key'
                        },
                        {
                            name = 'f15',
                            description = 'The 15th function key'
                        },
                        {
                            name = 'numlock',
                            description = 'Num-lock key'
                        },
                        {
                            name = 'capslock',
                            description = 'Caps-lock key',
                            notes = 'Caps-on is a key press. Caps-off is a key release.'
                        },
                        {
                            name = 'scrollock',
                            description = 'Scroll-lock key'
                        },
                        {
                            name = 'rshift',
                            description = 'Right shift key'
                        },
                        {
                            name = 'lshift',
                            description = 'Left shift key'
                        },
                        {
                            name = 'rctrl',
                            description = 'Right control key'
                        },
                        {
                            name = 'lctrl',
                            description = 'Left control key'
                        },
                        {
                            name = 'ralt',
                            description = 'Right alt key'
                        },
                        {
                            name = 'lalt',
                            description = 'Left alt key'
                        },
                        {
                            name = 'rmeta',
                            description = 'Right meta key'
                        },
                        {
                            name = 'lmeta',
                            description = 'Left meta key'
                        },
                        {
                            name = 'lsuper',
                            description = 'Left super key'
                        },
                        {
                            name = 'rsuper',
                            description = 'Right super key'
                        },
                        {
                            name = 'mode',
                            description = 'Mode key'
                        },
                        {
                            name = 'compose',
                            description = 'Compose key'
                        },
                        {
                            name = 'pause',
                            description = 'Pause key'
                        },
                        {
                            name = 'escape',
                            description = 'Escape key'
                        },
                        {
                            name = 'help',
                            description = 'Help key'
                        },
                        {
                            name = 'print',
                            description = 'Print key'
                        },
                        {
                            name = 'sysreq',
                            description = 'System request key'
                        },
                        {
                            name = 'break',
                            description = 'Break key'
                        },
                        {
                            name = 'menu',
                            description = 'Menu key'
                        },
                        {
                            name = 'power',
                            description = 'Power key'
                        },
                        {
                            name = 'euro',
                            description = 'Euro (&euro;) key'
                        },
                        {
                            name = 'undo',
                            description = 'Undo key'
                        },
                        {
                            name = 'www',
                            description = 'WWW key'
                        },
                        {
                            name = 'mail',
                            description = 'Mail key'
                        },
                        {
                            name = 'calculator',
                            description = 'Calculator key'
                        },
                        {
                            name = 'appsearch',
                            description = 'Application search key'
                        },
                        {
                            name = 'apphome',
                            description = 'Application home key'
                        },
                        {
                            name = 'appback',
                            description = 'Application back key'
                        },
                        {
                            name = 'appforward',
                            description = 'Application forward key'
                        },
                        {
                            name = 'apprefresh',
                            description = 'Application refresh key'
                        },
                        {
                            name = 'appbookmarks',
                            description = 'Application bookmarks key'
                        }
                    }
                }
            }
        },
        {
            name = 'math',
            description = 'Provides system-independent mathematical functions.',
            types = {
                {
                    name = 'RandomGenerator',
                    description = 'A random number generation object which has its own random state.',
                    constructors = {
                        'newRandomGenerator'
                    },
                    functions = {
                        {
                            name = 'getSeed',
                            description = 'Gets the state of the random number generator.\n\nThe state is split into two numbers due to Lua\'s use of doubles for all number values - doubles can\'t accurately represent integer values above 2^53.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'low',
                                            description = 'Integer number representing the lower 32 bits of the random number generator\'s 64 bit state value.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'high',
                                            description = 'Integer number representing the higher 32 bits of the random number generator\'s 64 bit state value.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getState',
                            description = 'Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.\n\nThis is different from RandomGenerator:getSeed in that getState gets the RandomGenerator\'s current state, whereas getSeed gets the previously set seed number.\n\nThe value of the state string does not depend on the current operating system.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'string',
                                            name = 'state',
                                            description = 'The current state of the RandomGenerator object, represented as a string.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'random',
                            description = 'Generates a pseudo random number in a platform independent way.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'number',
                                            description = 'The pseudo random number.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'max',
                                            description = 'The maximum possible value it should return.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'number',
                                            description = 'The pseudo random number.'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'min',
                                            description = 'The minimum possible value it should return.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'max',
                                            description = 'The maximum possible value it should return.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'number',
                                            description = 'The pseudo random number.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'randomNormal',
                            description = 'Get a normally distributed pseudo random number.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'stddev',
                                            default = '1',
                                            description = 'Standard deviation of the distribution.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'mean',
                                            default = '0',
                                            description = 'The mean of the distribution.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'number',
                                            description = 'Normally distributed random number with variance (stddev)² and the specified mean.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setSeed',
                            description = 'Sets the seed of the random number generator using the specified integer number.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'seed',
                                            description = 'The integer number with which you want to seed the randomization. Must be within the range of [1, 2^53].'
                                        }
                                    }
                                },
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'low',
                                            description = 'The lower 32 bits of the state value. Must be within the range of [0, 2^32 - 1].'
                                        },
                                        {
                                            type = 'number',
                                            name = 'high',
                                            default = '0';
                                            description = 'The higher 32 bits of the state value. Must be within the range of [0, 2^32 - 1].'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setState',
                            description = 'Sets the current state of the random number generator. The value used as an argument for this function is an opaque implementation-dependent string and should only originate from a previous call to RandomGenerator:getState.\n\nThis is different from RandomGenerator:setSeed in that setState directly sets the RandomGenerator\'s current implementation-dependent state, whereas setSeed gives it a new seed value.\n\nThe effect of the state string does not depend on the current operating system.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'string',
                                            name = 'state',
                                            description = 'The new state of the RandomGenerator object, represented as a string. This should originate from a previous call to RandomGenerator:getState.'
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
                    name = 'BezierCurve',
                    description = 'A Bézier curve object that can evaluate and render Bézier curves of arbitrary degree.',
                    constructors = {
                        'newBezierCurve'
                    },
                    functions = {
                        {
                            name = 'evalulate',
                            description = 'Evaluate Bézier curve at parameter t. The parameter must be between 0 and 1 (inclusive).\n\nThis function can be used to move objects along paths or tween parameters. However it should not be used to render the curve, see BezierCurve:render for that purpose.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 't',
                                            description = 'Where to evaluate the curve.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'x coordinate of the curve at parameter t.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'y coordinate of the curve at parameter t.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getControlPoint',
                            description = 'Get coordinates of the i-th control point. Indices start with 1.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'i',
                                            description = 'Index of the control point.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'Position of the control point along the x axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'Position of the control point along the y axis.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getControlPointCount',
                            description = 'Get the number of control points in the Bézier curve.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'count',
                                            description = 'The number of control points.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getDegree',
                            description = 'Get degree of the Bézier curve. The degree is equal to number-of-control-points - 1.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'degree',
                                            description = 'Degree of the Bézier curve.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getDerivative',
                            description = 'Get the derivative of the Bézier curve.\n\nThis function can be used to rotate sprites moving along a curve in the direction of the movement and compute the direction perpendicular to the curve at some parameter t.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'BezierCurve',
                                            name = 'derivative',
                                            description = 'The derivative curve.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'insertControlPoint',
                            description = 'Insert control point after the i-th control point. Indices start with 1. Negative indices wrap around: -1 is the last control point, -2 the one before the last, etc.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'x',
                                            description = 'Position of the control point along the x axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            description = 'Position of the control point along the y axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'i',
                                            default = '-1',
                                            description = 'Index of the control point.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'render',
                            description = 'Get a list of coordinates to be used with love.graphics.line.\n\nThis function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.\n\nIf you are just interested to know the position on the curve given a parameter, use BezierCurve:evalulate.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'depth',
                                            default = '5',
                                            description = 'Number of recursive subdivision steps.'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'table',
                                            name = 'coordinates',
                                            description = 'List of x,y-coordinate pairs of points on the curve.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'rotate',
                            description = 'Rotate the Bézier curve by an angle.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'angle',
                                            description = 'Rotation angle in radians.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ox',
                                            default = '0',
                                            description = 'X coordinate of the rotation center.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'oy',
                                            default = '0',
                                            description = 'Y coordinate of the rotation center.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'scale',
                            description = 'Scale the Bézier curve by a factor.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 's',
                                            description = 'Scale factor.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ox',
                                            default = '0',
                                            description = 'X coordinate of the scaling center.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'oy',
                                            default = '0',
                                            description = 'Y coordinate of the scaling center.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setControlPoint',
                            description = 'Set coordinates of the i-th control point. Indices start with 1.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'i',
                                            description = 'Index of the control point.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'ox',
                                            description = 'Position of the control point along the x axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'oy',
                                            description = 'Position of the control point along the y axis.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'translate',
                            description = 'Move the Bézier curve by an offset.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'dx',
                                            description = 'Offset along the x axis.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'dy',
                                            description = 'Offset along the y axis.'
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
                    name = 'gammaToLinear',
                    description = 'Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering using colors created based on what they look like on-screen.\n\nGamma-space sRGB has more precision in the lower end than linear RGB. Using this function to convert from sRGB to RGB can result in non-integer color values, which get truncated to integers and lose precision when used with other functions such as love.graphics.setColor.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'r',
                                    description = 'The red channel of the sRGB color to convert.'
                                },
                                {
                                    type = 'number',
                                    name = 'g',
                                    description = 'The green channel of the sRGB color to convert.'
                                },
                                {
                                    type = 'number',
                                    name = 'b',
                                    description = 'The blue channel of the sRGB color to convert.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'lr',
                                    description = 'The red channel of the converted color in linear RGB space.'
                                },
                                {
                                    type = 'number',
                                    name = 'lg',
                                    description = 'The green channel of the converted color in linear RGB space.'
                                },
                                {
                                    type = 'number',
                                    name = 'lb',
                                    description = 'The blue channel of the converted color in linear RGB space.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'color',
                                    description = 'An array with the red, green, and blue channels of the sRGB color to convert.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'lr',
                                    description = 'The red channel of the converted color in linear RGB space.'
                                },
                                {
                                    type = 'number',
                                    name = 'lg',
                                    description = 'The green channel of the converted color in linear RGB space.'
                                },
                                {
                                    type = 'number',
                                    name = 'lb',
                                    description = 'The blue channel of the converted color in linear RGB space.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'c',
                                    description = 'The value of a color channel in sRGB space to convert.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'lc',
                                    description = 'The value of the color channel in linear RGB space.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRandomSeed',
                    description = 'Gets the seed of the random number generator.\n\nThe state is split into two numbers due to Lua\'s use of doubles for all number values - doubles can\'t accurately represent integer values above 2^53.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'low',
                                    description = 'Integer number representing the lower 32 bits of the random number generator\'s 64 bit state value.'
                                },
                                {
                                    type = 'number',
                                    name = 'high',
                                    description = 'Integer number representing the higher 32 bits of the random number generator\'s 64 bit state value.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getRandomState',
                    description = 'Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.\n\nThis is different from RandomGenerator:getSeed in that getState gets the RandomGenerator\'s current state, whereas getSeed gets the previously set seed number.\n\nThe value of the state string does not depend on the current operating system.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'state',
                                    description = 'The current state of the RandomGenerator object, represented as a string.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isConvex',
                    description = 'Checks whether a polygon is convex.\n\nPolygonShapes in love.physics, some forms of Mesh, and polygons drawn with love.graphics.polygon must be simple convex polygons.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'vertices',
                                    description = 'The vertices of the polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'convex',
                                    description = 'Whether the given polygon is convex.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The position of the first vertex of the polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The position of the first vertex of the polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The position of the second vertex of the polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The position of the second vertex of the polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'x3',
                                    description = 'The position of the third vertex of the polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y3',
                                    description = 'The position of the third vertex of the polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional vertices.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'convex',
                                    description = 'Whether the given polygon is convex.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'linearToGamma',
                    description = 'Converts a color from linear-space (RGB) to gamma-space (sRGB). This is useful when storing linear RGB color values in an image, because the linear RGB color space has less precision than sRGB for dark colors, which can result in noticeable color banding when drawing.\n\nIn general, colors chosen based on what they look like on-screen are already in gamma-space and should not be double-converted. Colors calculated using math are often in the linear RGB space.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'lr',
                                    description = 'The red channel of the linear RGB color to convert.'
                                },
                                {
                                    type = 'number',
                                    name = 'lg',
                                    description = 'The green channel of the linear RGB color to convert.'
                                },
                                {
                                    type = 'number',
                                    name = 'lb',
                                    description = 'The blue channel of the linear RGB color to convert.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'cr',
                                    description = 'The red channel of the converted color in gamma sRGB space.'
                                },
                                {
                                    type = 'number',
                                    name = 'cg',
                                    description = 'The green channel of the converted color in gamma sRGB space.'
                                },
                                {
                                    type = 'number',
                                    name = 'cb',
                                    description = 'The blue channel of the converted color in gamma sRGB space.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'color',
                                    description = 'An array with the red, green, and blue channels of the linear RGB color to convert.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'cr',
                                    description = 'The red channel of the converted color in gamma sRGB space.'
                                },
                                {
                                    type = 'number',
                                    name = 'cg',
                                    description = 'The green channel of the converted color in gamma sRGB space.'
                                },
                                {
                                    type = 'number',
                                    name = 'cb',
                                    description = 'The blue channel of the converted color in gamma sRGB space.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'lc',
                                    description = 'The value of a color channel in linear RGB space to convert.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'c',
                                    description = 'The value of the color channel in gamma sRGB space.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newBezierCurve',
                    description = 'Creates a new BezierCurve object.\n\nThe number of vertices in the control polygon determines the degree of the curve, e.g. three vertices define a quadratic (degree 2) Bézier curve, four vertices define a cubic (degree 3) Bézier curve, etc.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'vertices',
                                    description = 'The vertices of the control polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.'
                                }
                            },
                            returns = {
                                {
                                    type = 'BezierCurve',
                                    name = 'curve',
                                    description = 'A Bézier curve object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The position of the first vertex of the control polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The position of the first vertex of the control polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The position of the second vertex of the control polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The position of the second vertex of the control polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'x3',
                                    description = 'The position of the third vertex of the control polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y3',
                                    description = 'The position of the third vertex of the control polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional vertices.'
                                }
                            },
                            returns = {
                                {
                                    type = 'BezierCurve',
                                    name = 'curve',
                                    description = 'A Bézier curve object.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newRandomGenerator',
                    description = 'Creates a new RandomGenerator object which is completely independent of other RandomGenerator objects and random functions.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'RandomGenerator',
                                    name = 'rng',
                                    description = 'A Random Number Generator object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'low',
                                    description = 'The lower 32 bits of the state number to use for this instance of the object.'
                                },
                                {
                                    type = 'number',
                                    name = 'high',
                                    default = '0',
                                    description = 'The higher 32 bits of the state number to use for this instance of the object.'
                                }
                            },
                            returns = {
                                {
                                    type = 'RandomGenerator',
                                    name = 'rng',
                                    description = 'A Random Number Generator object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'seed',
                                    description = 'A state of a RandomGenerator object returned by RandomGenerator:getState.'
                                }
                            },
                            returns = {
                                {
                                    type = 'RandomGenerator',
                                    name = 'rng',
                                    description = 'A Random Number Generator object.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'noise',
                    description = 'Generates a Simplex noise value in 1-4 dimensions.\n\nSimplex noise is closely related to Perlin noise. It is widely used for procedural content generation.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The number used to generate the noise value.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'value',
                                    description = 'The noise value in the range of [0, 1].'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The first value of the 2-dimensional vector used to generate the noise value.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The second value of the 2-dimensional vector used to generate the noise value.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'value',
                                    description = 'The noise value in the range of [0, 1].'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The first value of the 3-dimensional vector used to generate the noise value.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The second value of the 3-dimensional vector used to generate the noise value.'
                                },
                                {
                                    type = 'number',
                                    name = 'z',
                                    description = 'The third value of the 3-dimensional vector used to generate the noise value.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'value',
                                    description = 'The noise value in the range of [0, 1].'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The first value of the 4-dimensional vector used to generate the noise value.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The second value of the 4-dimensional vector used to generate the noise value.'
                                },
                                {
                                    type = 'number',
                                    name = 'z',
                                    description = 'The third value of the 4-dimensional vector used to generate the noise value.'
                                },
                                {
                                    type = 'number',
                                    name = 'w',
                                    description = 'The fourth value of the 4-dimensional vector used to generate the noise value.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'value',
                                    description = 'The noise value in the range of [0, 1].'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'random',
                    description = 'Generates a pseudo random number in a platform independent way.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'The pseudo random number.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum possible value it should return.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'The pseudo random number.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum possible value it should return.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum possible value it should return.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'The pseudo random number.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'randomNormal',
                    description = 'Get a normally distributed pseudo random number.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'stddev',
                                    default = '1',
                                    description = 'Standard deviation of the distribution.'
                                },
                                {
                                    type = 'number',
                                    name = 'mean',
                                    default = '0',
                                    description = 'The mean of the distribution.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'Normally distributed random number with variance (stddev)² and the specified mean.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRandomSeed',
                    description = 'Sets the seed of the random number generator using the specified integer number.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'seed',
                                    description = 'The integer number with which you want to seed the randomization. Must be within the range of [1, 2^53].'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'low',
                                    description = 'The lower 32 bits of the state value. Must be within the range of [0, 2^32 - 1].'
                                },
                                {
                                    type = 'number',
                                    name = 'high',
                                    default = '0';
                                    description = 'The higher 32 bits of the state value. Must be within the range of [0, 2^32 - 1].'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setRandomState',
                    description = 'Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.\n\nThis is different from RandomGenerator:getSeed in that getState gets the RandomGenerator\'s current state, whereas getSeed gets the previously set seed number.\n\nThe value of the state string does not depend on the current operating system.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'state',
                                    description = 'The current state of the RandomGenerator object, represented as a string.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'triangulate',
                    description = 'Triangulate a simple polygon.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'table',
                                    name = 'polygon',
                                    description = 'Polygon to triangulate. Must not intersect itself.'
                                }
                            },
                            returns = {
                                {
                                    type = 'table',
                                    name = 'triangles',
                                    description = 'List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3}, {x1, y1, x2, y2, x3, y3}, ...}.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x1',
                                    description = 'The position of the first vertex of the polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y1',
                                    description = 'The position of the first vertex of the polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'x2',
                                    description = 'The position of the second vertex of the polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y2',
                                    description = 'The position of the second vertex of the polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'x3',
                                    description = 'The position of the third vertex of the polygon on the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y3',
                                    description = 'The position of the third vertex of the polygon on the y-axis.'
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Additional vertices.'
                                }
                            },
                            returns = {
                                {
                                    type = 'table',
                                    name = 'triangles',
                                    description = 'List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3}, {x1, y1, x2, y2, x3, y3}, ...}.'
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            name = 'mouse',
            description = 'Provides an interface to the user\'s mouse.',
            types = {
                {
                    name = 'Cursor',
                    description = 'Represents a hardware cursor.',
                    constructors = {
                        'getSystemCursor',
                        'newCursor'
                    },
                    functions = {
                        {
                            name = 'getType',
                            description = 'Gets the type of the Cursor.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'CursorType',
                                            name = 'cursortype',
                                            description = 'The type of the Cursor.'
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
                    name = 'getCursor',
                    description = 'Gets the current Cursor.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Cursor',
                                    name = 'cursor',
                                    description = 'The current cursor, or nil if no cursor is set.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPosition',
                    description = 'Returns the current position of the mouse.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position of the mouse along the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position of the mouse along the y-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSystemCursor',
                    description = 'Gets a Cursor object representing a system-native hardware cursor.\n\n Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse\'s current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'CursorType',
                                    name = 'ctype',
                                    description = 'The type of system cursor to get.'
                                },
                            },
                            returns = {
                                {
                                    type = 'Cursor',
                                    name = 'cursor',
                                    description = 'The Cursor object representing the system cursor type.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getX',
                    description = 'Returns the current x position of the mouse.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The position of the mouse along the x-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getY',
                    description = 'Returns the current y position of the mouse.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The position of the mouse along the y-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isDown',
                    description = 'Checks whether a certain mouse button is down. This function does not detect mousewheel scrolling; you must use the love.mousepressed callback for that.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'MouseConstant',
                                    name = 'button',
                                    description = 'The button to check.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'down',
                                    description = 'True if the specified button is down.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'MouseConstant',
                                    name = '...',
                                    description = 'A button to check.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'anyDown',
                                    description = 'True if any specified button is down, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isGrabbed',
                    description = 'Checks if the mouse is grabbed.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'grabbed',
                                    description = 'True if the cursor is grabbed, false if it is not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isVisible',
                    description = 'Checks if the cursor is visible.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'visible',
                                    description = 'True if the cursor to visible, false if the cursor is hidden.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newCursor',
                    description = 'Creates a new hardware Cursor object from an image file or ImageData.\n\nHardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse\'s current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low frameratesn\n\nThe hot spot is the point the operating system uses to determine what was clicked and at what position the mouse cursor is. For example, the normal arrow pointer normally has its hot spot at the top left of the image, but a crosshair cursor might have it in the middle.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'ImageData',
                                    name = 'imageData',
                                    description = 'The ImageData to use for the the new Cursor.'
                                },
                                {
                                    type = 'number',
                                    name = 'hotx',
                                    default = '0',
                                    description = 'The x-coordinate in the ImageData of the cursor\'s hot spot.'
                                },
                                {
                                    type = 'number',
                                    name = 'hoty',
                                    default = '0',
                                    description = 'The y-coordinate in the ImageData of the cursor\'s hot spot.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Cursor',
                                    name = 'cursor',
                                    description = 'The new Cursor object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filepath',
                                    description = 'Path to the image to use for the new Cursor.'
                                },
                                {
                                    type = 'number',
                                    name = 'hotx',
                                    default = '0',
                                    description = 'The x-coordinate in the ImageData of the cursor\'s hot spot.'
                                },
                                {
                                    type = 'number',
                                    name = 'hoty',
                                    default = '0',
                                    description = 'The y-coordinate in the ImageData of the cursor\'s hot spot.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Cursor',
                                    name = 'cursor',
                                    description = 'The new Cursor object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'FileData',
                                    name = 'fileData',
                                    description = 'Data representing the image to use for the new Cursor.'
                                },
                                {
                                    type = 'number',
                                    name = 'hotx',
                                    default = '0',
                                    description = 'The x-coordinate in the ImageData of the cursor\'s hot spot.'
                                },
                                {
                                    type = 'number',
                                    name = 'hoty',
                                    default = '0',
                                    description = 'The y-coordinate in the ImageData of the cursor\'s hot spot.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Cursor',
                                    name = 'cursor',
                                    description = 'The new Cursor object.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setCursor',
                    description = 'Sets the current mouse cursor.\n\nResets the current mouse cursor to the default when called without arguments.',
                    functions = {
                        {},
                        {
                            arguments = {
                                {
                                    type = 'Cursor',
                                    name = 'cursor',
                                    description = 'The Cursor object to use as the current mouse cursor.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setGrabbed',
                    description = 'Grabs the mouse and confines it to the window.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'grab',
                                    description = 'True to confine the mouse, false to let it leave the window.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setPosition',
                    description = 'Sets the position of the mouse.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The new position of the mouse along the x-axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The new position of the mouse along the y-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setVisible',
                    description = 'Sets the visibility of the cursor.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'visible',
                                    description = 'True to set the cursor to visible, false to hide the cursor.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setX',
                    description = 'Sets the current X position of the mouse.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The new position of the mouse along the x-axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setY',
                    description = 'Sets the current Y position of the mouse.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The new position of the mouse along the y-axis.'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'CursorType',
                    description = 'Types of hardware cursors.',
                    constants = {
                        {
                            name = 'image',
                            description = 'The cursor is using a custom image.'
                        },
                        {
                            name = 'arrow',
                            description = 'An arrow pointer.'
                        },
                        {
                            name = 'ibeam',
                            description = 'An I-beam, normally used when mousing over editable or selectable text.'
                        },
                        {
                            name = 'wait',
                            description = 'Wait graphic.'
                        },
                        {
                            name = 'waitarrow',
                            description = 'Small wait cursor with an arrow pointer.'
                        },
                        {
                            name = 'crosshair',
                            description = 'Crosshair symbol.'
                        },
                        {
                            name = 'sizenwse',
                            description = 'Double arrow pointing to the top-left and bottom-right.'
                        },
                        {
                            name = 'sizenesw',
                            description = 'Double arrow pointing to the top-right and bottom-left.'
                        },
                        {
                            name = 'sizewe',
                            description = 'Double arrow pointing left and right.'
                        },
                        {
                            name = 'sizens',
                            description = 'Double arrow pointing up and down.'
                        },
                        {
                            name = 'sizeall',
                            description = 'Four-pointed arrow pointing up, down, left, and right.'
                        },
                        {
                            name = 'no',
                            description = 'Slashed circle or crossbones.'
                        },
                        {
                            name = 'hand',
                            description = 'Hand symbol.'
                        }
                    }
                },
                {
                    name = 'MouseConstant',
                    description = 'Mouse buttons.',
                    constants = {
                        {
                            name = 'l',
                            description = 'Left mouse button.'
                        },
                        {
                            name = 'm',
                            description = 'Middle mouse button.'
                        },
                        {
                            name = 'r',
                            description = 'Right mouse button.'
                        },
                        {
                            name = 'wd',
                            description = 'Mouse wheel down.'
                        },
                        {
                            name = 'wu',
                            description = 'Mouse wheel up.'
                        },
                        {
                            name = 'x1',
                            description = 'Mouse X1 (also known as button 4).'
                        },
                        {
                            name = 'x2',
                            description = 'Mouse X2 (also known as button 5).'
                        }
                    }
                }
            }
        },
        {
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
        },
        {
            name = 'sound',
            description = 'This module is responsible for decoding sound files. It can\'t play the sounds, see love.audio for that.',
            types = {
                {
                    name = 'SoundData',
                    description = 'Contains raw audio samples. You can not play SoundData back directly. You must wrap a Source object around it.',
                    constructors = {
                        'newSoundData'
                    },
                    functions = {
                        {
                            name = 'getBitDepth',
                            description = 'Returns the number of bits per sample.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'bits',
                                            description = 'Either 8 or 16.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getChannels',
                            description = 'Returns the number of channels in the stream.',
                            functions = {
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
                            name = 'getDuration',
                            description = 'Returns the number of channels in the stream.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'duration',
                                            description = 'The duration of the sound data in seconds.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getSample',
                            description = 'Gets the sample at the specified position.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'i',
                                            description = 'The position of the sample (0 means first sample).'
                                        }
                                    },
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'sample',
                                            description = 'The normalized sample (range -1.0 to 1.0).'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getSampleCount',
                            description = 'Returns the sample count of the SoundData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'count',
                                            description = 'Total number of samples.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getSampleRate',
                            description = 'Returns the sample rate of the SoundData.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'rate',
                                            description = 'Number of samples per second.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'setSample',
                            description = 'Sets the sample at the specified position.',
                            functions = {
                                {
                                    arguments = {
                                        {
                                            type = 'number',
                                            name = 'i',
                                            description = 'The position of the sample (0 means first sample).'
                                        },
                                        {
                                            type = 'number',
                                            name = 'sample',
                                            description = 'A normalized sample (range -1.0 to 1.0).'
                                        }
                                    }
                                }
                            }
                        }
                    },
                    supertypes = {
                        'Data',
                        'Object'
                    }
                }
            },
            functions = {
                {
                    name = 'newSoundData',
                    description = 'Creates new SoundData from a file. It\'s also possible to create SoundData with a custom sample rate, channel and bit depth.\n\nThe sound data will be decoded to the memory in a raw format. It is recommended to create only short sounds like effects, as a 3 minute song uses 30 MB of memory this way.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The filename of the file to load.'
                                }
                            },
                            returns = {
                                {
                                    type = 'SoundData',
                                    name = 'soundData',
                                    description = 'A new SoundData object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'File',
                                    name = 'file',
                                    description = 'A File pointing to an audio file.'
                                }
                            },
                            returns = {
                                {
                                    type = 'SoundData',
                                    name = 'soundData',
                                    description = 'A new SoundData object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'Data',
                                    name = 'data',
                                    description = 'The encoded data to decode into audio.'
                                }
                            },
                            returns = {
                                {
                                    type = 'SoundData',
                                    name = 'soundData',
                                    description = 'A new SoundData object.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'samples',
                                    description = 'Total number of samples.'
                                },
                                {
                                    type = 'number',
                                    name = 'rate',
                                    default = '44100',
                                    description = 'Number of samples per second'
                                },
                                {
                                    type = 'number',
                                    name = 'bits',
                                    default = '16',
                                    description = 'Bits per sample (8 or 16).'
                                },
                                {
                                    type = 'number',
                                    name = 'channels',
                                    default = '2',
                                    description = 'Either 1 for mono or 2 for stereo.'
                                }
                            },
                            returns = {
                                {
                                    type = 'SoundData',
                                    name = 'soundData',
                                    description = 'A new SoundData object.'
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            name = 'system',
            description = 'Provides access to information about the user\'s system.',
            functions = {
                {
                    name = 'getClipboardText',
                    description = 'Gets text from the clipboard.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'text',
                                    description = 'The text currently held in the system\'s clipboard.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getOS',
                    description = 'Gets the current operating system. In general, LÖVE abstracts away the need to know the current operating system, but there are a few cases where it can be useful (especially in combination with os.execute.)',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'os_string',
                                    description = 'The current operating system. "OS X", "Windows", or "Linux".'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPowerInfo',
                    description = 'Gets information about the system\'s power supply.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'PowerState',
                                    name = 'state',
                                    description = 'The basic state of the power supply.'
                                },
                                {
                                    type = 'number',
                                    name = 'percent',
                                    description = 'Percentage of battery life left, between 0 and 100. nil if the value can\'t be determined or there\'s no battery.'
                                },
                                {
                                    type = 'number',
                                    name = 'seconds',
                                    description = 'Seconds of battery life left. nil if the value can\'t be determined or there\'s no battery.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getProcessorCount',
                    description = 'Gets the number of CPU cores in the system.\n\nThe number includes the threads reported if technologies such as Intel\'s Hyper-threading are enabled. For example, on a 4-core CPU with Hyper-threading, this function will return 8.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'cores',
                                    description = 'Gets the number of CPU cores in the system.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'openURL',
                    description = 'Opens a URL with the user\'s web or file browser.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'url',
                                    description = 'The URL to open. Must be formatted as a proper URL.\n\nTo open a file or folder, "file://" must be prepended to the path.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'Whether the URL was opened successfully.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setClipboardText',
                    description = 'Puts text in the clipboard.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'text',
                                    description = 'The new text to hold in the system\'s clipboard.'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'PowerState',
                    description = 'The basic state of the system\'s power supply.',
                    constants = {
                        {
                            name = 'unknown',
                            description = 'Cannot determine power status.'
                        },
                        {
                            name = 'battery',
                            description = 'Not plugged in, running on a battery.'
                        },
                        {
                            name = 'nobattery',
                            description = 'Plugged in, no battery available.'
                        },
                        {
                            name = 'charging',
                            description = 'Plugged in, charging battery.'
                        },
                        {
                            name = 'charged',
                            description = 'Plugged in, battery is fully charged.'
                        }
                    }
                }
            }
        },
        {
            name = 'thread',
            description = 'Allows you to work with threads.\n\nThreads are separate Lua environments, running in parallel to the main code. As their code runs separately, they can be used to compute complex operations without adversely affecting the frame rate of the main thread. However, as they are separate environments, they cannot access the variables and functions of the main thread, and communication between threads is limited.\n\nAll LOVE objects (userdata) are shared among threads so you\'ll only have to send their references across threads. You may run into concurrency issues if you manipulate an object on multiple threads at the same time.\n\nWhen a Thread is started, it only loads the love.thread module. Every other module has to be loaded with require.',
            types = {
                {
                    name = 'Thread',
                    description = 'A Thread is a chunk of code that can run in parallel with other threads.\n\nThreads will place all Lua errors in "error". To retrieve the error, call Thread:get(\'error\') in the main thread.',
                    constructors = {
                        'newThread'
                    },
                    functions = {
                        {
                            name = 'getError',
                            description = 'Retrieves the error string from the thread if it produced a error.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'string',
                                            name = 'message',
                                            description = 'The error message.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'start',
                            description = 'Starts the thread.\n\nThreads can be restarted after they have completed their execution.',
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'wait',
                            description = 'Wait for a thread to finish. This call will block until the thread finishes.',
                            functions = {
                                {}
                            }
                        }
                    },
                    supertypes = {
                        'Object'
                    }
                },
                {
                    name = 'Channel',
                    description = 'A channel is a way to send and receive data to and from different threads.',
                    constructors = {
                        'getChannel',
                        'newChannel'
                    },
                    functions = {
                        {
                            name = 'clear',
                            description = 'Clears all the messages in the Channel queue.',
                            functions = {
                                {}
                            }
                        },
                        {
                            name = 'demand',
                            description = 'Retrieves the value of a Channel message and removes it from the message queue.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. It waits until a message is in the queue then returns the message value.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'value',
                                            name = 'value',
                                            description = 'The contents of the message.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'getCount',
                            description = 'Retrieves the number of messages in the thread Channel queue.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'number',
                                            name = 'count',
                                            description = 'The number of messages in the queue.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'peek',
                            description = 'Retrieves the value of a Channel message, but leaves it in the queue.\n\nThe value of the message can be a boolean, string, number or a LÖVE userdata. It returns nil if there\'s no message in the queue.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'value',
                                            name = 'value',
                                            description = 'The contents of the message.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'pop',
                            description = 'Retrieves the value of a Channel message and removes it from the message queue.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. It returns nil if there are no messages in the queue.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'value',
                                            name = 'value',
                                            description = 'The contents of the message.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'push',
                            description = 'Send a message to the thread Channel.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. Foreign userdata (Lua\'s files, LuaSocket, ENet, ...), functions, and tables inside tables are not supported.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'value',
                                            name = 'value',
                                            description = 'The contents of the message.'
                                        }
                                    }
                                }
                            }
                        },
                        {
                            name = 'supply',
                            description = 'Send a message to the thread Channel and wait for a thread to accept it.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. Foreign userdata (Lua\'s files, LuaSocket, ENet, ...), functions, and tables inside tables are not supported.',
                            functions = {
                                {
                                    returns = {
                                        {
                                            type = 'value',
                                            name = 'value',
                                            description = 'The contents of the message.'
                                        }
                                    }
                                }
                            }
                        },
                    },
                    supertypes = {
                        'Object'
                    }
                }
            },
            functions = {
                {
                    name = 'getChannel',
                    description = 'Creates or retrieves a named thread channel.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the channel you want to create or retrieve.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Channel',
                                    name = 'channel',
                                    description = 'A named channel object which can be further manipulated.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newChannel',
                    description = 'Create a new unnamed thread channel.\n\nOne use for them is to pass new unnamed channels to other threads via Channel:push',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'Channel',
                                    name = 'channel',
                                    description = 'A unnamed channel object which can be further manipulated.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'newThread',
                    description = 'Creates a new Thread from a File or Data object.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the thread.'
                                },
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'The name of the File to use as source.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Thread',
                                    name = 'thread',
                                    description = 'A new Thread that has yet to be started.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the thread.'
                                },
                                {
                                    type = 'File',
                                    name = 'file',
                                    description = 'The file to use as source.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Thread',
                                    name = 'thread',
                                    description = 'A new Thread that has yet to be started.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the thread.'
                                },
                                {
                                    type = 'Data',
                                    name = 'data',
                                    description = 'The data to use as source.'
                                }
                            },
                            returns = {
                                {
                                    type = 'Thread',
                                    name = 'thread',
                                    description = 'A new Thread that has yet to be started.'
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            name = 'timer',
            description = 'Provides an interface to the user\'s clock.',
            functions = {
                {
                    name = 'getAverageDelta',
                    description = 'Returns the average delta time (seconds per frame) over the last second.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'delta',
                                    description = 'The average delta time over the last second.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDelta',
                    description = 'Returns the time between the last two frames.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'dt',
                                    description = 'The time passed (in seconds).'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFPS',
                    description = 'Returns the current frames per second.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'fps',
                                    description = 'The current FPS.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getTime',
                    description = 'Returns the value of a timer with an unspecified starting time. This function should only be used to calculate differences between points in time, as the starting time of the timer is unknown.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'time',
                                    description = 'The time in seconds.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'sleep',
                    description = 'Sleeps the program for the specified amount of time.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 's',
                                    description = 'Seconds to sleep for.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'step',
                    description = 'Measures the time between two frames. Calling this changes the return value of love.timer.getDelta.',
                    functions = {
                        {}
                    }
                }
            }
        },
        {
            name = 'window',
            description = 'The primary responsibility for the love.graphics module is the drawing of lines, shapes, text, Images and other Drawable objects onto the screen. Its secondary responsibilities include loading external files (including Images and Fonts) into memory, creating specialized objects (such as ParticleSystems or Framebuffers) and managing screen geometry.\n\nLÖVE\'s coordinate system is rooted in the upper-left corner of the screen, which is at location (0, 0). The x-axis is horizontal: larger values are further to the right. The y-axis is vertical: larger values are further towards the bottom.\n\nIn many cases, you draw images or shapes in terms of their upper-left corner (See the picture above).\n\nMany of the functions are used to manipulate the graphics coordinate system, which is essentially the way coordinates are mapped to the display. You can change the position, scale, and even rotation in this way.',
            functions = {
                {
                    name = 'getDimensions',
                    description = 'Gets the width and height of the window.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the window.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the window.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFullscreen',
                    description = 'Gets whether the window is fullscreen.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'True if the window is fullscreen, false otherwise.'
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fstype',
                                    description = 'The type of fullscreen mode used.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFullscreenModes',
                    description = 'Gets a list of supported fullscreen modes.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'display',
                                    default = '1',
                                    description = 'The index of the display, if multiple monitors are available.'
                                }
                            },
                            returns = {
                                {
                                    type = 'table',
                                    name = 'modes',
                                    description = 'A table of width/height pairs. (Note that this may not be in order.)'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getHeight',
                    description = 'Gets the height of the window.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the window.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getIcon',
                    description = 'Gets the window icon.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'ImageData',
                                    name = 'imagedata',
                                    description = 'The window icon imagedata, or nil of no icon has been set with love.window.setIcon.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMode',
                    description = 'Returns the current display mode.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'Display width.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'Display height.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Fullscreen (true) or windowed (false).'
                                },
                                {
                                    type = 'boolean',
                                    name = 'vsync',
                                    description = 'True if vertical sync is enabled or false if disabled.'
                                },
                                {
                                    type = 'number',
                                    name = 'fsaa',
                                    description = 'The number of FSAA samples.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getPixelScale',
                    description = 'Gets the scale factor associated with the window. In Mac OS X with the window in a retina screen and the highdpi window flag enabled this will be 2.0, otherwise it will be 1.0.\n\nThe scale factor is used to display graphics at a size the user is expecting, rather than the size of the pixels. On retina displays with the highdpi window flag enabled, the pixels in the window are 2x smaller than the scale of the normal content on the screen, so love.window.getPixelScale will return 2.\n\nThe units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, and mouse events are always in terms of pixels.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'scale',
                                    description = 'The pixel scale factor associated with the window.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWidth',
                    description = 'Gets the width of the window.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the window.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'hasFocus',
                    description = 'Checks if the game window has keyboard focus.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'focus',
                                    description = 'True if the window has the focus or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'hasMouseFocus',
                    description = 'Checks if the game window has mouse focus.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'focus',
                                    description = 'True if the window has mouse focus or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isCreated',
                    description = 'Checks if the window has been created.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'created',
                                    description = 'True if the window has been created, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isVisible',
                    description = 'Checks if the game window is visible.\n\nThe window is considered visible if it\'s not minimized and the program isn\'t hidden.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'visible',
                                    description = 'True if the window is visible or false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setFullscreen',
                    description = 'Enters or exits fullscreen. The display to use when entering fullscreen is chosen based on which display the window is currently in, if multiple monitors are connected.\n\nIf fullscreen mode is entered and the window size doesn\'t match one of the monitor\'s display modes (in normal fullscreen mode) or the window size doesn\'t match the desktop size (in \'desktop\' fullscreen mode), the window will be resized appropriately. The window will revert back to its original size again when fullscreen mode is exited using this function.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Whether to enter or exit fullscreen mode.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'True if successful, false otherwise.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Whether to enter or exit fullscreen mode.'
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fstype',
                                    description = 'The type of fullscreen mode to use.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'True if successful, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setIcon',
                    description = 'Sets the window icon until the game is quit. Not all operating systems support very large icon images.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'ImageData',
                                    name = 'imagedata',
                                    description = 'The window icon image.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'Whether the icon has been set successfully.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setMode',
                    description = 'Changes the display mode.\n\nIf width or height is 0, the width or height of the desktop will be used.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    default = 'Screen width.',
                                    description = 'Display width.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    default = 'Screen height.',
                                    description = 'Display height.'
                                },
                                {
                                    type = 'table',
                                    name = 'flags',
                                    description = 'The flags table.',
                                    table = {
                                        {
                                            type = 'boolean',
                                            name = 'fullscreen',
                                            default = 'false',
                                            description = 'Fullscreen (true), or windowed (false).'
                                        },
                                        {
                                            type = 'FullscreenType',
                                            name = 'fullscreentype',
                                            default = '"normal"',
                                            description = 'The type of fullscreen to use.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'vsync',
                                            default = 'true',
                                            description = 'True if LÖVE should wait for vsync, false otherwise.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'fsaa',
                                            default = '0',
                                            description = 'The number of antialiasing samples.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'resizable',
                                            default = 'false',
                                            description = 'True if the window should be resizable in windowed mode, false otherwise.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'borderless',
                                            default = 'false',
                                            description = 'True if the window should be borderless in windowed mode, false otherwise.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'centered',
                                            default = 'true',
                                            description = 'True if the window should be centered in windowed mode, false otherwise.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'display',
                                            default = '1',
                                            description = 'The index of the display to show the window in, if multiple monitors are available.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'minwidth',
                                            default = '1',
                                            description = 'The minimum width of the window, if it\'s resizable. Cannot be less than 1.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'minheight',
                                            default = '1',
                                            description = 'The minimum height of the window, if it\'s resizable. Cannot be less than 1.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'highdpi',
                                            default = 'false',
                                            description = 'True if high-dpi mode should be used on Retina displays in OS X. Does nothing on non-Retina displays.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'srgb',
                                            default = 'false',
                                            description = 'True if sRGB gamma correction should be applied when drawing to the screen.'
                                        }
                                    }
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'True if successful, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setTitle',
                    description = 'Sets the window title.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'title',
                                    description = 'The new window title.'
                                }
                            }
                        }
                    }
                }
            },
            enums = {
                {
                    name = 'FullscreenType',
                    description = 'Types of fullscreen modes.\n\nIn normal fullscreen mode, if a window size is used which does not match one of the monitor\'s supported display modes, the window will be resized to the next largest display mode.\n\nNormal fullscreen mode is sometimes avoided by users because it can cause issues in some window managers and with multi-monitor setups. In OS X it prevents switching to a different program until fullscreen mode is exited. The "desktop" fullscreen mode generally avoids these issues.',
                    constants = {
                        {
                            name = 'normal',
                            description = 'Standard fullscreen mode. Changes the display mode (actual resolution) of the monitor.'
                        },
                        {
                            name = 'desktop',
                            description = 'Sometimes known as borderless fullscreen windowed mode. A borderless screen-sized window is created which sits on top of all desktop GUI elements (such as the Windows taskbar and the Mac OS X dock.) The window is automatically resized to match the dimensions of the desktop, and its size cannot be changed.'
                        }
                    }
                }
            }
        }
    },
    types = {
        {
            name = 'Data',
            description = 'The superclass of all data.',
            functions = {
                {
                    name = 'getPointer',
                    description = 'Gets a pointer to the Data.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'light userdata',
                                    name = 'pointer',
                                    description = 'A raw pointer to the Data.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSize',
                    description = 'Gets the size of the Data.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The size of the Data in bytes.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getString',
                    description = 'Gets the full Data as a string.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'data',
                                    description = 'The raw data.'
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
            name = 'Drawable',
            description = 'Superclass for all things that can be drawn on screen. This is an abstract type that can\'t be created directly.',
            supertypes = {
                'Object'
            }
        },
        {
            name = 'Object',
            description = 'The superclass of all LÖVE types.',
            functions = {
                {
                    name = 'type',
                    description = 'Gets the type of the object as a string.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'type',
                                    description = 'The type as a string.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'typeOf',
                    description = 'Checks whether an object is of a certain type. If the object has the type with the specified name in its hierarchy, this function will return true.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the type to check for.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'b',
                                    description = 'True if the object is of the specified type, false otherwise.'
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    callbacks = {
        {
            name = 'draw',
            description = 'Callback function used to draw on the screen every frame.',
            functions = {
                {}
            }
        },
        {
            name = 'errhand',
            description = 'The error handler, used to display error messages.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'msg',
                            description = 'The error message.'
                        }
                    }
                }
            }
        },
        {
            name = 'focus',
            description = 'Callback function triggered when window receives or loses focus.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'f',
                            description = 'Window focus.'
                        }
                    }
                }
            }
        },
        {
            name = 'gamepadaxis',
            description = 'Called when a Joystick\'s virtual gamepad axis is moved.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'GamepadAxis',
                            name = 'axis',
                            description = 'The virtual gamepad axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'gamepadpressed',
            description = 'Called when a Joystick\'s virtual gamepad button is pressed.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'GamepadButton',
                            name = 'button',
                            description = 'The virtual gamepad button.'
                        }
                    }
                }
            }
        },
        {
            name = 'gamepadreleased',
            description = 'Called when a Joystick\'s virtual gamepad button is released.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'GamepadButton',
                            name = 'button',
                            description = 'The virtual gamepad button.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickadded',
            description = 'Called when a Joystick is connected.\n\nThis callback is also triggered after love.load for every Joystick which was already connected when the game started up.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The newly connected Joystick object.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickaxis',
            description = 'Called when a joystick axis moves.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'number',
                            name = 'axis',
                            description = 'The axis number.'
                        },
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The new axis value.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickhat',
            description = 'Called when a joystick hat direction changes.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'number',
                            name = 'hat',
                            description = 'The hat number.'
                        },
                        {
                            type = 'JoystickHat',
                            name = 'direction',
                            description = 'The new hat direction.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickpressed',
            description = 'Called when a joystick button is pressed.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'joystick',
                            description = 'The joystick number.'
                        },
                        {
                            type = 'number',
                            name = 'button',
                            description = 'The button number.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickreleased',
            description = 'Called when a joystick button is released.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'joystick',
                            description = 'The joystick number.'
                        },
                        {
                            type = 'number',
                            name = 'button',
                            description = 'The button number.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickremoved',
            description = 'Called when a Joystick is disconnected.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The now-disconnected Joystick object.'
                        }
                    }
                }
            }
        },
        {
            name = 'keypressed',
            description = 'Callback function triggered when a key is pressed.\n\nKey repeat needs to be enabled with love.keyboard.setKeyRepeat for repeat keypress events to be received.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'Character of the key pressed.'
                        },
                        {
                            type = 'boolean',
                            name = 'isrepeat',
                            description = 'Whether this keypress event is a repeat. The delay between key repeats depends on the user\'s system settings.'
                        }
                    }
                }
            }
        },
        {
            name = 'keyreleased',
            description = 'Callback function triggered when a key is released.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'Character of the key released.'
                        }
                    }
                }
            }
        },
        {
            name = 'load',
            description = 'This function is called exactly once at the beginning of the game.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'arg',
                            description = 'Command line arguments given to the game.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousefocus',
            description = 'Callback function triggered when window receives or loses mouse focus.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'f',
                            description = 'Window mouse focus.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousepressed',
            description = 'Callback function triggered when a mouse button is pressed.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Mouse x position.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Mouse y position.'
                        },
                        {
                            type = 'MouseConstant',
                            name = 'button',
                            description = 'Mouse button pressed.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousereleased',
            description = 'Callback function triggered when a mouse button is released.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Mouse x position.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Mouse y position.'
                        },
                        {
                            type = 'MouseConstant',
                            name = 'button',
                            description = 'Mouse button released.'
                        }
                    }
                }
            }
        },
        {
            name = 'quit',
            description = 'Callback function triggered when the game is closed.',
            functions = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'r',
                            description = 'Abort quitting. If true, do not close the game.'
                        }
                    }
                }
            }
        },
        {
            name = 'resize',
            description = 'Called when the window is resized, for example if the user resizes the window, or if love.window.setMode is called with an unsupported width or height in fullscreen and the window chooses the closest appropriate size.\n\nCalls to love.window.setMode will only trigger this event if the width or height of the window after the call doesn\'t match the requested width and height. This can happen if a fullscreen mode is requested which doesn\'t match any supported mode, or if the fullscreen type is \'desktop\' and the requested width or height don\'t match the desktop resolution.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'w',
                            description = 'The new width.'
                        },
                        {
                            type = 'number',
                            name = 'h',
                            description = 'The new height.'
                        }
                    }
                }
            }
        },
        {
            name = 'run',
            description = 'The main function, containing the main loop. A sensible default is used when left out.',
            functions = {
                {}
            }
        },
        {
            name = 'textinput',
            description = 'Called when text has been entered by the user. For example if shift-2 is pressed on an American keyboard layout, the text "@" will be generated.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The UTF-8 encoded unicode text.'
                        }
                    }
                }
            }
        },
        {
            name = 'threaderror',
            description = 'Callback function triggered when a Thread encounters an error.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Thread',
                            name = 'thread',
                            description = 'The thread which produced the error.'
                        },
                        {
                            type = 'string',
                            name = 'errorstr',
                            description = 'The error message.'
                        }
                    }
                }
            }
        },
        {
            name = 'update',
            description = 'Callback function triggered when a key is pressed.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'dt',
                            description = 'Time since the last update in seconds.'
                        }
                    }
                }
            }
        },
        {
            name = 'visible',
            description = 'Callback function triggered when window is minimized/hidden or unminimized by the user.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'v',
                            description = 'Window visibility.'
                        }
                    }
                }
            }
        }
    }
}