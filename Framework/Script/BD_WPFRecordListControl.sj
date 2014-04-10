//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Grid
//USEUNIT BD_GridCellXamComboEditor
//USEUNIT BD_GridCellXamTextEditor
//USEUNIT BD_GridCellControlHostEditor
//USEUNIT BD_WPFRecordListGridRow

/**
 * Contains object that encapsulates an Infragistics RecordListControl
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFRecordListControl = Grid.extend({
    FrameworkClassName: "WPFRecordListControl", 
    ErrorType: WPFRecordListControlError,
    AllowedClassNames: ["Infragistics.Windows.DataPresenter.RecordListControl"],
    ParentRows: null,
    
    refresh: function(){
        if (this._super){
            this._super();     
        }
        
        this.ParentRows = new GridRowCollection({
            App: this.App
        });    

        this.Finder.findAll({
            Params: { Grid: this },
            Depth: 5,
            ClrClassName: "DataRecordPresenter",
            OnCompleted: this.load
        });
    },
    
    load: function(e){
        var rowElement, isHeader, isDataRow; 
        var rowElements = e.Result;
        var grid = e.Params.Grid;
        
        if (!this.Columns){
    
            // load columns
            for(var prop in rowElements){
                rowElement = rowElements[prop].cast(Element);
                isHeader = rowElement.TCObject.IsHeaderRecord && 
                    rowElement.TCObject.HasHeaderContent && 
                    rowElement.Visible;
                if (isHeader){
                    // find the columns
                    rowElement.Finder.findAll({
                        Depth: 10,
                        Params: {Grid: grid},
                        ClrClassName: "LabelPresenter",
                        OnCompleted: grid.loadColumns
                    });
                }
            }
        
        }
    
        // load data rows
        for(var prop in rowElements){
            var rowElement = rowElements[prop].cast(Element);
            isDataRow = !rowElement.TCObject.IsHeaderRecord && 
                !rowElement.TCObject.HasHeaderContent && 
                // special record true if a blank row
                !rowElement.TCObject.DataContext.IsSpecialRecord &&
                rowElement.Visible; 
            if (isDataRow){
                // find the row cells
                rowElement.Finder.findAll({
                    Depth: 10,
                    Params: {Grid: grid, TCObject: rowElement.TCObject},
                    ClrClassName: "CellValuePresenter",
                    OnCompleted: grid.loadRow
                });
            }  
        }
    },

    loadColumns: function(e){
        var grid = e.Params.Grid;
        var columns = grid.Columns; 
        for(var i in e.Result){
            var columnElement = e.Result[i]; 
            var text = columnElement.TCObject.WPFControlText; 
            var column = new GridColumn({
                App: grid.App,
                Text: text,
                Name: new BDUtils().textToName(text),
                TCObject: columnElement.TCObject
            }); 
                        
            columns.add(column);                                         
        }
    },

    loadRow: function(e){
        var grid = e.Params.Grid;
                
        var row = new WPFRecordListGridRow({
            App: grid.App,
            TCObject: e.Params.TCObject,
            Grid: grid
        });

        var cells = e.Result;
        var editorType = null; 
        
        for(var i in cells){
            var cellElement = cells[i].cast(Element);
            
            // get the editor for the cell
            if (cellElement.TCObject.Editor.ClrClassName == "XamComboEditor"){
                editorType = GridCellXamComboEditor;
            } else if (cellElement.TCObject.Editor.ClrClassName  == "XamTextEditor"){
                 editorType = GridCellXamTextEditor;
            } else if (cellElement.TCObject.Editor.ClrClassName  == "ControlHostEditor"){
                 editorType = GridCellControlHostEditor;
            } else {
                editorType = GridCellEditor;
            }
            
            var editor = new editorType({
                    App: cellElement.App,
                    TCObject: cellElement.TCObject.Editor,
                    CellElement: cellElement
                });

            var cell = new GridCell({
                App: cellElement.App,
                TCObject: cellElement.TCObject,
                Editor: editor,
                EditorElement: cellElement.TCObject.Child(0),
                Column: grid.Columns.byIndex(row.Cells.Count)
            });
            
            row.Cells.add(cell);                     
        }
    
        if (row.hasContent()){
            grid.Rows.add(row);
            if (row.IsParentRow){
                grid.ParentRows.add(row); 
            }
        }                                       
    },
    
    
    expandAll: function(){
        var traversed = false; 
        
        while (!traversed){
            for(var prop in this.Rows.Items){
                var row = this.Rows.Items[prop];
                if (row.Expandable && !row.IsExpanded){
                    row.expand(); 
                    break; 
                }
            }
            traversed = prop == this.Rows.Items.length - 1; 
        }
    },
    
    collapseAll: function(){
        var traversed = false; 
        
        while (!traversed){
    
            for(var prop in this.Rows.Items){
                var row = this.Rows.Items[prop];
                if (row.Expandable && row.IsExpanded){
                    row.collapse();
                    break; 
                }
            }
            traversed = prop == this.Rows.Items.length - 1;    
        } 
    }     
})