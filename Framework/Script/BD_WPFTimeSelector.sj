//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFListBox

/**
 * Contains object that encapsulates a time selector
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFTimeSelector = WPFElement.extend({
    FrameworkClassName: "WPFTimeSelector",
    ErrorType: WPFTimeSelectorError, 
    AllowedClassNames: ["BD.FACSuite.CustomControls.TimeSelector"],
    Value: null,
    TimeList: null,
    TimeListCount: 0,
    
    init: function(options){
        this._super(options);
        
         if (this.TCObject.WaitProperty("Value", "*", 0)){
            this.Value = this.TCObject.Value.OleValue;
        }
        this.TimeList = this.TCObject.TimeList;
        if (this.TimeList){
            this.TimeListCount = this.TimeList.Count; 
        }
    },
    
    open: function(){
        this.TCObject.set_TimeListOpen(true);
        return this; 
    },
    
    close: function(){
        this.TCObject.set_TimeListOpen(false);
        return this; 
    },
    
    setTimeByListIndex: function(options){
        var index = -1;
         
        if (options && options.Index){
            index = options.Index; 
            var timeText = this.TimeList.Item(index).OleValue;
            var time = aqConvert.StrToTime(timeText); 
            this.TCObject.SelectedTime = time;  
        }
        return this; 
    }
})