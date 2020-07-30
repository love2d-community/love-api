return {
    name = 'CompressedDataFormat',
    description = 'Compressed data formats.',
    constants = {
        {
            name = 'lz4',
            description = 'The LZ4 compression format. Compresses and decompresses very quickly, but the compression ratio is not the best. LZ4-HC is used when compression level 9 is specified. Some benchmarks are available here.',
        },
        {
            name = 'zlib',
            description = 'The zlib format is DEFLATE-compressed data with a small bit of header data. Compresses relatively slowly and decompresses moderately quickly, and has a decent compression ratio.',
        },
        {
            name = 'gzip',
            description = 'The gzip format is DEFLATE-compressed data with a slightly larger header than zlib. Since it uses DEFLATE it has the same compression characteristics as the zlib format.',
        },
        {
            name = 'deflate',
            description = 'Raw DEFLATE-compressed data (no header).',
        },
    },
}