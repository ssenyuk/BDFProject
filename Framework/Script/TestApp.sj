//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_App
//USEUNIT BD_AppError

/**
 * contains usage examples for the App object 
 * @author Noel Rice
 * @company Falafel Software
 */

// run, log properties and close app
function testAppRun() {

var app = 
    new App({TestedApp: TestedApps.FACSuite});
    app.run();    
    try {
        app.log();
    } finally {
        app.close();
    }
}

// This test is designed to generate an error!
function testNoTestedApp() {

    // fails on this first line and logs initialization error,
    // requires TestedApps parameter.
    var app = new App(); 
    app.run();    
    try {
        app.log();
    } finally {
        app.close();
    }
}