//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFReportPageBase

/**
 * Contains object that encapsulates a BD Cytometer report page
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFCytometerReportPage = WPFReportPageBase.extend({
    FrameworkClassName: "WPFCytometerReportPage",
    ErrorType: WPFCytometerReportPageError,

    // Elements are named on the report only on the first page, but can only be found 
    // by position in the following page. Depth will have to be
    // narrow to restrict the scope. This will make it harder to 
    // to maintain, but is necessary. If these pieces can be named,
    // then the depth restriction can be relaxed.
    //
    //  System.Windows.Documents.FixedPage
    //    Grid
    //      DockPanel
    //        Grid (header)
    
    mapHeader: function(){
        var element = this.Mapper.findOnPath([
            {ClrClassName: "Grid", ClassType: Element, Depth: 1},
            {ClrClassName: "DockPanel", ClassType: Element, Depth: 1},
            {ClrClassName: "Grid", ClassType: Element, WPFControlIndex: 1, Depth: 1},
            {ClrClassName: "Grid", ClassType: Element, Depth: 2}
        ]);
        if (element){
            return element.cast(WPFReportHeader); 
        } 
    },
    
    mapBody: function(){
        var element = this.Mapper.findOnPath([
            {ClrClassName: "Grid", ClassType: Element, Depth: 1},
            {ClrClassName: "DockPanel", ClassType: Element, Depth: 1},
            {ClrClassName: "StackPanel", ClassType: Element, Depth: 1}
        ]);
        if (element){
            return element.cast(WPFReportBody); 
        }
    },
    
    mapFooter: function(){
        var element = this.Mapper.findOnPath([
            {ClrClassName: "Grid", ClassType: Element, Depth: 1},
            {ClrClassName: "DockPanel", ClassType: Element, Depth: 1},
            {ClrClassName: "Grid", ClassType: Element, WPFControlIndex: 2, Depth: 1}
        ]); 
        if (element) {
            return element.cast(WPFReportFooter);     
        }
    }
})