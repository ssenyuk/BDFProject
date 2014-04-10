//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

//USEUNIT FS_PlotEditor

var FSPlotEditorDisplay = FSPlotEditor.extend({
    
    SizeInPixelsRadioButton: null, 
    SizeInInchesRadioButton: null,
    SizeWidthTextBox: null,
    SizeHeightTextBox: null,
    
    BorderOutlineFullRadioButton: null,
    BorderOutlineHalfRadioButton: null,
    ShowLogScaleGridLinesCheckBox: null,
    
    TitleFontFamilyComboBox: null,
    TitleFontSizeComboBox: null,
    TickLabelFontSizeComboBox: null,
    AxisLabelFontSizeComboBox: null,
    TitleVisibleCheckbox: null,
    AxisLabelsVisibleCheckbox: null,
    
    init: function(options){
        this._super(options);
        
        
       this.Mapper.map([
            { Name: "SizeInPixelsRadioButton", NativeClrObject: "rdoPixels", ClassType: WPFRadioButton, Depth: 10 },
            { Name: "SizeInInchesRadioButton", NativeClrObject: "rdoInches", ClassType: WPFRadioButton, Depth: 10 },
            { Name: "SizeWidthTextBox", NativeClrObject: "txtWidth", ClassType: WPFTextBox, Depth: 10 },
            { Name: "SizeHeightTextBox", NativeClrObject: "txtHeight", ClassType: WPFTextBox, Depth: 10 },
            
            { Name: "BorderOutlineFullRadioButton", NativeClrObject: "rdoIsFullBorderOutlineFull", ClassType: WPFRadioButton, Depth: 10 },
            { Name: "BorderOutlineHalfRadioButton", NativeClrObject: "rdoIsFullBorderOutlineHalf", ClassType: WPFRadioButton, Depth: 10 },
            { Name: "ShowLogScaleGridLinesCheckBox", NativeClrObject: "chkLogScale", ClassType: WPFCheckbox, Depth: 10 },
                        
            { Name: "TitleFontFamilyComboBox", NativeClrObject: "cmbTitleFontFamily", ClassType: WPFComboBox, Depth: 10 },          
            { Name: "TitleFontSizeComboBox", NativeClrObject: "cmbTitleFontSize", ClassType: WPFComboBox, Depth: 10 }, 
            { Name: "TickLabelFontSizeComboBox", NativeClrObject: "cmbTickLabelFontSize", ClassType: WPFComboBox, Depth: 10 },                   
            { Name: "AxisLabelFontSizeComboBox", NativeClrObject: "cmbAxisLabelFontSize", ClassType: WPFComboBox, Depth: 10 },          
            { Name: "TitleVisibleCheckbox", NativeClrObject: "chkTitleVisible", ClassType: WPFCheckbox, Depth: 10 },
            { Name: "AxisLabelsVisibleCheckbox", NativeClrObject: "chkAxisLabelsVisible", ClassType: WPFCheckbox, Depth: 10 } 
                        
        ]);     
        
    },
   

setGridOutlineToFull: function( options) {
   if (options){
      this.BorderOutlineFullRadioButton.check(); 
   }
   return this;
},

setGridOutlineToHalf: function( options) {
   if (options){
      this.BorderOutlineHalfRadioButton.check(); 
   }
   return this;
},

setSizeInPixels: function( options) {
   if (options){
      this.SizeInPixelsRadioButton.check();
   } 
   return this;
},

setSizeInInches: function( options) {
   if (options){
      this.SizeInInchesRadioButton.check();
   } 
   return this;
},

setSizeWidth: function (options) {
   if (options.sizeWidth){
      this.SizeWidthTextBox.text(options.sizeWidth);
   }
   return this;
},

setSizeHeight: function (options) {
   if (options.sizeHeight){
      this.SizeHeightTextBox.text(options.sizeHeight);
   }
   return this;
},

setShowLogScaleGridLines: function() {

   this.ShowLogScaleGridLinesCheckBox.check();
   return this;
},

setTitleFontFamily: function( options) {
   if (options.titleFontFamily){
      this.TitleFontFamilyComboBox.click({Text: options.titleFontFamily});
   } 
   return this;
},

setTitleFontSize: function( options) {
   if (options.titleFontSize){
      this.TitleFontSizeComboBox.click( { Text: options.titleFontSize });
   } 
   return this;
},

setTickLabelFontSize: function( options) {
   if (options.tickLabelFontSize){
      this.TickLabelFontSizeComboBox.click( { Text: options.tickLabelFontSize });
   } 
   return this;
},

setAxisLabelFontSize: function( options) {
   if (options.axisLabelFontSize){
      this.AxisLabelFontSizeComboBox.click( { Text: options.axisLabelFontSize });
   } 
   return this;
},

setTitleToVisible: function( ) {
      this.TitleVisibleCheckbox.check(); 
      return this;  
},

setTitleToInvisible: function( ) {
      this.TitleVisibleCheckbox.uncheck();
      return this;   
},

setAxisLabelsToVisible: function( ) {
      this.AxisLabelsVisibleCheckbox.check();   
      return this;
},

setAxisLabelsToInvisible: function( ) {
      this.AxisLabelsVisibleCheckbox.uncheck(); 
      return this;  
}

}); 