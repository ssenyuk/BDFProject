//USEUNIT BD_Base
//USEUNIT BD_ConfigurationError
//USEUNIT BD_Setting
//USEUNIT BD_Utils

/**
 * Contains object that reads and writes text
 * @author Noel Rice
 * @company Falafel Software
 */

var TextLogger = Base.extend({
    FrameworkClassName: "TextLogger",
    ErrorType: TextLoggerError,
    Path: null,
    FileName: null,
    TimeStampedFilePath: null,

    init: function (options) {
        this._super(options); 
        if (this.validateInitOptions(["Path", "FileName"])){
            this.clear(); 
        }
    },
    
    clear: function(){
        this.TimeStampedFilePath = this.Path + this.getTimedStampedFileName(); 
        if (!aqFileSystem.Exists(this.Path)){
            aqFileSystem.CreateFolder(this.Path)
        }
        if (aqFile.Create(this.TimeStampedFilePath) != 0){
            this.error("Unable to create file " + this.TimeStampedFilePath); 
        }
    },
    
    write: function(text){
        aqFile.WriteToTextFile(this.TimeStampedFilePath, text, aqFile.ctANSI, false);
    },
    
    writeline: function(text){
        aqFile.WriteToTextFile(this.TimeStampedFilePath, text + "\r\n", aqFile.ctANSI, false);
    },    
    
    getTimedStampedFileName: function(){
        var now = aqDateTime.Now();
        var ext = aqFileSystem.GetFileExtension(this.FileName);
        var name = aqFileSystem.GetFileNameWithoutExtension(this.FileName);   
    
        return name + "_" +
            aqDateTime.GetYear(now).toString() + 
            aqDateTime.GetMonth(now).toString() +
            aqDateTime.GetDay(now).toString() + "_" +
            aqDateTime.GetHours(now).toString() + 
            aqDateTime.GetMinutes(now).toString() + 
            aqDateTime.GetSeconds(now).toString() + "." + ext; 
    }   
});