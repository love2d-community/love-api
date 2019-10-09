return {
    name = 'SpriteBatchUsage',
    description = 'Usage hints for SpriteBatches and Meshes to optimize data storage and access.',
    constants = {
        {
            name = 'dynamic',
            description = 'The object\'s data will change occasionally during its lifetime. ',
        },
        {
            name = 'static',
            description = 'The object will not be modified after initial sprites or vertices are added.',
        },
        {
            name = 'stream',
            description = 'The object data will always change between draws.',
        },
    },
}