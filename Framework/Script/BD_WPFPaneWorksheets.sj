//USEUNIT BD_WPFClickable
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates a custom pane worksheet 
 *
 * @author Neda Sayan
 * @company BD Biosciences
 * @Date: 1/25/2014
 */

var WPFPaneWorksheets = WPFElement.extend({
    FrameworkClassName: "WPFPaneWorksheets",
    ErrorType: WPFPaneWorksheetsError, 
    AllowedClassNames: ["BD.FACSuite.CustomControls.Panels.WorkspacePane"],
    
    Parent: null,
    Pane: null,
    paneWidth: null,
    pageWidth: null,
    
    
    init: function(options){
        this._super(options);
        //
        this.Name = "paneWorksheets"; 
        this.Parent = this.TCObject.parent;
        this.Pane = this.TCObject.parent;
        this.paneWidth = this.TCObject.Width;
////////        this.pageWidth = this.Pane.PageSize.Width;
    }
})