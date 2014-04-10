//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_LoginWindow
//USEUNIT FS_MainWindow
//USEUNIT FS_PlotEditorWindow
//USEUNIT FS_HierarchyWindow

//USEUNIT FS_TubeProperties

var FACSuite = App.extend({
    FrameworkClassName: "FACSuite",
    LoginWindow: null,
    MainWindow: null,
    LoggedIn: false,
    init: function (options) {
        if (!options){
            options = {};
        }
        if (!options.TestedApp){
            // if tested app isn't overridden in options, explicitly add it
            options["TestedApp"] = TestedApps.FACSuite;
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
        
        // TubeProperties is a special case which is handled in BD_ProcessWindowCollection
        // but I included it here for show. 
        if (e.Sender.hasPopups({Ignore: ["Login", "PlotEditor", "TubeProperties" ]}))
        {
            // don't create BD error objects inside onError -- will cause recursion.
            Log.AppendFolder("Unexpected Popups"); 
            Log.Error(ErrorMessages.AppUnexpectedPopupError);
            e.Sender.log(); 
            Log.PopLogFolder(); 
            // TubeProperties is a special case which is handled in BD_ProcessWindowCollection
            // but I included it here for show. 
            e.Sender.closePopups({Ignore: ["Login", "PlotEditor", "TubeProperties" ]});       
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
        
          // close all popups except the login window
          //  this.closePopups({Ignore: ["Login"]}); 
          // Added PlotEditor to the list of windows to ignore 
          // 
          // Added TubeProperties to the list of windows to ignore, NOW
          // TubeProperties is a very, very special case. BD_ProcessWindowCollection
          // handles this special case. Technically, I
          // dont even have to put TubeProperties on this list, but
          // I put it here for show (to show everyone that its a window
          // we want to ignore).  
          //         
            this.closePopups({Ignore: ["Login", "PlotEditor", "TubeProperties"]});    
            if (this.Windows.FACSuite &&
               !this.MainWindow){
                this.MainWindow = this.Windows.FACSuite
                    .cast(FSMainWindow);
            }
        
            if (this.Windows.Login &&
               !this.LoginWindow ){
                this.LoginWindow = this.Windows.Login
                    .cast(FSLoginWindow);
            }    
        
            if (this.LoginWindow){
                this.LoginWindow.refresh(); 
                if (this.LoginWindow.Visible == true){
                    ready = true;
                }
            } else if (this.MainWindow){
                this.MainWindow.refresh(); 
                if (this.MainWindow.Visible == true){
                    this.LoggedIn = true;
                    ready = true;
                    this.MainWindow.loadControls(); 
                }
            }    
        }          
    },
    
    login: function(options){
        
        if ((this.LoginWindow) && (!this.LoggedIn)){
            
            this.LoginWindow.login(options);
            this.LoggedIn = true; 
        }
        
        // wait for the main window components to be visible before continuing
        this.MainWindow.waitForReady();
        this.MainWindow.loadControls();  

        return this; 
    },
    
    logout: function(){
        this.MainWindow.LoginButtons.click({Text: "Log Out"});
        this
            .waitForWindow({Text: "Logout Confirmation"})
            .cast(WPFConfirmationWindow)
            .Buttons.click({Text: "Yes"});
        this.LoginWindow = null;      
        this.LoggedIn = false;
        this.waitForReady();  
        return this; 
    },
    
//    /* @description This function will be used to find Tube Properties window
//    */
//    findTubePropertiesWindow: function() {
//      var window = this.findWindow("Tube Properties",  FSTubeProperties);
//      return window;
//    },

    exitViaFileMenu: function(){
        Log.Message("Exiting via file menu") ;
        this.MainWindow.exitViaFileMenu();
        // always call this after closing in any manner
        // to wait for the process to finish up before allowing
        // the script to continue.  
        this.waitForClose(); 
    }
});
