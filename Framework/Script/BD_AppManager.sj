//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_ProcessWindowCollection
//USEUNIT BD_Configuration
//USEUNIT BD_App
//USEUNIT BD_AppManagerDefaultConfiguration

/**
 * Contains an object that manages App objects
 * @author Noel Rice
 * @company Falafel Software
 */

var AppManager = Event.extend({
    FrameworkClassName: "AppManager",
    Name: "AppManager",
    ErrorType: AppManagerError,
    Apps: {}, // collection of apps that can be referenced by name, i.e. Apps.FACSuite
    Configuration: null,
    Settings: null,
    _Apps: [], // array of aps that can be run in order.
    
    init: function(options){
        this._super(options); 
        
        this.initConfiguration();
        
        if (options && options.Apps){
            this.Apps = {};
            this._Apps = options.Apps; 
            for(var prop in options.Apps){
                var app = options.Apps[prop];
                if (app instanceof App){
                    app.SharedSettings = this.Settings;
                    this.Apps[app.Name] = app;
                } else {
                    this.error("options.Apps contained object that was not type App"); 
                }
            }
        } 
    },
    
    initConfiguration: function(){
        var configPathFormat = "%s\\Script\\BD_%sConfig.xml";
        var path = aqString.Format(configPathFormat, aqFileSystem.GetCurrentFolder(), this.FrameworkClassName);   
        this.Configuration = new AppManagerDefaultConfiguration({
            ConfigXMLPath: path 
        });
        this.Configuration.load();        
        this.Settings = this.Configuration.Settings; 
    },

    // run in order apps are passed in to init    
    runAll: function(){
        for(var prop in this._Apps){
            this._Apps[prop].run();
        }
    },
  
    // shutdown apps in reverse order as they are passed to init  
    shutdown: function(){
        for (var index = this._Apps.length - 1; index >= 0; index--){
            this._Apps[index].close();
        }
    },    
    
    logContents: function(){
        this.Configuration.log();
        Log.AppendFolder("Apps"); 
        for(var prop in this.Apps){
            this.Apps[prop].log(); 
        }
        Log.PopLogFolder();  
    }
}); 