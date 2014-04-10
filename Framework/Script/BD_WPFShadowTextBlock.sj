//USEUNIT BD_WPFTextBlock
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

/**
 * Contains object that encapsulates a custom ShadowTextBlock
 *
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFShadowTextBlock = WPFTextBlock.extend({
    FrameworkClassName: "WPFShadowTextBlock",
    ErrorType: WPFShadowTextBlockError, 
    AllowedClassNames: ["BD.FACSuite.CustomControls.ShadowTextBlock"]
})