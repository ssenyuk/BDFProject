//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element
//USEUNIT BD_GridRow

/**
 * Contains object that encapsulates a collection of grid columns
 * @author Noel Rice
 * @company Falafel Software
 */

var GridRowCollection = Base.extend({
    FrameworkClassName: "GridRowCollection",
    ErrorType: GridRowCollectionError,
    Items: [],
    Count: 0,
    
    init: function(options){
        this._super(options); 
        
        this.Items = [];   
    },    
        
    add: function(row){
        if (row instanceof GridRow){
            row.Index = this.Count;
            this.Items.push(row); 
            this.Count = this.Count + 1;      
        }
    },
    
    logStart: function(){
        Log.AppendFolder("Rows (" + this.Count.toString() + ")");  
    },
    
    logContents: function(){
        for(var prop in this.Items){
            var item = this.Items[prop]; 
            item.log(); 
        }
    }
})