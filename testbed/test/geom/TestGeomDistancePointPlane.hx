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
package test.geom;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.motor.geom.distance.DistancePointPlane;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.Plane2;

class TestGeomDistancePointPlane extends TestGeom
{
	var _plane:Plane2;
	
	var _distance:Float;
	
	override public function getName():String 
	{
		return 'minimum distance point to plane';
	}
	
	override function _init():Void
	{
		super._init();
		
		_plane = new Plane2();
		_plane.setFromPoints4(centerX - 100, centerY - 100, centerX + 100, centerY + 100);
		
		_tmpVec.x = 0;
		_tmpVec.y =-20;
	}
	
	override function _free():Void 
	{
		super._free();
	}
	
	override function _tick(tick:Int):Void
	{
		_distance = DistancePointPlane.find2(mouse, _plane);
	}
	
	override function _draw(alpha:Float):Void
	{
		_vr.setLineStyle(0xffffff, 1, 0);
		_vr.plane4(_plane, bound, 30, 4);
		_drawMarker(mouse, Sprintf.format('%.2f', [_distance]), 0xFFFF00, _tmpVec);
	}
}