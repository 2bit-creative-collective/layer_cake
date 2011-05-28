package twobit.layercake.layer
{
    import twobit.layercake.layer.bitmapdatalayer.BitmapDataLayerSuite;
    import twobit.layercake.layer.perlinlayer.PerlinLayerSuite;
    /**
     * Copyright (C) 2011 David Wagner
     */
    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class LayerSuite
    {
        public var bitmapDataLayerSuite:BitmapDataLayerSuite;
        public var perlinLayerSuite:PerlinLayerSuite;
    }
}
