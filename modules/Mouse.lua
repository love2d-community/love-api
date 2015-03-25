return {
    name = 'mouse',
    description = 'Provides an interface to the user\'s mouse.',
    types = {
        {
            name = 'Cursor',
            description = 'Represents a hardware cursor.',
            constructors = {
                'getSystemCursor',
                'newCursor'
            },
            functions = {
                {
                    name = 'getType',
                    description = 'Gets the type of the Cursor.',
                    functions = {
                        {
                            returns = {
                                {
                                    type = 'CursorType',
                                    name = 'cursortype',
                                    description = 'The type of the Cursor.'
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
            name = 'getCursor',
            description = 'Gets the current Cursor.',
            functions = {
                {
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The current cursor, or nil if no cursor is set.'
                        }
                    }
                }
            }
        },
        {
            name = 'getPosition',
            description = 'Returns the current position of the mouse.',
            functions = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the mouse along the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the mouse along the y-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'getRelativeMode',
            description = 'Gets whether relative mode is enabled for the mouse.\n\nIf relative mode is enabled, the cursor is hidden and doesn\'t move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.\n\nThe reported position of the mouse is not updated while relative mode is enabled, even when relative mouse motion events are generated.',
            functions = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'True if relative mode is enabled, false if it\'s disabled.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSystemCursor',
            description = 'Gets a Cursor object representing a system-native hardware cursor.\n\n Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse\'s current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'CursorType',
                            name = 'ctype',
                            description = 'The type of system cursor to get.'
                        },
                    },
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The Cursor object representing the system cursor type.'
                        }
                    }
                }
            }
        },
        {
            name = 'getX',
            description = 'Returns the current x position of the mouse.',
            functions = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the mouse along the x-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'getY',
            description = 'Returns the current y position of the mouse.',
            functions = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the mouse along the y-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'isDown',
            description = 'Checks whether a certain mouse button is down. This function does not detect mousewheel scrolling; you must use the love.mousepressed callback for that.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'MouseConstant',
                            name = 'button',
                            description = 'The button to check.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'down',
                            description = 'True if the specified button is down.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'MouseConstant',
                            name = '...',
                            description = 'A button to check.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'anyDown',
                            description = 'True if any specified button is down, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'isGrabbed',
            description = 'Checks if the mouse is grabbed.',
            functions = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'grabbed',
                            description = 'True if the cursor is grabbed, false if it is not.'
                        }
                    }
                }
            }
        },
        {
            name = 'isVisible',
            description = 'Checks if the cursor is visible.',
            functions = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'visible',
                            description = 'True if the cursor to visible, false if the cursor is hidden.'
                        }
                    }
                }
            }
        },
        {
            name = 'newCursor',
            description = 'Creates a new hardware Cursor object from an image file or ImageData.\n\nHardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse\'s current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low frameratesn\n\nThe hot spot is the point the operating system uses to determine what was clicked and at what position the mouse cursor is. For example, the normal arrow pointer normally has its hot spot at the top left of the image, but a crosshair cursor might have it in the middle.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The ImageData to use for the the new Cursor.'
                        },
                        {
                            type = 'number',
                            name = 'hotx',
                            default = '0',
                            description = 'The x-coordinate in the ImageData of the cursor\'s hot spot.'
                        },
                        {
                            type = 'number',
                            name = 'hoty',
                            default = '0',
                            description = 'The y-coordinate in the ImageData of the cursor\'s hot spot.'
                        }
                    },
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The new Cursor object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filepath',
                            description = 'Path to the image to use for the new Cursor.'
                        },
                        {
                            type = 'number',
                            name = 'hotx',
                            default = '0',
                            description = 'The x-coordinate in the ImageData of the cursor\'s hot spot.'
                        },
                        {
                            type = 'number',
                            name = 'hoty',
                            default = '0',
                            description = 'The y-coordinate in the ImageData of the cursor\'s hot spot.'
                        }
                    },
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The new Cursor object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'Data representing the image to use for the new Cursor.'
                        },
                        {
                            type = 'number',
                            name = 'hotx',
                            default = '0',
                            description = 'The x-coordinate in the ImageData of the cursor\'s hot spot.'
                        },
                        {
                            type = 'number',
                            name = 'hoty',
                            default = '0',
                            description = 'The y-coordinate in the ImageData of the cursor\'s hot spot.'
                        }
                    },
                    returns = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The new Cursor object.'
                        }
                    }
                }
            }
        },
        {
            name = 'setCursor',
            description = 'Sets the current mouse cursor.\n\nResets the current mouse cursor to the default when called without arguments.',
            functions = {
                {},
                {
                    arguments = {
                        {
                            type = 'Cursor',
                            name = 'cursor',
                            description = 'The Cursor object to use as the current mouse cursor.'
                        }
                    }
                }
            }
        },
        {
            name = 'setGrabbed',
            description = 'Grabs the mouse and confines it to the window.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'grab',
                            description = 'True to confine the mouse, false to let it leave the window.'
                        }
                    }
                }
            }
        },
        {
            name = 'setPosition',
            description = 'Sets the position of the mouse.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The new position of the mouse along the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The new position of the mouse along the y-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'setRelativeMode',
            description = 'Sets whether relative mode is enabled for the mouse.\n\nWhen relative mode is enabled, the cursor is hidden and doesn\'t move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.\n\nThe reported position of the mouse is not updated while relative mode is enabled, even when relative mouse motion events are generated.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'True to enable relative mode, false to disable it.'
                        }
                    }
                }
            }
        },
        {
            name = 'setVisible',
            description = 'Sets the visibility of the cursor.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'visible',
                            description = 'True to set the cursor to visible, false to hide the cursor.'
                        }
                    }
                }
            }
        },
        {
            name = 'setX',
            description = 'Sets the current X position of the mouse.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The new position of the mouse along the x-axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'setY',
            description = 'Sets the current Y position of the mouse.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The new position of the mouse along the y-axis.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        {
            name = 'CursorType',
            description = 'Types of hardware cursors.',
            constants = {
                {
                    name = 'image',
                    description = 'The cursor is using a custom image.'
                },
                {
                    name = 'arrow',
                    description = 'An arrow pointer.'
                },
                {
                    name = 'ibeam',
                    description = 'An I-beam, normally used when mousing over editable or selectable text.'
                },
                {
                    name = 'wait',
                    description = 'Wait graphic.'
                },
                {
                    name = 'waitarrow',
                    description = 'Small wait cursor with an arrow pointer.'
                },
                {
                    name = 'crosshair',
                    description = 'Crosshair symbol.'
                },
                {
                    name = 'sizenwse',
                    description = 'Double arrow pointing to the top-left and bottom-right.'
                },
                {
                    name = 'sizenesw',
                    description = 'Double arrow pointing to the top-right and bottom-left.'
                },
                {
                    name = 'sizewe',
                    description = 'Double arrow pointing left and right.'
                },
                {
                    name = 'sizens',
                    description = 'Double arrow pointing up and down.'
                },
                {
                    name = 'sizeall',
                    description = 'Four-pointed arrow pointing up, down, left, and right.'
                },
                {
                    name = 'no',
                    description = 'Slashed circle or crossbones.'
                },
                {
                    name = 'hand',
                    description = 'Hand symbol.'
                }
            }
        },
        {
            name = 'MouseConstant',
            description = 'Mouse buttons.',
            constants = {
                {
                    name = 'l',
                    description = 'Left mouse button.'
                },
                {
                    name = 'm',
                    description = 'Middle mouse button.'
                },
                {
                    name = 'r',
                    description = 'Right mouse button.'
                },
                {
                    name = 'wd',
                    description = 'Mouse wheel down.'
                },
                {
                    name = 'wu',
                    description = 'Mouse wheel up.'
                },
                {
                    name = 'x1',
                    description = 'Mouse X1 (also known as button 4).'
                },
                {
                    name = 'x2',
                    description = 'Mouse X2 (also known as button 5).'
                }
            }
        }
    }
}