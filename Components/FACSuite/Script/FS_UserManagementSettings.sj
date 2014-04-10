//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_UserManagement

/**
 * Description: class for the Settings tab of the UserManagement window 
 */

var FSUserManagementSettings = BaseWindow.extend({
 
     init: function(options){
        this._super(options);
        
        this.Mapper.map([          
             { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 10 }
        ]);
    }
 
 
}); 