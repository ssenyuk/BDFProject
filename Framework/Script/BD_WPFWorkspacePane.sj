//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFElement
//USEUNIT BD_WPFButton
//USEUNIT BD_WPFShadowTextBlock

/**
 * Contains object that encapsulates the custom workspace pane.
 *
 * WorkspacePane must be added to TestComplete menu Tools | Current Project Properties, then
 * select Open Applications | WPF from the treeview on the left. Finally, add WorkspacePane to the
 * list on the Composite controls tab.
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFWorkspacePane = WPFElement.extend({
    FrameworkClassName: "WPFWorkspacePane",
    ErrorType: WPFWorkspacePaneError, 
    AllowedClassNames: ["BD.FACSuite.CustomControls.Panels.WorkspacePane"],
    TitleTextBlock: null,
    Buttons: {},  
    
    init: function(options){
        this._super(options); 
        
        this.Mapper.map([
            { Name: "TitleTextBlock", ClrClassName: "ShadowTextBlock", ClassType: WPFShadowTextBlock, Depth: 10 }
        ]);
        
        this.Text = this.TitleTextBlock.Text; 
        
        // find and map buttons onto the Buttons property
        var buttonMapper = new Mapper({
            App: this.App,
            Finder: this.Finder,
            MapToFrameworkObject: this.Buttons
        });
        
        buttonMapper.map([
            { Name: "Maximize", NativeClrObject: "PART_MaxBtn", ClassType: WPFButton, Depth: 10 },
            { Name: "Restore", NativeClrObject: "PART_RestoreBtn", ClassType: WPFButton, Depth: 10 },
            { Name: "Close", NativeClrObject: "PART_CloseBtn", ClassType: WPFButton, Depth: 10}
        ]);
        
        // name each button to use the easy-to-ready property name instead of the NativeClrObject
        for(var prop in this.Buttons){
            this.Buttons[prop].Name = prop;  
        }
    },
    
    logContents: function(){
        this._super(); 
        Log.AppendFolder("Buttons");
        for(var prop in this.Buttons){
            this.Buttons[prop].log(); 
        } 
        Log.PopLogFolder(); 
    }
})