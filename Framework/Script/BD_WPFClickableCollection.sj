//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_TestCompleteBase
//USEUNIT BD_WPFClickable
//USEUNIT BD_Element

/**
 * Contains object that encapsulates a series of clickable WPF elements that can be selected. 
 * This class is not used directly. Instead, inherit from this class and define 
 * the ItemClrClassName used to find each of the clickable items.
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFClickableCollection = Element.extend({
    FrameworkClassName: "WPFClickableCollection",
    ErrorType: WPFClickableCollectionError, 
    Items: {},
    // TestComplete ClrClassName
    ItemClrClassName: null,
    // Depth in TestComplete object tree to look for ItemClrClassName
    ItemDepth: this.DefaultSearchDepth,
    // Framework type to cast to 
    ItemType: null, 
    Selected: null,
    OnSelected: null,
    Count: 0,
    
    init: function(options){        
        this._super(options);
        this.validatePropertyAssignments(["ItemClrClassName", "ItemType"], "init"); 
        if (!this.ItemType instanceof WPFClickable){
            this.error(ErrorMessages.IncorrectType, "ItemType", WPFClickable); 
        }
        this.OnSelected = this.subscribe("OnSelected", options.OnSelected);
    },
       
    refresh: function(){
        if (this._super){
            this._super(); 
        }
    
        var elements = null; 
        
        this.Items = {};     
        
        if (this.ItemClrClassName){
            
            this.TCObject.Refresh(); 
            
            // get all items with the class name
            elements = this.Finder.findAll({
                ClrClassName: this.ItemClrClassName,
                Depth: this.ItemDepth
            })
            
            // number the items as they are added.
            this.Count = 0; 
            
            // cast each element to the item type
            if (elements){
                for(var prop in elements){
                    var item = elements[prop].cast(this.ItemType);
                    var name = item.Name != "" ? item.Name : item.Text;
                    item["Index"] = this.Count;
                    this.Count = this.Count + 1;                    
                    this.Items[name] = item;
                }    
            }
        }  
        return this;      
    },
    
    byIndex: function(options){
        if (options && (options.Index !== undefined)){
            var index = 0; 
            for(var prop in this.Items){
                if (options.Index == index){
                    return this.Items[prop]; 
                }
                index = index + 1; 
            }
        }  
    },
    
    click: function(options){
        this._select(options, "click"); 
        return this; 
    },
      
    doubleClick: function(options){
        this._select(options, "doubleClick"); 
        return this;  
    },
    
    logContents: function(){
        this._super();
        Log.AppendFolder("Items");
        try  { 
            for(var item in this.Items){
                this.Items[item].log();
            }
        } finally {
            Log.PopLogFolder(); 
        }
        
        return this; 
    },
    
    // private methods
    
    _select: function(options, operation){
        var text = "";
        
        this.Selected = null;
        
        this.wait({
            Description: "WPFClickableCollection _select()",
            WaitFunction: function(e){

                e.Subscriber.refresh();
                if (options ){
                    if (options.Name) {
                        e.Subscriber.Selected = e.Subscriber.Items[options.Name]; 
                    } else if (options.Text){
                        for(var item in e.Subscriber.Items){
                            if (e.Subscriber.Items[item].Text == options.Text){
                                e.Subscriber.Selected = e.Subscriber.Items[item];
                                break;
                            }
                        }
                    }
                }
                if (e.Subscriber.Selected){
                    e.Done = true;
                }
            },
            OnCompleted: function(e){
 
                if (operation && e.Subscriber.Selected){
                    e.Subscriber.Selected[operation]();             
                    e.Subscriber.publish("OnSelected"); 
                }
            }                         
        })        
    }
})