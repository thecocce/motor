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
package;

import de.polygonal.core.Root;
import test.TestRunner;

class TestbedGeometry
{
	static var _app:TestbedGeometry;
	public static function main()
	{
		de.polygonal.core.Root.init(function() _app = new TestbedGeometry());
	}
	
	var _testRunner:TestRunner;
	
	public function new()
	{
		_testRunner = new TestRunner();
		
		flash.Lib.current.addChild(_testRunner);
		
		_testRunner.add(test.geom.TestGeomPointInsideAABB);
		_testRunner.add(test.geom.TestGeomPointInsideOBB);
		_testRunner.add(test.geom.TestGeomPointInsidePlane);
		_testRunner.add(test.geom.TestGeomPointInsidePoly);
		_testRunner.add(test.geom.TestGeomPointInsideSphere);
		_testRunner.add(test.geom.TestGeomPointInsideTriangle);
		
		_testRunner.add(test.geom.TestGeomClosestPointAABB);
		_testRunner.add(test.geom.TestGeomClosestPointLine);
		_testRunner.add(test.geom.TestGeomClosestPointOBB);
		_testRunner.add(test.geom.TestGeomClosestPointPlane);
		_testRunner.add(test.geom.TestGeomClosestPointPoly);
		_testRunner.add(test.geom.TestGeomClosestPointRay);
		_testRunner.add(test.geom.TestGeomClosestPointSegment);
		_testRunner.add(test.geom.TestGeomClosestPointSegmentSegment);
		_testRunner.add(test.geom.TestGeomClosestPointSphere);
		
		_testRunner.add(test.geom.TestGeomDistancePoint);
		_testRunner.add(test.geom.TestGeomDistancePointLine);
		_testRunner.add(test.geom.TestGeomDistancePointPlane);
		_testRunner.add(test.geom.TestGeomDistancePointSegment);
		_testRunner.add(test.geom.TestGeomDistancePointSphere);
		_testRunner.add(test.geom.TestGeomDistanceSegmentSegment);
		
		_testRunner.add(test.geom.TestGeomIntersectRayAABB);
		_testRunner.add(test.geom.TestGeomIntersectRayPlane);
		_testRunner.add(test.geom.TestGeomIntersectRayPoly);
		_testRunner.add(test.geom.TestGeomIntersectRaySphere);
		_testRunner.add(test.geom.TestGeomIntersectSegment);
		_testRunner.add(test.geom.TestGeomIntersectAABB);
		_testRunner.add(test.geom.TestGeomIntersectSphere);
		_testRunner.add(test.geom.TestGeomIntersectSegmentAABB);
		_testRunner.add(test.geom.TestGeomIntersectSegmentPlane);
		_testRunner.add(test.geom.TestGeomIntersectSegmentSphere);
		_testRunner.add(test.geom.TestGeomIntersectSphereAABB);
		_testRunner.add(test.geom.TestGeomIntersectSpherePlane);
		
		_testRunner.add(test.geom.TestGeomIntersectMovingSphereAABB);
		_testRunner.add(test.geom.TestGeomIntersectMovingSpherePlane);
		_testRunner.add(test.geom.TestGeomIntersectMovingSpherePoly);
		_testRunner.add(test.geom.TestGeomIntersectMovingSphereSphere);
		_testRunner.add(test.geom.TestGeomIntersectMovingSphereSegment);
		
		_testRunner.add(test.geom.TestGeomMinimumAreaRectangle);
		_testRunner.add(test.geom.TestGeomMinimumAreaCircle);
		_testRunner.add(test.geom.TestGeomConvexHull);
		
		_testRunner.add(test.geom.TestGeomDDAASegment);
		_testRunner.add(test.geom.TestGeomDDAARay);
		
		_testRunner.add(test.geom.TestGeomGPC);
		
		_testRunner.run();
	}
}