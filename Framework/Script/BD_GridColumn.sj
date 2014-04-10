//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_Element

/**
 * Contains object that encapsulates a grid column
 * @author Noel Rice
 * @company Falafel Software
 */

var GridColumn = Element.extend({
    FrameworkClassName: "GridColumn",
    ErrorType: GridColumnError,
    Name: null,
    Index: -1,
    Text: null
})