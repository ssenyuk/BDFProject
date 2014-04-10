//USEUNIT BD_App

/**
 * contains a one-off utility to test the depth and composition of the class hierarchy under an application  
 * @author Noel Rice
 * @company Falafel Software
 */


// object to run one time and get unique list of clr class types in project
// and the number levels in the element tree
var AppScan = App.extend({
    FrameworkClassName: "AppScan",
    Level: 0,
    MaxLevel: 0,
    Elements: {},

    run: function () {
        this._super();
        this._load(this.Process);
    },

    _load: function (currentElement) {
        for (var i = 0; i < currentElement.ChildCount; i++) {
            var element = currentElement.Child(i);
            if (element.WaitProperty("ClrClassName", "*", 0)) {
                if (element.ClrClassName) {
                    if (this.Elements[element.ClrClassName]) {
                        this.Elements[element.ClrClassName] = {
                            Count: this.Elements[element.ClrClassName].Count + 1,
                            FullClassName: element.ClrFullClassName
                        };
                    } else {
                        this.Elements[element.ClrClassName] = {
                            Count: 1,
                            FullClassName: element.ClrFullClassName
                        };
                    }
                    if (element.ChildCount > 0) {
                        this.Level = this.Level + 1;
                        this._load(element);
                        if (this.Level > this.MaxLevel) {
                            this.MaxLevel = this.Level;
                        }
                        this.Level = this.Level - 1;
                    }
                }
            }
        }
    },

    log: function (options) {
        var total = 0;
        for (element in this.Elements) {
            var current = this.Elements[element]; 
            Log.Message(element + "(" + current.Count + ") - " + current.FullClassName);
            total = total + 1;
        }
        Log.Message("Total: " + total);
        Log.Message("Max Levels: " + this.MaxLevel); 
    }
});