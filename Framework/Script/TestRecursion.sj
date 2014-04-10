var MenuItem = function(options) {
    this.Name = options.Name
    if (options.Items) {
        this.Items = options.Items
    }
}

var External = function(){
   this.Items = [
        new MenuItem({
            Name: "one",
            Items: [
                new MenuItem({Name: "one A",
                    Items: [
                        new MenuItem({Name: "one A 1"})   
                    
                ]
                }),
                new MenuItem({Name: "one B"}),
                new MenuItem({Name: "one C"})
            ]
        }), 
        new MenuItem({
            Name: "two",
            Items: [
                new MenuItem({Name: "two A"}),
                new MenuItem({Name: "two B"}),
                new MenuItem({Name: "two C"})
            ]
        }),
        new MenuItem({
            Name: "three",
            Items: [
                new MenuItem({Name: "three A"}),
                new MenuItem({Name: "three B"}),
                new MenuItem({Name: "three C"})
            ]
        })
    ];    
}

function createfunc(item){
    return function(){
        Log.Message(item.Name);
        if (item.Items){
            for (var prop in item.Items){
                createfunc(item.Items[prop])();
            }
        }
    }
}

function test(){
    var external = new External();  
    
    for(var prop in external.Items){
        createfunc(external.Items[prop])();     
    }
}