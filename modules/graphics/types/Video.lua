local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Video',
    description = 'A drawable video.',
    constructors = {
        'newVideo',
    },
    supertypes = {
        'Drawable',
        'Object',
    },
    functions = {
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the Video in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Video.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Video.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFilter',
            description = 'Gets the scaling filters used when drawing the Video.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'The filter mode used when scaling the Video down.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'The filter mode used when scaling the Video up.',
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of anisotropic filtering used.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the Video in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Video.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSource',
            description = 'Gets the audio Source used for playing back the video\'s audio. May return nil if the video has no audio, or if Video:setSource is called with a nil argument.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The audio Source used for audio playback, or nil if the video has no audio.',
                        },
                    },
                },
            },
        },
        {
            name = 'getStream',
            description = 'Gets the VideoStream object used for decoding and controlling the video.',
            variants = {
                {
                    returns = {
                        {
                            type = 'VideoStream',
                            name = 'stream',
                            description = 'The VideoStream used for decoding and controlling the video.',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the Video in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Video.',
                        },
                    },
                },
            },
        },
        {
            name = 'isPlaying',
            description = 'Gets whether the Video is currently playing.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'playing',
                            description = 'Whether the video is playing.',
                        },
                    },
                },
            },
        },
        {
            name = 'pause',
            description = 'Pauses the Video.',
            variants = {
                {
                },
            },
        },
        {
            name = 'play',
            description = 'Starts playing the Video. In order for the video to appear onscreen it must be drawn with love.graphics.draw.',
            variants = {
                {
                },
            },
        },
        {
            name = 'rewind',
            description = 'Rewinds the Video to the beginning.',
            variants = {
                {
                },
            },
        },
        {
            name = 'seek',
            description = 'Sets the current playback position of the Video.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'offset',
                            description = 'The time in seconds since the beginning of the Video.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFilter',
            description = 'Sets the scaling filters used when drawing the Video.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'The filter mode used when scaling the Video down.',
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'The filter mode used when scaling the Video up.',
                        },
                        {
                            type = 'number',
                            name = 'anisotropy',
                            description = 'Maximum amount of anisotropic filtering used.',
                            default = '1',
                        },
                    },
                },
            },
        },
        {
            name = 'setSource',
            description = 'Sets the audio Source used for playing back the video\'s audio. The audio Source also controls playback speed and synchronization.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The audio Source used for audio playback, or nil to disable audio synchronization.',
                            default = 'nil',
                        },
                    },
                },
            },
        },
        {
            name = 'tell',
            description = 'Gets the current playback position of the Video.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'seconds',
                            description = 'The time in seconds since the beginning of the Video.',
                        },
                    },
                },
            },
        },
    },
}