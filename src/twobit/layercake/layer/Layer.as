package twobit.layercake.layer
{
    import flash.display.DisplayObject;
    /**
     * Copyright (C) 2011 David Wagner
     */
    public interface Layer
    {
        function get width():int;
        function get height():int;

        function create(width:int, height:int):void;
        function destroy():void;

        function generate(seed:int):void;

        function getCellAtXY(x:int, y:int):Cell;
        function get displyable():DisplayObject;
    }
}
