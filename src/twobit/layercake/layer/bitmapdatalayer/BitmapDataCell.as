package twobit.layercake.layer.bitmapdatalayer
{
    import twobit.layercake.layer.Cell;
    import twobit.layercake.layer.Layer;

    import flash.display.BitmapData;

    /**
     * Copyright (C) 2011 David Wagner
     */
    public class BitmapDataCell
        implements Cell
    {
        public var _layer:BitmapDataLayer;
        public var _source:BitmapData;
        public var _x:int;
        public var _y:int;

        public var _u:BitmapDataCell;
        public var _d:BitmapDataCell;
        public var _l:BitmapDataCell;
        public var _r:BitmapDataCell;

        public var _cacheR:int;
        public var _cacheG:int;
        public var _cacheB:int;
        public var _cacheA:int; // Stored but not used yet. Dunno if we want to.
        public var _cacheRGBA:uint;

        public function BitmapDataCell(layer:BitmapDataLayer, source:BitmapData, x:int, y:int):void
        {
            _layer = layer;
            _source = source;
            _x = x;
            _y = y;

            invalidateCache();
        }

        public function invalidateCache():void
        {
            _cacheRGBA = _source.getPixel32(_x, _y);
            _cacheR = (_cacheRGBA >> 16) & 0xff;
            _cacheG = (_cacheRGBA >>  8) & 0xff;
            _cacheB = (_cacheRGBA >>  0) & 0xff;
            _cacheA = (_cacheRGBA >> 24) & 0xff;
        }

        public function setRedGreenBlue(r:int, g:int, b:int):void
        {
            _cacheR = r & 0xff;
            _cacheG = g & 0xff;
            _cacheB = b & 0xff;

            _cacheRGBA = _cacheA << 24 | _cacheR << 16 | _cacheG << 8 | _cacheB;

            _source.setPixel32(_x, _y, _cacheRGBA);
        }

        public function getRedGreenBlue():uint
        {
            return _cacheRGBA & 0x00ffffff;
        }

        public function get layer():Layer
        {
            return _layer;
        }

        public function get paletteIndex():int
        {
            throw new Error("Not actually sure how to do this yet");
        }

        public function get red():int
        {
            return _cacheR;
        }

        public function get green():int
        {
            return _cacheG;
        }

        public function get blue():int
        {
            return _cacheB;
        }

        public function set paletteIndex(index:int):void
        {
            throw new Error("Not actually sure how to do this yet");
        }

        public function set red(r:int):void
        {
            _cacheR = r & 0xff;
            _cacheRGBA = (_cacheRGBA & 0xff00ffff) |  _cacheR << 16;
            _source.setPixel32(_x, _y, _cacheRGBA);
        }

        public function set green(g:int):void
        {
            _cacheG = g & 0xff;
            _cacheRGBA = (_cacheRGBA & 0xffff00ff) |  _cacheG << 8;
            _source.setPixel32(_x, _y, _cacheRGBA);
        }

        public function set blue(b:int):void
        {
            _cacheB = b & 0xff;
            _cacheRGBA = (_cacheRGBA & 0xffffff00) |  _cacheB;
            _source.setPixel32(_x, _y, _cacheRGBA);
        }

        public function get up():Cell
        {
            return _u;
        }

        public function get down():Cell
        {
            return _d;
        }

        public function get left():Cell
        {
            return _l;
        }

        public function get right():Cell
        {
            return _r;
        }
    }
}
