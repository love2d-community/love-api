-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    name = 'filesystem',
    description = 'Provides an interface to the user\'s filesystem.',
    types = {
        require(path .. 'types.File'),
        require(path .. 'types.FileData')
    },
    functions = {
        {
            name = 'append',
            description = 'Append data to an existing file.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.'
                        },
                        {
                            type = 'string',
                            name = 'data',
                            description = 'The data that should be written to the file'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = 'all',
                            description = 'How many bytes to write.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the operation was successful, or nil if there was an error.'
                        },
                        {
                            type = 'string',
                            name = 'errormsg',
                            description = 'The error message on failure.'
                        }
                    }
                }
            }
        },
        {
            name = 'areSymlinksEnabled',
            description = 'Gets whether love.filesystem follows symbolic links.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether love.filesystem follows symbolic links.'
                        }
                    }
                }
            }
        },
        {
            name = 'createDirectory',
            description = 'Creates a directory.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The directory to create.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the directory was created, false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'getAppdataDirectory',
            description = 'Returns the application data directory (could be the same as getUserDirectory)',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The path of the application data directory.'
                        }
                    }
                }
            }
        },
        {
            name = 'getCRequirePath',
            description = 'Gets the filesystem paths that will be searched for c libraries when require is called.\n\nThe paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to require will be inserted in place of any question mark ("?") character in each template (after the dot characters in the argument passed to require are replaced by directory separators.) Additionally, any occurrence of a double question mark ("??") will be replaced by the name passed to require and the default library extension for the platform.\n\nThe paths are relative to the game\'s source and save directories, as well as any paths mounted with love.filesystem.mount.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'paths',
                            description = 'The paths that the require function will check for c libraries in love\'s filesystem.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDirectoryItems',
            description = 'Returns a table with the names of files and subdirectories in the specified path. The table is not sorted in any way; the order is undefined.\n\nIf the path passed to the function exists in the game and the save directory, it will list the files and directories from both places.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'dir',
                            description = 'The directory.'
                        }
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'items',
                            description = 'A sequence with the names of all files and subdirectories as strings.'
                        }
                    }
                }
            }
        },
        {
            name = 'getIdentity',
            description = 'Gets the write directory name for your game. Note that this only returns the name of the folder to store your files in, not the full location.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The identity that is used as write directory.'
                        }
                    }
                }
            }
        },
        {
            name = 'getInfo',
            description = 'Gets information about the specified file or directory.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The file or directory path to check.'
                        }
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'info',
                            description = 'A table containing information about the specified path, or nil if nothing exists at the path. The table contains the following fields:',
                            table = {
                                {
                                    type = 'FileType',
                                    name = 'type',
                                    description = 'The type of the object at the path (file, directory, symlink, etc.).'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The size in bytes of the file, or nil if it can\'t be determined.'
                                },
                                {
                                    type = 'number',
                                    name = 'modtime',
                                    description = 'The file\'s last modification time in seconds since the unix epoch, or nil if it can\'t be determined.'
                                }
                            }
                        }
                    }
                },
                {
                    description = 'This variant accepts an existing table to fill in, instead of creating a new one.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The file or directory path to check.'
                        },
                        {
                            type = 'table',
                            name = 'info',
                            description = 'A table which will be filled in with info about the specified path.'
                        }
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'info',
                            description = 'A table containing information about the specified path, or nil if nothing exists at the path. The table contains the following fields:',
                            table = {
                                {
                                    type = 'FileType',
                                    name = 'type',
                                    description = 'The type of the object at the path (file, directory, symlink, etc.).'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The size in bytes of the file, or nil if it can\'t be determined.'
                                },
                                {
                                    type = 'number',
                                    name = 'modtime',
                                    description = 'The file\'s last modification time in seconds since the unix epoch, or nil if it can\'t be determined.'
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            name = 'getRealDirectory',
            description = 'Gets the platform-specific absolute path of the directory containing a filepath.\n\nThis can be used to determine whether a file is inside the save directory or the game\'s source .love.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filepath',
                            description = 'The filepath to get the directory of.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'realdir',
                            description = 'The platform-specific full path of the directory containing the filepath.'
                        }
                    }
                }
            }
        },
        {
            name = 'getRequirePath',
            description = 'Gets the filesystem paths that will be searched when require is called.\n\nThe paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to require will be inserted in place of any question mark ("?") character in each template (after the dot characters in the argument passed to require are replaced by directory separators.)\n\nThe paths are relative to the game\'s source and save directories, as well as any paths mounted with love.filesystem.mount.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'paths',
                            description = 'The paths that the require function will check in love\'s filesystem.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSaveDirectory',
            description = 'Gets the full path to the designated save directory. This can be useful if you want to use the standard io library (or something else) to read or write in the save directory.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The absolute path to the save directory.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSource',
            description = 'Returns the full path to the the .love file or directory. If the game is fused to the LÖVE executable, then the executable is returned.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The full platform-dependent path of the .love file or directory.'
                        },
                    }
                }
            }
        },
        {
            name = 'getSourceBaseDirectory',
            description = 'Returns the full path to the directory containing the .love file. If the game is fused to the LÖVE executable, then the directory containing the executable is returned.\n\nIf love.filesystem.isFused is true, the path returned by this function can be passed to love.filesystem.mount, which will make the directory containing the main game readable by love.filesystem.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The full platform-dependent path of the directory containing the .love file.'
                        },
                    }
                }
            }
        },
        {
            name = 'getUserDirectory',
            description = 'Returns the path of the user\'s directory.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The path of the user\'s directory.'
                        }
                    }
                }
            }
        },
        {
            name = 'getWorkingDirectory',
            description = 'Gets the current working directory.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The current working directory.'
                        }
                    }
                }
            }
        },
        {
            name = 'init',
            description = 'Initializes love.filesystem, will be called internally, so should not be used explicitly.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'appname',
                            description = 'The name of the application binary, typically love.'
                        }
                    }
                }
            }
        },
        {
            name = 'isFused',
            description = 'Gets whether the game is in fused mode or not.\n\nIf a game is in fused mode, its save directory will be directly in the Appdata directory instead of Appdata/LOVE/. The game will also be able to load C Lua dynamic libraries which are located in the save directory.\n\nA game is in fused mode if the source .love has been fused to the executable (see Game Distribution), or if "--fused" has been given as a command-line argument when starting the game.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'fused',
                            description = 'True if the game is in fused mode, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'lines',
            description = 'Iterate over the lines in a file.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.'
                        }
                    },
                    returns = {
                        {
                            type = 'function',
                            name = 'iterator',
                            description = 'A function that iterates over all the lines in the file.'
                        }
                    }
                }
            }
        },
        {
            name = 'load',
            description = 'Loads a Lua file (but does not run it).',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.'
                        },
                        {
                            type = 'string',
                            name = 'errormsg',
                            default = 'nil',
                            description = 'The error message if file could not be opened.'
                        }
                    },
                    returns = {
                        {
                            type = 'function',
                            name = 'chunk',
                            description = 'The loaded chunk.'
                        }
                    }
                }
            }
        },
        {
            name = 'mount',
            description = 'Mounts a zip file or folder in the game\'s save directory for reading.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'archive',
                            description = 'The folder or zip file in the game\'s save directory to mount.'
                        },
                        {
                            type = 'string',
                            name = 'mountpoint',
                            description = 'The new path the archive will be mounted to.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the archive was successfully mounted, false otherwise.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'archive',
                            description = 'The folder or zip file in the game\'s save directory to mount.'
                        },
                        {
                            type = 'string',
                            name = 'mountpoint',
                            description = 'The new path the archive will be mounted to.'
                        },
                        {
                            type = 'string',
                            name = 'appendToPath',
                            default = 'false',
                            description = 'Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game\'s source and save directories.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the archive was successfully mounted, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'newFile',
            description = 'Creates a new File object. It needs to be opened before it can be accessed.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the file to read.'
                        },
                        {
                            type = 'FileMode',
                            name = 'mode',
                            default = '"c"',
                            description = 'The mode to open the file in.'
                        }
                    },
                    returns = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'The new File object, or nil if an error occurred.'
                        },
                        {
                            type = 'string',
                            name = 'errorstr',
                            description = 'The error string if an error occurred.'
                        }
                    }
                }
            }
        },
        {
            name = 'newFileData',
            description = 'Creates a new FileData object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'contents',
                            description = 'The contents of the file.'
                        },
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the file.'
                        },
                        {
                            type = 'FileDecoder',
                            name = 'decoder',
                            default = '"file"',
                            description = 'The method to use when decoding the contents.'
                        }
                    },
                    returns = {
                        {
                            type = 'FileData',
                            name = 'data',
                            description = 'Your new FileData.'
                        }
                    }
                },
                {
                    description = 'Creates a new FileData from a file on the storage device.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filepath',
                            description = 'Path to the file.'
                        }
                    },
                    returns = {
                        {
                            type = 'FileData',
                            name = 'data',
                            description = 'The new FileData, or nil if an error occurred.'
                        },
                        {
                            type = 'string',
                            name = 'err',
                            description = 'The error string, if an error occurred.'
                        }
                    }
                }
            }
        },
        {
            name = 'read',
            description = 'Read the contents of a file.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.'
                        },
                        {
                            type = 'number',
                            name = 'bytes',
                            default = 'all',
                            description = 'How many bytes to read.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'contents',
                            description = 'The file contents.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes have been read.'
                        }
                    }
                }
            }
        },
        {
            name = 'remove',
            description = 'Removes a file or directory.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The file or directory to remove.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the file/directory was removed, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'setCRequirePath',
            description = 'Sets the filesystem paths that will be searched for c libraries when require is called.\n\nThe paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to require will be inserted in place of any question mark ("?") character in each template (after the dot characters in the argument passed to require are replaced by directory separators.) Additionally, any occurrence of a double question mark ("??") will be replaced by the name passed to require and the default library extension for the platform.\n\nThe paths are relative to the game\'s source and save directories, as well as any paths mounted with love.filesystem.mount.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'paths',
                            description = 'The paths that the require function will check in love\'s filesystem.'
                        }
                    }
                }
            }
        },
        {
            name = 'setIdentity',
            description = 'Sets the write directory for your game. Note that you can only set the name of the folder to store your files in, not the location.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The new identity that will be used as write directory.'
                        },
                        {
                            type = 'boolean',
                            name = 'appendToPath',
                            default = 'false',
                            description = 'Whether the identity directory will be searched when reading a filepath before or after the game\'s source directory and any currently mounted archives.'
                        }
                    }
                }
            }
        },
        {
            name = 'setRequirePath',
            description = 'Sets the filesystem paths that will be searched when require is called.\n\nThe paths string given to this function is a sequence of path templates separated by semicolons. The argument passed to require will be inserted in place of any question mark ("?") character in each template (after the dot characters in the argument passed to require are replaced by directory separators.)\n\nThe paths are relative to the game\'s source and save directories, as well as any paths mounted with love.filesystem.mount.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'paths',
                            description = 'The paths that the require function will check in love\'s filesystem.'
                        }
                    }
                }
            }
        },
        {
            name = 'setSource',
            description = 'Sets the source of the game, where the code is present. This function can only be called once, and is normally automatically done by LÖVE.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'Absolute path to the game\'s source folder.'
                        },
                    }
                }
            }
        },
        {
            name = 'setSymlinksEnabled',
            description = 'Sets whether love.filesystem follows symbolic links. It is enabled by default in version 0.10.0 and newer, and disabled by default in 0.9.2.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether love.filesystem should follow symbolic links.'
                        },
                    }
                }
            }
        },
        {
            name = 'unmount',
            description = 'Unmounts a zip file or folder previously mounted for reading with love.filesystem.mount.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'archive',
                            description = 'The folder or zip file in the game\'s save directory which is currently mounted.'
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the archive was successfully unmounted, false otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'write',
            description = 'Write data to a file.\n\nIf you are getting the error message "Could not set write directory", try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.'
                        },
                        {
                            type = 'string',
                            name = 'data',
                            description = 'The string data to write to the file.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = 'all',
                            description = 'How many bytes to write.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'If the operation was successful.'
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'Error message if operation was unsuccessful.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.'
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'The Data object to write to the file.'
                        },
                        {
                            type = 'number',
                            name = 'size',
                            default = 'all',
                            description = 'How many bytes to write.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'If the operation was successful.'
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'Error message if operation was unsuccessful.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        require(path .. 'enums.BufferMode'),
        require(path .. 'enums.FileDecoder'),
        require(path .. 'enums.FileMode'),
        require(path .. 'enums.FileType')
    }
}
