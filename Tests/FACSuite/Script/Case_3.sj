//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script Case_3 is test for smoke testing (Application
// Smoke) of BD FACSuite applications
//
// NAME OF APPLICATION UNDER TEST:
// FACSuite
//
//===============================================================
// TEST CASE PURPOSE:
// Script contains test for the verification procedure FS-AP_SMOKE_AP_A 
//
// PRECONDITIONS AND SPECIAL ENVIRONMENT SETTINGS:
// An empty database should be loaded. Logging should be performed 
// on to the application.
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 04-04-2014 Sergei Seniuk A1QA Added Steps 1.1 - 1.7
//===============================================================

//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT SQE_LaunchLogIn 
//USEUNIT SQE_CreateDepartment
//USEUNIT SQE_CreateUser
//USEUNIT Steps_Case_3

var case_3 = 
    new VerificationCase({
        CaseNumber: "3",
        Description: "User Management",
        Steps: [
           new SqeKeyword(LaunchLogIn)
                .setStepNumber("1.1")
                .setKeywordParams({
                UserID: "BDAdministrator", 
                Password: "bdadministrator" 
            }),
           
            new SqeKeyword(CreateDepartment)
                .setStepNumber("1.2")
                .setKeywordParams({
                DepartmentName: "Oncology",
                Director: "Dr. King",
                Institution: "RUSH memorial Hospital",
                Address: "1234 Street, Lake view, Minneesota, USA, 600012"
            }),
                                                                                                             											                                                                                                                                                             		
            new SqeKeyword(CreateUser)
                .setStepNumber("1.3")
                .setKeywordParams({
                FirstName: "Mr. Liz",
                LastName: "Scott",
                UserID: "10001",
                Title: "",
                Status: "Active",
                Department: "Oncology",
                Phone: "",
                Email: "", 
                Role: "Operator",
                PasswordExpiration: "",
                TemporaryPassword: "1234",
                Notes: ""                
             }),
             
            new StepExecution(GetUserManagement)
                .setStepNumber("1.4"),
                
            new StepExecution(SelectUser)
                .setStepNumber("1.5")
                .setStepParams({UserID: "10001"}),  
                
            new StepVerification(VerifyUser)
               .setStepNumber("1.6")
               .setStepParams({FirstName: "Mr. Liz", LastName: "Scott", UserID: "10001", Status: "Active", 
               Department: "Oncology", Institution: "RUSH memorial Hospital"}), 

            new StepVerification(VerifyUserPhoneAndEmail)
               .setStepNumber("1.7")
               .setStepParams({UserID: "10001", Phone: " ", Email: " "}) 
             
        ]                
    })