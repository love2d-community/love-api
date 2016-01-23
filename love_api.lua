local path = (...):match('(.-)[^%.]+$')

return {
    functions = {
        {
            name = 'getVersion',
            description = 'Gets the current running version of LÖVE.',
            variants = {
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
        require(path .. 'modules.audio.Audio'),
        require(path .. 'modules.event.Event'),
        require(path .. 'modules.filesystem.Filesystem'),
        require(path .. 'modules.graphics.Graphics'),
        require(path .. 'modules.image.Image'),
        require(path .. 'modules.joystick.Joystick'),
        require(path .. 'modules.keyboard.Keyboard'),
        require(path .. 'modules.math.Math'),
        require(path .. 'modules.mouse.Mouse'),
        require(path .. 'modules.physics.Physics'),
        require(path .. 'modules.sound.Sound'),
        require(path .. 'modules.system.System'),
        require(path .. 'modules.thread.Thread'),
        require(path .. 'modules.timer.Timer'),
        require(path .. 'modules.touch.Touch'),
        require(path .. 'modules.video.Video'),
        require(path .. 'modules.window.Window')
    },
    types = {
        {
            name = 'Data',
            description = 'The superclass of all data.',
            functions = {
                {
                    name = 'getPointer',
                    description = 'Gets a pointer to the Data.',
                    variants = {
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
                    variants = {
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
                    variants = {
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
                    variants = {
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
                    variants = {
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
    config = {
        name = 'conf',
        description = 'If a file called conf.lua is present in your game folder (or .love file), it is run before the LÖVE modules are loaded. You can use this file to overwrite the love.conf function, which is later called by the LÖVE \'boot\' script. Using the love.conf function, you can set some configuration options, and change things like the default size of the window, which modules are loaded, and other stuff.',
        {
            type = 'string',
            name = 'identity',
            default = 'nil',
            description = 'The name of the save directory.'
        },
        {
            type = 'string',
            name = 'version',
            default = '"0.10.0"',
            description = 'The LÖVE version this game was made for'
        },
        {
            type = 'boolean',
            name = 'console',
            default = 'false',
            description = 'Attach a console.'
        },
        {
            type = 'boolean',
            name = 'accelerometerjoystick',
            default = 'true',
            description = 'Enable the accelerometer on iOS and Android by exposing it as a Joystick.'
        },
        {
            type = 'table',
            name = 'window',
            description = 'Window options.',
            table = {
                {
                    type = 'string',
                    name = 'title',
                    default = '"Untitled"',
                    description = 'The window title.'
                },
                {
                    type = 'string',
                    name = 'icon',
                    default = 'nil',
                    description = 'Filepath to an image to use as the window\'s icon.'
                },
                {
                    type = 'number',
                    name = 'width',
                    default = '800',
                    description = 'The window width.'
                },
                {
                    type = 'string',
                    name = 'height',
                    default = '600',
                    description = 'The window height.'
                },
                {
                    type = 'boolean',
                    name = 'borderless',
                    default = 'false',
                    description = 'Remove all border visuals from the window.'
                },
                {
                    type = 'boolean',
                    name = 'resizable',
                    default = 'false',
                    description = 'Let the window be user-resizable.'
                },
                {
                    type = 'number',
                    name = 'minwidth',
                    default = '1',
                    description = 'Minimum window width if the window is resizable.'
                },
                {
                    type = 'number',
                    name = 'minwidth',
                    default = '1',
                    description = 'Minimum window height if the window is resizable.'
                },
                {
                    type = 'boolean',
                    name = 'fullscreen',
                    default = 'false',
                    description = 'Enable fullscreen.'
                },
                {
                    type = 'string',
                    name = 'fullscreentype',
                    default = '"desktop"',
                    description = 'Choose between "desktop" fullscreen or "exclusive" fullscreen mode.'
                },
                {
                    type = 'boolean',
                    name = 'vsync',
                    default = 'true',
                    description = 'Enable vertical sync.'
                },
                {
                    type = 'number',
                    name = 'msaa',
                    default = '0',
                    description = 'The number of samples to use with multi-sampled antialiasing.'
                },
                {
                    type = 'number',
                    name = 'display',
                    default = '1',
                    description = 'Index of the moniter to show the window in.'
                },
                {
                    type = 'boolean',
                    name = 'highdpi',
                    default = 'false',
                    description = 'Enable high-dpi mode for the window on a Retina display.'
                },
                {
                    type = 'number',
                    name = 'x',
                    default = 'nil',
                    description = 'The x-coordinate of the window\'s position in the specified display.'
                },
                {
                    type = 'number',
                    name = 'y',
                    defalt = 'nil',
                    description = 'The y-coordinate of the window\'s position in the specified display.'
                },
            }
        },
        {
            type = 'table',
            name = 'modules',
            description = 'Module options.',
            table = {
                {
                    type = 'boolean',
                    name = 'audio',
                    default = 'true',
                    description = 'Enable the audio module.'
                },
                {
                    type = 'boolean',
                    name = 'event',
                    default = 'true',
                    description = 'Enable the event module.'
                },
                {
                    type = 'boolean',
                    name = 'graphics',
                    default = 'true',
                    description = 'Enable the graphics module.'
                },
                {
                    type = 'boolean',
                    name = 'image',
                    default = 'true',
                    description = 'Enable the image module.'
                },
                {
                    type = 'boolean',
                    name = 'joystick',
                    default = 'true',
                    description = 'Enable the joystick module.'
                },
                {
                    type = 'boolean',
                    name = 'keyboard',
                    default = 'true',
                    description = 'Enable the keyboard module.'
                },
                {
                    type = 'boolean',
                    name = 'math',
                    default = 'true',
                    description = 'Enable the math module.'
                },
                {
                    type = 'boolean',
                    name = 'mouse',
                    default = 'true',
                    description = 'Enable the mouse module.'
                },
                {
                    type = 'boolean',
                    name = 'physics',
                    default = 'true',
                    description = 'Enable the physics module.'
                },
                {
                    type = 'boolean',
                    name = 'sound',
                    default = 'true',
                    description = 'Enable the sound module.'
                },
                {
                    type = 'boolean',
                    name = 'system',
                    default = 'true',
                    description = 'Enable the system module.'
                },
                {
                    type = 'boolean',
                    name = 'timer',
                    default = 'true',
                    description = 'Enable the timer module.'
                },
                {
                    type = 'boolean',
                    name = 'touch',
                    default = 'true',
                    description = 'Enable the touch module.'
                },
                {
                    type = 'boolean',
                    name = 'video',
                    default = 'true',
                    description = 'Enable the video module.'
                },
                {
                    type = 'boolean',
                    name = 'window',
                    default = 'true',
                    description = 'Enable the window module.'
                },
                {
                    type = 'boolean',
                    name = 'thread',
                    default = 'true',
                    description = 'Enable the thread module.'
                },
            }
        }
    },
    callbacks = {
        {
            name = 'directorydropped',
            description = 'Callback function triggered when a directory is dragged and dropped onto the window.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The full platform-dependent path to the directory. It can be used as an argument to love.filesystem.mount, in order to gain read access to the directory with love.filesystem.'
                        }
                    }
                }
            }
        },
        {
            name = 'draw',
            description = 'Callback function used to draw on the screen every frame.',
            variants = {
                {}
            }
        },
        {
            name = 'errhand',
            description = 'The error handler, used to display error messages.',
            variants = {
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
            name = 'filedropped',
            description = 'Callback function triggered when a file is dragged and dropped onto the window.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'The unopened File object representing the file that was dropped.'
                        }
                    }
                }
            }
        },
        {
            name = 'focus',
            description = 'Callback function triggered when window receives or loses focus.',
            variants = {
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
            variants = {
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
            variants = {
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
            variants = {
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
            variants = {
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
            variants = {
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
            variants = {
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
            variants = {
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
            variants = {
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
            variants = {
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
            description = 'Callback function triggered when a key is pressed.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'Character of the pressed key.'
                        },
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'The scancode representing the pressed key.'
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
            description = 'Callback function triggered when a keyboard key is released.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'Character of the released key.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'Character of the released key.'
                        },
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'The scancode representing the released key.'
                        }
                    }
                }
            }
        },
        {
            name = 'load',
            description = 'This function is called exactly once at the beginning of the game.',
            variants = {
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
            name = 'lowmemory',
            description = 'Callback function triggered when the system is running out of memory on mobile devices.\n\n Mobile operating systems may forcefully kill the game if it uses too much memory, so any non-critical resource should be removed if possible (by setting all variables referencing the resources to nil, and calling collectgarbage()), when this event is triggered. Sounds and images in particular tend to use the most memory.',
            variants = {
                {}
            }
        },
        {
            name = 'mousefocus',
            description = 'Callback function triggered when window receives or loses mouse focus.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'f',
                            description = 'Wether the window has mouse focus or not.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousemoved',
            description = 'Callback function triggered when the mouse is moved.',
            variants = {
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
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Mouse x position, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Mouse y position, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'button',
                            description = 'The button index that was pressed. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependant'
                        },
                        {
                            type = 'boolean',
                            name = 'isTouch',
                            description = 'True if the mouse button press originated from a touchscreen touch-press.'
                        }
                    }
                }
            }
        },
        {
            name = 'mousereleased',
            description = 'Callback function triggered when a mouse button is released.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Mouse x position, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Mouse y position, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'button',
                            description = 'The button index that was released. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependant.'
                        },
                        {
                            type = 'boolean',
                            name = 'isTouch',
                            description = 'True if the mouse button press originated from a touchscreen touch-release.'
                        }
                    }
                }
            }
        },
        {
            name = 'quit',
            description = 'Callback function triggered when the game is closed.',
            variants = {
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
            variants = {
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
            variants = {
                {}
            }
        },
        {
            name = 'textedited',
            description = 'Called when the candidate text for an IME (Input Method Editor) has changed.\n\nThe candidate text is not the final text that the user will eventually choose. Use love.textinput for that.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'text',
                            description = 'The UTF-8 encoded unicode candidate text.'
                        },
                        {
                            type = 'number',
                            name = 'start',
                            description = 'The start cursor of the selected candidate text.'
                        },
                        {
                            type = 'number',
                            name = 'length',
                            description = 'The length of the selected candidate text. May be 0.'
                        }
                    }
                }
            }
        },
        {
            name = 'textinput',
            description = 'Called when text has been entered by the user. For example if shift-2 is pressed on an American keyboard layout, the text "@" will be generated.',
            variants = {
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
            variants = {
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
            name = 'touchmoved',
            description = 'Callback function triggered when a touch press moves inside the touch screen.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'light userdata',
                            name = 'id',
                            description = 'The identifier for the touch press.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis position of the touch inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis position of the touch inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The x-axis movement of the touch inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The y-axis movement of the touch inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'pressure',
                            description = 'The amount of pressure being applied. Most touch screens aren\'t pressure sensitive, in which case the pressure will be 1.'
                        }
                    }
                }
            }
        },
        {
            name = 'touchpressed',
            description = 'Callback function triggered when the touch screen is touched.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'light userdata',
                            name = 'id',
                            description = 'The identifier for the touch press.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis position of the touch press inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis position of the touch press inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The x-axis movement of the touch press inside the window, in pixels. This should always be zero.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The y-axis movement of the touch press inside the window, in pixels. This should always be zero.'
                        },
                        {
                            type = 'number',
                            name = 'pressure',
                            description = 'The amount of pressure being applied. Most touch screens aren\'t pressure sensitive, in which case the pressure will be 1.'
                        }
                    }
                }
            }
        },
        {
            name = 'touchreleased',
            description = 'Callback function triggered when the touch screen stops being touched.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'light userdata',
                            name = 'id',
                            description = 'The identifier for the touch press.'
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis position of the touch inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis position of the touch inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The x-axis movement of the touch inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The y-axis movement of the touch inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'pressure',
                            description = 'The amount of pressure being applied. Most touch screens aren\'t pressure sensitive, in which case the pressure will be 1.'
                        }
                    }
                }
            }
        },
        {
            name = 'update',
            description = 'Callback function triggered when a key is pressed.',
            variants = {
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
            variants = {
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
        },
        {
            name = 'wheelmoved',
            description = 'Callback function triggered when the mouse wheel is moved.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Amount of horizontal mouse wheel movement. Positive values indicate movement to the right.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Amount of vertical mouse wheel movement. Positive values indicate upward movement.'
                        }
                    }
                }
            }
        }
    }
}
