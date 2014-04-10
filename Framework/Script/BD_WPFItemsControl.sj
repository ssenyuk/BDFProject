//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement

/**
 * Contains object that encapsulates a WPF ItemsControl
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFItemsControl = WPFElement.extend({
    FrameworkClassName: "WPFItemsControl",
    ErrorType: WPFItemsControlError, 
    Items: null,
    OnClick: null,
    
    init: function (options) {
        this._super(options);
        
        if (this.TCObject.Items) {
            this.Items = this.TCObject.Items;
            this.OnSelectionChanged = this.subscribe("OnClick", options.OnClick); 
        } else {
            this.error(ErrorMessages.OptionExpectedError, "TCObject.Items"); 
        }        
    },
    
    logStart: function () {

        Log.AppendFolder(this.ClrClassName + " " + this.Name);
        return this;
    },
   
    logContents: function () {
        var text = ""; 
        
        if (this.Items.Count == 0) {
            Log.Message(ErrorMessages.NoItems);
        } else {
            Log.AppendFolder(StatusMessages.Items);
            try {
                for (var i = 0; i < this.Items.Count; i++) {
                    Log.Message(this.getItemText(this.Items.Item(i)));
                }
            } finally {
                Log.PopLogFolder();
            }
        }
        return this;
    },

    click: function (options) {
        if (options && options.Text){
            this.TCObject.ClickItem(options.Text);
            this.publish("OnClick", {Text: options.Text});
        }
        return this;
    },
    
    // override in descendant classes to return text representing each item
    getItemText: function(item){
        this.error(ErrorMessages.NotImplementedError, "getItemText"); 
    } 
})