//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFMenuItem

/**
 * Contains object that encapsulates a WPF menu
 * @author Noel Rice
 * @company Falafel Software
 */
 
var WPFMenu = WPFElement.extend({
    FrameworkClassName: "WPFMenu",
    ErrorType: WPFMenuError, 
    AllowedClassNames: ["System.Windows.Controls.Menu"],
    Items: {},

    refresh: function(){
        if (this._super){
            this._super(); 
        }
        this.Items = {};

        for (var i = 0; i < this.TCObject.WPFMenu.Count; i++) {
            var tcobject = this.TCObject.WPFMenu.Items(i);
            if (!tcobject.IsSeparator){
                var item = new WPFMenuItem({
                    App: this.App,
                    TCObject: tcobject,
                    Menu: this.TCObject.WPFMenu
                });
                item["Name"] = item.Text; 
                this.Items[item.Text] = item; 
            }
        }
    },
    
    logContents: function(){
        this._super(); 
        
        Log.AppendFolder("Items"); 
        for(var prop in this.Items){
            this.Items[prop].log(); 
        }
        Log.PopLogFolder(); 
    }
})