local path = (...):match('(.-)[^%./]+$')

return {
    name = 'video',
    description = 'This module is responsible for decoding, controlling, and streaming video files.\n\nIt can\'t draw the videos, see love.graphics.newVideo and Video objects for that.',
    types = {
        require(path .. 'types.VideoStream'),
    },
    functions = {
        {
            name = 'newVideoStream',
            description = 'Creates a new VideoStream. Currently only Ogg Theora video files are supported. VideoStreams can\'t draw videos, see love.graphics.newVideo for that.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The file path to the Ogg Theora video file.',
                        },
                    },
                    returns = {
                        {
                            type = 'VideoStream',
                            name = 'videostream',
                            description = 'A new VideoStream.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'The File object containing the Ogg Theora video.',
                        },
                    },
                    returns = {
                        {
                            type = 'VideoStream',
                            name = 'videostream',
                            description = 'A new VideoStream.',
                        },
                    },
                },
            },
        },
    },
    enums = {
    },
}