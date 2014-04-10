//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_Form

var FSPlotEditor = BaseWindow.extend({
    TabControl: null,
      
    init: function(options){
        this._super(options);
        
        this.Mapper.map([
            { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 5 }                
        ]);
    }
}); 

//var FSPlotEditor = BaseWindow.extend({
//    TabControl: null,
//      
//    init: function(options){
//        this._super(options);
//        
//        this.Mapper.map([
//            { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 5 }                
//        ]);
//    },
//    /* @description This function will be used for selected tab in this window.
//    * @param {String} <name> this parameter is name tab.
//    */  
//    _selectTab: function(name)
//    {
//      this.TabControl.click({Text:name});
//    },
//     /* @description This function will be used for selected 'General' tab in this window.
//    */  
//    selectGeneralTab: function()
//    {
//      this._selectTab("General");
//    },
//      /* @description This function will be used for selected 'Parameters' tab in this window.
//    */  
//    selectParametersTab: function()
//    {
//      this._selectTab("Parameters");
//    }
//}); 