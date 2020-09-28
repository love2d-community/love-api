local path = (...):match('(.-)[^%./]+$')

return {
    name = 'VertexAttributeStep',
    description = 'The frequency at which a vertex shader fetches the vertex attribute\'s data from the Mesh when it\'s drawn.\n\nPer-instance attributes can be used to render a Mesh many times with different positions, colors, or other attributes via a single love.graphics.drawInstanced call, without using the love_InstanceID vertex shader variable.',
    constants = {
        {
            name = 'pervertex',
            description = 'The vertex attribute will have a unique value for each vertex in the Mesh.',
        },
        {
            name = 'perinstance',
            description = 'The vertex attribute will have a unique value for each instance of the Mesh.',
        },
    }
}