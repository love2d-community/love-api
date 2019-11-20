local path = (...):match('(.-)[^%./]+$')

return {
    name = 'audio',
    description = 'Provides an interface to create noise with the user\'s speakers.',
    types = {
        require(path .. 'types.RecordingDevice'),
        require(path .. 'types.Source'),
    },
    functions = {
        {
            name = 'getActiveEffects',
            description = 'Gets a list of the names of the currently enabled effects.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'effects',
                            description = 'The list of the names of the currently enabled effects.',
                        },
                    },
                },
            },
        },
        {
            name = 'getActiveSourceCount',
            description = 'Gets the current number of simultaneously playing sources.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The current number of simultaneously playing sources.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDistanceModel',
            description = 'Returns the distance attenuation model.',
            variants = {
                {
                    returns = {
                        {
                            type = 'DistanceModel',
                            name = 'model',
                            description = 'The current distance model. The default is \'inverseclamped\'.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDopplerScale',
            description = 'Gets the current global scale factor for velocity-based doppler effects.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The current doppler scale factor.',
                        },
                    },
                },
            },
        },
        {
            name = 'getEffect',
            description = 'Gets the settings associated with an effect.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the effect.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'The settings associated with the effect.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMaxSceneEffects',
            description = 'Gets the maximum number of active effects supported by the system.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'maximum',
                            description = 'The maximum number of active effects.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMaxSourceEffects',
            description = 'Gets the maximum number of active Effects in a single Source object, that the system can support.',
            variants = {
                {
                    description = 'This function return 0 for system that doesn\'t support audio effects.',
                    returns = {
                        {
                            type = 'number',
                            name = 'maximum',
                            description = 'The maximum number of active Effects per Source.',
                        },
                    },
                },
            },
        },
        {
            name = 'getOrientation',
            description = 'Returns the orientation of the listener.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'fx, fy, fz',
                            description = 'Forward vector of the listener orientation.',
                        },
                        {
                            type = 'number',
                            name = 'ux, uy, uz',
                            description = 'Up vector of the listener orientation.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPosition',
            description = 'Returns the position of the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X position of the listener.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y position of the listener.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z position of the listener.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRecordingDevices',
            description = 'Gets a list of RecordingDevices on the system.\n\nThe first device in the list is the user\'s default recording device. The list may be empty if there are no microphones connected to the system.\n\nAudio recording is currently not supported on iOS.',
            variants = {
                {
                    description = 'Audio recording for Android is supported since 11.3. However, it\'s not supported when APK from Play Store is used.',
                    returns = {
                        {
                            type = 'table',
                            name = 'devices',
                            description = 'The list of connected recording devices.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSourceCount',
            description = 'Gets the current number of simultaneously playing sources.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'numSources',
                            description = 'The current number of simultaneously playing sources.',
                        },
                    },
                },
            },
        },
        {
            name = 'getVelocity',
            description = 'Returns the velocity of the listener.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X velocity of the listener.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y velocity of the listener.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z velocity of the listener.',
                        },
                    },
                },
            },
        },
        {
            name = 'getVolume',
            description = 'Returns the master volume.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'volume',
                            description = 'The current master volume',
                        },
                    },
                },
            },
        },
        {
            name = 'isEffectsSupported',
            description = 'Gets whether audio effects are supported in the system.',
            variants = {
                {
                    description = 'Older Linux distributions that ship with older OpenAL library may not support audio effects. Furthermore, iOS doesn\'t\n\nsupport audio effects at all.',
                    returns = {
                        {
                            type = 'boolean',
                            name = 'supported',
                            description = 'True if effects are supported, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'newQueueableSource',
            description = 'Creates a new Source usable for real-time generated sound playback with Source:queue.',
            variants = {
                {
                    description = 'The sample rate, bit depth, and channel count of any SoundData used with Source:queue must match the parameters given to this constructor.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'samplerate',
                            description = 'Number of samples per second when playing.',
                        },
                        {
                            type = 'number',
                            name = 'bitdepth',
                            description = 'Bits per sample (8 or 16).',
                        },
                        {
                            type = 'number',
                            name = 'channels',
                            description = '1 for mono or 2 for stereo.',
                        },
                        {
                            type = 'number',
                            name = 'buffercount',
                            description = 'The number of buffers that can be queued up at any given time with Source:queue. Cannot be greater than 64. A sensible default (~8) is chosen if no value is specified.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The new Source usable with Source:queue.',
                        },
                    },
                },
            },
        },
        {
            name = 'newSource',
            description = 'Creates a new Source from a filepath, File, Decoder or SoundData.\n\nSources created from SoundData are always static.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filepath to the audio file.',
                        },
                        {
                            type = 'SourceType',
                            name = 'type',
                            description = 'Streaming or static source.',
                        },
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio.',
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
                        {
                            type = 'SourceType',
                            name = 'type',
                            description = 'Streaming or static source.',
                        },
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Decoder',
                            name = 'decoder',
                            description = 'The Decoder to create a Source from.',
                        },
                        {
                            type = 'SourceType',
                            name = 'type',
                            description = 'Streaming or static source.',
                        },
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'data',
                            description = 'The FileData to create a Source from.',
                        },
                        {
                            type = 'SourceType',
                            name = 'type',
                            description = 'Streaming or static source.',
                        },
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'SoundData',
                            name = 'data',
                            description = 'The SoundData to create a Source from.',
                        },
                    },
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'A new Source that can play the specified audio. The SourceType of the returned audio is \'static\'.',
                        },
                    },
                },
            },
        },
        {
            name = 'pause',
            description = 'Pauses specific or all currently played Sources.',
            variants = {
                {
                    description = 'Pauses all currently active Sources and returns them.',
                    returns = {
                        {
                            type = 'table',
                            name = 'Sources',
                            description = 'A table containing a list of Sources that were paused by this call.',
                        },
                    },
                },
                {
                    description = 'Pauses the given Sources.',
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The first Source to pause.',
                        },
                        {
                            type = 'Source',
                            name = '...',
                            description = 'Additional Sources to pause.',
                        },
                    },
                },
                {
                    description = 'Pauses the given Sources.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'sources',
                            description = 'A table containing a list of Sources to pause.',
                        },
                    },
                },
            },
        },
        {
            name = 'play',
            description = 'Plays the specified Source.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The Source to play.',
                        },
                    },
                },
                {
                    description = 'Starts playing multiple Sources simultaneously.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'sources',
                            description = 'Table containing a list of Sources to play.',
                        },
                    },
                },
                {
                    description = 'Starts playing multiple Sources simultaneously.',
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source1',
                            description = 'The first Source to play.',
                        },
                        {
                            type = 'Source',
                            name = 'source2',
                            description = 'The second Source to play.',
                        },
                        {
                            type = 'Source',
                            name = '...',
                            description = 'Additional Sources to play.',
                        },
                    },
                },
            },
        },
        {
            name = 'setDistanceModel',
            description = 'Sets the distance attenuation model.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'DistanceModel',
                            name = 'model',
                            description = 'The new distance model.',
                        },
                    },
                },
            },
        },
        {
            name = 'setDopplerScale',
            description = 'Sets a global scale factor for velocity-based doppler effects. The default scale value is 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The new doppler scale factor. The scale must be greater than 0.',
                        },
                    },
                },
            },
        },
        {
            name = 'setEffect',
            description = 'Defines an effect that can be applied to a Source.\n\nNot all system supports audio effects. Use love.audio.isEffectsSupported to check.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the effect.',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'The settings to use for this effect, with the following fields:',
                            table = {
                                {
                                    type = 'EffectType',
                                    name = 'type',
                                    description = 'The type of effect to use.',
                                },
                                {
                                    type = 'number',
                                    name = 'volume',
                                    description = 'The volume of the effect.',
                                },
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'Effect-specific settings. See EffectType for available effects and their corresponding settings.',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the effect was successfully created.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the effect.',
                        },
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'If false and the given effect name was previously set, disables the effect.',
                            default = 'true',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the effect was successfully disabled.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMixWithSystem',
            description = 'Sets whether the system should mix the audio with the system\'s audio.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'mix',
                            description = 'True to enable mixing, false to disable it.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the change succeeded, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'setOrientation',
            description = 'Sets the orientation of the listener.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'fx, fy, fz',
                            description = 'Forward vector of the listener orientation.',
                        },
                        {
                            type = 'number',
                            name = 'ux, uy, uz',
                            description = 'Up vector of the listener orientation.',
                        },
                    },
                },
            },
        },
        {
            name = 'setPosition',
            description = 'Sets the position of the listener, which determines how sounds play.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the listener.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the listener.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The z position of the listener.',
                        },
                    },
                },
            },
        },
        {
            name = 'setVelocity',
            description = 'Sets the velocity of the listener.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X velocity of the listener.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y velocity of the listener.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z velocity of the listener.',
                        },
                    },
                },
            },
        },
        {
            name = 'setVolume',
            description = 'Sets the master volume.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'volume',
                            description = '1.0 is max and 0.0 is off.',
                        },
                    },
                },
            },
        },
        {
            name = 'stop',
            description = 'Stops currently played sources.',
            variants = {
                {
                    description = 'This function will stop all currently active sources.',
                },
                {
                    description = 'This function will only stop the specified source.',
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The source on which to stop the playback.',
                        },
                    },
                },
                {
                    description = 'Simultaneously stops all given Sources.',
                    arguments = {
                        {
                            type = 'Source',
                            name = 'source1',
                            description = 'The first Source to stop.',
                        },
                        {
                            type = 'Source',
                            name = 'source2',
                            description = 'The second Source to stop.',
                        },
                        {
                            type = 'Source',
                            name = '...',
                            description = 'Additional Sources to stop.',
                        },
                    },
                },
                {
                    description = 'Simultaneously stops all given Sources.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'sources',
                            description = 'A table containing a list of Sources to stop.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.DistanceModel'),
        require(path .. 'enums.EffectType'),
        require(path .. 'enums.EffectWaveform'),
        require(path .. 'enums.FilterType'),
        require(path .. 'enums.SourceType'),
        require(path .. 'enums.TimeUnit'),
    },
}