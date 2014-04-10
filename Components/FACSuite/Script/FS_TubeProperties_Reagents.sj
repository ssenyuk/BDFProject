//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_TubeProperties

/**
 * Description: class for the reagents tab of the Tube Properties window 
 * 
 * @author Ken Johnson
 * @company BD Biosciences
 * @Date: 2/12/2014
 */

var FSTubePropertiesReagents = FSTubeProperties.extend({
 
    init: function(options){
        this._super(options);
        
        this.Mapper.map([          
            { Name: "ReagentsListView", NativeClrObject: "tubepropReagentListView", ClassType: WPFListView, Depth: 20 }         
        ]);
      
    },
/**
Description:  selects the list view item name
parameters:  
    options.Name - name of the list view item you want to click
example call:
   options = { Name: 'FITC' } ;        
   tubePropertiesWindowReagents.selectListView(options);  
*/  
    selectListView: function(options) {
       if (options){
          this.ReagentsListView.click( options );    
       }
       return this;
    }

}); 