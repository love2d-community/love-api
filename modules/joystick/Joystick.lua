local path = (...):match('(.-)[^%.]+$') .. '.'

return {
    name = 'joystick',
    description = 'Provides an interface to the user\'s joystick.',
    types = {
        require(path .. 'types.Joystick')
    },
    functions = {
        {
            name = 'getJoystickCount',
            description = 'Gets the number of connected joysticks.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'joystickcount',
                            description = 'The number of connected joysticks.'
                        }
                    }
                }
            }
        },
        {
            name = 'getJoysticks',
            description = 'Gets a list of connected Joysticks.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'joysticks',
                            description = 'The list of currently connected Joysticks.'
                        }
                    }
                }
            }
        },
        {
            name = 'loadGamepadMappings',
            description = 'Loads a gamepad mappings string or file created with love.joystick.saveGamepadMappings.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename to load the mappings string from.'
                        },
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'mappings',
                            description = 'The mappings string to load.'
                        },
                    }
                }
            }
        },
        {
            name = 'saveGamepadMappings',
            description = 'Saves the virtual gamepad mappings of all Joysticks that are recognized as gamepads and have either been recently used or their gamepad bindings have been modified.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename to save the mappings string to.'
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'mappings',
                            description = 'The mappings string that was written to the file.'
                        }
                    }
                },
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'mappings',
                            description = 'The mappings string.'
                        },
                    }
                }
            }
        },
        {
            name = 'setGamepadMapping',
            description = 'Binds a virtual gamepad input to a button, axis or hat for all Joysticks of a certain type. For example, if this function is used with a GUID returned by a Dualshock 3 controller in OS X, the binding will affect Joystick:getGamepadAxis and Joystick:isGamepadDown for all Dualshock 3 controllers used with the game when run in OS X.\n\nLÖVE includes built-in gamepad bindings for many common controllers. This function lets you change the bindings or add new ones for types of Joysticks which aren\'t recognized as gamepads by default.\n\nThe virtual gamepad buttons and axes are designed around the Xbox 360 controller layout.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'guid',
                            description = 'The OS-dependent GUID for the type of Joystick the binding will affect.'
                        },
                        {
                            type = 'GamepadButton',
                            name = 'button',
                            description = 'The virtual gamepad button to bind.'
                        },
                        {
                            type = 'JoystickInputType',
                            name = 'inputtype',
                            description = 'The type of input to bind the virtual gamepad button to.'
                        },
                        {
                            type = 'number',
                            name = 'inputindex',
                            description = 'The index of the axis, button, or hat to bind the virtual gamepad button to.'
                        },
                        {
                            type = 'JoystickHat',
                            name = 'hatdirection',
                            description = 'The direction of the hat, if the virtual gamepad button will be bound to a hat. nil otherwise.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the virtual gamepad button was successfully bound.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'guid',
                            description = 'The OS-dependent GUID for the type of Joystick the binding will affect.'
                        },
                        {
                            type = 'GamepadButton',
                            name = 'axis',
                            description = 'The virtual gamepad axis to bind.'
                        },
                        {
                            type = 'JoystickInputType',
                            name = 'inputtype',
                            description = 'The type of input to bind the virtual gamepad axis to.'
                        },
                        {
                            type = 'number',
                            name = 'inputindex',
                            description = 'The index of the axis, button, or hat to bind the virtual gamepad axis to.'
                        },
                        {
                            type = 'JoystickHat',
                            name = 'hatdirection',
                            description = 'The direction of the hat, if the virtual gamepad axis will be bound to a hat. nil otherwise.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the virtual gamepad button was successfully bound.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        require(path .. 'enums.GamepadAxis'),
        require(path .. 'enums.GamepadButton'),
        require(path .. 'enums.JoystickHat'),
        require(path .. 'enums.JoystickInputType')
    }
}
