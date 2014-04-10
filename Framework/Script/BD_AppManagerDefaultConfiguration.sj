//USEUNIT BD_Configuration
//USEUNIT BD_Setting
//USEUNIT BD_Utils

/**
 * Contains object that reads and writes default configuration data
 * @author Noel Rice
 * @company Falafel Software
 */

var AppManagerDefaultConfiguration = Configuration.extend({
    FrameworkClassName: "AppManagerDefaultConfiguration",
    ErrorType: AppManagerDefaultConfigurationError,    

    init: function(options){
        this._super(options); 
        
        // create a default file if none exists
        if (!this.configFileExists()){
            this.addPath("VP|Paths|OutputFolder").write("c:\\VP\\"); 
                  
            this.save(); 
        }
    }
});