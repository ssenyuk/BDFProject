//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFDataGridColumnHeaderCell
//USEUNIT BD_WPFDataGridRow

/**
 * Contains object that encapsulates the custom CommonDataGrid
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFCommonDataGrid = WPFElement.extend({
    FrameworkClassName: "WPFCommonDataGrid",
    ErrorType: WPFCommonDataGridError,
    Header: null,
    Rows: null,
    
    init: function(options){
        this._super(options);
        
        this.Mapper.map([
            { Name: "Header", ClrClassName: "DataGridColumnHeader", ClassType: WPFDataGridColumnHeaderCell, IsCollection: true, Depth: 10 },
            { Name: "Rows", ClrClassName: "DataGridRow", ClassType: WPFDataGridRow, IsCollection: true, Depth: 10 }
        ]);
    },
    
    logStart: function(){
        Log.AppendFolder(this.ClrClassName);    
    },
    
    logContents: function(){       
        Log.AppendFolder("Rows"); 
        try {
            if (this.Rows) {
                this.logRows();
            } 
        } finally {
            Log.PopLogFolder(); 
        }
    },
    
    logEnd: function(){
        Log.PopLogFolder();
    }, 
    
    logRows: function(){
        var rowNum = 0, headers = this.Header, colNumber = 0;
        
        if (this.Rows.length > 0) {
            for(var rowIndex in this.Rows){
                var row = this.Rows[rowIndex];
                Log.AppendFolder("Row " + aqConvert.VarToStr(rowNum));
                try { 
                    for(var cellIndex in row.Cells){
                        var cell = row.Cells[cellIndex]; 
                        if (headers[colNumber].Text != "" && cell.Text != ""){
                            Log.Message(headers[colNumber].Text + ": " + cell.Text);
                        } 
                        colNumber = colNumber == headers.length - 1 ? 0 : colNumber + 1;
                    }
                    rowNum = rowNum + 1;
 
                } finally {
                    Log.PopLogFolder(); 
                }
            }
        } else {
            Log.Message(StatusMessages.NoItems); 
        }
    }
})