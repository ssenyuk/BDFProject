//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes
/**
 * This function is a unit test for testing following control wrappers :
 *              BD_WPFPaneWorksheets
 *              BD_WPFWorksheetTabControl
 *              BD_WPFWorksheetTabItem
 * 
 * For this test, we are using the experiment workspace. You need to make sure in Experiment_001
 * you have multiple 
 *
 * @author Neda Sayan
 * @company BD Bio Scieneces
 * @Date : 1/26/2014
 */
 //*********************************************************************************
// history:
//   0  <Date>             <Name>           <CHANGES MADE>
//   1  01-26-2014         NSayan               Created
//   2  01-31-2014         NSayan           check for specific worksheet name
//*********************************************************************************
function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually Expermint workspace | Experiment_001",
        TestFunction: function(window){ 
                
            var element = window
                .Finder
                .find({NativeClrObject : "paneWorksheets", Depth: 30}); 
                
            var paneworksheets = element
                .cast(WPFPaneWorksheets); 
                
            var pane = paneworksheets.Parent;
            var width = paneworksheets.paneWidth;
            
            paneworksheets.log(); 
            
            //worksheet tabs
             var wstabctrls = paneworksheets
                .Finder
                .find({NativeClrObject : "WorksheetTabControl", Depth: 30});    
             
             var  tabCtrl = wstabctrls.cast(WPFWorksheetTabControl);      
             tabCtrl.log();  
             
             var tabs = tabCtrl
                .Finder
                .findAll({clrClassName: "TabItem"});
             //
             if( tabs.length > 0 ){
                 for ( var ii=0; ii < tabs.length; ii++){
                     var wstab = tabs[ii].cast(WPFWorksheetTabItem);
                     if( wstab.Enabled && wstab.Visible){ 
                        wstab.click();
                        wstab.log();
                        wstab.getWorksheetTabName();
                        if( wstab.Name === "Worksheet_002" ){
                           Log.Message(" >> Tab Name = "+wstab.Name);
                        }
                    }
                    
                 }//for
             }   
    
        }
    }).run();
}//end of test