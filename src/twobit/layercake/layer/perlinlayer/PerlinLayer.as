package twobit.layercake.layer.perlinlayer
{
    import twobit.layercake.layer.bitmapdatalayer.BitmapDataLayer;

    /**
     * Copyright (C) 2011 David Wagner
     */
    public class PerlinLayer
        extends BitmapDataLayer
    {
        public function generate(seed:int):void
        {
            _data.perlinNoise(width, height, 3, seed, false, false);
            invalidateCellCaches();
        }
    }
}
