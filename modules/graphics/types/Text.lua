local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Text',
    description = 'Drawable text.',
    constructors = {
        'newText',
    },
    supertypes = {
        'Drawable',
        'Object',
    },
    functions = {
        {
            name = 'add',
            description = 'Adds additional colored text to the Text object at the specified position.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'textstring',
                            description = 'The text to add to the object.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the new text on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the new text on the y-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The orientation of the new text in radians.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor on the x-axis.',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor on the y-axis.',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset on the y-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing / skew factor on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing / skew factor on the y-axis.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'An index number that can be used with Text:getWidth or Text:getHeight.',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text, when drawing the Text object.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the new text on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the new text on the y-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The orientation of the new text in radians.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor on the x-axis.',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor on the y-axis.',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset on the y-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing / skew factor on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing / skew factor on the y-axis.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'An index number that can be used with Text:getWidth or Text:getHeight.',
                        },
                    },
                },
            },
        },
        {
            name = 'addf',
            description = 'Adds additional formatted / colored text to the Text object at the specified position.\n\nThe word wrap limit is applied before any scaling, rotation, and other coordinate transformations. Therefore the amount of text per line stays constant given the same wrap limit, even if the scale arguments change.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'textstring',
                            description = 'The text to add to the object.',
                        },
                        {
                            type = 'number',
                            name = 'wraplimit',
                            description = 'The maximum width in pixels of the text before it gets automatically wrapped to a new line.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment of the text.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the new text (x-axis).',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the new text (y-axis).',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing / skew factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing / skew factor (y-axis).',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'An index number that can be used with Text:getWidth or Text:getHeight.',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text, when drawing the Text object.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'number',
                            name = 'wraplimit',
                            description = 'The maximum width in pixels of the text before it gets automatically wrapped to a new line.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment of the text.',
                        },
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the new text (x-axis).',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the new text (y-axis).',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'Orientation (radians).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor (x-axis).',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor (y-axis).',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset (y-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing / skew factor (x-axis).',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing / skew factor (y-axis).',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'An index number that can be used with Text:getWidth or Text:getHeight.',
                        },
                    },
                },
            },
        },
        {
            name = 'clear',
            description = 'Clears the contents of the Text object.',
            variants = {
                {
                },
            },
        },
        {
            name = 'getDimensions',
            description = 'Gets the width and height of the text in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the text. If multiple sub-strings have been added with Text:add, the width of the last sub-string is returned.',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the text. If multiple sub-strings have been added with Text:add, the height of the last sub-string is returned.',
                        },
                    },
                },
                {
                    description = 'Gets the width and height of a specific sub-string that was previously added to the Text object.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'An index number returned by Text:add or Text:addf.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the sub-string (before scaling and other transformations).',
                        },
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the sub-string (before scaling and other transformations).',
                        },
                    },
                },
            },
        },
        {
            name = 'getFont',
            description = 'Gets the Font used with the Text object.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The font used with this Text object.',
                        },
                    },
                },
            },
        },
        {
            name = 'getHeight',
            description = 'Gets the height of the text in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = ' height ',
                            description = 'The height of the text. If multiple sub-strings have been added with Text:add, the height of the last sub-string is returned.',
                        },
                    },
                },
                {
                    description = 'Gets the height of a specific sub-string that was previously added to the Text object.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'An index number returned by Text:add or Text:addf.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'height',
                            description = 'The height of the sub-string (before scaling and other transformations).',
                        },
                    },
                },
            },
        },
        {
            name = 'getWidth',
            description = 'Gets the width of the text in pixels.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the text. If multiple sub-strings have been added with Text:add, the width of the last sub-string is returned.',
                        },
                    },
                },
                {
                    description = 'Gets the width of a specific sub-string that was previously added to the Text object.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'An index number returned by Text:add or Text:addf.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'width',
                            description = 'The width of the sub-string (before scaling and other transformations).',
                        },
                    },
                },
            },
        },
        {
            name = 'set',
            description = 'Replaces the contents of the Text object with a new unformatted string.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'textstring',
                            description = 'The new string of text to use.',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text, when drawing the Text object.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to use as the new text, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                    },
                },
            },
        },
        {
            name = 'setFont',
            description = 'Replaces the Font used with the text.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Font',
                            name = 'font',
                            description = 'The new font to use with this Text object.',
                        },
                    },
                },
            },
        },
        {
            name = 'setf',
            description = 'Replaces the contents of the Text object with a new formatted string.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'textstring',
                            description = 'The new string of text to use.',
                        },
                        {
                            type = 'number',
                            name = 'wraplimit',
                            description = 'The maximum width in pixels of the text before it gets automatically wrapped to a new line.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment of the text.',
                        },
                    },
                },
                {
                    description = 'The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text, when drawing the Text object.',
                    arguments = {
                        {
                            type = 'table',
                            name = 'coloredtext',
                            description = 'A table containing colors and strings to use as the new text, in the form of {color1, string1, color2, string2, ...}.',
                            table = {
                                {
                                    type = 'table',
                                    name = 'color1',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string1',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'table',
                                    name = 'color2',
                                    description = 'A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}.',
                                },
                                {
                                    type = 'string',
                                    name = 'string2',
                                    description = 'A string of text which has a color specified by the previous color.',
                                },
                                {
                                    type = 'tables and strings',
                                    name = '...',
                                    description = 'Additional colors and strings.',
                                },
                            },
                        },
                        {
                            type = 'number',
                            name = 'wraplimit',
                            description = 'The maximum width in pixels of the text before it gets automatically wrapped to a new line.',
                        },
                        {
                            type = 'AlignMode',
                            name = 'align',
                            description = 'The alignment of the text.',
                        },
                    },
                },
            },
        },
    },
}