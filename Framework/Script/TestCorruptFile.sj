//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * contains usage examples for the Configuration object 
 * @author Noel Rice
 * @company Falafel Software
 */

 // This test should fail with an error message indicating that
 // the config file has been altered.
 // The file is altered programmatically in this test, but does not use
 // the Configuration object to do so. 
 // The resulting file still contains valid XML, but is not a valid framework configuration
 // file because the checksum is out of step with the XML contents. 
function test(){
    var path = "MyConfig.xml"; 
    
    var app = new App({TestedApp: TestedApps.FACSuite});
    
    // change the xml file outside the Configuration object. 
    // These next few lines remove the first node under "Configuration".

    var doc = new ActiveXObject("Msxml2.DOMDocument.6.0");
    doc.load(path);
    doc.documentElement.removeChild(doc.documentElement.childNodes.item(0));
    doc.save(path); 
    
    var config = new Configuration({App: app, ConfigXMLPath:path});
    config.load();
    config.log(); 
}