//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFClickable

/**
 * Base object that models an item in a hierarchy, 
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFHierarchyItemBase = WPFClickable.extend({
    FrameworkClassName: "WPFHierarchyItemBase",
    ErrorType: WPFHierarchyItemBaseError,
    Items: null,
    Level: 0,
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
        
        this.Items = [];
        
        var items = this.Finder.findAll({
            Duration: 500,
            ClrClassName: this.ItemClrClassName,
            Depth: 5
        }); 
        
        var options = {
            ItemClrClassName: this.ItemClrClassName,
            ItemType: this.ItemType,
            Level: this.Level + 1  
        }; 
        
        for(var prop in items){
            var item = items[prop].cast(this.ItemType, options);
            this.addItem(item);  
        }    
        
        return this; 
    },
    
    // override this method to control the item being added
    addItem: function(item){
        this.Items.push(item); 
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
        this._super();
        
        if (this.Items.length > 0){
            Log.AppendFolder("Items"); 
            try{
                for(var prop in this.Items){
                    var item = this.Items[prop];
                    item.log();
                }
            } finally {
                Log.PopLogFolder();         
            } 
        }
    }
})