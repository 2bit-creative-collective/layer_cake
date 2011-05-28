package twobit.layercake
{
    import twobit.layercake.layer.Layer;
    import twobit.layercake.layer.perlinlayer.PerlinLayer;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageQuality;
    import flash.events.Event;

    /**
     * Copyright (C) 2011 David Wagner
     */
    [SWF(backgroundColor="#000000", frameRate="31", width="512", height="512")]
    public class LayerCakeApp
        extends Sprite
    {
        protected var layer:Layer;

        public function LayerCakeApp()
        {
            addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        }

        protected function addedToStage(event:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, addedToStage);

            stage.align = StageAlign.TOP_LEFT;
            stage.quality = StageQuality.LOW;

            startup();
        }

        protected function startup():void
        {
            createLayer();
            scaleX = 2;
            scaleY = 2;
        }

        protected function createLayer():void
        {
            layer = new PerlinLayer();
            layer.create(256, 256);
            layer.generate(150776);

            addChild(layer.displyable);
        }
    }
}
