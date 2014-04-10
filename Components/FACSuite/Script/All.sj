//USEUNIT TestAppOnError
//USEUNIT TestGridAndChart
//USEUNIT TestLeftHandNav
//USEUNIT TestListView
//USEUNIT TestLogin
//USEUNIT TestLoginButtons
//USEUNIT TestMenuDisabledItem
//USEUNIT TestMenuHelpAbout
//USEUNIT TestMessageBar
//USEUNIT TestNavAndMenu
//USEUNIT TestPopupMenu
//USEUNIT TestPreferences
//USEUNIT TestUserManagement
//USEUNIT TestDataDriven

function test(){
    for(var i = 0; i < 100; i++){
        Log.Message("Iteration " + i.toString()); 
        testSuccess();    
    }
}


// these tests should run without error
function testSuccess(){
      
    var tests = {
        TestLogin: TestLogin.test,
        TestLoginButtons: TestLoginButtons.test,
        TestDataDriven: TestDataDriven.test,        
        TestNavAndMenu: TestNavAndMenu.test,
        TestGridAndChart: TestGridAndChart.test,
        TestLeftHandNav: TestLeftHandNav.test, 
        TestListView: TestListView.test, 
        TestMenuHelpAbout: TestMenuHelpAbout.test,
        TestMessageBar: TestMessageBar.test,
        TestPreferences: TestPreferences.test, 
        TestUserManagement: TestUserManagement.test
    }; 
    
    //Indicator.Hide(); 
    
    for(var prop in tests){
        var test = tests[prop]; 
        Log.Message("Running " + prop); 
        test(); 
    }
             
    //Indicator.Show();  
}

// These tests should generate errors. 
// You will need to examine the log to determine if
// they are generating the correct error.
function testErrorHandling(){
    Log.Message("This next test should generate an application error and then close unexpected popups"); 
    TestAppOnError.test();
    Log.Message("This next test should generate a WPFClickableError that Import is in an invalid state to click."); 
    TestMenuDisabledItem.test();
}