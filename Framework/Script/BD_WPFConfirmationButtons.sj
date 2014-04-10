//USEUNIT BD_WPFClickableCollection
//USEUNIT BD_WPFButton

var WPFConfirmationButtons = WPFClickableCollection.extend({
    ErrorType: WPFConfirmationButtonsError,
    FrameworkClassName: "WPFConfirmationButtons",
    ItemClrClassName: "Button",
    ItemDepth: 5,
    ItemType: WPFButton,
    Name: "ConfirmationButtons"
})