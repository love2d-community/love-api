return {
    name = 'FileData',
    description = 'Data representing the contents of a file.',
    constructors = {
        'newFileData'
    },
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
