return {
    name = 'MeshDrawMode',
    description = 'How a Mesh\'s vertices are used when drawing.',
    constants = {
        {
            name = 'fan',
            description = 'The vertices create a "fan" shape with the first vertex acting as the hub point. Can be easily used to draw simple convex polygons.',
        },
        {
            name = 'strip',
            description = 'The vertices create a series of connected triangles using vertices 1, 2, 3, then 3, 2, 4 (note the order), then 3, 4, 5, and so on.',
        },
        {
            name = 'triangles',
            description = 'The vertices create unconnected triangles.',
        },
        {
            name = 'points',
            description = 'The vertices are drawn as unconnected points (see love.graphics.setPointSize.)',
        },
    },
}