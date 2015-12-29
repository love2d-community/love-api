return {
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
