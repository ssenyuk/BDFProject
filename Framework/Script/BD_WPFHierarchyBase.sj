//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement

/**
 * Contains object that encapsulates a hierarchical control
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFHierarchyBase = WPFElement.extend({
    FrameworkClassName: "WPFHierarchyBase",
    ErrorType: WPFHierarchyBaseError,
    Items: null,
    ItemClrClassName: null,
    ItemType: null,

    init: function(options){
        this._super(options);  
        this.validatePropertyAssignments(["ItemClrClassName", "ItemType"], "init");  
    },    
  
    refresh: function(){
        if (this._super){
            this._super(); 
        }
        
        // Get the root item. This is the starting point
        // to get all the items in the hierarchy, but root
        // has no data of its own.
        var root = new this.ItemType({
            App: this.App,
            TCObject: this.TCObject,
            Finder: this.Finder,
            Text: "Root",
            ItemClrClassName: this.ItemClrClassName,
            ItemType: this.ItemType,
            Level: 0
        });
        
        this.Items = root.Items; 
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
    
    logStart: function(){
        Log.AppendFolder(this.ClrClassName + " " + this.Name);
    },
    
    logContents: function(){
        Log.AppendFolder("Items"); 
        try {
            for(var prop in this.Items){
                this.Items[prop].log();
            }
        } finally {
            Log.PopLogFolder(); 
        }             
    }  
})