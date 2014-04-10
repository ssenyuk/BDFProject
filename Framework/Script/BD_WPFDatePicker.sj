//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFActionable

/**
 * Contains object that encapsulates a date picker
 * @author Noel Rice
 * @company Falafel Software
 */

// Note: Potential issues with the underlying control: 
// DatePickerXT usability doesn't always select dates even though
// they appear to be valid. The properties of the control according to TestComplete 
// don't always match the visual on-screen.

var WPFDatePicker = WPFActionable.extend({
    FrameworkClassName: "WPFDatePicker",
    ErrorType: WPFDatePickerError, 
    AllowedClassNames: ["BD.FACSuite.CustomControls.DatePickerXT"],
    Actions:{
        "setDateString": new Action({ValidStates: { "Enabled": true }})
    },   
    getDateString: function(){
        return this.TCObject.get_Text()     
    },    
    
    setDateString: function(options){
      if (options && options.Date && typeof options.Date === "string"){
            if (this.IsValidAction(this.Actions.setDateString)){
                this.TCObject.set_SelectedDate(aqConvert.StrToDate(options.Date)); 
                this.TCObject.SetTextBoxValue(options.Date); 
            }
        } else {
            this.error(ErrorMessages.MissingParameter, "Date", "setDateString"); 
        }      
    },
    
    logContents: function(){
        Log.Message("Date: " + this.getDateString()); 
    }
})