//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the WaitManager object 
 * @author Noel Rice
 * @company Falafel Software
 */
 
 // This example runs through tasks in a cascade, where
 // Task 1 waits to complete and then calls Task 2. If 
 // Task 2 completes, Task3 is is called. 
 // If an error were to occur (by changing the code in the test), 
 // the next task in line will never be called.
 // Duration and intervals are different for each wait.

function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
  
    var waitManager = new WaitManager({App: app});
    TaskOne(app, waitManager); 
}

function TaskOne(app, waitManager){
   waitManager.add({
        Duration: 5000,
        Interval: 2000,
        Description: "Task 1",
        OnWork: function(e){
            Log.Message("OnWork Duration:" + e.Sender.Duration.toString());
            if (e.Sender.Duration < 2000){
                e.Done = true; 
            }
        },
        OnTimedOut: function(e){
            app.error("Timed out during " + e.Sender.Description); 
        }
    });
    Log.Message("Completed Task 1");
    TaskTwo(app, waitManager); 
}

function TaskTwo(app, waitManager){
   waitManager.add({
        Duration: 500,
        Description: "Task 2",
        OnWork: function(e){
            Log.Message("OnWork Duration:" + e.Sender.Duration.toString());
            if (e.Sender.Duration < 100){
                e.Done = true; 
            }
        },
        OnTimedOut: function(e){
            app.error("Timed out during " + e.Sender.Description); 
        }
    });
    Log.Message("Completed Task 2");
    TaskThree(app, waitManager);     
}

function TaskThree(app, waitManager){
   waitManager.add({
        Duration: 10000,
        Description: "Task 3",
        OnWork: function(e){
            Log.Message("OnWork Duration:" + e.Sender.Duration.toString());
            if (e.Sender.Duration < 1000){
                e.Done = true; 
            }
        },
        OnTimedOut: function(e){
            app.error("Timed out during " + e.Sender.Description); 
        }
    });
    Log.Message("Completed Task 3");
}