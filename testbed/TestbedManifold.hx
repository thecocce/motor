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
package testbed;

import de.polygonal.core.Root;
import de.polygonal.ds.mem.MemoryManager;
import de.polygonal.gl.Window;
import test.TestRunner;

class TestbedManifold
{
	public static function main():Void
	{
		MemoryManager.BLOCK_SIZE_BYTES = 128 << 10;
		MemoryManager.RESERVE_BYTES = 10 << 20;
		
		Window.initBackgroundColor = 0x222222;
		Root.init(onInit);
	}
	
	static var _app:TestbedManifold;
	static function onInit():Void 
	{
		_app = new TestbedManifold();
	}
	
	var _testRunner:TestRunner;
	
	public function new()
	{
		_testRunner = new TestRunner();
		Window.surface.addChild(_testRunner);
		
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
		
		_testRunner.run();
	}
}