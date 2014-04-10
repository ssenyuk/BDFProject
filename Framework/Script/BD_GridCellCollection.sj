//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element
//USEUNIT BD_GridCell

/**
 * Contains object that encapsulates a collection of grid cells
 * @author Noel Rice
 * @company Falafel Software
 */

var GridCellCollection = Base.extend({
    FrameworkClassName: "GridCellCollection",
    ErrorType: GridCellCollectionError,
    Items: {},
    Count: 0,
    
    init: function(options){
        this._super(options); 
        this.Items = {};   
    },
    
    add: function(cell){
        if (cell instanceof GridCell){
            cell.Index = this.Count;
            this.Items[cell.Column.Name] = cell;
            this.Count = this.Count + 1;  
        }
    },
    
    logStart: function(){
        Log.AppendFolder("Cells (" + this.Count.toString() + ")"); 
    },
    
    logContents: function(){
        for(var prop in this.Items){
            this.Items[prop].log(); 
        }
    },
    
    getNameValueString: function(){
        var result = [];
        for(var prop in this.Items){
            var value = this.Items[prop].getValue();
            if (value) {
                result.push(prop + ": " + value); 
            }
        }
        return result.join();         
    }
})