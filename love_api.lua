return {
    functions = {
        {
            name = 'getVersion',
            description = 'Gets the current running version of LÖVE.',
            functions = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'major',
                            description = 'The major version of LÖVE, e.g. 0 for version 0.9.1.'
                        },
                        {
                            type = 'number',
                            name = 'minor',
                            description = 'The minor version of LÖVE, e.g. 9 for version 0.9.1.'
                        },
                        {
                            type = 'number',
                            name = 'revision',
                            description = 'The revision version of LÖVE, e.g. 1 for version 0.9.1.'
                        },
                        {
                            type = 'string',
                            name = 'codename',
                            description = 'The codename of the current version.'
                        }
                    }
                }
            }
        }
    },
    modules = {
        require('modules/Audio'),
        require('modules/Event'),
        require('modules/Filesystem'),
        require('modules/Graphics'),
        require('modules/Image'),
        require('modules/Joystick'),
        require('modules/Keyboard'),
        require('modules/Math'),
        require('modules/Mouse'),
        require('modules/Physics'),
        require('modules/Sound'),
        require('modules/System'),
        require('modules/Thread'),
        require('modules/Timer'),
        require('modules/Window'),
    },
    types = {
        {
            name = 'Data',
            description = 'The superclass of all data.',
            functions = {
                {
                    name = 'getPointer',
                    description = 'Gets a pointer to the Data.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'light userdata',
                                    name = 'pointer',
                                    description = 'A raw pointer to the Data.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSize',
                    description = 'Gets the size of the Data.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The size of the Data in bytes.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getString',
                    description = 'Gets the full Data as a string.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'data',
                                    description = 'The raw data.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'Drawable',
            description = 'Superclass for all things that can be drawn on screen. This is an abstract type that can\'t be created directly.',
            supertypes = {
                'Object'
            }
        },
        {
            name = 'Object',
            description = 'The superclass of all LÖVE types.',
            functions = {
                {
                    name = 'type',
                    description = 'Gets the type of the object as a string.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'type',
                                    description = 'The type as a string.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'typeOf',
                    description = 'Checks whether an object is of a certain type. If the object has the type with the specified name in its hierarchy, this function will return true.',
                    functions = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the type to check for.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'b',
                                    description = 'True if the object is of the specified type, false otherwise.'
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    callbacks = {
        {
            name = 'draw',
            description = 'Callback function used to draw on the screen every frame.',
            functions = {
                {}
            }
        },
        {
            name = 'errhand',
            description = 'The error handler, used to display error messages.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'msg',
                            description = 'The error message.'
                        }
                    }
                }
            }
        },
        {
            name = 'focus',
            description = 'Callback function triggered when window receives or loses focus.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'f',
                            description = 'Window focus.'
                        }
                    }
                }
            }
        },
        {
            name = 'gamepadaxis',
            description = 'Called when a Joystick\'s virtual gamepad axis is moved.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'GamepadAxis',
                            name = 'axis',
                            description = 'The virtual gamepad axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'gamepadpressed',
            description = 'Called when a Joystick\'s virtual gamepad button is pressed.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'GamepadButton',
                            name = 'button',
                            description = 'The virtual gamepad button.'
                        }
                    }
                }
            }
        },
        {
            name = 'gamepadreleased',
            description = 'Called when a Joystick\'s virtual gamepad button is released.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'GamepadButton',
                            name = 'button',
                            description = 'The virtual gamepad button.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickadded',
            description = 'Called when a Joystick is connected.\n\nThis callback is also triggered after love.load for every Joystick which was already connected when the game started up.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The newly connected Joystick object.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickaxis',
            description = 'Called when a joystick axis moves.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'number',
                            name = 'axis',
                            description = 'The axis number.'
                        },
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The new axis value.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickhat',
            description = 'Called when a joystick hat direction changes.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The joystick object.'
                        },
                        {
                            type = 'number',
                            name = 'hat',
                            description = 'The hat number.'
                        },
                        {
                            type = 'JoystickHat',
                            name = 'direction',
                            description = 'The new hat direction.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickpressed',
            description = 'Called when a joystick button is pressed.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'joystick',
                            description = 'The joystick number.'
                        },
                        {
                            type = 'number',
                            name = 'button',
                            description = 'The button number.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickreleased',
            description = 'Called when a joystick button is released.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'joystick',
                            description = 'The joystick number.'
                        },
                        {
                            type = 'number',
                            name = 'button',
                            description = 'The button number.'
                        }
                    }
                }
            }
        },
        {
            name = 'joystickremoved',
            description = 'Called when a Joystick is disconnected.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Joystick',
                            name = 'joystick',
                            description = 'The now-disconnected Joystick object.'
                        }
                    }
                }
            }
        },
        {
            name = 'keypressed',
            description = 'Callback function triggered when a key is pressed.\n\nKey repeat needs to be enabled with love.keyboard.setKeyRepeat for repeat keypress events to be received.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'Character of the key pressed.'
                        },
                        {
                            type = 'boolean',
                            name = 'isrepeat',
                            description = 'Whether this keypress event is a repeat. The delay between key repeats depends on the user\'s system settings.'
                        }
                    }
                }
            }
        },
        {
            name = 'keyreleased',
            description = 'Callback function triggered when a key is released.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'Character of the key released.'
                        }
                    }
                }
            }
        },
        {
            name = 'load',
            description = 'This function is called exactly once at the beginning of the game.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'arg',
                            description = 'Command line arguments given to the game.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousefocus',
            description = 'Callback function triggered when window receives or loses mouse focus.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'f',
                            description = 'Window mouse focus.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousemoved',
            description = 'Callback function triggered when the mouse is moved.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The mouse position on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The mouse position on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The amount moved along the x-axis since the last time love.mousemoved was called.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The amount moved along the y-axis since the last time love.mousemoved was called.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousepressed',
            description = 'Callback function triggered when a mouse button is pressed.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Mouse x position.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Mouse y position.'
                        },
                        {
                            type = 'MouseConstant',
                            name = 'button',
                            description = 'Mouse button pressed.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousereleased',
            description = 'Callback function triggered when a mouse button is released.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Mouse x position.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Mouse y position.'
                        },
                        {
                            type = 'MouseConstant',
                            name = 'button',
                            description = 'Mouse button released.'
                        }
                    }
                }
            }
        },
        {
            name = 'quit',
            description = 'Callback function triggered when the game is closed.',
            functions = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'r',
                            description = 'Abort quitting. If true, do not close the game.'
                        }
                    }
                }
            }
        },
        {
            name = 'resize',
            description = 'Called when the window is resized, for example if the user resizes the window, or if love.window.setMode is called with an unsupported width or height in fullscreen and the window chooses the closest appropriate size.\n\nCalls to love.window.setMode will only trigger this event if the width or height of the window after the call doesn\'t match the requested width and height. This can happen if a fullscreen mode is requested which doesn\'t match any supported mode, or if the fullscreen type is \'desktop\' and the requested width or height don\'t match the desktop resolution.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'w',
                            description = 'The new width.'
                        },
                        {
                            type = 'number',
                            name = 'h',
                            description = 'The new height.'
                        }
                    }
                }
            }
        },
        {
            name = 'run',
            description = 'The main function, containing the main loop. A sensible default is used when left out.',
            functions = {
                {}
            }
        },
        {
            name = 'textinput',
            description = 'Called when text has been entered by the user. For example if shift-2 is pressed on an American keyboard layout, the text "@" will be generated.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The UTF-8 encoded unicode text.'
                        }
                    }
                }
            }
        },
        {
            name = 'threaderror',
            description = 'Callback function triggered when a Thread encounters an error.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Thread',
                            name = 'thread',
                            description = 'The thread which produced the error.'
                        },
                        {
                            type = 'string',
                            name = 'errorstr',
                            description = 'The error message.'
                        }
                    }
                }
            }
        },
        {
            name = 'update',
            description = 'Callback function triggered when a key is pressed.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'dt',
                            description = 'Time since the last update in seconds.'
                        }
                    }
                }
            }
        },
        {
            name = 'visible',
            description = 'Callback function triggered when window is minimized/hidden or unminimized by the user.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'v',
                            description = 'Window visibility.'
                        }
                    }
                }
            }
        }
    }
}