//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFClickable
//USEUNIT BD_WPFTextBlock
//USEUNIT BD_WPFTreeListRowExpander

/**
 * Contains object that encapsulates a custom tree list item
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTreeListItem = WPFClickable.extend({
    FrameworkClassName: "WPFTreeListItem",
    ErrorType: WPFTreeListItemError,
    AllowedClassNames: [
        "BD.FACSuite.CustomControls.TreeListItem"
    ],
    
    TreeListView: null,

    refresh: function(){
        if (this._super){
            this._super(); 
        } 

        this._refreshText();
        
        var expander = this.Finder.find({
            ClrClassName: "TreeListRowExpander",
            Depth: 5
        });
        
        if (expander){
            this["Expander"] = expander.cast(WPFTreeListRowExpander); 
        }
        
        return this; 
    },
    
    // TODO -cFramework -oNoel  : revisit the issue of toggle state.
    // Try adding the component to the open applications composite components list. 
    // Also check private fields for state information. 
    toggleExpand: function(){
        if (this.Expander){
            this.Expander.click(); 
            this.TreeListView.refresh(); 
        } 
        return this; 
    },
    
    // private methods
        
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