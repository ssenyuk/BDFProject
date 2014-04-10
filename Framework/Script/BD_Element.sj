//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_TestCompleteBase
//USEUNIT BD_Finder
//USEUNIT BD_Mapper

/**
 * Contains on-screen element type that can find and map other on-screen elements. 
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var Element = TestCompleteBase.extend({
    FrameworkClassName: "Element",
    ErrorType: ElementError,
    Finder: null,
    Mapper: null,

    init: function (options) {
        this._super(options); 
        
        this.refresh();         
    },
    
    refresh: function () {
        if (this.propertyExists("Refresh")){
            this.TCObject.Refresh(); 
        }    
    
        this.Finder = new Finder({
            App: this.App,
            Subscriber: this.Subscriber ? this.Subscriber : this,
            TCObject: this.TCObject
        });
                
        this.Mapper = new Mapper({
            App: this.App,
            Finder: this.Finder,
            MapToFrameworkObject: this
        });

        if (!this.Name && this.propertyExists("get_Name")) {
            this["Name"] = this.TCObject.get_Name();
        }
        
        if (this.propertyExists("Enabled")) {
            this["Enabled"] = this.TCObject.Enabled;
        }
         
        if (this.propertyExists("Exists")) {
            this["Exists"] = this.TCObject.Exists;
        }
        
        if (this.propertyExists("VisibleOnScreen")) {
            this["Visible"] = this.TCObject.VisibleOnScreen;
        }
            
        return this;
    }
});