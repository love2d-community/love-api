-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    name = 'data',
    description = 'Provides functionality for creating and transforming data.',
    functions = {
        {
            name = 'compress',
            description = 'Compresses a string or data using a specific compression algorithm.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'container',
                            description = 'What type to return the compressed data as.'
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format to use when compressing the string.'
                        },
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'The raw (un-compressed) string to compress.'
                        },
                        {
                            type = 'number',
                            name = 'level',
                            default = '-1',
                            description = 'The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.'
                        }
                    },
                    returns = {
                        {
                            type = 'CompressedData or string',
                            name = 'compressedData',
                            description = 'CompressedData/string which contains the compressed version of data.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'container',
                            description = 'What type to return the compressed data as.'
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format to use when compressing the data.'
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data object containing the raw (un-compressed) data to compress.'
                        },
                        {
                            type = 'number',
                            name = 'level',
                            default = '-1',
                            description = 'The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.'
                        }
                    },
                    returns = {
                        {
                            type = 'CompressedData or string',
                            name = 'compressedData',
                            description = 'CompressedData/string which contains the compressed version of data.'
                        }
                    }
                }
            }
        },
        {
            name = 'decompress',
            description = 'Decompresses a CompressedData or previously compressed string or Data object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'container',
                            description = 'What type to return the decompressed data as.'
                        },
                        {
                            type = 'CompressedData',
                            name = 'compressedData',
                            description = 'The compressed data to decompress.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'container',
                            description = 'What type to return the decompressed data as.'
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format that was used to compress the given string.'
                        },
                        {
                            type = 'string',
                            name = 'compressedstring',
                            description = 'A string containing data previously compressed with love.data.compress.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'container',
                            description = 'What type to return the decompressed data as.'
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format that was used to compress the given data.'
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data object containing data previously compressed with love.data.compress.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        require(path .. 'enums.ContainerType')
    }
}
