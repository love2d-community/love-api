local path = (...):match('(.-)[^%./]+$')

return {
    name = 'VideoStream',
    description = 'An object which decodes, streams, and controls Videos.',
    supertypes = {
        'Object',
    },
    functions = {
    },
}