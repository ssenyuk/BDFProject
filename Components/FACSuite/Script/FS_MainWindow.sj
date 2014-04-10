// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-20-2014 Galina Makhotkina A1QA Added importViaFileMenu,
// redoViaFileMenu, saveAsViaFileMenu, openExperimentViaFileMenu
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_WorkspaceContainer
//USEUNIT FS_LoginButtons
//USEUNIT FS_ExperimentView  

var FSMainWindow = StateWindow.extend({
    MainMenu: null, // main menu along the top of the screen
    LoginButtons: null, // buttons to the right of the main menu
    Workspaces: null, // contains left hand nav and right hand area
    MessageBar: null, // message bar under the menu
    Visible: false,
    HomeButton: "Home",
    SetupButton: "Setup & QC",
    ExperimentButton: "Experiments",
    WorklistsButton: "Worklists",
    LibraryButton: "Library",
    _innerContainer: null,
    _windowPresenter: null,
     
    init: function(options){
        this._super(options); 
        this.Visible = false; 
    },
        
    refresh: function(){
        if (this._super){
            this._super(); 
        }
        
        this.TCObject.Refresh();
        
        // get the containers closest to the elements needed by this class
        this._windowPresenter = this.Finder
            .find({ClrClassName: "WindowPresenter", Depth: 10})
            .cast(Element);
        grid1 = this._windowPresenter.Finder
            .find({ClrClassName: "Grid", Depth: 1})
            .cast(Element);
        this._innerContainer = grid1.Finder
            .find({ClrClassName: "Grid", Depth: 5})
            .cast(Element);             

        this.Visible = this._windowPresenter.Visible; 
        
        return this; 
     },
     
     loadControls: function(){ 

        this.MainMenu = this._innerContainer.Finder
            .find({NativeClrObject: "MainMenu", Depth: 5, Duration: 20000})
            .cast(WPFMenu);
        this.LoginButtons = this._innerContainer.Finder
            .find({NativeClrObject: "LoginButtons", Depth: 5})
            .cast(FSLoginButtons);
        this.MessageBar = this._innerContainer.Finder
            .find({ClrClassName: "MessageBarContentControl", Depth: 1})
            .cast(WPFMessageBar);
        this.Workspaces = this.MessageBar.Finder
            .find({ClrClassName: "Grid", Depth: 10})
            .cast(FSWorkspaceContainer);     
        
        this.MainMenu.Subscriber = this; 
        this.MainMenu.subscribe("OnSelected", this.menuSelected);
        this.Workspaces.Subscriber = this; 
        this.Workspaces.subscribe("OnItemChanged", this.workspaceChanged);     
     },
     
     menuSelected: function(e){
        e.Subscriber.waitForReady();
    },
    
    workspaceChanged: function(e){
        e.Subscriber.waitForReady();                  
    },    
    
    waitForReady: function(){
        this.refresh();
        this.loadControls(); 

        while (!this.Visible || !this.MainMenu || !this.MainMenu.Visible){
            this.refresh();
            this.loadControls();           
        }
         
        return this; 
    },
        
    /* @description This function will be used for import file fcs via file menu
    */     
    importViaFileMenu: function() {    
        this.loadControls();  
        this.MainMenu
            .Items.File.click()
            .Items.Import.click()
            .Items.FCSFiles.click();
    },
    /* @description This function will be used to select 'Redo' via file menu
    */     
    redoViaFileMenu: function() {    
        this.loadControls();  
        this.MainMenu
            .Items.Edit.click()
            .Items.RedoCreateANDGate.click();
    },
     /* @description This function will be used to select 'Save As' via file menu
    */     
    saveAsViaFileMenu: function() {    
        this.loadControls();  
        this.MainMenu
            .Items.File.click()
            .Items.SaveAs.click();
    },
    
     /* @description This function will be used to select 'Open Experiment' via file menu
    */     
    openExperimentViaFileMenu: function() {    
        this.loadControls();  
        this.MainMenu
            .Items.File.click()
            .Items.OpenExperiment.click();
    },
    
    /* @description This function will be used for find tab
    * @param {Object} <tabType> this parameter is tab type
    */     
    findTab: function(tabType) {    
        var tab = this.Workspaces.cast(tabType);
        return tab;
    },

    exitViaFileMenu: function() {    
        // make sure the latest menu items are available
        this.loadControls();  
        this.MainMenu
            .Items.File.click()
            .Items.Exit.click(); 
    }    
}); 