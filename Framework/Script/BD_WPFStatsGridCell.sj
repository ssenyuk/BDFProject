//USEUNIT BD_GridCell
//USEUNIT BD_WPFTextBlock
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates a single grid cell
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFStatsGridCell = GridCell.extend({
    FrameworkClassName: "WPFStatsGridCell",
    ErrorType: WPFStatsGridCellError,
    AllowedClassNames: ["System.Windows.Controls.ContentPresenter"],
    StatColumnVal: null,
    
    refresh: function(){        
        if (this._super){
            this._super();
        }
        
        this.Mapper.map([
            { Name: "StatColumnVal", NativeClrObject: "StatColumnVal", ClassType: WPFTextBlock, Depth: 10 }
        ]);
    },
    
    getValue: function(){
        return this.StatColumnVal.Text; 
    },
    
    setValue: function(value){
        this.error(AttemptToSetReadOnly, "setValue", this.FrameworkClassName, this.FrameworkClassName); 
    },
    
    logContents: function(){
        if (this._super){
            this._super(); 
        }
        Log.Message("getValue(): " + this.getValue()); 
    }
})