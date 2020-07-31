return {
    name = 'HintingMode',
    description = 'True Type hinting mode.',
    constants = {
        {
            name = 'normal',
            description = 'Default hinting. Should be preferred for typical antialiased fonts.',
        },
        {
            name = 'light',
            description = 'Results in fuzzier text but can sometimes preserve the original glyph shapes of the text better than normal hinting.',
        },
        {
            name = 'mono',
            description = 'Results in aliased / unsmoothed text with either full opacity or completely transparent pixels. Should be used when antialiasing is not desired for the font.',
        },
        {
            name = 'none',
            description = 'Disables hinting for the font. Results in fuzzier text.',
        },
    },
}