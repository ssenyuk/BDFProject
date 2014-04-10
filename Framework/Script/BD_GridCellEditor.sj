//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_TestCompleteBase

/**
 * Contains object that encapsulates a grid cell editor
 * @author Noel Rice
 * @company Falafel Software
 */

var GridCellEditor = TestCompleteBase.extend({
    FrameworkClassName: "GridCellEditor",
    ErrorType: GridCellEditorError,
    CellElement: null,
    
    getValue: function(){
        return this.TCObject.Value; 
    },
    
    setValue: function(value){
        this.TCObject.Value = value; 
    }
})