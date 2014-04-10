//USEUNIT BD_Base
//USEUNIT BD_SettingError

/**
 * Contains object encapsulates a configuration setting
 * @author Noel Rice
 * @company Falafel Software
 */
 
var Setting = Base.extend({
    FrameworkClassName: "Setting",
    ErrorType: SettingError,
    Audit: {},
    Value: null,
    
    read: function(){
        if (!this.Audit){
            this.Audit = {};
        }
        this.Audit.ReadCount = this.Audit.ReadCount ? this.Audit.ReadCount + 1 : 1; 
        this.Audit.LastReadTime = new Date(); 
        this.Audit.LastReadBy = Sys.UserName; 
        return this.Value;     
    },
    
    write: function(value){
        if (!this.Audit){
            this.Audit = {};
        }
        this.Audit.LastWriteTime = new Date(); 
        this.Audit.LastWriteBy = Sys.UserName; 
        this.Value = value; 
    },
    
    add: function(settingName){      
        this.Settings[settingName] = new Setting({Name: settingName});
        return this;   
    },
    
    remove: function(settingName){
        delete this.Settings[settingName];
        return this; 
    },
    
    logContents: function(){
        this._super(); 
        
       if (this.Audit){
            Log.AppendFolder("Audit"); 
            for(var prop in this.Audit){
                Log.Message(prop + ": " + this.Audit[prop].toString())
            }
            Log.PopLogFolder();
        }        
        
        if (this.Settings){
            Log.AppendFolder("Settings"); 
            for(var prop in this.Settings){
                var setting = this.Settings[prop]; 
                setting.log(); 
            }
            Log.PopLogFolder();
        }
    }       
});