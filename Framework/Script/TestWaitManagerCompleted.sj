//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the WaitManager object 
 * @author Noel Rice
 * @company Falafel Software
 */

 // This example sets status to complete the first time
 // OnWork fires which triggers the OnCompleted event.
 
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    var waitManager = new WaitManager({App: app});
    waitManager.add({
        OnWork: function(e){
            Log.Message("OnWork: " + e.Sender.Duration.toString()); 
            // do some work, then signal that no more time is needed
            e.Done = true; 
        },
        OnTimedOut: function(e){
            app.error("Timed out"); 
        },
        OnCompleted: function(e){
            Log.Message("OnCompleted"); 
        }
    });
}