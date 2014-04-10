//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT CM_pressKey

/**
@description When you create a gate, highlight it, and 
             press F4, then this properties menu will come out.
             This class is for that properties window       
@author Ken Johnson
@param 
@type <b>Array</b>          
@returns  
@comments  
@memberOf       
*/
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-18-2014 Galina Makhotkina A1QA Modify setGateName, added close
//===============================================================

var FSProperties = BaseWindow.extend({

   FrameworkClassName: "FSProperties",
        
    init: function(options){
        this._super(options);
     
         this.Mapper.map([
            { Name: "TxtName", NativeClrObject: "txtName", ClassType: WPFTextBox, Depth: 20 }
            // There are other controls on this window, such as checkboxes.  Add them in as 
            // needed. 
         ]);      
    },
    
    // set gate name 
    /*
    description:  renames the gate. In doing so it will bring out the 
                  properties window, and type in the new name into the 
                  text field.  The window will close and the gate will 
                  be renamed. If options.txtName is not passed in, then
                  nothing will happen and control will return to the calling
                  program. 
    parameters:
       txtName -  the new name for the gate
    called from: - called from renameGate method. 
    */  
    setGateName: function(options){ 
       if (options.txtName){ 
          // Get the focus on the textbox.  This is a critical step if
          // you want to close the window and to rename the gate 
          this.TxtName.TCObject.Click();
          this.TxtName.text( options.txtName ); // write the name in the textbox.
       }
       return this;
    },
    
    /* @description This function will be used for close window
    */     
    close: function() {
       this.TxtName.TCObject.Keys("[Enter]"); 
                                // press carriage return to make the window close and
                               // and to have the gate name rewritten. Note, if you do not
                               // get the focus above then the window will close, but the
                               // gate will not get renamed, SO, never remove this step -   
    }
}); 