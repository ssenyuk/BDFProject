//USEUNIT FS_FACSuite

function test(){
    var app = new FACSuite(); 
    app.run();
    app.login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            });
    app.logout(); 
    app.login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            });        
}