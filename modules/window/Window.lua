-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    name = 'window',
    description = 'Provides an interface for modifying and retrieving information about the program\'s window.',
    functions = {
        {
            name = 'close',
            description = 'Closes the window. It can be reopened with love.window.setMode.',
            variants = {
                {}
            }
        },
        {
            name = 'fromPixels',
            description = 'Converts a number from pixels to density-independent units.\n\nThe pixel density inside the window might be greater (or smaller) than the "size" of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.fromPixels(1600) would return 800 in that case.\n\nThis function converts coordinates from pixels to the size users are expecting them to display at onscreen. love.window.toPixels does the opposite. The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.\n\nMost LÖVE functions return values and expect arguments in terms of pixels rather than density-independent units.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'pixelvalue',
                            description = 'A number in pixels to convert to density-independent units.'
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The converted number, in density-independent units.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'px',
                            description = 'The x-axis value of a coordinate in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'py',
                            description = 'The y-axis value of a coordinate in pixels.'
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The converted x-axis value of the coordinate, in density-independent units.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The converted y-axis value of the coordinate, in density-independent units.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDisplayName',
            description = 'Gets the name of a display.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'displayindex',
                            description = 'The index of the display to get the name of.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the specified display.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDPIScale',
            description = 'Gets the DPI scale factor associated with the window.\n\nThe pixel density inside the window might be greater (or smaller) than the "size" of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.getDPIScale() would return 2.0 in that case.\n\nThe love.window.fromPixels and love.window.toPixels functions can also be used to convert between units.\n\nThe highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The pixel scale factor associated with the window.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFullscreen',
            description = 'Gets whether the window is fullscreen.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'fullscreen',
                            description = 'True if the window is fullscreen, false otherwise.'
                        },
                        {
                            type = 'FullscreenType',
                            name = 'fstype',
                            description = 'The type of fullscreen mode used.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFullscreenModes',
            description = 'Gets a list of supported fullscreen modes.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'display',
                            default = '1',
                            description = 'The index of the display, if multiple monitors are available.'
                        }
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'modes',
                            description = 'A table of width/height pairs. (Note that this may not be in order.)'
                        }
                    }
                }
            }
        },
        {
            name = 'getIcon',
            description = 'Gets the window icon.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imagedata',
                            description = 'The window icon imagedata, or nil of no icon has been set with love.window.setIcon.'
                        }
                    }
                }
            }
        },
        {
            name = 'getMode',
            description = 'Returns the current display mode.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Window width.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Window height.'
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'Table containing the window properties.',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Fullscreen (true), or windowed (false).'
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fullscreentype',
                                    description = 'The type of fullscreen mode used.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'vsync',
                                    description = 'True if the graphics framerate is synchronized with the monitor\'s refresh rate, false otherwise.'
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    description = 'The number of antialiasing samples used (0 if MSAA is disabled).'
                                },
                                {
                                    type = 'boolean',
                                    name = 'resizable',
                                    description = 'True if the window is resizable in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'borderless',
                                    description = 'True if the window is borderless in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'centered',
                                    description = 'True if the window is centered in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'number',
                                    name = 'display',
                                    description = 'The index of the display the window is currently in, if multiple monitors are available.'
                                },
                                {
                                    type = 'number',
                                    name = 'minwidth',
                                    description = 'The minimum width of the window, if it\'s resizable.'
                                },
                                {
                                    type = 'number',
                                    name = 'minheight',
                                    description = 'The minimum height of the window, if it\'s resizable.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'highdpi',
                                    description = 'True if high-dpi mode should be used on Retina displays in OS X and iOS. Does nothing on non-Retina displays. Added in 0.9.1.'
                                },
                                {
                                    type = 'number',
                                    name = 'refreshrate',
                                    description = 'The refresh rate of the screen\'s current display mode, in Hz. May be 0 if the value can\'t be determined.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-coordinate of the window\'s position in its current display.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-coordinate of the window\'s position in its current display.'
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            name = 'getPixelScale',
            description = 'Gets the DPI scale factor associated with the window.\n\nThe pixel density inside the window might be greater (or smaller) than the "size" of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.getPixelScale() would return 2.0 in that case.\n\nThe love.window.fromPixels and love.window.toPixels functions can also be used to convert between units.\n\nThe highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The pixel scale factor associated with the window.'
                        }
                    }
                }
            }
        },
        {
            name = 'getPosition',
            description = 'Gets the position of the window on the screen.\n\nThe window position is in the coordinate space of the display it is currently in.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-coordinate of the window\'s position.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-coordinate of the window\'s position.'
                        },
                        {
                            type = 'number',
                            name = 'display',
                            description = 'The index of the display that the window is in.'
                        }
                    }
                }
            }
        },
        {
            name = 'getTitle',
            description = 'Gets the window title.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'title',
                            description = 'The current window title.'
                        }
                    }
                }
            }
        },
        {
            name = 'hasFocus',
            description = 'Checks if the game window has keyboard focus.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'focus',
                            description = 'True if the window has the focus or false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'hasMouseFocus',
            description = 'Checks if the game window has mouse focus.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'focus',
                            description = 'True if the window has mouse focus or false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'isDisplaySleepEnabled',
            description = 'Gets whether the display is allowed to sleep while the program is running.\n\nDisplay sleep is disabled by default. Some types of input (e.g. joystick button presses) might not prevent the display from sleeping, if display sleep is allowed.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'True if system display sleep is enabled / allowed, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'isMaximized',
            description = 'Gets whether the Window is currently maximized.\n\nThe window can be maximized if it is not fullscreen and is resizable, and either the user has pressed the window\'s Maximize button or love.window.maximize has been called.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'maximized',
                            description = 'True if the window is currently maximized in windowed mode, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'isMinimized',
            description = 'Gets whether the Window is currently minimized.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'maximized',
                            description = 'True if the window is currently minimized, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'isOpen',
            description = 'Checks if the window is open.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'open',
                            description = 'True if the window is open, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'isVisible',
            description = 'Checks if the game window is visible.\n\nThe window is considered visible if it\'s not minimized and the program isn\'t hidden.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'visible',
                            description = 'True if the window is visible or false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'maximize',
            description = 'Makes the window as large as possible.\n\nThis function has no effect if the window isn\'t resizable, since it essentially programmatically presses the window\'s "maximize" button.',
            variants = {
                {}
            }
        },
        {
            name = 'minimize',
            description = 'Minimizes the window to the system\'s task bar / dock.',
            variants = {
                {}
            }
        },
        {
            name = 'restore',
            description = 'Restores the size and position of the window if it was minimized or maximized.'
        },
        {
            name = 'requestAttention',
            description = 'Causes the window to request the attention of the user if it is not in the foreground.\n\nIn Windows the taskbar icon will flash, and in OS X the dock icon will bounce.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'continuous',
                            default = 'false',
                            description = 'Whether to continuously request attention until the window becomes active, or to do it only once.'
                        }
                    }
                }
            }
        },
        {
            name = 'setDisplaySleepEnabled',
            description = 'Sets whether the display is allowed to sleep while the program is running.\n\nDisplay sleep is disabled by default. Some types of input (e.g. joystick button presses) might not prevent the display from sleeping, if display sleep is allowed.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True to enable system display sleep, false to disable it.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFullscreen',
            description = 'Enters or exits fullscreen. The display to use when entering fullscreen is chosen based on which display the window is currently in, if multiple monitors are connected.\n\nIf fullscreen mode is entered and the window size doesn\'t match one of the monitor\'s display modes (in normal fullscreen mode) or the window size doesn\'t match the desktop size (in \'desktop\' fullscreen mode), the window will be resized appropriately. The window will revert back to its original size again when fullscreen mode is exited using this function.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'fullscreen',
                            description = 'Whether to enter or exit fullscreen mode.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if successful, false otherwise.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'fullscreen',
                            description = 'Whether to enter or exit fullscreen mode.'
                        },
                        {
                            type = 'FullscreenType',
                            name = 'fstype',
                            description = 'The type of fullscreen mode to use.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if successful, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'setIcon',
            description = 'Sets the window icon until the game is quit. Not all operating systems support very large icon images.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imagedata',
                            description = 'The window icon image.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the icon has been set successfully.'
                        }
                    }
                }
            }
        },
        {
            name = 'setMode',
            description = 'Sets the display mode and properties of the window.\n\nIf width or height is 0, setMode will use the width and height of the desktop.\n\nChanging the display mode may have side effects: for example, canvases will be cleared and values sent to shaders with Shader:send will be erased. Make sure to save the contents of canvases beforehand or re-draw to them afterward if you need to.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Display width.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Display height.'
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'The flags table with the options:',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    default = 'false',
                                    description = 'Fullscreen (true), or windowed (false).'
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fullscreentype',
                                    default = '"desktop"',
                                    description = 'The type of fullscreen to use. This defaults to "normal" in 0.9.2 and older.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'vsync',
                                    default = 'true',
                                    description = 'True if LÖVE should wait for vsync, false otherwise.'
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    default = '0',
                                    description = 'The number of antialiasing samples.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'resizable',
                                    default = 'false',
                                    description = 'True if the window should be resizable in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'borderless',
                                    default = 'false',
                                    description = 'True if the window should be borderless in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'centered',
                                    default = 'true',
                                    description = 'True if the window should be centered in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'number',
                                    name = 'display',
                                    default = '1',
                                    description = 'The index of the display to show the window in, if multiple monitors are available.'
                                },
                                {
                                    type = 'number',
                                    name = 'minwidth',
                                    default = '1',
                                    description = 'The minimum width of the window, if it\'s resizable. Cannot be less than 1.'
                                },
                                {
                                    type = 'number',
                                    name = 'minheight',
                                    default = '1',
                                    description = 'The minimum height of the window, if it\'s resizable. Cannot be less than 1.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'highdpi',
                                    default = 'false',
                                    description = 'True if high-dpi mode should be used on Retina displays in OS X. Does nothing on non-Retina displays.'
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
                                    default = 'nil',
                                    description = 'The y-coordinate of the window\'s position in the specified display.'
                                }
                            }
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if successful, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'setPosition',
            description = 'Sets the position of the window on the screen.\n\nThe window position is in the coordinate space of the specified display.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-coordinate of the window\'s position.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-coordinate of the window\'s position.'
                        },
                        {
                            type = 'number',
                            name = 'display',
                            description = 'The index of the display that the new window position is relative to.'
                        }
                    }
                }
            }
        },
        {
            name = 'setTitle',
            description = 'Sets the window title.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'title',
                            description = 'The new window title.'
                        }
                    }
                }
            }
        },
        {
            name = 'showMessageBox',
            description = 'Displays a message box dialog above the love window. The message box contains a title, optional text, and buttons.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'title',
                            description = 'The title of the message box.'
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'The text inside the message box.'
                        },
                        {
                            type = 'MessageBoxType',
                            name = 'type',
                            default = '"info"',
                            description = 'The type of the message box.'
                        },
                        {
                            type = 'boolean',
                            name = 'attachtowindow',
                            default = 'true',
                            description = 'Whether the message box should be attached to the love window or free-floating.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the message box was successfully displayed.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'title',
                            description = 'The title of the message box.'
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'The text inside the message box.'
                        },
                        {
                            type = 'table',
                            name = 'buttonlist',
                            description = 'A table containing a list of button names to show. The table can also contain the fields enterbutton and escapebutton, which should be the index of the default button to use when the user presses \'enter\' or \'escape\', respectively.'
                        },
                        {
                            type = 'MessageBoxType',
                            name = 'type',
                            default = '"info"',
                            description = 'The type of the message box.'
                        },
                        {
                            type = 'boolean',
                            name = 'attachtowindow',
                            default = 'true',
                            description = 'Whether the message box should be attached to the love window or free-floating.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'pressedbutton',
                            description = 'The index of the button pressed by the user. May be 0 if the message box dialog was closed without pressing a button.'
                        }
                    }
                }
            }
        },
        {
            name = 'toPixels',
            description = 'Converts a number from density-independent units to pixels.\n\nThe pixel density inside the window might be greater (or smaller) than the "size" of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.toPixels(800) would return 1600 in that case.\n\nThis is used to convert coordinates from the size users are expecting them to display at onscreen to pixels. love.window.fromPixels does the opposite. The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.\n\nMost LÖVE functions return values and expect arguments in terms of pixels rather than density-independent units.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'A number in density-independent units to convert to pixels.'
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'pixelvalue',
                            description = 'The converted number, in pixels.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis value of a coordinate in density-independent units to convert to pixels.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis value of a coordinate in density-independent units to convert to pixels.'
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'px',
                            description = 'The converted x-axis value of the coordinate, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'py',
                            description = 'The converted y-axis value of the coordinate, in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'updateMode',
            description = 'Sets the display mode and properties of the window, without modifying unspecified properties.\n\nIf width or height is 0, updateMode will use the width and height of the desktop.\n\nChanging the display mode may have side effects: for example, canvases will be cleared. Make sure to save the contents of canvases beforehand or re-draw to them afterward if you need to.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Window width.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Window height.'
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'The settings table with the following optional fields. Any field not filled in will use the current value that would be returned by love.window.getMode.',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Fullscreen (true), or windowed (false).'
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fullscreentype',
                                    description = 'The type of fullscreen to use.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'vsync',
                                    description = 'True if LÖVE should wait for vsync, false otherwise.'
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    description = 'The number of antialiasing samples.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'resizable',
                                    description = 'True if the window should be resizable in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'borderless',
                                    description = 'True if the window should be borderless in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'centered',
                                    description = 'True if the window should be centered in windowed mode, false otherwise.'
                                },
                                {
                                    type = 'number',
                                    name = 'display',
                                    description = 'The index of the display to show the window in, if multiple monitors are available.'
                                },
                                {
                                    type = 'number',
                                    name = 'minwidth',
                                    description = 'The minimum width of the window, if it\'s resizable. Cannot be less than 1.'
                                },
                                {
                                    type = 'number',
                                    name = 'minheight',
                                    description = 'The minimum height of the window, if it\'s resizable. Cannot be less than 1.'
                                },
                                {
                                    type = 'boolean',
                                    name = 'highdpi',
                                    description = 'True if high-dpi mode should be used on Retina displays in macOS and iOS. Does nothing on non-Retina displays.'
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-coordinate of the window\'s position in the specified display.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-coordinate of the window\'s position in the specified display.'
                                }
                            }
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if successful, false otherwise.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        require(path .. 'enums.FullscreenType'),
        require(path .. 'enums.MessageBoxType')
    }
}
