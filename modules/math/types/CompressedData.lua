return {
    name = 'CompressedData',
    description = 'Represents byte data compressed using a specific algorithm.\n\nlove.math.decompress can be used to de-compress the data.',
    constructors = {
        'compress'
    },
    functions = {
        {
            name = 'getFormat',
            description = 'Gets the compression format of the CompressedData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format of the CompressedData.'
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
