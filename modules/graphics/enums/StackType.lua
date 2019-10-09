return {
    name = 'StackType',
    description = 'Graphics state stack types used with love.graphics.push.',
    constants = {
        {
            name = 'transform',
            description = 'The transformation stack (love.graphics.translate, love.graphics.rotate, etc.)',
        },
        {
            name = 'all',
            description = 'All love.graphics state, including transform state.',
        },
    },
}