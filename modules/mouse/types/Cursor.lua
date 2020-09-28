local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Cursor',
    description = 'Represents a hardware cursor.',
    constructors = {
        'getCursor',
        'newCursor',
        'getSystemCursor',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getType',
            description = 'Gets the type of the Cursor.',
            variants = {
                {
                    returns = {
                        {
                            type = 'CursorType',
                            name = 'ctype',
                            description = 'The type of the Cursor.',
                        },
                    },
                },
            },
        },
    },
}