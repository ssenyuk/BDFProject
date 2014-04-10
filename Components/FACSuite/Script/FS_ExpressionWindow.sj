//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_ExpressionForm

var FSExpressionWnd = BaseWindow.extend({
    FrameworkClassName: "FSExpressionWnd", 
    TabControl: null,
    name: null,
    result: null,
    prefix: null,
    suffix: null,
    expForm: null,
    //
    refresh: function(){
        if (this._super){
            this._super();             
        }
        
        // tabs in expression properties window
        this.Mapper.map([
            { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 15 }           
        ]);    
    },
    //
    mapExpForm: function(){
        this.Mapper.map([
            { Name: "expForm", NativeClrObject:"ExpressionPropertiesWindowControl", ClassType: FSExpressionForm, Depth: 10 }            
        ]);        
    },
    //
    log: function(){
        this._super(); 
        this.expForm.log(); 
    }
}); 