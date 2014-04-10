//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Base.wait() method
 * @author Noel Rice
 * @company Falafel Software
 */

 // This example uses the Base.wait() method with all three event handlers
 // defined. This example triggers the OnTimedOut event handler.
 
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    app.wait({
        OnWork: function(e){
            // e.Done is never assigned, so the wait times out
        },
        OnTimedOut: function(e){
            app.error("Timed out"); 
        }
    });
}