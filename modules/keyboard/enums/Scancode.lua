return {
    name = 'Scancode',
    description = 'Keyboard scancodes.\n\nScancodes are keyboard layout-independent, so the scancode "w" will be generated if the key in the same place as the "w" key on an American QWERTY keyboard is pressed, no matter what the key is labelled or what the user\'s operating system settings are.\n\nUsing scancodes, rather than keycodes, is useful because keyboards with layouts differing from the US/UK layout(s) might have keys that generate \'unknown\' keycodes, but the scancodes will still be detected. This however would necessitate having a list for each keyboard layout one would choose to support.\n\nOne could use textinput or textedited instead, but those only give back the end result of keys used, i.e. you can\'t get modifiers on their own from it, only the final symbols that were generated.',
    constants = {
        {
            name = 'a',
            description = 'The \'A\' key on an American layout.',
        },
        {
            name = 'b',
            description = 'The \'B\' key on an American layout.',
        },
        {
            name = 'c',
            description = 'The \'C\' key on an American layout.',
        },
        {
            name = 'd',
            description = 'The \'D\' key on an American layout.',
        },
        {
            name = 'e',
            description = 'The \'E\' key on an American layout.',
        },
        {
            name = 'f',
            description = 'The \'F\' key on an American layout.',
        },
        {
            name = 'g',
            description = 'The \'G\' key on an American layout.',
        },
        {
            name = 'h',
            description = 'The \'H\' key on an American layout.',
        },
        {
            name = 'i',
            description = 'The \'I\' key on an American layout.',
        },
        {
            name = 'j',
            description = 'The \'J\' key on an American layout.',
        },
        {
            name = 'k',
            description = 'The \'K\' key on an American layout.',
        },
        {
            name = 'l',
            description = 'The \'L\' key on an American layout.',
        },
        {
            name = 'm',
            description = 'The \'M\' key on an American layout.',
        },
        {
            name = 'n',
            description = 'The \'N\' key on an American layout.',
        },
        {
            name = 'o',
            description = 'The \'O\' key on an American layout.',
        },
        {
            name = 'p',
            description = 'The \'P\' key on an American layout.',
        },
        {
            name = 'q',
            description = 'The \'Q\' key on an American layout.',
        },
        {
            name = 'r',
            description = 'The \'R\' key on an American layout.',
        },
        {
            name = 's',
            description = 'The \'S\' key on an American layout.',
        },
        {
            name = 't',
            description = 'The \'T\' key on an American layout.',
        },
        {
            name = 'u',
            description = 'The \'U\' key on an American layout.',
        },
        {
            name = 'v',
            description = 'The \'V\' key on an American layout.',
        },
        {
            name = 'w',
            description = 'The \'W\' key on an American layout.',
        },
        {
            name = 'x',
            description = 'The \'X\' key on an American layout.',
        },
        {
            name = 'y',
            description = 'The \'Y\' key on an American layout.',
        },
        {
            name = 'z',
            description = 'The \'Z\' key on an American layout.',
        },
        {
            name = '1',
            description = 'The \'1\' key on an American layout.',
        },
        {
            name = '2',
            description = 'The \'2\' key on an American layout.',
        },
        {
            name = '3',
            description = 'The \'3\' key on an American layout.',
        },
        {
            name = '4',
            description = 'The \'4\' key on an American layout.',
        },
        {
            name = '5',
            description = 'The \'5\' key on an American layout.',
        },
        {
            name = '6',
            description = 'The \'6\' key on an American layout.',
        },
        {
            name = '7',
            description = 'The \'7\' key on an American layout.',
        },
        {
            name = '8',
            description = 'The \'8\' key on an American layout.',
        },
        {
            name = '9',
            description = 'The \'9\' key on an American layout.',
        },
        {
            name = '0',
            description = 'The \'0\' key on an American layout.',
        },
        {
            name = 'return',
            description = 'The \'return\' / \'enter\' key on an American layout.',
        },
        {
            name = 'escape',
            description = 'The \'escape\' key on an American layout.',
        },
        {
            name = 'backspace',
            description = 'The \'backspace\' key on an American layout.',
        },
        {
            name = 'tab',
            description = 'The \'tab\' key on an American layout.',
        },
        {
            name = 'space',
            description = 'The spacebar on an American layout.',
        },
        {
            name = '-',
            description = 'The minus key on an American layout.',
        },
        {
            name = '=',
            description = 'The equals key on an American layout.',
        },
        {
            name = '[',
            description = 'The left-bracket key on an American layout.',
        },
        {
            name = ']',
            description = 'The right-bracket key on an American layout.',
        },
        {
            name = '\\',
            description = 'The backslash key on an American layout.',
        },
        {
            name = 'nonus#',
            description = 'The non-U.S. hash scancode.',
        },
        {
            name = ';',
            description = 'The semicolon key on an American layout.',
        },
        {
            name = '\'',
            description = 'The apostrophe key on an American layout.',
        },
        {
            name = '`',
            description = 'The back-tick / grave key on an American layout.',
        },
        {
            name = ',',
            description = 'The comma key on an American layout.',
        },
        {
            name = '.',
            description = 'The period key on an American layout.',
        },
        {
            name = '/',
            description = 'The forward-slash key on an American layout.',
        },
        {
            name = 'capslock',
            description = 'The capslock key on an American layout.',
        },
        {
            name = 'f1',
            description = 'The F1 key on an American layout.',
        },
        {
            name = 'f2',
            description = 'The F2 key on an American layout.',
        },
        {
            name = 'f3',
            description = 'The F3 key on an American layout.',
        },
        {
            name = 'f4',
            description = 'The F4 key on an American layout.',
        },
        {
            name = 'f5',
            description = 'The F5 key on an American layout.',
        },
        {
            name = 'f6',
            description = 'The F6 key on an American layout.',
        },
        {
            name = 'f7',
            description = 'The F7 key on an American layout.',
        },
        {
            name = 'f8',
            description = 'The F8 key on an American layout.',
        },
        {
            name = 'f9',
            description = 'The F9 key on an American layout.',
        },
        {
            name = 'f10',
            description = 'The F10 key on an American layout.',
        },
        {
            name = 'f11',
            description = 'The F11 key on an American layout.',
        },
        {
            name = 'f12',
            description = 'The F12 key on an American layout.',
        },
        {
            name = 'f13',
            description = 'The F13 key on an American layout.',
        },
        {
            name = 'f14',
            description = 'The F14 key on an American layout.',
        },
        {
            name = 'f15',
            description = 'The F15 key on an American layout.',
        },
        {
            name = 'f16',
            description = 'The F16 key on an American layout.',
        },
        {
            name = 'f17',
            description = 'The F17 key on an American layout.',
        },
        {
            name = 'f18',
            description = 'The F18 key on an American layout.',
        },
        {
            name = 'f19',
            description = 'The F19 key on an American layout.',
        },
        {
            name = 'f20',
            description = 'The F20 key on an American layout.',
        },
        {
            name = 'f21',
            description = 'The F21 key on an American layout.',
        },
        {
            name = 'f22',
            description = 'The F22 key on an American layout.',
        },
        {
            name = 'f23',
            description = 'The F23 key on an American layout.',
        },
        {
            name = 'f24',
            description = 'The F24 key on an American layout.',
        },
        {
            name = 'lctrl',
            description = 'The left control key on an American layout.',
        },
        {
            name = 'lshift',
            description = 'The left shift key on an American layout.',
        },
        {
            name = 'lalt',
            description = 'The left alt / option key on an American layout.',
        },
        {
            name = 'lgui',
            description = 'The left GUI (command / windows / super) key on an American layout.',
        },
        {
            name = 'rctrl',
            description = 'The right control key on an American layout.',
        },
        {
            name = 'rshift',
            description = 'The right shift key on an American layout.',
        },
        {
            name = 'ralt',
            description = 'The right alt / option key on an American layout.',
        },
        {
            name = 'rgui',
            description = 'The right GUI (command / windows / super) key on an American layout.',
        },
        {
            name = 'printscreen',
            description = 'The printscreen key on an American layout.',
        },
        {
            name = 'scrolllock',
            description = 'The scroll-lock key on an American layout.',
        },
        {
            name = 'pause',
            description = 'The pause key on an American layout.',
        },
        {
            name = 'insert',
            description = 'The insert key on an American layout.',
        },
        {
            name = 'home',
            description = 'The home key on an American layout.',
        },
        {
            name = 'numlock',
            description = 'The numlock / clear key on an American layout.',
        },
        {
            name = 'pageup',
            description = 'The page-up key on an American layout.',
        },
        {
            name = 'delete',
            description = 'The forward-delete key on an American layout.',
        },
        {
            name = 'end',
            description = 'The end key on an American layout.',
        },
        {
            name = 'pagedown',
            description = 'The page-down key on an American layout.',
        },
        {
            name = 'right',
            description = 'The right-arrow key on an American layout.',
        },
        {
            name = 'left',
            description = 'The left-arrow key on an American layout.',
        },
        {
            name = 'down',
            description = 'The down-arrow key on an American layout.',
        },
        {
            name = 'up',
            description = 'The up-arrow key on an American layout.',
        },
        {
            name = 'nonusbackslash',
            description = 'The non-U.S. backslash scancode.',
        },
        {
            name = 'application',
            description = 'The application key on an American layout. Windows contextual menu, compose key.',
        },
        {
            name = 'execute',
            description = 'The \'execute\' key on an American layout.',
        },
        {
            name = 'help',
            description = 'The \'help\' key on an American layout.',
        },
        {
            name = 'menu',
            description = 'The \'menu\' key on an American layout.',
        },
        {
            name = 'select',
            description = 'The \'select\' key on an American layout.',
        },
        {
            name = 'stop',
            description = 'The \'stop\' key on an American layout.',
        },
        {
            name = 'again',
            description = 'The \'again\' key on an American layout.',
        },
        {
            name = 'undo',
            description = 'The \'undo\' key on an American layout.',
        },
        {
            name = 'cut',
            description = 'The \'cut\' key on an American layout.',
        },
        {
            name = 'copy',
            description = 'The \'copy\' key on an American layout.',
        },
        {
            name = 'paste',
            description = 'The \'paste\' key on an American layout.',
        },
        {
            name = 'find',
            description = 'The \'find\' key on an American layout.',
        },
        {
            name = 'kp/',
            description = 'The keypad forward-slash key on an American layout.',
        },
        {
            name = 'kp*',
            description = 'The keypad \'*\' key on an American layout.',
        },
        {
            name = 'kp-',
            description = 'The keypad minus key on an American layout.',
        },
        {
            name = 'kp+',
            description = 'The keypad plus key on an American layout.',
        },
        {
            name = 'kp=',
            description = 'The keypad equals key on an American layout.',
        },
        {
            name = 'kpenter',
            description = 'The keypad enter key on an American layout.',
        },
        {
            name = 'kp1',
            description = 'The keypad \'1\' key on an American layout.',
        },
        {
            name = 'kp2',
            description = 'The keypad \'2\' key on an American layout.',
        },
        {
            name = 'kp3',
            description = 'The keypad \'3\' key on an American layout.',
        },
        {
            name = 'kp4',
            description = 'The keypad \'4\' key on an American layout.',
        },
        {
            name = 'kp5',
            description = 'The keypad \'5\' key on an American layout.',
        },
        {
            name = 'kp6',
            description = 'The keypad \'6\' key on an American layout.',
        },
        {
            name = 'kp7',
            description = 'The keypad \'7\' key on an American layout.',
        },
        {
            name = 'kp8',
            description = 'The keypad \'8\' key on an American layout.',
        },
        {
            name = 'kp9',
            description = 'The keypad \'9\' key on an American layout.',
        },
        {
            name = 'kp0',
            description = 'The keypad \'0\' key on an American layout.',
        },
        {
            name = 'kp.',
            description = 'The keypad period key on an American layout.',
        },
        {
            name = 'international1',
            description = 'The 1st international key on an American layout. Used on Asian keyboards.',
        },
        {
            name = 'international2',
            description = 'The 2nd international key on an American layout.',
        },
        {
            name = 'international3',
            description = 'The 3rd international  key on an American layout. Yen.',
        },
        {
            name = 'international4',
            description = 'The 4th international key on an American layout.',
        },
        {
            name = 'international5',
            description = 'The 5th international key on an American layout.',
        },
        {
            name = 'international6',
            description = 'The 6th international key on an American layout.',
        },
        {
            name = 'international7',
            description = 'The 7th international key on an American layout.',
        },
        {
            name = 'international8',
            description = 'The 8th international key on an American layout.',
        },
        {
            name = 'international9',
            description = 'The 9th international key on an American layout.',
        },
        {
            name = 'lang1',
            description = 'Hangul/English toggle scancode.',
        },
        {
            name = 'lang2',
            description = 'Hanja conversion scancode.',
        },
        {
            name = 'lang3',
            description = 'Katakana scancode.',
        },
        {
            name = 'lang4',
            description = 'Hiragana scancode.',
        },
        {
            name = 'lang5',
            description = 'Zenkaku/Hankaku scancode.',
        },
        {
            name = 'mute',
            description = 'The mute key on an American layout.',
        },
        {
            name = 'volumeup',
            description = 'The volume up key on an American layout.',
        },
        {
            name = 'volumedown',
            description = 'The volume down key on an American layout.',
        },
        {
            name = 'audionext',
            description = 'The audio next track key on an American layout.',
        },
        {
            name = 'audioprev',
            description = 'The audio previous track key on an American layout.',
        },
        {
            name = 'audiostop',
            description = 'The audio stop key on an American layout.',
        },
        {
            name = 'audioplay',
            description = 'The audio play key on an American layout.',
        },
        {
            name = 'audiomute',
            description = 'The audio mute key on an American layout.',
        },
        {
            name = 'mediaselect',
            description = 'The media select key on an American layout.',
        },
        {
            name = 'www',
            description = 'The \'WWW\' key on an American layout.',
        },
        {
            name = 'mail',
            description = 'The Mail key on an American layout.',
        },
        {
            name = 'calculator',
            description = 'The calculator key on an American layout.',
        },
        {
            name = 'computer',
            description = 'The \'computer\' key on an American layout.',
        },
        {
            name = 'acsearch',
            description = 'The AC Search key on an American layout.',
        },
        {
            name = 'achome',
            description = 'The AC Home key on an American layout.',
        },
        {
            name = 'acback',
            description = 'The AC Back key on an American layout.',
        },
        {
            name = 'acforward',
            description = 'The AC Forward key on an American layout.',
        },
        {
            name = 'acstop',
            description = 'Th AC Stop key on an American layout.',
        },
        {
            name = 'acrefresh',
            description = 'The AC Refresh key on an American layout.',
        },
        {
            name = 'acbookmarks',
            description = 'The AC Bookmarks key on an American layout.',
        },
        {
            name = 'power',
            description = 'The system power scancode.',
        },
        {
            name = 'brightnessdown',
            description = 'The brightness-down scancode.',
        },
        {
            name = 'brightnessup',
            description = 'The brightness-up scancode.',
        },
        {
            name = 'displayswitch',
            description = 'The display switch scancode.',
        },
        {
            name = 'kbdillumtoggle',
            description = 'The keyboard illumination toggle scancode.',
        },
        {
            name = 'kbdillumdown',
            description = 'The keyboard illumination down scancode.',
        },
        {
            name = 'kbdillumup',
            description = 'The keyboard illumination up scancode.',
        },
        {
            name = 'eject',
            description = 'The eject scancode.',
        },
        {
            name = 'sleep',
            description = 'The system sleep scancode.',
        },
        {
            name = 'alterase',
            description = 'The alt-erase key on an American layout.',
        },
        {
            name = 'sysreq',
            description = 'The sysreq key on an American layout.',
        },
        {
            name = 'cancel',
            description = 'The \'cancel\' key on an American layout.',
        },
        {
            name = 'clear',
            description = 'The \'clear\' key on an American layout.',
        },
        {
            name = 'prior',
            description = 'The \'prior\' key on an American layout.',
        },
        {
            name = 'return2',
            description = 'The \'return2\' key on an American layout.',
        },
        {
            name = 'separator',
            description = 'The \'separator\' key on an American layout.',
        },
        {
            name = 'out',
            description = 'The \'out\' key on an American layout.',
        },
        {
            name = 'oper',
            description = 'The \'oper\' key on an American layout.',
        },
        {
            name = 'clearagain',
            description = 'The \'clearagain\' key on an American layout.',
        },
        {
            name = 'crsel',
            description = 'The \'crsel\' key on an American layout.',
        },
        {
            name = 'exsel',
            description = 'The \'exsel\' key on an American layout.',
        },
        {
            name = 'kp00',
            description = 'The keypad 00 key on an American layout.',
        },
        {
            name = 'kp000',
            description = 'The keypad 000 key on an American layout.',
        },
        {
            name = 'thsousandsseparator',
            description = 'The thousands-separator key on an American layout.',
        },
        {
            name = 'decimalseparator',
            description = 'The decimal separator key on an American layout.',
        },
        {
            name = 'currencyunit',
            description = 'The currency unit key on an American layout.',
        },
        {
            name = 'currencysubunit',
            description = 'The currency sub-unit key on an American layout.',
        },
        {
            name = 'app1',
            description = 'The \'app1\' scancode.',
        },
        {
            name = 'app2',
            description = 'The \'app2\' scancode.',
        },
        {
            name = 'unknown',
            description = 'An unknown key.',
        },
    },
}