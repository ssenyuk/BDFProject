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
    var task1 = new Task1({App: app}); 
    task1.run(); 
}

var Task1 = Base.extend({
    FrameworkClassName: "Task1",
    run: function(){
        new Wait({
            Description: "Task1",
            WaitFunction: function(e){
                Log.Message("processing task 1");
                Log.Message("calling Task2");
                new Task2().run(); 
                Log.Message("after running Task2");
                
                e.Done = true;  
            },
            OnCompleted: function(e){
                Log.Message("Wait completed: " + e.Sender.Description); 
            } 
        }).process();        
    }
}); 

var Task2 = Base.extend({
    FrameworkClassName: "Task2",
    run: function(){
        new Wait({
            Description: "Task2",
            WaitFunction: function(e){
                Log.Message("processing task 2");
                e.Done = true;  
            },
            OnCompleted: function(e){
                Log.Message("Wait completed: " + e.Sender.Description); 
            } 
        }).process();        
    }
}); 