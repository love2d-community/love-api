local path = (...):match('(.-)[^%./]+$')

return {
    name = 'VertexWinding',
    description = 'How Mesh geometry vertices are ordered.',
    constants = {
        {
            name = 'cw',
            description = 'Clockwise.',
        },
        {
            name = 'ccw',
            description = 'Counter-clockwise.',
        },
    },
}