local path = (...):match('(.-)[^%./]+$')

return {
    name = 'ImageData',
    description = 'Raw (decoded) image data.\n\nYou can\'t draw ImageData directly to screen. See Image for that.',
    constructors = {
        'newImageData',
    },
    supertypes = {
        'Data',
        'Object',
    },
    functions = {
        {
            name = 'encode',
            description = 'Encodes the ImageData and optionally writes it to the save directory.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ImageFormat',
                            name = 'format',
                            description = 'The format to encode the image as.',
                        },
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename to write the file to. If nil, no file will be written but the FileData will still be returned.',
                            default = 'nil',
                        },
                    },
                    returns = {
                        {
                            type = 'FileData',
                            name = 'filedata',
                            description = 'The encoded image as a new FileData object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'outFile',
                            description = 'Name of a file to write encoded data to. The format will be automatically deduced from the file extension.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'outFile',
                            description = 'Name of a file to write encoded data to.',
                        },
                        {
                            type = 'ImageFormat',
                            name = 'format',
                            description = 'The format to encode the image in.',
                        },
                    },
                },
            },
        },
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the ImageData in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the ImageData in pixels.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the ImageData in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the ImageData in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the ImageData in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'getPixel',
            description = 'Gets the color of a pixel at a specific position in the image.\n\nValid x and y values start at 0 and go up to image width and height minus 1. Non-integer values are floored.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the pixel on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the pixel on the y-axis.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The alpha component (0-1).',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the ImageData in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the ImageData in pixels.',
                        },
                    },
                },
            },
        },
        {
            name = 'mapPixel',
            description = 'Transform an image by applying a function to every pixel.\n\nThis function is a higher-order function. It takes another function as a parameter, and calls it once for each pixel in the ImageData.\n\nThe passed function is called with six parameters for each pixel in turn. The parameters are numbers that represent the x and y coordinates of the pixel and its red, green, blue and alpha values. The function should return the new red, green, blue, and alpha values for that pixel.\n\nfunction pixelFunction(x, y, r, g, b, a)\n\n    -- template for defining your own pixel mapping function\n\n    -- perform computations giving the new values for r, g, b and a\n\n    -- ...\n\n    return r, g, b, a\n\nend\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'pixelFunction',
                            description = 'Function to apply to every pixel.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis of the top-left corner of the area within the ImageData to apply the function to.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis of the top-left corner of the area within the ImageData to apply the function to.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the area within the ImageData to apply the function to.',
                            default = 'ImageData:getWidth()',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the area within the ImageData to apply the function to.',
                            default = 'ImageData:getHeight()',
                        },
                    },
                },
            },
        },
        {
            name = 'paste',
            description = 'Paste into ImageData from another source ImageData.',
            variants = {
                {
                    description = 'Note that this function just replaces the contents in the destination rectangle; it does not do any alpha blending.',
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'source',
                            description = 'Source ImageData from which to copy.',
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'Destination top-left position on x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'Destination top-left position on y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Source top-left position on x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Source top-left position on y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'sw',
                            description = 'Source width.',
                        },
                        {
                            type = 'number',
                            name = 'sh',
                            description = 'Source height.',
                        },
                    },
                },
            },
        },
        {
            name = 'setPixel',
            description = 'Sets the color of a pixel at a specific position in the image.\n\nValid x and y values start at 0 and go up to image width and height minus 1.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the pixel on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the pixel on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue component (0-1).',
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The alpha component (0-1).',
                        },
                    },
                },
            },
        },
    },
}
