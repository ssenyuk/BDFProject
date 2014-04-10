//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element
//USEUNIT BD_GridCellCollection

/**
 * Contains object that encapsulates a grid row
 * @author Noel Rice
 * @company Falafel Software
 */

var GridRow = Element.extend({
    FrameworkClassName: "GridRow",
    ErrorType: GridRowError,
    Grid: null,
    Index: -1,
    Cells: null,
    
    init: function(options){
        this._super(options); 
        this.Cells = new GridCellCollection({
            App: this.App
        }); 
    },
    
    hasContent: function(){
        for(var prop in this.Cells.Items){
            var cell = this.Cells.Items[prop]; 
            if (cell.Text){
                return true; 
            }
        }
    },
    
    logStart: function(){
        Log.AppendFolder("Row " + this.Index + " (" + this.Cells.getNameValueString() + ")"); 
    },
    
    logContents: function(){
        if (this._super){
            this._super(); 
        }
        this.Cells.log(); 
    }
})