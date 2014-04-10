//USEUNIT BD_Class

var BDUtils = Class.extend({
    FrameworkClassName: "BDUtils",
    textToName: function(text){
        // remove any non-alphanumeric characters. 
        // Example "Export to Print..." becomes "ExportToPrint"
        var re = /[^a-zA-Z0-9]+/g;
        return text.replace(re, "");    
    },
        
    toTitleCase: function(text){
        if (typeof text === "string"){
            var len = aqString.GetLength(text); 
            if (len > 1){        
                return aqString.ToUpper(
                    aqString.SubString(text, 0, 1)) + 
                    aqString.SubString(text, 1, len - 1)
            }
        }
        return text; 
    },
    
    optionPropertiesToString: function(options){
        var optionsArray = []; 
        
        for (var prop in options) {
            isPrivate = aqString.SubString(prop, 0, 1) == "_";
            if ((typeof options[prop] != "function") 
             //&& (typeof this[prop] != "object")
             && (!isPrivate)) {
                optionsArray.push(prop + ": " + options[prop]); 
            }
        }
        return optionsArray.join(); 
    },
    
    checksum: function(data)
    {
        var MOD_ADLER = 65521;
        var a = 1, b = 0;

        for (var i = 0;i < data.length;i++) 
        {
            a = (a + data.charCodeAt(i)) % MOD_ADLER;
            b = (b + a) % MOD_ADLER;
        }
        return a | (b << 16);
    },
    
    getElapsedTime: function(startDateTime){
        var result = {},
        // get the date difference in milliseconds
        temp = new Date().getTime() - startDateTime.getTime();
        result["Milliseconds"] = temp % 1000; // extract milliseconds
        temp /= 1000; // ignore milliseconds
        result["Seconds"] = temp % 60; // extract seconds
        temp /= 60; // ignore seconds
        result["Minutes"] = temp % 60; // extract minutes
        temp /= 60; // ignore minutes
        result["Hours"] = temp; // extract hours
        return result;    
    },
    
    // return a new copy of properties for sourceObject
    cloneProperties: function(sourceObject){
        var result = {};
        for(var prop in sourceObject){
            result[prop] = sourceObject[prop]; 
        }
        return result; 
    },
    
    // copy properties from source to target.
    // overwrite existing values of the same name.
    copyProperties: function(source, target){
        for(var prop in source){
            target[prop] = sourceObject[prop]; 
        }
        return target; 
    }
});