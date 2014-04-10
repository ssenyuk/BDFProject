//USEUNIT FS_FACSuite
//USEUNIT BD_FrameworkClassIncludes

// this unit is an exercise from the documentation

function test(){
    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
        }); 
   
    app.MainWindow.waitForReady();

    var element = app.MainWindow.Finder.find({
            NativeClrObject: "ExperimentNavigateButton"
        }); 
        
    var myFrameworkWrapper = element.cast(WPFClickable);
    
    myFrameworkWrapper.log(); 
    
    myFrameworkWrapper.click(); 
}