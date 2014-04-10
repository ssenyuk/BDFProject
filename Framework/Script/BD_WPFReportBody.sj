//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFReportSection

/**
 * Contains object that encapsulates a report body
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFReportBody = WPFElement.extend({
    FrameworkClassName: "WPFReportBody",
    ErrorType: WPFReportBodyError, 
    Sections: [], 
    
    init: function(options){
        this._super(options);
        
        this.mapSections(); 
    },
    
    // this method can be overridden in descendant classes to map specific sections of the 
    // report body, not just any Grid. 
    mapSections: function(){
        this.Mapper.map([
            {Name: "Sections", ClrClassName: "Grid", ClassType: WPFReportSection, Visible: true, IsCollection: true, Depth: 1}
        ]); 
    },
    
    logStart: function(){
        Log.AppendFolder("Body")
    },
    
    logContents: function(){
        Log.AppendFolder("Sections (" + this.Sections.length + ")"); 
        try{
            for(var prop in this.Sections){
                this.Sections[prop].log(); 
            }
        } finally {
            Log.PopLogFolder(); 
        }
    }
})