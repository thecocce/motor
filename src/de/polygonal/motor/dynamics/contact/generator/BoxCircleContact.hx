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
package de.polygonal.motor.dynamics.contact.generator;

import de.polygonal.motor.collision.pairwise.CollideAABBCircle;
import de.polygonal.motor.collision.pairwise.CollideOBBCircle;
import de.polygonal.motor.collision.pairwise.Collider;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.Settings;

using de.polygonal.ds.BitFlags;

class BoxCircleContact extends ConvexCircleContact
{
	var _collider1:CollideOBBCircle;
	var _collider2:CollideAABBCircle;
	
	public function new(settings:Settings)
	{
		super(settings);
		
		_collider1 = new CollideOBBCircle(settings);
		_collider2 = new CollideAABBCircle();
	}

	override public function free():Void
	{
		_collider1.free();
		_collider2.free();
		
		_collider1 = null;
		_collider2 = null;
		
		super.free();
	}
	
	override function _getCollider():Collider
	{
		if (shape1.hasf(AbstractShape.AXIS_ALIGNED))
			return _collider2;
		else
			return _collider1;
	}
}