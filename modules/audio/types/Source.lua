local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Source',
    description = 'A Source represents audio you can play back.\n\nYou can do interesting things with Sources, like set the volume, pitch, and its position relative to the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.\n\nThe Source controls (play/pause/stop) act according to the following state table.',
    constructors = {
        'newQueueableSource',
        'newSource',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'clone',
            description = 'Creates an identical copy of the Source in the stopped state.\n\nStatic Sources will use significantly less memory and take much less time to be created if Source:clone is used to create them instead of love.audio.newSource, so this method should be preferred when making multiple Sources which play the same sound.',
            variants = {
                {
                    description = 'Cloned Sources inherit all the set-able state of the original Source, but they are initialized stopped.',
                    returns = {
                        {
                            type = 'Source',
                            name = 'source',
                            description = 'The new identical copy of this Source.',
                        },
                    },
                },
            },
        },
        {
            name = 'getActiveEffects',
            description = 'Gets a list of the Source\'s active effect names.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'effects',
                            description = 'A list of the source\'s active effect names.',
                        },
                    },
                },
            },
        },
        {
            name = 'getAirAbsorption',
            description = 'Gets the amount of air absorption applied to the Source.\n\nBy default the value is set to 0 which means that air absorption effects are disabled. A value of 1 will apply high frequency attenuation to the Source at a rate of 0.05 dB per meter.',
            variants = {
                {
                    description = 'Audio air absorption functionality is not supported on iOS.',
                    returns = {
                        {
                            type = 'number',
                            name = 'amount',
                            description = 'The amount of air absorption applied to the Source.',
                        },
                    },
                },
            },
        },
        {
            name = 'getAttenuationDistances',
            description = 'Gets the reference and maximum attenuation distances of the Source. The values, combined with the current DistanceModel, affect how the Source\'s volume attenuates based on distance from the listener.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ref',
                            description = 'The current reference attenuation distance. If the current DistanceModel is clamped, this is the minimum distance before the Source is no longer attenuated.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The current maximum attenuation distance.',
                        },
                    },
                },
            },
        },
        {
            name = 'getChannelCount',
            description = 'Gets the number of channels in the Source. Only 1-channel (mono) Sources can use directional and positional effects.',
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
            name = 'getCone',
            description = 'Gets the Source\'s directional volume cones. Together with Source:setDirection, the cone angles allow for the Source\'s volume to vary depending on its direction.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'innerAngle',
                            description = 'The inner angle from the Source\'s direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle.',
                        },
                        {
                            type = 'number',
                            name = 'outerAngle',
                            description = 'The outer angle from the Source\'s direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles.',
                        },
                        {
                            type = 'number',
                            name = 'outerVolume',
                            description = 'The Source\'s volume when the listener is outside both the inner and outer cone angles.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDirection',
            description = 'Gets the direction of the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X part of the direction vector.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y part of the direction vector.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z part of the direction vector.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDuration',
            description = 'Gets the duration of the Source. For streaming Sources it may not always be sample-accurate, and may return -1 if the duration cannot be determined at all.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'TimeUnit',
                            name = 'unit',
                            description = 'The time unit for the return value.',
                            default = '\'seconds\'',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'duration',
                            description = 'The duration of the Source, or -1 if it cannot be determined.',
                        },
                    },
                },
            },
        },
        {
            name = 'getEffect',
            description = 'Gets the filter settings associated to a specific effect.\n\nThis function returns nil if the effect was applied with no filter settings associated to it.',
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
                            name = 'filtersettings',
                            description = 'An optional empty table that will be filled with the filter settings.',
                            default = '{}',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'filtersettings',
                            description = 'The settings for the filter associated to this effect, or nil if the effect is not present in this Source or has no filter associated. The table has the following fields:',
                            table = {
                                {
                                    type = 'number',
                                    name = 'volume',
                                    description = 'The overall volume of the audio.',
                                },
                                {
                                    type = 'number',
                                    name = 'highgain',
                                    description = 'Volume of high-frequency audio. Only applies to low-pass and band-pass filters.',
                                },
                                {
                                    type = 'number',
                                    name = 'lowgain',
                                    description = 'Volume of low-frequency audio. Only applies to high-pass and band-pass filters.',
                                },
                            },
                        },
                    },
                },
            },
        },
        {
            name = 'getFilter',
            description = 'Gets the filter settings currently applied to the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'The filter settings to use for this Source, or nil if the Source has no active filter. The table has the following fields:',
                            table = {
                                {
                                    type = 'FilterType',
                                    name = 'type',
                                    description = 'The type of filter to use.',
                                },
                                {
                                    type = 'number',
                                    name = 'volume',
                                    description = 'The overall volume of the audio.',
                                },
                                {
                                    type = 'number',
                                    name = 'highgain',
                                    description = 'Volume of high-frequency audio. Only applies to low-pass and band-pass filters.',
                                },
                                {
                                    type = 'number',
                                    name = 'lowgain',
                                    description = 'Volume of low-frequency audio. Only applies to high-pass and band-pass filters.',
                                },
                            },
                        },
                    },
                },
            },
        },
        {
            name = 'getFreeBufferCount',
            description = 'Gets the number of free buffer slots in a queueable Source. If the queueable Source is playing, this value will increase up to the amount the Source was created with. If the queueable Source is stopped, it will process all of its internal buffers first, in which case this function will always return the amount it was created with.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'buffers',
                            description = 'How many more SoundData objects can be queued up.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPitch',
            description = 'Gets the current pitch of the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'pitch',
                            description = 'The pitch, where 1.0 is normal.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPosition',
            description = 'Gets the position of the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X position of the Source.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y position of the Source.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z position of the Source.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRolloff',
            description = 'Returns the rolloff factor of the source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'rolloff',
                            description = 'The rolloff factor.',
                        },
                    },
                },
            },
        },
        {
            name = 'getType',
            description = 'Gets the type of the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'SourceType',
                            name = 'sourcetype',
                            description = 'The type of the source.',
                        },
                    },
                },
            },
        },
        {
            name = 'getVelocity',
            description = 'Gets the velocity of the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X part of the velocity vector.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y part of the velocity vector.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z part of the velocity vector.',
                        },
                    },
                },
            },
        },
        {
            name = 'getVolume',
            description = 'Gets the current volume of the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'volume',
                            description = 'The volume of the Source, where 1.0 is normal volume.',
                        },
                    },
                },
            },
        },
        {
            name = 'getVolumeLimits',
            description = 'Returns the volume limits of the source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum volume.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum volume.',
                        },
                    },
                },
            },
        },
        {
            name = 'isLooping',
            description = 'Returns whether the Source will loop.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'loop',
                            description = 'True if the Source will loop, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'isPlaying',
            description = 'Returns whether the Source is playing.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'playing',
                            description = 'True if the Source is playing, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'isRelative',
            description = 'Gets whether the Source\'s position, velocity, direction, and cone angles are relative to the listener.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'relative',
                            description = 'True if the position, velocity, direction and cone angles are relative to the listener, false if they\'re absolute.',
                        },
                    },
                },
            },
        },
        {
            name = 'pause',
            description = 'Pauses the Source.',
            variants = {
                {
                },
            },
        },
        {
            name = 'play',
            description = 'Starts playing the Source.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the Source was able to successfully start playing.',
                        },
                    },
                },
            },
        },
        {
            name = 'queue',
            description = 'Queues SoundData for playback in a queueable Source.\n\nThis method requires the Source to be created via love.audio.newQueueableSource.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'SoundData',
                            name = 'sounddata',
                            description = 'The data to queue. The SoundData\'s sample rate, bit depth, and channel count must match the Source\'s.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the data was successfully queued for playback, false if there were no available buffers to use for queueing.',
                        },
                    },
                },
            },
        },
        {
            name = 'seek',
            description = 'Sets the currently playing position of the Source.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'offset',
                            description = 'The position to seek to.',
                        },
                        {
                            type = 'TimeUnit',
                            name = 'unit',
                            description = 'The unit of the position value.',
                            default = '\'seconds\'',
                        },
                    },
                },
            },
        },
        {
            name = 'setAirAbsorption',
            description = 'Sets the amount of air absorption applied to the Source.\n\nBy default the value is set to 0 which means that air absorption effects are disabled. A value of 1 will apply high frequency attenuation to the Source at a rate of 0.05 dB per meter.\n\nAir absorption can simulate sound transmission through foggy air, dry air, smoky atmosphere, etc. It can be used to simulate different atmospheric conditions within different locations in an area.',
            variants = {
                {
                    description = 'Audio air absorption functionality is not supported on iOS.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'amount',
                            description = 'The amount of air absorption applied to the Source. Must be between 0 and 10.',
                        },
                    },
                },
            },
        },
        {
            name = 'setAttenuationDistances',
            description = 'Sets the reference and maximum attenuation distances of the Source. The parameters, combined with the current DistanceModel, affect how the Source\'s volume attenuates based on distance.\n\nDistance attenuation is only applicable to Sources based on mono (rather than stereo) audio.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ref',
                            description = 'The new reference attenuation distance. If the current DistanceModel is clamped, this is the minimum attenuation distance.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The new maximum attenuation distance.',
                        },
                    },
                },
            },
        },
        {
            name = 'setCone',
            description = 'Sets the Source\'s directional volume cones. Together with Source:setDirection, the cone angles allow for the Source\'s volume to vary depending on its direction.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'innerAngle',
                            description = 'The inner angle from the Source\'s direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle.',
                        },
                        {
                            type = 'number',
                            name = 'outerAngle',
                            description = 'The outer angle from the Source\'s direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles.',
                        },
                        {
                            type = 'number',
                            name = 'outerVolume',
                            description = 'The Source\'s volume when the listener is outside both the inner and outer cone angles.',
                            default = '0',
                        },
                    },
                },
            },
        },
        {
            name = 'setDirection',
            description = 'Sets the direction vector of the Source. A zero vector makes the source non-directional.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X part of the direction vector.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y part of the direction vector.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z part of the direction vector.',
                        },
                    },
                },
            },
        },
        {
            name = 'setEffect',
            description = 'Applies an audio effect to the Source.\n\nThe effect must have been previously defined using love.audio.setEffect.',
            variants = {
                {
                    description = 'Applies the given previously defined effect to this Source.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the effect previously set up with love.audio.setEffect.',
                        },
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'If false and the given effect name was previously enabled on this Source, disables the effect.',
                            default = 'true',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the effect was successfully applied to this Source.',
                        },
                    },
                },
                {
                    description = 'Applies the given previously defined effect to this Source, and applies a filter to the Source which affects the sound fed into the effect.\n\nAudio effect functionality is not supported on iOS.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the effect previously set up with love.audio.setEffect.',
                        },
                        {
                            type = 'table',
                            name = 'filtersettings',
                            description = 'The filter settings to apply prior to the effect, with the following fields:',
                            table = {
                                {
                                    type = 'FilterType',
                                    name = 'type',
                                    description = 'The type of filter to use.',
                                },
                                {
                                    type = 'number',
                                    name = 'volume',
                                    description = 'The overall volume of the audio. Must be between 0 and 1.',
                                },
                                {
                                    type = 'number',
                                    name = 'highgain',
                                    description = 'Volume of high-frequency audio. Only applies to low-pass and band-pass filters. Must be between 0 and 1.',
                                },
                                {
                                    type = 'number',
                                    name = 'lowgain',
                                    description = 'Volume of low-frequency audio. Only applies to high-pass and band-pass filters. Must be between 0 and 1.',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the effect and filter were successfully applied to this Source.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFilter',
            description = 'Sets a low-pass, high-pass, or band-pass filter to apply when playing the Source.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'The filter settings to use for this Source, with the following fields:',
                            table = {
                                {
                                    type = 'FilterType',
                                    name = 'type',
                                    description = 'The type of filter to use.',
                                },
                                {
                                    type = 'number',
                                    name = 'volume',
                                    description = 'The overall volume of the audio. Must be between 0 and 1.',
                                },
                                {
                                    type = 'number',
                                    name = 'highgain',
                                    description = 'Volume of high-frequency audio. Only applies to low-pass and band-pass filters. Must be between 0 and 1.',
                                },
                                {
                                    type = 'number',
                                    name = 'lowgain',
                                    description = 'Volume of low-frequency audio. Only applies to high-pass and band-pass filters. Must be between 0 and 1.',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the filter was successfully applied to the Source.',
                        },
                    },
                },
                {
                    description = 'Disables filtering on this Source.\n\n',
                },
            },
        },
        {
            name = 'setLooping',
            description = 'Sets whether the Source should loop.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'loop',
                            description = 'True if the source should loop, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'setPitch',
            description = 'Sets the pitch of the Source.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'pitch',
                            description = 'Calculated with regard to 1 being the base pitch. Each reduction by 50 percent equals a pitch shift of -12 semitones (one octave reduction). Each doubling equals a pitch shift of 12 semitones (one octave increase). Zero is not a legal value.',
                        },
                    },
                },
            },
        },
        {
            name = 'setPosition',
            description = 'Sets the position of the Source. Please note that this only works for mono (i.e. non-stereo) sound files!',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X position of the Source.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y position of the Source.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z position of the Source.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRelative',
            description = 'Sets whether the Source\'s position, velocity, direction, and cone angles are relative to the listener, or absolute.\n\nBy default, all sources are absolute and therefore relative to the origin of love\'s coordinate system 0, 0. Only absolute sources are affected by the position of the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources. ',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True to make the position, velocity, direction and cone angles relative to the listener, false to make them absolute.',
                            default = 'false',
                        },
                    },
                },
            },
        },
        {
            name = 'setRolloff',
            description = 'Sets the rolloff factor which affects the strength of the used distance attenuation.\n\nExtended information and detailed formulas can be found in the chapter \'3.4. Attenuation By Distance\' of OpenAL 1.1 specification.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'rolloff',
                            description = 'The new rolloff factor.',
                        },
                    },
                },
            },
        },
        {
            name = 'setVelocity',
            description = 'Sets the velocity of the Source.\n\nThis does \'\'\'not\'\'\' change the position of the Source, but lets the application know how it has to calculate the doppler effect.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The X part of the velocity vector.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The Y part of the velocity vector.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The Z part of the velocity vector.',
                        },
                    },
                },
            },
        },
        {
            name = 'setVolume',
            description = 'Sets the current volume of the Source.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'volume',
                            description = 'The volume for a Source, where 1.0 is normal volume. Volume cannot be raised above 1.0.',
                        },
                    },
                },
            },
        },
        {
            name = 'setVolumeLimits',
            description = 'Sets the volume limits of the source. The limits have to be numbers from 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum volume.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum volume.',
                        },
                    },
                },
            },
        },
        {
            name = 'stop',
            description = 'Stops a Source.',
            variants = {
                {
                },
            },
        },
        {
            name = 'tell',
            description = 'Gets the currently playing position of the Source.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'TimeUnit',
                            name = 'unit',
                            description = 'The type of unit for the return value.',
                            default = '\'seconds\'',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'position',
                            description = 'The currently playing position of the Source.',
                        },
                    },
                },
            },
        },
    },
}
