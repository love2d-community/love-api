local path = (...):match('(.-)[^%./]+$')

return {
    name = 'font',
    description = 'Allows you to work with fonts.',
	types = {
        require(path .. '.types.GlyphData'),
		require(path .. '.types.Rasterizer'),
    },
    functions = {
    },
	enums = {
        require(path .. '.enums.HintingMode'),
	}
}