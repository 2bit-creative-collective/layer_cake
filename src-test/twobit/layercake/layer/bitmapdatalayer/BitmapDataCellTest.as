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
    }
}
