//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes

/**
 * Contains object that maps a limited set of ClrClassNames to framework types
 *
 * @author Noel Rice
 * @company Falafel Software
 */
 
 var ClassMap = {
    "System.Windows.Controls.TextBox": WPFTextBox,
    "System.Windows.Controls.Button": WPFButton,
    "System.Windows.Controls.ComboBox": WPFComboBox
 }