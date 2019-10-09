return {
    name = 'FilterType',
    description = 'Types of filters for Sources.',
    constants = {
        {
            name = 'lowpass',
            description = 'Low-pass filter. High frequency sounds are attenuated.',
        },
        {
            name = 'highpass',
            description = 'High-pass filter. Low frequency sounds are attenuated.',
        },
        {
            name = 'bandpass',
            description = 'Band-pass filter. Both high and low frequency sounds are attenuated based on the given parameters.',
        },
    },
}