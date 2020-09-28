local path = (...):match('(.-)[^%./]+$')

return {
    name = 'IndexDataType',
    description = 'Vertex map datatype for Data variant of Mesh:setVertexMap.',
    constants = {
        {
            name = 'uint16',
            description = 'The vertex map is array of unsigned word (16-bit).',
        },
        {
            name = 'uint32',
            description = 'The vertex map is array of unsigned dword (32-bit).',
        },
    },
}