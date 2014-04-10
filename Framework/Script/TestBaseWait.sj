//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Base.wait() method
 * @author Noel Rice
 * @company Falafel Software
 */

 // This example uses the Base.wait() method with all three event handlers
 // overridden.  Note that OnTimedOut has a default defined in the wait() method.
 
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    app.wait({
        Description: "TestAppWait",
        OnWork: function(e){
            // do some work, then signal that no more time is needed
            e.Done = true; 
        },
        OnTimedOut: function(e){
            app.error("Overridden OnTimedOut"); 
        }
    });
    Log.Message("Done");
}