return {
    name = 'GraphicsFeature',
    description = 'Graphics features that can be checked for with love.graphics.isSupported.\n\nsubtractive, mipmap, and dxt are supported on nearly every system.\n\ncanvas, multicanvas, npot, and shader have roughly the same minimum requirements for support: a DirectX 9.0c+ capable graphics card with drivers that support ~OpenGL 2.1+.\n\nhdrcanvas, bc5, and srgb all share mostly the same minimum requirements for support as well: a DirectX 10+ capable graphics card with drivers that support ~OpenGL 3+.\n\nDirectX 9.0c+ capable graphics cards include the nvidia GeForce 5000-series (2003) and newer, the ATI Radeon 9000-series and newer, and the Intel GMA x3100 GPU and newer.\n\nDirectX 10+ capable graphics cards include the nvidia GeForce 8000-series (2006) and newer, the ATI/AMD HD 2000-series and newer, and the Intel HD 2000/3000 GPUs and newer.',
    constants = {
        {
            name = 'multicanvas',
            description = 'Support for simultaneous rendering to at least 4 canvases at once, with love.graphics.setCanvas.'
        },
        {
            name = 'srgb',
            description = 'Support for gamma-correct rendering with the srgb window flag in love.window.setMode, and the "srgb" TextureFormat for Canvases and Images.'
        }
    }
}
