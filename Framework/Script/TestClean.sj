//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Configuration object 
 * @author Noel Rice
 * @company Falafel Software
 */

 
 /* Note: run TestCreateNewConfigFile first to create MyConfig.xml */
 
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    var config = new Configuration({App: app, ConfigXMLPath: "MyConfig.xml"});
    config.load();    
    // removes settings with less than 1 read from the config object.
    // Note: clean() does NOT save the object automatically. This allows you 
    // to review the log for removed settings and decided if you want to add a call to save(). 
    config.clean({MinimumReads:1});
    config.log(); 
    // you can call save() here if you want to retain the changes
}