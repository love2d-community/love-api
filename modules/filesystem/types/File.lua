local path = (...):match('(.-)[^%./]+$')

return {
    name = 'File',
    description = 'Represents a file on the filesystem. A function that takes a file path can also take a File.',
    constructors = {
        'newFile',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'close',
            description = 'Closes a File.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether closing was successful.',
                        },
                    },
                },
            },
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
                            description = 'Whether the file successfully flushed any buffered data to the disk.',
                        },
                        {
                            type = 'string',
                            name = 'err',
                            description = 'The error string, if an error occurred and the file could not be flushed.',
                        },
                    },
                },
            },
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
                            description = 'The current buffer mode of the file.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The maximum size in bytes of the file\'s buffer.',
                        },
                    },
                },
            },
        },
        {
            name = 'getFilename',
            description = 'Gets the filename that the File object was created with. If the file object originated from the love.filedropped callback, the filename will be the full platform-dependent file path.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the File.',
                        },
                    },
                },
            },
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
                            description = 'The mode this file has been opened with.',
                        },
                    },
                },
            },
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
                            description = 'The file size in bytes.',
                        },
                    },
                },
            },
        },
        {
            name = 'isEOF',
            description = 'Gets whether end-of-file has been reached.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'eof',
                            description = 'Whether EOF has been reached.',
                        },
                    },
                },
            },
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
                            description = 'True if the file is currently open, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'lines',
            description = 'Iterate over all the lines in a file.',
            variants = {
                {
                    returns = {
                        {
                            type = 'function',
                            name = 'iterator',
                            description = 'The iterator (can be used in for loops).',
                        },
                    },
                },
            },
        },
        {
            name = 'open',
            description = 'Open the file for write, read or append.',
            variants = {
                {
                    description = 'If you are getting the error message \'Could not set write directory\', try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf (only available with love 0.7 or higher).',
                    arguments = {
                        {
                            type = 'FileMode',
                            name = 'mode',
                            description = 'The mode to open the file in.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'ok',
                            description = 'True on success, false otherwise.',
                        },
                        {
                            type = 'string',
                            name = 'err',
                            description = 'The error string if an error occurred.',
                        },
                    },
                },
            },
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
                            description = 'The number of bytes to read.',
                            default = 'all',
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'contents',
                            description = 'The contents of the read bytes.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes have been read.',
                        },
                    },
                },
                {
                    description = 'Reads the contents of a file into either a string or a FileData object.',
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'container',
                            description = 'What type to return the file\'s contents as.',
                        },
                        {
                            type = 'number',
                            name = 'bytes',
                            description = 'The number of bytes to read.',
                            default = 'all',
                        },
                    },
                    returns = {
                        {
                            type = 'FileData or string',
                            name = 'contents',
                            description = 'FileData or string containing the read bytes.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes have been read.',
                        },
                    },
                },
            },
        },
        {
            name = 'seek',
            description = 'Seek to a position in a file',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'pos',
                            description = 'The position to seek to',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the operation was successful',
                        },
                    },
                },
            },
        },
        {
            name = 'setBuffer',
            description = 'Sets the buffer mode for a file opened for writing or appending. Files with buffering enabled will not write data to the disk until the buffer size limit is reached, depending on the buffer mode.\n\nFile:flush will force any buffered data to be written to the disk.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'BufferMode',
                            name = 'mode',
                            description = 'The buffer mode to use.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'The maximum size in bytes of the file\'s buffer.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the buffer mode was successfully set.',
                        },
                        {
                            type = 'string',
                            name = 'errorstr',
                            description = 'The error string, if the buffer mode could not be set and an error occurred.',
                        },
                    },
                },
            },
        },
        {
            name = 'tell',
            description = 'Returns the position in the file.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'pos',
                            description = 'The current position.',
                        },
                    },
                },
            },
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
                            description = 'The string data to write.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes to write.',
                            default = 'all',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the operation was successful.',
                        },
                        {
                            type = 'string',
                            name = 'err',
                            description = 'The error string if an error occurred.',
                        },
                    },
                },
                {
                    description = '\'\'\'Writing to multiple lines\'\'\': In Windows, some text editors (e.g. Notepad before Windows 10 1809) only treat CRLF (\'\\r\\n\') as a new line.\n\n--example\n\nf = love.filesystem.newFile(\'note.txt\')\n\nf:open(\'w\')\n\nfor i = 1, 10 do\n\n    f:write(\'This is line \'..i..\'!\\r\\n\')\n\nend\n\nf:close()',
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'The Data object to write.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes to write.',
                            default = 'all',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the operation was successful.',
                        },
                        {
                            type = 'string',
                            name = 'errorstr',
                            description = 'The error string if an error occurred.',
                        },
                    },
                },
            },
        },
    },
}