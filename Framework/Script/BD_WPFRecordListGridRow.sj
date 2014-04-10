//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_GridRow

/**
 * Contains object that encapsulates a grid row
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFRecordListGridRow = GridRow.extend({
    FrameworkClassName: "WPFRecordListGridRow",
    ErrorType: WPFRecordListGridRowError,
    AllowedClassNames: ["Infragistics.Windows.DataPresenter.DataRecordPresenter"],
    IsExpanded: null,
    Expandable: false,
    IsSelected: null,
    IsParentRow: null,
    
    init: function(options){
        this._super(options); 
        
        this.Expandable = false; 
        if (this.propertyExists("ExpansionIndicatorVisibility")){
            var visibility = this.TCObject.ExpansionIndicatorVisibility; 
            this.Expandable = visibility.OleValue === visibility.Collapsed.OleValue ||
                 visibility.OleValue === visibility.Visible.OleValue; 
        }
        
        if (this.propertyExists("IsExpanded")){
            this.IsExpanded = this.TCObject.IsExpanded; 
        }
        
        if (this.propertyExists("IsSelected")){
            this.IsSelected = this.TCObject.IsSelected; 
        } 
        
        if (this.propertyExists("Record")){
            this.IsParentRow = this.TCObject.Record.ParentRecord === null;   
        }
    },
    
    expand: function(){
        if (this.Expandable){
            this.TCObject.IsExpanded = true;
            this.Grid.refresh(); 
        }
    },
    
    collapse: function(){
        if (this.Expandable){
            this.TCObject.IsExpanded = false; 
            this.Grid.refresh(); 
        }
    },
        
    select: function(){
        this.TCObject.IsSelected = true;
    },
    
    unselect: function(){
        this.TCObject.IsSelected = false; 
    }
})