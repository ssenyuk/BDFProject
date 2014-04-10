/**
 * Contains ancestor object for all error reporting objects.
 * @author Noel Rice
 * @company Falafel Software
 */

//USEUNIT BD_Class
//USEUNIT BD_ErrorMessages

var ClassError = Class.extend({
    //PUBLIC PROPERTIES
    FrameworkClassName: 'ClassError',
    Caption: '',
    ErrorSource: '',
    Priority: 300,
    Message: ErrorMessages.Error,
    Comments: null,
    BackColor: null,
    FontColor: null,
    Bold: false,
    Italic: false,
    StrikeOut: false,
    Underline: false,
    Picture: null,
    FolderId: -1,

    //CONSTRUCTOR
    init: function (options) {
          var app, onError; 
        
        //HANDLE OPTIONS IF APPLICABLE
        if (options) {
            if (typeof options === 'string')
                this.Message = options;
            else {
                //ADD OPTIONAL DESCRIPTION IF APPLICABLE
                if (options.message || options.Message)
                    this.Message = options.message || options.Message;
                    
                // ADD ERROR SOURCE
                if (options.ErrorSource)
                    this.ErrorSource = options.ErrorSource;

                //ADD OPTIONAL NAME IF APPLICABLE
                if (options.name || options.Comments)
                    this.Comments = options.name || options.Comments;

                //ADD OPTIONAL ERROR CODE IF APPLICABLE
                if (options.number || options.Code) {
                    this.Caption = this.FrameworkClassName + ' (' + (options.number || options.Code) + ')';
                    //INDENT BASED ON ERROR CODE
                    this.FolderId = options.number || options.Code;
                }

                //OVERRIDE OPTIONAL PRIORITY IF APPLICABLE
                if (options.Priority)
                    this.Priority = options.Priority;

                //OVERRIDE OPTIONAL COLORS
                if (options.BackColor)
                    this.BackColor = options.BackColor;

                if (options.FontColor)
                    this.FontColor = options.FontColor;

                if (options.Bold)
                    this.Bold = options.Bold;
 
                // trigger the App.onError event
                if (options && options.App) {
                    options.App.publish("OnError", { Error: this }); 
                } else {
                    this.log(); 
                }
            }
        }
    },

    //METHODS
    log: function () {

        //CREATE LOG ATTRIBUTES
        var attr = Log.CreateNewAttributes();
        if (this.BackColor) attr.BackColor = this.BackColor;
        if (this.FontColor) attr.FontColor = this.FontColor;
        attr.Bold = this.Bold;
        attr.Italic = this.Italic;
        attr.StrikeOut = this.StrikeOut;
        attr.Underline = this.Underline

        //CONSTRUCT OUTPUT FOR DISPLAY
        var output = this.Caption + 'Error in framework object ' + this.ErrorSource + ': ' + this.Message;

        //ADD COMMENTS IF APPLICABLE
        if (this.Comments && this.Comments.length > 0)
            output += ' [' + this.Comments + ']';

        //WRITE TO LOG
        Log.Error(output, output, this.Priority, attr, this.Picture, this.FolderId);
    }
});