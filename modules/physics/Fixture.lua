return {
    name = 'Fixture',
    description = 'Fixtures attach shapes to bodies.',
    constructors = {
        'newFixture'
    },
    functions = {
        {
            name = 'destroy',
            description = 'Destroys the fixture',
            variants = {
                {}
            }
        },
        {
            name = 'getBody',
            description = 'Returns the body to which the fixture is attached.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Body',
                            name = 'body',
                            description = 'The parent body.'
                        }
                    }
                }
            }
        },
        {
            name = 'getBoundingBox',
            description = 'Returns the points of the fixture bounding box. In case the fixture has multiple children a 1-based index can be specified. For example, a fixture will have multiple children with a chain shape.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'index',
                            default = '1',
                            description = 'A bounding box of the fixture.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'topLeftX',
                            description = 'The x position of the top-left point.'
                        },
                        {
                            type = 'number',
                            name = 'topLeftY',
                            description = 'The y position of the top-left point.'
                        },
                        {
                            type = 'number',
                            name = 'bottomRightX',
                            description = 'The x position of the bottom-right point.'
                        },
                        {
                            type = 'number',
                            name = 'bottomRightY',
                            description = 'The y position of the bottom-right point.'
                        }
                    }
                }
            }
        },
        {
            name = 'getCategory',
            description = 'Returns the categories the fixture belongs to.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'category1',
                            description = 'The first category.'
                        },
                        {
                            type = 'number',
                            name = 'category2',
                            description = 'The second category.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional categories.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDensity',
            description = 'Returns the density of the fixture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'density',
                            description = 'The fixture density in kilograms per square meter.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFilterData',
            description = 'Returns the filter data of the fixture. Categories and masks are encoded as the bits of a 16-bit integer.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'categories',
                            description = 'The categories as an integer from 0 to 65535.'
                        },
                        {
                            type = 'number',
                            name = 'mask',
                            description = 'The mask as an integer from 0 to 65535.'
                        },
                        {
                            type = 'number',
                            name = 'group',
                            description = 'The group as an integer from -32768 to 32767.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFriction',
            description = 'Returns the friction of the fixture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'friction',
                            description = 'The fixture friction.'
                        }
                    }
                }
            }
        },
        {
            name = 'getGroupIndex',
            description = 'Returns the group the fixture belongs to. Fixtures with the same group will always collide if the group is positive or never collide if it\'s negative. The group zero means no group.\n\nThe groups range from -32768 to 32767.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'group',
                            description = 'The group of the fixture.'
                        }
                    }
                }
            }
        },
        {
            name = 'getMask',
            description = 'Returns the category mask of the fixture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'mask1',
                            description = 'The first category selected by the mask.'
                        },
                        {
                            type = 'number',
                            name = 'mask2',
                            description = 'The second category selected by the mask.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional categories selected by the mask.'
                        }
                    }
                }
            }
        },
        {
            name = 'getMassData',
            description = 'Returns the mass, its center and the rotational inertia.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the center of mass.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the center of mass.'
                        },
                        {
                            type = 'number',
                            name = 'mass',
                            description = 'The mass of the fixture.'
                        },
                        {
                            type = 'number',
                            name = 'inertia',
                            description = 'The rotational inertia.'
                        }
                    }
                }
            }
        },
        {
            name = 'getRestitution',
            description = 'Returns the restitution of the fixture.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'restitution',
                            description = 'The fixture restitution.'
                        }
                    }
                }
            }
        },
        {
            name = 'getShape',
            description = 'Returns the shape of the fixture. This shape is a reference to the actual data used in the simulation. It\'s possible to change its values between timesteps.\n\nDo not call any functions on this shape after the parent fixture has been destroyed. This shape will point to an invalid memory address and likely cause crashes if you interact further with it.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Shape',
                            name = 'shape',
                            description = 'The fixture\'s shape.'
                        }
                    }
                }
            }
        },
        {
            name = 'getUserData',
            description = 'Returns the Lua value associated with this fixture.\n\nUse this function in one thread only.',
            variants = {
                {
                    returns = {
                        {
                            type = 'mixed',
                            name = 'value',
                            description = 'The Lua value associated with the fixture.'
                        }
                    }
                }
            }
        },
        {
            name = 'isDestroyed',
            description = 'Gets whether the Fixture is destroyed. Destroyed fixtures cannot be used.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'destroyed',
                            description = 'Whether the Fixture is destroyed.'
                        }
                    }
                }
            }
        },
        {
            name = 'isSensor',
            description = 'Returns whether the fixture is a sensor.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'sensor',
                            description = 'If the fixture is a sensor.'
                        }
                    }
                }
            }
        },
        {
            name = 'rayCast',
            description = 'Casts a ray against the shape of the fixture and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned.\n\nThe ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.\n\nThe childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.\n\nThe world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.\n\nhitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x position of the ray starting point.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the ray starting point.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x position of the ray end point.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the ray end point.'
                        },
                        {
                            type = 'number',
                            name = 'maxFraction',
                            description = 'The maximum distance the ray is going to travel as a number from 0 to 1.'
                        },
                        {
                            type = 'number',
                            name = 'childIndex',
                            default = '1',
                            description = 'The index of the child the ray gets cast against.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position where the ray intersects with the shape.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position where the ray intersects with the shape.'
                        },
                        {
                            type = 'number',
                            name = 'fraction',
                            description = 'The position on the input vector where the intersection happened as a number from 0 to 1.'
                        }
                    }
                }
            }
        },
        {
            name = 'setCategory',
            description = 'Sets the categories the fixture belongs to. There can be up to 16 categories represented as a number from 1 to 16.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'category1',
                            description = 'The first category.'
                        },
                        {
                            type = 'number',
                            name = 'category2',
                            description = 'The second category.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional categories.'
                        }
                    }
                }
            }
        },
        {
            name = 'setDensity',
            description = 'Sets the density of the fixture. Call Body:resetMassData if this needs to take effect immediately.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'density',
                            description = 'The fixture density in kilograms per square meter.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFilterData',
            description = 'Sets the filter data of the fixture.\n\nGroups, categories, and mask can be used to define the collision behaviour of the fixture.\n\nIf two fixtures are in the same group they either always collide if the group is positive, or never collide if it\'s negative. Is the group zero or they do not match, then the contact filter checks if the fixtures select a category of the other fixture with their masks. The fixtures do not collide if that\'s not the case. If they do have each others categories selected, the return value of the custom contact filter will be used. They always collide if none was set.\n\nThere can be up to 16 categories. Categories and masks are encoded as the bits of a 16-bit integer.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'categories',
                            description = 'The categories as an integer from 0 to 65535.'
                        },
                        {
                            type = 'number',
                            name = 'mask',
                            description = 'The mask as an integer from 0 to 65535.'
                        },
                        {
                            type = 'number',
                            name = 'group',
                            description = 'The group as an integer from -32768 to 32767.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFriction',
            description = 'Sets the friction of the fixture.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'friction',
                            description = 'The fixture friction.'
                        }
                    }
                }
            }
        },
        {
            name = 'setGroupIndex',
            description = 'Sets the group the fixture belongs to. Fixtures with the same group will always collide if the group is positive or never collide if it\'s negative. The group zero means no group.\n\nThe groups range from -32768 to 32767.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'group',
                            description = 'The group as an integer from -32768 to 32767.'
                        }
                    }
                }
            }
        },
        {
            name = 'setMask',
            description = 'Sets the category mask of the fixture. There can be up to 16 categories represented as a number from 1 to 16.\n\nThis fixture will collide with the fixtures that are in the selected categories if the other fixture also has a category of this fixture selected.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'mask1',
                            description = 'The first category.'
                        },
                        {
                            type = 'number',
                            name = 'mask2',
                            description = 'The second category.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional categories.'
                        }
                    }
                }
            }
        },
        {
            name = 'setRestitution',
            description = 'Sets the restitution of the fixture.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'restitution',
                            description = 'The fixture restitution.'
                        }
                    }
                }
            }
        },
        {
            name = 'setSensor',
            description = 'Sets whether the fixture should act as a sensor.\n\nSensor do not produce collisions responses, but the begin and end callbacks will still be called for this fixture.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'boolean',
                            name = 'sensor',
                            description = 'The sensor status.'
                        }
                    }
                }
            }
        },
        {
            name = 'setUserData',
            description = 'Associates a Lua value with the fixture.\n\nUse this function in one thread only.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'mixed',
                            name = 'value',
                            description = 'The Lua value associated with the fixture.'
                        }
                    }
                }
            }
        },
        {
            name = 'testPoint',
            description = 'Checks if a point is inside the shape of the fixture.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x position of the point.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y position of the point.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'isInside',
                            description = 'True if the point is inside or false if it is outside.',
                        }
                    }
                }
            }
        }
    },
    supertypes = {
        'Object'
    }
}
