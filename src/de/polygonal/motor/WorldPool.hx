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
package de.polygonal.motor;

import de.polygonal.ds.pooling.ObjectPool;
import de.polygonal.motor.dynamics.contact.ContactEdge;
import de.polygonal.motor.dynamics.contact.Manifold;

class WorldPool
{
	var _manifolds:ObjectPool<Manifold>;
	var _contactEdges:ObjectPool<ContactEdge>;
	
	public function new(settings:Settings)
	{
		_manifolds = new ObjectPool<Manifold>(settings.maxPairs << 1);
		_manifolds.allocate(true, Manifold);
		
		_contactEdges = new ObjectPool<ContactEdge>(settings.maxPairs << 1);
		_contactEdges.allocate(true, ContactEdge);
	}
	
	inline public function createManifold():Manifold
	{
		var id = _manifolds.next();
		var manifold = _manifolds.get(id);
		//manifold.id = id;
		return manifold;
	}
	
	inline public function recyleManifold(manifold:Manifold):Void
	{
		//_manifolds.put(manifold.id);
		//manifold.id = Integer.INT32_MIN;
	}
	
	inline public function createContactNode():ContactEdge
	{
		var id = _contactEdges.next();
		var contactNode = _contactEdges.get(id);
		//contactNode.id = id;
		return contactNode;
	}
	
	inline public static function recyleContactNode(contactNode:ContactEdge):Void
	{
		//_contactEdges.put(contactNode.id);
		//contactNode.id = M.INT32_MIN;
	}
}