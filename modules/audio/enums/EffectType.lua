return {
    name = 'EffectType',
    description = 'The different types of effects supported by love.audio.setEffect.',
    constants = {
        {
            name = 'chorus',
            description = 'Plays multiple copies of the sound with slight pitch and time variation. Used to make sounds sound "fuller" or "thicker".',
        },
        {
            name = 'compressor',
            description = 'Decreases the dynamic range of the sound, making the loud and quiet parts closer in volume, producing a more uniform amplitude throughout time.',
        },
        {
            name = 'distortion',
            description = 'Alters the sound by amplifying it until it clips, shearing off parts of the signal, leading to a compressed and distorted sound.',
        },
        {
            name = 'echo',
            description = 'Decaying feedback based effect, on the order of seconds. Also known as delay; causes the sound to repeat at regular intervals at a decreasing volume.',
        },
        {
            name = 'equalizer',
            description = 'Adjust the frequency components of the sound using a 4-band (low-shelf, two band-pass and a high-shelf) equalizer.',
        },
        {
            name = 'flanger',
            description = 'Plays two copies of the sound; while varying the phase, or equivalently delaying one of them, by amounts on the order of milliseconds, resulting in phasing sounds.',
        },
        {
            name = 'reverb',
            description = 'Decaying feedback based effect, on the order of milliseconds. Used to simulate the reflection off of the surroundings.',
        },
        {
            name = 'ringmodulator',
            description = 'An implementation of amplitude modulation; multiplies the source signal with a simple waveform, to produce either volume changes, or inharmonic overtones.',
        },
    },
}