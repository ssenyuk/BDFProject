//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite.",
        TestFunction: function(window){
            var main = window.cast(StateWindow);
            
            // note: delays are used in this demonstration to allow you to see each operation, 
            // not to gaurantee state. These operations work with or without the delays.
            var delay = true; 
            
            main.activate(); 
            if (delay) aqUtils.Delay(2000, "Restore"); 
            main.restore();
            if (delay) aqUtils.Delay(2000, "Minimize"); 
            main.minimize();
            if (delay) aqUtils.Delay(2000, "Maximize"); 
            main.maximize();
            if (delay) aqUtils.Delay(2000, "Restore"); 
            main.restore();
            if (delay) aqUtils.Delay(2000,  "Position"); 
            main.position(Sys.Desktop.Width / 2, Sys.Desktop.Height / 2, 250, 250);
            if (delay) aqUtils.Delay(2000,  "new Position"); 
            main.position(0, 0, 50, 50);           
            if (delay) aqUtils.Delay(2000, "Close"); 
            main.close(); 
        }
    }).run(); 
}