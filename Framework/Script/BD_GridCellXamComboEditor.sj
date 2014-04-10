//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_GridCellEditor
//USEUNIT BD_WPFTextBlock

/**
 * Contains object that encapsulates a grid cell editor for Xam combo
 * @author Noel Rice
 * @company Falafel Software
 */

var GridCellXamComboEditor = GridCellEditor.extend({
    FrameworkClassName: "GridCellXamComboEditor",
    ErrorType: GridCellXamComboEditorError,
    AllowedClassNames: ["Infragistics.Windows.Editors.XamComboEditor"],
    
    getValue: function(){
        var value = "";
        if (this.CellElement){
            var lines = []; 
            this.CellElement.Finder.findAll({
                ClrClassName: "TextBlock",
                Depth: 10,
                OnCompleted: function(e){
                    for(var prop in e.Result){
                        var textBlock = e.Result[prop].cast(WPFTextBlock); 
                        lines.push(textBlock.getText()); 
                    }                     
                    value = lines.join();  
                }
            });
        }
        return value; 
    },
    
       
    getIndex: function(){
        return this.TCObject.SelectedIndex;    
    },
    
    setIndex: function(value){
        this.TCObject.SelectedIndex = value; 
    }
})