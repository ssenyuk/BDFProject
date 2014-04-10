//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFTextBox
//USEUNIT BD_Grid
//USEUNIT BD_WPFStatsGridCell

// describes a grid as implemented in experiments/statistics
var WPFStatsControl = Grid.extend({
    FrameworkClassName: "WPFStatsControl",
    ErrorType: WPFStatsControlError,
    AllowedClassTypes: ["BD.FACSuite.Method.StatsControl"],
    TitleTextBox: null,
    
    refresh: function(){
        if (this._super){
            this._super();     
        }
        
        this.Mapper.map([
            { Name: "TitleTextBox", NativeClrObject: "StatsViewTitle", ClassType: WPFTextBox, Depth: 5 }
        ]);

        // load column headers
        this.Finder.findAll({
            Params: { App: this.App, Grid: this },
            Depth: 5,
            ClrClassName: "GridViewHeaderRowPresenter",
            OnCompleted: this._loadColumnRows
        });
        
        // load rows
        this.Finder.findAll({
            Params: { App: this.App, Grid: this },
            Depth: 10,
            NativeClrObject: "PART_TableBindingHost",
            OnCompleted: this._loadRows
        });
        
    },
    
    _loadRows: function(e){
        for(var prop in e.Result){
            var rowElement = e.Result[prop].cast(Element); 
            var row = new GridRow({
                App: e.Params.App,
                Grid: e.Params.Grid,
                TCObject: rowElement.TCObject
            })
            
            // load cells
            rowElement.Finder.findAll({
                Params: { App: e.Params.App, Grid: e.Params.Grid, Row: row },
                Depth: 10,
                ClrClassName: "ContentPresenter",
                OnCompleted: e.Params.Grid._loadCells
            });                        
        }        
    },
    
    _loadCells: function(e){
        var row = e.Params.Row;
        
        var index = 0; 
        for(var prop in e.Result){
            var cellElement = e.Result[prop];  
            var cell = new WPFStatsGridCell({
                App: e.Params.App,
                TCObject: cellElement.TCObject
            });
            cell.Column = e.Params.Grid.Columns.byIndex(index); 
            e.Params.Row.Cells.add(cell);
            index++;                               
        }
        e.Params.Grid.Rows.add(row);   
    },
     
    _loadColumnRows: function(e){
        for(var prop in e.Result){
            var columnRowElement = e.Result[prop].cast(Element);
            columnRowElement.Finder.findAll({
                Params: { App: e.Params.Grid.App, Grid: e.Params.Grid },
                Depth: 10,
                ClrClassName: "GridViewColumnHeader",
                OnCompleted: e.Params.Grid._loadColumns
            }); 
        }
    },
    
    _loadColumns: function(e){
        // Column elements are presented in reverse order, so start from the end of the list 
        // to make the indices match the columns in the data rows.
        for(var prop = e.Result.length - 1; prop >= 0; prop--){
            var gridViewColumnHeader = e.Result[prop].TCObject;
            if (gridViewColumnHeader.HasContent && gridViewColumnHeader.ChildCount > 0){
                var text = gridViewColumnHeader.WPFControlText; 
                var column = new GridColumn({
                    App: e.Params.App,
                    TCObject: gridViewColumnHeader,
                    Text: text,
                    Name: new BDUtils().textToName(text)
                });
                e.Params.Grid.Columns.add(column);                         
            }
        }    
    },
    
    logContents: function(){
        if (this.TitleTextBox.Exists){
            Log.Message("Title: " + this.TitleTextBox.text()); 
        }
        if (this._super){
            this._super(); 
        }
    }
})