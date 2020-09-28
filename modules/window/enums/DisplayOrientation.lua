local path = (...):match('(.-)[^%./]+$')

return {
    name = 'DisplayOrientation',
    description = 'Types of device display orientation.',
    constants = {
        {
            name = 'unknown',
            description = 'Orientation cannot be determined.',
        },
        {
            name = 'landscape',
            description = 'Landscape orientation.',
        },
        {
            name = 'landscapeflipped',
            description = 'Landscape orientation (flipped).',
        },
        {
            name = 'portrait',
            description = 'Portrait orientation.',
        },
        {
            name = 'portraitflipped',
            description = 'Portrait orientation (flipped).',
        },
    },
}