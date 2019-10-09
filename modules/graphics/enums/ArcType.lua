return {
    name = 'ArcType',
    description = 'Different types of arcs that can be drawn.',
    constants = {
        {
            name = 'pie',
            description = 'The arc is drawn like a slice of pie, with the arc circle connected to the center at its end-points.',
        },
        {
            name = 'open',
            description = 'The arc circle\'s two end-points are unconnected when the arc is drawn as a line. Behaves like the "closed" arc type when the arc is drawn in filled mode.',
        },
        {
            name = 'closed',
            description = 'The arc circle\'s two end-points are connected to each other.',
        },
    },
}