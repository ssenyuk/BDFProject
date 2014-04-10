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
            this.publish("OnProcess", {Number: i} );
        }
    }
});

function handleOnProcess(e){
    Log.Message("handling OnProcess: " + e.Number);
}

function test() {
    var publisher =  new EventPublisher();
    // subscribe to the event
    publisher.subscribe("OnProcess", handleOnProcess);
    // cause the event to fire
    publisher.process();   
}

