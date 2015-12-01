return {
    name = 'Shader',
    description = 'A Shader is used for advanced hardware-accelerated pixel or vertex manipulation. These effects are written in a language based on GLSL (OpenGL Shading Language) with a few things simplified for easier coding.\n\nPotential uses for pixel effects include HDR/bloom, motion blur, grayscale/invert/sepia/any kind of color effect, reflection/refraction, distortions, and much more!',
    constructors = {
        'newShader'
    },
    functions = {
        {
            name = 'getExternVariable',
            description = 'Gets information about an \'extern\' (\'uniform\') variable in the shader.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the extern variable.'
                        }
                    },
                    returns = {
                        {
                            type = 'ShaderVariableType',
                            name = 'type',
                            description = 'The base type of the variable.'
                        },
                        {
                            type = 'number',
                            name = 'components',
                            description = 'The number of components in the variable (e.g. 2 for a vec2 or mat2.)'
                        },
                        {
                            type = 'number',
                            name = 'arrayelements',
                            description = 'The number of elements in the array if the variable is an array, or 1 if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'getWarnings',
            description = 'Returns any warning and error messages from compiling the shader code. This can be used for debugging your shaders if there\'s anything the graphics hardware doesn\'t like.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'warnings',
                            description = 'Warning messages (if any).'
                        }
                    }
                }
            }
        },
        {
            name = 'send',
            description = 'Sends one or more values to a special (extern) variable inside the shader.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the number to send to the pixel effect.'
                        },
                        {
                            type = 'number',
                            name = 'number',
                            description = 'Number to send to the pixel effect.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional numbers to send in case the extern is an array.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the vector to send to the shader.'
                        },
                        {
                            type = 'table',
                            name = 'vector',
                            description = 'Numbers to send to the extern as a vector. The number of elements in the table determines the type of the vector (e.g. two numbers -> vec2). At least two and at most four numbers can be used.'
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional vectors to send in case the extern is an array. All vectors need to be of the same size (e.g. only vec3\'s)'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the matrix to send to the shader.'
                        },
                        {
                            type = 'table',
                            name = 'matrix',
                            description = '2x2, 3x3, or 4x4 matrix to send to the extern. Using table form: {{a,b,c,d}, {e,f,g,h}, ... }'
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional matrices of the same type as matrix to store in the extern array.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the Image to send to the shader.'
                        },
                        {
                            type = 'Image',
                            name = 'image',
                            description = 'Image to send to the extern.'
                        },
                        {
                            type = 'Image',
                            name = '...',
                            description = 'Additional images in case the extern is an array.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the Canvas to send to the shader.'
                        },
                        {
                            type = 'Canvas',
                            name = 'canvas',
                            description = 'Canvas to send to the extern. The shader extern type is Image.'
                        },
                        {
                            type = 'Canvas',
                            name = '...',
                            description = 'Additional canvases to send to the extern array.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the boolean to send to the shader.'
                        },
                        {
                            type = 'boolean',
                            name = 'boolean',
                            description = 'Boolean to send to store in the extern.'
                        },
                        {
                            type = 'boolean',
                            name = '...',
                            description = 'Additional booleans to send in case the extern is an array.'
                        }
                    }
                },
            }
        },
        {
            name = 'sendColor',
            description = 'Sends one or more colors to a special (extern / uniform) vec3 or vec4 variable inside the shader. The color components must be in the range of [0, 255], unlike Shader:send. The colors are gamma-corrected if global gamma-correction is enabled.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the color extern variable to send to in the shader.'
                        },
                        {
                            type = 'table',
                            name = 'color',
                            description = 'A table with red, green, blue, and optional alpha color components in the range of [0, 255] to send to the extern as a vector.'
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional colors to send in case the extern is an array. All colors need to be of the same size (e.g. only vec3\'s).'
                        }
                    }
                }
            }
        }
    },
    supertypes = {
        'Object'
    }
}
