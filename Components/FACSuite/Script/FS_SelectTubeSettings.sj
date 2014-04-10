//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_TubeProperties


/**
 * Description:  class for the select tube settings window
 *
 * How it gets called.
 *    When you are on the tube properties window, general tab,
 *    next to tube settings, click the select button. 
 *
 * @author Ken Johnson
 * @company BD Biosciences
 * @Date: 2/12/2014
 */

var FSSelectTubeSettings = Element.extend({
 
    init: function(options){
        this._super(options);
        
        this.Mapper.map([          
            { Name: "CancelButton", NativeClrObject: "CancelButton", ClassType: WPFButton, Depth: 20 },       
            { Name: "OkButton", NativeClrObject: "OkButton", ClassType: WPFButton, Depth: 20 }
        // Todo: fill in other controls later. 
 
        ]);
    },
 
clickCancel: function( ) {
    
   this.CancelButton.click(  );    
   return this;
},

clickOk: function( ) {
    
   this.OkButton.click(  );    
   return this;
}
// Todo: Add other methods later.
      
}); 