//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_TubeProperties

/**
 * Description: class for the compensation tab of the Tube Properties window 
 * 
 * @author Ken Johnson
 * @company BD Biosciences
 * @Date: 2/12/2014
 */

var FSTubePropertiesCompensation = FSTubeProperties.extend({
 
    init: function(options){
        this._super(options);
        
        this.Mapper.map([          
            { Name: "EnableCompensation", NativeClrObject: "tubepropCompViewEnableComp_chkBox", ClassType: WPFCheckbox, Depth: 20 },
            { Name: "OKButton", NativeClrObject: "OkButton", ClassType: WPFButton, Depth: 20 }       
        
        // Todo: fill in other controls later. 
 
        ]);
    },
 

checkEnableCompensation: function( ) {
    
   this.EnableCompensation.check(  );    
   return this;
},

uncheckEnableCompensation: function( ) {
    
   this.EnableCompensation.uncheck(  );    
   return this;
},

closeTubePropertiesWindow: function( ) {
    
   this.OKButton.click(  );    
   return this;
}

// Todo: Add other methods later.
}); 