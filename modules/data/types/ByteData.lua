local path = (...):match('(.-)[^%./]+$')

return {
    name = 'ByteData',
    description = 'Data object containing arbitrary bytes in an contiguous memory.\n\nThere are currently no LÖVE functions provided for manipulating the contents of a ByteData, but Data:getPointer can be used with LuaJIT\'s FFI to access and write to the contents directly.',
    constructors = {
        'newByteData',
    },
    supertypes = {
        'Object',
        'Data',
    },
    functions = {
    },
}