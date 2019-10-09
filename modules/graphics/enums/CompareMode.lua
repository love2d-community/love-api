return {
    name = 'CompareMode',
    description = 'Different types of per-pixel stencil test and depth test comparisons. The pixels of an object will be drawn if the comparison succeeds, for each pixel that the object touches.\n\n;equal:\n\n* stencil tests: the stencil value of the pixel must be equal to the supplied value.\n\n* depth tests: the depth value of the drawn object at that pixel must be equal to the existing depth value of that pixel.\n\n;notequal:\n\n* stencil tests: the stencil value of the pixel must \'\'\'not\'\'\' be equal to the supplied value.\n\n* depth tests: the depth value of the drawn object at that pixel must \'\'\'not\'\'\' be equal to the existing depth value of that pixel.\n\n;less:\n\n* stencil tests: the stencil value of the pixel must be less than the supplied value.\n\n* depth tests: the depth value of the drawn object at that pixel must be less than the existing depth value of that pixel.\n\n;lequal:\n\n* stencil tests: the stencil value of the pixel must be less than or equal to the supplied value.\n\n* depth tests: the depth value of the drawn object at that pixel must be less than or equal to the existing depth value of that pixel.\n\n;gequal:\n\n* stencil tests: the stencil value of the pixel must be greater than or equal to the supplied value.\n\n* depth tests: the depth value of the drawn object at that pixel must be greater than or equal to the existing depth value of that pixel.\n\n;greater:\n\n* stencil tests: the stencil value of the pixel must be greater than the supplied value.\n\n* depth tests: the depth value of the drawn object at that pixel must be greater than the existing depth value of that pixel.',
    constants = {
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