//USEUNIT BD_Event
//USEUNIT BD_SettingError

/**
 * Contains object encapsulates a period of time
 * @author Noel Rice
 * @company Falafel Software
 */
 
var WaitStatusTypes = { 
    Processing: "Processing", 
    TimedOut: "Timed Out", 
    Completed: "Completed Normally" 
}; 
 
var Wait = Event.extend({
    FrameworkClassName: "Wait",
    ErrorType: WaitError,
    Interval: null, // interval in milliseconds   
    Duration: null, // remaining duration in milliseconds
    _Status: null,
    OnCompleted: null,
    OnTimedOut: null,
    Description: "[no description]",
    Logging: null,
    WaitFunction: null,
    Params: {},
    
    init: function(options){
        this._super(options);
        
        // assign events
        if (options.OnCompleted){
            this.OnCompleted = this.subscribe("OnCompleted", options.OnCompleted);
        } 
        if (options.OnTimedOut){
            this.OnTimedOut = this.subscribe("OnTimedOut", options.OnTimedOut);
        }
        
        // assign defaults
        if (!this.Duration){
            if (this.App){
                this.Duration = this.App
                    .Settings.Timeouts
                    .Settings.Long.Value;
            } else {
                this.Duration = 10000; 
            } 
        }
        
        if (!this.Interval){
            if (this.App){
                this.Interval = this.App
                    .Settings.Timeouts
                    .Settings.Interval.Value;
            } else {
                this.Interval = 100; 
            } 
        }   
        
        if (this.Interval > this.Duration){
            this.Interval = this.Duration; 
        }     
            
        if (this.App){
            this.Logging = this.App
                .Settings.Timeouts
                .Settings.Logging.Value;
        } else {
            this.Logging = false; 
        }        
    },
    
    process: function(){
        var subscriber, params;    
    
        this._startProcess(); 
        
        while (this._Status === WaitStatusTypes.Processing && this.Duration > 0){                         
            startTime = (new Date).getTime();
            subscriber = this.Subscriber ? this.Subscriber : this;
            params = { Done: false, Sender: this, Subscriber: subscriber, Params: this.Params}; 
            this.WaitFunction(params); 
            if (params.Done){
                this._Status = WaitStatusTypes.Completed; 
            } else {
                this._waitInterval();
            }              
            this.Duration = this._calculateDuration(startTime); 
        }
        
        // if we've run out of time, it's a timeout even if we tried to pause
        if (this.Duration <= 0){
            // zero out negative numbers
            this.Duration = 0;
            this._Status = WaitStatusTypes.TimedOut;         
        }
        
        // signal the consumer that the wait is over         
        if (this._Status === WaitStatusTypes.Completed){
            this._logStatus(StatusMessages.WaitEnd, this.Description, this.Duration);
            this.publish("OnCompleted", params);
        } else if (this._Status === WaitStatusTypes.TimedOut){
            this.publish("OnTimedOut");
        }
        if (this.Logging){
            Log.PopLogFolder();
        }    
        
        return this;         
    },
    
    _startProcess: function(){
        if (this.Logging){
            Log.AppendFolder(aqString.Format(StatusMessages.WaitStart, this.Description, this.Duration))
        }
        //this._logStatus(StatusMessages.WaitStart, this.Description, this.Duration); 
        this._Status = WaitStatusTypes.Processing;        
        if (this.Duration === undefined){
            this.Duration = 0; 
        }
    },

    _logStatus: function(message){
        if (this.Logging){
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
            Log.Message(formattedMessage);
        }   
    },
    
    _waitInterval: function(){
        // if we've run out of time, it's a timeout even if we tried to pause
        if (this.Duration <= 0){
            this.Duration = 0; 
            this._Status = WaitStatusTypes.TimedOut;         
        } else if (this._Status === WaitStatusTypes.processing){ 
            Delay(this.Interval);
        }
    },
      
    _calculateDuration: function(start){
        // calculate the elapsed milliseconds
        var elapsed = (new Date).getTime() - start;

        // decrement the duration milliseconds
        return this.Duration - elapsed;
    }    
}); 