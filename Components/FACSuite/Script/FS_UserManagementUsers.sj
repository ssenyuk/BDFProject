//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT CM_ApplicationHelper
//USEUNIT FS_UserManagement
//USEUNIT FS_UserManagementSettings

/**
* Description: class for the Users tab of the UserManagement window 
*/
var FSUserManagementUsers = BaseWindow.extend({
 
     init: function(options){
        this._super(options);
        
        this.Mapper.map([          
            { Name: "NewUserButton", NativeClrObject: "CreateUserButton", ClassType: WPFButton, Depth: 20 },
            { Name: "TabControl", ClrClassName: "TabControl", ClassType: WPFTabControl, Depth: 10 }
        ]);
    },
 
/* @ignore
* @description This function will be used for clicking "New User" button.
*/     
createNewUser: function( ) {
   this.NewUserButton.click();
   return this;
},

/* @ignore
* @description This function will be used for selecting existing user by ID.
*/ 
selectUserByID: function(userID){
   var userDataGridRow = this.Finder.find({ClrClassName:"DataGridRow","DataContext.Name": userID, Depth: 20}).cast(WPFElement);
   userDataGridRow.rightClick();
   return userDataGridRow;
},

/* @ignore
* @description This function will be used for verifying corresponding user values.
*/ 
verifyUserValues: function(options){
   var userDataGridRow = this.Finder.find({ClrClassName:"DataGridRow","DataContext.Name": options.userID, Depth: 20}).cast(WPFElement);
   
   var firstNameFromGrid = userDataGridRow.Finder.find({ClrClassName:"DataGridCell","WPFControlIndex": 1, Depth: 20}).cast(WPFElement);
   var lastNameFromGrid = userDataGridRow.Finder.find({ClrClassName:"DataGridCell","WPFControlIndex": 2, Depth: 20}).cast(WPFElement);
   var userIDFromGrid = userDataGridRow.Finder.find({ClrClassName:"DataGridCell","WPFControlIndex": 3, Depth: 20}).cast(WPFElement);
   var statusFromGrid = userDataGridRow.Finder.find({ClrClassName:"DataGridCell","WPFControlIndex": 5, Depth: 20}).cast(WPFElement);
   var departmentFromGrid = userDataGridRow.Finder.find({ClrClassName:"DataGridCell","WPFControlIndex": 6, Depth: 20}).cast(WPFElement);
   var institutionFromGrid = userDataGridRow.Finder.find({ClrClassName:"DataGridCell","WPFControlIndex": 7, Depth: 20}).cast(WPFElement);
   var phoneFromGrid = userDataGridRow.Finder.find({ClrClassName:"DataGridCell","WPFControlIndex": 8, Depth: 20}).cast(WPFElement);
   var emailFromGrid = userDataGridRow.Finder.find({ClrClassName:"DataGridCell","WPFControlIndex": 9, Depth: 20}).cast(WPFElement);
   
if (options.firstName){
   if (options.firstName == firstNameFromGrid.Text) 
       {this.logMessage(aqString.Format("First name value: %s", firstNameFromGrid.Text))}};
if (options.lastName){       
   if (options.lastName == lastNameFromGrid.Text) 
       {this.logMessage(aqString.Format("Last name value: %s", lastNameFromGrid.Text))}};
if (options.userID){
   if (options.userID == userIDFromGrid.Text) 
       {this.logMessage(aqString.Format("User ID value: %s", userIDFromGrid.Text))}};
if (options.status){
   if (options.status == statusFromGrid.Text) 
       {this.logMessage(aqString.Format("Status value: %s", statusFromGrid.Text))}};
if (options.department){       
   if (options.department == departmentFromGrid.Text) 
       {this.logMessage(aqString.Format("Department name value: %s", departmentFromGrid.Text))}};
if (options.institution){       
   if (options.institution == institutionFromGrid.Text) 
       {this.logMessage(aqString.Format("Institution value: %s", institutionFromGrid.Text))}};
if (options.phone){       
   if (!phoneFromGrid.Text)
       {this.logMessage("Phone field is blank")};
   if (options.phone == phoneFromGrid.Text) 
       {this.logMessage(aqString.Format("Phone value: %s", phoneFromGrid.Text))}};
if (options.email){       
   if (!emailFromGrid.Text)
       {this.logMessage("Email field is blank")};
   if (options.email == emailFromGrid.Text) 
       {this.logMessage(aqString.Format("Email value: %s", emailFromGrid.Text))}};
                    
   return userDataGridRow;
},

/* @ignore
* @description This function will be used for setting values into fields required for creating new user.
*/ 
setNewUserValues: function (options){

  var firstName = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModeFirstNameTextBox", Depth: 20}).cast(WPFTextBox);
  var lastName = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModeLastNameTextBox", Depth: 20}).cast(WPFTextBox);
  var userID = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModeUserIdTextBox", Depth: 20}).cast(WPFTextBox);
  var title = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModeTitleTextBox", Depth: 20}).cast(WPFTextBox);
  var status = this.Finder.find({ClrClassName: "ComboBox", NativeClrObject: "AddModeStatusComboBox", Depth: 20}).cast(WPFComboBox);
  var department = this.Finder.find({ClrClassName: "ComboBox", NativeClrObject: "AddModeDepartmentComboBox", Depth: 20}).cast(WPFComboBox);
  var phone = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModePhoneTextBox", Depth: 20}).cast(WPFTextBox);
  var email = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModeEmailTextBox", Depth: 20}).cast(WPFTextBox);
  var role = this.Finder.find({ClrClassName: "ComboBox", NativeClrObject: "AddModeRoleComboBox", Depth: 20}).cast(WPFComboBox);
  var passExpiration = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModePasswordExpiryDateTextBox", Depth: 20}).cast(WPFTextBox);
  var tempPassword = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModeTemporaryPasswordTextBox", Depth: 20}).cast(WPFTextBox);
  var notes = this.Finder.find({ClrClassName: "TextBox", NativeClrObject: "AddModeNotesTextBox", Depth: 20}).cast(WPFTextBox);
  var addUserButton = this.Finder.find({ClrClassName: "Button", NativeClrObject: "AddUserButton", Depth: 20}).cast(WPFButton);
    
  firstName.text(options.firstNameValue);
  lastName.text(options.lastNameValue);
  userID.text(options.userIDValue);
  title.text(options.titleValue);
  status.click({Text: options.statusValue});
  department.click({Text: options.departmentValue});
  phone.text(options.phoneValue);
  email.text(options.emailValue);
  role.click({Text: options.roleValue});
  tempPassword.text(options.tempPasswordValue);
  notes.text(options.notesValue);
    
  this.TabControl.click({Text: "Settings"});
  var passExpirationTime = this.Finder.find({ClrClassName: "ComboBox", NativeClrObject: "PasswordExpirationDaysComboBox", Depth: 20}).cast(WPFComboBox);
  passExpirationTime.click({Text: options.passExpirationValue});
  this.TabControl.click({Text: "Users"});
  
  addUserButton.click();
  
return firstName, lastName, userID, title, status, department, phone, email, role, passExpiration, tempPassword, notes;
}

}); 

