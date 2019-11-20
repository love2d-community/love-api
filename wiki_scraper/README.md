Step 1: Download export files to a folder named "wiki".

The export URLs look like this: https://www.love2d.org/wiki/Special:Export/love.graphics.draw

Don't include module pages or love.conf's page.

Module names and descriptions, love.conf, and KeyConstant are copied from the original love-api table.

Example script for generating URLs to download:

```lua
local api = require('love-api.extra')(require('love-api.love_api'))

for _, v in pairs(api.allfullnames) do
    local name = v.fullname

    if v.what ~= 'module' and v.fullname ~= 'love.conf' then
        if name:match('Image:') then
            name = name:gsub('^Image:(.+)', '(Image):%1')
        elseif name:match('File:') then
            name = name:gsub('^File:(.+)', '(File):%1')
        end

        print('https://www.love2d.org/wiki/Special:Export/'..name)
    end
end
```

```
lua script.lua > output.txt
aria2c --dir=wiki --input-file=output.txt
```

Step 2: Run wiki_scraper using LOVE. It will use write_love_api.lua to output files to the save directory.
