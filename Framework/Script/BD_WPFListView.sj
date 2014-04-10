//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFListViewItem

/**
 * Contains object that encapsulates a WPF ListView
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFListView = WPFElement.extend({
    FrameworkClassName: "WPFListView",
    ErrorType: WPFListViewError,
    AllowedClassNames: ["System.Windows.Controls.ListView"],
    Items: [],
    Selected: null,
    OnSelectionChanged: null,

    init: function (options) {
        this._super(options);
        
        if (options){
            this.OnSelectionChanged = 
                this.subscribe("OnSelectionChanged", options.OnSelectionChanged); 
        }
    },

    refresh: function () {
        var element = null,
            elements = null,
            item = null;

        if (this._super){
            this._super(); 
        }
        
        this.Items = []; 
        
        elements = this.Finder.findAll({
            ClrClassName: "ListViewItem",
            Depth: 5
        })

        for (element in elements) {
            this.Items.push(elements[element].cast(WPFListViewItem));
        }

        return this;
    },

    _select: function (options) {
        // click or doubleClick was attempted, so a previous selection is invalid.
        this.Selected = null; 
        this.refresh(); // keep the internal list in-sync, avoid "objects disconnected" error 
        if (options) {
            if (options.Name) {
                for (item in this.Items) {
                    if (this.Items[item].Name == options.Name) {
                        this.Selected = this.Items[item]; 
                        this.publish("OnSelectionChanged");
                        return this;
                    }
                }
            }
        }
        return this;
    },

    click: function (options) {
        this._select(options);
        if (this.Selected) {
            this.Selected.click();
            return this.Selected; 
        }
    },

    doubleClick: function (options) {
        this._select(options);
        if (this.Selected) {
            this.Selected.doubleClick();
            return this.Selected; 
        }
    }
})