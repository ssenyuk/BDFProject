//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_GridCellEditor

/**
 * Contains object that encapsulates a grid cell editor for Xam textbox
 * @author Noel Rice
 * @company Falafel Software
 */

var GridCellXamTextEditor = GridCellEditor.extend({
    FrameworkClassName: "GridCellXamTextEditor",
    ErrorType: GridCellXamTextEditorError,
    AllowedClassNames: ["Infragistics.Windows.Editors.XamTextEditor"],
    
    getValue: function(){
        var value = ""; 
        if (this.TCObject.Value){
            value = this.TCObject.Value.OleValue;
        }
        return value; 
    }    
})