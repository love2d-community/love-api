-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    version = "0.10.2",
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
                            description = 'The major version of LÖVE, i.e. 0 for version 0.9.1.'
                        },
                        {
                            type = 'number',
                            name = 'minor',
                            description = 'The minor version of LÖVE, i.e. 9 for version 0.9.1.'
                        },
                        {
                            type = 'number',
                            name = 'revision',
                            description = 'The revision version of LÖVE, i.e. 1 for version 0.9.1.'
                        },
                        {
                            type = 'string',
                            name = 'codename',
                            description = 'The codename of the current version, i.e. "Baby Inspector" for version 0.9.1.'
                        }
                    }
                }
            }
        },
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
            parenttype = 'Object',
            supertypes = {
                'Object'
            },
            subtypes = {
                'CompressedData',
                'CompressedImageData',
                'FileData',
                'FontData',
                'GlyphData',
                'ImageData',
                'SoundData'
            }
        },
        {
            name = 'Drawable',
            description = 'Superclass for all things that can be drawn on screen. This is an abstract type that can\'t be created directly.',
            parenttype = 'Object',
            supertypes = {
                'Object'
            },
            subtypes = {
                'Canvas',
                'Image',
                'Mesh',
                'ParticleSystem',
                'SpriteBatch',
                'Text',
                'Texture',
                'Video'
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
            },
            subtypes = {
                'BezierCurve',
                'Body',
                'Canvas',
                'ChainShape',
                'Channel',
                'CircleShape',
                'CompressedData',
                'CompressedImageData',
                'Contact',
                'Cursor',
                'Data',
                'Decoder',
                'DistanceJoint',
                'Drawable',
                'EdgeShape',
                'File',
                'FileData',
                'Fixture',
                'Font',
                'FontData',
                'FrictionJoint',
                'GearJoint',
                'GlyphData',
                'Image',
                'ImageData',
                'Joint',
                'Joystick',
                'Mesh',
                'MotorJoint',
                'MouseJoint',
                'ParticleSystem',
                'PixelEffect',
                'PolygonShape',
                'PrismaticJoint',
                'PulleyJoint',
                'Quad',
                'RandomGenerator',
                'Rasterizer',
                'RevoluteJoint',
                'RopeJoint',
                'Shader',
                'Shape',
                'SoundData',
                'Source',
                'SpriteBatch',
                'Text',
                'Texture',
                'Thread',
                'Video',
                'VideoStream',
                'WeldJoint',
                'WheelJoint',
                'World'
            }
        }
    },
    callbacks = {
        {
            name = 'conf',
            description = 'If a file called conf.lua is present in your game folder (or .love file), it is run before the LÖVE modules are loaded. You can use this file to overwrite the love.conf function, which is later called by the LÖVE \'boot\' script. Using the love.conf function, you can set some configuration options, and change things like the default size of the window, which modules are loaded, and other stuff.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 't',
                            description = 'The love.conf function takes one argument: a table filled with all the default values which you can overwrite to your liking. If you want to change the default window size, for instance, do:\n\nfunction love.conf(t)\n    t.window.width = 1024\n    t.window.height = 768\nend\n\nIf you don\'t need the physics module or joystick module, do the following.\n\nfunction love.conf(t)\n    t.modules.joystick = false\n    t.modules.physics = false\nend\n\nSetting unused modules to false is encouraged when you release your game. It reduces startup time slightly (especially if the joystick module is disabled) and reduces memory usage (slightly).\n\nNote that you can\'t disable love.filesystem; it\'s mandatory. The same goes for the love module itself. love.graphics needs love.window to be enabled.',
                            table = {
                                {
                                    type = 'string',
                                    name = 'identity',
                                    default = 'nil',
                                    description = 'This flag determines the name of the save directory for your game. Note that you can only specify the name, not the location where it will be created:\nt.identity = "gabe_HL3" -- Correct\n\nt.identity = "c:/Users/gabe/HL3" -- Incorrect\nAlternatively love.filesystem.setIdentity can be used to set the save directory outside of the config file.'
                                },
                                {
                                    type = 'string',
                                    name = 'version',
                                    default = '"0.10.2"',
                                    description = 't.version should be a string, representing the version of LÖVE for which your game was made. It should be formatted as "X.Y.Z" where X is the major release number, Y the minor, and Z the patch level. It allows LÖVE to display a warning if it isn\'t compatible. Its default is the version of LÖVE running.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'console',
                                    default = 'false',
                                    description = 'Determines whether a console should be opened alongside the game window (Windows only) or not. Note: On OSX you can get console output by running LÖVE through the terminal.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'accelerometerjoystick',
                                    default = 'true',
                                    description = 'Sets whether the device accelerometer on iOS and Android should be exposed as a 3-axis Joystick. Disabling the accelerometer when it\'s not used may reduce CPU usage.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'externalstorage',
                                    default = 'false',
                                    description = 'Sets whether files are saved in external storage (true) or internal storage (false) on Android.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'gammacorrect',
                                    default = 'false',
                                    description = 'Determines whether gamma-correct rendering is enabled, when the system supports it.'
                                },
                                {
                                    type = 'table',
                                    name = 'window',
                                    description = 'It is possible to defer window creation until love.window.setMode is first called in your code. To do so, set t.window = nil in love.conf (or t.screen = nil in older versions.) If this is done, LÖVE may crash if any function from love.graphics is called before the first love.window.setMode in your code.\n\nThe t.window table was named t.screen in versions prior to 0.9.0. The t.screen table doesn\'t exist in love.conf in 0.9.0, and the t.window table doesn\'t exist in love.conf in 0.8.0. This means love.conf will fail to execute (therefore it will fall back to default values) if care is not taken to use the correct table for the LÖVE version being used.',
                                    table = {
                                        {
                                            type = 'string',
                                            name = 'title',
                                            default = '"Untitled"',
                                            description = 'Sets the title of the window the game is in. Alternatively love.window.setTitle can be used to change the window title outside of the config file.'
                                        },
                                        {
                                            type = 'string',
                                            name = 'icon',
                                            default = 'nil',
                                            description = 'A filepath to an image to use as the window\'s icon. Not all operating systems support very large icon images. The icon can also be changed with love.window.setIcon.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'width',
                                            default = '800',
                                            description = 'Sets the window\'s dimensions. If these flags are set to 0 LÖVE automatically uses the user\'s desktop dimensions.'
                                        },
                                        {
                                            type = 'string',
                                            name = 'height',
                                            default = '600',
                                            description = 'Sets the window\'s dimensions. If these flags are set to 0 LÖVE automatically uses the user\'s desktop dimensions.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'borderless',
                                            default = 'false',
                                            description = 'Removes all border visuals from the window. Note that the effects may wary between operating systems.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'resizable',
                                            default = 'false',
                                            description = 'If set to true this allows the user to resize the game\'s window.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'minwidth',
                                            default = '1',
                                            description = 'Sets the minimum width and height for the game\'s window if it can be resized by the user. If you set lower values to window.width and window.height LÖVE will always favor the minimum dimensions set via window.minwidth and window.minheight.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'minheight',
                                            default = '1',
                                            description = 'Sets the minimum width and height for the game\'s window if it can be resized by the user. If you set lower values to window.width and window.height LÖVE will always favor the minimum dimensions set via window.minwidth and window.minheight.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'fullscreen',
                                            default = 'false',
                                            description = 'Whether to run the game in fullscreen (true) or windowed (false) mode. The fullscreen can also be toggled via love.window.setFullscreen or love.window.setMode.'
                                        },
                                        {
                                            type = 'string',
                                            name = 'fullscreentype',
                                            default = '"desktop"',
                                            description = 'Specifies the type of fullscreen mode to use (normal or desktop). Generally the desktop is recommended, as it is less restrictive than normal mode on some operating systems.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'vsync',
                                            default = 'true',
                                            description = 'Enables or deactivates vertical synchronization. Vsync tries to keep the game at a steady framerate and can prevent issues like screen tearing. It is recommended to keep vsync activated if you don\'t know about the possible implications of turning it off.'
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
                                            description = 'The index of the display to show the window in, if multiple monitors are available.'
                                        },
                                        {
                                            type = 'boolean',
                                            name = 'highdpi',
                                            default = 'false',
                                            description = 'See love.window.getPixelScale, love.window.toPixels, and love.window.fromPixels. It is recommended to keep this option disabled if you can\'t test your game on a Mac or iOS system with a Retina display, because code will need tweaking to make sure things look correct.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'x',
                                            default = 'nil',
                                            description = 'Determines the position of the window on the user\'s screen. Alternatively love.window.setPosition can be used to change the position on the fly.'
                                        },
                                        {
                                            type = 'number',
                                            name = 'y',
                                            default = 'nil',
                                            description = 'Determines the position of the window on the user\'s screen. Alternatively love.window.setPosition can be used to change the position on the fly.'
                                        }
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
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
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
                            name = 'focus',
                            description = 'True if the window gains focus, false if it loses focus.'
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
                            name = 'focus',
                            description = 'Whether the window has mouse focus or not.'
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
                        },
                        {
                            type = 'boolean',
                            name = 'istouch',
                            description = 'True if the mouse button press originated from a touchscreen touch-press.'
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
                            description = 'The button index that was pressed. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependent'
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
                            description = 'The button index that was released. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependent.'
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
            description = 'Callback function used to update the state of the game every frame.',
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
                            name = 'visible',
                            description = 'True if the window is visible, false if it isn\'t.'
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
