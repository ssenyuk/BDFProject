//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_TubeProperties

/**
 * Description: class for the general tab of the Tube Properties window 
 * 
 * @author Ken Johnson
 * @company BD Biosciences
 * @Date: 2/12/2014
 */
 
var FSTubePropertiesGeneral = FSTubeProperties.extend({
    
    TubeName: null, 
    TubeId: null,
    SampleID: null,
    SelectTubeSettingsButton: null,
    
    init: function(options){
        this._super(options);
        
        this.Mapper.map([
            { Name: "TubeName", NativeClrObject: "TubeNameTextBox", ClassType: WPFTextBox, Depth: 20 },
            { Name: "TubeId", NativeClrObject: "TubeIdTextBox", ClassType: WPFTextBox, Depth: 20 },
            { Name: "SampleID", NativeClrObject: "SampleIDTextBox", ClassType: WPFTextBox, Depth: 20 },
            { Name: "SelectTubeSettingsButton", NativeClrObject: "SelectTubeSettingsButton", ClassType: WPFButton , Depth: 20 }
                           
        ]); 
        
       
    },
/*
 Sample calls to the following methods.
 See TestTubeProperties file for the actual call   
   tubePropertiesWindowGeneral.setTubeName( { TubeName: 'Tube_001'} );
   tubePropertiesWindowGeneral.setTubeId( { TubeId: 'KenTube12345'} );
   tubePropertiesWindowGeneral.setSampleID( { SampleID: 'sample123'} ); 
   
*/
setTubeName: function(options) {
    
   if (options.TubeName){
      this.TubeName.text(options.TubeName);
   }  
      
   return this;
   
},

setTubeId: function(options) {
 
   if (options.TubeId){
      this.TubeId.text(options.TubeId);
   } 
    
   return this;
},

setSampleID: function(options) {
 
   if (options.SampleID){
      this.SampleID.text(options.SampleID);
   } 
    
   return this;
},
selectTubeSettingsButton: function() {
   this.SelectTubeSettingsButton.click();
   return this;
}

}); 