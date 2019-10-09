return {
    name = 'StencilAction',
    description = 'How a stencil function modifies the stencil values of pixels it touches.',
    constants = {
        {
            name = 'replace',
            description = 'The stencil value of a pixel will be replaced by the value specified in love.graphics.stencil, if any object touches the pixel.',
        },
        {
            name = 'increment',
            description = 'The stencil value of a pixel will be incremented by 1 for each object that touches the pixel. If the stencil value reaches 255 it will stay at 255.',
        },
        {
            name = 'decrement',
            description = 'The stencil value of a pixel will be decremented by 1 for each object that touches the pixel. If the stencil value reaches 0 it will stay at 0.',
        },
        {
            name = 'incrementwrap',
            description = 'The stencil value of a pixel will be incremented by 1 for each object that touches the pixel. If a stencil value of 255 is incremented it will be set to 0.',
        },
        {
            name = 'decrementwrap',
            description = 'The stencil value of a pixel will be decremented by 1 for each object that touches the pixel. If the stencil value of 0 is decremented it will be set to 255.',
        },
        {
            name = 'invert',
            description = 'The stencil value of a pixel will be bitwise-inverted for each object that touches the pixel. If a stencil value of 0 is inverted it will become 255.',
        },
    },
}