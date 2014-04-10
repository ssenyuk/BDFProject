//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFReportBody
//USEUNIT BD_WPFReportFooter
//USEUNIT BD_WPFReportHeader

/**
 * Contains object that encapsulates a Microsoft FixedPage.
 * Inherit from this class to create specific page types.
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFReportPageBase = WPFElement.extend({
    FrameworkClassName: "WPFReportPageBase", 
    ErrorType: WPFReportPageBaseError,
    AllowedClassNames: ["System.Windows.Documents.FixedPage"],
    Index: 0,
    Header: null, 
    Footer: null, 
    Body: null,
    
    init: function(options){
        this._super(options);
        
        this.mapReport();  
    },
    
    mapReport: function(){       
        this.Header = this.mapHeader();
        if (!this.Header instanceof WPFReportHeader){
            this.error(ErrorMessages.IncorrectType, "Header", "WPFReportHeader");        
        }

        this.Body = this.mapBody(); 
        if (!this.Body instanceof WPFReportBody){
            this.error(ErrorMessages.IncorrectType, "Body", "WPFReportBody"); 
        }
        
        this.Footer = this.mapFooter();
        if (!this.Footer instanceof WPFReportFooter){
            this.error(ErrorMessages.IncorrectType, "Footer", "WPFReportFooter");       
        }           
    },
    
    // in the inherited class, override mapHeader(), mapFooter() and mapBody() to 
    // return instances of WPFReportHeader, WPFReportBody and WPFReportFooter, respectively.
    
    mapHeader: function(){
        this.error(ErrorMessages.NotImplementedError, "mapHeader"); 
    },
    
    mapBody: function(){
        this.error(ErrorMessages.NotImplementedError, "mapBody");  
    },
    
    mapFooter: function(){
        this.error(ErrorMessages.NotImplementedError, "mapFooter");
    },    

    logStart: function(){
        Log.AppendFolder("Page " + this.Index)
    },
    
    logContents: function(){
        if (this.Header){
            this.Header.log();
        }
        if (this.Body){
            this.Body.log()
        }
        if (this.Footer){
            this.Footer.log();
        }
    }
})