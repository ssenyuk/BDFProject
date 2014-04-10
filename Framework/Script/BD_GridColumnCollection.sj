//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element
//USEUNIT BD_GridColumn

/**
 * Contains object that encapsulates a collection of grid columns
 * @author Noel Rice
 * @company Falafel Software
 */

var GridColumnCollection = Base.extend({
    FrameworkClassName: "GridColumnCollection",
    ErrorType: GridColumnCollectionError,
    Items: {},
    Count: 0,
    
    init: function(options){
        this._super(options); 
        
        this.Items = {};   
    },
        
    add: function(column){
        if (column instanceof GridColumn){
            column.Index = this.Count;
            this.Items[column.Name] = column; 
            this.Count = this.Count + 1;      
        }
    },

    byIndex: function(index){
        for(var prop in this.Items){
            var item = this.Items[prop];
            if (item.Index === index){
                return item; 
            }
        }
        return null; 
    },
    
    logStart: function(){
        Log.AppendFolder("Columns (" + this.Count.toString() + ")"); 
    },
    
    logContents: function(){
        for(var prop in this.Items){
            var item = this.Items[prop]; 
            item.log(); 
        }
    }
})