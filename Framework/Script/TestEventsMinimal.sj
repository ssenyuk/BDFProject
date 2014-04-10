//USEUNIT BD_Event

/**
 * contains basic usage examples for the Event object 
 * @author Noel Rice
 * @company Falafel Software
 */

// minimal event publisher
var EventPublisher = Event.extend({
    process: function () {
        for (var i = 0; i < 10; i++) {
            this.publish("OnProcess");
        }
    }
});

function handleOnProcess(){
    Log.Message("handling OnProcess");
}

function test() {
    var publisher =  new EventPublisher();
    // subscribe to the event
    publisher.subscribe("OnProcess", handleOnProcess);
    // cause the event to fire
    publisher.process();   
}

