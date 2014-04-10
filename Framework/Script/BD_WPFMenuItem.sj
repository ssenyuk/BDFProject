//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFActionable
//USEUNIT BD_Action
//USEUNIT BD_Utils

/**
 * Contains object that encapsulates a WPF menu item
 * @author Noel Rice
 * @company Falafel Software
 */
 
var WPFMenuItem = WPFActionable.extend({
    FrameworkClassName: "WPFMenuItem",
    ErrorType: WPFMenuItemError, 
    AllowedClassNames: [
        "System.Windows.Controls.MenuItem"
    ],
    Actions:{
        "click": new Action({ValidStates: { "Enabled": true }})        
    },
    Checked: false,
    IsSeparator: false,
    Position: -1,
    Items: {},
    Menu: null, 
    
    init: function (options) {
        this._super(options);

        this.Text = this.TCObject.Caption; 
        this.Checked = this.TCObject.Checked;
        this.IsSeparator = this.TCObject.IsSeparator;
        this.Position = this.TCObject.Position; 
        this.Name = new BDUtils().textToName(this.TCObject.Caption);
    },
    
    refresh: function(){
        // Do not call _super() here to avoid assigning Enabled too early.
        // In TC causes error when addressing the Enabled property in any way.
        
        this.Items = {}; 
        
        if (this.TCObject.SubMenu && this.TCObject.SubMenu.Count > 0){ 
            var menu = this.TCObject.SubMenu; 
            for (var i = 0; i < menu.Count; i++) {
                var tcobject = menu.Items(i);
                if (!tcobject.IsSeparator && tcobject.Caption){
                    var item = new WPFMenuItem({
                        App: this.App,
                        TCObject: tcobject,
                        Menu: menu
                    });
                    this.Items[item.Name] = item; 
                }
            }
        } 
    },
    
    click: function(){
        // cannot access Enabled property when not visible
        // assigned here as a workaround
        this.Enabled = this.TCObject.Enabled; 
        if (this.IsValidAction(this.Actions.click)){
            this.Menu.Click(this.Position);
            this.refresh(); 
        }
        return this; 
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