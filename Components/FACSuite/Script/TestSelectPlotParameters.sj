//USEUNIT FS_FACSuite
//USEUNIT FS_SelectPlotParameters
//USEUNIT BD_WPFConfirmationWindow

function test(){
var MY_DELAY_SHORT = 1000;
var MY_DELAY_LONG = 1000;

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
    var selectPlotParametersWindow = app
        .waitForWindow({Text: "Select Plot Parameters"})
        .cast(FSSelectPlotParameters);
        
     aqUtils.Delay(5000);
    // Go through the tabs
           
   
    aqUtils.Delay(2000);
    
    selectPlotParametersWindow.checkShortNames();
    
   // options = { XParam: 'FSC', YParam: 'PECy7' };
    selectPlotParametersWindow.selectParameters(options);
    // select a parameter
   // options = { param: 'FSC', param2: 'PE' };        
   // selectPlotParametersWindow.clickParameter( options );
   // options = { param: 'SSC' };        
   // selectPlotParametersWindow.clickParameter( options );      

}