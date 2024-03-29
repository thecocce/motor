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

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.random.Random;
import de.polygonal.motor.geom.bv.ChainHull;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2;

class TestGeomConvexHull extends TestGeom
{
	var _points:Array<Vec2>;
	var _hull:Array<Vec2>;
	var _hullPoints:Int;
	
	override public function getName():String 
	{
		return 'convex hull from point cloud';
	}
	
	override function _init():Void
	{
		super._init();
		
		_points = new Array<Vec2>();
		for (i in 0...10)
			_points.push(new Vec2(centerX + Random.frandSym(100), centerY + Random.frandSym(100)));
			
		_hull = new Array<Vec2>();
		_hullPoints = ChainHull.find(_points, _hull);
	}
	
	override function _onMouseDown(mouse:Vec2):Void 
	{
		super._onMouseDown(mouse);
		
		_points.push(new Vec2(mouse.x, mouse.y));
		if (_points.length >= 3)
		{
			_hullPoints = ChainHull.find(_points, _hull);
		}
	}
	
	override function _draw(alpha:Float):Void
	{
		_vr.setLineStyle(0x00ff00, 1, 0);
		for (p in _points) _vr.crossSkewed2(p, 3);
		_vr.setLineStyle(0xff0000, 1, 0);
		if (_hull != null) _vr.polyLineVector(_hull, true, _hullPoints);
	}
}