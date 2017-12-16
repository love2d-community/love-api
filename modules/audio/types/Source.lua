return {
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
            name = 'getChannelCount',
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
            name = 'getDuration',
            description = 'Gets the duration of the Source. For streaming Sources it may not always be sample-accurate, and may return -1 if the duration cannot be determined at all.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'TimeUnit',
                            name = 'unit',
                            default = '"seconds"',
                            description = 'The time unit for the return value.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'duration',
                            description = 'The duration of the Source, or -1 if it cannot be determined.'
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
            name = 'getType',
            description = 'Gets the type (static or stream) of the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'SourceType',
                            name = 'sourcetype',
                            description = 'The type of the source.'
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
            description = 'Sets the rolloff factor which affects the strength of the used distance attenuation.\n\nExtended information and detailed formulas can be found in the chapter "3.4. Attenuation By Distance" of OpenAL 1.1 specification.',
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
    parenttype = 'Object',
    supertypes = {
        'Object'
    }
}
