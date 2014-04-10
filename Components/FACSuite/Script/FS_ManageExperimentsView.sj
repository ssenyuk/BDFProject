//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

var FSManageExperimentsView = WPFElement.extend({
    ExperimentsShortcuts: null,
    ExperimentsListView: null,
    NewExperimentButtons: null,
    Name: "ManageExperimentsView",
    
    init: function(options){
        this._super(options); 
        
        this.Mapper.map([
            { Name: "ExperimentsShortcuts", NativeClrObject: "experimentsShortcutsListBox", ClassType: WPFListBox, Depth: 20 },
            { Name: "NewExperimentButtons", NativeClrObject: "shortCutSplitButton", ClassType: WPFClickable, Depth: 40 }
        ]);
        
        this.ExperimentsShortcuts.subscribe("OnClick", this.shortcutsClick); 
    },
    
    refresh: function(){
        if (this._super()){
            this._super(); 
        }
        this.Mapper.map([
            { Name: "ExperimentsListView", NativeClrObject: "ExperimentsListView", ClassType: WPFListView, Depth: 20 }
        ]);   
    },
    
    shortcutsClick: function(e){
        e.Subscriber.refresh(); 
    },
    
     /* @description This function will be used for add new experiment
    */ 
    addExperiment: function(){
        this.NewExperimentButtons.click();
    },

    logStart: function(){
        Log.AppendFolder("ManageExperimentsView"); 
    }
});