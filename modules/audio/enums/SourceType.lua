return {
    name = 'SourceType',
    description = 'Types of audio sources.\n\nA good rule of thumb is to use stream for music files and static for all short sound effects. Basically, you want to avoid loading large files into memory at once.',
    constants = {
        {
            name = 'static',
            description = 'Decode the entire sound at once.'
        },
        {
            name = 'stream',
            description = 'Stream the sound; decode it gradually.'
        }
    }
}
