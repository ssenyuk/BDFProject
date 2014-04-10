//USEUNIT BD_WPFClickable

/**
 * Contains object that encapsulates a workspace tab item
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFWorkspaceTabItem = WPFClickable.extend({ 
    FrameworkClassName: "WPFWorkspaceTabItem",
    ErrorType: WPFWorkspaceTabItemError,
    AllowedClassNames: ["BD.FACSuite.CustomControls.WorkspaceTabItem"],    
    
    init: function(options){
        this._super(options);
        
        if (this.TCObject.HasContent && 
            this.TCObject.Content.DataContext && 
            this.TCObject.Content.DataContext.Header){
            this.Text = this.TCObject.Content.DataContext.Header.OleValue;
            this.Name = aqString.Replace(this.Text, " ", ""); 
        }        
    }
})