return {
    name = 'ByteData',
    description = 'Data object containing arbitrary bytes in an contiguous memory. ',
    constructors = {
        'newByteData'
    },
    functions = {
        {
            name = 'clone',
            description = 'Creates a new copy of the Data object.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'Data',
                            description = 'The new copy.'
                        }
                    }
                }
            }
        },
    },
    parenttype = 'Data',
    supertypes = {
        'Data',
        'Object'
    }
}
