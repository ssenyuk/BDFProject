//USEUNIT FS_FACSuite

function test(){
    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            }); 

    new WPFTextBoxError({
            App: app,
            Message: "WPFTextBoxError thrown by TestErrorCategorization unit test."
        }); 
    
    // exit normally through the menu
    app.exitViaFileMenu(); 
}