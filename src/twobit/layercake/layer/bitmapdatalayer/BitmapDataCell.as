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

        public var _cacheR:uint;
        public var _cacheG:uint;
        public var _cacheB:uint;
        public var _cacheRGB:uint;

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
            _cacheRGB = _source.getPixel(_x, _y);
            _cacheR = (_cacheRGB >> 16) & 0xff;
            _cacheG = (_cacheRGB >>  8) & 0xff;
            _cacheB = (_cacheRGB >>  0) & 0xff;
        }

        public function setRedGreenBlue(r:uint, g:uint, b:uint):void
        {
            _cacheR = r & 0xff;
            _cacheG = g & 0xff;
            _cacheB = b & 0xff;

            _cacheRGB = _cacheR << 16 | _cacheG << 8 | _cacheB;

            _source.setPixel(_x, _y, _cacheRGB);
        }

        public function getRedGreenBlue():uint
        {
            return _cacheRGB;
        }

        public function get layer():Layer
        {
            return _layer;
        }

        public function get paletteIndex():int
        {
            throw new Error("Not actually sure how to do this yet");
        }

        public function get red():uint
        {
            return _cacheR;
        }

        public function get green():uint
        {
            return _cacheG;
        }

        public function get blue():uint
        {
            return _cacheB;
        }

        public function set paletteIndex(index:int):void
        {
            throw new Error("Not actually sure how to do this yet");
        }

        public function set red(r:uint):void
        {
            _cacheR = r & 0xff;
            _cacheRGB = (_cacheRGB & 0xff00ffff) |  _cacheR << 16;
            _source.setPixel(_x, _y, _cacheRGB);
        }

        public function set green(g:uint):void
        {
            _cacheG = g & 0xff;
            _cacheRGB = (_cacheRGB & 0xffff00ff) |  _cacheG << 8;
            _source.setPixel(_x, _y, _cacheRGB);
        }

        public function set blue(b:uint):void
        {
            _cacheB = b & 0xff;
            _cacheRGB = (_cacheRGB & 0xffffff00) |  _cacheB;
            _source.setPixel(_x, _y, _cacheRGB);
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
