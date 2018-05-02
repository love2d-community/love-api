-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    name = 'audio',
    description = 'Provides an interface to create noise with the user\'s speakers.',
    types = {
        require(path .. 'types.Source'),
        require(path .. 'types.RecordingDevice')
    },
    functions = {
        {
            name = 'getActiveSourceCount',
            description = 'Gets the current number of simultaneously playing sources.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The current number of simultaneously playing sources.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDistanceModel',
            description = 'Returns the distance attenuation model.',
            variants = {
                {
                    returns = {
                        {
                            type = 'DistanceModel',
                            name = 'model',
                            description = 'The current distance model. The default is \'inverseclamped\'.'
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
                            type = 'Decoder',
                            name = 'decoder',
                            description = 'The Decoder to create a Source from.'
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
                            description = 'A new Source that can play the specified audio.'
                        }
                    }
                }
            }
        },
        {
            name = 'pause',
            description = 'Pauses currently played Sources.',
            variants = {
                {
                    description = 'This function will pause all currently active Sources.'
                },
                {
                    description = 'This function will only pause the specified Source.',
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
            description = 'Stops currently played sources.',
            variants = {
                {
                    description = 'This function will stop all currently active sources.'
                },
                {
                    description = 'This function will only stop the specified source.',
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
        require(path .. 'enums.DistanceModel'),
        require(path .. 'enums.SourceType'),
        require(path .. 'enums.TimeUnit')
    }
};
