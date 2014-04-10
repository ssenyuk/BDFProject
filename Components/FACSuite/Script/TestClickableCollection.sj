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
            ClrClassName: "MessageBarContentControl"
        }); 
        
    var myFrameworkWrapper = element.cast(WPFClickableCollection, {
        ItemClrClassName: "NavIcon", 
        ItemDepth: 20, 
        ItemType: WPFClickable, 
        logStart: function(){
            Log.AppendFolder("My Framework Wrapper"); 
        } 
    });
    
    myFrameworkWrapper.log(); 

    myFrameworkWrapper.click({Text: "Home"});
    myFrameworkWrapper.click({Text: "Setup & QC"});
    myFrameworkWrapper.click({Text: "Experiments"});     
    myFrameworkWrapper.click({Text: "Worklists"});     
    myFrameworkWrapper.click({Text: "Library"});      
}