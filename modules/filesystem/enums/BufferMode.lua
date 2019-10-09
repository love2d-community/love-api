return {
    name = 'BufferMode',
    description = 'Buffer modes for File objects.',
    constants = {
        {
            name = 'none',
            description = 'No buffering. The result of write and append operations appears immediately.',
        },
        {
            name = 'line',
            description = 'Line buffering. Write and append operations are buffered until a newline is output or the buffer size limit is reached.',
        },
        {
            name = 'full',
            description = 'Full buffering. Write and append operations are always buffered until the buffer size limit is reached.',
        },
    },
}