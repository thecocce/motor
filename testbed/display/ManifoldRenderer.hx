/*
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
package display;

import de.polygonal.core.math.Mathematics;
import de.polygonal.gl.color.RGBA;
import de.polygonal.gl.text.VectorFont;
import de.polygonal.gl.VectorRenderer;
import de.polygonal.motor.collision.shape.ShapeType;
import de.polygonal.motor.dynamics.contact.Contact;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

using de.polygonal.motor.dynamics.contact.ContactID;
using de.polygonal.gl.color.RGBA;

/**
 * Draws a contact manifold including contact points, contact normals, contact ids,
 * reference face, incident edge and incident vertex.
 */
class ManifoldRenderer
{
	public var colorRefEdge:Int;
	public var colorIncEdge:Int;
	public var colorIncVert:Int;
	public var colorContactId:Int;
	public var colorContactPointFill:Int;
	public var colorContactSep:Int;
	public var colorContactNormal:Int;
	public var colorContactVector:Int;
	
	public var contactPointSize:Float;
	public var incVertsSize:Float;
	public var contactIdFontSize:Float;
	
	public var font:VectorFont;
	
	var _contact:Contact;
	var _vr:VectorRenderer;
	var _camera:Camera;
	var _tmp1:Vec2;
	var _tmp2:Vec2;
	var _window:AABB2;
	
	public function new(contact:Contact, camera:Camera, vr:VectorRenderer, window:AABB2)
	{
		_contact = contact;
		_camera  = camera;
		_vr      = vr;
		_window  = window;
		_tmp1    = new Vec2();
		_tmp2    = new Vec2();
	}
	
	public function drawContactPoints():Void
	{
		if (_contact.manifoldCount == 0) return;
		
		_vr.clearStroke();
		_vr.style.fillColor = colorContactPointFill.getRGB();
		_vr.style.fillAlpha = colorContactPointFill.getA() / 0xff;
		
		_vr.fillStart();
		
		for (mp in _contact.manifold)
		{
			_camera.toScreen(mp, _tmp1);
			_vr.box2(_tmp1, contactPointSize);
		}
		
		_vr.fillEnd();
	}
	
	public function drawContactNormals():Void
	{
		if (_contact.manifoldCount == 0) return;
		
		_vr.style.lineColor = colorContactNormal.getRGB();
		_vr.style.lineAlpha = colorContactNormal.getA() / 0xff;
		
		_vr.applyLineStyle();
		
		for (mp in _contact.manifold)
		{
			if (-mp.sep < Mathematics.EPS) continue;
			
			var	len = -_camera.scale(mp.sep);
			
			_camera.toScreen(mp, _tmp1);
			if (mp.id.getFlip() == 1)
			{
				_tmp2.x = -_contact.manifold.ncoll.x;
				_tmp2.y = -_contact.manifold.ncoll.y;
				_vr.arrowRay4(_tmp1, _tmp2, len, 6);
			}
			else
				_vr.arrowRay4(_tmp1, _contact.manifold.ncoll, len, 6);
		}
	}
	
	public function drawContactIds():Void
	{
		if (_contact.manifoldCount == 0) return;
		
		var a:Vec2 = null;
		var b:Vec2 = null;
		
		var m = _contact.manifold;
		var mp = m.mp1;
		
		a = _camera.toScreen(mp, _tmp1);
		if (m.pointCount > 1)
		{
			mp = mp.next;
			b = _camera.toScreen(mp, _tmp2);
		}
		
		var fontSize = font.size;
		font.size = contactIdFontSize;
		
		_vr.clearStroke();
		_vr.style.fillColor = colorContactId.getRGB();
		_vr.style.fillAlpha = colorContactId.getA() / 0xff;
		
		if (m.pointCount > 1)
		{
			var mp1 = m.mp1;
			var mp2 = m.mp2;
			
			if (a.y > b.y)
			{
				var tmp = a; a = b; b = tmp;
				var tmp = mp1; mp1 = mp2; mp2 = tmp;
			}
			
			_vr.fillStart();
			font.write(mp1.id.toString(), Std.int(a.x) + 10, 50, true);
			font.write(mp2.id.toString(), Std.int(b.x) + 10, _window.maxY - 50, true);
			_vr.fillEnd();
			
			_vr.setLineStyle(0xffffff, 0.75, 0);
			_vr.arrowLine5(a.x, a.y, a.x, 60, 8);
			_vr.arrowLine5(b.x, b.y, b.x, _window.maxY - 60, 8);
		}
		else
		{
			_vr.fillStart();
			font.write(m.mp1.id.toString(), a.x + 10, 50, true);
			_vr.fillEnd();
			
			_vr.setLineStyle(0xffffff, 0.75, 0);
			_vr.arrowLine5(a.x, a.y, a.x, 60, 8);
		}
		
		font.size = fontSize;
	}
	
	public function drawReferenceEdge():Void
	{
		if (!_hasManifold()) return;
		
		var type1 = _contact.shape1.type;
		var type2 = _contact.shape2.type;
		
		_vr.style.lineColor = colorRefEdge.getRGB();
		_vr.style.lineAlpha = colorRefEdge.getA() / 0xff;
		
		_vr.applyLineStyle();
		
		for (mp in _contact.manifold)
		{
			var refEdge = mp.id.getRefEdge();
			if (refEdge == ContactID.NULL_FEATURE) continue;
			
			var refEdgeVertex;
			
			if (type1 == ShapeType.CIRCLE)
			{
				_contact.shape2.syncFeatures();
				refEdgeVertex = _contact.shape2.worldVertexChain.getAt(refEdge);
			}
			else
			if (type2 == ShapeType.CIRCLE)
			{
				_contact.shape1.syncFeatures();
				refEdgeVertex = _contact.shape1.worldVertexChain.getAt(refEdge);
			}
			else
			{
				var refShape;
				
				if (mp.id.getFlip() == 1)
					refShape = _contact.shape2;
				else
					refShape = _contact.shape1;
				
				refShape.syncFeatures();
				refEdgeVertex = refShape.worldVertexChain.getAt(refEdge);
			}
			
			_camera.toScreen(refEdgeVertex, _tmp1);
			_camera.toScreen(refEdgeVertex.next, _tmp2);
			_vr.line2(_tmp1, _tmp2);
		}
	}
	
	public function drawIncidentEdge():Void
	{
		if (!_hasManifold()) return;
		
		var type1 = _contact.shape1.type;
		var type2 = _contact.shape2.type;
		
		_vr.style.lineColor = colorIncEdge.getRGB();
		_vr.style.lineAlpha = colorIncEdge.getA() / 0xff;
		_vr.applyLineStyle();
		
		for (mp in _contact.manifold)
		{
			var incEdge = mp.id.getIncEdge();
			if (incEdge == ContactID.NULL_FEATURE) continue;
			
			var incEdgeVertex;
			
			if (type1 == ShapeType.CIRCLE)
			{
				_contact.shape2.syncFeatures();
				incEdgeVertex = _contact.shape2.worldVertexChain.getAt(incEdge);
			}
			else
			if (type2 == ShapeType.CIRCLE)
			{
				_contact.shape1.syncFeatures();
				incEdgeVertex = _contact.shape1.worldVertexChain.getAt(incEdge);
			}
			else
			{
				var incShape;
				if (mp.id.getFlip() == 1)
					incShape = _contact.shape1;
				else
					incShape = _contact.shape2;
					
				incShape.syncFeatures();
				incEdgeVertex = incShape.worldVertexChain.getAt(incEdge);
			}
			
			_camera.toScreen(incEdgeVertex     , _tmp1);
			_camera.toScreen(incEdgeVertex.next, _tmp2);
			_vr.line2(_tmp1, _tmp2);
		}
	}
	
	public function drawIncidentVertex():Void
	{
		if (!_hasManifold()) return;
		
		var type1 = _contact.shape1.type;
		var type2 = _contact.shape2.type;
		
		_vr.clearStroke();
		_vr.style.fillColor = colorIncVert.getRGB();
		_vr.style.fillAlpha = colorIncVert.getA() / 0xff;
		
		_vr.fillStart();
		
		for (mp in _contact.manifold)
		{
			var incVert = mp.id.getIncVert();
			if (incVert == ContactID.NULL_FEATURE) continue;
			
			var incVertex;
			
			if (type1 == ShapeType.CIRCLE)
			{
				_contact.shape2.syncFeatures();
				incVertex = _contact.shape2.worldVertexChain.getAt(incVert);
			}
			else
			if (type2 == ShapeType.CIRCLE)
			{
				_contact.shape1.syncFeatures();
				incVertex = _contact.shape1.worldVertexChain.getAt(incVert);
			}
			else
			{
				var incShape;
				
				if (mp.id.getFlip() == 1)
					incShape = _contact.shape1;
				else
					incShape = _contact.shape2;
				
				incShape.syncFeatures();
				incVertex = incShape.worldVertexChain.getAt(incVert);
			}
			
			_camera.toScreen(incVertex, _tmp1);
			_vr.box2(_tmp1, incVertsSize);
		}
		
		_vr.fillEnd();
	}
	
	public function drawContactVector():Void
	{
		//draws radius vectors body->contact using contact points in object space
		//draw manifold in local coordinates of body1 and body2
		
		if (_contact.manifoldCount == 0) return;
		
		_vr.style.lineColor = colorContactVector.getRGB();
		_vr.style.lineAlpha = colorContactVector.getA() / 0xff;
		
		_vr.applyLineStyle();
		
		for (mp in _contact.manifold)
		{
			var s1 = _contact.shape1;
			var s2 = _contact.shape2;
			
			var b1 = s1.body;
			var b2 = s2.body;
			
			var c1 = b1.localCenter;
			var c2 = b2.localCenter;
			
			var T = s1.TBody;
			
			var lp1 = mp.lp1;
			var lp2 = mp.lp2;
			
			var r1x = T.mul22x(lp1.x - c1.x, lp1.y - c1.y);
			var r1y = T.mul22y(lp1.x - c1.x, lp1.y - c1.y);
			
			var T = s2.TBody;
			var r2x = T.mul22x(lp2.x - c2.x, lp2.y - c2.y);
			var r2y = T.mul22y(lp2.x - c2.x, lp2.y - c2.y);
			
			var c = b1.worldCenter;
			var x = _camera.toScreenX(c.x);
			var y = _camera.toScreenY(c.y);
			
			var dx = c1.x - lp1.x;
			var dy = c1.y - lp1.y;
			var length = Math.sqrt(dx * dx + dy * dy);
			
			_vr.arrowRay6(x, y, r1x, r1y, _camera.scale(length) - 2, 6);
			
			var c = b2.worldCenter;
			var x = _camera.toScreenX(c.x);
			var y = _camera.toScreenY(c.y);
			
			var dx = c2.x - lp2.x;
			var dy = c2.y - lp2.y;
			var length = Math.sqrt(dx * dx + dy * dy);
			
			_vr.arrowRay6(x, y, r2x, r2y, _camera.scale(length) - 2, 6);
		}
	}
	
	function _hasManifold():Bool
	{
		var m = _contact.manifold;
		
		if (m.pointCount == 0) return false;
		if (m.mp1.id == ContactID.NULL_VALUE) return false;
		if (m.mp2.id == ContactID.NULL_VALUE) return false;
		
		var type1 = _contact.shape1.type;
		var type2 = _contact.shape2.type;
		if (type1 == ShapeType.CIRCLE && type2 == ShapeType.CIRCLE) return false;
		
		return true;
	}
}