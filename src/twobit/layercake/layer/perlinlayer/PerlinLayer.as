package twobit.layercake.layer.perlinlayer
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
    public class PerlinLayer
        implements Layer
    {
        public var _data:BitmapData;
        public var _displayable:Bitmap;
        public var _cells:Vector.<PerlinCell>;

        public function PerlinLayer():void
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

            _cells = new Vector.<PerlinCell>(width*height, true);
            var x:int = 0;
            var y:int = 0;
            for(var i:int; i < _cells.length; i++)
            {
                _cells[i] = new PerlinCell(this, _data, x, y);
                x++;
                if(x >= width)
                {
                    x = 0;
                    y++;
                }
            }
        }

        public function destroy():void
        {
            _displayable.bitmapData = null;
            _data.dispose();
            _data = null;
        }

        public function generate(seed:int):void
        {
            _data.perlinNoise(width, height, 3, seed, false, false);
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
