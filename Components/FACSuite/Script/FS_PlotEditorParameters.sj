//===============================================================
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-18-2014 Galina Makhotkina A1QA added setXLabel(textXLabel), setYLabel(textYLabel)
// 2 02-19-2014 Ivan Getsman A1QA added getXAxisCombobox(textXLabel), getYAxisCombobox(textYLabel), verifyAxis(options)
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_WPFComboBox
//USEUNIT FS_PlotEditor

var FSPlotEditorParameters = FSPlotEditor.extend({
    
    XParamNameComboBox: null,
    XParamScaleComboBox: null,
    YParamNameComboBox: null,
    YParamScaleComboBox: null,
    XRFactorTextBox: null,
    YRFactorTextBox: null,
    AutomaticScalingRadioButton: null,
    
    init: function(options){
        this._super(options);
        
        this.Mapper.map([
            { Name: "XParamNameComboBox", NativeClrObject: "cmbXParam", ClassType: WPFComboBox, Depth: 20 },
            { Name: "XParamScaleComboBox", NativeClrObject: "cmbXParamScale", ClassType: WPFComboBox, Depth: 20 },
            { Name: "YParamNameComboBox", NativeClrObject: "cmbYParamName", ClassType: WPFComboBox, Depth: 20 },
            { Name: "YParamScaleComboBox", NativeClrObject: "cmbYParamScale", ClassType: WPFComboBox, Depth: 20 },
            { Name: "XRFactorTextBox", NativeClrObject: "txtXRFactor", ClassType: WPFTextBox, Depth: 20 },
            { Name: "YRFactorTextBox", NativeClrObject: "txtYRFactor", ClassType: WPFTextBox, Depth: 20 }
            
          //  { Name: "AutomaticScalingRadioButton", NativeClrObject: "useAutomaticScalingButton", ClassType: WPFRadioButton, Depth: 20 }       
              
        ]);     
    },
    
   /* @description This function will be used for set X label.
   * This function have been added due to the fact that the function 'setXParamName' 
   * does not work correctly, the value of the combobox is not selected.
   * In connection with what has been created in the class FSWPFComboBox 
   * and method 'click' was overrided
   * @param {String} <option> this parameter is name new X param.
   */ 
   setXLabel: function(options){
      if (options.textXLabel){
         var cmbXParam = this._getXAxisCombobox(); 
         cmbXParam.click(options.textXLabel); 
      }                   
   },  
   
   /* @description This function will be used for set Y label.
   * This function have been added due to the fact that the function 'setYParamName' 
   * does not work correctly, the value of the combobox is not selected.
   * In connection with what has been created in the class FSWPFComboBox 
   * and method 'click' was overrided
   * @param {String} <option> this parameter is name new Y param.
   */ 
   setYLabel: function(options){
      if (options.textYLabel){
         var cmbYParam = this._getYAxisCombobox(); 
         cmbYParam.click(options.textYLabel); 
      }                   
    },  

setXParamName: function(options) {
   if (options.XParamName){
      this.XParamNameComboBox.click({Text: options.XParamName});
   }
   return this;
},

setXParamScale: function(options) {
   if (options.XParamScale){
      this.XParamScaleComboBox.click({Text: options.XParamScale}); 
   }
  
   return this;
},

setYParamName: function(options) {

   if (options.YParamName){
      this.YParamNameComboBox.click({Text: options.YParamName});    
   }
   return this;
},

setYParamScale: function(options) {
   if (options.YParamScale){
      this.YParamScaleComboBox.click({Text: options.YParamScale});
   }
   return this;
},

setXRFactor: function(options) {
   if (options.XRFactor){
      this.XRFactorTextBox.text(options.XRFactor); 
   }
   return this;
},
setYRFactor: function(options) {
   if (options.YRFactor){
      this.YRFactorTextBox.text(options.YRFactor); 
   }
   return this;
},
setAutomaticScaling: function( options) {
   if (options){
      this.AutomaticScalingRadioButton.check(); 
   }
   return this;
},

///* @description This function will be used to verify Axises
//* @param {String} <option> these parameters are XLabel and YLabel
//*/ 
//verifyAxises: function (options){
//   var cmbXParam = this.XParamNameComboBox.cast(FSWPFComboBox);
//   var cmbYParam = this.YParamNameComboBox.cast(FSWPFComboBox);
//   var labelX = cmbXParam.getText();
//   var labelY = cmbYParam.getText();
//   return options.txtXParameter === labelX && options.txtYParameter === labelY;
//},

setParamsScale: function(options){
   this.setXParamScale(options);
   this.setYParamScale(options);
},

   /* @ignore
   * @description This function return XParamNameComboBox
   */ 
   _getXAxisCombobox: function() {
      var cmbXParam = this.XParamNameComboBox.cast(FSWPFComboBox);
      return cmbXParam; 
   },
   
   /* @ignore
   * @description This function return YParamNameComboBox
   */ 
   _getYAxisCombobox: function() {
      var cmbYParam = this.YParamNameComboBox.cast(FSWPFComboBox); 
      return cmbYParam; 
   },
   
   /* @description This function verify Axis values
   */ 
   verifyAxis: function(options) {
      var expectedXAxis = options.X;
      var expectedYAxis = options.Y;
      var actualX = this._getXAxisCombobox().getText();
      var actualY = this._getYAxisCombobox().getText(); 
      if (actualX === expectedXAxis && actualY === expectedYAxis){
         this.logMessage(["X axis", " equals ", expectedXAxis]);
         this.logMessage(["Y axis", " equals ", expectedYAxis]);
         return true;
      }
      this.error("'%s' %s '%s'", actualX, " is not equal ", expectedXAxis);
      this.error("'%s' %s '%s'", actualY, " is not equal ", expectedYAxis);
      return false;
    }
}); 