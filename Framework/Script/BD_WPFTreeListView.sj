//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFTreeListItem

/**
 * Contains object that encapsulates a custom TreeList control
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTreeListView = WPFElement.extend({
    FrameworkClassName: "WPFTreeListView",
    ErrorType: WPFTreeListViewError,
    AllowedClassNames: ["BD.FACSuite.CustomControls.TreeListView"],
    Items: [],
    
    refresh: function(){
        if (this._super){
            this._super(); 
        }
        
        var options = {
            TreeListView: this    
        }; 
        
        this.Mapper.map([
            { Name: "Items", 
              ClrClassName: "TreeListItem", 
              ClassType: WPFTreeListItem, 
              IsCollection: true, 
              Options: options, 
              Depth: 10 }
        ]); 
    },
    
   item: function(options){
        if (options){
            if (options.Text){
                if (this.Items.length > 0){
                    for(var prop in this.Items){
                        if (this.Items[prop].Text === options.Text){
                            return this.Items[prop];      
                        }
                    }
                }
            }
        }
        return null; 
    },
    
    logContents: function(){
        var titleFormat =  "%s(%i)";     
        
        this._super(); 
        
        Log.AppendFolder(aqString.Format(titleFormat, StatusMessages.Items, this.Items.length));
        
        try{
            for(var prop in this.Items){
                this.Items[prop].log(); 
            }
        } finally {
            Log.PopLogFolder(); 
        }
    }
})