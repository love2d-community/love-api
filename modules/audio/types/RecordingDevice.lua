return {
    name = 'RecordingDevice',
    description = 'Represents an audio input device capable of recording sounds.',
    constructors = {
    },
    functions = {
        {
            name = 'getBitDepth',
            description = 'Gets the number of bits per sample in the data currently being recorded.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'bitdepth',
                            description = 'The number of bits per sample in the data that\'s currently being recorded. (8 or 16).'
                        }
                    }
                }
            }
        },
        {
            name = 'getChannelCount',
            description = 'Gets the number of channels currently being recorded (mono or stereo).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'channels',
                            description = 'The number of channels being recorded (1 for mono, 2 for stereo).'
                        }
                    }
                }
            }
        },
        {
            name = 'getData',
            description = 'Gets all recorded audio SoundData stored in the device\'s internal ring buffer.',
            variants = {
                {
                    returns = {
                        {
                            type = 'SoundData',
                            name = 'data',
                            description = 'The recorded audio data, or nil if the device isn\'t recording.'
                        }
                    }
                }
            }
        },
        {
            name = 'getName',
            description = 'Gets the name of the recording device.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name for this device.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSampleCount',
            description = 'Gets the number of currently recorded samples.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'samples',
                            description = 'The number of samples that have been recorded so far.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSampleRate',
            description = 'Gets the number of samples per second currently being recorded.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'rate',
                            description = 'The number of samples being recorded per second (sample rate).'
                        }
                    }
                }
            }
        },
        {
            name = 'isRecording',
            description = 'Gets whether the device is currently recording.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'recording',
                            description = 'True if the device is recording, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'start',
            description = 'Begins recording audio using this device.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'samplecount',
                            description = 'The maximum number of samples to store in an internal ring buffer when recording. RecordingDevice:getData clears the internal buffer when called.'
                        },
                        {
                            type = 'number',
                            name = 'samplerate',
                            default = '8000',
                            description = 'The number of samples per second to store when recording.'
                        },
                        {
                            type = 'number',
                            name = 'bitdepth',
                            default = '16',
                            description = 'The number of bits per sample.'
                        },
                        {
                            type = 'number',
                            name = 'channels',
                            default = '1',
                            description = 'Whether to record in mono or stereo. Most microphones don\'t support more than 1 channel.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the device successfully began recording using the specified parameters, false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'stop',
            description = 'Stops recording audio from this device.',
            variants = {
                {
                    returns = {
                        {
                            type = 'SoundData',
                            name = 'data',
                            description = 'The sound data currently in the device\'s buffer, or nil if the device wasn\'t recording.'
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
