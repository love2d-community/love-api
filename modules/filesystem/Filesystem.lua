local path = (...):match('(.-)[^%./]+$')

return {
    name = 'filesystem',
    description = 'Provides an interface to the user\'s filesystem.',
    types = {
        require(path .. 'types.DroppedFile'),
        require(path .. 'types.File'),
        require(path .. 'types.FileData'),
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
                            description = 'The name (and path) of the file.',
                        },
                        {
                            type = 'string',
                            name = 'data',
                            description = 'The string data to append to the file.',
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
                            description = 'True if the operation was successful, or nil if there was an error.',
                        },
                        {
                            type = 'string',
                            name = 'errormsg',
                            description = 'The error message on failure.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.',
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'The Data object to append to the file.',
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
                            description = 'True if the operation was successful, or nil if there was an error.',
                        },
                        {
                            type = 'string',
                            name = 'errormsg',
                            description = 'The error message on failure.',
                        },
                    },
                },
            },
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
                            description = 'Whether love.filesystem follows symbolic links.',
                        },
                    },
                },
            },
        },
        {
            name = 'createDirectory',
            description = 'Recursively creates a directory.\n\nWhen called with \'a/b\' it creates both \'a\' and \'a/b\', if they don\'t exist already.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The directory to create.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the directory was created, false if not.',
                        },
                    },
                },
            },
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
                            description = 'The path of the application data directory',
                        },
                    },
                },
            },
        },
        {
            name = 'getCRequirePath',
            description = 'Gets the filesystem paths that will be searched for c libraries when require is called.\n\nThe paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to \'\'require\'\' will be inserted in place of any question mark (\'?\') character in each template (after the dot characters in the argument passed to \'\'require\'\' are replaced by directory separators.) Additionally, any occurrence of a double question mark (\'??\') will be replaced by the name passed to require and the default library extension for the platform.\n\nThe paths are relative to the game\'s source and save directories, as well as any paths mounted with love.filesystem.mount.',
            variants = {
                {
                    description = 'The default paths string is \'??\', which makes require(\'cool\') try to load cool.dll, or cool.so depending on the platform.',
                    returns = {
                        {
                            type = 'string',
                            name = 'paths',
                            description = 'The paths that the \'\'require\'\' function will check for c libraries in love\'s filesystem.',
                        },
                    },
                },
            },
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
                            description = 'The directory.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'files',
                            description = 'A sequence with the names of all files and subdirectories as strings.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'dir',
                            description = 'The directory.',
                        },
                        {
                            type = 'function',
                            name = 'callback',
                            description = 'A function which is called for each file and folder in the directory. The filename is passed to the function as an argument.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'files',
                            description = 'A sequence with the names of all files and subdirectories as strings.',
                        },
                    },
                },
            },
        },
        {
            name = 'getIdentity',
            description = 'Gets the write directory name for your game. \n\nNote that this only returns the name of the folder to store your files in, not the full path.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The identity that is used as write directory.',
                        },
                    },
                },
            },
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
                            description = 'The file or directory path to check.',
                        },
                        {
                            type = 'FileType',
                            name = 'filtertype',
                            description = 'If supplied, this parameter causes getInfo to only return the info table if the item at the given path matches the specified file type.',
                            default = 'nil',
                        },
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
                                    description = 'The type of the object at the path (file, directory, symlink, etc.)',
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The size in bytes of the file, or nil if it can\'t be determined.',
                                },
                                {
                                    type = 'number',
                                    name = 'modtime',
                                    description = 'The file\'s last modification time in seconds since the unix epoch, or nil if it can\'t be determined.',
                                },
                            },
                        },
                    },
                },
                {
                    description = 'This variant accepts an existing table to fill in, instead of creating a new one.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The file or directory path to check.',
                        },
                        {
                            type = 'table',
                            name = 'info',
                            description = 'A table which will be filled in with info about the specified path.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'info',
                            description = 'The table given as an argument, or nil if nothing exists at the path. The table will be filled in with the following fields:',
                            table = {
                                {
                                    type = 'FileType',
                                    name = 'type',
                                    description = 'The type of the object at the path (file, directory, symlink, etc.)',
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The size in bytes of the file, or nil if it can\'t be determined.',
                                },
                                {
                                    type = 'number',
                                    name = 'modtime',
                                    description = 'The file\'s last modification time in seconds since the unix epoch, or nil if it can\'t be determined.',
                                },
                            },
                        },
                    },
                },
                {
                    description = 'This variant only returns info if the item at the given path is the same file type as specified in the filtertype argument, and accepts an existing table to fill in, instead of creating a new one.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The file or directory path to check.',
                        },
                        {
                            type = 'FileType',
                            name = 'filtertype',
                            description = 'Causes getInfo to only return the info table if the item at the given path matches the specified file type.',
                        },
                        {
                            type = 'table',
                            name = 'info',
                            description = 'A table which will be filled in with info about the specified path.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'info',
                            description = 'The table given as an argument, or nil if nothing exists at the path. The table will be filled in with the following fields:',
                            table = {
                                {
                                    type = 'FileType',
                                    name = 'type',
                                    description = 'The type of the object at the path (file, directory, symlink, etc.)',
                                },
                                {
                                    type = 'number',
                                    name = 'size',
                                    description = 'The size in bytes of the file, or nil if it can\'t be determined.',
                                },
                                {
                                    type = 'number',
                                    name = 'modtime',
                                    description = 'The file\'s last modification time in seconds since the unix epoch, or nil if it can\'t be determined.',
                                },
                            },
                        },
                    },
                },
            },
        },
        {
            name = 'getRealDirectory',
            description = 'Gets the platform-specific absolute path of the directory containing a filepath.\n\nThis can be used to determine whether a file is inside the save directory or the game\'s source .love.',
            variants = {
                {
                    description = 'This function returns the directory containing the given \'\'file path\'\', rather than file. For example, if the file screenshot1.png exists in a directory called screenshots in the game\'s save directory, love.filesystem.getRealDirectory(\'screenshots/screenshot1.png\') will return the same value as love.filesystem.getSaveDirectory.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filepath',
                            description = 'The filepath to get the directory of.',
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'realdir',
                            description = 'The platform-specific full path of the directory containing the filepath.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRequirePath',
            description = 'Gets the filesystem paths that will be searched when require is called.\n\nThe paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to \'\'require\'\' will be inserted in place of any question mark (\'?\') character in each template (after the dot characters in the argument passed to \'\'require\'\' are replaced by directory separators.)\n\nThe paths are relative to the game\'s source and save directories, as well as any paths mounted with love.filesystem.mount.',
            variants = {
                {
                    description = 'The default paths string is \'?.lua;?/init.lua\', which makes require(\'cool\') try to load cool.lua and then try cool/init.lua if cool.lua doesn\'t exist.',
                    returns = {
                        {
                            type = 'string',
                            name = 'paths',
                            description = 'The paths that the \'\'require\'\' function will check in love\'s filesystem.',
                        },
                    },
                },
            },
        },
        {
            name = 'getSaveDirectory',
            description = 'Gets the full path to the designated save directory.\n\nThis can be useful if you want to use the standard io library (or something else) to\n\nread or write in the save directory.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'dir',
                            description = 'The absolute path to the save directory.',
                        },
                    },
                },
            },
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
                            description = 'The full platform-dependent path of the .love file or directory.',
                        },
                    },
                },
            },
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
                            description = 'The full platform-dependent path of the directory containing the .love file.',
                        },
                    },
                },
            },
        },
        {
            name = 'getUserDirectory',
            description = 'Returns the path of the user\'s directory',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'path',
                            description = 'The path of the user\'s directory',
                        },
                    },
                },
            },
        },
        {
            name = 'getWorkingDirectory',
            description = 'Gets the current working directory.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'cwd',
                            description = 'The current working directory.',
                        },
                    },
                },
            },
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
                            description = 'The name of the application binary, typically love.',
                        },
                    },
                },
            },
        },
        {
            name = 'isFused',
            description = 'Gets whether the game is in fused mode or not.\n\nIf a game is in fused mode, its save directory will be directly in the Appdata directory instead of Appdata/LOVE/. The game will also be able to load C Lua dynamic libraries which are located in the save directory.\n\nA game is in fused mode if the source .love has been fused to the executable (see Game Distribution), or if \'--fused\' has been given as a command-line argument when starting the game.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'fused',
                            description = 'True if the game is in fused mode, false otherwise.',
                        },
                    },
                },
            },
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
                            description = 'The name (and path) of the file',
                        },
                    },
                    returns = {
                        {
                            type = 'function',
                            name = 'iterator',
                            description = 'A function that iterates over all the lines in the file',
                        },
                    },
                },
            },
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
                            description = 'The name (and path) of the file.',
                        },
                    },
                    returns = {
                        {
                            type = 'function',
                            name = 'chunk',
                            description = 'The loaded chunk.',
                        },
                        {
                            type = 'string',
                            name = 'errormsg',
                            description = 'The error message if file could not be opened.',
                        },
                    },
                },
            },
        },
        {
            name = 'mount',
            description = 'Mounts a zip file or folder in the game\'s save directory for reading.\n\nIt is also possible to mount love.filesystem.getSourceBaseDirectory if the game is in fused mode.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'archive',
                            description = 'The folder or zip file in the game\'s save directory to mount.',
                        },
                        {
                            type = 'string',
                            name = 'mountpoint',
                            description = 'The new path the archive will be mounted to.',
                        },
                        {
                            type = 'boolean',
                            name = 'appendToPath',
                            description = 'Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game\'s source and save directories.',
                            default = 'false',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the archive was successfully mounted, false otherwise.',
                        },
                    },
                },
                {
                    description = 'Mounts the contents of the given FileData in memory. The FileData\'s data must contain a zipped directory structure.',
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'filedata',
                            description = 'The FileData object in memory to mount.',
                        },
                        {
                            type = 'string',
                            name = 'mountpoint',
                            description = 'The new path the archive will be mounted to.',
                        },
                        {
                            type = 'boolean',
                            name = 'appendToPath',
                            description = 'Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game\'s source and save directories.',
                            default = 'false',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the archive was successfully mounted, false otherwise.',
                        },
                    },
                },
                {
                    description = 'Mounts the contents of the given Data object in memory. The data must contain a zipped directory structure.',
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'The Data object in memory to mount.',
                        },
                        {
                            type = 'string',
                            name = 'archivename',
                            description = 'The name to associate the mounted data with, for use with love.filesystem.unmount. Must be unique compared to other mounted data.',
                        },
                        {
                            type = 'string',
                            name = 'mountpoint',
                            description = 'The new path the archive will be mounted to.',
                        },
                        {
                            type = 'boolean',
                            name = 'appendToPath',
                            description = 'Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game\'s source and save directories.',
                            default = 'false',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the archive was successfully mounted, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'newFile',
            description = 'Creates a new File object. \n\nIt needs to be opened before it can be accessed.',
            variants = {
                {
                    description = 'Please note that this function will not return any error message (e.g. if you use an invalid filename) because it just creates the File Object. You can still check if the file is valid by using File:open which returns a boolean and an error message if something goes wrong while opening the file.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the file.',
                        },
                    },
                    returns = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'The new File object.',
                        },
                    },
                },
                {
                    description = 'Creates a File object and opens it for reading, writing, or appending.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the file.',
                        },
                        {
                            type = 'FileMode',
                            name = 'mode',
                            description = 'The mode to open the file in.',
                        },
                    },
                    returns = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'The new File object, or nil if an error occurred.',
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
        {
            name = 'newFileData',
            description = 'Creates a new FileData object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'contents',
                            description = 'The contents of the file.',
                        },
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the file.',
                        },
                    },
                    returns = {
                        {
                            type = 'FileData',
                            name = 'data',
                            description = 'Your new FileData.',
                        },
                    },
                },
                {
                    description = 'Creates a new FileData from a file on the storage device.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'filepath',
                            description = 'Path to the file.',
                        },
                    },
                    returns = {
                        {
                            type = 'FileData',
                            name = 'data',
                            description = 'The new FileData, or nil if an error occurred.',
                        },
                        {
                            type = 'string',
                            name = 'err',
                            description = 'The error string, if an error occurred.',
                        },
                    },
                },
            },
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
                            description = 'The name (and path) of the file.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes to read.',
                            default = 'all',
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'contents',
                            description = 'The file contents.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes have been read.',
                        },
                        {
                            type = 'nil',
                            name = 'contents',
                            description = 'returns nil as content.',
                        },
                        {
                            type = 'string',
                            name = 'error',
                            description = 'returns an error message.',
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
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes to read',
                            default = 'all',
                        },
                    },
                    returns = {
                        {
                            type = 'FileData or string',
                            name = 'contents',
                            description = 'FileData or string containing the file contents.',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'How many bytes have been read.',
                        },
                        {
                            type = 'nil',
                            name = 'contents',
                            description = 'returns nil as content.',
                        },
                        {
                            type = 'string',
                            name = 'error',
                            description = 'returns an error message.',
                        },
                    },
                },
            },
        },
        {
            name = 'remove',
            description = 'Removes a file or empty directory.',
            variants = {
                {
                    description = 'The directory must be empty before removal or else it will fail. Simply remove all files and folders in the directory beforehand.\n\nIf the file exists in the .love but not in the save directory, it returns false as well.\n\nAn opened File prevents removal of the underlying file. Simply close the File to remove it.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The file or directory to remove.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the file/directory was removed, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'setCRequirePath',
            description = 'Sets the filesystem paths that will be searched for c libraries when require is called.\n\nThe paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to \'\'require\'\' will be inserted in place of any question mark (\'?\') character in each template (after the dot characters in the argument passed to \'\'require\'\' are replaced by directory separators.) Additionally, any occurrence of a double question mark (\'??\') will be replaced by the name passed to require and the default library extension for the platform.\n\nThe paths are relative to the game\'s source and save directories, as well as any paths mounted with love.filesystem.mount.',
            variants = {
                {
                    description = 'The default paths string is \'??\', which makes require(\'cool\') try to load cool.dll, or cool.so depending on the platform.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'paths',
                            description = 'The paths that the \'\'require\'\' function will check in love\'s filesystem.',
                        },
                    },
                },
            },
        },
        {
            name = 'setIdentity',
            description = 'Sets the write directory for your game. \n\nNote that you can only set the name of the folder to store your files in, not the location.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The new identity that will be used as write directory.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The new identity that will be used as write directory.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRequirePath',
            description = 'Sets the filesystem paths that will be searched when require is called.\n\nThe paths string given to this function is a sequence of path templates separated by semicolons. The argument passed to \'\'require\'\' will be inserted in place of any question mark (\'?\') character in each template (after the dot characters in the argument passed to \'\'require\'\' are replaced by directory separators.)\n\nThe paths are relative to the game\'s source and save directories, as well as any paths mounted with love.filesystem.mount.',
            variants = {
                {
                    description = 'The default paths string is \'?.lua;?/init.lua\', which makes require(\'cool\') try to load cool.lua and then try cool/init.lua if cool.lua doesn\'t exist.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'paths',
                            description = 'The paths that the \'\'require\'\' function will check in love\'s filesystem.',
                        },
                    },
                },
            },
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
                            description = 'Absolute path to the game\'s source folder.',
                        },
                    },
                },
            },
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
                            description = 'Whether love.filesystem should follow symbolic links.',
                        },
                    },
                },
            },
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
                            description = 'The folder or zip file in the game\'s save directory which is currently mounted.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'True if the archive was successfully unmounted, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'write',
            description = 'Write data to a file in the save directory. If the file existed already, it will be completely replaced by the new contents.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.',
                        },
                        {
                            type = 'string',
                            name = 'data',
                            description = 'The string data to write to the file.',
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
                            description = 'If the operation was successful.',
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'Error message if operation was unsuccessful.',
                        },
                    },
                },
                {
                    description = 'If you are getting the error message \'Could not set write directory\', try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.\n\n\'\'\'Writing to multiple lines\'\'\': In Windows, some text editors (e.g. Notepad) only treat CRLF (\'\\r\\n\') as a new line.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name (and path) of the file.',
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'The Data object to write to the file.',
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
                            description = 'If the operation was successful.',
                        },
                        {
                            type = 'string',
                            name = 'message',
                            description = 'Error message if operation was unsuccessful.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.BufferMode'),
        require(path .. 'enums.FileDecoder'),
        require(path .. 'enums.FileMode'),
        require(path .. 'enums.FileType'),
    },
}