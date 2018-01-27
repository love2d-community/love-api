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
            name = 'decode',
            description = 'Decode Data or a string from any of the EncodeFormats to Data or string.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'containerType',
                            description = 'What type to return the decoded data as.'
                        },
                        {
                            type = 'EncodeFormat',
                            name = 'format',
                            description = 'The format of the input data.'
                        },
                        {
                            type = 'string',
                            name = 'sourceString',
                            description = 'The raw (encoded) data to decode.'
                        }
                    },
                    returns = {
                        {
                            type = 'Variant',
                            name = 'decoded',
                            description = 'ByteData/string which contains the decoded version of source.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'containerType',
                            description = 'What type to return the decoded data as.'
                        },
                        {
                            type = 'EncodeFormat',
                            name = 'format',
                            description = 'The format of the input data.'
                        },
                        {
                            type = 'Data',
                            name = 'sourceData',
                            description = 'The raw (encoded) data to decode.'
                        }
                    },
                    returns = {
                        {
                            type = 'Variant',
                            name = 'decoded',
                            description = 'ByteData/string which contains the decoded version of source.'
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
        },
        {
            name = 'encode',
            description = 'Encode Data or a string to a Data or string in one of the EncodeFormats.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'containerType',
                            description = 'What type to return the encoded data as.'
                        },
                        {
                            type = 'EncodeFormat',
                            name = 'format',
                            description = 'The format of the output data.'
                        },
                        {
                            type = 'string',
                            name = 'sourceString',
                            description = 'The raw data to encode.'
                        },
                        {
                            type = 'number',
                            name = 'lineLength',
                            default = '0',
                            description = 'The maximum line length of the output. Only supported for base64, ignored if 0.'
                        }
                    },
                    returns = {
                        {
                            type = 'Variant',
                            name = 'encoded',
                            description = 'ByteData/string which contains the encoded version of source.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'ContainerType',
                            name = 'containerType',
                            description = 'What type to return the encoded data as.'
                        },
                        {
                            type = 'EncodeFormat',
                            name = 'format',
                            description = 'The format of the output data.'
                        },
                        {
                            type = 'Data',
                            name = 'sourceData',
                            description = 'The raw data to encode.'
                        },
                        {
                            type = 'number',
                            name = 'lineLength',
                            default = '0',
                            description = 'The maximum line length of the output. Only supported for base64, ignored if 0.'
                        }
                    },
                    returns = {
                        {
                            type = 'Variant',
                            name = 'encoded',
                            description = 'ByteData/string which contains the encoded version of source.'
                        }
                    }
                }
            }
        },
        {
            name = 'hash',
            description = 'Compute the message digest of specified string with specified algorithm.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'HashFunction',
                            name = 'hashFunction',
                            description = 'Hash algorithm to use.'
                        },
                        {
                            type = 'string',
                            name = 'string',
                            description = 'String to hash.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawdigest',
                            description = 'Raw message digest string.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'HashFunction',
                            name = 'hashFunction',
                            description = 'Hash algorithm to use.'
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'Data to hash.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawdigest',
                            description = 'Raw message digest string.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        require(path .. 'enums.ContainerType'),
        require(path .. 'enums.EncodeFormat'),
        require(path .. 'enums.HashFunction')
    }
}
