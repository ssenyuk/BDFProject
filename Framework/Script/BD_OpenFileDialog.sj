//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Dialog

/**
 * Contains object that encapsulates a Microsoft system open file dialog
 * @author Noel Rice
 * @company Falafel Software
 */


var OpenFileDialog = Dialog.extend({  
    FrameworkClassName: "OpenFileDialog",
    ErrorType: OpenFileDialogError,  
    openFile: function(fileName){
        if ((this.TCObject) && (this.TCObject.Exists)) {
            this.TCObject.OpenFile(fileName);
        }
        return this;   
    }
}); 