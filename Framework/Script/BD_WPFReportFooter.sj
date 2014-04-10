//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFReportSection

/**
 * Contains object that encapsulates a report footer
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFReportFooter = WPFReportSection.extend({ 
    FrameworkClassName: "WPFReportFooter",
    ErrorType: WPFReportFooterError,  
    logStart: function(){
        Log.AppendFolder("Footer")
    }
})