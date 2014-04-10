//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFReportSection

/**
 * Contains object that encapsulates a report body
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFReportHeader = WPFReportSection.extend({
    FrameworkClassName: "WPFReportHeader", 
    ErrorType: WPFReportHeaderError, 
    
    logStart: function(){
        Log.AppendFolder("Header")
    }
})