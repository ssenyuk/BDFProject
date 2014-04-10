//USEUNIT BD_App
//USEUNIT BD_FrameworkMessageIncludes

function test(){
    var app =    new App({TestedApp: TestedApps.FACSuite});
    app.run(); 
    var obj = app;
        
    while (obj){

        if (obj != undefined){
            Log.AppendFolder(aqObject.IsSupported(obj, "FrameworkClassName") ? obj.FrameworkClassName : "Class"); 
            for(var prop in obj){
                if (obj.hasOwnProperty(prop) && aqString.SubString(prop, 0, 1) != "_") {

                    Log.Message(prop); 
                }
            }
            Log.PopLogFolder(); 
        }
        obj = obj._ancestor;
    }
}