//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_UserManagement

/**
 * Description: class for the Department tab of the UserManagement window 
 */


var FSUserManagementDepartments = BaseWindow.extend({

    init: function(options){
        this._super(options);
        
        this.Mapper.map([          
            { Name: "NewDepartmentButton", NativeClrObject: "AddDepartmentButton", ClassType: WPFButton, Depth: 20 }
        ]);
    },
 
 createNewDepartment: function( ) {
   this.NewDepartmentButton.click();
   return this;
},

splitAddress: function  (string, interval) {
var result = [];
for (var i=0; i<string.length; i+=interval)
  result.push(string.substring (i, i+interval));
return result;
},

setNewDeparmentValues: function (departmentNameValue, directorNameValue, instituteNameValue, addressArray){

  var departmentName = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "DepartmentNameTextBox", Depth: 20}).cast(WPFTextBox);
  var directorName = this.Finder.find({ClrClassName: "ComboBox", NativeClrObject: "DirectorNameComboBox", Depth: 20}).cast(WPFComboBox);
  var institutionName = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "InstitutionNameTextBox", Depth: 20}).cast(WPFTextBox);
  var addressLine1 = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddressLine1TextBox", Depth: 20}).cast(WPFTextBox);
  var addressLine2 = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddressLine2TextBox", Depth: 20}).cast(WPFTextBox);
  var addressLine3 = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddressLine3TextBox", Depth: 20}).cast(WPFTextBox);
  var addressLine4 = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddressLine4TextBox", Depth: 20}).cast(WPFTextBox);
  var addressFields = [addressLine1, addressLine2, addressLine3, addressLine4];
  var doneButton = this.Finder.find({ClrClassName: "Button", NativeClrObject: "CreateUpdateDepartmentButton", Depth: 20}).cast(WPFButton);
    
  departmentName.text(departmentNameValue);
  directorName.TCObject.Keys(directorNameValue);
  institutionName.text(instituteNameValue);

for (i=0; i<addressArray.length; i++)
    {addressFields[i].text(addressArray[i])};

  doneButton.click();

return departmentName, directorName, institutionName, addressArray;
}

}); 