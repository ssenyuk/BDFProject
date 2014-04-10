//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_Form

var FSUserManagement = BaseWindow.extend({
    FrameworkClassName: "FSUserManagement", 
    TabControl: null,
    ImportButton: null,
    ExportButton: null,
    CreateUserButton: null,
    Form: null,
    
    refresh: function(){
        if (this._super){
            this._super();             
        }
        
        this.Mapper.map([
            { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 5 },
            { Name: "ImportButton", NativeClrObject: "ImportButton", ClassType: WPFButton, Depth: 10 },
            { Name: "ExportButton", NativeClrObject: "ExportButton", ClassType: WPFButton, Depth: 10 },
            { Name: "CreateUserButton", NativeClrObject: "CreateUserButton", ClassType: WPFButton, Depth: 30 }
            //{ Name: "Form", ClrClassName: "UserDetailsView", ClassType: FSForm, Depth: 10 }            
        ]);    
    },
    
    mapForm: function(){
        this.Mapper.map([
            { Name: "Form", ClrClassName: "UserDetailsView", ClassType: FSForm, Depth: 10 }            
        ]);        
    },
    
    log: function(){
        this._super(); 
        this.Form.log(); 
    }

}); 