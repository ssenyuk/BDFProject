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
    var config = new Configuration({App: app, ConfigXMLPath: "MyConfig.xml"});
    
    config
        .addPath("Framework|FilePaths|APath1")
        .write("c:\\test1"); 
    config
        .addPath("Framework|FilePaths|APath2")
        .write("c:\\test2");          
    config
        .addPath("Framework|FilePaths|APath3")
        .write("c:\\test2");              
    config
        .addPath("Framework|Timeouts|Long")
        .write("10000"); 
    config
        .addPath("Framework|Timeouts|Medium")
        .write("5000"); 
    config
        .addPath("Framework|Timeouts|Short")
        .write("2000");
            
    config.save(); 
    config.log();
}