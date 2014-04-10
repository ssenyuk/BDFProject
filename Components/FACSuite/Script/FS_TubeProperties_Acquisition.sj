//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_TubeProperties


/**
 * Description:  class for the acquisition tab of the Tube Properties window
 * 
 * @author Ken Johnson
 * @company BD Biosciences
 * @Date: 2/12/2014
 */


var FSTubePropertiesAcquisition = FSTubeProperties.extend({
    
    WorksheetToDisplayDuringAcquisition: null, 
    StorageGate: null,
     
    init: function(options){
        this._super(options);
        
        this.Mapper.map([
            { Name: "WorksheetToDisplayDuringAcquisition", NativeClrObject: "Combo_AcquisitionWorksheets", ClassType: WPFComboBox, Depth: 20 },
            { Name: "StorageGate", NativeClrObject: "Combo_StorageGates", ClassType: WPFComboBox, Depth: 20 } 
            /* hold off for now, we need editable combo box. 
            { Name: "StoppingRuleTimeTextBox", NativeClrObject: "StoppingRuleTimeTextBox", ClassType: WPFComboBox, Depth: 20 }
             */           
        ]); 
        
       
    },
    
setWorksheetToDisplayDuringAcquisition: function(options) {
   if (options.WorksheetToDisplayDuringAcquisition){
      this.WorksheetToDisplayDuringAcquisition.click({Text: options.WorksheetToDisplayDuringAcquisition});
    
   }
   return this;
},
setStorageGate: function(options) {
   if (options.StorageGate){
      this.StorageGate.click({Text: options.StorageGate});
    
   }
   return this;
}
/* HOLD OFF FOR NOW. we need editable combo box
setStoppingRuleTime: function(options) {
   if (options.StoppingRuleTime){
      this.StoppingRuleTimeTextBox.click({Text: options.StoppingRuleTime});   
   }
   return this;
}
*/


}); 