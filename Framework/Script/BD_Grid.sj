//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_GridColumnCollection
//USEUNIT BD_GridRowCollection

/**
 * Contains object that encapsulates a grid
 * @author Noel Rice
 * @company Falafel Software
 */

var Grid = WPFElement.extend({
    FrameworkClassName: "Grid",
    ErrorType: GridError,
    Rows: null,
    Columns: null,
    refresh: function(){
        if (this._super){
            this._super();     
        }
                   
        this.Columns = new GridColumnCollection({
            App: this.App
        }); 
        
        this.Rows = new GridRowCollection({
            App: this.App
        });         
    },
    
    getFirstRow: function(){
        if (this.Rows.Count > 0){
            return this.Rows.Items[0];
        }     
    },
    
    getLastRow: function(){
        if (this.Rows.Count > 0){
            return this.Rows.Items[this.Rows.Count - 1];
        }     
    },
    
    logContents: function(){
        this.Columns.log();
        this.Rows.log(); 
    }
})