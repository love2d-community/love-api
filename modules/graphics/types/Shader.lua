local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Shader',
    description = 'A Shader is used for advanced hardware-accelerated pixel or vertex manipulation. These effects are written in a language based on GLSL (OpenGL Shading Language) with a few things simplified for easier coding.\n\nPotential uses for shaders include HDR/bloom, motion blur, grayscale/invert/sepia/any kind of color effect, reflection/refraction, distortions, bump mapping, and much more! Here is a collection of basic shaders and good starting point to learn: https://github.com/vrld/moonshine',
    constructors = {
        'getShader',
        'newShader',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getWarnings',
            description = 'Returns any warning and error messages from compiling the shader code. This can be used for debugging your shaders if there\'s anything the graphics hardware doesn\'t like.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'warnings',
                            description = 'Warning and error messages (if any).',
                        },
                    },
                },
            },
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
                            description = 'The name of the uniform variable.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasuniform',
                            description = 'Whether the uniform exists in the shader and affects its final output.',
                        },
                    },
                },
            },
        },
        {
            name = 'send',
            description = 'Sends one or more values to a special (\'\'uniform\'\') variable inside the shader. Uniform variables have to be marked using the \'\'uniform\'\' or \'\'extern\'\' keyword, e.g.\n\nuniform float time;  // \'float\' is the typical number type used in GLSL shaders.\n\nuniform float varsvec2 light_pos;\n\nuniform vec4 colors[4;\n\nThe corresponding send calls would be\n\nshader:send(\'time\', t)\n\nshader:send(\'vars\',a,b)\n\nshader:send(\'light_pos\', {light_x, light_y})\n\nshader:send(\'colors\', {r1, g1, b1, a1},  {r2, g2, b2, a2},  {r3, g3, b3, a3},  {r4, g4, b4, a4})\n\nUniform / extern variables are read-only in the shader code and remain constant until modified by a Shader:send call. Uniform variables can be accessed in both the Vertex and Pixel components of a shader, as long as the variable is declared in each.',
            variants = {
                {
                    description = 'Because all numbers in Lua are floating point, in versions prior to 0.10.2 you must use the function Shader:sendInt to send values to uniform int variables in the shader\'s code.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the number to send to the shader.',
                        },
                        {
                            type = 'number',
                            name = 'number',
                            description = 'Number to send to store in the uniform variable.',
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional numbers to send if the uniform variable is an array.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the vector to send to the shader.',
                        },
                        {
                            type = 'table',
                            name = 'vector',
                            description = 'Numbers to send to the uniform variable as a vector. The number of elements in the table determines the type of the vector (e.g. two numbers -&gt; vec2). At least two and at most four numbers can be used.',
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional vectors to send if the uniform variable is an array. All vectors need to be of the same size (e.g. only vec3\'s).',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the matrix to send to the shader.',
                        },
                        {
                            type = 'table',
                            name = 'matrix',
                            description = '2x2, 3x3, or 4x4 matrix to send to the uniform variable. Using table form: {{a,b,c,d}, {e,f,g,h}, ... } or (since version 0.10.2) {a,b,c,d, e,f,g,h, ...}. The order in 0.10.2 is column-major; starting in 11.0 it\'s row-major instead.',
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional matrices of the same type as \'\'matrix\'\' to store in a uniform array.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the Texture to send to the shader.',
                        },
                        {
                            type = 'Texture',
                            name = 'texture',
                            description = 'Texture (Image or Canvas) to send to the uniform variable.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the boolean to send to the shader.',
                        },
                        {
                            type = 'boolean',
                            name = 'boolean',
                            description = 'Boolean to send to store in the uniform variable.',
                        },
                        {
                            type = 'boolean',
                            name = '...',
                            description = 'Additional booleans to send if the uniform variable is an array.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the matrix to send to the shader.',
                        },
                        {
                            type = 'MatrixLayout',
                            name = 'matrixlayout',
                            description = 'The layout (row- or column-major) of the matrix.',
                        },
                        {
                            type = 'table',
                            name = 'matrix',
                            description = '2x2, 3x3, or 4x4 matrix to send to the uniform variable. Using table form: {{a,b,c,d}, {e,f,g,h}, ... } or {a,b,c,d, e,f,g,h, ...}.',
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional matrices of the same type as \'\'matrix\'\' to store in a uniform array.',
                        },
                    },
                },
                {
                    description = 'Sends uniform values to the Shader sourced from the contents of a Data object. This directly copies the bytes of the data.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the uniform to send to the shader.',
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'Data object containing the values to send.',
                        },
                        {
                            type = 'number',
                            name = 'offset',
                            description = 'Offset in bytes from the start of the Data object.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'Size in bytes of the data to send. If nil, as many bytes as the specified uniform uses will be copied.',
                            default = 'all',
                        },
                    },
                },
                {
                    description = 'Sends uniform matrices to the Shader sourced from the contents of a Data object. This directly copies the bytes of the data.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'Name of the uniform matrix to send to the shader.',
                        },
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'Data object containing the values to send.',
                        },
                        {
                            type = 'MatrixLayout',
                            name = 'matrixlayout',
                            description = 'The layout (row- or column-major) of the matrix in memory.',
                        },
                        {
                            type = 'number',
                            name = 'offset',
                            description = 'Offset in bytes from the start of the Data object.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'size',
                            description = 'Size in bytes of the data to send. If nil, as many bytes as the specified uniform uses will be copied.',
                            default = 'all',
                        },
                    },
                },
            },
        },
        {
            name = 'sendColor',
            description = 'Sends one or more colors to a special (\'\'extern\'\' / \'\'uniform\'\') vec3 or vec4 variable inside the shader. The color components must be in the range of 1. The colors are gamma-corrected if global gamma-correction is enabled.\n\nExtern variables must be marked using the \'\'extern\'\' keyword, e.g.\n\nextern vec4 Color;\n\nThe corresponding sendColor call would be\n\nshader:sendColor(\'Color\', {r, g, b, a})\n\nExtern variables can be accessed in both the Vertex and Pixel stages of a shader, as long as the variable is declared in each.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the color extern variable to send to in the shader.',
                        },
                        {
                            type = 'table',
                            name = 'color',
                            description = 'A table with red, green, blue, and optional alpha color components in the range of 1 to send to the extern as a vector.',
                        },
                        {
                            type = 'table',
                            name = '...',
                            description = 'Additional colors to send in case the extern is an array. All colors need to be of the same size (e.g. only vec3\'s).',
                        },
                    },
                },
            },
        },
    },
}