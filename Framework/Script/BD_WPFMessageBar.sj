/**
 * Contains object that encapsulates a message bar
 * @author Noel Rice
 * @company Falafel Software
 */

//USEUNIT BD_WPFElement
//USEUNIT BD_WPFMessageBarMessage
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

var WPFMessageBar = WPFElement.extend({
    FrameworkClassName: "WPFMessageBar",
    ErrorType: WPFMessageBarError, 
    AllowedClassNames: ["BD.FACSuite.CustomControls.MessageBarContentControl"],
    Messages: [],
    Count: 0,
    
    refresh: function(){
        var index = 0; 
        
        if (this._super){
            this._super(); 
        }
        
        this.Messages = []; 
        this.Count = this.TCObject.Messages.Count;
        
        for(var i = 0; i < this.Count; i++){
            var message = new WPFMessageBarMessage({
                App: this.App,
                TCObject: this.TCObject.Messages.Item(i),
                Index: i,
                IsCurrent: i == this.TCObject.get_CurrentMessageIndex()
            });
            this.Messages.push(message);
        }
    },

    getAllMessages: function(){
        return this.Messages; 
    }, 

    getCurrentMessage: function(){
        for (var prop in this.Messages){
            var message = this.Messages[prop]; 
            if (message.IsCurrent){
                return message; 
            }
        }
    },
    
    moveToNextMessage: function(){
        this.TCObject.ShowNextMessage();         
    }, 
    
    moveToPreviousMessage: function(){
        this.TCObject.ShowPreviousMessage();         
    },
    
    logStart: function(){
        this.refresh();
        Log.AppendFolder("MessageBar (" + this.Count.toString() + ")");     
    },
    
    logContents: function(){        
        for(var prop in this.Messages){
            this.Messages[prop].log();
        }
    }
})