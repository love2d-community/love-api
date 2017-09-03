return {
    name = 'BezierCurve',
    description = 'A Bézier curve object that can evaluate and render Bézier curves of arbitrary degree.',
    constructors = {
        'newBezierCurve'
    },
    functions = {
        {
            name = 'evaluate',
            description = 'Evaluate Bézier curve at parameter t. The parameter must be between 0 and 1 (inclusive).\n\nThis function can be used to move objects along paths or tween parameters. However it should not be used to render the curve, see BezierCurve:render for that purpose.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 't',
                            description = 'Where to evaluate the curve.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'x coordinate of the curve at parameter t.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'y coordinate of the curve at parameter t.'
                        }
                    }
                }
            }
        },
        {
            name = 'getControlPoint',
            description = 'Get coordinates of the i-th control point. Indices start with 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'i',
                            description = 'Index of the control point.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Position of the control point along the x axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Position of the control point along the y axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'getControlPointCount',
            description = 'Get the number of control points in the Bézier curve.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of control points.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDegree',
            description = 'Get degree of the Bézier curve. The degree is equal to number-of-control-points - 1.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'degree',
                            description = 'Degree of the Bézier curve.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDerivative',
            description = 'Get the derivative of the Bézier curve.\n\nThis function can be used to rotate sprites moving along a curve in the direction of the movement and compute the direction perpendicular to the curve at some parameter t.',
            variants = {
                {
                    returns = {
                        {
                            type = 'BezierCurve',
                            name = 'derivative',
                            description = 'The derivative curve.'
                        }
                    }
                }
            }
        },
        {
            name = 'getSegment',
            description = 'Gets a BezierCurve that corresponds to the specified segment of this BezierCurve.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'startpoint',
                            description = 'The starting point along the curve. Must be between 0 and 1.'
                        },
                        {
                            type = 'number',
                            name = 'endpoint',
                            description = 'The end of the segment. Must be between 0 and 1.'
                        }
                    },
                    returns = {
                        {
                            type = 'BezierCurve',
                            name = 'curve',
                            description = 'A BezierCurve that corresponds to the specified segment.'
                        }
                    }
                }
            }
        },
        {
            name = 'insertControlPoint',
            description = 'Insert control point as the new i-th control point. Existing control points from i onwards are pushed back by 1. Indices start with 1. Negative indices wrap around: -1 is the last control point, -2 the one before the last, etc.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'Position of the control point along the x axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'Position of the control point along the y axis.'
                        },
                        {
                            type = 'number',
                            name = 'i',
                            default = '-1',
                            description = 'Index of the control point.'
                        }
                    }
                }
            }
        },
        {
            name = 'removeControlPoint',
            description = 'Removes the specified control point.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'index',
                            description = 'The index of the control point to remove.'
                        }
                    }
                }
            }
        },
        {
            name = 'render',
            description = 'Get a list of coordinates to be used with love.graphics.line.\n\nThis function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.\n\nIf you are just interested to know the position on the curve given a parameter, use BezierCurve:evaluate.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'depth',
                            default = '5',
                            description = 'Number of recursive subdivision steps.'
                        }
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'coordinates',
                            description = 'List of x,y-coordinate pairs of points on the curve.'
                        }
                    }
                }
            }
        },
        {
            name = 'renderSegment',
            description = 'Get a list of coordinates on a specific part of the curve, to be used with love.graphics.line.\n\nThis function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.\n\nIf you are just need to know the position on the curve given a parameter, use BezierCurve:evaluate.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'startpoint',
                            description = 'The starting point along the curve. Must be between 0 and 1.'
                        },
                        {
                            type = 'number',
                            name = 'endpoint',
                            description = 'The end of the segment to render. Must be between 0 and 1.'
                        },
                        {
                            type = 'number',
                            name = 'depth',
                            default = '5',
                            description = 'Number of recursive subdivision steps.'
                        }
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'coordinates',
                            description = 'List of x,y-coordinate pairs of points on the curve.'
                        }
                    }
                }
            }
        },
        {
            name = 'rotate',
            description = 'Rotate the Bézier curve by an angle.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'Rotation angle in radians.'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'X coordinate of the rotation center.'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Y coordinate of the rotation center.'
                        }
                    }
                }
            }
        },
        {
            name = 'scale',
            description = 'Scale the Bézier curve by a factor.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 's',
                            description = 'Scale factor.'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            default = '0',
                            description = 'X coordinate of the scaling center.'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            default = '0',
                            description = 'Y coordinate of the scaling center.'
                        }
                    }
                }
            }
        },
        {
            name = 'setControlPoint',
            description = 'Set coordinates of the i-th control point. Indices start with 1.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'i',
                            description = 'Index of the control point.'
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Position of the control point along the x axis.'
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Position of the control point along the y axis.'
                        }
                    }
                }
            }
        },
        {
            name = 'translate',
            description = 'Move the Bézier curve by an offset.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'Offset along the x axis.'
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'Offset along the y axis.'
                        }
                    }
                }
            }
        }
    },
    parenttype = 'Object',
    supertypes = {
        'Object'
    }
}
