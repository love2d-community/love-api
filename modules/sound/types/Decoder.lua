local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Decoder',
    description = 'An object which can gradually decode a sound file.',
    constructors = {
        'newDecoder',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'clone',
            description = 'Creates a new copy of current decoder.\n\nThe new decoder will start decoding from the beginning of the audio stream.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Decoder',
                            name = 'decoder',
                            description = 'New copy of the decoder.',
                        },
                    },
                },
            },
        },
        {
            name = 'getBitDepth',
            description = 'Returns the number of bits per sample.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'bitDepth',
                            description = 'Either 8, or 16.',
                        },
                    },
                },
            },
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
                            description = '1 for mono, 2 for stereo.',
                        },
                    },
                },
            },
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
                            description = 'The duration of the sound file in seconds, or -1 if it cannot be determined.',
                        },
                    },
                },
            },
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
                            description = 'Number of samples per second.',
                        },
                    },
                },
            },
        },
    },
}