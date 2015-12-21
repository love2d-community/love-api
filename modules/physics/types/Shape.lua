return {
    name = 'Shape',
    description = 'Shapes are solid 2d geometrical objects used in love.physics.\n\nShapes are attached to a Body via a Fixture. The Shape object is copied when this happens. Shape position is relative to Body position.',
    constructors = {
        'newChainShape',
        'newEdgeShape',
        'newPolygonShape',
        'newRectangleShape'
    },
    functions = {
        {
            name = 'computeAABB',
            description = 'Returns the points of the bounding box for the transformed shape.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'tx',
                            description = 'The translation of the shape on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'ty',
                            description = 'The translation of the shape on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'tr',
                            description = 'The shape rotation.'
                        },
                        {
                            type = 'number',
                            name = 'childIndex',
                            default = '1',
                            description = 'The index of the child to compute the bounding box of.'
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
            name = 'computeMass',
            description = 'Computes the mass properties for the shape with the specified density.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'density',
                            description = 'The shape density.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x postition of the center of mass.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y postition of the center of mass.'
                        },
                        {
                            type = 'number',
                            name = 'mass',
                            description = 'The mass of the shape.'
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
            name = 'getBoundingBox',
            description = 'Gets the bounding box of the shape. This function can be used in a nested fashion with love.graphics.polygon.\n\nA bounding box is the smallest rectangle that encapsulates the entire polygon.\n\nVertexes are returned starting from the bottom-left in a clockwise fashion (bottom-left, top-left, top-right, bottom-right).',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x component of the first vertex, bottom-left.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y component of the first vertex, bottom-left.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x component of the second vertex, top-left.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y component of the second vertex, top-left.'
                        },
                        {
                            type = 'number',
                            name = 'x3',
                            description = 'The x component of the third vertex, top-right.'
                        },
                        {
                            type = 'number',
                            name = 'y3',
                            description = 'The y component of the third vertex, top-right.'
                        },
                        {
                            type = 'number',
                            name = 'x4',
                            description = 'The x component of the fourth vertex, bottom-right.'
                        },
                        {
                            type = 'number',
                            name = 'y4',
                            description = 'The y component of the fourth vertex, bottom-right.'
                        }
                    }
                }
            }
        },
        {
            name = 'getChildCount',
            description = 'Returns the number of children the shape has.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of children.'
                        }
                    }
                }
            }
        },
        {
            name = 'getData',
            description = 'Get the data set with setData.',
            variants = {
                {
                    returns = {
                        {
                            type = 'any',
                            name = 'v',
                            description = 'The data previously set, or nil if none.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDensity',
            description = 'Gets the density of the Shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'density',
                            description = 'The density of the Shape.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFilterData',
            description = 'Gets the filter data of the Shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'categoryBits',
                            description = 'A 16-bit integer representing category membership.'
                        },
                        {
                            type = 'number',
                            name = 'maskBits',
                            description = 'A 16-bit integer representing masked categories.'
                        },
                        {
                            type = 'number',
                            name = 'groupIndex',
                            description = 'An integer representing the group index.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFriction',
            description = 'Gets the friction of this shape.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'friction',
                            description = 'The friction of the shape.'
                        }
                    }
                }
            }
        },
        {
            name = 'getType',
            description = 'Gets a string representing the Shape. This function can be useful for conditional debug drawing.',
            variants = {
                {
                    returns = {
                        {
                            type = 'ShapeType',
                            name = 'type',
                            description = 'The type of the Shape.'
                        }
                    }
                }
            }
        },
        {
            name = 'rayCast',
            description = 'Casts a ray against the shape and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned. The Shape can be transformed to get it into the desired position.\n\nThe ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.\n\nThe childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.\n\nThe world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.\n\nhitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x position of the input line starting point.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y position of the input line starting point.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x position of the input line end point.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y position of the input line end point.'
                        },
                        {
                            type = 'number',
                            name = 'maxFraction',
                            description = 'Ray length parameter.'
                        },
                        {
                            type = 'number',
                            name = 'tx',
                            description = 'The translation of the shape on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'ty',
                            description = 'The translation of the shape on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'tr',
                            description = 'The shape rotation.'
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
                            name = 'xn',
                            description = 'The x component of the normal vector of the edge where the ray hit the shape.'
                        },
                        {
                            type = 'number',
                            name = 'yn',
                            description = 'The y component of the normal vector of the edge where the ray hit the shape.'
                        },
                        {
                            type = 'number',
                            name = 'fraction',
                            description = 'The position on the input line where the intersection happened as a factor of the line length.'
                        }
                    }
                }
            }
        },
        {
            name = 'setData',
            description = 'Set data to be passed to the collision callback.\n\nWhen a shape collides, the value set here will be passed to the collision callback as one of the parameters. Typically, you would want to store a table reference here, but any value can be used.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'any',
                            name = 'v',
                            description = 'Any Lua value.'
                        }
                    }
                }
            }
        },
        {
            name = 'setDensity',
            description = 'Sets the density of a Shape. Do this before calling Body:setMassFromShapes.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'density',
                            description = 'The new density of the Shape.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFilterData',
            description = 'Sets the filter data for a Shape.\n\nCollision filtering is a system for preventing collision between shapes. For example, say you make a character that rides a bicycle. You want the bicycle to collide with the terrain and the character to collide with the terrain, but you don\'t want the character to collide with the bicycle (because they must overlap). Box2D supports such collision filtering using categories and groups.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'categoryBits',
                            description = 'A 16-bit integer representing category membership.'
                        },
                        {
                            type = 'number',
                            name = 'maskBits',
                            description = 'A 16-bit integer representing masked categories.'
                        },
                        {
                            type = 'number',
                            name = 'groupIndex',
                            description = 'An integer representing the group index.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFriction',
            description = 'Sets the friction of the shape. Friction determines how shapes react when they "slide" along other shapes. Low friction indicates a slippery surface, like ice, while high friction indicates a rough surface, like concrete. Range: 0.0 - 1.0.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'friction',
                            description = 'The friction of the shape.'
                        }
                    }
                }
            }
        },
        {
            name = 'testPoint',
            description = 'Checks whether a point lies inside the shape. This is particularly useful for mouse interaction with the shapes. By looping through all shapes and testing the mouse position with this function, we can find which shapes the mouse touches.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The x component of the point.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The y component of the point.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hit',
                            description = 'True if inside, false if outside'
                        }
                    }
                }
            }
        },
        {
            name = 'testSegment',
            description = 'Checks whether a line segment intersects a shape. This function will either return the "time" of impact and the surface normal at the point of collision, or nil if the line does not intersect the shape. The "time" is a value between 0.0 and 1.0 and can be used to calculate where the collision occured.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The x component of the first endpoint.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The y component of the first endpoint.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The x component of the second endpoint.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The y component of the second endpoint.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 't',
                            description = 'The time of impact, or nil if no impact.'
                        },
                        {
                            type = 'number',
                            name = 'xn',
                            description = 'The x component of the surface normal.'
                        },
                        {
                            type = 'number',
                            name = 'yn',
                            description = 'The y component of the surface normal.'
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
