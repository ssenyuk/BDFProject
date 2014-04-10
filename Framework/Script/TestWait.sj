//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Base.wait() method
 * @author Noel Rice
 * @company Falafel Software
 */
 
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite});

    // using the Wait object
    new Wait({
        App: app,
        Description: "TestWait",
        WaitFunction: function(e){
            Log.Message("inside the wait function");
            e.Done = true;  
        },
        OnCompleted: function(e){
            Log.Message("Wait completed: " + e.Sender.Description); 
        },
        OnTimedOut: function(e){
            e.Sender.App.error("timed out"); 
        } 
    }).process();    
    
    // using the wait() convenience method
    var base = new Base({
        App: app
    });    
    
    base.wait({
        Description: "TestWait",
        WaitFunction: function(e){
            Log.Message("inside the wait function");
            e.Done = true;  
        },
        OnCompleted: function(e){
            Log.Message("Wait completed: " + e.Sender.Description); 
        } 
    }); 
}
