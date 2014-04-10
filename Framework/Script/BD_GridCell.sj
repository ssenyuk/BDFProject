//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_GridCellEditor

/**
 * Contains object that encapsulates a grid cell
 * @author Noel Rice
 * @company Falafel Software
 */

var GridCell = WPFElement.extend({
    FrameworkClassName: "GridCell",
    ErrorType: GridCellError,
    Editor: null,
    Column: null,
    
    getValue: function(){
        if (this.Editor){
            return this.Editor.getValue(); 
        }
    },
    
    setValue: function(value){
        if (this.Editor){
            this.Editor.setValue(value);
        }     
    },
    
    logStart: function(){
        Log.AppendFolder(this.Column.Name + ": " + this.getValue()); 
    },
    
    logContents: function(){
        if (this._super){
            this._super();   
        }
        if (this.Editor){
            Log.Message("Value: " + this.getValue());
        }
    }
})