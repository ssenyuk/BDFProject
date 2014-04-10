//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_WPFNumericUpDown

/**
 * Contains object that encapsulates an updown control with slider
 * @author Noel Rice
 * @company Falafel Software
 */

var WPFNumericUpDownSlider = WPFNumericUpDown.extend({
    FrameworkClassName: "WPFNumericUpDownSlider", 
    ErrorType: WPFNumericUpDownSliderError,
    AllowedClassNames: ["BD.FACSuite.CustomControls.NumericUpDownSlider"]
})