//USEUNIT FS_FACSuite
//USEUNIT FS_PlotEditor
//USEUNIT FS_PlotEditorGeneral
//USEUNIT FS_PlotEditorParameters
//USEUNIT FS_PlotEditorDisplay
//USEUNIT BD_WPFConfirmationWindow

function test(){
var MY_DELAY_SHORT = 1000;
var MY_DELAY_LONG = 1000;

   aqUtils.Delay(1000);
   Sys.Keys("[F4]");
   aqUtils.Delay(700);


    var app = new FACSuite()
        .run();
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
    var plotEditorWindow = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditor);
     aqUtils.Delay(5000);
    // Go through the tabs
           
   // plotEditorWindow
   //     .TabControl
    //    .click({Text: "General"}); 
        
  //  plotEditorWindow
   //     .TabControl
   //     .click({Text: "Parameters"});  
  
    // GENERAL TAB
    
    // get on the general tab
    plotEditorWindow
        .TabControl
        .click({Text: "General"});
     
    // get general tab object    
    var plotEditorWindowGeneral = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditorGeneral);  
    
    aqUtils.Delay(2000);
    //set plot type        
    plotEditorWindowGeneral.setPlotType({
  //     PlotType: 'DotPlot2D' 
         PlotType: 'ContourPlot2D'       
    });
     
    
    // set tube   
     plotEditorWindowGeneral.setTube({
       Tube: 'Tube_003'      
    }); 
    
    // check sample tube 
 //    plotEditorWindowGeneral.setSampleCheckbox({
 //      check: 'true'      
 //   });
     
   // var  res = plotEditorWindowGeneral.setPlotTitleContentSample();
    
     // check sample tube 
  //  plotEditorWindowGeneral.setTubeCheckbox({
  //     check: 'true'      
  //  }); 
         
    // PARAMETERS TAB  
    
    plotEditorWindow
        .TabControl
        .click({Text: "Parameters"});  
     
    var plotEditorWindowParameters = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditorParameters);  
    
    aqUtils.Delay(MY_DELAY_SHORT);        
    plotEditorWindowParameters.setXParamName({
       XParamName: 'FITC-A'      
    }); 
       
    aqUtils.Delay(MY_DELAY_SHORT);    
    plotEditorWindowParameters.setXParamScale({
       XParamScale: 'BiExponential'      
    });                
    
    aqUtils.Delay(MY_DELAY_SHORT);
    plotEditorWindowParameters.setYParamName({
       YParamName: 'FITC-A'      
    });    
    
    aqUtils.Delay(MY_DELAY_SHORT);    
    plotEditorWindowParameters.setYParamScale({
       YParamScale: 'BiExponential'      
    });
    
    aqUtils.Delay(MY_DELAY_SHORT);
      
    var plotEditorWindowParameters = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditorParameters);  
    
    aqUtils.Delay(MY_DELAY_SHORT);
    plotEditorWindowParameters.setXRFactor({
       XRFactor:  7    
    });
    
    aqUtils.Delay(MY_DELAY_SHORT); 
    plotEditorWindowParameters.setYRFactor({
       YRFactor:  12    
    });
    /*
    aqUtils.Delay(MY_DELAY_SHORT);
    plotEditorWindowParameters.setAutomaticScaling( );    
    */
    
    
    //DISPLAY TAB
    aqUtils.Delay(MY_DELAY_SHORT);
      // get on the general tab
    plotEditorWindow
        .TabControl
        .click({Text: "Display"});
    aqUtils.Delay(MY_DELAY_SHORT); 
    // get general tab object    
    var plotEditorWindowDisplay = app
        .waitForWindow({Text: "Plot Editor"})
        .cast(FSPlotEditorDisplay);    
   
    
    // size panel     
    for (i =0; i < 3; i++) {
    plotEditorWindowDisplay.setSizeInPixels( ); 
    aqUtils.Delay(MY_DELAY_SHORT);
    plotEditorWindowDisplay.setSizeInInches( );
    aqUtils.Delay(MY_DELAY_SHORT); 
    }
    
    plotEditorWindowDisplay.setSizeWidth({ sizeWidth: 1.0});
    plotEditorWindowDisplay.setSizeHeight({ sizeHeight: 1.0});
        
    //Grid & Outline    
    for (i =0; i < 3; i++) {
    plotEditorWindowDisplay.setGridOutlineToFull( ); 
    aqUtils.Delay(MY_DELAY_SHORT);
    plotEditorWindowDisplay.setGridOutlineToHalf( );
    aqUtils.Delay(MY_DELAY_SHORT); 
    }
    
    plotEditorWindowDisplay.setShowLogScaleGridLines();
    
    // fonts 
    options = { titleFontFamily: "Vladimir Script", titleFontSize: '14', tickLabelFontSize: '10', axisLabelFontSize: '18' };    
    plotEditorWindowDisplay.setTitleFontFamily(options);
    plotEditorWindowDisplay.setTitleFontSize(options);
    plotEditorWindowDisplay.setTickLabelFontSize(options);
    plotEditorWindowDisplay.setAxisLabelFontSize(options);
   
    for (i =0; i < 3; i++) {  
       plotEditorWindowDisplay.setTitleToInvisible();
       aqUtils.Delay(MY_DELAY_SHORT);
       plotEditorWindowDisplay.setTitleToVisible();
       aqUtils.Delay(MY_DELAY_SHORT);
    }
    
    for (i =0; i < 3; i++) {  
       plotEditorWindowDisplay.setAxisLabelsToInvisible();
       aqUtils.Delay(MY_DELAY_SHORT);
       plotEditorWindowDisplay.setAxisLabelsToVisible();
       aqUtils.Delay(MY_DELAY_SHORT);
    }
    // stop and see the changes
    aqUtils.Delay(3000);
    
    // Now set back to normal
    
    // size panel     
    plotEditorWindowDisplay.setSizeInInches( );
    aqUtils.Delay(MY_DELAY_SHORT); 
    
    plotEditorWindowDisplay.setSizeWidth({ sizeWidth: 2.083});
    plotEditorWindowDisplay.setSizeHeight({ sizeHeight: 2.083});
        
    //Grid & Outline    
    
    plotEditorWindowDisplay.setGridOutlineToFull( );    
    plotEditorWindowDisplay.setShowLogScaleGridLines();
    
    // fonts 
    options = { titleFontFamily: "Segoe UI", titleFontSize: '10', tickLabelFontSize: '7', axisLabelFontSize: '9' };    
    plotEditorWindowDisplay.setTitleFontFamily(options);
    plotEditorWindowDisplay.setTitleFontSize(options);
    plotEditorWindowDisplay.setTickLabelFontSize(options);
    plotEditorWindowDisplay.setAxisLabelFontSize(options);
    
    plotEditorWindowDisplay.setTitleToVisible();
    plotEditorWindowDisplay.setAxisLabelsToVisible();
    // just a comment to test out tfs
    /*        

    // exit normally through the menu
    app.exitViaFileMenu(); 
    */
}