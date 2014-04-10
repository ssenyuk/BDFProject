//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_GridCellEditor

/**
 * Contains object that encapsulates a grid cell editor for the BD control host editor
 * @author Noel Rice
 * @company Falafel Software
 */

var GridCellControlHostEditor = GridCellEditor.extend({
    FrameworkClassName: "GridCellControlHostEditor",
    ErrorType: GridCellControlHostEditorError,
    AllowedClassNames: ["BD.FACSuite.CustomControls.ControlHostEditor"],
    
    getValue: function(){
        var value = ""; 
        if (this.TCObject.Value){
            value = this.TCObject.Value.OleValue;
        }
        return value; 
    }    
})