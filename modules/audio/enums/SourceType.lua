return {
    name = 'SourceType',
    description = 'Types of audio sources.\n\nA good rule of thumb is to use stream for music files and static for all short sound effects. Basically, you want to avoid loading large files into memory at once.',
    constants = {
        {
            name = 'static',
            description = 'The whole audio is decoded.',
        },
        {
            name = 'stream',
            description = 'The audio is decoded in chunks when needed.',
        },
        {
            name = 'queue',
            description = 'The audio must be manually queued by the user.',
        },
    },
}