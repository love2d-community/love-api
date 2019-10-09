return {
    name = 'BlendAlphaMode',
    description = 'Different ways alpha affects color blending. See BlendMode and the BlendMode Formulas for additional notes.',
    constants = {
        {
            name = 'alphamultiply',
            description = 'The RGB values of what\'s drawn are multiplied by the alpha values of those colors during blending. This is the default alpha mode.',
        },
        {
            name = 'premultiplied',
            description = 'The RGB values of what\'s drawn are \'\'\'not\'\'\' multiplied by the alpha values of those colors during blending. For most blend modes to work correctly with this alpha mode, the colors of a drawn object need to have had their RGB values multiplied by their alpha values at some point previously ("premultiplied alpha").',
        },
    },
}