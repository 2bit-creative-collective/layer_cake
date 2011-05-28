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

        function get red():uint;
        function set red(r:uint):void;
        function get green():uint;
        function set green(g:uint):void;
        function get blue():uint;
        function set blue(b:uint):void;
        function setRedGreenBlue(r:uint, g:uint, b:uint):void;
        function getRedGreenBlue():uint;

        function get up():Cell;
        function get down():Cell;
        function get left():Cell;
        function get right():Cell;
    }
}
