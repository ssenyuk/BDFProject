function error(message){
    var args = {}; 
    for(var index = 0; index < arguments.length; index++){
        if (index > 0){ 
            args[index - 1] =  arguments[index];   
        }
    }  
    
    args["length"] = arguments.length - 1; 
    Log.Message(aqString.Format(message, args)); 
}

function test(){
    error("test %s", "here");
}