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
import de.polygonal.ds.mem.MemoryManager;
import test.TestRunner;

class Testbed
{
	static var _app:Testbed;
	public static function main()
	{
		MemoryManager.BLOCK_SIZE_BYTES = 128 << 10;
		MemoryManager.RESERVE_BYTES = 10 << 20;
		de.polygonal.core.Root.init();
		new Testbed();
	}
	
	var _testRunner:TestRunner;
	
	public function new()
	{
		_testRunner = new TestRunner();
		
		flash.Lib.current.addChild(_testRunner);
		
		/** geom */
		
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
		
		/** manifold */
		
		_testRunner.add(test.manifold.TestManifoldSingleInfEdgeCircle);
		_testRunner.add(test.manifold.TestManifoldDoubleInfEdgeCircle);
		_testRunner.add(test.manifold.TestManifoldSingleEdgeCircle);
		_testRunner.add(test.manifold.TestManifoldDoubleEdgeCircle);
		
		_testRunner.add(test.manifold.TestManifoldSingleInfEdgeAABB);
		_testRunner.add(test.manifold.TestManifoldDoubleInfEdgeAABB);
		_testRunner.add(test.manifold.TestManifoldSingleEdgeAABB);
		_testRunner.add(test.manifold.TestManifoldDoubleEdgeAABB);
		
		_testRunner.add(test.manifold.TestManifoldSingleInfEdgeOBB);
		_testRunner.add(test.manifold.TestManifoldDoubleInfEdgeOBB);
		_testRunner.add(test.manifold.TestManifoldSingleEdgeOBB);
		_testRunner.add(test.manifold.TestManifoldDoubleEdgeOBB);
		
		_testRunner.add(test.manifold.TestManifoldSingleInfEdgePoly);
		_testRunner.add(test.manifold.TestManifoldDoubleInfEdgePoly);
		_testRunner.add(test.manifold.TestManifoldSingleEdgePoly);
		_testRunner.add(test.manifold.TestManifoldDoubleEdgePoly);
		
		_testRunner.add(test.manifold.TestManifoldCircle);
		_testRunner.add(test.manifold.TestManifoldAABB);
		_testRunner.add(test.manifold.TestManifoldAABBCircle);
		_testRunner.add(test.manifold.TestManifoldAABBOBB);
		_testRunner.add(test.manifold.TestManifoldAABBPoly);
		_testRunner.add(test.manifold.TestManifoldAABBTriangle);
		_testRunner.add(test.manifold.TestManifoldOBB);
		_testRunner.add(test.manifold.TestManifoldOBBCircle);
		_testRunner.add(test.manifold.TestManifoldOBBPoly);
		_testRunner.add(test.manifold.TestManifoldPoly);
		_testRunner.add(test.manifold.TestManifoldPolyCircle);
		_testRunner.add(test.manifold.TestManifoldTriangle);
		
		_testRunner.add(test.manifold.misc.TestManifoldPolyMPR);
		_testRunner.add(test.manifold.misc.TestManifoldVRM);
		_testRunner.add(test.manifold.misc.TestSupportMapping);
		_testRunner.add(test.manifold.misc.TestClip);
		
		/** world */
		
		_testRunner.add(test.world.contact.TestContactAABB1);
		_testRunner.add(test.world.contact.TestContactAABB2);
		_testRunner.add(test.world.contact.TestContactAABB3);
		_testRunner.add(test.world.contact.TestContactAABBCircle);
		_testRunner.add(test.world.contact.TestContactCircle);
		_testRunner.add(test.world.contact.TestContactOBB1); 
		_testRunner.add(test.world.contact.TestContactOBB2);
		_testRunner.add(test.world.contact.TestContactOBB3);
		_testRunner.add(test.world.contact.TestContactOBB4);
		_testRunner.add(test.world.contact.TestContactOBBCircle);
		_testRunner.add(test.world.contact.TestContactPoly);
		_testRunner.add(test.world.contact.TestContactCompound);
		_testRunner.add(test.world.contact.TestContactPolyCircle); 
		_testRunner.add(test.world.contact.TestContactTriangle);
		
		_testRunner.add(test.world.joint.TestJointGear);
		_testRunner.add(test.world.joint.TestJointMouse);
		_testRunner.add(test.world.joint.TestJointLine);
		_testRunner.add(test.world.joint.TestJointPrismatic);
		_testRunner.add(test.world.joint.TestJointRevolute);
		_testRunner.add(test.world.joint.TestJointPulley);
		_testRunner.add(test.world.joint.TestJointDistance);
		
		_testRunner.run();
	}
}