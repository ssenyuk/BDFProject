//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSPreferences = BaseWindow.extend({
    TabControl: null,
    
    init: function(options){
        this._super(options);
        
        this.Mapper.map([
            { Name: "TabControl", ClrClassName: "SortedItemsControl", ClassType: WPFTabControl, Depth: 5 }
        ]);
    }
}); 