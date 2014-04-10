//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Base

/**
 * Contains object that encapsulates mapping TestComplete objects to framework objects
 * @author Noel Rice
 * @company Falafel Software
 */

var Mapper = Base.extend({
    FrameworkClassName: "Mapper",
    ErrorType: MapperError,
    MapToFrameworkObject: null,
    Finder: null,
    
    init: function(options){
        this._super(options);
        this.validateInitOptions(["MapToFrameworkObject", "Finder"]);
    },

    // map between the TestComplete find criteria and an element's properties. 
    map: function(classMap){
        var element = null;
        
        for (var item in classMap) {
            element = this._findMappedElement(classMap[item]);  
            
            if (element){
                this.MapToFrameworkObject[classMap[item].Name] = element;
            } else {
                var messageArray = [];
                for(var prop in classMap[item]){
                    if (typeof classMap[item][prop] !== "function")
                    messageArray.push(prop + ": " + classMap[item][prop]); 
                }
                //'"%s" not found during map()using options "%s", values "%s" and Depth %i'
                this.error(ErrorMessages.MapperMapError, classMap[item].Name, messageArray.join());                   
            }
        }
    },  
        
    // find a single element at the end of a path
    findOnPath: function(classMap){
        if (classMap.length > 0){

            // find the first element
            var element = this._findMappedElement(classMap[0]);
            
            for (var index in classMap) {
                if (element){
                    if (index > 0){
                        element = element.Mapper._findMappedElement(classMap[index]);
                    }
                } else {
                    this.error(ErrorMessages.MapperFindOnPathError, classMap[index], index); 
                    return;                 
                }
            } 
        } else {
            this.error(ErrorMessages.NoItemsFoundInCollection, "classMap", "findOnPath"); 
        }
        return element; 
    },
    
    // private methods
    
    _getNewArray: function(){
        return function(){
            return []; 
        }
    },
    
    _assignMapOptions: function(mapItem){
        var result = {}; 
     
        if (!mapItem.ClassType){
            this.error(ErrorMessages.MapperMissingClassType, mapItem.Name);              
        }
        
        // copy over any find properties and values
        for(var prop in mapItem){
            // ignore properties not used by the find
            if (prop != "Name" && 
                prop != "ClassType" && 
                prop != "IsCollection" &&
                prop != "Options"){
                result[prop] = mapItem[prop];    
            }
        }
        return result; 
    },
    
    // find a single element using one of the parameters from the map() method
    _findMappedElement: function(mapItem){
        var options = {}, item = null, findResult = null, items = this._getNewArray()();
        
        var options = this._assignMapOptions(mapItem); 
        
        var findResult = mapItem.IsCollection ? this.Finder.findAll(options) : this.Finder.find(options); 
            
        if (findResult){
            if (mapItem.IsCollection){
                for(var element in findResult){
                    item = mapItem.ClassType ? findResult[element].cast(mapItem.ClassType, mapItem.Options) : findResult[element]; 
                    items.unshift(item); 
                }
                return items;     
            } else {
                return mapItem.ClassType ? findResult.cast(mapItem.ClassType, mapItem.Options) : findResult;   
            } 
        } else {
            return null; 
        }   
    }
});