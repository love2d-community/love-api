-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    name = 'data',
    description = 'Provides functionality for creating and transforming data. ',
    types = {
        require(path .. 'types.Data'),
        require(path .. 'types.ByteData')
    },
    functions = {
        {
            name = 'compress',
            description = 'Compresses a string or data using a specific compression algorithm. ',
            variants = {
                {
                    arguments = {
                        {
                            type = 'containertype',
                            name = 'container',
                            description = 'what type to return the compressed data as.'
                        },
                        {
                            type = 'compresseddataformat',
                            name = 'format',
                            description = 'the format to use when compressing the string.'
                        },
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'the raw (un-compressed) string to compress.'
                        },
                        {
                        	type = 'number',
                        	name = 'level',
                        	description = 'the level of compression to use, between 0 and 9. -1 indicates the default level. the meaning of this argument depends on the compression format being used.'
                        }
                    },
                    returns = {
                        {
                            type = 'value',
                            name = 'compresseddata',
                            description = 'compresseddata/string which contains the compressed version of rawstring.'
                        },
                    }
                },
                {
                    arguments = {
                        {
                            type = 'containertype',
                            name = 'container',
                            description = 'what type to return the compressed data as.'
                        },
                        {
                            type = 'compresseddataformat',
                            name = 'format',
                            description = 'the format to use when compressing the string.'
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data object containing the raw (un-compressed) data to compress.'
                        },
                        {
                        	type = 'number',
                        	name = 'level',
                        	description = 'the level of compression to use, between 0 and 9. -1 indicates the default level. the meaning of this argument depends on the compression format being used.'
                        }
                    },
                    returns = {
                        {
                            type = 'value',
                            name = 'compresseddata',
                            description = 'compresseddata/string which contains the compressed version of rawstring.'
                        },
                    }
                }
            },
        },
    },
    enums = {
        require(path .. 'enums.BufferMode'),
        require(path .. 'enums.FileDecoder'),
        require(path .. 'enums.FileMode')
    }
}
