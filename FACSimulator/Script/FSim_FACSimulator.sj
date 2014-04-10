//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT FSim_Main

var FACSimulator = App.extend({
    MainWindow: null,
    init: function (options) {
        if (!options){
            options = {};
        }
        if (!options.TestedApp){
            // if tested app isn't overridden in options, explicitly add it
            options["TestedApp"] = TestedApps.FACSimulator;
        }
        this._super(options); 
    },
    
    run: function(){
        if (this._super){
            this._super(); 
        }
        
        this.waitForReady();                 
        return this;  
    },
    
    onError: function(e){
        e.Error.log();
        
        if (e.Sender.hasPopups())
        {
            // don't create BD error objects inside onError -- will cause recursion.
            Log.AppendFolder("Unexpected Popups"); 
            Log.Error(ErrorMessages.AppUnexpectedPopupError);
            e.Sender.log(); 
            Log.PopLogFolder(); 
            e.Sender.closePopups();       
        } 
    },    

    // wait until one of two main windows is present
    waitForReady: function(){
        var ready = false;       
         
        while (!ready){
            this.refresh();             
        
            // make sure the application is in the foreground
            var topmostWindow = this.getTopmostWindow();
            if (topmostWindow){
                topmostWindow.activate(); 
            } 
        
            // close all popups
            this.closePopups();             
            
            if (this.Windows.FACSimulator &&
               !this.MainWindow){
                this.MainWindow = this.Windows.FACSimulator
                    .cast(FSimMain);
            }
        
            if (this.MainWindow){
                this.MainWindow.refresh(); 
                if (this.MainWindow.Visible == true){
                    ready = true;
                }
            }    
        }          
    }
});