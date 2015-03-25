return {
    name = 'keyboard',
    description = 'Provides an interface to the user\'s keyboard.',
    functions = {
        {
            name = 'getKeyFromScancode',
            description = 'Gets the key corresponding to the given hardware scancode.\n\nThe location of a key is based on the keyboard\'s current language layout, whereas scancodes are the layout-independent representations of where the physical keys are.\n\nFor example, the key located where "q" is on a U.S. keyboard has the scancode "q". When using a U.S. keyboard layout it produces the key "q", but when using a French keyboard layout it produces the key "a".\n\nScancodes are useful for creating default controls that have the same physical locations on on all systems.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'The scancode to get the key from.'
                        }
                    },
                    returns = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'The key corresponding to the given scancode, or "unknown" if the scancode doesn\'t map to a KeyConstant on the current system.'
                        }
                    }
                }
            }
        },
        {
            name = 'getScancodeFromKey',
            description = 'Gets the hardware scancode corresponding to the given key.\n\nThe location of a key is based on the keyboard\'s current language layout, whereas scancodes are the layout-independent representations of where the physical keys are.\n\nFor example, the key located where "q" is on a U.S. keyboard has the scancode "q". When using a U.S. keyboard layout it produces the key "q", but when using a French keyboard layout it produces the key "a".\n\nScancodes are useful for creating default controls that have the same physical locations on on all systems.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'The key to get the scancode from.'
                        }
                    },
                    returns = {
                        {
                            type = 'Scancode',
                            name = 'scancode',
                            description = 'The scancode corresponding to the given key, or "unknown" if the given key has no known physical representation on the current system.'
                        }
                    }
                }
            }
        },
        {
            name = 'hasKeyRepeat',
            description = 'Gets whether key repeat is enabled.',
            functions = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'Whether key repeat is enabled.'
                        }
                    }
                }
            }
        },
        {
            name = 'hasTextInput',
            description = 'Gets whether text input events are enabled.',
            functions = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'enabled',
                            description = 'Whether text input events are enabled.'
                        }
                    }
                }
            }
        },
        {
            name = 'isDown',
            description = 'Checks whether a certain key is down. Not to be confused with love.keypressed or love.keyreleased.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = 'key',
                            description = 'The key to check.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'down',
                            description = 'True if the key is down, false if not.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'KeyConstant',
                            name = '...',
                            description = 'A key to check.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'anyDown',
                            description = 'True if any supplied key is down, false if not.'
                        }
                    }
                }
            }
        },
        {
            name = 'setKeyRepeat',
            description = 'Enables or disables key repeat. It is disabled by default.\n\nThe interval between repeats depends on the user\'s system settings.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether repeat keypress events should be enabled when a key is held down.'
                        }
                    }
                }
            }
        },
        {
            name = 'setTextInput',
            description = 'Enables or disables text input events. It is enabled by default.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'enable',
                            description = 'Whether text input events should be enabled.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        {
            name = 'KeyConstant',
            description = 'All the keys you can press. Note that some keys may not be available on your keyboard or system.',
            constants = {
                {
                    name = 'a',
                    description = 'The A key'
                },
                {
                    name = 'b',
                    description = 'The B key'
                },
                {
                    name = 'c',
                    description = 'The C key'
                },
                {
                    name = 'd',
                    description = 'The D key'
                },
                {
                    name = 'e',
                    description = 'The E key'
                },
                {
                    name = 'f',
                    description = 'The F key'
                },
                {
                    name = 'g',
                    description = 'The G key'
                },
                {
                    name = 'h',
                    description = 'The H key'
                },
                {
                    name = 'i',
                    description = 'The I key'
                },
                {
                    name = 'j',
                    description = 'The J key'
                },
                {
                    name = 'k',
                    description = 'The K key'
                },
                {
                    name = 'l',
                    description = 'The L key'
                },
                {
                    name = 'm',
                    description = 'The M key'
                },
                {
                    name = 'n',
                    description = 'The N key'
                },
                {
                    name = 'o',
                    description = 'The O key'
                },
                {
                    name = 'p',
                    description = 'The P key'
                },
                {
                    name = 'q',
                    description = 'The Q key'
                },
                {
                    name = 'r',
                    description = 'The R key'
                },
                {
                    name = 's',
                    description = 'The S key'
                },
                {
                    name = 't',
                    description = 'The T key'
                },
                {
                    name = 'u',
                    description = 'The U key'
                },
                {
                    name = 'v',
                    description = 'The V key'
                },
                {
                    name = 'w',
                    description = 'The W key'
                },
                {
                    name = 'x',
                    description = 'The X key'
                },
                {
                    name = 'y',
                    description = 'The Y key'
                },
                {
                    name = 'z',
                    description = 'The Z key'
                },
                {
                    name = '0',
                    description = 'The zero key'
                },
                {
                    name = '1',
                    description = 'The one key'
                },
                {
                    name = '2',
                    description = 'The two key'
                },
                {
                    name = '3',
                    description = 'The three key'
                },
                {
                    name = '4',
                    description = 'The four key'
                },
                {
                    name = '5',
                    description = 'The five key'
                },
                {
                    name = '6',
                    description = 'The six key'
                },
                {
                    name = '7',
                    description = 'The seven key'
                },
                {
                    name = '8',
                    description = 'The eight key'
                },
                {
                    name = '9',
                    description = 'The nine key'
                },
                {
                    name = '(space)',
                    description = 'Space key',
                    notes = 'Replace (space) with the actual space character'
                },
                {
                    name = '!',
                    description = 'Exclamation mark key'
                },
                {
                    name = '"',
                    description = 'Double quote key'
                },
                {
                    name = '#',
                    description = 'Hash key'
                },
                {
                    name = '$',
                    description = 'Dollar key'
                },
                {
                    name = '&',
                    description = 'Ampersand key'
                },
                {
                    name = '\'',
                    description = 'Single quote key'
                },
                {
                    name = '(',
                    description = 'Left parenthesis key'
                },
                {
                    name = ')',
                    description = 'Right parenthesis key'
                },
                {
                    name = '*',
                    description = 'Asterisk key'
                },
                {
                    name = '+',
                    description = 'Plus key'
                },
                {
                    name = ',',
                    description = 'Comma key'
                },
                {
                    name = '-',
                    description = 'Hyphen-minus key'
                },
                {
                    name = '.',
                    description = 'Full stop key'
                },
                {
                    name = '/',
                    description = 'Slash key'
                },
                {
                    name = ':',
                    description = 'Colon key'
                },
                {
                    name = ';',
                    description = 'Semicolon key'
                },
                {
                    name = '<',
                    description = 'Less-than key'
                },
                {
                    name = '=',
                    description = 'Equal key'
                },
                {
                    name = '>',
                    description = 'Greater-than key'
                },
                {
                    name = '?',
                    description = 'Question mark key'
                },
                {
                    name = '@',
                    description = 'At sign key'
                },
                {
                    name = '?',
                    description = 'Question mark key'
                },
                {
                    name = '[',
                    description = 'Left square bracket key'
                },
                {
                    name = '\\',
                    description = 'Backslash key'
                },
                {
                    name = ']',
                    description = 'Right square bracket key'
                },
                {
                    name = '^',
                    description = 'Caret key'
                },
                {
                    name = '_',
                    description = 'Underscore key'
                },
                {
                    name = '`',
                    description = 'Grave accent key',
                    notes = 'Also known as the "Back tick" key'
                },
                {
                    name = 'kp0',
                    description = 'The numpad zero key'
                },
                {
                    name = 'kp1',
                    description = 'The numpad one key'
                },
                {
                    name = 'kp2',
                    description = 'The numpad two key'
                },
                {
                    name = 'kp3',
                    description = 'The numpad three key'
                },
                {
                    name = 'kp4',
                    description = 'The numpad four key'
                },
                {
                    name = 'kp5',
                    description = 'The numpad five key'
                },
                {
                    name = 'kp6',
                    description = 'The numpad six key'
                },
                {
                    name = 'kp7',
                    description = 'The numpad seven key'
                },
                {
                    name = 'kp8',
                    description = 'The numpad eight key'
                },
                {
                    name = 'kp9',
                    description = 'The numpad nine key'
                },
                {
                    name = 'kp.',
                    description = 'The numpad decimal point key'
                },
                {
                    name = 'kp/',
                    description = 'The numpad division key'
                },
                {
                    name = 'kp*',
                    description = 'The numpad multiplication key'
                },
                {
                    name = 'kp-',
                    description = 'The numpad substraction key'
                },
                {
                    name = 'kp+',
                    description = 'The numpad addition key'
                },
                {
                    name = 'kpenter',
                    description = 'The numpad enter key'
                },
                {
                    name = 'kp=',
                    description = 'The numpad equals key'
                },
                {
                    name = 'up',
                    description = 'Up cursor key'
                },
                {
                    name = 'down',
                    description = 'Down cursor key'
                },
                {
                    name = 'right',
                    description = 'Right cursor key'
                },
                {
                    name = 'left',
                    description = 'Left cursor key'
                },
                {
                    name = 'home',
                    description = 'Home key'
                },
                {
                    name = 'end',
                    description = 'End key'
                },
                {
                    name = 'pageup',
                    description = 'Page up key'
                },
                {
                    name = 'pagedown',
                    description = 'Page down key'
                },
                {
                    name = 'insert',
                    description = 'Insert key'
                },
                {
                    name = 'backspace',
                    description = 'Backspace key'
                },
                {
                    name = 'tab',
                    description = 'Tab key'
                },
                {
                    name = 'clear',
                    description = 'Clear key'
                },
                {
                    name = 'return',
                    description = 'Return key',
                    notes = 'Also known as the Enter key'
                },
                {
                    name = 'delete',
                    description = 'Delete key'
                },
                {
                    name = 'f1',
                    description = 'The 1st function key'
                },
                {
                    name = 'f2',
                    description = 'The 2nd function key'
                },
                {
                    name = 'f3',
                    description = 'The 3rd function key'
                },
                {
                    name = 'f4',
                    description = 'The 4th function key'
                },
                {
                    name = 'f5',
                    description = 'The 5th function key'
                },
                {
                    name = 'f6',
                    description = 'The 6th function key'
                },
                {
                    name = 'f7',
                    description = 'The 7th function key'
                },
                {
                    name = 'f8',
                    description = 'The 8th function key'
                },
                {
                    name = 'f9',
                    description = 'The 9th function key'
                },
                {
                    name = 'f10',
                    description = 'The 10th function key'
                },
                {
                    name = 'f11',
                    description = 'The 11th function key'
                },
                {
                    name = 'f12',
                    description = 'The 12th function key'
                },
                {
                    name = 'f13',
                    description = 'The 13th function key'
                },
                {
                    name = 'f14',
                    description = 'The 14th function key'
                },
                {
                    name = 'f15',
                    description = 'The 15th function key'
                },
                {
                    name = 'numlock',
                    description = 'Num-lock key'
                },
                {
                    name = 'capslock',
                    description = 'Caps-lock key',
                    notes = 'Caps-on is a key press. Caps-off is a key release.'
                },
                {
                    name = 'scrollock',
                    description = 'Scroll-lock key'
                },
                {
                    name = 'rshift',
                    description = 'Right shift key'
                },
                {
                    name = 'lshift',
                    description = 'Left shift key'
                },
                {
                    name = 'rctrl',
                    description = 'Right control key'
                },
                {
                    name = 'lctrl',
                    description = 'Left control key'
                },
                {
                    name = 'ralt',
                    description = 'Right alt key'
                },
                {
                    name = 'lalt',
                    description = 'Left alt key'
                },
                {
                    name = 'rmeta',
                    description = 'Right meta key'
                },
                {
                    name = 'lmeta',
                    description = 'Left meta key'
                },
                {
                    name = 'lsuper',
                    description = 'Left super key'
                },
                {
                    name = 'rsuper',
                    description = 'Right super key'
                },
                {
                    name = 'mode',
                    description = 'Mode key'
                },
                {
                    name = 'compose',
                    description = 'Compose key'
                },
                {
                    name = 'pause',
                    description = 'Pause key'
                },
                {
                    name = 'escape',
                    description = 'Escape key'
                },
                {
                    name = 'help',
                    description = 'Help key'
                },
                {
                    name = 'print',
                    description = 'Print key'
                },
                {
                    name = 'sysreq',
                    description = 'System request key'
                },
                {
                    name = 'break',
                    description = 'Break key'
                },
                {
                    name = 'menu',
                    description = 'Menu key'
                },
                {
                    name = 'power',
                    description = 'Power key'
                },
                {
                    name = 'euro',
                    description = 'Euro (&euro;) key'
                },
                {
                    name = 'undo',
                    description = 'Undo key'
                },
                {
                    name = 'www',
                    description = 'WWW key'
                },
                {
                    name = 'mail',
                    description = 'Mail key'
                },
                {
                    name = 'calculator',
                    description = 'Calculator key'
                },
                {
                    name = 'appsearch',
                    description = 'Application search key'
                },
                {
                    name = 'apphome',
                    description = 'Application home key'
                },
                {
                    name = 'appback',
                    description = 'Application back key'
                },
                {
                    name = 'appforward',
                    description = 'Application forward key'
                },
                {
                    name = 'apprefresh',
                    description = 'Application refresh key'
                },
                {
                    name = 'appbookmarks',
                    description = 'Application bookmarks key'
                }
            }
        }
    }
}