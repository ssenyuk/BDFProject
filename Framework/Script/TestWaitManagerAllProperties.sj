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
        // total wait is five seconds
        Duration: 5000,
        // one second delay between firing OnWork events
        Interval: 1000, 
        // text description associated with the wait period
        Description: "This is a description of the task", 
        OnWork: function(e){
            Log.Message("OnWork: " + e.Sender.Duration.toString()); 
            // simulate being done with work when we're just about out of time
            if (e.Sender.Duration < 1000){
                e.Done = true; 
            }
        },
        OnTimedOut: function(e){
            app.error("Timed out"); 
        }
    });
    
    Log.Message("Done"); 
}