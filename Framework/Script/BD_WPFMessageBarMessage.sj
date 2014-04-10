/**
 * Contains object that encapsulates a message in the message bar
 * @author Noel Rice
 * @company Falafel Software
 */

//USEUNIT BD_TestCompleteBase
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

var WPFMessageBarMessage = TestCompleteBase.extend({
    FrameworkClassName: "WPFMessageBarMessage", 
    ErrorType: WPFMessageBarMessageError,
    AllowedClassNames: ["BD.FACSuite.UserMessaging.UserMessageService+MessageBarMessage"],
    Text: "",
    IconType: "",
    IsCurrent: false,
    Index: 0,
      
    init: function(options){
        this._super(options);
        
        this.Text = this.TCObject.MessageText.OleValue;
        this.IconType = this.TCObject.Image.OleValue;
    },
    
    log: function(){
        var format = "%s%i (%s) %s",         
            current = this.IsCurrent ? "->" : "";
        
        Log.Message(aqString.Format(format, current, this.Index, this.IconType, this.Text))
    }
})