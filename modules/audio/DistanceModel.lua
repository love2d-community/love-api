return {
    name = 'DistanceModel',
    description = 'The different distance models.',
    constants = {
        {
            name = 'none',
            description = 'Sources do not get attenuated.'
        },
        {
            name = 'inverse',
            description = 'Inverse distance attenuation.'
        },
        {
            name = 'inverseclamped',
            description = 'Inverse distance attenuation. Gain is clamped. In version 0.9.2 and older this is named inverse clamped.'
        },
        {
            name = 'linear',
            description = 'Linear attenuation.'
        },
        {
            name = 'linearclamped',
            description = 'Linear attenuation. Gain is clamped. In version 0.9.2 and older this is named linear clamped.'
        },
        {
            name = 'exponent',
            description = 'Exponential attenuation.'
        },
        {
            name = 'exponentclamped',
            description = 'Exponential attenuation. Gain is clamped. In version 0.9.2 and older this is named exponent clamped.'
        }
    }
}
