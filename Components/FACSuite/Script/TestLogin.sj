//USEUNIT FS_FACSuite

function test(){
    var app = new FACSuite()
        .run()
        .log()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            }) 
        .log(); 
        
    // exit normally through the menu
    app.exitViaFileMenu();
}