local path = (...):match('(.-)[^%./]+$')

return {
    name = 'SoundData',
    description = 'Contains raw audio samples.\n\nYou can not play SoundData back directly. You must wrap a Source object around it.',
    constructors = {
        'newSoundData',
    },
    supertypes = {
        'Data',
        'Object',
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
                            name = 'bitdepth',
                            description = 'Either 8, or 16.',
                        },
                    },
                },
            },
        },
        {
            name = 'getChannelCount',
            description = 'Returns the number of channels in the SoundData.',
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
            description = 'Gets the duration of the sound data.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'duration',
                            description = 'The duration of the sound data in seconds.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSample',
            description = 'Gets the value of the sample-point at the specified position. For stereo SoundData objects, the data from the left and right channels are interleaved in that order.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'i',
                            description = 'An integer value specifying the position of the sample (starting at 0).',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'sample',
                            description = 'The normalized samplepoint (range -1.0 to 1.0).',
                        },
                    },
                },
                {
                    description = 'Gets the value of a sample using an explicit sample index instead of interleaving them in the sample position parameter.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'i',
                            description = 'An integer value specifying the position of the sample (starting at 0).',
                        },
                        {
                            type = 'number',
                            name = 'channel',
                            description = 'The index of the channel to get within the given sample.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'sample',
                            description = 'The normalized samplepoint (range -1.0 to 1.0).',
                        },
                    },
                },
            },
        },
        {
            name = 'getSampleCount',
            description = 'Returns the number of samples per channel of the SoundData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'Total number of samples.',
                        },
                    },
                },
            },
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
                            description = 'Number of samples per second.',
                        },
                    },
                },
            },
        },
        {
            name = 'setSample',
            description = 'Sets the value of the sample-point at the specified position. For stereo SoundData objects, the data from the left and right channels are interleaved in that order.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'i',
                            description = 'An integer value specifying the position of the sample (starting at 0).',
                        },
                        {
                            type = 'number',
                            name = 'sample',
                            description = 'The normalized samplepoint (range -1.0 to 1.0).',
                        },
                    },
                },
                {
                    description = 'Sets the value of a sample using an explicit sample index instead of interleaving them in the sample position parameter.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'i',
                            description = 'An integer value specifying the position of the sample (starting at 0).',
                        },
                        {
                            type = 'number',
                            name = 'channel',
                            description = 'The index of the channel to set within the given sample.',
                        },
                        {
                            type = 'number',
                            name = 'sample',
                            description = 'The normalized samplepoint (range -1.0 to 1.0).',
                        },
                    },
                },
            },
        },
    },
}