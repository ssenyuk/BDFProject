//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

function test() {
    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to Experiments | Manage Experiments tab. " +
            "The list must include an item with Name 'Experiment_001' and 'Experiment_002'",
        TestFunction: function (window) {
            var element = window
                .Finder
                .find({
                    NativeClrObject: "experimentsListView",
                    Depth: 50
                });

            if (element) {
                var listView = element.cast(WPFListView);
                listView.log();
                listView.click({Name: "Experiment_001"});
                listView.doubleClick({Name: "Experiment_002"}); 
            } else {
                this.error("experimentsListView not found.");
            }
        }
    }).run();
}