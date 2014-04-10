//USEUNIT BD_WPFClickable

/**
 * Contains object that encapsulates a worksheet tab item
 * @author Neda Sayan
 * @company BD Biosciences
 * @Date: 1/25/2014
 */
  
//*********************************************************************************
// history:
//   0  <Date>             <Name>           <CHANGES MADE>
//   1  01-25-2014         NSayan               Created
//   2  01-31-2014         NSayan           set name and text regardless of content
//   3  02-01-2014         NSayan           added getWorksheetTabName
//*********************************************************************************
var WPFWorksheetTabItem = WPFClickable.extend({ 
    FrameworkClassName: "WPFWorksheetTabItem",
    ErrorType: WPFWorksheetTabItemError,
    AllowedClassNames: ["System.Windows.Controls.TabItem"],    
    
    init: function(options){
        this._super(options);
        
        if (this.TCObject.HasContent && 
            this.TCObject.Content.DataContext && 
            this.TCObject.Content.DataContext.Header){
            this.Text = this.TCObject.Content.DataContext.Header.OleValue;
            this.Name = aqString.Replace(this.Text, " ", ""); 
        }else{ if (this.TCObject.HasHeader ){
            this.Text = this.TCObject.DataContext.Title.OleValue;
            this.Name = aqString.Replace(this.Text, " ", ""); 
        } }      
    },
    
    //get currently selected worksheet tab name
    getWorksheetTabName: function(){
       if( this.TCObject.DataContext.IsFocused ){
           return this.Name;
       } 
    }
    
})//
