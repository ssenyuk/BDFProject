//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Dialog

/**
 * Contains object that encapsulates a Microsoft system save file dialog
 * @author Noel Rice
 * @company Falafel Software
 */

var SaveFileDialog = Dialog.extend({
    FrameworkClassName: "SaveFileDialog",
    ErrorType: SaveFileDialogError, 
    saveFile: function(fileName){
        if ((this.TCObject) && (this.TCObject.Exists) && (fileName != "")) {
            this.TCObject.SaveFile(fileName);
        }
        return this;   
    }
}); 