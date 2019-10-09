return {
    name = 'TextureType',
    description = 'Types of textures (2D, cubemap, etc.)',
    constants = {
        {
            name = '2d',
            description = 'Regular 2D texture with width and height.',
        },
        {
            name = 'array',
            description = 'Several same-size 2D textures organized into a single object. Similar to a texture atlas / sprite sheet, but avoids sprite bleeding and other issues.',
        },
        {
            name = 'cube',
            description = 'Cubemap texture with 6 faces. Requires a custom shader (and Shader:send) to use. Sampling from a cube texture in a shader takes a 3D direction vector instead of a texture coordinate.',
        },
        {
            name = 'volume',
            description = '3D texture with width, height, and depth. Requires a custom shader to use. Volume textures can have texture filtering applied along the 3rd axis.',
        },
    },
}