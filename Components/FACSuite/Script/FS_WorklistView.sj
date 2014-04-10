//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSWorklistView = WPFElement.extend({
//var FSWorklistView = WPFWorkspacePane.extend({
 
    Name: "WorklistView",
    AcqPane: null,
    
    init: function(options){
       
        this._super(options);
       // this.Mapper.map([
          //  { Name: "AcqPane", NativeClrObject: "AcquisitionWorkspacePane", ClassType: WPFWorkspacePane, Depth: 30 }
       // ]);

        this.refresh();   
    },
    
    dosomething: function () {
       pane = this.AcqPane.cast(WPFWorkspacePane);
       pane.refresh();
    },
    refresh: function(){
        
        if (this._super){
            this._super(); 
        }
                      
    },
    
   
    
    logStart: function(){
        Log.AppendFolder("WorklistView"); 
    }
});