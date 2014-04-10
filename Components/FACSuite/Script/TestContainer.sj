//USEUNIT FS_FACSuite
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT My_HomeView
//USEUNIT My_SetupView
//USEUNIT My_ExperimentView
//USEUNIT My_WorklistsView
//USEUNIT My_LibraryView

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
        
    var myFrameworkWrapper = element.cast(WPFContainer, {
        ItemClrClassName: "NavIcon", 
        ItemDepth: 20, 
        ItemType: WPFClickable,
        ContainedItemsClassMap: {       
            HomeView: MyHomeView,
            InstrumentsLandingView: MySetupView,
            ExperimentsLandingView: MyExperimentView,
            WorklistsLandingView: MyWorklistsView,
            LibraryLandingView: MyLibraryView
        },
        getCurrentClrClassName: function(){
            var contentControl = this.Finder.find({ClrClassName: "ContentControl"}); 
            return contentControl.TCObject.Content.ClrClassName; 
        },                 
        OnItemChanged: function(e){
            Log.Message("OnItemChanged: " + e.Sender.Current.Name); 
        },
        logStart: function(){
            Log.AppendFolder("My Framework Wrapper"); 
        }             
    });
    
    myFrameworkWrapper.log();
         
    myFrameworkWrapper.select({Text: "Home"});
    myFrameworkWrapper.select({Text: "Setup & QC"});
    myFrameworkWrapper.select({Text: "Experiments"});     
    myFrameworkWrapper.select({Text: "Worklists"});     
    myFrameworkWrapper.select({Text: "Library"});      
}