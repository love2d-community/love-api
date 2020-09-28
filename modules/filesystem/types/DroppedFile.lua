local path = (...):match('(.-)[^%./]+$')

return {
    name = 'DroppedFile',
    description = 'Represents a file dropped onto the window.\n\nNote that the DroppedFile type can only be obtained from love.filedropped callback, and can\'t be constructed manually by the user.',
    supertypes = {
        'File',
        'Object',
    },
    functions = {
    },
}