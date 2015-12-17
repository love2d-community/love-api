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
            description = 'The pixel colors of what\'s drawn are component-wise added to the pixel colors already on the screen.'
        },
        {
            name = 'subtract',
            description = 'The pixel colors of what\'s drawn are component-wise subtracted from the pixel colors already on the screen.'
        },
        {
            name = 'multiply',
            description = 'The pixel colors of what\'s drawn are component-wise multiplied with the pixel colors already on the screen (effectively darkening them). The alpha of drawn objects is multiplied with the alpha of the screen rather than determining how much the colors on the screen are affected, even if the "alphamultiply" BlendAlphaMode is used.'
        }
    }
}
