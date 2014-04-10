//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Configuration object 
 * @author Noel Rice
 * @company Falafel Software
 */

function test(){
    var app = new App({TestedApp: TestedApps.FACSuite}); 
    var config = new DefaultConfiguration({App: app, ConfigXMLPath: "MyConfig.xml"});
    config.log(); 

}