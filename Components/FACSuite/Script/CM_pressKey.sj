// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-01-2014 Galina Makhotkina A1QA Added Keyboard
//===============================================================

/**
Description:  Used to press keys on the keyboard. 

examples: 
   pressKey('[F4]');
   pressKey('[Enter]');
*/
function pressKey(key) {

      aqUtils.Delay(1000);
      Sys.Keys( key );    
      aqUtils.Delay(700);
} 
 
/* @description This function will be used for Delete from keyboard.
*/
function del(){
      pressKey("[Del]");
}

var Keyboard = {

   /* @description This function will be used for set text from keyboard.
   * @param {text} <string> this parameter is text for set text.
   */
   setText: function(text){
      Sys.Desktop.Keys(text);
   },
    
   /* @description This function will be used for Delete from keyboard.
   */
   del: function(){
      this.setText("[Del]");
   },

   /* @description This function will be used for Down from keyboard.
   */
   down: function (){
      this.setText("[Down]");
   },
    
   /* @description This function will be used for Clear from keyboard.
   */
   clear: function(){
      this.setText("[Clear]");
   },

   /* @description This function will be used for Win from keyboard.
   */
   win: function Win(){
      this.setText("[Win]");
   },

   /* @description This function will be used for Esc from keyboard.
   */
   esc: function(){
      this.setText("[Esc]");
   },

   /* @description This function will be used for Ctrl from keyboard.
   */
   ctrl: function(){
      this.setText("^");
   },

   /* @description This function will be used for Shift from keyboard.
   */
   shift: function(){
      this.setText("!");
   },

   /* @description This function will be used for Enter from keyboard.
   */
   enter: function(){
      this.setText("[Enter]");
   },

   /* @description This function will be used for Alt from keyboard.
   */
   alt: function (){
      this.setText("~");
   },

   /* @description This function will be used for CtrlShiftEsc from keyboard.
   */
   ctrlShiftEsc: function(){
      this.setText("[Hold]^![Esc][Release]");
   },

   /* @description This function will be used to simulate simultaneous pressing of several keys
   */
   hold: function (){
      this.setText("[Hold]");
   },

   /* @description This function will be used to simulate simultaneous hold keys 'Ctrl'
   */
   holdCtrl: function (){
      this.setText("[Hold]^");
   },
    
   /* @description This function will be used to deactivate [Hold]
   */
   release: function (){
      this.setText("[Release]");
   },

   /* @description This function will be used to save
   */
   save: function Save(){
      this.setText("^S");
   }
}
