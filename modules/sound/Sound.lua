-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    name = 'sound',
    description = 'This module is responsible for decoding sound files. It can\'t play the sounds, see love.audio for that.',
    types = {
        require(path .. 'types.Decoder'),
        require(path .. 'types.SoundData')
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
                            description = 'The file with encoded sound data.'
                        },
                        {
                            type = 'number',
                            name = 'buffer',
                            default = '2048',
                            description = 'The size of each decoded chunk, in bytes.'
                        }
                    },
                    returns = {
                        {
                            type = 'Decoder',
                            name = 'decoder',
                            description = 'A new Decoder object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the file with encoded sound data.'
                        },
                        {
                            type = 'number',
                            name = 'buffer',
                            default = '2048',
                            description = 'The size of each decoded chunk, in bytes.'
                        }
                    },
                    returns = {
                        {
                            type = 'Decoder',
                            name = 'decoder',
                            description = 'A new Decoder object.'
                        }
                    }
                }
            }
        },
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
