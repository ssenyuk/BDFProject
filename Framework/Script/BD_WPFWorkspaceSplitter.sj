//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement

/**
 * Contains object that encapsulates the custom splitter control.
 * 
 * Notes: Top and Left options can be positive or negative where positive  
 * Top values move down and negative values up.
 * Positive Left values move rightward and negative values leftward.
 * Top and Left values may exceed the dimensions of the screen. The 
 * splitter will drag as far as it can go and then stop. 
 * Both Top and Left values can be changed in either Vertical or Horizontal
 * orientation. In this case the mouse cursor drags to the specified point but only 
 * effects the relevant dimension. 
 * 
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFWorkspaceSplitter = WPFElement.extend({
    FrameworkClassName: "WPFWorkspaceSplitter",
    ErrorType: WPFWorkspaceSplitterError,
    AllowedClassNames: ["BD.FACSuite.CustomControls.Panels.WorkspaceSplitter"],
    Orientation: null,
    
    init: function(options){
        this._super(options);
        this.Orientation = this.TCObject.Orientation.OleValue; 
        this.Name = "WorkspaceSplitter"; 
    },
    
    position: function(options){
        // Note: startX and startY must be non-zero values or generate
        // errors because the location is off-screen and TestComplete cannot
        // locate the object.
        var startX = 1, 
            startY = 1, 
            endX  = 0, 
            endY = 0; 
            
        if (options){
            if (options.Left){
                endX = options.Left;
            }
            if (options.Top){
                endY = options.Top;
            }
        }
        this.TCObject.Drag(startX, startY, endX, endY);
    }
})