# Contribution Guidelines :heart:

First of all, thank you for taking the time to make a contribution and reading this! Please ensure your pull request adheres to the following:

## Information follows the official LÖVE-wiki

For the sake of coherence, the api documentation should follow the official [LÖVE-wiki](https://love2d.org/wiki). If there is something you want to change, make sure that you edit the wiki __first__ before submitting a pull request.

## Follow the default table layout

For the sake of easy editing of the documentation modules are located in a separate folder. Enums and Types of each module are contained in their respective subfolders.

### Functions

```lua
{
    name = 'theFunctionName',
    description = 'The general description of this function.',
    variants = {
        { -- Each variant is wrapped in its own table.
            description = 'A description of this particular variant.',
            arguments = {
                {   -- Arguments are wrapped into their own tables.
                    type = 'string',
                    name = 'filename',
                    description = 'The path and name of the file with the font.'
                },
                {
                    type = 'number',
                    name = 'size',
                    default = '12', -- Default values are of type string!
                    description = 'The size of the font.'
                }
            },
            returns = {
                {
                    type = 'Font',
                    name = 'font',
                    description = 'The new font.'
                }
            }
        },
        {
            -- Another variant
            -- ...
        }
    }
}
```
