//USEUNIT BD_UnitTest
//USEUNIT BD_FrameworkClassIncludes

// this is a manual implementation of the RecordListControl using the generic Grid wrapper.

/*
    a) getNonEmptyRows();
    b) getLastRow()
    c) expandAllRows()expandRow( rowNumberToExpand) // expand just one row.
    d) collapseWorklistEntry(( rowNumberToCollapse) //collaspe just one row.
    e) getParentRows()
    f) waitForRowCount(expected, timeout): Description Waits until number of rows in the worklist grid matches expected value
    g) getCellFromRow(rowRef, colName): Descriptions:  Gets a reference a cell from a grid row
    h) openContextMenuForRow (workItemNumber): Descriptions:  Opens a context menu for a specified work item
    i) getInfoGridFromRow(rowRef)
*/


function test(){

    new UnitTest({
        ExpectedWindowName: "FACSuite",
        TestedApp: TestedApps.FACSuite,
        Preparation: "Navigate manually to FACSuite Worklist workspace. Verify that at least one worklist instance exists." +
            "Open a worklist and manually add worklist entries from the Tasks pane to the Worklist Entries grid.",
        TestFunction: function(window){
            window.Finder.findAll({
                ClrClassName : "RecordListControl",
                Depth: 100,
                OnCompleted: function(e){
                    var grid = e.Result[0].cast(Grid);
                    grid.Finder.findAll({
                        Params: { Grid: grid },
                        ClrClassName: "DataRecordPresenter",
                        OnCompleted: getRows
                    });
                    
                    // output the grid contents
                    grid.log();
                    
                    //a) getNonEmptyRows();
                    var rows = grid.Rows; // all rows are non-empty by default.
                    rows.log(); 
                    // b) getLastRow()
                    var lastRow = grid.Rows.Items[grid.Rows.Count - 1]; 
                    lastRow.log(); 
                 
                     
//                    
//                    var rows = grid.Rows.Items;
//                    var firstRow = rows[0]; 
//                    firstRow.Cells.Items.Task.Editor.setIndex(2); 
//                    firstRow.Cells.Items.Status.setValue("Ready");
//                    
//                    for(var index in rows){
//                        var row = rows[index];
//                        var cells = row.Cells.Items;  
//                        Log.Message(cells.Task.getValue()); 
//                    } 
                    
                }   
            });
        }
    }).run(); 
}

function getRows(e){
    var rowElement, isHeader, isDataRow; 
    var rowElements = e.Result;
    var grid = e.Params.Grid;
    
    // load columns
    for(var prop in rowElements){
        rowElement = rowElements[prop].cast(Element);
        isHeader = rowElement.TCObject.IsHeaderRecord && rowElement.TCObject.HasHeaderContent;
        if (isHeader){
            // find the columns
            rowElement.Finder.findAll({
                Depth: 10,
                Params: {Grid: grid},
                ClrClassName: "LabelPresenter",
                OnCompleted: getColumns
            });
        }
    }
    
    // load data rows
    for(var prop in rowElements){
        var rowElement = rowElements[prop].cast(Element);
        isDataRow = !rowElement.TCObject.IsHeaderRecord && 
            !rowElement.TCObject.HasHeaderContent && 
            !rowElement.TCObject.DataContext.IsSpecialRecord; // special record true if a blank row
        if (isDataRow){
            // find the row cells
            rowElement.Finder.findAll({
                Depth: 10,
                Params: {Grid: grid, TCObject: rowElement.TCObject},
                ClrClassName: "CellValuePresenter",
                OnCompleted: getCells
            });
        }  
    }
}

function getColumns(e){
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
}

function getCells(e){
    var grid = e.Params.Grid;
                
    var row = new GridRow({
        App: grid.App,
        TCObject: e.Params.TCObject,
        Grid: grid
    });

    var cells = e.Result; 
    
    for(var i in cells){
        var cellElement = cells[i].cast(Element);                               
        var text = cellElement.TCObject.WPFControlText; 

        var cell = new GridCell({
            App: cellElement.App,
            Text: text,
            TCObject: cellElement.TCObject,
            Column: grid.Columns.byIndex(row.Cells.Count)
        });
                        
        if (cell.TCObject.ChildCount > 0){
            var child = cell.TCObject.Child(0);
            if (child.ClrClassName == "XamComboEditor"){
                cell.Mapper.map([
                    { Name: "_Editor", ClrClassName: child.ClrClassName, ClassType: GridCellXamComboEditor, Depth: 10 }
                ]);
            } else if (child.ClrClassName == "XamTextEditor"){
                cell.Mapper.map([
                    { Name: "_Editor", ClrClassName: child.ClrClassName, ClassType: GridCellXamTextEditor, Depth: 10 }
                ]);
            }
        }                          
                        
        row.Cells.add(cell);                     
    }
    
    if (row.hasContent()){
        grid.Rows.add(row); 
    }                                       
}