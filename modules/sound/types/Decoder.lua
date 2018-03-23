return {
    name = 'Decoder',
    description = 'An object which can gradually decode a sound file.',
    constructors = {
        'newDecoder'
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
                            name = 'bitDepth',
                            description = 'Either 8 or 16.'
                        }
                    }
                }
            }
        },
        {
            name = 'getChannelCount',
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
            description = 'Gets the duration of the sound file. It may not always be sample-accurate, and it may return -1 if the duration cannot be determined at all.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'duration',
                            description = 'The duration of the sound file in seconds, or -1 if it cannot be determined.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSampleRate',
            description = 'Returns the sample rate of the Decoder.',
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
        }
    },
    parenttype = 'Object',
    supertypes = {
        'Object'
    }
}
