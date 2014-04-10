//USEUNIT BD_Class
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkErrorIncludes

/**
 * Contains base object responsible for logging and casting to different types
 * @author Noel Rice
 * @company Falafel Software
 */

// an object that can log its own properties
var Base = Class.extend({
    App: null,
    FrameworkClassName: "Base",
    // overridden in base classes to use the error() method.
    ErrorType: BaseError,    
    Options: null,

    init: function (options) {
        if (options) {
            this.Options = options;
            // assign same-named options to properties
            this.assignOptions(options); 
        }
    },
    
    // assign same-named options to properties
    assignOptions: function(options){
        if (options){ 
            for(var option in options){
                this[option] = options[option]; 
            }
        }
    },
    
    cast: function (elementType, options) {
        if (options){ // override options if available
            for(var option in options){
                this.Options[option] = options[option]; 
            }
        }
        return new elementType(this.Options); 
    },
    
    validateOptions: function(options, expected, methodName){
        for(var prop in expected){
            var expectedPropertyName = expected[prop]; 
            if (!options || !options[expectedPropertyName]){
                this.error(ErrorMessages.OptionExpectedError, expectedPropertyName, methodName); 
                return false; 
            }
        }
        return true; 
    },
    
    validatePropertyAssignments: function(expected, methodName){
        for(var prop in expected){
            var expectedPropertyName = expected[prop]; 
            if (!this[expectedPropertyName]){
                //PropertyNotAssigned: 'The %s property %s is not assigned in method %s'
                this.error(ErrorMessages.PropertyNotAssigned, this.FrameworkClassName, expectedPropertyName, methodName); 
                return false; 
            }
        }
        return true;        
    },
    
    validateInitOptions: function(expected){
        return this.validateOptions(this.Options, expected, "init");    
    },
    
    error: function(message){
        var args = {};
        // copy additional parameters to args object
        // leaving out the initial "message" parameter 
        for(var index = 0; index < arguments.length; index++){
            if (index > 0){ 
                args[index - 1] =  arguments[index];   
            }
        }  
        
        args["length"] = arguments.length - 1;
        
        var formattedMessage = aqString.Format(message, args); 
        new this.ErrorType({
            App: this.App,
            Message: formattedMessage
        });
    },
    
    wait: function(options){           
        if (options && !options.Subscriber) { 
            options.Subscriber = this; 
        }

        var app = this.App;
        
        if (options && options.App){
            app = options.App;    
        }        

        if (app){
            new app.WaitType(options).process();       
        } else {
            this.error("Attempt to call wait() without App assigned"); 
        }       
    },
    
    log: function () {
        this.logStart();
        try{ 
            this.logContents();
        } finally {
            this.logEnd();
        }
        return this;
    },
    
    logStart: function(){
        var folderName = ""; 
        if (this.Name){
            folderName = this.Name; 
        } 
        if (!folderName){
            folderName = this.Text; 
        }
        if (!folderName && this.ClrClassName){
            folderName = this.ClrClassName; 
        }
        Log.AppendFolder(folderName + " (" + this.FrameworkClassName + ")");
    },
    
    logContents: function(){
        var isPrivate = false; 
        
        for (var prop in this) {
            isPrivate = aqString.SubString(prop, 0, 1) == "_";
            if ((typeof this[prop] != "function") 
             && (typeof this[prop] != "object")
             && (!isPrivate)) {
                Log.Message(prop + ": " + this[prop])
            }
        }
    },
    /* @description This function is going to logging message.
    * @param {string} [<message>] This parameter will be displayed in the log
    */
    logMessage: function(message){
     if (typeof message !== "string"){
            var str = "";
            for(var i in message){
                str = aqString.Format("%s %s", str, message[i]);
            }
            message = str;
        }     
        Log.Message(message);    
    },
    
    /* @description This function is going to logging warning.
    * @param {string} [<message>] This parameter will be displayed in the log as warning
    */
    logWarning: function(message){
      Log.Warning(message);  
    },
    
    /* @description This function is going to logging status case.
     */
    logStatus: function (options){
      var formattedMessage = "Step ";
      for(var option in options){
          formattedMessage += aqString.Format("%s ", options[option]); 
      }     
       this.logMessage(formattedMessage);
    },
    
    logPicture: function(){
        var picture = this.TCObject.Picture(); 
        Log.Picture(picture, "Onscreen image");   
    },
    
    logEnd: function(){
        Log.PopLogFolder();    
    }
});