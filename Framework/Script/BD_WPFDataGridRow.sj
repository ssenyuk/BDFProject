//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes 
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFDataGridCell

/**
 * Contains object that encapsulates a single grid row
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFDataGridRow = WPFElement.extend({
    FrameworkClassName: "WPFDataGridRow",
    ErrorType: WPFDataGridRowError, 
    AllowedClassNames: ["Microsoft.Windows.Controls.DataGridRow"],
    Cells: null,
    
    init: function(options){
        this._super(options);
        
        this.Mapper.map([
            { Name: "Cells", ClrClassName: "DataGridCell", IsCollection: true, ClassType: WPFDataGridCell, Depth: 5 }
        ]);
    }

})