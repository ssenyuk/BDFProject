//USEUNIT FS_FACSuite
//USEUNIT FS_ExpressionWindow

function test(){

    var app = new FACSuite()
        .run()
        .login({
            UserName: 'BDAdministrator', 
            Password: 'bdadministrator'
            });  
                     
    var workspaces = app
        .MainWindow
        .Workspaces;
               
    // select a navigation icon from the left hand toolbar     
    workspaces.select({Text: "Experiments"});
    //
    var workspace = workspaces.Current;
    
    // select the manage tab
    workspace.select({Text: "Manage Experiments"});             
    
    // create the experiment 001 tab
    workspace
        .Current
        .ExperimentsListView.doubleClick({Name: "Experiment_001"}); 
        
    // select the experiment 001 tab that has been created
    workspace.select({Text: "Experiment_001"});    

    //  
    workspace.Current.CreateNewExpression();
    // 
    //
    var expWnd = app
        .waitForWindow({Text: "Expression Properties"})
        .cast(FSExpressionWnd);
    //
    expWnd.mapExpForm();
    
    //access data and fields in exp tab 
    expWnd.expForm.updateForm({name: 'Neda Sayan',
                              prefix: 'neda - prefix',
                              suffix: 'neda - suffix',
                              expressionEditor: 'ab+cd=def',
                              decplaces:"4",
                              comments: 'Neda has no comments at this time'
                              }); 
      //                        
      Delay(5000);
      expWnd.close();     

///    app.exitViaFileMenu(); 
}