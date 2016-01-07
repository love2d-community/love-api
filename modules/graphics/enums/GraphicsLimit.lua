return {
    name = 'GraphicsLimit',
    description = 'Types of system-dependent graphics limits checked for using love.graphics.getSystemLimits.',
    constants = {
        {
            name = 'pointsize',
            description = 'The maximum size of points.'
        },
        {
            name = 'texturesize',
            description = 'The maximum width or height of Images and Canvases.'
        },
        {
            name = 'multicanvas',
            description = 'The maximum number of simultaneously active canvases (via love.graphics.setCanvas).'
        },
        {
            name = 'canvasmsaa',
            description = 'The maximum number of antialiasing samples for a Canvas.'
        }
    }
}
