//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Create the default 
 * @author Noel Rice
 * @company Falafel Software
 */

function test(){
    var app = new App({TestedApp: TestedApps.FACSuite});
    
    app.Configuration
        .addPath("Framework|Timeouts|Long")
        .write("10000"); 
    app.Configuration
        .addPath("Framework|Timeouts|Medium")
        .write("5000"); 
    app.Configuration
        .addPath("Framework|Timeouts|Short")
        .write("2000");
            
    app.Configuration.save(); 
    app.Configuration.log();
}