return {
    name = 'keyboard',
    description = 'Provides an interface to the user\'s keyboard.',
    functions = {
        {
            name = 'getKeyFromScancode',
            description = 'Gets the key corresponding to the given hardware scancode.\n\nThe location of a key is based on the keyboard\'s current language layout, whereas scancodes are the layout-independent representations of where the physical keys are.\n\nFor example, the key located where "q" is on a U.S. keyboard has the scancode "q". When using a U.S. keyboard layout it produces the key "q", but when using a French keyboard layout it produces the key "a".\n\nScancodes are useful for creating default controls that have the same physical locations on on all systems.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'The scancode to get the key from.'
                        }
                    },
                    returns = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'The key corresponding to the given scancode, or "unknown" if the scancode doesn\'t map to a KeyConstant on the current system.'
                        }
                    }
                }
            }
        },
        {
            name = 'getScancodeFromKey',
            description = 'Gets the hardware scancode corresponding to the given key.\n\nUnlike key constants, Scancodes are keyboard layout-independent. For example the scancode "w" will be generated if the key in the same place as the "w" key on an American keyboard is pressed, no matter what the key is labelled or what the user\'s operating system settings are.\n\nScancodes are useful for creating default controls that have the same physical locations on on all systems.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'The key to get the scancode from.'
                        }
                    },
                    returns = {
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'The scancode corresponding to the given key, or "unknown" if the given key has no known physical representation on the current system.'
                        }
                    }
                }
            }
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
                            description = 'Whether key repeat is enabled.'
                        }
                    }
                }
            }
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
                            description = 'Whether text input events are enabled.'
                        }
                    }
                }
            }
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
                            description = 'The key to check.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'down',
                            description = 'True if the key is down, false if not.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'A key to check.'
                        },
                        {
                            type = 'KeyConstant',
                            name = '...',
                            description = 'Additional keys to check.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'anyDown',
                            description = 'True if any supplied key is down, false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'isScancodeDown',
            description = 'Checks whether the specified Scancodes are pressed. Not to be confused with love.keypressed or love.keyreleased.\n\nUnlike regular KeyConstants, Scancodes are keyboard layout-independent. The scancode "w" is used if the key in the same place as the "w" key on an American keyboard is pressed, no matter what the key is labelled or what the user\'s operating system settings are.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'A Scancode to check.'
                        },
                        {
                            type = 'Scancode',
                            name = '...',
                            description = 'Additional Scancodes to check.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'down',
                            description = 'True if any supplied Scancode is down, false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'setKeyRepeat',
            description = 'Enables or disables key repeat. It is disabled by default.\n\nThe interval between repeats depends on the user\'s system settings.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether repeat keypress events should be enabled when a key is held down.'
                        }
                    }
                }
            }
        },
        {
            name = 'setTextInput',
            description = 'Enables or disables text input events. It is enabled by default on Windows, Mac, and Linux, and disabled by default on iOS and Android.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether text input events should be enabled.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        require('modules.keyboard.enums.KeyConstant')
    }
}
