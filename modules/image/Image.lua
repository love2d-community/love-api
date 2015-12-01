return {
    name = 'image',
    description = 'Provides an interface to decode encoded image data.',
    types = {
        require('modules.image.types.CompressedImageData'),
        require('modules.image.types.ImageData'),
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
        require('modules.image.enums.CompressedImageFormat'),
        require('modules.image.enums.ImageFormat')
    }
}
