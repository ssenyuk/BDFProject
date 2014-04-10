//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes
/**
 * This Test is to get all "icons" in Toolbar that are available for selection in
 * worksheet. 
 * For this test, we are using the experiment workspace to access icons in toolbar
 *
 * @author Neda Sayan
 * @company BD Bio Scieneces
 * @Date : 1/22/2014
 */
function test(){
    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually Expermint workspace | Experiment_001",
        TestFunction: function(window){
            var ddoctrls = window
                .Finder
                .findAll({ClrClassName: "DDORadioButton", Depth: 50}); 
           
            if (ddoctrls && ddoctrls.length > 0){
            
                // iterate through all buttons, select them. Log each button as you go
                for(var prop in ddoctrls){
                    var ddord = ddoctrls[prop].cast(WPFDDORadioButton); 
                    if (ddord.Enabled && ddord.Visible){
                        ddord.click();
                        ddord.log();                   
                    }//if
                }//for
                
            } else {
                this.error("DDORadioButtons not found"); 
            }     
        }
    }).run();
}