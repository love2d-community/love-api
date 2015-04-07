return {
    name = 'filesystem',
    description = 'Provides an interface to the user\'s filesystem.',
    types = {
        {
            name = 'File',
            description = 'Represents a file on the filesystem.',
            constructors = {
                'newFile'
            },
            functions = {
                {
                    name = 'close',
                    description = 'Closes a file.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'Whether closing was successful.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'eof',
                    description = 'If the end-of-file has been reached',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'eof',
                                    description = 'Whether EOF has been reached.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'flush',
                    description = 'Flushes any buffered written data in the file to the disk.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'Whether the file successfully flushed any buffered data to the disk.'
                                },
                                {
                                    type = 'string',
                                    name = 'err',
                                    description = 'The error string, if an error occurred and the file could not be flushed.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getBuffer',
                    description = 'Gets the buffer mode of a file.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'BufferMode',
                                    name = 'mode',
                                    description = 'The current buffer mode of the file.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The maximum size in bytes of the file\'s buffer.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMode',
                    description = 'Gets the FileMode the file has been opened with.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'FileMode',
                                    name = 'mode',
                                    description = 'The mode this file has been opened with.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getSize',
                    description = 'Returns the file size.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The file size'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'isOpen',
                    description = 'Gets whether the file is open.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'open',
                                    description = 'True if the file is currently open, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'lines',
                    description = 'Iterate over all the lines in a file',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'function',
                                    name = 'iterator',
                                    description = 'The iterator (can be used in for loops)'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'open',
                    description = 'Open the file for write, read or append.\n\nIf you are getting the error message "Could not set write directory", try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'FileMode',
                                    name = 'mode',
                                    description = 'The mode to open the file in.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'ok',
                                    description = 'True on success, false otherwise.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'read',
                    description = 'Read a number of bytes from a file.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'bytes',
                                    default = 'all',
                                    description = 'The number of bytes to read'
                                }
                            },
                            returns = {
                                {
                                    type = 'string',
                                    name = 'contents',
                                    description = 'The contents of the read bytes.'
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
                    name = 'seek',
                    description = 'Seek to a position in a file.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'position',
                                    description = 'The position to seek to.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'Whether the operation was successful.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setBuffer',
                    description = 'Sets the buffer mode for a file opened for writing or appending. Files with buffering enabled will not write data to the disk until the buffer size limit is reached, depending on the buffer mode.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'BufferMode',
                                    name = 'mode',
                                    description = 'The buffer mode to use.'
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The maximum size in bytes of the file\'s buffer.'
                                }
                            },
                            returns = {
                                {
                                    type = 'boolean',
                                    name = 'success',
                                    description = 'Whether the buffer mode was successfully set.'
                                },
                                {
                                    type = 'string',
                                    name = 'errorstr',
                                    description = 'The error string, if the buffer mode could not be set and an error occurred.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'write',
                    description = 'Write data to a file.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'data',
                                    description = 'The data to write.'
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
                                    description = 'Whether the operation was successful.'
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
            name = 'FileData',
            description = 'Data representing the contents of a file.',
            functions = {
                {
                    name = 'getExtension',
                    description = 'Gets the extension of the FileData.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'ext',
                                    description = 'The extension of the file the FileData represents.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getFilename',
                    description = 'Gets the filename of the FileData.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'name',
                                    description = 'The name of the file the FileData represents.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Data',
                'Object'
            }
        }
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
                            name = 'ok',
                            description = 'True if the directory was created, false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'exists',
            description = 'Check whether a file or directory exists.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The path to a potential file or directory.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'e',
                            description = 'True if there is a file or directory with the specified name. False otherwise.'
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
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'dir',
                            description = 'The directory.'
                        },
                        {
                            type = 'function',
                            name = 'callback',
                            description = 'A function which is called for each file and folder in the directory. The filename is passed to the function as an argument.'
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
            name = 'getLastModified',
            description = 'Gets the last modification time of a file.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The path and name to a file.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'modtime',
                            description = 'The last modification time in seconds since the unix epoch or nil on failure.'
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
            name = 'getSize',
            description = 'Gets the size in bytes of a file.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The path and name to a file.'
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The size in bytes of the file, or nil on failure.'
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
            name = 'getSourceBaseDirectory',
            description = 'Returns the full path to the directory containing the .love file. If the game is fused to the LÖVE executable, then the directory containing the executable is returned.\n\nIf love.filesystem.isFused is true, the path returned by this function can be passed to love.filesystem.mount, which will make the directory containing the main game (e.g. C:\\Program Files\\coolgame\\) readable by love.filesystem.',
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
            name = 'isDirectory',
            description = 'Check whether something is a directory.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The path to a potential directory.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'is_dir',
                            description = 'True if there is a directory with the specified name. False otherwise.'
                        }
                    }
                }
            }
        },
        {
            name = 'isFile',
            description = 'Check whether something is a file.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The path to a potential file.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'is_file',
                            description = 'True if there is a file with the specified name. False otherwise.'
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
            name = 'isSymlink',
            description = 'Gets whether a filepath is actually a symbolic link.\n\nIf symbolic links are not enabled (via love.filesystem.setSymlinksEnabled), this function will always return false.',
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
                            type = 'boolean',
                            name = 'symlink',
                            description = 'True if the path is a symbolic link, false otherwise.'
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
            description = 'Load a file (but not run it).',
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
                            default = 'c',
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
                            name = 'ok',
                            description = 'True if the file/directory was removed, false otherwise.'
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
                            type = 'SearchOrder',
                            name = 'searchorder',
                            default = '"first"',
                            description = 'Whether love.filesystem will look for files in the write directory before or after looking in the main game source.'
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
            description = 'Sets whether love.filesystem follows symbolic links. It is disabled by default.',
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
                            description = 'If the operation was successful'
                        }
                    }
                }
            }
        }
    },
    enums = {
        {
            name = 'BufferMode',
            description = 'Buffer modes for File objects.',
            constants = {
                {
                    name = 'none',
                    description = 'No buffering. The result of write and append operations appears immediately.'
                },
                {
                    name = 'line',
                    description = 'Line buffering. Write and append operations are buffered until a newline is output or the buffer size limit is reached.'
                },
                {
                    name = 'full',
                    description = 'Full buffering. Write and append operations are always buffered until the buffer size limit is reached.'
                }
            }
        },
        {
            name = 'FileDecoder',
            description = 'How to decode a given FileData.',
            constants = {
                {
                    name = 'file',
                    description = 'The data is unencoded.'
                },
                {
                    name = 'base64',
                    description = 'The data is base64-encoded.'
                }
            }
        },
        {
            name = 'FileMode',
            description = 'The different modes you can open a file in.',
            constants = {
                {
                    name = 'r',
                    description = 'Open a file for read.'
                },
                {
                    name = 'w',
                    description = 'Open a file for write.'
                },
                {
                    name = 'a',
                    description = 'Open a file for append.'
                },
                {
                    name = 'c',
                    description = 'Do not open a file (represents a closed file.)'
                }
            }
        }
    }
}