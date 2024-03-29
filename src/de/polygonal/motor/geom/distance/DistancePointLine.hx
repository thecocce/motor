﻿/*
 *                            _/                                                    _/
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/
 *   _/                            _/        _/
 *  _/                        _/_/      _/_/
 *
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.motor.geom.distance;

import de.polygonal.core.math.Vec2;

/**
 * Computes the squared distance from a point to a line.
 */
class DistancePointLine
{
	/** Computes the squared distance between the point <i>p</i> and the line through <i>a</i> and <i>b</i>. */
	inline public static function find3(p:Vec2, a:Vec2, b:Vec2):Float
	{
		return find6(p.x, p.y, a.x, a.y, b.x, b.y);
	}
	
	/** Computes the squared distance between the point (<i>ax</i>,<i>ay</i>) and the line through the points (<i>ax</i>,<i>ay</i>) and (<i>bx</i>,<i>by</i>). */
	inline public static function find6(px:Float, py:Float, ax:Float, ay:Float, bx:Float, by:Float):Float
	{
		var dx = bx - ax;
		var dy = by - ay;
		var t = (py - ay) * dx - (px - ax) * dy;
		return (t * t) / (dx * dx + dy * dy);
	}
}