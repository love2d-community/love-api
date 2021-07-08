local path = (...):match('(.-)[^%./]+$')

return {
    name = 'window',
    description = 'Provides an interface for modifying and retrieving information about the program\'s window.',
    types = {
    },
    functions = {
        {
            name = 'close',
            description = 'Closes the window. It can be reopened with love.window.setMode.',
            variants = {
                {
                },
            },
        },
        {
            name = 'fromPixels',
            description = 'Converts a number from pixels to density-independent units.\n\nThe pixel density inside the window might be greater (or smaller) than the \'size\' of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.fromPixels(1600) would return 800 in that case.\n\nThis function converts coordinates from pixels to the size users are expecting them to display at onscreen. love.window.toPixels does the opposite. The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.\n\nMost LÖVE functions return values and expect arguments in terms of pixels rather than density-independent units.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'pixelvalue',
                            description = 'A number in pixels to convert to density-independent units.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The converted number, in density-independent units.',
                        },
                    },
                },
                {
                    description = 'The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, mouse events, love.touch.getPosition, and touch events are always in terms of pixels.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'px',
                            description = 'The x-axis value of a coordinate in pixels.',
                        },
                        {
                            type = 'number',
                            name = 'py',
                            description = 'The y-axis value of a coordinate in pixels.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The converted x-axis value of the coordinate, in density-independent units.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The converted y-axis value of the coordinate, in density-independent units.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDPIScale',
            description = 'Gets the DPI scale factor associated with the window.\n\nThe pixel density inside the window might be greater (or smaller) than the \'size\' of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.getDPIScale() would return 2.0 in that case.\n\nThe love.window.fromPixels and love.window.toPixels functions can also be used to convert between units.\n\nThe highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.',
            variants = {
                {
                    description = 'The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, mouse events, love.touch.getPosition, and touch events are always in terms of pixels.',
                    returns = {
                        {
                            type = 'number',
                            name = 'scale',
                            description = 'The pixel scale factor associated with the window.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDesktopDimensions',
            description = 'Gets the width and height of the desktop.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'displayindex',
                            description = 'The index of the display, if multiple monitors are available.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'width',
                            description = 'The width of the desktop.',
                        },
                        {
                            type = 'string',
                            name = 'height',
                            description = 'The height of the desktop.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDisplayCount',
            description = 'Gets the number of connected monitors.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of currently connected displays.',
                        },
                    },
                },
            },
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
                            description = 'The index of the display to get the name of.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the specified display.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDisplayOrientation',
            description = 'Gets current device display orientation.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'displayindex',
                            description = 'Display index to get its display orientation, or nil for default display index.',
                            default = 'nil',
                        },
                    },
                    returns = {
                        {
                            type = 'DisplayOrientation',
                            name = 'orientation',
                            description = 'Current device display orientation.',
                        },
                    },
                },
            },
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
                            description = 'True if the window is fullscreen, false otherwise.',
                        },
                        {
                            type = 'FullscreenType',
                            name = 'fstype',
                            description = 'The type of fullscreen mode used.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFullscreenModes',
            description = 'Gets a list of supported fullscreen modes.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'displayindex',
                            description = 'The index of the display, if multiple monitors are available.',
                            default = '1',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'modes',
                            description = 'A table of width/height pairs. (Note that this may not be in order.)',
                        },
                    },
                },
            },
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
                            description = 'The window icon imagedata, or nil if no icon has been set with love.window.setIcon.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMode',
            description = 'Gets the display mode and properties of the window.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Window width.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Window height.',
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'Table with the window properties:',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Fullscreen (true), or windowed (false).',
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fullscreentype',
                                    description = 'The type of fullscreen mode used.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'vsync',
                                    description = 'True if the graphics framerate is synchronized with the monitor\'s refresh rate, false otherwise.',
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    description = 'The number of antialiasing samples used (0 if MSAA is disabled).',
                                },
                                {
                                    type = 'boolean',
                                    name = 'resizable',
                                    description = 'True if the window is resizable in windowed mode, false otherwise.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'borderless',
                                    description = 'True if the window is borderless in windowed mode, false otherwise.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'centered',
                                    description = 'True if the window is centered in windowed mode, false otherwise.',
                                },
                                {
                                    type = 'number',
                                    name = 'display',
                                    description = 'The index of the display the window is currently in, if multiple monitors are available.',
                                },
                                {
                                    type = 'number',
                                    name = 'minwidth',
                                    description = 'The minimum width of the window, if it\'s resizable.',
                                },
                                {
                                    type = 'number',
                                    name = 'minheight',
                                    description = 'The minimum height of the window, if it\'s resizable.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'highdpi',
                                    description = 'True if high-dpi mode is allowed on Retina displays in OS X. Does nothing on non-Retina displays.',
                                },
                                {
                                    type = 'number',
                                    name = 'refreshrate',
                                    description = 'The refresh rate of the screen\'s current display mode, in Hz. May be 0 if the value can\'t be determined.',
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-coordinate of the window\'s position in its current display.',
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-coordinate of the window\'s position in its current display.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'srgb',
                                    description = 'Removed in 0.10.0 (use love.graphics.isGammaCorrect instead). True if sRGB gamma correction is applied when drawing to the screen.',
                                },
                            },
                        },
                    },
                },
            },
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
                            description = 'The x-coordinate of the window\'s position.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-coordinate of the window\'s position.',
                        },
                        {
                            type = 'number',
                            name = 'displayindex',
                            description = 'The index of the display that the window is in.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSafeArea',
            description = 'Gets area inside the window which is known to be unobstructed by a system title bar, the iPhone X notch, etc. Useful for making sure UI elements can be seen by the user.',
            variants = {
                {
                    description = 'Values returned are in DPI-scaled units (the same coordinate system as most other window-related APIs), not in pixels.',
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Starting position of safe area (x-axis).',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Starting position of safe area (y-axis).',
                        },
                        {
                            type = 'number',
                            name = 'w',
                            description = 'Width of safe area.',
                        },
                        {
                            type = 'number',
                            name = 'h',
                            description = 'Height of safe area.',
                        },
                    },
                },
            },
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
                            description = 'The current window title.',
                        },
                    },
                },
            },
        },
        {
            name = 'getVSync',
            description = 'Gets current vertical synchronization (vsync).',
            variants = {
                {
                    description = 'This can be less expensive alternative to love.window.getMode if you want to get current vsync status.',
                    returns = {
                        {
                            type = 'number',
                            name = 'vsync',
                            description = 'Current vsync status. 1 if enabled, 0 if disabled, and -1 for adaptive vsync.',
                        },
                    },
                },
            },
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
                            description = 'True if the window has the focus or false if not.',
                        },
                    },
                },
            },
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
                            description = 'True if the window has mouse focus or false if not.',
                        },
                    },
                },
            },
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
                            description = 'True if system display sleep is enabled / allowed, false otherwise.',
                        },
                    },
                },
            },
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
                            description = 'True if the window is currently maximized in windowed mode, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'isMinimized',
            description = 'Gets whether the Window is currently minimized.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'minimized',
                            description = 'True if the window is currently minimized, false otherwise.',
                        },
                    },
                },
            },
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
                            description = 'True if the window is open, false otherwise.',
                        },
                    },
                },
            },
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
                            description = 'True if the window is visible or false if not.',
                        },
                    },
                },
            },
        },
        {
            name = 'maximize',
            description = 'Makes the window as large as possible.\n\nThis function has no effect if the window isn\'t resizable, since it essentially programmatically presses the window\'s \'maximize\' button.',
            variants = {
                {
                },
            },
        },
        {
            name = 'minimize',
            description = 'Minimizes the window to the system\'s task bar / dock.',
            variants = {
                {
                },
            },
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
                            description = 'Whether to continuously request attention until the window becomes active, or to do it only once.',
                            default = 'false',
                        },
                    },
                },
            },
        },
        {
            name = 'restore',
            description = 'Restores the size and position of the window if it was minimized or maximized.',
            variants = {
                {
                },
            },
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
                            description = 'True to enable system display sleep, false to disable it.',
                        },
                    },
                },
            },
        },
        {
            name = 'setFullscreen',
            description = 'Enters or exits fullscreen. The display to use when entering fullscreen is chosen based on which display the window is currently in, if multiple monitors are connected.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'fullscreen',
                            description = 'Whether to enter or exit fullscreen mode.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if an attempt to enter fullscreen was successful, false otherwise.',
                        },
                    },
                },
                {
                    description = 'If fullscreen mode is entered and the window size doesn\'t match one of the monitor\'s display modes (in normal fullscreen mode) or the window size doesn\'t match the desktop size (in \'desktop\' fullscreen mode), the window will be resized appropriately. The window will revert back to its original size again when fullscreen mode is exited using this function.',
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'fullscreen',
                            description = 'Whether to enter or exit fullscreen mode.',
                        },
                        {
                            type = 'FullscreenType',
                            name = 'fstype',
                            description = 'The type of fullscreen mode to use.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if an attempt to enter fullscreen was successful, false otherwise.',
                        },
                    },
                },
            },
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
                            description = 'The window icon image.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the icon has been set successfully.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMode',
            description = 'Sets the display mode and properties of the window.\n\nIf width or height is 0, setMode will use the width and height of the desktop. \n\nChanging the display mode may have side effects: for example, canvases will be cleared and values sent to shaders with canvases beforehand or re-draw to them afterward if you need to.',
            variants = {
                {
                    description = '* If fullscreen is enabled and the width or height is not supported (see resize event will be triggered.\n\n* If the fullscreen type is \'desktop\', then the window will be automatically resized to the desktop resolution.\n\n* If the width and height is bigger than or equal to the desktop dimensions (this includes setting both to 0) and fullscreen is set to false, it will appear \'visually\' fullscreen, but it\'s not true fullscreen and conf.lua (i.e. t.window = false) and use this function to manually create the window, then you must not call any other love.graphics.* function before this one. Doing so will result in undefined behavior and/or crashes because OpenGL cannot function properly without a window.\n\n* Transparent backgrounds are currently not supported.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Display width.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Display height.',
                        },
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'The flags table with the options:',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Fullscreen (true), or windowed (false).',
                                    default = 'false',
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fullscreentype',
                                    description = 'The type of fullscreen to use. This defaults to \'normal\' in 0.9.0 through 0.9.2 and to \'desktop\' in 0.10.0 and older.',
                                    default = '\'desktop\'',
                                },
                                {
                                    type = 'boolean',
                                    name = 'vsync',
                                    description = 'True if LÖVE should wait for vsync, false otherwise.',
                                    default = 'true',
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    description = 'The number of antialiasing samples.',
                                    default = '0',
                                },
                                {
                                    type = 'boolean',
                                    name = 'stencil',
                                    description = 'Whether a stencil buffer should be allocated. If true, the stencil buffer will have 8 bits.',
                                    default = 'true',
                                },
                                {
                                    type = 'number',
                                    name = 'depth',
                                    description = 'The number of bits in the depth buffer.',
                                    default = '0',
                                },
                                {
                                    type = 'boolean',
                                    name = 'resizable',
                                    description = 'True if the window should be resizable in windowed mode, false otherwise.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'borderless',
                                    description = 'True if the window should be borderless in windowed mode, false otherwise.',
                                    default = 'false',
                                },
                                {
                                    type = 'boolean',
                                    name = 'centered',
                                    description = 'True if the window should be centered in windowed mode, false otherwise.',
                                    default = 'true',
                                },
                                {
                                    type = 'number',
                                    name = 'display',
                                    description = 'The index of the display to show the window in, if multiple monitors are available.',
                                    default = '1',
                                },
                                {
                                    type = 'number',
                                    name = 'minwidth',
                                    description = 'The minimum width of the window, if it\'s resizable. Cannot be less than 1.',
                                    default = '1',
                                },
                                {
                                    type = 'number',
                                    name = 'minheight',
                                    description = 'The minimum height of the window, if it\'s resizable. Cannot be less than 1.',
                                    default = '1',
                                },
                                {
                                    type = 'boolean',
                                    name = 'highdpi',
                                    description = 'True if high-dpi mode should be used on Retina displays in macOS and iOS. Does nothing on non-Retina displays.',
                                    default = 'false',
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-coordinate of the window\'s position in the specified display.',
                                    default = 'nil',
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-coordinate of the window\'s position in the specified display.',
                                    default = 'nil',
                                },
                                {
                                    type = 'boolean',
                                    name = 'usedpiscale',
                                    description = 'Disables automatic DPI scaling when false.',
                                    default = 'true',
                                },
                                {
                                    type = 'boolean',
                                    name = 'srgb',
                                    description = 'Removed in 0.10.0 (set t.gammacorrect in conf.lua instead). True if sRGB gamma correction should be applied when drawing to the screen.',
                                    default = 'false',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if successful, false otherwise.',
                        },
                    },
                },
            },
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
                            description = 'The x-coordinate of the window\'s position.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-coordinate of the window\'s position.',
                        },
                        {
                            type = 'number',
                            name = 'displayindex',
                            description = 'The index of the display that the new window position is relative to.',
                            default = '1',
                        },
                    },
                },
            },
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
                            description = 'The new window title.',
                        },
                    },
                },
            },
        },
        {
            name = 'setVSync',
            description = 'Sets vertical synchronization mode.',
            variants = {
                {
                    description = '* Not all graphics drivers support adaptive vsync (-1 value). In that case, it will be automatically set to 1.\n\n* It is recommended to keep vsync activated if you don\'t know about the possible implications of turning it off.\n\n* This function doesn\'t recreate the window, unlike love.window.setMode and love.window.updateMode.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'vsync',
                            description = 'VSync number: 1 to enable, 0 to disable, and -1 for adaptive vsync.',
                        },
                    },
                },
            },
        },
        {
            name = 'showMessageBox',
            description = 'Displays a message box dialog above the love window. The message box contains a title, optional text, and buttons.',
            variants = {
                {
                    description = 'Displays a simple message box with a single \'OK\' button.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'title',
                            description = 'The title of the message box.',
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'The text inside the message box.',
                        },
                        {
                            type = 'MessageBoxType',
                            name = 'type',
                            description = 'The type of the message box.',
                            default = '\'info\'',
                        },
                        {
                            type = 'boolean',
                            name = 'attachtowindow',
                            description = 'Whether the message box should be attached to the love window or free-floating.',
                            default = 'true',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the message box was successfully displayed.',
                        },
                    },
                },
                {
                    description = 'Displays a message box with a customized list of buttons.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'title',
                            description = 'The title of the message box.',
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'The text inside the message box.',
                        },
                        {
                            type = 'table',
                            name = 'buttonlist',
                            description = 'A table containing a list of button names to show. The table can also contain the fields enterbutton and escapebutton, which should be the index of the default button to use when the user presses \'enter\' or \'escape\', respectively.',
                        },
                        {
                            type = 'MessageBoxType',
                            name = 'type',
                            description = 'The type of the message box.',
                            default = '\'info\'',
                        },
                        {
                            type = 'boolean',
                            name = 'attachtowindow',
                            description = 'Whether the message box should be attached to the love window or free-floating.',
                            default = 'true',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'pressedbutton',
                            description = 'The index of the button pressed by the user. May be 0 if the message box dialog was closed without pressing a button.',
                        },
                    },
                },
            },
        },
        {
            name = 'toPixels',
            description = 'Converts a number from density-independent units to pixels.\n\nThe pixel density inside the window might be greater (or smaller) than the \'size\' of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.toPixels(800) would return 1600 in that case.\n\nThis is used to convert coordinates from the size users are expecting them to display at onscreen to pixels. love.window.fromPixels does the opposite. The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.\n\nMost LÖVE functions return values and expect arguments in terms of pixels rather than density-independent units.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'A number in density-independent units to convert to pixels.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'pixelvalue',
                            description = 'The converted number, in pixels.',
                        },
                    },
                },
                {
                    description = 'The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, mouse events, love.touch.getPosition, and touch events are always in terms of pixels.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis value of a coordinate in density-independent units to convert to pixels.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis value of a coordinate in density-independent units to convert to pixels.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'px',
                            description = 'The converted x-axis value of the coordinate, in pixels.',
                        },
                        {
                            type = 'number',
                            name = 'py',
                            description = 'The converted y-axis value of the coordinate, in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'updateMode',
            description = 'Sets the display mode and properties of the window, without modifying unspecified properties.\n\nIf width or height is 0, updateMode will use the width and height of the desktop. \n\nChanging the display mode may have side effects: for example, canvases will be cleared. Make sure to save the contents of canvases beforehand or re-draw to them afterward if you need to.',
            variants = {
                {
                    description = 'If fullscreen is enabled and the width or height is not supported (see resize event will be triggered.\n\nIf the fullscreen type is \'desktop\', then the window will be automatically resized to the desktop resolution.\n\nTransparent backgrounds are currently not supported.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'Window width.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'Window height.',
                        },
                        {
                            type = 'table',
                            name = 'settings',
                            description = 'The settings table with the following optional fields. Any field not filled in will use the current value that would be returned by love.window.getMode.',
                            table = {
                                {
                                    type = 'boolean',
                                    name = 'fullscreen',
                                    description = 'Fullscreen (true), or windowed (false).',
                                },
                                {
                                    type = 'FullscreenType',
                                    name = 'fullscreentype',
                                    description = 'The type of fullscreen to use.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'vsync',
                                    description = 'True if LÖVE should wait for vsync, false otherwise.',
                                },
                                {
                                    type = 'number',
                                    name = 'msaa',
                                    description = 'The number of antialiasing samples.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'resizable',
                                    description = 'True if the window should be resizable in windowed mode, false otherwise.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'borderless',
                                    description = 'True if the window should be borderless in windowed mode, false otherwise.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'centered',
                                    description = 'True if the window should be centered in windowed mode, false otherwise.',
                                },
                                {
                                    type = 'number',
                                    name = 'display',
                                    description = 'The index of the display to show the window in, if multiple monitors are available.',
                                },
                                {
                                    type = 'number',
                                    name = 'minwidth',
                                    description = 'The minimum width of the window, if it\'s resizable. Cannot be less than 1.',
                                },
                                {
                                    type = 'number',
                                    name = 'minheight',
                                    description = 'The minimum height of the window, if it\'s resizable. Cannot be less than 1.',
                                },
                                {
                                    type = 'boolean',
                                    name = 'highdpi',
                                    description = 'True if high-dpi mode should be used on Retina displays in macOS and iOS. Does nothing on non-Retina displays.',
                                },
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'The x-coordinate of the window\'s position in the specified display.',
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'The y-coordinate of the window\'s position in the specified display.',
                                },
                            },
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if successful, false otherwise.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.DisplayOrientation'),
        require(path .. 'enums.FullscreenType'),
        require(path .. 'enums.MessageBoxType'),
    },
}