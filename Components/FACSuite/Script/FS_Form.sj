//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_ClassMap

/**
 * Contains object that encapsulates entry form elements textbox, buttons, comboboxes.
 *
 * Caveats: Each field must have NativeClrObject.Name defined. There is no 
 * safety code checking this.
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var FSForm = WPFElement.extend({
    FrameworkClassName: "FSForm", 
    Fields: {},

    init: function(options){
        this._super(options);
        
        for(var fullClassName in ClassMap){
            var classType = ClassMap[fullClassName]; 
            var elements = this.Finder.findAll({
                ClrFullClassName : fullClassName
            });
            for(var index in elements){
                var element = elements[index].cast(classType);
                element.Name = element.TCObject.NativeClrObject.Name;
                this.Fields[element.Name] = element; 
            } 
        }         
    },
    
    logContents: function(){
        this._super(); 
        
        Log.AppendFolder("Fields");
        
        for(var prop in this.Fields){
            this.Fields[prop].log(); 
        }
        
        Log.PopLogFolder();  
    }
}); 