//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_Properties

/**
 * Description:  base class for the Tube Properties window
 *
 * @author Ken Johnson
 * @company BD Biosciences
 * @Date: 2/12/2014
 */
 
var FSTubeProperties = BaseWindow.extend({
    
    TabControl: null, 
    OkButton: null,
     
    init: function(options){
        this._super(options);   
        this.Mapper.map([
            { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 5 },  
            { Name: "OKButton", NativeClrObject: "OkButton", ClassType: WPFButton, Depth: 10 }
                      
        ]);
        
    },

closeTubePropertiesWindow: function( ) {
   this.OkButton.click();
   return this;
}

}); 
