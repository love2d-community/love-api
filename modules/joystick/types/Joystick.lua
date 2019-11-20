local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Joystick',
    description = 'Represents a physical joystick.',
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getAxes',
            description = 'Gets the direction of each axis.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'axisDir1',
                            description = 'Direction of axis1.',
                        },
                        {
                            type = 'number',
                            name = 'axisDir2',
                            description = 'Direction of axis2.',
                        },
                        {
                            type = 'number',
                            name = 'axisDirN',
                            description = 'Direction of axisN.',
                        },
                    },
                },
            },
        },
        {
            name = 'getAxis',
            description = 'Gets the direction of an axis.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'axis',
                            description = 'The index of the axis to be checked.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'direction',
                            description = 'Current value of the axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'getAxisCount',
            description = 'Gets the number of axes on the joystick.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'axes',
                            description = 'The number of axes available.',
                        },
                    },
                },
            },
        },
        {
            name = 'getButtonCount',
            description = 'Gets the number of buttons on the joystick.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'buttons',
                            description = 'The number of buttons available.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDeviceInfo',
            description = 'Gets the USB vendor ID, product ID, and product version numbers of joystick which consistent across operating systems.\n\nCan be used to show different icons, etc. for different gamepads.',
            variants = {
                {
                    description = 'Some Linux distribution may not ship with SDL 2.0.6 or later, in which case this function will returns 0 for all the three values.',
                    returns = {
                        {
                            type = 'number',
                            name = 'vendorID',
                            description = 'The USB vendor ID of the joystick.',
                        },
                        {
                            type = 'number',
                            name = 'productID',
                            description = 'The USB product ID of the joystick.',
                        },
                        {
                            type = 'number',
                            name = 'productVersion',
                            description = 'The product version of the joystick.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGUID',
            description = 'Gets a stable GUID unique to the type of the physical joystick which does not change over time. For example, all Sony Dualshock 3 controllers in OS X have the same GUID. The value is platform-dependent.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'guid',
                            description = 'The Joystick type\'s OS-dependent unique identifier.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGamepadAxis',
            description = 'Gets the direction of a virtual gamepad axis. If the Joystick isn\'t recognized as a gamepad or isn\'t connected, this function will always return 0.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'GamepadAxis',
                            name = 'axis',
                            description = 'The virtual axis to be checked.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'direction',
                            description = 'Current value of the axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGamepadMapping',
            description = 'Gets the button, axis or hat that a virtual gamepad input is bound to.',
            variants = {
                {
                    description = 'Returns nil if the Joystick isn\'t recognized as a gamepad or the virtual gamepad axis is not bound to a Joystick input.',
                    arguments = {
                        {
                            type = 'GamepadAxis',
                            name = 'axis',
                            description = 'The virtual gamepad axis to get the binding for.',
                        },
                    },
                    returns = {
                        {
                            type = 'JoystickInputType',
                            name = 'inputtype',
                            description = 'The type of input the virtual gamepad axis is bound to.',
                        },
                        {
                            type = 'number',
                            name = 'inputindex',
                            description = 'The index of the Joystick\'s button, axis or hat that the virtual gamepad axis is bound to.',
                        },
                        {
                            type = 'JoystickHat',
                            name = 'hatdirection',
                            description = 'The direction of the hat, if the virtual gamepad axis is bound to a hat. nil otherwise.',
                        },
                    },
                },
                {
                    description = 'The physical locations for the virtual gamepad axes and buttons correspond as closely as possible to the layout of a standard Xbox 360 controller.',
                    arguments = {
                        {
                            type = 'GamepadButton',
                            name = 'button',
                            description = 'The virtual gamepad button to get the binding for.',
                        },
                    },
                    returns = {
                        {
                            type = 'JoystickInputType',
                            name = 'inputtype',
                            description = 'The type of input the virtual gamepad button is bound to.',
                        },
                        {
                            type = 'number',
                            name = 'inputindex',
                            description = 'The index of the Joystick\'s button, axis or hat that the virtual gamepad button is bound to.',
                        },
                        {
                            type = 'JoystickHat',
                            name = 'hatdirection',
                            description = 'The direction of the hat, if the virtual gamepad button is bound to a hat. nil otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'getGamepadMappingString',
            description = 'Gets the full gamepad mapping string of this Joystick, or nil if it\'s not recognized as a gamepad.\n\nThe mapping string contains binding information used to map the Joystick\'s buttons an axes to the standard gamepad layout, and can be used later with love.joystick.loadGamepadMappings.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'mappingstring',
                            description = 'A string containing the Joystick\'s gamepad mappings, or nil if the Joystick is not recognized as a gamepad.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHat',
            description = 'Gets the direction of the Joystick\'s hat.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'hat',
                            description = 'The index of the hat to be checked.',
                        },
                    },
                    returns = {
                        {
                            type = 'JoystickHat',
                            name = 'direction',
                            description = 'The direction the hat is pushed.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHatCount',
            description = 'Gets the number of hats on the joystick.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'hats',
                            description = 'How many hats the joystick has.',
                        },
                    },
                },
            },
        },
        {
            name = 'getID',
            description = 'Gets the joystick\'s unique identifier. The identifier will remain the same for the life of the game, even when the Joystick is disconnected and reconnected, but it \'\'\'will\'\'\' change when the game is re-launched.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'The Joystick\'s unique identifier. Remains the same as long as the game is running.',
                        },
                        {
                            type = 'number',
                            name = 'instanceid',
                            description = 'Unique instance identifier. Changes every time the Joystick is reconnected. nil if the Joystick is not connected.',
                        },
                    },
                },
            },
        },
        {
            name = 'getName',
            description = 'Gets the name of the joystick.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the joystick.',
                        },
                    },
                },
            },
        },
        {
            name = 'getVibration',
            description = 'Gets the current vibration motor strengths on a Joystick with rumble support.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'left',
                            description = 'Current strength of the left vibration motor on the Joystick.',
                        },
                        {
                            type = 'number',
                            name = 'right',
                            description = 'Current strength of the right vibration motor on the Joystick.',
                        },
                    },
                },
            },
        },
        {
            name = 'isConnected',
            description = 'Gets whether the Joystick is connected.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'connected',
                            description = 'True if the Joystick is currently connected, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'isDown',
            description = 'Checks if a button on the Joystick is pressed.\n\nLÖVE 0.9.0 had a bug which required the button indices passed to Joystick:isDown to be 0-based instead of 1-based, for example button 1 would be 0 for this function. It was fixed in 0.9.1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'buttonN',
                            description = 'The index of a button to check.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'anyDown',
                            description = 'True if any supplied button is down, false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'isGamepad',
            description = 'Gets whether the Joystick is recognized as a gamepad. If this is the case, the Joystick\'s buttons and axes can be used in a standardized manner across different operating systems and joystick models via Joystick:getGamepadAxis, Joystick:isGamepadDown, love.gamepadpressed, and related functions.\n\nLÖVE automatically recognizes most popular controllers with a similar layout to the Xbox 360 controller as gamepads, but you can add more with love.joystick.setGamepadMapping.',
            variants = {
                {
                    description = 'If the Joystick is recognized as a gamepad, the physical locations for the virtual gamepad axes and buttons correspond as closely as possible to the layout of a standard Xbox 360 controller.',
                    returns = {
                        {
                            type = 'boolean',
                            name = 'isgamepad',
                            description = 'True if the Joystick is recognized as a gamepad, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'isGamepadDown',
            description = 'Checks if a virtual gamepad button on the Joystick is pressed. If the Joystick is not recognized as a Gamepad or isn\'t connected, then this function will always return false.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'GamepadButton',
                            name = 'buttonN',
                            description = 'The gamepad button to check.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'anyDown',
                            description = 'True if any supplied button is down, false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'isVibrationSupported',
            description = 'Gets whether the Joystick supports vibration.',
            variants = {
                {
                    description = 'The very first call to this function may take more time than expected because SDL\'s Haptic / Force Feedback subsystem needs to be initialized.',
                    returns = {
                        {
                            type = 'boolean',
                            name = 'supported',
                            description = 'True if rumble / force feedback vibration is supported on this Joystick, false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'setVibration',
            description = 'Sets the vibration motor speeds on a Joystick with rumble support. Most common gamepads have this functionality, although not all drivers give proper support. Use Joystick:isVibrationSupported to check.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'left',
                            description = 'Strength of the left vibration motor on the Joystick. Must be in the range of 1.',
                        },
                        {
                            type = 'number',
                            name = 'right',
                            description = 'Strength of the right vibration motor on the Joystick. Must be in the range of 1.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the vibration was successfully applied, false if not.',
                        },
                    },
                },
                {
                    description = 'Disables vibration.',
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the vibration was successfully disabled, false if not.',
                        },
                    },
                },
                {
                    description = 'If the Joystick only has a single vibration motor, it will still work but it will use the largest value of the left and right parameters.\n\nThe Xbox 360 controller on Mac OS X only has support for vibration if a modified version of the Tattiebogle driver is used.\n\nThe very first call to this function may take more time than expected because SDL\'s Haptic / Force Feedback subsystem needs to be initialized.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'left',
                            description = 'Strength of the left vibration motor on the Joystick. Must be in the range of 1.',
                        },
                        {
                            type = 'number',
                            name = 'right',
                            description = 'Strength of the right vibration motor on the Joystick. Must be in the range of 1.',
                        },
                        {
                            type = 'number',
                            name = 'duration',
                            description = 'The duration of the vibration in seconds. A negative value means infinite duration.',
                            default = '-1',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the vibration was successfully applied, false if not.',
                        },
                    },
                },
            },
        },
    },
}