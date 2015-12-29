return {
    name = 'CompareMode',
    description = 'Different types of per-pixel stencil test comparisons. The pixels of an object will be drawn if the comparison succeeds, for each pixel that the object touches.',
    constants = {
        {
            name = 'equal',
            description = 'The stencil value of the pixel must be equal to the supplied value.'
        },
        {
            name = 'notequal',
            description = 'The stencil value of the pixel must not be equal to the supplied value.'
        },
        {
            name = 'less',
            description = 'The stencil value of the pixel must be less than the supplied value.'
        },
        {
            name = 'lequal',
            description = 'The stencil value of the pixel must be less than or equal to the supplied value.'
        },
        {
            name = 'gequal',
            description = 'The stencil value of the pixel must be greater than or equal to the supplied value.'
        },
        {
            name = 'greater',
            description = 'The stencil value of the pixel must be greater than the supplied value.'
        }
    }
}
