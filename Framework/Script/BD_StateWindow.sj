//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_BaseWindow

/**
 * Contains object that encapsulates a window that can be maximized, minimized, restored
 * and that has WindowState so that it's state can be tracked during these operations.
 * 
 * @author Noel Rice
 * @company Falafel Software
 */

var StateWindow = BaseWindow.extend({
    FrameworkClassName: "StateWindow",
    ErrorType: StateWindowError, 
    WindowState: null,
    // this element holds WindowState
    ChildElement: null,
    States: {
        Minimized: "Minimized",
        Maximized: "Maximized",
        Restored: "Normal"
    },
    
    refresh: function(){
        if (this._super){
            this._super();            
        } 
                
        if (this.Exists){
            this.ChildElement = this.getChildElement(); 
        }
    },
    
    getChildElement: function(){
        for(var i = 0; i < this.TCObject.ChildCount; i++){
            var child = this.TCObject.Child(i);
            if (aqObject.IsSupported(child, "WindowState")){
                return child;
            }
        }    
    },
    
    minimize: function(){
        this.TCObject.Minimize(); 
        this._waitForStateChange(this.States.Minimized); 
        return this;   
    },
    
    maximize: function(){        
        this.TCObject.Maximize(); 
        this._waitForStateChange(this.States.Maximized);         
        return this;    
    },
    
    restore: function(){
        this.TCObject.Restore(); 
        this._waitForStateChange(this.States.Restored); 
        return this;    
    },    
      
    // private methods 
    _waitForStateChange: function(state){
        this.wait({
            Description: "StateWindow _waitForStateChange()",
            WaitFunction: function(e){
                e.Subscriber.ChildElement.Refresh();
                e.Done = e.Subscriber.ChildElement.WindowState.OleValue === state;
            }                         
        });             
    }
}); 