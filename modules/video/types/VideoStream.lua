local path = (...):match('(.-)[^%./]+$')

return {
    name = 'VideoStream',
    description = 'An object which decodes, streams, and controls Videos.',
    constructors = {
        'newVideoStream',
    },
    supertypes = {
        'Object',
    },
    functions = {
    },
}