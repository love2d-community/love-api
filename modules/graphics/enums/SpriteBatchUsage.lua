return {
    name = 'SpriteBatchUsage',
    description = 'Usage hints for SpriteBatches to optimize sprite data storage on the GPU.',
    constants = {
        {
            name = 'dynamic',
            description = 'The SpriteBatch data will change repeatedly during its lifetime.'
        },
        {
            name = 'static',
            description = 'The SpriteBatch will not be modified after initial sprites are added.'
        },
        {
            name = 'stream',
            description = 'The SpriteBatch data will always change between draws.'
        }
    }
}
