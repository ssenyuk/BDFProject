//===============================================================
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-17-2014 Galina Makhotkina A1QA added verifyPopulations(name), selectPopulation(name)
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_PlotEditor

var FSPlotEditorGeneral = FSPlotEditor.extend({
   
    PlotTypeComboBox: null,
    TubeComboBox: null,
    PlotTitleContentSampleCheckbox: null,
    PlotTitleContentTubeCheckbox: null,
    ParentPopulation: null, 
    
    init: function(options){
        this._super(options);
 
        this.Mapper.map([
            { Name: "PlotTypeComboBox", NativeClrObject: "PlotEditorCombo", ClassType: WPFComboBox, Depth: 20 },
            { Name: "TubeComboBox", NativeClrObject: "cmbBoxTubes", ClassType: WPFComboBox, Depth: 20 },
            { Name: "PlotTitleContentSampleCheckbox", NativeClrObject: "chkBoxSample", ClassType: WPFCheckbox, Depth: 20 },
            { Name: "PlotTitleContentTubeCheckbox", NativeClrObject: "chkBoxTube", ClassType: WPFCheckbox , Depth: 20 }            
            
        ]);  
    },

setPlotType: function(options) {
   if (options){
      this.PlotTypeComboBox.click({Text: options.PlotType});   
   }
   return this;
},

setTube: function(options) {
   if (options){
      this.TubeComboBox.click({Text: options.Tube});    
   }  
   return this;
},
setPlotTitleContentSample: function(options) {

   if (options) {
      this.PlotTitleContentSampleCheckbox.check();
   }
   return this;
},
setPlotTitleContentTube: function(options) {

   if (options) {
      this.PlotTitleContentTubeCheckbox.check();
   }
   return this;
},
getParentPopulation: function(){
      this.ParentPopulation = this.Finder.find({NativeClrObject: "populationsTree", Depth: 15})
                                   .cast(WPFTreeView);
      return  this.ParentPopulation;
},
    
///* @description This function will be used for verify object in 'Primary Data Source'.
//* @param {String} <name> this parameter is name object.
//*/ 
//verifyPopulation: function(name)
//{
//  this.getParentPopulation();
//      var item = this.ParentPopulation.item({Text:name});
//      if(!item){
//          this.error("'%s' %s", name, "not found in 'Primary Data Source'" );
//          return;
//      }  
//      this.logMessage([name, " found in 'Primary Data Source'"]);
//  return true;
//},
    
   /* @description This function will be used to verify objects in 'Primary Data Source'.
   * @param {String []} <name> this parameter is name object.
   */ 
   verifyPopulations: function(name){
      this.getParentPopulation();
      for (var i in name){
         var item =  this.ParentPopulation.Finder.find({Text:name[i]})
                                                 .cast(WPFTextBlock);
         if(!item){
            this.error("'%s' %s", name[i], "not found in 'Primary Data Source'" );
            return;
         }  
      this.logMessage([name[i], " found in 'Primary Data Source'"]);                                                                      
      }          
      return true;
   },
    
   /* @description This function will be used to selected object in 'Primary Data Source'.
   * @param {String} <name> this parameter is name object.
   */  
   selectPopulation: function(name){
      this.getParentPopulation();
      var item = this.ParentPopulation.item({Text:name});
      item.TCObject.Click();
      itemCheckbox = item.Finder.find({ClrClassName:"Checkbox"}).cast(WPFCheckbox);
      itemCheckbox.check();
   }
//,
///* @description This function will be used to get Parameters tab.
//*/  
//getParametersTab: function (){
//  this.selectParametersTab();
//  return this.cast(FSPlotEditorParameters);
//}
}); 
