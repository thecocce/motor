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
import de.polygonal.core.math.random.Random;
import de.polygonal.motor.geom.distance.DistancePointSegment;
import de.polygonal.motor.geom.primitive.Segment2;

class TestGeomDistancePointSegment extends TestGeom
{
	var _segment:Segment2;
	var _distance:Float;
	
	override public function getName():String 
	{
		return 'minimum distance point to segment';
	}
	
	override function _init():Void
	{
		super._init();
		
		var angle = Random.frandSym(Math.PI);
		var c = Math.cos(angle) * 100;
		var s = Math.sin(angle) * 100;
		_segment = new Segment2(centerX - c, centerY - s, centerX + c, centerY + s);
		_tmpVec.x = 0;
		_tmpVec.y =-20;
	}
	
	override function _tick(tick:Int):Void
	{
		_distance = DistancePointSegment.find2(mouse, _segment);
	}
	
	override function _draw(alpha:Float):Void
	{
		_vr.setLineStyle(0xffffff, 1, 0);
		_drawSegment(_segment.a, _segment.b);
		_drawMarker(mouse, Sprintf.format('%.2f', [Math.sqrt(_distance)]), 0xFFFF00, _tmpVec);
	}
}