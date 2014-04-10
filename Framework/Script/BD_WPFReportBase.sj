//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFReportPageBase

/**
 * Contains object that encapsulates a Microsoft DocumentGrid
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFReportBase = WPFElement.extend({
    FrameworkClassName: "WPFReportBase",
    ErrorType: WPFReportBaseError,
    AllowedClassNames: ["MS.Internal.Documents.DocumentGrid"],
    Pages: [],
    
    init: function(options){
        this._super(options);
        
        this.mapReportPages(); 
        
        var index = 1; 
        
        for(var prop in this.Pages){
            this.Pages[prop].Index = index;
            index = index + 1;  
        }
    },
    
    // override this method in descendant objects to change mapping of
    // the report Pages element
    mapReportPages: function(){
        this.error(ErrorMessages.NotImplementedError, "mapReportPages"); 
    },
    
    logStart: function(){
        Log.AppendFolder("Report")
    },
    
    logContents: function(){
        if (this.Pages.length > 0){
            for(var prop in this.Pages){
                var page = this.Pages[prop]; 
                page.log(); 
            }
        } else {
            Log.Message(StatusMessages.NoItems); 
        }
    }
})