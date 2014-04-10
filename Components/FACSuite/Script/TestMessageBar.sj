//USEUNIT FS_FACSuite

function test(){
    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            }); 
                
    var messageBar = app
        .MainWindow
        .MessageBar;
    
    messageBar.log();   
        
    var messages = messageBar.Messages; 
    for(var prop in messages){
        if (messages[prop].IconType === "Warning"){
            messages[prop].log(); 
        }
    }
    
    messageBar.getCurrentMessage().log(); 
    messageBar.moveToNextMessage(); 
    messageBar.getCurrentMessage().log(); 
    messageBar.moveToPreviousMessage();
    messageBar.getCurrentMessage().log(); 
        
    // exit normally through the menu
    app.exitViaFileMenu();      
}