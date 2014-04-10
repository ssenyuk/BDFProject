//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT FS_Shell

var FSimMain = StateWindow.extend({
    Shell: null,
    
    init: function(options){
        this._super(options); 
        
        this.Mapper.map([
            { Name: "Shell", ClrClassName: "Shell", ClassType: FSShell, Depth: 20 }
        ]);        
    }, 

    waitForReady: function(){
        while (!this.Visible){
            this.refresh();
        }
         
        return this; 
    }    
}); 