//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element
//USEUNIT BD_Wait

/**
 * Contains object that encapsulates a basic Microsoft system window
 * @author Noel Rice
 * @company Falafel Software
 */

var BaseWindow = Element.extend({
    FrameworkClassName: "BaseWindow",
    ErrorType: BaseWindowError, 
    Index: -1, // tracks order that windows are created

    activate: function () {
        this.TCObject.Activate();
        return this;
    },
    
    position: function(left, top, width, height){
        this.TCObject.Position(left, top, width, height);
        return this;    
    },
    
    close: function(){
        this.TCObject.Close();
        this.wait({
            Description: "close",
            WaitFunction: function(e){
                e.Subscriber.TCObject.Refresh(); 

                if (!e.Subscriber.TCObject.Exists){            
                    e.Done = true;
                }
            }                         
        });         
    },
    
    isPopup: function(){
        var popupClassNames = [
            "BD.FACSuite.CustomControls.Windows.DialogWindow" 
        ]; 
        var result = false;
        
        // is this window a window's dialog?
        if (aqObject.IsSupported(this.TCObject, "ObjectType") && this.TCObject.ObjectType == "Dialog"){
            return true; 
        } else {
            // does one of the child elements of this window have a ClrFullClassName that
            // matches the popupClassNames list?
            for(var i = 0; i < this.TCObject.ChildCount; i++){
                var child = this.TCObject.Child(i); 
                if (aqObject.IsSupported(child, "ClrFullClassName")){
                     for(var prop in popupClassNames){
                        if (popupClassNames[prop] === child.ClrFullClassName){
                            result = true; 
                            break;
                        }               
                    }                   
                }
            }
        }
        return result;     
    }    
}); 