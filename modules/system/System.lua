local path = (...):match('(.-)[^%./]+$')

return {
    name = 'system',
    description = 'Provides access to information about the user\'s system.',
    types = {
    },
    functions = {
        {
            name = 'getClipboardText',
            description = 'Gets text from the clipboard.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The text currently held in the system\'s clipboard.',
                        },
                    },
                },
            },
        },
        {
            name = 'getOS',
            description = 'Gets the current operating system. In general, LÖVE abstracts away the need to know the current operating system, but there are a few cases where it can be useful (especially in combination with os.execute.)',
            variants = {
                {
                    description = 'In LÖVE version 0.8.0, the \'\'\'love._os\'\'\' string contains the current operating system.',
                    returns = {
                        {
                            type = 'string',
                            name = 'osString',
                            description = 'The current operating system. \'OS X\', \'Windows\', \'Linux\', \'Android\' or \'iOS\'.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPowerInfo',
            description = 'Gets information about the system\'s power supply.',
            variants = {
                {
                    returns = {
                        {
                            type = 'PowerState',
                            name = 'state',
                            description = 'The basic state of the power supply.',
                        },
                        {
                            type = 'number',
                            name = 'percent',
                            description = 'Percentage of battery life left, between 0 and 100. nil if the value can\'t be determined or there\'s no battery.',
                        },
                        {
                            type = 'number',
                            name = 'seconds',
                            description = 'Seconds of battery life left. nil if the value can\'t be determined or there\'s no battery.',
                        },
                    },
                },
            },
        },
        {
            name = 'getProcessorCount',
            description = 'Gets the amount of logical processor in the system.',
            variants = {
                {
                    description = 'The number includes the threads reported if technologies such as Intel\'s Hyper-threading are enabled. For example, on a 4-core CPU with Hyper-threading, this function will return 8.',
                    returns = {
                        {
                            type = 'number',
                            name = 'processorCount',
                            description = 'Amount of logical processors.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasBackgroundMusic',
            description = 'Gets whether another application on the system is playing music in the background.\n\nCurrently this is implemented on iOS and Android, and will always return false on other operating systems. The t.audio.mixwithsystem flag in love.conf can be used to configure whether background audio / music from other apps should play while LÖVE is open.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'backgroundmusic',
                            description = 'True if the user is playing music in the background via another app, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'openURL',
            description = 'Opens a URL with the user\'s web or file browser.',
            variants = {
                {
                    description = 'Passing file:// scheme in Android 7.0 (Nougat) and later always result in failure. Prior to 11.2, this will crash LÖVE instead of returning false.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'url',
                            description = 'The URL to open. Must be formatted as a proper URL.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the URL was opened successfully.',
                        },
                    },
                },
            },
        },
        {
            name = 'setClipboardText',
            description = 'Puts text in the clipboard.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The new text to hold in the system\'s clipboard.',
                        },
                    },
                },
            },
        },
        {
            name = 'vibrate',
            description = 'Causes the device to vibrate, if possible. Currently this will only work on Android and iOS devices that have a built-in vibration motor.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'seconds',
                            description = 'The duration to vibrate for. If called on an iOS device, it will always vibrate for 0.5 seconds due to limitations in the iOS system APIs.',
                            default = '0.5',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.PowerState'),
    },
}