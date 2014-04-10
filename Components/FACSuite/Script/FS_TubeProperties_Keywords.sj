//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_TubeProperties

/**
 * Description: class for the keyword tab of the Tube Properties window 
 * 
 * @author Ken Johnson
 * @company BD Biosciences
 * @Date: 2/12/2014
 */

var FSTubePropertiesKeywords = FSTubeProperties.extend({

    ShowAllKeywords: null, 
    
    init: function(options){
        this._super(options);
        
        this.Mapper.map([          
          
            { Name: "ShowAllKeywords", NativeClrObject: "tubepropKWShowAllKW_chkBox", ClassType: WPFCheckbox, Depth: 20 }
        ]);
    },
    
// Todo: Add more methods later

// checkShowAllKeywords and uncheckShowAllKeywords  simply 
// check and uncheck the "Show All Keywords" checkbox at the
// top of the page
checkShowAllKeywords: function( ) {
    
   this.ShowAllKeywords.check(  );    
   return this;
},

uncheckShowAllKeywords: function( ) {
    
   this.ShowAllKeywords.uncheck(  );    
   return this;
}  
       
}); 