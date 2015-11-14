return {
    name = 'sound',
    description = 'This module is responsible for decoding sound files. It can\'t play the sounds, see love.audio for that.',
    types = {
        {
            name = 'Decoder',
            description = 'An object which can gradually decode a sound file.',
            constructors = {
                'newDecoder'
            }
        },
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
                    variants = {
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
                    name = 'getDuration',
                    description = 'Returns the number of channels in the stream.',
                    variants = {
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
                    variants = {
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
                    variants = {
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
                    variants = {
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
                    variants = {
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
            variants = {
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
}
