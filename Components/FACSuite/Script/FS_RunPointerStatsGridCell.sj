//USEUNIT BD_GridCell
//USEUNIT BD_WPFTextBlock
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

/**
 * Copy of WPFStatsGridCell but for Run Pointer Stats Grid Cell
 * @author Ivan Getsman
 * @company A1QA
 */
 var FSRunPointerStatsGridCell = GridCell.extend({
    StatColumnValTextBlock: null,
    FrameworkClassName: "WPFRunPointerStatsGridCell",
    ErrorType: WPFStatsGridCellError,
    AllowedClassNames: ["System.Windows.Controls.ContentPresenter"],

    refresh: function(){        
        if (this._super){
            this._super();
        }
        this.Mapper.map([
            { Name: "StatColumnValTextBlock", NativeClrObject: "StatColumnValTextBlock", ClassType: WPFTextBlock, Depth: 10 }
        ]);
    },
    
    getValue: function(){
        return this.StatColumnValTextBlock.Text; 
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