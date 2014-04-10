//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Configuration object 
 * @author Noel Rice
 * @company Falafel Software
 */
 
// after running MyConfig.xml Timeout | Long should have a ReadCount = 3
function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    var config = new Configuration({App: app, ConfigXMLPath: "MyConfig.xml"});
    config.load();    
    var longTimeout = config.Settings.Framework.Settings.Timeouts.Settings.Long.read();
    longTimeout = config.Settings.Framework.Settings.Timeouts.Settings.Long.read();
    longTimeout = config.Settings.Framework.Settings.Timeouts.Settings.Long.read();
    config.save(); 
    config.log();
}