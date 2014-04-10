//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_WorklistView

var FSWorklistPanelTasks = FSWorklistView.extend({

    DisplayItemPrefixTextBoxBox: null,
    NumberTextBox: null,
  

    init: function(options){
        this._super(options);
        
        
       this.Mapper.map([
                       
            { Name: "SampleIDPrefixTextBox", NativeClrObject: "DisplayItemPrefixTextBox", ClassType: WPFTextBox, Depth: 10 },          
            { Name: "NumberTextBox", NativeClrObject: "DisplayItemNumberTextBox", ClassType: WPFTextBox, Depth: 10 },
            { Name: "AddWorkItemButton", NativeClrObject: "AddWorkItemButton", ClassType: WPFButton, Depth: 10 }         
            
        ]);     
          
      
    },
   
    setSampleIDPrefix: function( options) {
    
       ErrorType: ClassError
    /*
       if ( this.SampleIDPrefixTextBox.Visible === false) {
          this.error(ErrorMessages.WlTaskPanelSampleIDNotVisible);
          return;
       }
       
       if ( this.SampleIDPrefixTextBox.Enabled === false) {
          this.error(ErrorMessages.WlTaskPanelSampleIDNotEnabled);
          return;
       }
       */
       if (options){
          this.SampleIDPrefixTextBox.text( options.sampleIDPrefix);
          return;
       } 
       return;
    },
    setNumber: function( options) {
       if (options){
          this.NumberTextBox.text( options.number);
       } 
    },
    addWorkItemButton: function( ) {
      // if (options){
          this.AddWorkItemButton.click();
      // } 
    }

}); 