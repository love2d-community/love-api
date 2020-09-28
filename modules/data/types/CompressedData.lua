local path = (...):match('(.-)[^%./]+$')

return {
    name = 'CompressedData',
    description = 'Represents byte data compressed using a specific algorithm.\n\nlove.data.decompress can be used to de-compress the data (or love.math.decompress in 0.10.2 or earlier).',
    constructors = {
        'compress',
    },
    supertypes = {
        'Data',
        'Object',
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
                            description = 'The format of the CompressedData.',
                        },
                    },
                },
            },
        },
    },
}