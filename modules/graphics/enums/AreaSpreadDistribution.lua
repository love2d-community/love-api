return {
    name = 'AreaSpreadDistribution',
    description = 'Types of particle area spread distribution.',
    constants = {
        {
            name = 'uniform',
            description = 'Uniform distribution.',
        },
        {
            name = 'normal',
            description = 'Normal (gaussian) distribution.',
        },
        {
            name = 'ellipse',
            description = 'Uniform distribution in an ellipse.',
        },
        {
            name = 'borderellipse',
            description = 'Distribution in an ellipse with particles spawning at the edges of the ellipse.',
        },
        {
            name = 'borderrectangle',
            description = 'Distribution in a rectangle with particles spawning at the edges of the rectangle.',
        },
        {
            name = 'none',
            description = 'No distribution - area spread is disabled.',
        },
    },
}