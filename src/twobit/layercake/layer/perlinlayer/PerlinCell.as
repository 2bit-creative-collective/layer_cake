package twobit.layercake.layer.perlinlayer
{
    import twobit.layercake.layer.Cell;
    import twobit.layercake.layer.Layer;

    import flash.display.BitmapData;

    /**
     * Copyright (C) 2011 David Wagner
     */
    public class PerlinCell implements Cell
    {
        public var _layer:PerlinLayer;
        public var _source:BitmapData;
        public var _x:int;
        public var _y:int;

        public function PerlinCell(layer:PerlinLayer, source:BitmapData, x:int, y:int):void
        {
            _layer = layer;
            _source = source;
            _x = x;
            _y = y;
        }

        public function setRedGreenBlue(r:int, g:int, b:int):void
        {
        }

        public function getRedGreenBlue():uint
        {
            // TODO: Auto-generated method stub
            return 0;
        }

        public function get layer():Layer
        {
            // TODO: Auto-generated method stub
            return null;
        }

        public function get paletteIndex():int
        {
            // TODO: Auto-generated method stub
            return 0;
        }

        public function get red():int
        {
            // TODO: Auto-generated method stub
            return 0;
        }

        public function get green():int
        {
            // TODO: Auto-generated method stub
            return 0;
        }

        public function get blue():int
        {
            // TODO: Auto-generated method stub
            return 0;
        }

        public function set paletteIndex(index:int):void
        {
        }

        public function set red(r:int):void
        {
        }

        public function set green(g:int):void
        {
        }

        public function set blue(b:int):void
        {
        }
    }
}
