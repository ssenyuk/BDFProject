//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSLoginWindow = BaseWindow.extend({
    UserIdComboBox: null,
    PasswordBox: null,
    OKButton: null, 
    CancelButton: null,
    
    init: function(options){
        this._super(options);
        
        // bring window to front before recording property values, such as Visible            
        this.activate(); 
        
        this.Mapper.map([
            { Name: "UserIdComboBox", NativeClrObject: "UserIdComboBox", ClassType: WPFComboBox, Depth: 5 },
            { Name: "PasswordBox", NativeClrObject: "PasswordBox", ClassType: WPFPasswordBox, Depth: 5 },
            { Name: "OKButton", NativeClrObject: "LoginButton", ClassType: WPFButton, Depth: 10},
            { Name: "CancelButton", NativeClrObject: "CancelLoginButton", ClassType: WPFButton, Depth: 10 }            
        ]);
    },
    
    login: function (options) {
        if (options){
            
            if (options.UserName){
                this.UserIdComboBox.click({Text: options.UserName});
            }
            if (options.Password){
                this.PasswordBox.text(options.Password);
            }
            Log.Message(aqString.Format(StatusMessages.LoggingIn, 
                options.UserName, options.Password)); 
            
            this.OKButton.click();
        }

        return this; 
    }
}); 