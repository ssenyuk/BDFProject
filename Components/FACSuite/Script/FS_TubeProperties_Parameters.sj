//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_TubeProperties

/**
 * Description: class for the parameters tab of the Tube Properties window 
 * 
 * @author Ken Johnson
 * @company BD Biosciences
 * @Date: 2/12/2014
 */

var FSTubePropertiesParameters = FSTubeProperties.extend({

    init: function(options){
        this._super(options);
        
        this.Mapper.map([          
            { Name: "ParametersListView", NativeClrObject: "ParametersListView", ClassType: WPFListView, Depth: 20 }, 
            { Name: "AddParameterButton", NativeClrObject: "AddParameterButton", ClassType: WPFButton, Depth: 20 },                
            { Name: "DeleteParameterButton", NativeClrObject: "DeleteParameterButton", ClassType: WPFButton, Depth: 20 }
        ]);
    },
    
// Todo: Add more methods later

/**
Description:  selects the list view item name
parameters:  
    options.Name - name of the list view item you want to click
example call:
   options = { Name: 'FSC' } ;        
   tubePropertiesWindowParameters.selectListView(options);  
*/ 
selectListView: function(options) {
   if (options){
      this.ParametersListView.click( options );    
   }
   return this;
},

addParameter: function() {
   this.AddParameterButton.click();
   return this;
},
  
removeParameter: function() {
   this.DeleteParameterButton.click();
   return this;
}   
       
}); 