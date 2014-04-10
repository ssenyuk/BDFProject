//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFTabControl
//USEUNIT FS_WorklistView

var FSWorklistPanelAcquisition = FSWorklistView.extend({

   
    FrameworkClassName: "FSWorklistPanelAcquisition",
    ErrorType: WPFTextBlockError,
    
    FlowRateComboBox: null,
    EventsToDisplayComboBox: null,
    AcqTimeValueTextBlock: null,
    ProcessedEventsValueTextBlock: null,
    ThresholdEventsValueTextBlock: null,
    ThresholdRateValueTextBlock: null,
  

    init: function(options){
        this._super(options);
        
        
       this.Mapper.map([
                       
            { Name: "FlowRateComboBox", NativeClrObject: "flowRateComboBox", ClassType: WPFComboBox, Depth: 10 },          
            { Name: "EventsToDisplayComboBox", NativeClrObject: "eventsToDisplayComboBox", ClassType: WPFComboBox, Depth: 10 },
            { Name: "AcqTimeValueTextBlock", NativeClrObject: "acqTimeValueTextBlock", ClassType: WPFTextBlock, Depth: 10 },
            { Name: "ProcessedEventsValueTextBlock", NativeClrObject: "processedEventsValueTextBlock", ClassType: WPFTextBlock, Depth: 10 },
            { Name: "ThresholdEventsValueTextBlock", NativeClrObject: "thresholdEventsValueTextBlock", ClassType: WPFTextBlock, Depth: 10 },
            { Name: "ThresholdRateValueTextBlock", NativeClrObject: "thresholdRateValueTextBlockXXX", ClassType: WPFTextBlock, Depth: 10 }

          //  { Name: "AdvancedStatusExpander", NativeClrObject: "AcquisitionAbortExpander", ClassType: WPFTreeListItem, Depth: 10 }
                                               
        ]);
         
      
             
    },
   
    setFlowRate: function( options) {
       ErrorType: WPFComboBoxError;
       
       if ( ! this.FlowRateComboBox) {
          this.error(ErrorMessages.setFlowRateNotSet );
          return "error setFlowRate not set";
       }
       
       if (options.flowRate){     
          this.FlowRateComboBox.click({Text: options.flowRate}); 
       } else {
          this.error(ErrorMessages.setFlowRateNoParamPassed );
          return "error setFlowRate no param passed"; 
       }
    },
    setEventsToDisplay: function( options) {
       if (options.eventsToDisplay){
          this.EventsToDisplayComboBox.click( { Text: options.eventsToDisplay });
       } 
    },
    getTime: function( ) {   
       return this.AcqTimeValueTextBlock.Text;     
    },
    getProcessedEvents: function( ) {   
       return this.ProcessedEventsValueTextBlock.Text;     
    },  
    getThresholdEvents: function( ) {   
       return this.ThresholdEventsValueTextBlock.Text;     
    },
    getThresholdRate: function( ) {  
       ErrorType: WPFTextBlockError;
       if ( this.ThresholdRateValueTextBlock ) {
          return this.ThresholdRateValueTextBlock.Text; 
       } else {
          this.error(ErrorMessages.getThresholdRate );
          return "error getThresholdRate not set"; 
       }  
    },
    onError: function(e) {
      if( e.Error instanceof WPFTextBlockError ) { 
         Log.Message("Handling WPFTextBlockError");
      }
    }
    
}); 