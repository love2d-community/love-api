-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    name = 'system',
    description = 'Provides access to information about the user\'s system.',
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
                            description = 'The text currently held in the system\'s clipboard.'
                        }
                    }
                }
            }
        },
        {
            name = 'getOS',
            description = 'Gets the current operating system. In general, LÖVE abstracts away the need to know the current operating system, but there are a few cases where it can be useful (especially in combination with os.execute.)',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'osString',
                            description = 'The current operating system. "OS X", "Windows", "Linux", "Android" or "iOS".'
                        }
                    }
                }
            }
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
                            description = 'The basic state of the power supply.'
                        },
                        {
                            type = 'number',
                            name = 'percent',
                            description = 'Percentage of battery life left, between 0 and 100. nil if the value can\'t be determined or there\'s no battery.'
                        },
                        {
                            type = 'number',
                            name = 'seconds',
                            description = 'Seconds of battery life left. nil if the value can\'t be determined or there\'s no battery.'
                        }
                    }
                }
            }
        },
        {
            name = 'getProcessorCount',
            description = 'Gets the amount of logical processor in the system.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'processorCount',
                            description = 'Amount of logical processors.'
                        }
                    }
                }
            }
        },
        {
            name = 'openURL',
            description = 'Opens a URL with the user\'s web or file browser.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'url',
                            description = 'The URL to open. Must be formatted as a proper URL.\n\nTo open a file or folder, "file://" must be prepended to the path.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the URL was opened successfully.'
                        }
                    }
                }
            }
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
                            description = 'The new text to hold in the system\'s clipboard.'
                        }
                    }
                }
            }
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
                            default = '0.5',
                            description = 'The duration to vibrate for. If called on an iOS device, it will always vibrate for 0.5 seconds due to limitations in the iOS system APIs.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        require(path .. 'enums.PowerState')
    }
}
