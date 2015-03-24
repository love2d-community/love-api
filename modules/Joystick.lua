return {
    name = 'joystick',
    description = 'Provides an interface to the user\'s joystick.',
    types = {
        {
            name = 'Joystick',
            description = 'Represents a physical joystick.',
            constructors = {
                'getJoysticks'
            },
            functions = {
                {
                    name = 'getAxes',
                    description = 'Gets the direction of each axis.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'axisDir1',
                                    description = 'Direction of axis1.'
                                },
                                {
                                    type = 'number',
                                    name = 'axisDir2',
                                    description = 'Direction of axis2.'
                                },
                                {
                                    type = 'number',
                                    name = 'axisDirN',
                                    description = 'Direction of axisN.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getAxis',
                    description = 'Gets the direction of an axis.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'axis',
                                    description = 'The index of the axis to be checked.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'direction',
                                    description = 'Current value of the axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getAxisCount',
                    description = 'Gets the number of axes on the joystick.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'axes',
                                    description = 'The number of axes available.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getButtonCount',
                    description = 'Gets the number of buttons on the joystick.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'buttons',
                                    description = 'The number of buttons available.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getGUID',
                    description = 'Gets a stable GUID unique to the type of the physical joystick which does not change over time. For example, all Sony Dualshock 3 controllers in OS X have the same GUID. The value is platform-dependent.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'guid',
                                    description = 'The Joystick type\'s OS-dependent unique identifier.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getGamepadAxis',
                    description = 'Gets the direction of a virtual gamepad axis. If the Joystick isn\'t recognized as a gamepad or isn\'t connected, this function will always return 0.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'GamepadAxis',
                                    name = 'axis',
                                    description = 'The virtual axis to be checked.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'direction',
                                    description = 'Current value of the axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getGamepadMapping',
                    description = 'Gets the button, axis or hat that a virtual gamepad input is bound to.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'GamepadAxis',
                                    name = 'axis',
                                    description = 'The virtual gamepad axis to get the binding for.'
                                }
                            },
                            returns = {
                                {
                                    type = 'JoystickInputType',
                                    name = 'inputtype',
                                    description = 'The type of input the virtual gamepad axis is bound to.'
                                },
                                {
                                    type = 'number',
                                    name = 'inputindex',
                                    description = 'The index of the Joystick\'s button, axis or hat that the virtual gamepad axis is bound to.'
                                },
                                {
                                    type = 'JoystickHat',
                                    name = 'hatdirection',
                                    description = 'The direction of the hat, if the virtual gamepad axis is bound to a hat. nil otherwise.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'GamepadAxis',
                                    name = 'button',
                                    description = 'The virtual gamepad button to get the binding for.'
                                }
                            },
                            returns = {
                                {
                                    type = 'JoystickInputType',
                                    name = 'inputtype',
                                    description = 'The type of input the virtual gamepad button is bound to.'
                                },
                                {
                                    type = 'number',
                                    name = 'inputindex',
                                    description = 'The index of the Joystick\'s button, axis or hat that the virtual gamepad button is bound to.'
                                },
                                {
                                    type = 'JoystickHat',
                                    name = 'hatdirection',
                                    description = 'The direction of the hat, if the virtual gamepad button is bound to a hat. nil otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getHat',
                    description = 'Gets the direction of a hat.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'hat',
                                    description = 'The index of the hat to be checked.'
                                }
                            },
                            returns = {
                                {
                                    type = 'JoystickHat',
                                    name = 'direction',
                                    description = 'The direction the hat is pushed.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getHatCount',
                    description = 'Gets the number of hats on the joystick.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'hats',
                                    description = 'How many hats the joystick has.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getID',
                    description = 'Gets the joystick\'s unique identifier. The identifier will remain the same for the life of the game, even when the Joystick is disconnected and reconnected, but it will change when the game is re-launched.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'id',
                                    description = 'The Joystick\'s unique identifier. Remains the same as long as the game is running.'
                                },
                                {
                                    type = 'number',
                                    name = 'instanceid',
                                    description = 'Unique instance identifier. Changes every time the Joystick is reconnected. nil if the Joystick is not connected.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getName',
                    description = 'Gets the name of the joystick.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the joystick.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getVibration',
                    description = 'Gets the current vibration motor strengths on a Joystick with rumble support.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'left',
                                    description = 'Current strength of the left vibration motor on the Joystick.'
                                },
                                {
                                    type = 'number',
                                    name = 'right',
                                    description = 'Current strength of the right vibration motor on the Joystick.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isConnected',
                    description = 'Gets whether the Joystick is connected.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'connected',
                                    description = 'True if the Joystick is currently connected, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isDown',
                    description = 'Checks if a button on the Joystick is pressed.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = '...',
                                    description = 'The index of a button to check.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'anyDown',
                                    description = 'True if any supplied button is down, false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isGamepad',
                    description = 'Gets whether the Joystick is recognized as a gamepad. If this is the case, the Joystick\'s buttons and axes can be used in a standardized manner across different operating systems and joystick models via Joystick:getGamepadAxis and related functions.\n\nLÖVE automatically recognizes most popular controllers with a similar layout to the Xbox 360 controller as gamepads, but you can add more with love.joystick.setGamepadMapping.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'isgamepad',
                                    description = 'True if the Joystick is recognized as a gamepad, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isGamepadDown',
                    description = 'Checks if a virtual gamepad button on the Joystick is pressed. If the Joystick is not recognized as a Gamepad or isn\'t connected, then this function will always return false.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'GamepadButton',
                                    name = '...',
                                    description = 'The gamepad button to check.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'anyDown',
                                    description = 'True if any supplied button is down, false if not.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isVibrationSupported',
                    description = 'Gets whether the Joystick supports vibration.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'supported',
                                    description = 'True if rumble / force feedback vibration is supported on this Joystick, false if not.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        }
    },
    functions = {
        {
            name = 'setGamepadMapping',
            description = 'Binds a virtual gamepad input to a button, axis or hat for all Joysticks of a certain type. For example, if this function is used with a GUID returned by a Dualshock 3 controller in OS X, the binding will affect Joystick:getGamepadAxis and Joystick:isGamepadDown for all Dualshock 3 controllers used with the game when run in OS X.\n\nLÖVE includes built-in gamepad bindings for many common controllers. This function lets you change the bindings or add new ones for types of Joysticks which aren\'t recognized as gamepads by default.\n\nThe virtual gamepad buttons and axes are designed around the Xbox 360 controller layout.',
            functions = {
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
                            name = 'button',
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
        },
        {
            name = 'getJoystickCount',
            description = 'Gets the number of connected joysticks.',
            functions = {
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
            functions = {
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
        }
    },
    enums = {
        {
            name = 'GamepadAxis',
            description = 'Virtual gamepad axes.',
            constants = {
                {
                    name = 'leftx',
                    description = 'The x-axis of the left thumbstick.'
                },
                {
                    name = 'lefty',
                    description = 'The y-axis of the left thumbstick.'
                },
                {
                    name = 'rightx',
                    description = 'The x-axis of the right thumbstick.'
                },
                {
                    name = 'righty',
                    description = 'The y-axis of the right thumbstick.'
                },
                {
                    name = 'triggerleft',
                    description = 'Left analog trigger.'
                },
                {
                    name = 'triggerright',
                    description = 'Right analog trigger.'
                }
            }
        },
        {
            name = 'GamepadButton',
            description = 'Virtual gamepad buttons.',
            constants = {
                {
                    name = 'a',
                    description = 'Bottom face button (A).'
                },
                {
                    name = 'b',
                    description = 'Right face button (B).'
                },
                {
                    name = 'x',
                    description = 'Left face button (X).'
                },
                {
                    name = 'y',
                    description = 'Top face button (Y).'
                },
                {
                    name = 'back',
                    description = 'Back button.'
                },
                {
                    name = 'guide',
                    description = 'Guide button.'
                },
                {
                    name = 'start',
                    description = 'Start button.'
                },
                {
                    name = 'leftstick',
                    description = 'Left stick click button.'
                },
                {
                    name = 'rightstick',
                    description = 'Right stick click button.'
                },
                {
                    name = 'leftshoulder',
                    description = 'Left bumper.'
                },
                {
                    name = 'rightshoulder',
                    description = 'Right bumper.'
                },
                {
                    name = 'dpup',
                    description = 'D-pad up.'
                },
                {
                    name = 'dpdown',
                    description = 'D-pad down.'
                },
                {
                    name = 'dpleft',
                    description = 'D-pad left.'
                },
                {
                    name = 'dpright',
                    description = 'D-pad right.'
                }
            }
        },
        {
            name = 'JoystickHat',
            description = 'Joystick hat positions.',
            constants = {
                {
                    name = 'c',
                    description = 'Centered'
                },
                {
                    name = 'd',
                    description = 'Down'
                },
                {
                    name = 'l',
                    description = 'Left'
                },
                {
                    name = 'ld',
                    description = 'Left+Down'
                },
                {
                    name = 'lu',
                    description = 'Left+Up'
                },
                {
                    name = 'r',
                    description = 'Right'
                },
                {
                    name = 'rd',
                    description = 'Right+Down'
                },
                {
                    name = 'ru',
                    description = 'Right+Up'
                },
                {
                    name = 'u',
                    description = 'Up'
                }
            }
        },
        {
            name = 'JoystickInputType',
            description = 'Types of Joystick inputs.',
            constants = {
                {
                    name = 'axis',
                    description = 'Analog axis.'
                },
                {
                    name = 'button',
                    description = 'Button.'
                },
                {
                    name = 'hat',
                    description = '8-direction hat value.'
                }
            }
        }
    }
}