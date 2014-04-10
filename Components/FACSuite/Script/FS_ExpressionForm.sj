//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_WPFActionable



var FSExpressionForm = WPFElement.extend({
    //
    FrameworkClassName: "FSExpressionForm", 
    expTextBoxes: null,
    name: null,
    divideButton: null,
    expressionEditor: null,
    result: null,
    prefix: null,
    suffix:null,
    decplaces: null,
    advSearch : null,
    comments: null,
    
    refresh: function(){
    
        if (this._super){
            this._super();             
        }
        //
        this.Mapper.map([
            { Name: "name", NativeClrObject: "NameTextBox", ClassType: WPFTextBox, Depth: 15 },
            //{ Name: "expressionEditor", NativeClrObject: "ExpressionEditorTextBoxUserControl", ClassType: WPFTextBox, Depth: 10 },           
            { Name: "advSearch", NativeClrObject: "SearchResultsExpander", ClassType: WPFExpander, Depth: 10 },
            { Name: "divideButton", NativeClrObject: "DivisionToolbarButton", ClassType: WPFButton, Depth: 10 },            
            { Name: "prefix", NativeClrObject: "PrefixTextBox", ClassType: WPFTextBox, Depth: 10 },
            { Name: "suffix", NativeClrObject: "SuffixTextBox", ClassType: WPFTextBox, Depth: 10 },    
            { Name: "decplaces", NativeClrObject: "DecimalsToShowComboBox", ClassType: WPFComboBox, Depth: 10 },
            { Name: "comments", NativeClrObject: "CommentsTextBox", ClassType: WPFTextBox, Depth: 10 }                              
        ]);  
       // 
       this.expressionEditor = this.Finder.find({NativeClrObject: "ExpressionEditorTextBoxUserControl", Depth: 10 }); 
          
       //get all textboxes in expression tab
       this.expTextBoxes = this.Finder.findAll({ClrClassName: "TextBox", Depth: 20});
    },
    //
    updateForm : function(options){
       if( options){
          if( options.name ){
             this.name.text(options.name);
          }
          //
          if( options.prefix || options.suffix || 
               options.decplaces || options.comments || 
               options.result ){
               
                // make sure items in window are available
                if( this.advSearch.IsExpanded ){
                    this.advSearch.collapse();
                }
                // advanced search "collapsed" window content
                if( !this.advSearch.IsExpanded ){
                      // result
                      if( options.result ){
                         this.result = this.expTextBoxes[2].cast(WPFTextBox);
                         var outrslt = this.result.Text;
                      } 
                      //prefix
                      if( options.prefix ){
                         this.prefix.text( options.prefix );
                      }
                      //suffix
                      if( options.suffix ){
                         this.suffix.text( options.suffix );                     
                      }  
                      //expression
                      if( options.expressionEditor ){
                         this.expressionEditor.TCObject.Keys( options.expressionEditor );
                      }                      
                      //dec. places
                      if( options.decplaces ){
                         this.decplaces.click({Text: options.decplaces});
                      }
                      //comments
                      if( options.comments ){
                         this.comments.text( options.comments );
                      } 
                      //                                  
                }else{
                    //
                    this.error("result,Prefix,Suffix, decimal places and comments controls are not visible....you need to collapse Advenced Search");
                    //
                }// content update
          }
       }
    },
    //
    getExpressionData : function(options){
       // TBD
    },
    //
    log: function(){
        this._super();  
        this.log();  
    }
    //
}); 