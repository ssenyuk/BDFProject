//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSManageWorklistView = WPFElement.extend({
  //  ExperimentsShortcuts: null,
  //  ExperimentsListView: null,
    Name: "ManageWorklistView",
    
    init: function(options){
        this._super(options); 
        
     //   this.Mapper.map([
     //       { Name: "ExperimentsShortcuts", NativeClrObject: "experimentsShortcutsListBox", ClassType: WPFListBox, Depth: 20 }
     //   ]);
        
      //  this.ExperimentsShortcuts.subscribe("OnClick", this.shortcutsClick); 
    },
    
    refresh: function(){
        if (this._super()){
            this._super(); 
        }
       // this.Mapper.map([
       //     { Name: "ExperimentsListView", NativeClrObject: "ExperimentsListView", ClassType: WPFListView, Depth: 20 }
        //]);   
    },
    
   // shortcutsClick: function(e){
   //     e.Subscriber.refresh(); 
   // },
    
    logStart: function(){
        Log.AppendFolder("ManageWorklistView"); 
    }
});