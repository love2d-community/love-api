return {
    name = 'FullscreenType',
    description = 'Types of fullscreen modes.\n\nIn normal fullscreen mode, if a window size is used which does not match one of the monitor\'s supported display modes, the window will be resized to the next largest display mode.\n\nNormal fullscreen mode is sometimes avoided by users because it can cause issues in some window managers and with multi-monitor setups. In OS X it prevents switching to a different program until fullscreen mode is exited. The "desktop" fullscreen mode generally avoids these issues.',
    constants = {
        {
            name = 'normal',
            description = 'Standard exclusive-fullscreen mode. Changes the display mode (actual resolution) of the monitor.'
        },
        {
            name = 'desktop',
            description = 'Sometimes known as borderless fullscreen windowed mode. A borderless screen-sized window is created which sits on top of all desktop GUI elements (such as the Windows taskbar and the Mac OS X dock.) The window is automatically resized to match the dimensions of the desktop, and its size cannot be changed.'
        }
    }
}
