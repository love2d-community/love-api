return {
    name = 'CompareMode',
    description = 'Different types of per-pixel stencil test and depth test comparisons. The pixels of an object will be drawn if the comparison succeeds, for each pixel that the object touches.',
    constants = {
        {
            name = 'equal',
            description = '* stencil tests: the stencil value of the pixel must be equal to the supplied value.\n* depth tests: the depth value of the drawn object at that pixel must be equal to the existing depth value of that pixel.',
        },
        {
            name = 'notequal',
            description = '* stencil tests: the stencil value of the pixel must not be equal to the supplied value.\n* depth tests: the depth value of the drawn object at that pixel must not be equal to the existing depth value of that pixel.',
        },
        {
            name = 'less',
            description = '* stencil tests: the stencil value of the pixel must be less than the supplied value.\n* depth tests: the depth value of the drawn object at that pixel must be less than the existing depth value of that pixel.',
        },
        {
            name = 'lequal',
            description = '* stencil tests: the stencil value of the pixel must be less than or equal to the supplied value.\n* depth tests: the depth value of the drawn object at that pixel must be less than or equal to the existing depth value of that pixel.',
        },
        {
            name = 'gequal',
            description = '* stencil tests: the stencil value of the pixel must be greater than or equal to the supplied value.\n* depth tests: the depth value of the drawn object at that pixel must be greater than or equal to the existing depth value of that pixel.',
        },
        {
            name = 'greater',
            description = '* stencil tests: the stencil value of the pixel must be greater than the supplied value.\n* depth tests: the depth value of the drawn object at that pixel must be greater than the existing depth value of that pixel.',
        },
        {
            name = 'never',
            description = 'Objects will never be drawn.',
        },
        {
            name = 'always',
            description = 'Objects will always be drawn. Effectively disables the depth or stencil test.',
        },
    },
}