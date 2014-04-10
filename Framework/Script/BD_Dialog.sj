//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_BaseWindow

/**
 * Contains object that encapsulates a Microsoft system dialog. 
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var Dialog = BaseWindow.extend({
    FrameworkClassName: "Dialog",
    ErrorType: DialogError, 
    IsPopup: true,
    IsDialog: true
}); 