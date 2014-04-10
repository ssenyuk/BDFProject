//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Database

/**
 * Contains object that reads Excel files
 * @author Noel Rice
 * @company Falafel Software
 */

var Excel = Database.extend({
    FrameworkClassName: "Excel",
    ErrorType: ExcelError,
    FilePath: null,
    SheetName: "Sheet1",
    OnRow: null,
    _driver: null,

    //CONSTRUCTOR
    init: function (options) {
        this._super(options);
        if (this.validateInitOptions(["FilePath", "SheetName"])){
            this.FilePath = options.FilePath;
            this.SheetName = options.SheetName;
            this.OnRow = this.subscribe("OnRow", options.OnRow);
            try {
                this._driver = DDT.ExcelDriver(this.FilePath, this.SheetName, true);
                this._driver.First();
            } catch (ex) {
                var error = new ExcelError({
                    Message: aqString.Format(ErrorMessages.ExcelError)
                }).log();
            }
        }
    },

    log: function () {
        
    var folder, i, recNo = 0;
        Log.Message(this.FilePath + " " + this.SheetName);
        this._driver.First();
        while (!this._driver.EOF()) {
            folder = Log.CreateFolder("Record: " + aqConvert.VarToStr(recNo));
            Log.PushLogFolder(folder);

            for (i = 0; i < this._driver.ColumnCount; i++) {
                Log.Message(this._driver.ColumnName(i) + ": " +
                    aqConvert.VarToStr(this._driver.Value(i)));
            }
            Log.PopLogFolder();
            recNo = recNo + 1;
            this._driver.Next();
        }
        DDT.CloseDriver(this._driver.Name);
    },

    read: function (options) {
        
        var rowNum = 0, row = {}, start = 0, end = null;
        
        if (options){
            if (options.Start) {
                start = options.Start;
            }
            if (options.End) {
                end = options.End;
            }
        }

        this._driver.First();
        while (!this._driver.EOF()) {
            if (end && rowNum >= end){
                break; 
            }
            if (rowNum >= start){
            
                row.Index = parseInt(rowNum);
                row.Columns = {};

                for (i = 0; i < this._driver.ColumnCount; i++) {
                    row.Columns[this._driver.ColumnName(i)] =
                        this._driver.Value(i);
                }
                if (this.OnRow) {
                    this.publish("OnRow", { Row: row });
                }
            }
                
            rowNum = rowNum + 1;
            this._driver.Next();
        }
        DDT.CloseDriver(this._driver.Name);
    }

});