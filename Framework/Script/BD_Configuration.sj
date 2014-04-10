//USEUNIT BD_Base
//USEUNIT BD_ConfigurationError
//USEUNIT BD_Setting
//USEUNIT BD_Utils

/**
 * Contains object that reads and writes configuration data
 * @author Noel Rice
 * @company Falafel Software
 */

var Configuration = Base.extend({
    FrameworkClassName: "Configuration",
    ErrorType: ConfigurationError,
    ConfigXMLPath: null,
    Settings: {},
    Name: "Configuration",
    IsValid: true,
    _Document: new ActiveXObject("Msxml2.DOMDocument.6.0"),
    _RootXML: "<Configuration></Configuration>",

    init: function (options) {
        this._super(options); 
        this.validatePropertyAssignments(["ConfigXMLPath"], "init");
        this.clear(); 
    },
    
    clear: function(){
        this._Document.loadXML(this._RootXML);
    },    
    
    save: function () {
        this.clear(); 
        this._settingsToDocument(); 
        this._Document.save(this.ConfigXMLPath);
        return this; 
    },
    
    configFileExists: function(){
        return aqFileSystem.Exists(this.ConfigXMLPath);     
    },

    load: function () {
        if (this.configFileExists()){
            this.Settings = {}; 
            this._Document.load(this.ConfigXMLPath);        
            if (this._Document.parseError.errorCode == 0) {
                this.IsValid = this._validate();    
                if (this.IsValid){
                    this._documentToSettings(this, this._Document.documentElement, this)(); 
                } else {                
                    this.error(ErrorMessages.CorruptConfigFile, this.ConfigXMLPath, this.FrameworkClassName);                     
                }
            } else {
                this.error(ErrorMessages.UnableToReadXml, this.ConfigXMLPath, this._Document.parseError.reason);        
            }
        } else {
            this.error(ErrorMessages.FileNotFound, this.ConfigXMLPath); 
        }
        return this; 
    },
    
    addPath: function(path){
        if (typeof path === "string" && path != ""){
            var referenceObject = this; 
            var items = path.split("|");
            for(var prop in items){
                var name = items[prop];
                if (!referenceObject.Settings){
                    referenceObject.Settings = {};
                }
                if (!referenceObject.Settings[name]){
                    referenceObject.Settings[name] = new Setting({Name: name});
                }
                
                referenceObject = referenceObject.Settings[name]; 
            }
        }
        return referenceObject;     
    },
    
  
    clean: function(options){   
        if (this.validateOptions(options, ["MinimumReads"], "clean")){
            Log.AppendFolder("Removing Configuration Settings from " + this.ConfigXMLPath);
            this._cleanSettings(this, aqConvert.StrToInt(options.MinimumReads), this.Settings, null)();
            Log.PopLogFolder();  
        }
    },
    
    logContents: function(){
        this._super(); 
       
        if (this.Settings){         
            Log.AppendFolder("Settings"); 
            for(var prop in this.Settings){
                var setting = this.Settings[prop]; 
                setting.log(); 
            }
            Log.PopLogFolder();
        } 
    },

    // private methods

    _validate: function(){
        var elements = this._Document.documentElement.getElementsByTagName("Checksum");
        var checksum = 0; 
        var validatedChecksum = -1; 
        if (elements.length > 0 && elements[0].text != ""){
            // get the stored checksum in the file
            checksum = aqConvert.StrToInt(elements[0].text);
            // remove the checksum element itself before calculating the checksum
            this._Document.documentElement.removeChild(elements[0]);
            // calculate a checksum based on the file contents 
            var calculatedChecksum = new BDUtils().checksum(this._Document.xml);
        } 
        // if the file hasn't been altered manually or corrupted, the stored checksum and the calculated
        // checksum should be the same.
        return checksum === calculatedChecksum;     
    },
    
    _cleanSettings: function(sender, minimumReads, settings, prop){
        return function(){
            var current = settings[prop];
            var currentSettings = current ? current.Settings : settings;      
        
            if (current && current.Value){
                var readCount = current.Audit && current.Audit.ReadCount ? 
                    aqConvert.StrToInt(current.Audit.ReadCount) : 0; 
                if (readCount < minimumReads){
                    current.log(); 
                    delete settings[prop];
                }
            } 
            for(var index in currentSettings){
                lastResult = 
                    sender._cleanSettings(sender, minimumReads, currentSettings, index)(); 
            }
        }
    },
    
    _getTagElement: function(document, parentElement, name){
        for(var index = 0; index < parentElement.childNodes.length; index++){
            var child = parentElement.childNodes.item(index);
            if (child.tagName == name){
                return child; 
            }    
        }
        return document.createElement(name);
        
    },
    
    _settingToXML: function(sender, document, setting, parentElement){
        return function(){
            
            var element = sender._getTagElement(document, parentElement, setting.Name); 
            if (setting.Value){
                element.setAttribute("Value", setting.Value);
                for(var prop in setting.Audit){
                    var audit = setting.Audit[prop];
                    if (audit){
                        element.setAttribute(prop, audit.toString());
                    }
                }                 
            }      
            parentElement.appendChild(element);       
            for(var prop in setting.Settings){
                if (setting.Settings[prop] instanceof Setting){
                    sender._settingToXML(sender, document, setting.Settings[prop], element)();
                }
            }
        }
    },
    
    _settingsToDocument: function(){
        for(var prop in this.Settings){
            var setting = this.Settings[prop]; 
            if (setting instanceof Setting){
                this._settingToXML(this, this._Document, setting, this._Document.documentElement)(); 
            }
        }
        var checksum = this._Document.createElement("Checksum");
        checksum.text = new BDUtils().checksum(this._Document.xml);
        this._Document.documentElement.appendChild(checksum);  
    },
    
    _documentToSettings: function(sender, element, setting){
        return function(){          
            var value = element.getAttribute("Value");
            if (value){
                setting.Value = value;     
            
                audit = {}; 
                
                var readCount = element.getAttribute("ReadCount");
                if (readCount){
                    audit.ReadCount = aqConvert.StrToInt(readCount);     
                }
            
                var lastReadTime = element.getAttribute("LastReadTime");
                if (lastReadTime){
                    audit.LastReadTime = new Date(lastReadTime);     
                }
            
                var lastReadBy = element.getAttribute("LastReadBy");
                if (lastReadBy){
                    audit.LastReadBy = lastReadBy;     
                }
                     
                var lastWriteTime = element.getAttribute("LastWriteTime");
                if (lastWriteTime){
                    audit.LastWriteTime = new Date(lastWriteTime);     
                }
            
                var lastWriteBy = element.getAttribute("LastWriteBy");
                if (lastWriteBy){
                    audit.LastWriteBy = lastWriteBy;     
                }
            
                setting["Audit"] = audit; 
            }
            
            for(var index = 0; index < element.childNodes.length; index++){
                var child = element.childNodes.item(index);
                if (!setting["Settings"]){
                    setting["Settings"] = {};
                }
                var titleName = new BDUtils().toTitleCase(child.tagName);
                if (titleName != "Checksum"){
                    setting["Settings"][titleName] = new Setting({App: sender.App, Name: titleName});
                    sender._documentToSettings(sender, child, setting["Settings"][titleName])();
                }
            }
        }
    }
        
});