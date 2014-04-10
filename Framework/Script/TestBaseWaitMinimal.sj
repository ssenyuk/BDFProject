//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Base.wait() method
 * @author Noel Rice
 * @company Falafel Software
 */

 // This example uses the Base.wait() method with the minimal
 // required OnWork event handler defined.
 
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    app.wait({
        OnWork: function(e){
            Log.Message("OnWork: " + e.Sender.Duration.toString()); 
            // do some work, then signal that no more time is needed
            e.Done = true; 
        }
    });
}