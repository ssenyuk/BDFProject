//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement

/**
 * Contains object that encapsulates 
 * @author Noel Rice
 * @company Falafel Software
 */


var WPFListViewItem = WPFElement.extend({
    FrameworkClassName: "WPFListViewItem",
    ErrorType: WPFListViewItemError,
    AllowedClassNames: ["System.Windows.Controls.ListViewItem"],
    DataContext: null,

    refresh: function(){
        var elements = null; 
          
        if (this._super){
            this._super(); 
        }
        
        this.DataContext = this.TCObject.DataContext;
        this.Name = this.DataContext.Name.OleValue; 
        this.Text = this.DataContext.Name.OleValue;
        
        return this;        
    },
    
    click: function(options){
        this.TCObject.Click(); 
        return this; 
    },
      
    doubleClick: function(options){
        this.TCObject.dblClick(); 
        return this;  
    }
})