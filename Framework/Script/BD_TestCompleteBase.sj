//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Event

/**
 * Contains object that encapsulates a TestComplete object. 
 * Introduces the TCObject property that holds the TestComplete object
 * This object also checks for valid clr full class names. 
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var TestCompleteBase = Event.extend({
    FrameworkClassName: "TestCompleteBase",
    ErrorType: TestCompleteBaseError,
    TCObject: null, // object used by TestComplete
    // valid TestComplete ClrFullClassName values this class can map to
    AllowedClassNames: [],

    init: function (options) {
        this._super(options);

        if (this.validateInitOptions(["TCObject"]))
        {
            if (this.propertyExists("ClrClassName")){    
                this["ClrClassName"] = this.TCObject.ClrClassName;
            }
        
            if (this.propertyExists("ClrClassName")){     
                this["ClrFullClassName"] = this.TCObject.ClrFullClassName;
            }
            
            if (this.propertyExists("NativeClrObject")){
                if (aqObject.IsSupported(this.TCObject.NativeClrObject, "Name")){
                    if (this.TCObject.NativeClrObject.Name.OleValue){
                        this["Name"] = this.TCObject.NativeClrObject.Name.OleValue;
                    }
                }
            }
        } 
                    
        this._validateClassNames(); 
    },
    
    propertyExists: function(prop){
        var result = false; 
        if (this.TCObject && prop) {
            result = aqObject.IsSupported(this.TCObject, prop); 
        }        
        return result; 
    },
    
    // copy TC properties
    // Caution: this method can be time consuming as it copies all TestComplete
    // properties to the object.
    copyProperties: function(){
        var obj = aqObject.GetProperties(this.TCObject, false); 

        while ( obj.HasNext() )
        {
            var prop = obj.Next();
            var isPrivate = aqString.SubString(prop.Name, 0, 1) == "_";
            if (!isPrivate){
                if (typeof prop == "object"){
                    if (prop.Value && prop.Value.OleValue){
                        this[prop.Name] = prop.Value.OleValue;
                    }
                } else {
                    this[prop.Name] = prop.Value;
                }
            }             
        }
    },
    
    // Private methods
    
    // Verify that TCObject AllowedClassNames are valid
    _validateClassNames: function(){
        // any ClrFullClassName is valid
        if (this.AllowedClassNames.length == 0 || this.TCObject.ClrFullClassName == undefined){
            return; 
        } else {
            // look for a matching full class name
            for(var index in this.AllowedClassNames){
                if (this.AllowedClassNames[index] == this.TCObject.ClrFullClassName){
                    return; 
                }                        
            }
        }
        
        this.error(ErrorMessages.InvalidClassName, this.FrameworkClassName,  
            this.TCObject.ClrFullClassName, this.AllowedClassNames.join()); 
    }       
})