local path = (...):match('(.-)[^%./]+$')

return {
    name = 'VideoStream',
    description = 'An object which decodes, streams, and controls Videos.',
    constructors = {
        'newVideoStream',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getFilename',
            description = 'Gets the filename of the VideoStream.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the VideoStream'
                        },
                    },
                },
            },
        },
        {
            name = 'isPlaying',
            description = 'Gets whether the VideoStream is playing.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'playing',
                            description = 'Whether the VideoStream is playing.'
                        },
                    },
                },
            },
        },
        {
            name = 'pause',
            description = 'Pauses the VideoStream.',
            variants = {
                {
                },
            },
        },
        {
            name = 'play',
            description = 'Plays the VideoStream.',
            variants = {
                {
                },
            },
        },
        {
            name = 'rewind',
            description = 'Rewinds the VideoStream. Synonym to VideoStream:seek(0).',
            variants = {
                {
                },
            },
        },
        {
            name = 'seek',
            description = 'Sets the current playback position of the VideoStream.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'offset',
                            description = 'The time in seconds since the beginning of the VideoStream.'
                        },
                    },
                },
            },
        },
        {
            name = 'tell',
            description = 'Gets the current playback position of the VideoStream.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'seconds',
                            description = 'The number of seconds sionce the beginning of the VideoStream.'
                        },
                    },
                },
            },
        },
    },
}
