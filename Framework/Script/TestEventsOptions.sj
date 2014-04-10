//USEUNIT BD_Event

/**
 * contains basic usage examples for the Event object 
 * @author Noel Rice
 * @company Falafel Software
 */

var EventPublisher = Event.extend({
    OnProcess: null,
    init: function(options){
        this._super(options);
        
        if (options){
            this.OnProcess = this.subscribe("OnProcess", options.OnProcess); 
        }
    },    
    process: function () {
        for (var i = 0; i < 10; i++) {
            this.publish("OnProcess", {Number: i} );
        }
    }
});

function test() {
    var publisher =  new EventPublisher({
        OnProcess: function(e){
            Log.Message("Handling OnProcess: " + e.Number); 
        }
    });
    // cause the event to fire
    publisher.process();   
}

