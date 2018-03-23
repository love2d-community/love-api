return {
    name = 'Image',
    description = 'Drawable image type.',
    constructors = {
        'newImage'
    },
    functions = {
        {
            name = 'getData',
            description = 'Gets the original ImageData or CompressedImageData used to create the Image.\n\nAll Images keep a reference to the Data that was used to create the Image. The Data is used to refresh the Image when love.window.setMode or Image:refresh is called.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ImageData',
                            name = 'data',
                            description = 'The original ImageData used to create the Image, if the image is not compressed.'
                        }
                    }
                },
                {
                    returns = {
                        {
                            type = 'CompressedImageData',
                            name = 'data',
                            description = 'The original CompressedImageData used to create the Image, if the image is compressed.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the Image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Image, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Image, in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFilter',
            description = 'Gets the filter mode for an image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'Filter mode used when minifying the image.'
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            description = 'Filter mode used when magnifying the image.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFlags',
            description = 'Gets the flags used when the image was created.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'flags',
                            description = 'A table with ImageFlag keys.'
                        }
                    }
                }
            }
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the Image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the Image, in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getMipmapFilter',
            description = 'Gets the mipmap filter mode for an Image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'FilterMode',
                            name = 'mode',
                            description = 'The filter mode used in between mipmap levels. nil if mipmap filtering is not enabled.'
                        },
                        {
                            type = 'number',
                            name = 'sharpness',
                            description = 'Value used to determine whether the image should use more or less detailed mipmap levels than normal when drawing.'
                        }
                    }
                }
            }
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the Image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the Image, in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getWrap',
            description = 'Gets the wrapping properties of an Image.\n\nThis function returns the currently set horizontal and vertical wrapping modes for the image.',
            variants = {
                {
                    returns = {
                        {
                            type = 'WrapMode',
                            name = 'horizontal',
                            description = 'Horizontal wrapping mode of the image.'
                        },
                        {
                            type = 'WrapMode',
                            name = 'vertical',
                            description = 'Vertical wrapping mode of the image.'
                        }
                    }
                }
            }
        },
        {
            name = 'refresh',
            description = 'Reloads the Image\'s contents from the ImageData or CompressedImageData used to create the image.',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x-axis of the top-left corner of the area within the Image to reload.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y-axis of the top-left corner of the area within the Image to reload.'
                        },
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the area within the Image to reload.'
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the area within the Image to reload.'
                        }
                    }
                }
            }
        },
        {
            name = 'replacePixels',
            description = 'Replaces the contents of an Image.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'ImageData',
                            name = 'data',
                            description = 'The new ImageData to replace the contents with.'
                        },
                        {
                            type = 'number',
                            name = 'slice',
                            description = 'Which slice to replace, if applicable.'
                        },
                        {
                            type = 'number',
                            name = 'mipmap',
                            default = '0',
                            description = 'The mimap level of the new ImageData. If 0 Image:replacePixels will generate new mimaps.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFilter',
            description = 'Sets the filter mode for an image.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'min',
                            description = 'How to scale an image down.'
                        },
                        {
                            type = 'FilterMode',
                            name = 'mag',
                            default = 'min',
                            description = 'How to scale an image up.'
                        }
                    }
                }
            }
        },
        {
            name = 'setMipmapFilter',
            description = 'Sets the mipmap filter mode for an Image.\n\nMipmapping is useful when drawing an image at a reduced scale. It can improve performance and reduce aliasing issues.\n\nIn 0.10.0 and newer, the Image must be created with the mipmaps flag enabled for the mipmap filter to have any effect.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'FilterMode',
                            name = 'filtermode',
                            description = 'The filter mode to use in between mipmap levels. "nearest" will often give better performance.'
                        },
                        {
                            type = 'number',
                            name = 'sharpness',
                            default = '0',
                            description = 'A positive sharpness value makes the image use a more detailed mipmap level when drawing, at the expense of performance. A negative value does the reverse.'
                        }
                    }
                },
                {
                    description = 'Disables mipmap filtering.',
                }
            }
        },
        {
            name = 'setWrap',
            description = 'Sets the wrapping properties of an Image.\n\nThis function sets the way an Image is repeated when it is drawn with a Quad that is larger than the image\'s extent. An image may be clamped or set to repeat in both horizontal and vertical directions. Clamped images appear only once, but repeated ones repeat as many times as there is room in the Quad.\n\nIf you use a Quad that is larger than the image extent and do not use repeated tiling, there may be an unwanted visual effect of the image stretching all the way to fill the Quad. If this is the case, setting Image:getWrap("repeat", "repeat") for all the images to be repeated, and using Quad of appropriate size will result in the best visual appearance.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'WrapMode',
                            name = 'horizontal',
                            description = 'Horizontal wrapping mode of the image.'
                        },
                        {
                            type = 'WrapMode',
                            name = 'vertical',
                            default = 'horizontal',
                            description = 'Vertical wrapping mode of the image.'
                        }
                    }
                }
            }
        }
    },
    parenttype = 'Texture',
    supertypes = {
        'Object',
        'Drawable',
        'Texture'
    }
}
