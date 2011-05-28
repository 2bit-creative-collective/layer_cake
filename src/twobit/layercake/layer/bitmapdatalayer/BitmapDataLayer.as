package twobit.layercake.layer.bitmapdatalayer
{
    import twobit.layercake.layer.Cell;
    import twobit.layercake.layer.Layer;

    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.PixelSnapping;

    /**
     * Copyright (C) 2011 David Wagner
     */
    public class BitmapDataLayer
        implements Layer
    {
        public var _data:BitmapData;
        public var _displayable:Bitmap;
        public var _cells:Vector.<BitmapDataCell>;

        public function BitmapDataLayer():void
        {
            _displayable = new Bitmap(null, PixelSnapping.ALWAYS, false);
        }

        public function get width():int
        {
            if(_data != null) return _data.width;

            return 0;
        }

        public function get height():int
        {
            if(_data != null) return _data.height;

            return 0;
        }

        public function create(width:int, height:int):void
        {
            _data = new BitmapData(width, height, false, 0x000000);
            _displayable.bitmapData = _data;

            createCells();
            connectCells();
        }

        protected function createCells():void
        {
            _cells = new Vector.<BitmapDataCell>(width*height, true);
            var x:int = 0;
            var y:int = 0;
            for(var i:int; i < _cells.length; i++)
            {
                _cells[i] = new BitmapDataCell(this, _data, x, y);
                x++;
                if(x >= width)
                {
                    x = 0;
                    y++;
                }
            }
        }

        protected function connectCells():void
        {
            for(var i:int; i < _cells.length; i++)
            {
                var cell:BitmapDataCell = _cells[i];

                if( i >= width) cell._u = _cells[i-width];
                if( i < (_cells.length - width)) cell._d = _cells[i+width];
                if( i % width != 0) cell._l = _cells[i-1];
                if( (i+1) % width != 0) cell._r = _cells[i+1];
            }
        }

        protected function invalidateCellCaches():void
        {
            for(var i:int; i < _cells.length; i++)
            {
                _cells[i].invalidateCache();
            }
        }

        public function destroy():void
        {
            _displayable.bitmapData = null;
            _data.dispose();
            _data = null;
        }

        public function getCellAtXY(x:int, y:int):Cell
        {
            return _cells[width * y + x];
        }

        public function get displyable():DisplayObject
        {
            return _displayable;
        }
    }
}
