return {
    name = 'ImageData',
    description = 'Raw (decoded) image data.\n\nYou can\'t draw ImageData directly to screen. See Image for that.',
    constructors = {
        'newImageData'
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
                            description = 'The format to encode the image as.'
                        },
                        {
                            type = 'string',
                            name = 'filename',
                            default = 'nil',
                            description = 'The filename to write the file to. If nil, no file will be written but the FileData will still be returned.'
                        }
                    },
                    returns = {
                        {
                            type = 'FileData',
                            name = 'filedata',
                            description = 'The encoded image as a new FileData object.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the ImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the ImageData.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the ImageData.'
                        }
                    }
                }
            }
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the ImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the ImageData.'
                        }
                    }
                }
            }
        },
        {
            name = 'getPixel',
            description = 'Gets the color of a pixel at a specific position in the image.\n\nValid x and y values start at 0 and go up to image width and height minus 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the pixel on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the pixel on the y-axis.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The alpha component (0-255).'
                        }
                    }
                }
            }
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the ImageData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the ImageData.'
                        }
                    }
                }
            }
        },
        {
            name = 'mapPixel',
            description = 'Transform an image by applying a function to every pixel.\n\nThis function is a higher order function. It takes another function as a parameter, and calls it once for each pixel in the ImageData.\n\nThe function parameter is called with six parameters for each pixel in turn. The parameters are numbers that represent the x and y coordinates of the pixel and its red, green, blue and alpha values. The function parameter can return up to four number values, which become the new r, g, b and a values of the pixel. If the function returns fewer values, the remaining components are set to 0.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'pixelFunction',
                            description = 'Function parameter to apply to every pixel.'
                        }
                    }
                }
            }
        },
        {
            name = 'paste',
            description = 'Paste into ImageData from another source ImageData.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'source',
                            description = 'Source ImageData from which to copy.'
                        },
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'Destination top-left position on x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'Destination top-left position on y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Source top-left position on x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Source top-left position on y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'sw',
                            description = 'Source width.'
                        },
                        {
                            type = 'number',
                            name = 'sh',
                            description = 'Source height.'
                        }
                    }
                }
            }
        },
        {
            name = 'setPixel',
            description = 'Sets the color of a pixel.\n\nValid x and y values start at 0 and go up to image width and height minus 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the pixel on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the pixel on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue component (0-255).'
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'The alpha component (0-255).'
                        }
                    }
                }
            }
        }
    },
    supertypes = {
        'Data',
        'Object'
    }
}
