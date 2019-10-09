return {
    name = 'BodyType',
    description = 'The types of a Body. ',
    constants = {
        {
            name = 'static',
            description = 'Static bodies do not move.',
        },
        {
            name = 'dynamic',
            description = 'Dynamic bodies collide with all bodies.',
        },
        {
            name = 'kinematic',
            description = 'Kinematic bodies only collide with dynamic bodies.',
        },
    },
}