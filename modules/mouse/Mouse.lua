local path = (...):match('(.-)[^%./]+$')

return {
    name = 'mouse',
    description = 'Provides an interface to the user\'s mouse.',
    types = {
        require(path .. 'types.Cursor'),
    },
    functions = {
        {
            name = 'getCursor',
            description = 'Gets the current Cursor.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The current cursor, or nil if no cursor is set.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPosition',
            description = 'Returns the current position of the mouse.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the mouse along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the mouse along the y-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRelativeMode',
            description = 'Gets whether relative mode is enabled for the mouse.\n\nIf relative mode is enabled, the cursor is hidden and doesn\'t move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.\n\nThe reported position of the mouse is not updated while relative mode is enabled, even when relative mouse motion events are generated.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'True if relative mode is enabled, false if it\'s disabled.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSystemCursor',
            description = 'Gets a Cursor object representing a system-native hardware cursor.\n\nHardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse\'s current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.',
            variants = {
                {
                    description = 'The \'image\' CursorType is not a valid argument. Use love.mouse.newCursor to create a hardware cursor using a custom image.',
                    arguments = {
                        {
                            type = 'CursorType',
                            name = 'ctype',
                            description = 'The type of system cursor to get. ',
                        },
                    },
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The Cursor object representing the system cursor type.',
                        },
                    },
                },
            },
        },
        {
            name = 'getX',
            description = 'Returns the current x-position of the mouse.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the mouse along the x-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'getY',
            description = 'Returns the current y-position of the mouse.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the mouse along the y-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'isCursorSupported',
            description = 'Gets whether cursor functionality is supported.\n\nIf it isn\'t supported, calling love.mouse.newCursor and love.mouse.getSystemCursor will cause an error. Mobile devices do not support cursors.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'supported',
                            description = 'Whether the system has cursor functionality.',
                        },
                    },
                },
            },
        },
        {
            name = 'isDown',
            description = 'Checks whether a certain mouse button is down.\n\nThis function does not detect mouse wheel scrolling; you must use the love.wheelmoved (or love.mousepressed in version 0.9.2 and older) callback for that. ',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'button',
                            description = 'The index of a button to check. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependant.',
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional button numbers to check.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'down',
                            description = 'True if any specified button is down.',
                        },
                    },
                },
            },
        },
        {
            name = 'isGrabbed',
            description = 'Checks if the mouse is grabbed.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'grabbed',
                            description = 'True if the cursor is grabbed, false if it is not.',
                        },
                    },
                },
            },
        },
        {
            name = 'isVisible',
            description = 'Checks if the cursor is visible.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'visible',
                            description = 'True if the cursor to visible, false if the cursor is hidden.',
                        },
                    },
                },
            },
        },
        {
            name = 'newCursor',
            description = 'Creates a new hardware Cursor object from an image file or ImageData.\n\nHardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse\'s current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.\n\nThe hot spot is the point the operating system uses to determine what was clicked and at what position the mouse cursor is. For example, the normal arrow pointer normally has its hot spot at the top left of the image, but a crosshair cursor might have it in the middle.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The ImageData to use for the new Cursor.',
                        },
                        {
                            type = 'number',
                            name = 'hotx',
                            description = 'The x-coordinate in the ImageData of the cursor\'s hot spot.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'hoty',
                            description = 'The y-coordinate in the ImageData of the cursor\'s hot spot.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The new Cursor object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'Path to the image to use for the new Cursor.',
                        },
                        {
                            type = 'number',
                            name = 'hotx',
                            description = 'The x-coordinate in the image of the cursor\'s hot spot.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'hoty',
                            description = 'The y-coordinate in the image of the cursor\'s hot spot.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The new Cursor object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'Data representing the image to use for the new Cursor.',
                        },
                        {
                            type = 'number',
                            name = 'hotx',
                            description = 'The x-coordinate in the image of the cursor\'s hot spot.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'hoty',
                            description = 'The y-coordinate in the image of the cursor\'s hot spot.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The new Cursor object.',
                        },
                    },
                },
            },
        },
        {
            name = 'setCursor',
            description = 'Sets the current mouse cursor.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The Cursor object to use as the current mouse cursor.',
                        },
                    },
                },
                {
                    description = 'Resets the current mouse cursor to the default.',
                },
            },
        },
        {
            name = 'setGrabbed',
            description = 'Grabs the mouse and confines it to the window.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'grab',
                            description = 'True to confine the mouse, false to let it leave the window.',
                        },
                    },
                },
            },
        },
        {
            name = 'setPosition',
            description = 'Sets the current position of the mouse. Non-integer values are floored.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The new position of the mouse along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The new position of the mouse along the y-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRelativeMode',
            description = 'Sets whether relative mode is enabled for the mouse.\n\nWhen relative mode is enabled, the cursor is hidden and doesn\'t move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.\n\nThe reported position of the mouse may not be updated while relative mode is enabled, even when relative mouse motion events are generated.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True to enable relative mode, false to disable it.',
                        },
                    },
                },
            },
        },
        {
            name = 'setVisible',
            description = 'Sets the current visibility of the cursor.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'visible',
                            description = 'True to set the cursor to visible, false to hide the cursor.',
                        },
                    },
                },
            },
        },
        {
            name = 'setX',
            description = 'Sets the current X position of the mouse.\n\nNon-integer values are floored.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The new position of the mouse along the x-axis.',
                        },
                    },
                },
            },
        },
        {
            name = 'setY',
            description = 'Sets the current Y position of the mouse.\n\nNon-integer values are floored.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The new position of the mouse along the y-axis.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.CursorType'),
    },
}