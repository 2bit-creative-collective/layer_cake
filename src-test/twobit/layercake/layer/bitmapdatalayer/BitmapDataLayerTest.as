package twobit.layercake.layer.bitmapdatalayer
{
    import twobit.layercake.layer.Cell;

    import org.flexunit.asserts.assertNull;
    import org.flexunit.asserts.assertStrictlyEquals;
    /**
     * Copyright (C) 2011 David Wagner
     */
    public class BitmapDataLayerTest
    {
        [Test]
        public function testConnections1by1():void
        {
            var l:BitmapDataLayer = new BitmapDataLayer();
            l.create(1, 1);

            var a:Cell = l.getCellAtXY(0, 0);

            assertNull("Checking up is null", a.up);
            assertNull("Checking down is null", a.down);
            assertNull("Checking left is null", a.left);
            assertNull("Checking right is null", a.right);
        }

        [Test]
        public function testConnections2by1():void
        {
            var l:BitmapDataLayer = new BitmapDataLayer();
            l.create(2, 1);

            var a:Cell = l.getCellAtXY(0, 0);
            var b:Cell = l.getCellAtXY(1, 0);

            assertNull("Checking a.up is null", a.up);
            assertNull("Checking a.down is null", a.down);
            assertNull("Checking a.left is null", a.left);
            assertStrictlyEquals("Checking a.right is b", b, a.right);

            assertNull("Checking b.up is null", b.up);
            assertNull("Checking b.down is null", b.down);
            assertStrictlyEquals("Checking b.left is a", a, b.left);
            assertNull("Checking b.right is null", b.right);
        }

        [Test]
        public function testConnections2by2():void
        {
            var l:BitmapDataLayer = new BitmapDataLayer();
            l.create(2, 2);

            var a:Cell = l.getCellAtXY(0, 0);
            var b:Cell = l.getCellAtXY(1, 0);
            var c:Cell = l.getCellAtXY(0, 1);
            var d:Cell = l.getCellAtXY(1, 1);

            assertNull("Checking a.up is null", a.up);
            assertStrictlyEquals("Checking a.down is c", c, a.down);
            assertNull("Checking a.left is null", a.left);
            assertStrictlyEquals("Checking a.right is b", b, a.right);

            assertNull("Checking b.up is null", b.up);
            assertStrictlyEquals("Checking b.down is d", d, b.down);
            assertStrictlyEquals("Checking b.left is a", a, b.left);
            assertNull("Checking b.right is null", b.right);

            assertStrictlyEquals("Checking c.up is a", a, c.up);
            assertNull("Checking c.down is null", c.down);
            assertNull("Checking c.left is null", c.left);
            assertStrictlyEquals("Checking c.right is d", d, c.right);

            assertStrictlyEquals("Checking d.up is b", b, d.up);
            assertNull("Checking d.down is null", d.down);
            assertStrictlyEquals("Checking d.left is c", c, d.left);
            assertNull("Checking d.right is null", d.right);
        }

        [Test]
        public function testConnections3by3():void
        {
            var l:BitmapDataLayer = new BitmapDataLayer();
            l.create(3, 3);

            var a:Cell = l.getCellAtXY(0, 0);
            var b:Cell = l.getCellAtXY(1, 0);
            var c:Cell = l.getCellAtXY(2, 0);

            var d:Cell = l.getCellAtXY(0, 1);
            var e:Cell = l.getCellAtXY(1, 1);
            var f:Cell = l.getCellAtXY(2, 1);

            var g:Cell = l.getCellAtXY(0, 2);
            var h:Cell = l.getCellAtXY(1, 2);
            var i:Cell = l.getCellAtXY(2, 2);

            // Row 0
            assertNull("Checking a.up is null", a.up);
            assertStrictlyEquals("Checking a.down is d", d, a.down);
            assertNull("Checking a.left is null", a.left);
            assertStrictlyEquals("Checking a.right is b", b, a.right);

            assertNull("Checking b.up is null", b.up);
            assertStrictlyEquals("Checking b.down is e", e, b.down);
            assertStrictlyEquals("Checking b.left is a", a, b.left);
            assertStrictlyEquals("Checking b.right is c", c, b.right);

            assertNull("Checking c.up is null", c.up);
            assertStrictlyEquals("Checking c.down is f", f, c.down);
            assertStrictlyEquals("Checking c.left is b", b, c.left);
            assertNull("Checking c.right is null", c.right);

            // Row 1
            assertStrictlyEquals("Checking d.up is a", a, d.up);
            assertStrictlyEquals("Checking d.down is g", g, d.down);
            assertNull("Checking d.left is null", d.left);
            assertStrictlyEquals("Checking d.right is e", e, d.right);

            assertStrictlyEquals("Checking e.up is b", b, e.up);
            assertStrictlyEquals("Checking e.down is h", h, e.down);
            assertStrictlyEquals("Checking e.left is d", d, e.left);
            assertStrictlyEquals("Checking e.right is f", f, e.right);

            assertStrictlyEquals("Checking f.up is c", c, f.up);
            assertStrictlyEquals("Checking f.down is i", i, f.down);
            assertStrictlyEquals("Checking f.left is e", e, f.left);
            assertNull("Checking f.right is null", f.right);

            // Row 2
            assertStrictlyEquals("Checking g.up is d", d, g.up);
            assertNull("Checking g.down is null", g.down);
            assertNull("Checking g.left is null", g.left);
            assertStrictlyEquals("Checking g.right is h", h, g.right);

            assertStrictlyEquals("Checking h.up is e", e, h.up);
            assertNull("Checking h.down is null", h.down);
            assertStrictlyEquals("Checking h.left is g", g, h.left);
            assertStrictlyEquals("Checking h.right is i", i, h.right);

            assertStrictlyEquals("Checking j.up is f", f, i.up);
            assertNull("Checking i.down is null", i.down);
            assertStrictlyEquals("Checking i.left is h", h, i.left);
            assertNull("Checking i.right is null", i.right);
        }
    }
}
