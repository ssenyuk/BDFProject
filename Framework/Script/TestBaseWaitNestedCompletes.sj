//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Base.wait() method
 * @author Noel Rice
 * @company Falafel Software
 */

 // This example demonstrates the behavior of waits
 // when there are several uncompleted wait calls in a row. 
 
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    task1(app);
}

function task1(app){
    app.wait({
        Description: "Task1",
        OnWork: function(e){
            // do some work, then signal that no more time is needed
            Delay(1000); 
            e.Done = true; 
        },
        OnCompleted: function(e){
            Log.Message("Completed task1"); 
            task2(app);  
        }
    });
}

function task2(app){
    app.wait({
        Description: "Task2",
        OnWork: function(e){
            // do some work, then signal that no more time is needed
            Delay(1000); 
            e.Done = true; 
        },
        OnCompleted: function(e){
            Log.Message("Completed task2"); 
            task3(app);  
        }
    });
}


function task3(app){
    app.wait({
        Description: "Task3",
        OnWork: function(e){
            // do some work, then signal that no more time is needed
            Delay(1000); 
            e.Done = true; 
        },
        OnCompleted: function(e){
            Log.Message("Completed task3"); 
        }
    });
}