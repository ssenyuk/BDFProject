//USEUNIT BD_TestCompleteBase
//USEUNIT BD_Utils
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates locating elements
 * @author Noel Rice
 * @company Falafel Software
 */

var Finder = TestCompleteBase.extend({
    FrameworkClassName: "Finder",
    ErrorType: FinderError,

    // returned Result may be null
    find: function (options) {
        var result = null;
        var finder = this; 
        
        options.WaitFunction = function(e){
            var child = null, vbArr = null;
            
            var findProps = finder.formatFindProps(options); 

            if (findProps.PropNames.length > 0 && findProps.PropValues.length > 0) {

                child = finder.TCObject.FindChild(findProps.PropNames,
                    findProps.PropValues, findProps.Depth);

                if (child && child.Exists) {
                    result = new Base({
                        TCObject: child, 
                        App: finder.App
                    });
                }
            }            
            if (result){
                e.Result = result; 
                e.Done = true;
            } 
        }      
            
        this._wait(options);                                       
        
        return result;            
    },

    // returned Result may have zero items
    findAll: function (options) {
        var result = [];
        var finder = this; 
         
        options.WaitFunction = function(e){
            var children = null, vbArr = null;
            
            var findProps = finder.formatFindProps(options); 

            if (findProps.PropNames.length > 0 && findProps.PropValues.length > 0) {        
        
                vbArr = finder.TCObject.FindAllChildren(findProps.PropNames,
                    findProps.PropValues, findProps.Depth);

                if (vbArr != undefined) {
                    children = new VBArray(vbArr).toArray();
                    if (children && children.length > 0) {
                        for (child in children) {
                            result.unshift(new Base({
                                TCObject: children[child],
                                App: finder.App
                            }));
                        }
                    }
                }
            }
            if (result && result.length > 0){
                e.Result = result; 
                e.Done = true;
            }
        }      
            
        this._wait(options);                                       
        
        return result;
    },  

    formatFindProps: function (options) {
        var propNames = [],
            propValues = [],
            depth = options.Depth ? options.Depth : 
                this.App.Settings.Finder.Settings.Depth.Value;

        if (options) {
            // flatten NativeClrObject.Name to just NativeClrObject
            // for ease of use by consumer, add manually and 
            // remove from options
            if (options.NativeClrObject != undefined){
                propNames.push("NativeClrObject.Name"); 
                propValues.push(options.NativeClrObject); 
            }
            
            // record Depth and remove from options
            if (options.Depth != undefined) {
                depth = options.Depth;
            }
            
            // add other find criteria, ignore options
            // used by wait and those that are mapped differently 
            for(var prop in options){
                if (prop != "Depth" && 
                    prop != "NativeClrObject" &&
                    prop != "Timeout" &&
                    prop != "Name" &&
                    prop != "Duration" &&
                    prop != "Interval" &&
                    prop != "WaitFunction" &&
                    prop != "Description" &&
                    prop != "OnCompleted" &&
                    prop != "OnTimedOut" &&
                    prop != "Sender" &&
                    prop != "Subscriber" &&
                    prop != "Params"
                ){
                    propNames.push(prop);
                    propValues.push(options[prop]);
                }               
            }

            if (propNames.length < 1) {
                this.error(ErrorMessages.FinderErrorNoProps); 
            }
            if (propValues.length < 1) {
                this.error(ErrorMessages.FinderErrorNoValues); 
            }
            return {
                "PropNames": propNames,
                "PropValues": propValues,
                "Depth": depth
            };
        } else {
            this.error(ErrorMessages.FinderErrorNoOptions);
        }
    },
    
    // private methods
    
    _wait: function(options){
        var description = options.Description ? options.Description : 
            this.FrameworkClassName + " options: " + new BDUtils().optionPropertiesToString(options);
        var duration = options.Duration ? options.Duration : 
            this.App.Settings.Timeouts.Settings.Long.Value;
        var interval = options.Interval ? options.Interval : 
            this.App.Settings.Timeouts.Settings.Interval.Value;
        var onCompleted = options.OnCompleted ? options.OnCompleted : null; 
        var onTimedOut = options.OnTimedOut ? options.OnTimedOut : null; 
        var subscriber = options.Subscriber ? options.Subscriber : this.Subscriber;
        
        this.wait({
            Subscriber: subscriber,
            Description: description,
            Duration: duration,
            Interval: interval,
            OnCompleted: onCompleted,
            OnTimedOut: onTimedOut,            
            WaitFunction: options.WaitFunction,
            Params: options.Params 
        });                   
    }
    
});