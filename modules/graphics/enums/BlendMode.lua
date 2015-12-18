return {
    name = 'BlendMode',
    description = 'Different ways to do color blending. See BlendAlphaMode and the BlendMode Formulas for additional notes.',
    constants = {
        {
            name = 'alpha',
            description = 'Alpha blending (normal). The alpha of what\'s drawn determines its opacity.'
        },
        {
            name = 'replace',
            description = 'The colors of what\'s drawn completely replace what was on the screen, with no additional blending.'
        },
        {
            name = 'screen',
            description = '"Screen" blending.'
        },
        {
            name = 'add',
            description = 'The pixel colors of what\'s drawn are added to the pixel colors already on the screen. The alpha of the screen is not modified.'
        },
        {
            name = 'subtract',
            description = 'The pixel colors of what\'s drawn are subtracted from the pixel colors already on the screen. The alpha of the screen is not modified.'
        },
        {
            name = 'multiply',
            description = 'The pixel colors of what\'s drawn are multiplied with the pixel colors already on the screen (darkening them). The alpha of drawn objects is multiplied with the alpha of the screen rather than determining how much the colors on the screen are affected, even when the "alphamultiply" BlendAlphaMode is used.'
        }
    }
}
