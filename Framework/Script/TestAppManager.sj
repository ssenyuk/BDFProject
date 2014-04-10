//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Tests the AppManager 
 * @author Noel Rice
 * @company Falafel Software
 */

function test(){
    var appManager = new AppManager({Apps: [
        new App({TestedApp: TestedApps.FACSimulator}),
        new App({TestedApp: TestedApps.FACSuite}) 
    ]});
    appManager.runAll();
    appManager.log();
    appManager.Apps.FACSuite.close(); 
    appManager.Apps.FACSuite.run(); 
    appManager.shutdown();        
}