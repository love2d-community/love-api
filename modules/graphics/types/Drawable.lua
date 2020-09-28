local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Drawable',
    description = 'Superclass for all things that can be drawn on screen. This is an abstract type that can\'t be created directly.',
    supertypes = {
        'Object',
    },
    functions = {
    },
}