package twobit.layercake.layer.bitmapdatalayer
{
    import org.flexunit.asserts.assertEquals;

    import flash.display.BitmapData;
    /**
     * Copyright (C) 2011 David Wagner
     */
    public class BitmapDataCellTest
    {
        protected var data:BitmapData;

        [Before]
        public function createBitmap():void
        {
            data = new BitmapData(2, 2, false, 0x00000000);
            data.setPixel(0, 0, 0x112233);
            data.setPixel(1, 0, 0x556677);
            data.setPixel(0, 1, 0x99aabb);
            data.setPixel(1, 1, 0xddeeff);
        }

        [After]
        public function destroyBitmap():void
        {
            data.dispose();
            data = null;
        }

        [Test]
        public function checkInitialRGBA():void
        {
            var a:BitmapDataCell = new BitmapDataCell(null, data, 0, 0);
            var b:BitmapDataCell = new BitmapDataCell(null, data, 1, 0);
            var c:BitmapDataCell = new BitmapDataCell(null, data, 0, 1);
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            assertEquals("Checking 0, 0 RGB", 0x112233, a._cacheRGB);
            assertEquals("Checking 0, 0 getRedGreenBlue", 0x112233, a.getRedGreenBlue());

            assertEquals("Checking 1, 0 RGB", 0x556677, b._cacheRGB);
            assertEquals("Checking 1, 0 getRedGreenBlue", 0x556677, b.getRedGreenBlue());

            assertEquals("Checking 0, 1 RGB", 0x99aabb, c._cacheRGB);
            assertEquals("Checking 0, 1 getRedGreenBlue", 0x99aabb, c.getRedGreenBlue());

            assertEquals("Checking 1, 1 RGB", 0xddeeff, d._cacheRGB);
            assertEquals("Checking 1, 1 getRedGreenBlue", 0xddeeff, d.getRedGreenBlue());
        }

        [Test]
        public function setRedToZeroTest():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            d.red = 00;

            assertEquals("Checking 1, 1 RGB", 0x00eeff, d._cacheRGB);
            assertEquals("Checking 1, 1 getRedGreenBlue", 0x00eeff, d.getRedGreenBlue());
        }

        [Test]
        public function setRedToOverflowed55Test():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            d.red = 0x5555;

            assertEquals("Checking 1, 1 RGB", 0x55eeff, d._cacheRGB);
            assertEquals("Checking 1, 1 getRedGreenBlue", 0x55eeff, d.getRedGreenBlue());
        }

        [Test]
        public function setGreenToZeroTest():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            d.green = 00;

            assertEquals("Checking 1, 1 RGB", 0xdd00ff, d._cacheRGB);
            assertEquals("Checking 1, 1 getRedGreenBlue", 0x0dd00ff, d.getRedGreenBlue());
        }

        [Test]
        public function setGreenToOverflowedFFTest():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            d.green = 0x5555;

            assertEquals("Checking 1, 1 RGB", 0xdd55ff, d._cacheRGB);
            assertEquals("Checking 1, 1 getRedGreenBlue", 0xdd55ff, d.getRedGreenBlue());
        }

        [Test]
        public function setBlueToZeroTest():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            d.blue = 00;

            assertEquals("Checking 1, 1 RGB", 0xddee00, d._cacheRGB);
            assertEquals("Checking 1, 1 getRedGreenBlue", 0x0ddee00, d.getRedGreenBlue());
        }

        [Test]
        public function setBlueToOverflowedFFTest():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            d.blue = 0x5555;

            assertEquals("Checking 1, 1 RGB", 0xddee55, d._cacheRGB);
            assertEquals("Checking 1, 1 getRedGreenBlue", 0xddee55, d.getRedGreenBlue());
        }

        [Test]
        public function getRedTest():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            assertEquals("Checking 1, 1 red", 0xdd, d.red);
        }

        [Test]
        public function getGreenTest():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            assertEquals("Checking 1, 1 green", 0xee, d.green);
        }

        [Test]
        public function getBlueTest():void
        {
            var d:BitmapDataCell = new BitmapDataCell(null, data, 1, 1);

            assertEquals("Checking 1, 1 blue", 0xff, d.blue);
        }
    }
}
