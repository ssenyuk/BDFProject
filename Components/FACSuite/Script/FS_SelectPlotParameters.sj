//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

/**
@description When you create a plot and right click a
             "Select Plot Parameters" window comes out. 
             This class is that window object 
@author Ken Johnson
@param 
@type <b>Array</b>          
@returns  
@comments  
@memberOf       
*/

var FSSelectPlotParameters = BaseWindow.extend({

   FrameworkClassName: "FSSelectPlotParameters",
   
   
      
    init: function(options){
        this._super(options);
     
        //  The items on the menu are dynamic, so you cannot map them
        //  directly. You must search and find them   
      
        // Find all the selections on this window
        // Note that all the items we want have a ClrClassName of "Label" so that 
        // is why we search for Label. Also note some of those labels might not 
        // even be on the list of things we want, but that will not matter because
        // below we search for just what we want and ignore the rest.      
        var labels = this.Finder.findAll({ClrClassName : "Label",  Enabled: true, Depth: 20  });
     
        // Now push all those values onto an array named "Labels".        
        Labels = [];
        for(var prop in labels){
           Labels.push(labels[prop].cast(WPFButton)); 
        }
              
    },
    
    // This method calls _clickParameter twice. The first
    // call selects the XAxis parameter; the second call selects
    // the YAxis parameter. After that, the window automatically 
    // closes.  
    selectParameters: function(options){  
       this._clickParameter(options.XParamName);
       aqUtils.Delay(2000);
       this._clickParameter(options.YParamName);
    },

    // clicks one value on the window, for example, "FSC-A"
    _clickParameter: function( param) {
        
       for (var myParam in Labels ) {
          // if it matches what you passed in (what you want) then click it.
          if ( Labels[myParam].Text == param) { 
             plotParam = Labels[myParam]; //gets the object
             plotParam.click();
             break; // once we find it, we're done, so break out of the loop
          }  
       }
      
    },
    
    // There is checkbox on this window and these functions
    // check and uncheck that box
    checkShortNames: function ( ) { 
       this.ShortNamesCheckbox.check();
    },
    uncheckShortNames: function ( ) { 
       this.ShortNamesCheckbox.uncheck();
    }
}); 