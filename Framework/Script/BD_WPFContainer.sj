//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFClickableCollection

/**
 * This class represents a container of objects, such as workspaces or views.
 * When a button or tab is clicked, a new view becomes available. Each item 
 * in the container must have a ClrClassName that is unique from the other items
 * in the container.
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFContainer = WPFClickableCollection.extend({
    FrameworkClassName: "WPFContainer",
    ErrorType: WPFContainerError,
    Current: null, // current contained item for selected clickable
    ItemClrClassName: "", // TestComplete type for items collection
    ItemType: null, // framework type for items collection
    ItemDepth: 20,
    SelectedText: null, // text assigned from the item that is clicked
    OnItemCreated: null,
    OnItemChanged: null,
    _savedClrClassName: "",
    
    // List the items that can be inside the container,
    // map between TC ClrClassNames and framework class types.
    // The property key values here are unique ClrClassNames.
    ContainedItemsClassMap: {},      

    init: function (options) {
        this._super(options);
        
        this.validatePropertyAssignments(["ItemClrClassName", "ItemType"], "init"); 
     
        if (this.ContainedItemsClassMap === {}){
            this.error(ErrorMessages.EmptyCollection, "ContainedItemsClassMap"); 
        }
        
        if (options && options.OnItemCreated){
            this.subscribe("OnItemCreated", options.OnItemCreated);          
        }     
        if (options && options.OnItemChanged){
            this.subscribe("OnItemChanged", options.OnItemChanged);          
        }         
    },

    // wait until a contained item exists
    waitForReady: function(){
        var clrClassName = "", item = null; 
                     
        while(!item){        
            // rebuild the list of items
            this.refresh();
            
            var clrClassName = this.getCurrentClrClassName(); 
            
            if (clrClassName != ""){
                item = this.Finder.find({
                    ClrClassName: clrClassName,
                    Visible: true,
                    Enabled: true,
                    Depth: 10,
                    Duration: 20000
                })
            }
            if (item){
                // create an item, then publish an event 
                this.Current = item.cast(this.ContainedItemsClassMap[clrClassName]);
                if (this.Selected){
                    this.SelectedText = this.Selected.Text; 
                }
                this.Current.Name = clrClassName;
                this.publish("OnItemCreated", { Item: this.Current });
            } 
        }
    },
    
    // wait for a new contained item to exist
    waitForItemChanged: function(){
        var clrClassName = "", isNewItem;
        
        isNewItem = false; 
        this.waitForReady(); 
        while (!isNewItem){ 
            var clrClassName = this.getCurrentClrClassName(); 
            isNewItem = clrClassName != this._savedClrClassName;
            this._savedClrClassName = clrClassName; 
            this.waitForReady();
            if (isNewItem){                    
                this.publish("OnItemChanged", { Item: this.Current });
            } 
        }
    },   
    
    // get the unique ClrClassName that represents the current contained item.
    // override in descendant classes.
    getCurrentClrClassName: function(){
        this.error(ErrorMessages.NotImplementedError, "getCurrentClrClassName"); 
    }, 

    select: function (options) {
        this.click(options);
        if (this.Selected) {
            this.waitForItemChanged();
            return this.Selected;  
        }
    },
    
    logContents: function(){
        this._super(); 
        if (this.Current){  
            this.Current.log(); 
        }        
    }
})