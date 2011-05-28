package twobit.layercake.layer
{
    /**
     * Copyright (C) 2011 David Wagner
     */
    public interface Cell
    {
        function get layer():Layer;

        function get paletteIndex():int;
        function set paletteIndex(index:int):void;

        function get red():int;
        function set red(r:int):void;
        function get green():int;
        function set green(g:int):void;
        function get blue():int;
        function set blue(b:int):void;
        function setRedGreenBlue(r:int, g:int, b:int):void;
        function getRedGreenBlue():uint;

        function get up():Cell;
        function get down():Cell;
        function get left():Cell;
        function get right():Cell;
    }
}
