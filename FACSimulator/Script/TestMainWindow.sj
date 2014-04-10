//USEUNIT FSim_FACSimulator

function test(){
    var app = new FACSimulator()
        .run();
    
    var mainRegion = app.MainWindow.Shell;     
    mainRegion.select({Text: "Fluidics"});
    mainRegion.select({Text: "Optics"});
    mainRegion.select({Text: "Sim Data"});
    mainRegion.select({Text: "Loader"});
    mainRegion.select({Text: "Instrument"});
    mainRegion.select({Text: "FCS Data"});
    var fcsData = mainRegion.Current; 
    fcsData.LoadFileButton.click();
    var path = "c:\\myfile.fcs"; 
    var openDialog = app
        .waitForWindow({Text: "Open"})
        .cast(OpenFileDialog);
        
    openDialog
        .openFile(path); 
        
    fcsData.log(); 
}