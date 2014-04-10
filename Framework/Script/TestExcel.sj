//USEUNIT BD_Excel

/**
 * contains usage examples for the Excel object 
 * @author Noel Rice
 * @company Falafel Software
 */

// Test Excel objects
// output a standard log for all rows
function testExcelLog() {
    
new Excel({
    FilePath: "C:\\Data\\MyData.xlsx",
    SheetName: "Sheet1"
}).log();
}

// read the spreadsheet and fire event for each row,
// separate event handler function
function testExcelRead() {
    
    var excel = new Excel({
        FilePath: "C:\\Data\\MyData.xlsx",
        SheetName: "Sheet1",
        OnRow: myRowHandler
    });
    excel.read();
}

function myRowHandler(e) {
    
    Log.Message("Row Index: " + e.Row.Index);
    for (column in e.Row.Columns) {
        Log.Message(column + ": " + e.Row.Columns[column]);
    }
}

// read the spreadsheet and fire event for each row,
// inline, anonymous event handler function
function testExcelReadInline() {
    
var excel = new Excel({
    FilePath: "C:\\Data\\MyData.xlsx",
    SheetName: "Sheet1",
    OnRow: function (e) {
        Log.Message("Row Index: " + e.Row.Index);
        for (column in e.Row.Columns) {
            Log.Message(column + ": " + e.Row.Columns[column])
        }
    }
});
excel.read();
}

// Should fail, wrong FilePath
function testExcelWrongFilePath() {
    
    var excel = new Excel({
        FilePath: "C:\\Data\\xyz.xlsx",
        SheetName: "Sheet1",
        OnRow: myRowHandler
    });

    excel.read();
}

// Should fail, wrong SheetName
function testExcelWrongSheetName() {
    
    var excel = new Excel({
        FilePath: "C:\\Data\\MyData.xlsx",
        SheetName: "xyz",
        OnRow: myRowHandler
    });
    excel.read();
}

// Test spreadsheet with irregular rows
function testIrregularRows() {
    
    var excel = new Excel({
        FilePath: "C:\\Data\\budget.xls",
        SheetName: "Budget - RSBI-DFS",
        OnRow: function (e) {
            Log.Message("Row Index: " + e.Row.Index);
            for (column in e.Row.Columns) {
                var value = e.Row.Columns[column];
                if (value) {
                    Log.Message(column + ": " + value)
                }
            }
        }
    });
    excel.read();
}

function testRange(){
var excel = new Excel({
    FilePath: "C:\\Data\\MyData.xlsx",
    SheetName: "Sheet1",
    OnRow: function (e) {
        Log.Message("Row Index: " + e.Row.Index);
        for (column in e.Row.Columns) {
            Log.Message(column + ": " + e.Row.Columns[column])
        }
    }
});
// start on row two, end on row eight
excel.read({Start: 2, End: 8});
}
