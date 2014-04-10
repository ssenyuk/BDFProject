//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_WorklistView

var FSWorklistPanelEntryDetails = FSWorklistView.extend({

    AddWorksheetButton: null,
   
    init: function(options){
        this._super(options);
        
      try{  
       this.Mapper.map([
                       
           // { Name: "CurrentTubeComboBox", NativeClrObject: "CurrentTubeCombobox", ClassType: WPFComboBox, Depth: 10 },         
            { Name: "AddWorksheetButton", NativeClrObject: "AddWorksheetButton", ClassType: WPFButton, Depth: 20 }         
                                 
        ])     
       }catch ( e) {
         Log.Message("try failed in mapper");
         } ;  
      
    },
  /* 
    setCurrentTube: function( options) {
       if (options.currentTube){
          this.CurrentTubeComboBox.click({Text: options.currentTube});
       } 
    },
    */
    addWorksheet: function( options) {
       if (options){
          this.AddWorksheetButton.click();
       } 
    }

}); 