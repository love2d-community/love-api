return {
    name = 'Shader',
    description = 'A Shader is used for advanced hardware-accelerated pixel or vertex manipulation. These effects are written in a language based on GLSL (OpenGL Shading Language) with a few things simplified for easier coding.\n\nPotential uses for shaders include HDR/bloom, motion blur, grayscale/invert/sepia/any kind of color effect, reflection/refraction, distortions, bump mapping, and much more! Here is a collection of basic shaders and good starting point to learn: https://github.com/vrld/shine',
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
            name = 'hasUniform',
            description = 'Gets whether a uniform / extern variable exists in the Shader.\n\nIf a graphics driver\'s shader compiler determines that a uniform / extern variable doesn\'t affect the final output of the shader, it may optimize the variable out. This function will return false in that case.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the uniform variable.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasuniform',
                            description = 'Whether the uniform exists in the shader and affects its final output.'
                        }
                    }
                }
            }
        },
        {
            name = 'send',
            description = 'Sends one or more values to a special (uniform) variable inside the shader. Uniform variables have to be marked using the uniform or extern keyword.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the number to send to the shader.'
                        },
                        {
                            type = 'number',
                            name = 'number',
                            description = 'Number to send to store in the uniform variable.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional numbers to send if the uniform variable is an array.'
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
                            description = 'Numbers to send to the uniform variable as a vector. The number of elements in the table determines the type of the vector (e.g. two numbers -> vec2). At least two and at most four numbers can be used.'
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional vectors to send if the uniform variable is an array. All vectors need to be of the same size (e.g. only vec3\'s).'
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
                            description = '2x2, 3x3, or 4x4 matrix to send to the uniform variable. Using table form: {{a,b,c,d}, {e,f,g,h}, ... }.'
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional matrices of the same type as matrix to store in a uniform array.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the Texture to send to the shader.'
                        },
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'Texture (Image or Canvas) to send to the uniform variable.'
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
                            description = 'Boolean to send to store in the uniform variable.'
                        },
                        {
                            type = 'boolean',
                            name = '...',
                            description = 'Additional booleans to send if the uniform variable is an array.'
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
    parenttype = 'Object',
    supertypes = {
        'Object'
    }
}
