//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSLoginButtons = WPFClickableCollection.extend({
    ItemClrClassName: "Button",
    ItemDepth: 20,
    ItemType: WPFButton,
    Name: "LoginButtons",
    
    init: function(options){
        this._super(options); 
    }
})