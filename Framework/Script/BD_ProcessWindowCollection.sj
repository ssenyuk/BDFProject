//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_TestCompleteBase
//USEUNIT BD_Utils
//USEUNIT BD_BaseWindow
//USEUNIT BD_Wait

/**
 * This object creates a collection of windows to be consumed by the App object.
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var ProcessWindowCollection = TestCompleteBase.extend({
    FrameworkClassName: "ProcessWindowCollection",
    ErrorType: ProcessWindowCollectionError,
    App: null,
    Process: null,
    Count: 0,
    Items: {},
    
    init: function(options){
        this._super(options); 
        this.Process = this.TCObject;
        this.refresh();                
    },
    
    refresh: function(){
        this.Count = 0; 
        this.Items = {};
        
        if (this.Process){
            this.Process.Refresh();
            
            // create wrapper elements for each testcomplete object
            for (var i = 0; i < this.Process.ChildCount; i++) {
                var window = this._getWindow(this.Process.Child(i));
                if (window){
                    var name = this._getUniqueWindowName(window.WndCaption);                 
                    this.Items[name] = new BaseWindow({
                        App: this.App, 
                        TCObject: window, 
                        Name: name,
                        Text: window.WndCaption,
                        Index: this.Count
                    })
                    this.Count = this.Count + 1;
                }
            }  
        }  
    },
    
    byIndex: function(index){
        for(var prop in this.Items){
            if (this.Items[prop].Index === index){
                return this.Items[prop]; 
            }
        }
        return null; 
    },

    getTopmostWindow: function(){
        this.refresh();
        return this.byIndex(this.Count - 1);
    },
 
    hasPopups: function(options){
        this.refresh();         
        for(var prop in this.Items){
            var window = this.Items[prop];           
            if (window.isPopup() && !this._ignore(options, window)){
                return true; 
            }
        }
        return false; 
    },
    
    closePopups: function(options){
        for(var prop in this.Items){
            var window = this.Items[prop];
            if (window.isPopup() && !this._ignore(options, window)){
                window.close();
            }
        }
    }, 
    
    waitForWindow: function(options){
        var result = null; 
        
        this.wait({
            Description: "ProcessWindowCollection waitForWindow()",
            WaitFunction: function(e){
                e.Subscriber.refresh(); 
                for(var prop in e.Subscriber.Items){
                    var window = e.Subscriber.Items[prop]; 
                    if ((options.Name && window.Name === options.Name) ||
                        (options.ClrClassName && window.ClrClassName === options.ClrClassName) ||                       
                        (options.Text && window.Text === options.Text)) {                   
                        result = window;
                        break;
                    }
                     
                    // SPECIAL CASE   -  tube properties window
                    // The tube properties window's name is usually something
                    // like "TubePropertiesTube_001", "TubePropertiesTube_002",
                    // or "TubeProperties_I_renamed_it"
                    // so it can always be different at the end of the string. 
                    // We have set up special handling for this special case. 
                    // We require the user to pass in just "Tube Properties" and
                    // not pass in any other part of the string.
                    // We check if the options.Text is indeed "Tube Properties",
                    // and if so, we call aqString.Find to see if window.Text
                    // contains substring "Tube Properties" 
                    // It is, to some extent, a way of doing a "wildcard" search.
                    
                    if (options.Text === "Tube Properties" ) {
                       if ( aqString.Find(window.Text, options.Text ) != -1 ) {
                          result = window;
                          break;
                        }  
                    }
                }
                if (result){            
                    e.Done = true;
                }
            },
            OnTimedOut: function(e){
                e.Error("Timed out waiting for window");     
            }                            
        }); 
        
        return result; 
    },
    
    // override logContents
    logContents: function(){
        Log.AppendFolder("Windows (" + this.Count + ")");
        
        try {
            for(var prop in this.Items){
                this.Items[prop].log(); 
            }
        } finally {
            Log.PopLogFolder();
        }   
    },
    
    // private methods
    
    _getWindow: function(processItem){
        if (processItem){
            if (processItem.Exists && processItem.WaitProperty("Visible", true, 0)) {
                if (processItem.WaitProperty("GroupIndex", "*", 0)){
                    return this.Process.Window(processItem.WndClass, processItem.WndCaption, processItem.GroupIndex);
                } else {
                    return this.Process.Window(processItem.WndClass, processItem.WndCaption);
                }
            }           
        }    
    },
    
    _getUniqueWindowName: function(name){
        var index = 1;
        var newName = name != "" ? new BDUtils().textToName(name) : "unnamed";
        
        while (this.Items[newName]){
            newName = name + index.toString();
            index = index + 1;    
        }
        return newName;
    },
    
    _ignore: function(options, window){
        if (options && options.Ignore){
            for(var prop in options.Ignore){
                if (window.Name === options.Ignore[prop]){          
                    return true;  
                } 
                // special case. TubeProperties always has different suffix,
                // eg. TubePropertiesTube_001,
                // so we see if "TubeProperties" is contained in the name, if so,
                // return true. So...if we hard code it here, then why did we
                // include it in the ignore list? Well, techically, since we are
                // hard coding it here, it does not have to be in the ignore list
                // but we think it is still good to have it there, so people can
                // see what windows we are trying to ignore.
                // NOTE; window.Name and window.Text are different. Yes, we are
                // handling it a little different here than above in 
                // waitForWindow, but doing it this way maintains the flow
                // here in this method.              
                if ( aqString.Find( window.Name, "TubeProperties" ) != -1 ) {
                   return true;
                }                       
            }
        }
        return false; 
    }    
}); 