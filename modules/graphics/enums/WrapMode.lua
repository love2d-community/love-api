return {
    name = 'WrapMode',
    description = 'How the image wraps inside a Quad with a larger quad size than image size. This also affects how Meshes with texture coordinates which are outside the range of [0, 1] are drawn, and the color returned by the Texel Shader function when using it to sample from texture coordinates outside of the range of [0, 1].',
    constants = {
        {
            name = 'clamp',
            description = 'How the image wraps inside a Quad with a larger quad size than image size. This also affects how Meshes with texture coordinates which are outside the range of [0, 1] are drawn, and the color returned by the Texel Shader function when using it to sample from texture coordinates outside of the range of [0, 1].'
        },
        {
            name = 'repeat',
            description = 'Repeat the image. Fills the whole available extent.'
        },
        {
            name = 'mirroredrepeat',
            description = 'Repeat the texture, flipping it each time it repeats. May produce better visual results than the repeat mode when the texture doesn\'t seamlessly tile.'
        },
        {
            name = 'clampzero',
            description = 'Clamp the texture. Fills the area outside the texture\'s normal range with transparent black (or opaque black for textures with no alpha channel.)'
        }
    }
}
