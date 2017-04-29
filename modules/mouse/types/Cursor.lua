return {
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
            variants = {
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
    parenttype = 'Object',
    supertypes = {
        'Object'
    }
}
