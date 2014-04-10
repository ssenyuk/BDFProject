//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_WorklistView

//USEUNIT BD_GridCellXamComboEditor

var FSWorklistPanelWorklistEntries = FSWorklistView.extend({

    WorklistEntriesGrid: null,
   
    init: function(options){
        this._super(options);
          
       this.Mapper.map([
                           
            { Name: "WorklistEntriesGrid", ClrClassName : "WorklistGridControl", ClassType: WPFWorklistGridControl, Depth: 20 }         
                                 
        ]);    
        
      
    },
  
    
    getGridTask: function(rownum) {
       var row = this.WorklistEntriesGrid.Rows.Items[rownum];
       if ( row ) { 
          var taskCell = row.Cells.Items.Task; 
          taskCell.log(); 
          return taskCell;
       } else {
          return "row not defined";
       }
    },               
    getGridStatus: function(rownum) {
       var row = this.WorklistEntriesGrid.Rows.Items[rownum];
       if ( row ) { 
          var taskCell = row.Cells.Items.Status; 
          taskCell.log(); 
          return taskCell;
       } else {
          return "row not defined";
       }
    },      
    getGridLocation: function(rownum) {
       var row = this.WorklistEntriesGrid.Rows.Items[rownum];
       if ( row ) { 
          var taskCell = row.Cells.Items.Location; 
          taskCell.log(); 
          return taskCell;
       } else {
          return "row not defined";
       }
    },
    
    getGridSampleID: function(rownum) {
       var row = this.WorklistEntriesGrid.Rows.Items[rownum];
       if ( row ) { 
          
          var taskCell = row.Cells.Items.SampleID; 
          taskCell.log(); 
          return taskCell;
       } else {
          return "row not defined";
       }
    },
    getGridCell: function(rownum, colname) {
       var row = this.WorklistEntriesGrid.Rows.Items[rownum];
       if ( row ) { 
           switch( colname ) {
           
              case "SampleID":
                 var taskCell = row.Cells.Items.SampleID;
                 break;
              case "Task":
                 var taskCell = row.Cells.Items.Task;
                 break;
              case "Status":
                 var taskCell = row.Cells.Items.Status;
                 break;
              case "Location":
                 var taskCell = row.Cells.Items.Location;
                 break;
              case "SampleCarrier":
                 var taskCell = row.Cells.Items.SampleCarrier;
                 break;
              case "AcquisitionTime":
                 var taskCell = row.Cells.Items.AcquisitionTime;
                 break; 
              case "TubeID":
                 var taskCell = row.Cells.Items.TubeID;
                 break;
              default:
                 return "you supplied bad colname argument";
           } 
           taskCell.log(); 
           return taskCell;
       } else {
          return "row not defined";
       }
    },
    setTask: function ( rownum, value) {
       
        var row = this.WorklistEntriesGrid.Rows.Items[rownum];
        var taskCell = row.Cells.Items.Task;
        
        child = taskCell.TCObject.Child(0);
        taskCell.Mapper.map([
                    { Name: "myEditor", ClrClassName: child.ClrClassName, ClassType: GridCellXamComboEditor, Depth: 10 }
                ]);
        
        
        
        taskCell.myEditor.setIndex(value); 
    
    }
            
}); 