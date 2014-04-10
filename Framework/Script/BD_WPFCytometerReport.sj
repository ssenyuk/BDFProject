//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFReportBase
//USEUNIT BD_WPFCytometerReportPage

/**
 * Contains object that encapsulates a Cytometer characterization report
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFCytometerReport = WPFReportBase.extend({
    FrameworkClassName: "WPFCytometerReport", 
    ErrorType: WPFCytometerReportError,

    mapReportPages: function(){
        this.Mapper.map([{
            Name: "Pages",
            ClrClassName: "FixedPage",
            IsCollection: true,
            ClassType: WPFCytometerReportPage, 
            Depth: 10
        }]);    
    },

    logStart: function(){
        Log.AppendFolder("Cytometer Report")
    }
})