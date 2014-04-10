//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script FSPlot used to work with plot window  
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
// ExperimentView shoud be opened.On the canvas  should be  have at 
// least one plot 
//
// External Files Required for the Script:
// -
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-01-2014 Dmitry Lemeshko A1QA Created
//===============================================================

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSPlot = WPFPlotControl.extend({
ImageStartX: null,
ImageStartY: null,
ImageHeight: null,
ImageWidth: null,
LineAxisMax: 260,
    
    init: function(options){
        this._super(options); 
        this.Mapper.map([
            { Name: "txtYParameter", NativeClrObject: "txtYParameter", ClassType: WPFTextBlock, Depth: 25 },
            { Name: "txtXParameter", NativeClrObject: "txtXParameter", ClassType: WPFTextBlock, Depth: 25 }
        ]);  
    },
    
    refresh: function(){
        if (this._super()){
            this._super(); 
        }
    },
    
    /* @description This function will be used for get coordinates Image
    */     
    getImageCoordinates: function(){
        this.ImageStartX = this.TCObject.Left;
        this.ImageStartY = this.TCObject.ScreenTop;
        this.ImageHeight = this.TCObject.Height;
        this.ImageWidth = this.TCObject.Width;     
    },

   
    /* @description This function will be used for create gate area on coordinates as parameters function
    */     
    createGateArea: function(options){ 
       var coordinates = this.getLogicalCoordinateInPixels(options);
        if(coordinates){ 
            this.TCObject.Drag(coordinates.startX , coordinates.startY, coordinates.distanceX, coordinates.distanceY);
        }
    },

     /* @description This function will be used for get XAxis on coordinates as parameters function
    */    
    getXAxis:function(coordinates){ 
       
        if(coordinates){ 
            var degreeStartX = coordinates.startX/10;
            var degreeEndX = coordinates.endX/10;
            var startX = 50 + 30*(degreeStartX - 1);
            var endX = 50 + 30*(degreeEndX - 1);
            var distanceX = endX - startX;
        }
    }, 
    
     /* @description This function will be used for convert logical coordinates in pixels
    */    
    getLogicalCoordinateInPixels: function(options){
        var coordinates = {};
        coordinates.startX = options[0];
        coordinates.distanceX = options[1] - options[0];
        coordinates.startY = options[2];
        coordinates.distanceY = options[3] - options[2];
//        this.getImageCoordinates();
//        var coordinates = {};
//        if (options){
//          if(options.XAxisType==='line'){
//              coordinates["StartX"] = this.ImageStartX+this.ImageWidth*options.GateStartX/this.LineAxisMax;
//              coordinates["EndX"] = this.ImageStartX+this.ImageWidth*options.GateEndX/this.LineAxisMax;
//          }
//          if(options.YAxisType==='line'){
//              coordinates["StartY"] = this.ImageStartY+this.ImageHeight*options.GateEndY/this.LineAxisMax;
//              coordinates["EndY"] = this.ImageStartY+this.ImageHeight*options.GateStartY/this.LineAxisMax;    
//          }
//        }
        return coordinates;
    },

     /* @description This function will be used for click gate
    */             
    click: function(options){
      if (options) {
        this.Finder.find(options).TCObject.Click();
        return;
      }
        this.TCObject.Click(); 
    },    
        
     /* @description This function will be used for click gate coordinates
    */             
    clickGate: function(coordinates){
        if(coordinates){
            this.TCObject.Click((coordinates["EndX"]-coordinates["StartX"])/2,coordinates["EndY"]); 
        }       
    }
});