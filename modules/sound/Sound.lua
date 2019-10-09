local path = (...):match('(.-)[^%./]+$')

return {
    name = 'sound',
    description = 'This module is responsible for decoding sound files. It can\'t play the sounds, see love.audio for that.',
    types = {
        require(path .. 'types.Decoder'),
        require(path .. 'types.SoundData'),
    },
    functions = {
        {
            name = 'newDecoder',
            description = 'Attempts to find a decoder for the encoded sound data in the specified file.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'The file with encoded sound data.',
                        },
                        {
                            type = 'number',
                            name = 'buffer',
                            description = 'The size of each decoded chunk, in bytes.',
                            default = '2048',
                        },
                    },
                    returns = {
                        {
                            type = 'Decoder',
                            name = 'decoder',
                            description = 'A new Decoder object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the file with encoded sound data.',
                        },
                        {
                            type = 'number',
                            name = 'buffer',
                            description = 'The size of each decoded chunk, in bytes.',
                            default = '2048',
                        },
                    },
                    returns = {
                        {
                            type = 'Decoder',
                            name = 'decoder',
                            description = 'A new Decoder object.',
                        },
                    },
                },
            },
        },
        {
            name = 'newSoundData',
            description = 'Creates new SoundData from a filepath, File, or Decoder. It\'s also possible to create SoundData with a custom sample rate, channel and bit depth.\n\nThe sound data will be decoded to the memory in a raw format. It is recommended to create only short sounds like effects, as a 3 minute song uses 30 MB of memory this way.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The file name of the file to load.',
                        },
                    },
                    returns = {
                        {
                            type = 'SoundData',
                            name = 'soundData',
                            description = 'A new SoundData object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'A File pointing to an audio file.',
                        },
                    },
                    returns = {
                        {
                            type = 'SoundData',
                            name = 'soundData',
                            description = 'A new SoundData object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Decoder',
                            name = 'decoder',
                            description = 'Decode data from this Decoder until EOF.',
                        },
                    },
                    returns = {
                        {
                            type = 'SoundData',
                            name = 'soundData',
                            description = 'A new SoundData object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'samples',
                            description = 'Total number of samples.',
                        },
                        {
                            type = 'number',
                            name = 'rate',
                            description = 'Number of samples per second',
                            default = '44100',
                        },
                        {
                            type = 'number',
                            name = 'bits',
                            description = 'Bits per sample (8 or 16).',
                            default = '16',
                        },
                        {
                            type = 'number',
                            name = 'channels',
                            description = 'Either 1 for mono or 2 for stereo.',
                            default = '2',
                        },
                    },
                    returns = {
                        {
                            type = 'SoundData',
                            name = 'soundData',
                            description = 'A new SoundData object.',
                        },
                    },
                },
            },
        },
    },
    enums = {
    },
}