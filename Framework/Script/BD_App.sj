//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_ProcessWindowCollection
//USEUNIT BD_Event
//USEUNIT BD_DefaultConfiguration
//USEUNIT BD_Wait

/**
 * Contains basic application object
 * @author Noel Rice
 * @company Falafel Software
 */
 
 

var App = Event.extend({ 
    FrameworkClassName: "App",
    ErrorType: AppError,
    WaitType: Wait,  
    Process: null,
    TestedApp: null,
    Windows: {}, // collection of the top level app windows
    Settings: null,
    SharedSettings: null,
    Configuration: null,
    //BuildInfo: null, inherit from Base, include ProductName and BuildNumber, available to all apps
    _processWindowCollection: null,

    init: function (options) { 
        this._super(options); 
        
        this.subscribe("OnError", this.onError);
    
        if (options && options.TestedApp) {
            this.TestedApp = options.TestedApp;
            this["Name"] = this.TestedApp.ItemName;
        }
        if (this.TestedApp) {
            // initialize configuration object
            var configPathFormat = "%s\\Script\\BD_%sConfig.xml";
            var path = aqString.Format(configPathFormat, aqFileSystem.GetCurrentFolder(), this.FrameworkClassName);   
            this.Configuration = new DefaultConfiguration({
                ConfigXMLPath: path 
            });
            this.Configuration.load(); 
            this.Settings = this.Configuration.Settings.Framework.Settings; 
        } else {
           this.error(ErrorMessages.AppInitFail);         
        }
    
        return this;
    },

    run: function () {
        if (this.TestedApp) {
            if (this.Name != undefined && this.Name != "") {
                this.Process = Sys.WaitProcess(this.Name);
            }
            
            if (!this.Process.Exists) {
                this.Process = this.TestedApp.Run(1);
            }
            if (this.Process.Exists) {
                this.Name = this.Process.ProcessName;
                Log.Message(aqString.Format(StatusMessages.AppRunning, this.Name));
                // now that the app is running, get the latest
                // list of windows.
                this.refresh();                
            } else {
                this.error(ErrorMessages.AppRunFail); 
            }
            this.waitForReady(); 
        }

        return this;
    },
    
    waitForReady: function(){
    },
    
    onError: function(e){
        e.Error.log();
    },
    
    // process methods
    
    refresh: function(){
        this._processWindowCollection = 
            new ProcessWindowCollection({
                App: this,
                TCObject: this.Process
            });
        this.Windows = this._processWindowCollection.Items; 
        return this;    
    },
    
    close: function () {
        if (this.Process && this.Process.Exists) {
            Log.Message(aqString.Format(StatusMessages.AppClosing, this.Name))
            this.Process.Close();
            this.waitForClose();         
        }
    },
    
    waitForClose: function(){
        this.wait({
            App: this,
            Description: "App waitForClose()",
            WaitFunction: function(e){
                if (e.Subscriber.Process && !e.Subscriber.Process.Exists){
                    e.Done = true;
                }
            },
            OnCompleted: function(e){
                Log.Message(aqString.Format(StatusMessages.AppClosed, e.Subscriber.Name)); 
            }                            
        }); 
    },
    
    // window methods
    
    getTopmostWindow: function(){
        return this._processWindowCollection.getTopmostWindow();    
    },
    
    hasPopups: function(options){
        return this._processWindowCollection.hasPopups(options); 
    },
    
    closePopups: function(options){
        return this._processWindowCollection.closePopups(options); 
    },
    
    waitForWindow: function(options){
        return this._processWindowCollection.waitForWindow(options); 
    },
    
    // logging methods
    
    logContents: function(){
        this._super();

        Log.AppendFolder("Settings"); 
        
        if (this.Settings){         
            Log.AppendFolder("Framework"); 
            for(var prop in this.Settings){
                var setting = this.Settings[prop]; 
                setting.log(); 
            }
            Log.PopLogFolder();
        }  
        
        if (this.SharedSettings){         
            Log.AppendFolder("Shared"); 
            for(var prop in this.SharedSettings){
                var setting = this.SharedSettings[prop]; 
                setting.log(); 
            }
            Log.PopLogFolder();
        } 
        
        Log.PopLogFolder();               
        
        this._processWindowCollection.logContents();  
    }  
});