return {
    name = 'CullMode',
    description = 'How Mesh geometry is culled when rendering.',
    constants = {
        {
            name = 'back',
            description = 'Back-facing triangles in Meshes are culled (not rendered). The vertex order of a triangle determines whether it is back- or front-facing.',
        },
        {
            name = 'front',
            description = 'Front-facing triangles in Meshes are culled.',
        },
        {
            name = 'none',
            description = 'Both back- and front-facing triangles in Meshes are rendered.',
        },
    },
}