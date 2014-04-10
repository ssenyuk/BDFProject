//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSFCSFileView = WPFElement.extend({
    FileTextBlock: null,
    LoadFileButton: null,
    init: function(options){
        this._super(options); 
        
        this.Mapper.map([
            { Name: "FileTextBlock", NativeClrObject: "FileTextBlock", ClassType: WPFTextBlock, Depth: 5 },
            { Name: "LoadFileButton", NativeClrObject: "LoadFileButton", ClassType: WPFButton, Depth: 5 }
        ]);        
    }
});