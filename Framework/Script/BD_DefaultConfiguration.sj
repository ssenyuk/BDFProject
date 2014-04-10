//USEUNIT BD_Configuration
//USEUNIT BD_DefaultConfigurationError
//USEUNIT BD_Setting
//USEUNIT BD_Utils

/**
 * Contains object that reads and writes default configuration data
 * @author Noel Rice
 * @company Falafel Software
 */

var DefaultConfiguration = Configuration.extend({
    FrameworkClassName: "DefaultConfiguration",
    ErrorType: DefaultConfigurationError,    

    init: function(options){
        this._super(options); 
        
        // create a default file if none exists
        if (!this.configFileExists()){
            this.addPath("Framework|Timeouts|Long").write("10000"); 
            this.addPath("Framework|Timeouts|Medium").write("5000"); 
            this.addPath("Framework|Timeouts|Short").write("2000");
            this.addPath("Framework|Timeouts|Logging").write(false);
            this.addPath("Framework|Timeouts|Interval").write("100");
            this.addPath("Framework|Finder|Depth").write("20");
            this.addPath("Framework|Finder|MaxDepth").write("20");
                  
            this.save(); 
        }
    }
});