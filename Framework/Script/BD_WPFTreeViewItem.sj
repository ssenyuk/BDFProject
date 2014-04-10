//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFTextBlock
//USEUNIT BD_WPFHierarchyItemBase

/**
 * Contains object that encapsulates a treeview item
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTreeViewItem = WPFHierarchyItemBase.extend({
    FrameworkClassName: "WPFTreeViewItem",
    ErrorType: WPFTreeViewItemError,
    AllowedClassNames: [
        "System.Windows.Controls.TreeViewItem",
        "System.Windows.Controls.TreeView" // allow "root" element
    ],

    IsExpanded: false,
    
    refresh: function(){
        if (this._super){
            this._super(); 
        }

        if (this.TCObject.WaitProperty("IsExpanded", "*", 0)){
            this.IsExpanded = this.TCObject.IsExpanded; 
        }
        
        this._refreshText(); 
        
        return this; 
    },
  
    expand: function () {
        this.TCObject.IsExpanded = true;
        this.IsExpanded = this.TCObject.IsExpanded;
        // Refresh to make sure the item properties are 
        // in sync with the current state (visible or not)
        this.refresh();  
        return this;
    },
    
    collapse: function () {
        this.TCObject.IsExpanded = false;
        this.IsExpanded = this.TCObject.IsExpanded;  
        // Refresh to make sure the item properties are 
        // in sync with the current state (visible or not)
        this.refresh();  
        return this;
    },
    
    _refreshText: function(){
        var textBlocks = this.Finder.findAll({
            ClrClassName: "TextBlock",
            Depth: 5
        });
        
        var lines = [];
        for(var prop in textBlocks){
            var textBlock = textBlocks[prop].cast(WPFTextBlock); 
            lines.push(textBlock.Text); 
        }
        this.Text = lines.join();    
    }
})