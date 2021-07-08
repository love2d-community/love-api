local path = (...):match('(.-)[^%./]+$')

return {
    name = 'keyboard',
    description = 'Provides an interface to the user\'s keyboard.',
    types = {
    },
    functions = {
        {
            name = 'getKeyFromScancode',
            description = 'Gets the key corresponding to the given hardware scancode.\n\nUnlike key constants, Scancodes are keyboard layout-independent. For example the scancode \'w\' will be generated if the key in the same place as the \'w\' key on an American keyboard is pressed, no matter what the key is labelled or what the user\'s operating system settings are.\n\nScancodes are useful for creating default controls that have the same physical locations on on all systems.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'The scancode to get the key from.',
                        },
                    },
                    returns = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'The key corresponding to the given scancode, or \'unknown\' if the scancode doesn\'t map to a KeyConstant on the current system.',
                        },
                    },
                },
            },
        },
        {
            name = 'getScancodeFromKey',
            description = 'Gets the hardware scancode corresponding to the given key.\n\nUnlike key constants, Scancodes are keyboard layout-independent. For example the scancode \'w\' will be generated if the key in the same place as the \'w\' key on an American keyboard is pressed, no matter what the key is labelled or what the user\'s operating system settings are.\n\nScancodes are useful for creating default controls that have the same physical locations on on all systems.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'The key to get the scancode from.',
                        },
                    },
                    returns = {
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'The scancode corresponding to the given key, or \'unknown\' if the given key has no known physical representation on the current system.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasKeyRepeat',
            description = 'Gets whether key repeat is enabled.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'Whether key repeat is enabled.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasScreenKeyboard',
            description = 'Gets whether screen keyboard is supported.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'supported',
                            description = 'Whether screen keyboard is supported.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasTextInput',
            description = 'Gets whether text input events are enabled.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'Whether text input events are enabled.',
                        },
                    },
                },
            },
        },
        {
            name = 'isDown',
            description = 'Checks whether a certain key is down. Not to be confused with love.keypressed or love.keyreleased.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'The key to check.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'down',
                            description = 'True if the key is down, false if not.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'A key to check.',
                        },
                        {
                            type = 'KeyConstant',
                            name = '...',
                            description = 'Additional keys to check.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'anyDown',
                            description = 'True if any supplied key is down, false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'isScancodeDown',
            description = 'Checks whether the specified Scancodes are pressed. Not to be confused with love.keypressed or love.keyreleased.\n\nUnlike regular KeyConstants, Scancodes are keyboard layout-independent. The scancode \'w\' is used if the key in the same place as the \'w\' key on an American keyboard is pressed, no matter what the key is labelled or what the user\'s operating system settings are.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'A Scancode to check.',
                        },
                        {
                            type = 'Scancode',
                            name = '...',
                            description = 'Additional Scancodes to check.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'down',
                            description = 'True if any supplied Scancode is down, false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'setKeyRepeat',
            description = 'Enables or disables key repeat for love.keypressed. It is disabled by default.',
            variants = {
                {
                    description = 'The interval between repeats depends on the user\'s system settings. This function doesn\'t affect whether love.textinput is called multiple times while a key is held down.',
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether repeat keypress events should be enabled when a key is held down.',
                        },
                    },
                },
            },
        },
        {
            name = 'setTextInput',
            description = 'Enables or disables text input events. It is enabled by default on Windows, Mac, and Linux, and disabled by default on iOS and Android.\n\nOn touch devices, this shows the system\'s native on-screen keyboard when it\'s enabled.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether text input events should be enabled.',
                        },
                    },
                },
                {
                    description = 'On iOS and Android this variant tells the OS that the specified rectangle is where text will show up in the game, which prevents the system on-screen keyboard from covering the text.',
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether text input events should be enabled.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Text rectangle x position.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Text rectangle y position.',
                        },
                        {
                            type = 'number',
                            name = 'w',
                            description = 'Text rectangle width.',
                        },
                        {
                            type = 'number',
                            name = 'h',
                            description = 'Text rectangle height.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.KeyConstant'),
        require(path .. 'enums.Scancode'),
    },
}