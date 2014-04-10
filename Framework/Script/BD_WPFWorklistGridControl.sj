//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFRecordListControl
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFMenu
//USEUNIT BD_WPFRecordListGridRow

/**
 * Contains object that wraps the Infragistics RecordListControl
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFWorklistGridControl = WPFRecordListControl.extend({
    FrameworkClassName: "WPFWorklistGridControl",
    ErrorType: WPFWorklistGridControlError,
    AllowedClassNames: ["BD.FACSuite.CustomControls.WorklistGridControl"], 
    _grid: null,
    Rows: null,
    Columns: null,

    
    refresh: function(){
        if (this._super){
            this._super(); 
        }
        
        this.Mapper.map([
            { Name: "_grid", ClrClassName: "RecordListControl", ClassType: WPFRecordListControl, Depth: 10 }
        ]);
        
        this.Rows = this._grid.Rows; 
        this.Columns = this._grid.Columns; 
        
        return this; 
    },
    
    collapseAll: function(){
        this._grid.collapseAll(); 
        return this; 
    },
    
    expandAll: function(){
        this._grid.expandAll(); 
        return this; 
    },
    
    openContextMenu: function(index){
        this.TCObject.ClickRowIndicator(index);
        this.TCObject.ClickRowIndicatorR(index); 
        this.TCObject.ContextMenu.IsOpen = true; 
        this
            .PopupMenu
            .click({Path: "Assign Keywords"}); 
    } 
});