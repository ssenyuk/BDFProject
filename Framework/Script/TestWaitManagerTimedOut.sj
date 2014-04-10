//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the WaitManager object 
 * @author Noel Rice
 * @company Falafel Software
 */

 // This example emulates long running work that exceeds the timeout duration.
 // The example generates an app timeout error.
 
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    var i = 0; 
    var waitManager = new WaitManager({App: app});
    waitManager.add({
        Duration: 1000,
        OnWork: function(e){
            // log the number of milliseconds left
            Log.Message("OnWork: " + i.toString() + " -- " + e.Sender.Duration.toString());
            
            // simulate some work 
            Delay(200, "Delay number ");
            
            i = i + 1;  
            
            if (i > 50){
                e.Done = true; 
            }
        },
        OnTimedOut: function(e){
            app.error("Timed out"); 
        },
        OnCompleted: function(e){
            Log.Message("OnCompleted"); 
        }
    });
}