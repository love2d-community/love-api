return {
    name = 'image',
    description = 'Provides an interface to decode encoded image data.',
    types = {
        {
            name = 'CompressedImageData',
            description = 'Represents compressed image data designed to stay compressed in RAM.\n\nCompressedImageData encompasses standard compressed texture formats such as DXT1, DXT5, and BC5 / 3Dc.\n\nYou can\'t draw CompressedImageData directly to the screen. See Image for that.',
            constructors = {
                'newCompressedData'
            },
            functions = {
                {
                    name = 'getDimensions',
                    description = 'Gets the width and height of the CompressedImageData.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the CompressedImageData.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the CompressedImageData.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'level',
                                    description = 'A mipmap level. Must be in the range of [1, CompressedImageData:getMipmapCount()].'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the CompressedImageData.'
                                },
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the CompressedImageData.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getHeight',
                    description = 'Gets the height of the CompressedImageData.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the CompressedImageData.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'level',
                                    description = 'A mipmap level. Must be in the range of [1,  CompressedImageData:getMipmapCount()].'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'height',
                                    description = 'The height of the CompressedImageData.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getMipmapCount',
                    description = 'Gets the number of mipmap levels in the CompressedImageData. The base mipmap level (original image) is included in the count.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'mipmaps',
                                    description = 'The number of mipmap levels stored in the CompressedImageData.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getWidth',
                    description = 'Gets the width of the CompressedData.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the CompressedData.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'level',
                                    description = 'A mipmap level. Must be in the range of [1, CompressedData:getMipmapCount()].'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'width',
                                    description = 'The width of the CompressedData.'
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
        },
        {
            name = 'ImageData',
            description = 'Raw (decoded) image data.\n\nYou can\'t draw ImageData directly to screen. See Image for that.',
            constructors = {
                'newImageData'
            },
            functions = {
                {
                    name = 'encode',
                    description = 'Encodes the ImageData and writes it to the save directory.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'Name of a file to write encoded data to. The format will be automatically deduced from the file extension.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'filename',
                                    description = 'Name of a file to write encoded data to.'
                                },
                                {
                                    type = 'ImageFormat',
                                    name = 'format',
                                    description = 'The format to encode the image in.'
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
                    description = 'Gets the pixel at the specified position.\n\nValid x and y values start at 0 and go up to image width and height minus 1.',
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
    },
    functions = {
        {
            name = 'isCompressed',
            description = 'Determines whether a file can be loaded as CompressedData.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the potentially compressed image file.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'compressed',
                            description = 'Whether the file can be loaded as CompressedData or not.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'A FileData potentially containing a compressed image.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'compressed',
                            description = 'Whether the FileData can be loaded as CompressedData or not.'
                        }
                    }
                }
            }
        },
        {
            name = 'newCompressedData',
            description = 'Create a new CompressedImageData object from a compressed image file. LÖVE supports several compressed texture formats, enumerated in the CompressedImageFormat page.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the compressed image file.'
                        }
                    },
                    returns = {
                        {
                            type = 'CompressedImageData',
                            name = 'compressedImageData',
                            description = 'The new CompressedImageData object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'A FileData containing a compressed image.'
                        }
                    },
                    returns = {
                        {
                            type = 'CompressedImageData',
                            name = 'compressedImageData',
                            description = 'The new CompressedImageData object.'
                        }
                    }
                }
            }
        },
        {
            name = 'newImageData',
            description = 'Create a new ImageData object.',
            variants = {
                {
                    arguments = {
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
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The filename of the image file.'
                        }
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'File',
                            name = 'file',
                            description = 'A File pointing to an image.'
                        }
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'The encoded data to decode into image data.'
                        }
                    },
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'imageData',
                            description = 'The new ImageData object.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        {
            name = 'CompressedImageFormat',
            description = 'Compressed image data formats. Here and here are a couple overviews of many of the formats.\n\nUnlike traditional PNG or jpeg, these formats stay compressed in RAM and in the graphics card\'s VRAM. This is good for saving memory space as well as improving performance, since the graphics card will be able to keep more of the image\'s pixels in its fast-access cache when drawing it.',
            constants = {
                {
                    name = 'dxt1',
                    description = 'The DXT1 format. RGB data at 4 bits per pixel (compared to 32 bits for ImageData and regular Images.) Suitable for fully opaque images.',
                },
                {
                    name = 'dxt3',
                    description = 'The DXT3 format. RGBA data at 8 bits per pixel. Smooth variations in opacity do not mix well with this format.',
                },
                {
                    name = 'dxt5',
                    description = 'The DXT5 format. RGBA data at 8 bits per pixel. Recommended for images with varying opacity.',
                },
                {
                    name = 'bc4',
                    description = 'The BC4 format (also known as 3Dc+ or ATI1.) Stores just the red channel, at 4 bits per pixel.',
                },
                {
                    name = 'bc4s',
                    description = 'The signed variant of the BC4 format. Same as above but the pixel values in the texture are in the range of [-1, 1] instead of [0, 1] in shaders.',
                },
                {
                    name = 'bc5',
                    description = 'The BC5 format (also known as 3Dc or ATI2.) Stores red and green channels at 8 bits per pixel.',
                },
                {
                    name = 'bc5s',
                    description = 'The signed variant of the BC5 format.',
                },
                {
                    name = 'bc6h',
                    description = 'The BC6H format. Stores half-precision floating-point RGB data in the range of [0, infinity) at 8 bits per pixel. Suitable for HDR images.',
                },
                {
                    name = 'bc6hs',
                    description = 'The signed variant of the BC6H format. Stores RGB data in the range of (-infinity, +infinity.)',
                },
                {
                    name = 'bc7',
                    description = 'The BC7 format (also known as BPTC.) Stores RGB or RGBA data at 8 bits per pixel.',
                },
                {
                    name = 'bc7srgb',
                    description = 'The sRGB-encoded variant of the BC7 format.',
                }
            }
        },
        {
            name = 'ImageFormat',
            description = 'Encoded image formats.',
            constants = {
                {
                    name = 'bmp',
                    description = 'BMP image format.'
                },
                {
                    name = 'tga',
                    description = 'Targa image format.'
                },
                {
                    name = 'png',
                    description = 'PNG image format.'
                },
                {
                    name = 'jpg',
                    description = 'JPG image format.'
                }
            }
        }
    }
}
