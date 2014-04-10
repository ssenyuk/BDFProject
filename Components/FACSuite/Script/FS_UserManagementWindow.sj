//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_BaseWindow
//USEUNIT FS_UserManagementDepartments
//USEUNIT FS_UserManagementUsers
//USEUNIT FS_UserManagement

var FSUserManagementWindow = FSUserManagement.extend({  
   
   TabControl: null,
       
   init: function(options){
        this._super(options);
        this.Mapper.map([    
                { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 5 }    
        ]);
    },
   
   /* @description This function will be used to find tab in Tube Properties Window.
   * @param {String} <object> this parameter is type tab.
   */ 
   findTab: function(object){
      var tab = this.cast(object);
      return tab;
   },
    
   /* @description This function will be used for selected tab in this window.
   * @param {String} <name> this parameter is name tab.
   */  
   _selectTab: function(name){
      this.TabControl.click({Text:name});
   },
       
      /* @description This function will be used for selected 'Compensation' tab in this window.
   */  
   selectUsersTab: function(){
      this._selectTab("Users");
      var tab = this.findTab(FSUserManagementUsers);
      return tab;
   },
   
   selectDepartmentTab: function(){
      this._selectTab("Departments");
      var tab = this.findTab(FSUserManagementDepartments);
      return tab;
   },

   selectUsersTab: function(){
      this._selectTab("Users");
      var tab = this.findTab(FSUserManagementUsers);
      return tab;
   }

   
})