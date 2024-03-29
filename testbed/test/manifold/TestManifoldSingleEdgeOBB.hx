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
package test.manifold;

import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.data.BoxData;
import de.polygonal.motor.data.EdgeData;
import de.polygonal.motor.data.ShapeData;
import de.polygonal.motor.dynamics.contact.Contact;
import de.polygonal.motor.dynamics.contact.generator.EdgeBoxContact;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.World;
import de.polygonal.ui.Key;

using de.polygonal.ds.BitFlags;

class TestManifoldSingleEdgeOBB extends TestManifold
{
	override public function getName():String 
	{
		return 'contact manifold: intersect single edge against OBB';
	}
	
	override function _initPairwise():Void
	{
		setf(TestManifold.DO_TRANSLATE_OTHER | TestManifold.DO_ROTATE_OTHER);
	}
	
	override function _onKeyDown(keyCode:Int):Void
	{
		if (keyCode == Key.T | Key.R) return;
		super._onKeyDown(keyCode);
	}
	
	override function _createShape1():ShapeData
	{
		var data = new EdgeData(new Vec2(-2, -2), new Vec2(2, 2));
		data.infinite = false;
		data.doubleSided = false;
		data.x = 0;
		data.y = 0;
		return data;
	}
	
	override function _createShape2():ShapeData
	{
		var data = new BoxData(0.1, 1, 1);
		data.x = 0;
		data.y = 0;
		return data;
	}
	
	override function _createContact(shape1:AbstractShape, shape2:AbstractShape):Contact
	{
		var c = new EdgeBoxContact(World.settings);
		c.init(shape1, shape2);
		return c;
	}
}