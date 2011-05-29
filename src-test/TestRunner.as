package
{
    import noiseandheat.flexunit.visuallistener.VisualListener;

    import org.flexunit.runner.FlexUnitCore;
    import org.fluint.uiImpersonation.VisualTestEnvironmentBuilder;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;

    /**
     * Copyright (C) 2011 David Wagner
     */
    [SWF(backgroundColor="#000000", frameRate="120", width="800", height="600")]
    public class TestRunner
        extends Sprite
    {
        private var core : FlexUnitCore;
        private var listener:VisualListener;

        public function TestRunner() {

            // Launch your unit tests by right clicking within this class and select: Run As > FDT SWF Application

            //Instantiate the core.
            core = new FlexUnitCore();
            //This registers the stage with the VisualTestEnvironmentBuilder, which allows you
            //to use the UIImpersonator classes to add to the display list and remove from within your
            //tests. With Flex, this is done for you, but in AS projects it needs to be handled manually.
            VisualTestEnvironmentBuilder.getInstance(this);

            //Add any listeners. In this case, the TraceListener has been added to display results.
            listener = new VisualListener();
            addChild(listener);
            core.addListener(listener);

            //There should be only 1 call to run().
            //You can pass a comma separated list (or an array) of tests or suites.
            //You can also pass a Request Object, which allows you to sort, filter and subselect.
            //var request:Request = Request.methods( someClass, ["method1", "method2", "method3"] ).sortWith( someSorter ).filterWith( someFilter );
            //core.run( request );
            core.run(MainSuite);

            addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        }

        protected function addedToStage(event:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, addedToStage);

            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
        }
    }
}
