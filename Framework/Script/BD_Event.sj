//USEUNIT BD_Base
//USEUNIT BD_EventError
//USEUNIT BD_ErrorMessages

/**
 * Contains base object to enable eventing 
 * @author Noel Rice
 * @company Falafel Software
 */

// vend a fresh event object that's not available to 
// enclosing objects. Fixes issue where all events 
// available to all enclosing objects and cause collisions 
function EventClosure(){
    return function(){
        return {};  
    }    
}

// Object that implements custom events
var Event = Base.extend({
    FrameworkClassName: "Event",
    ErrorType: EventError,
    Events: null,
    Subscriber: null,
    
    init: function(options){
        this._super(options); 
        this.Events = EventClosure()(); 
    },
    
    subscribe: function(eventName, callback){
        if (!this.Events){
            this.error(ErrorMessages.EventSubscribeError); 
            return callback;
        }
        
        if (callback){
            callback["Sender"] = this;
            callback["Subscriber"] = this.Subscriber ? this.Subscriber : this;
            this["eventName"] = callback;
            if (!this.Events[eventName]) {
                this.Events[eventName] = [];
            }
            // put new events at the front of the list 
            this.Events[eventName].unshift(callback);
        }
        
        return callback;
    },

    publish: function (eventName, params) {     
        var i, event, prop;
        
        if (!this.Events){
            this.error(ErrorMessages.EventPublishError);
            return; 
        }
        
        if (this.Events[eventName]) {
            for (i = 0; i < this.Events[eventName].length; i++) {
                event = this.Events[eventName][i];
                // copy event props to params
                if (!params){
                    params = {}; 
                }
                for(prop in event){
                    params[prop] = event[prop]; 
                }
                event(params);
            }
        }
    }
});