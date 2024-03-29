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
package test.world.contact;

import test.world.TestWorld;

class TestContactOBB1 extends TestWorld
{
	override public function getName():String
	{
		return 'OBB soup';
	}
	
	override function _initWorld():Void
	{
		var boxDensity         = .1;
		var boxSizeMin         = .5;
		var boxSizeMax         = .7;
		var boxCount           = 20;
		var containerSize      = 10;
		var containerThickness = .5;
		
		_createContainer(containerThickness, 0, 0, containerSize, containerSize, false);
		
		for (i in 0...boxCount)
		{
			var x = _getRandomFloat(-(containerSize / 2 - boxSizeMax), (containerSize / 2 - boxSizeMax));
			var y = _getRandomFloat(-(containerSize / 2 - boxSizeMax), (containerSize / 2 - boxSizeMax));
			var s = _getRandomFloat(boxSizeMin, boxSizeMax);
			_createBox(boxDensity, x, y, s, s, 0);
		}
	}
	
	/*override function _draw(alpha:Float):Void
	{
		for (shape in _world.getShapeIterator())
		{
			if (shape.containsPoint(_getWorldMouse()))
			{
				var body = shape.body;
				
				_vr.clearStroke();
				
				var y = 100;
				
				var e = body.contactList;
				while (e != null)
				{
					var c = e.contact;
					
					var a = de.polygonal.motor.dynamics.contact.ContactID.toString(c.manifold.mp1.id);
					var b = de.polygonal.motor.dynamics.contact.ContactID.toString(c.manifold.mp2.id);
					
					_vr.setFillColor(0xFFFF00, 1);
					_vr.fillStart();
					font.write(a + "  " + b, 100, y);
					
					_vr.fillEnd();
					
					y += 50;
					e = e.next;
				}
				return;
			}
		}
	}*/
}