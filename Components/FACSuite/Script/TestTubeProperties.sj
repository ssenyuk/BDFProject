//USEUNIT FS_FACSuite
//USEUNIT FS_TubeProperties
//USEUNIT FS_TubeProperties_General
//USEUNIT FS_TubeProperties_Parameters
//USEUNIT FS_TubeProperties_Compensation
//USEUNIT FS_TubeProperties_Reagents
//USEUNIT FS_TubeProperties_Keywords
//USEUNIT FS_TubeProperties_Acquisition

//USEUNIT FS_SelectTubeSettings

//USEUNIT CM_pressKey


/**
Description:  test program to test tube properties menu
Author:  Ken Johnson

How to run. 
   Get on experiment page. 
   Make sure you have a tube in data sources pane
   highlight that tube
   start the test in testComplete, then bring facsuite to 
   the screen with 4 seconds, it should bring out the tube properties
   menu. If you are too late, press F4 to bring out tube properties menu. 

*/
function testTubeProperties() {
var MY_DELAY_SHORT = 2000;
var MY_DELAY_LONG = 4000;
  
aqUtils.Delay(MY_DELAY_LONG);
   pressKey('[F4]');
aqUtils.Delay(MY_DELAY_SHORT);   
   var app = new FACSuite().run();
      //  .login({
           // UserName: 'BDAdministrator', 
           // Password: 'bdadministrator'
           // }); 
    /*            
    app
        .MainWindow
        .MainMenu
        .Items.Tools.click()
        .Items.UserManagement.click(); 
     */ 
     
      // .waitForWindow({Text: "Tube Properties"})      
   var tubePropertiesWindow = app 
    .waitForWindow({Text: "Tube Properties"})      
      .cast(FSTubeProperties);
   aqUtils.Delay(MY_DELAY_SHORT);
    // Go through the tabs
           
   
 
   // GENERAL TAB
    
   // get on the general tab
   tubePropertiesWindow
        .TabControl
        .click({Text: "General"});
     
    // get general tab object    
    var tubePropertiesWindowGeneral = app   
        .waitForWindow({Text: "Tube Properties"})
       // .waitForWindow( )
        .cast(FSTubePropertiesGeneral);  
    
   tubePropertiesWindowGeneral.setTubeName( { TubeName: 'Tube_001'} );
   tubePropertiesWindowGeneral.setTubeId( { TubeId: 'KenTube12345'} );
   tubePropertiesWindowGeneral.setSampleID( { SampleID: 'sample123'} );    
   tubePropertiesWindowGeneral.selectTubeSettingsButton( ); 
   
   // get selectTubeSettings Button   
    var selectTubeSettingsWindow = app   
        .waitForWindow({Text: "Select Tube Settings"}) 
        .cast(FSSelectTubeSettings);
   
   aqUtils.Delay(MY_DELAY_SHORT);
   selectTubeSettingsWindow.clickCancel();        
   aqUtils.Delay(MY_DELAY_SHORT);
   
   // GET ON PARAMETERS TAB
    tubePropertiesWindow
        .TabControl
        .click({Text: "Parameters"});
        
    // get parameter tab object    
    var tubePropertiesWindowParameters = app      
        .waitForWindow({Text: "Tube Properties"})
        .cast(FSTubePropertiesParameters); 
    
    // select various listview items
    options = { Name: 'SSC' } ;        
    tubePropertiesWindowParameters.selectListView(options);
        
    options = { Name: 'FITC' } ;        
    tubePropertiesWindowParameters.selectListView(options);     
   
    options = { Name: 'FSC' } ;        
    tubePropertiesWindowParameters.selectListView(options);  
    
    options = { Name: 'PE' } ;        
    tubePropertiesWindowParameters.selectListView(options);
    
    tubePropertiesWindowParameters.addParameter();
    aqUtils.Delay(MY_DELAY_LONG);  
    
    //tubePropertiesWindowParameters.removeParameter();
    //aqUtils.Delay(MY_DELAY_LONG); 
    
     
   // GET ON COMPENSATION TAB
    tubePropertiesWindow.TabControl.click({Text: "Compensation"});
        
    var tubePropertiesWindowCompensation = app.waitForWindow({Text: "Tube Properties"}).cast(FSTubePropertiesCompensation); 
    
    // blink enable compensation on and off
    for ( var i = 0; i <3; i++ ) {    
       tubePropertiesWindowCompensation.checkEnableCompensation();
       aqUtils.Delay(MY_DELAY_SHORT);
       tubePropertiesWindowCompensation.uncheckEnableCompensation();
       aqUtils.Delay(MY_DELAY_SHORT);
    }    
            
   // GET ON REAGENTS TAB
    tubePropertiesWindow
        .TabControl
        .click({Text: "Reagents"});
        
    var tubePropertiesWindowReagents = app
        .waitForWindow({Text: "Tube Properties"})
        .cast(FSTubePropertiesReagents);
        
    // select various listview items
    options = { Name: 'FITC' } ;        
    tubePropertiesWindowReagents.selectListView(options);
    aqUtils.Delay(MY_DELAY_SHORT);
        
    options = { Name: 'PE' } ;        
    tubePropertiesWindowReagents.selectListView(options); 
    aqUtils.Delay(MY_DELAY_SHORT); 
      
    // GET ON THE KEYWORDS TAB
    tubePropertiesWindow
        .TabControl
        .click({Text: "Keywords"});
     
     var tubePropertiesWindowKeywords = app     
        .waitForWindow({Text: "Tube Properties"})
        .cast(FSTubePropertiesKeywords); 
    
    // blink show all keywords on and off
    for ( var i = 0; i <3; i++ ) {    
       tubePropertiesWindowKeywords.checkShowAllKeywords();
       aqUtils.Delay(MY_DELAY_SHORT);
       tubePropertiesWindowKeywords.uncheckShowAllKeywords();
       aqUtils.Delay(MY_DELAY_SHORT);
    }       
        
        
    // get on the acquisition tab
    tubePropertiesWindow
        .TabControl
        .click({Text: "Acquisition"});
        
    var tubePropertiesWindowAcquisition = app    
        .waitForWindow({Text: "Tube Properties"})
        .cast(FSTubePropertiesAcquisition); 
   
    // set stopping rule time
    /*  HOLD off on this for now. we need editable combo box 
    options = { StoppingRuleTime: '720' };
    tubePropertiesWindowAcquisition.setStoppingRuleTime(options);
    */
    
    // set worksheet to display during acquisition
    options = { WorksheetToDisplayDuringAcquisition: 'Worksheet_001' } ;        
    tubePropertiesWindowAcquisition.setWorksheetToDisplayDuringAcquisition(options);    
    
    // set Storage Gate
    options = { StorageGate: 'All Events' } ;        
    tubePropertiesWindowAcquisition.setStorageGate(options);      
        
        
   aqUtils.Delay(MY_DELAY_SHORT);
   
   tubePropertiesWindow.closeTubePropertiesWindow( );
   aqUtils.Delay(MY_DELAY_SHORT);
}