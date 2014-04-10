//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSHierarchyWindow used to work with hierarchy window  
// of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. FACSuite should be run. Window
// ExperimentView shoud be opened. Display Hierarchy button should be
// selected.
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-07-2014 Galina Makhotkina A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_BaseWindow
//USEUNIT CM_pressKey
//USEUNIT FS_WPFTextBlock
//USEUNIT FS_DeleteGateConfirmationDialog

var FSHierarchyWindow = BaseWindow.extend({  
  
   GateHierarchy: null,  
   PopulationHierarchy: null, 
  
   init: function(options){
      this._super(options);       
      this.Mapper.map([
          { Name: "GateHierarchy", NativeClrObject: "GateHierarchyExpander", ClassType: WPFElement, Depth: 15 },  
          { Name: "PopulationHierarchy", NativeClrObject: "PopulationHierarchyExpander ", ClassType: WPFElement, Depth: 15 } 
      ]);
   },
    
   /* @description This function will be used for get Gate Hierarchy List.
   */ 
   getGateTree: function(){
      var gateTree = this.GateHierarchy.Finder.find({NativeClrObject: "GateHierarchy", Depth: 15})
                                              .cast(WPFTreeListView);
      return  gateTree;
   },
    
   /* @description This function will be used for select option NOT for namePopulation
   * @param {String} <namePopulation> this parameter is name population.
   */  
   selectOptionNot: function(namePopulation){
      var itemNamePopulation = this._getContextMenu(namePopulation);
      itemNamePopulation.TCObject.PopupMenu.Click("NOT");
   },
   
   /* @description This function will be used for select option OR for namePopulation
   * @param {String} <namePopulation> this parameter is name population.
   */  
   selectOptionOr: function(namePopulations){    
      this.selectOption(namePopulations, "OR");
   },
   
   /* @description This function will be used for select option AND for namePopulation
   * @param {String []} <namePopulations> this parameter is name population.
   */  
   selectOptionAND: function(namePopulations){
      this.selectOption(namePopulations, "AND");
   },
   
   /* @description This function will be used for select option Delete for namePopulation
   * @param {String[]} <namePopulations> this parameter is name population.
   */  
   selectOptionDelete: function(namePopulations){
      this.selectOption(namePopulations, "Delete");
   },
   
   /* @description This function will be used for select option Rest Of for namePopulation
   * @param {String[]} <namePopulations> this parameter is name population.
   */  
   selectOptionRestOf: function(namePopulations){
      this.selectOption(namePopulations, "REST OF");
   },
    
   /* @description This function will be used for select option Delete for namePopulation
   * @param {String[]} <namePopulations> this parameter is name population.
   * @param {String} <nameOption> this parameter is option in context menu.
   */  
   selectOption: function(namePopulations, nameOption){
      for (var i in namePopulations){
         var itemNamePopulation = this.getPopulation(namePopulations[i]);
         if (i!=0){
            itemNamePopulation.TCObject.Click(1,1,skCtrl);
         }
         else {
            itemNamePopulation.TCObject.Click();
         }  
         if(i == namePopulations.length-1){
            var itemNamePopulation = this._getContextMenu(namePopulations[i]);   
            itemNamePopulation.TCObject.PopupMenu.Click(nameOption);
         }            
      }   
   },
    
   /* @description This function will be used to open all expandes
   */ 
   openAllExpandes: function(){
      var selector = {ClrClassName: "TreeListItem",  "Content.Expanded": "False", "Content.HasChildren": "True", Depth: 15};
      var items = this.GateHierarchy.Finder.findAll(selector);
      while(items.length>0){     
         for (var i in items){
            var listItem = items[i].cast(WPFTreeListItem);
            var expander = listItem.Finder.find({ClrClassName: "TreeListRowExpander"})
                                          .cast(WPFTreeListRowExpander);
            expander.click();   
          }
          items = this.GateHierarchy.Finder.findAll(selector);
      }            
   },
   
    /* @description This function will be used to open all expandes
    */ 
    openAllExpandesPopulation: function(){
         var selector = {ClrClassName: "TreeListItem",  "Content.Expanded": "False", "Content.HasChildren": "True", Depth: 15};
         var items = this.PopulationHierarchy.Finder.findAll(selector);
         while(items.length>0){     
            for (var i in items){
                    var listItem = items[i].cast(WPFTreeListItem);
                    var expander = listItem.Finder.find({ClrClassName: "TreeListRowExpander"})
                                                  .cast(WPFTreeListRowExpander);
                    expander.click();
                    Delay(2000);   
            }
           items = this.PopulationHierarchy.Finder.findAll(selector);
         }            
    },
    
   /* @description This function will be used to verify population events
   * @param {String[]} <dataToVerify> this parameter is dataToVerify.
   */ 
   verifyPopulationsEvents: function(dataToVerify){
      for (var i in dataToVerify){
         if (i !== "Name"){
            var name  = i;
            if (i.indexOf(" ") < 0){
                name = i.replace(/Q1_/g,"")  
            }
            var selector = {ClrClassName: "TreeListItem", Depth: 15, "Content.Name": name, "Content.GatedEvents": dataToVerify[i]};      
            var item = this.PopulationHierarchy.Finder.find(selector);
            if (!item){
               this.error("'%s' %s", i, " not found in Populations");
               return;
            }   
            this.logMessage([i, " found in Populations and count events are ", dataToVerify[i]]);        
         } 
      } 
      return true; 
   },
    
   /* @description This function is needed to expand the window down for visibility tree populations
   */ 
   expandWindow: function(){
      var resizer =  this._getLowRightResizer();
      resizer.TCObject.Drag(1,1,1,2*this.TCObject.Height);
   },

   /* @description This function will be used to get population in tree
   * @param {String} <namePopulation> this parameter is name population.
   */  
   getPopulation: function(namePopulation){
      var gateTree = this.getGateTree();
      var itemNamePopulation = gateTree.item({Text: namePopulation});
      return itemNamePopulation;
   },
    
   /* @description This function will be used to select option Properties for namePopulation
   * @param {String} <namePopulation> this parameter is name population.
   */  
   selectOptionProperties: function(namePopulation){
      var itemNamePopulation = this._getContextMenu(namePopulation);
      itemNamePopulation.TCObject.PopupMenu.Click("Properties");
   },  
    
   /* @description This function will be used for set coordinates for object
   */      
   setCoordinates: function(){
      var distanceX = 0;
      var distanceY = 0;
      if (this.TCObject.ScreenLeft>20){
         distanceX = this.TCObject.ScreenLeft - 10;
      }
      this.TCObject.Drag(20, 20, -distanceX, distanceY);     
   },
    
   /* @description This function will be used for verify object in 'Gate Hierarchy'.
   * @param {String []} <namePopulations> this parameter is name population. 
   */ 
   verifyPopulations: function(namePopulations){
      for (var i in namePopulations){
         var itemNamePopulation = this.getPopulation(namePopulations[i]);
         if(!itemNamePopulation){
            this.logMessage([namePopulations[i], " was't found in 'Hierarchy'"]); 
            return;
         }  
         this.logMessage([namePopulations[i], " was found in 'Hierarchy'"]);                                                                     
       }          
       return true;
   } ,
        
   /* @description This function will be used for verify object in 'Gate Hierarchy'.
   * @param {String} <namePopulation> this parameter is name population.
   * @param {String} <subNamePopulation> this parameter is name sub population.   
   */ 
   verifyPopulation: function(namePopulation, subNamePopulation){
      var itemNamePopulation = this.getPopulation(namePopulation);
      var itemSubNamePopulation = this.getPopulation(subNamePopulation);
      if (itemNamePopulation && itemSubNamePopulation){
         this.logMessage([subNamePopulation, " child ", namePopulation]);
         return true;
      }
      this.error("'%s' %s '%s'", namePopulation, "not child", subNamePopulation);
      return;
   },
    
   /* @description This function will be used to confirm delete population.
   * @param {String} <namePopulation> this parameter is name population.
   * @param {String} <subNamePopulation> this parameter is name sub population.   
   */ 
   confirmDelete: function(){
      // confirmation window is not a child of a Hierarhy window
      var dialogConfirmation = this.App.waitForWindow({Text: "Confirm Gate Delete"});
      dialogConfirmation.cast(FSDeleteGateConfirmationDialog).clickOk();
   },
    
   /* @description This function will be used to get showPopulationStatsCheckBox .
   * @returns checkbox 'ShowPopulationStats'
   */
   getShowPopulationStatsCheckBox: function() {
      var checkboxShowPopulationStats = this.Finder.find({NativeClrObject: "ShowPopulationStatsCheckBox", Depth: 10})
                                                   .cast(WPFCheckbox);
      return checkboxShowPopulationStats;
   },
   
   /* @ignore
   * @description This function will be used to get low right resizer
   * @returns resizer
   */ 
   _getLowRightResizer: function(){
      var resizers = this.Finder.findAll({ClrClassName: "Resizer"});
      var maxTop = 0;
      var maxLeft = 0;
      var resizer = null;
      for (var i in resizers){
         if (resizers[i].TCObject.Top > maxTop && resizers[i].TCObject.Left > maxLeft){
            maxTop = resizers[i].TCObject.Top;
            maxLeft = resizers[i].TCObject.Left;
            resizer = resizers[i].cast(WPFElement);
         }
       }
      return resizer;  
   },
    
   /* @ignore
   * @description This function will be used to get context menu
   * @param {String} <namePopulation> this parameter is name population.
   */ 
   _getContextMenu: function(namePopulation){
       var itemNamePopulation = this.getPopulation(namePopulation);
       itemNamePopulation.rightClick();  
       Delay(1000);  
       return itemNamePopulation;
   }
}); 