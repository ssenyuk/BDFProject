//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_BaseWindow
//USEUNIT BD_WPFImage
//USEUNIT BD_WPFConfirmationButtons

/**
 * Contains object that encapsulates a BD confirmation dialog
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFConfirmationWindow = BaseWindow.extend({
    FrameworkClassName: "WPFConfirmationWindow",
    ErrorType: WPFConfirmationWindowError,
    Icon: null,
    MessageContentPresenter: null,
    Message: "",
    Buttons: null,
    
    init: function(options){
        this._super(options); 
        
        this.Mapper.map([
            { Name: "Icon", ClrClassName: "Image", ClassType: WPFImage, Depth: 5 },
            { Name: "MessageContentPresenter", NativeClrObject: "MessageContentPresenter", ClassType: Element, Depth: 10},
            { Name: "Buttons", NativeClrObject: "ButtonsItemsControl", ClassType: WPFConfirmationButtons, Depth: 5 }                     
        ]);
        
        if (this.MessageContentPresenter.TCObject &&
            this.MessageContentPresenter.TCObject.Content &&
            this.MessageContentPresenter.TCObject.COntent.OleValue){
            this.Message = this.MessageContentPresenter.TCObject.Content.OleValue;
        }
    } 
    
}); 