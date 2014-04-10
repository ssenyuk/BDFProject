//===============================================================
// GENERAL DESCRIPTION OF THE SCRIPT :
// Script Case_1_MultiColorGating is test for smoke testing (Application
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
// External Files Required for the Script:
// Lymphocytes_3,2f,16+56,2f,45,2f,4,2f,19,2f,8.fcs
//
// HISTORY:
// 0 <Date> <Name> <CHANGES MADE>
// 1 02-01-2014 Galina Makhotkina A1QA Created
// 2 02-17-2014 Ivan Getsman A1QA Added Steps 1.62 - 1.79
// 3 02-20-2014 Galina Makhotkina A1QA Added Steps 1.80 - 1.85
//===============================================================

//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT SQE_CreateNewWithoutTube 
//USEUNIT SQE_ImportFCS
//USEUNIT SQE_create2D_RightClick
//USEUNIT Steps_Case_1_MultiColorGating
//USEUNIT SQE_AddPopulation
//USEUNIT SQE_LaunchLogIn
//USEUNIT SQE_CreateGate
//USEUNIT SQE_create1D_LeftClick

var case_1_MultiColorGating = 
   new VerificationCase({
      CaseNumber: "1",
      Description: "FSS-FAQ-1559 - After data acquisition, parameter labels shall be preserved in the FCS file.",
      Steps: [
         new SqeKeyword(CreateNewWithoutTube)
            .setStepNumber("1.1"),
                
         new SqeKeyword(ImportFCS)
            .setStepNumber("1.2")
            .setKeywordParams({
               Option: "ImportFCSButton", Location: "E:\\BD project\\FACSuiteLiberaryFiles\\FCS file\\FACSDiva", 
               FileName: "Lymphocytes_3,2f,16+56,2f,45,2f,4,2f,19,2f,8.fcs"
            }),

         new SqeKeyword(create2D_RightClick)
            .setStepNumber("1.3")
            .setKeywordParams({XParamName: "PerCP-Cy5-5-A",  YParamName: "SSC-A"}),
            
         new SqeKeyword(create2D_RightClick)
            .setStepNumber("1.4")
            .setKeywordParams({XParamName: "FSC-H",  YParamName: "SSC-A"}),

         new SqeKeyword(CreateGate)
            .setStepNumber("1.5")
            .setKeywordParams({
               GateType: "Rectangle", txtXParameter: "CD45 PerCP-Cy5-5-A", txtYParameter: "SSC-A", ApproximateArea:[77, 178, 44, 144]
            }),

         new StepExecution(EnterName)
            .setStepNumber("1.6") 
            .setStepParams({txtXParameter: "CD45 PerCP-Cy5-5-A", txtYParameter: "SSC-A", nameGate: "MNEs", Option: "F4"}),
          
         new StepExecution(CloseGatePropertiesAndSelectDisplayHierarchy)
            .setStepNumber("1.7"),
                  
         new StepExecution(SelectOptionNotPopulation)
            .setStepNumber("1.8")  
            .setStepParams({NamePopulation:"MNEs"}),           
 
         new StepExecution(CreateStatisticTable)
            .setStepNumber("1.9")
            .setStepParams({Path: "Multiple Tube Statistics"}),           

         new SqeKeyword(AddPopulation)
            .setStepNumber("1.10")
            .setKeywordParams({TubeNamesPopulations: ["All Events", "MNEs", "Not MNEs"]}),

         new StepExecution(GoToPlotProperties)
            .setStepNumber("1.11")
            .setStepParams({txtXParameter: "CD45 PerCP-Cy5-5-A", txtYParameter: "SSC-A"}),  
                   
         new StepVerification(VerifyPopulationAndClose)
            .setStepNumber("1.12")
            .setStepParams({NamePopulation: ["MNEs"]}),

         new StepExecution(NoteValuesPopulations)
            .setStepNumber("1.13")
            .setStepParams({NameColumns: ["Name", "Events"]}), 
                   
         new StepExecution(NoteSumEventsPopulations)
            .setStepNumber("1.14")
            .setStepParams({NamePopulations: ["MNEs", "Not MNEs"]}),   
             
         new StepVerification(VerifySumEventsPopulation)
            .setStepNumber("1.15")
            .setStepParams({NamePopulations: ["MNEs", "Not MNEs"]}),
            
         new StepExecution(SelectPopulation)
            .setStepNumber("1.16")
            .setStepParams({txtXParameter: "FSC-H", txtYParameter: "SSC-A", NamePopulation: "Not MNEs"}),
               
         new StepExecution(ClosePlotProperties)
            .setStepNumber("1.17"),

         new SqeKeyword(CreateGate)
            .setStepNumber("1.18")
            .setKeywordParams({
               GateType: "Ellipse", txtXParameter: "FSC-H", txtYParameter: "SSC-A", ApproximateArea:[65, 110, 135, 155]
            }),

         new StepExecution(EnterName)
            .setStepNumber("1.19") 
            .setStepParams({txtXParameter: "FSC-H", txtYParameter: "SSC-A", nameGate: "Lymphocytes", Option: "F4"}),
          
         new StepExecution(CloseGatePropertiesAndSelectDisplayHierarchy)
            .setStepNumber("1.20"),      

         new StepVerification(VerifySubPopulation)
            .setStepNumber("1.21")
            .setStepParams({NamePopulation: "Not MNEs", NameSubPopulation:"Lymphocytes"}),
           
         new StepExecution(ChangePropertiesXParameters)
            .setStepNumber("1.22")
            .setStepParams({txtXParameter: "FSC-H", txtYParameter: "SSC-A", changeXParameter: "CD3 FITC-A"}),
          
         new StepExecution(SelectGeneralTab)
            .setStepNumber("1.23"),
              
         new StepVerification(VerifyPopulations)
            .setStepNumber("1.24")
            .setStepParams({NamePopulation: ["Not MNEs", "Lymphocytes"]}),
                    
         new StepExecution(ClosePlotProperties)
            .setStepNumber("1.25"),
           
         new SqeKeyword(CreateGate)
            .setStepNumber("1.26")
            .setKeywordParams({
               GateType: "Interval", txtXParameter: "CD3 FITC-A", txtYParameter: "SSC-A", ApproximateArea:[135, 165, 140, 140]
            }),
        
         new StepExecution(EnterName)
            .setStepNumber("1.27") 
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "SSC-A", nameGate: "T Cells"}),
            
         new StepExecution(CloseGatePropertiesWindow)
            .setStepNumber("1.28"), 

         new SqeKeyword(Create1D_LeftClick)
            .setStepNumber("1.29")
            .setKeywordParams({XParamName: "CD19 APC-A"}),

         new StepExecution(SelectPopulationAndCloseProperties)
            .setStepNumber("1.30") 
            .setStepParams({txtXParameter: "CD19 APC-A", txtYParameter: "Count", NamePopulation: "Lymphocytes"}),
             
         new SqeKeyword(CreateGate)
            .setStepNumber("1.31")
            .setKeywordParams({
               GateType: "Interval", txtXParameter: "CD19 APC-A", txtYParameter: "Count", ApproximateArea:[250, 310, 140, 140]
            }),
   
         new StepExecution(EnterName)
            .setStepNumber("1.32") 
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "SSC-A",  Option: "Hierarchy", nameGate: "B Cells"}),
             
         new StepExecution(CloseGatePropertiesWindow)
            .setStepNumber("1.33"),
                
         new StepExecution(ChangePropertiesYParameters)
            .setStepNumber("1.34")
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "SSC-A", changeYParameter: "CD16+CD56 PE-A"}),
              
         new StepExecution(ClosePlotProperties)
            .setStepNumber("1.35"),

         new StepVerification(OpenPlotPropertiesAndVerifyAxis)
            .setStepNumber("1.36") 
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "CD16+CD56 PE-A"}),
     
         new StepExecution(SelectParametersTabAndMakeBiExponential)
            .setStepNumber("1.37")
            .setStepParams({XParamScale: "BiExponential", YParamScale: "BiExponential"}),
              
         new SqeKeyword(CreateGate)
            .setStepNumber("1.38")
            .setKeywordParams({
               GateType: "Interval", txtXParameter: "CD3 FITC-A", txtYParameter: "CD16+CD56 PE-A", ApproximateArea:[50, 100, 40, 40]
            }),

         new StepExecution(EnterName)
            .setStepNumber("1.39") 
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "CD16+CD56 PE-A", nameGate: "NK Cells"}),
           
         new StepExecution(CloseGatePropertiesWindow)
            .setStepNumber("1.40"),
               
         new StepExecution(CloseHierarchyWindow)
            .setStepNumber("1.40a"),

         new StepExecution(GoToPlotProperties)
            .setStepNumber("1.41")
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "CD16+CD56 PE-A"}),
                
         new StepVerification(VerifyPopulations)
            .setStepNumber("1.42")
            .setStepParams({NamePopulation: ["Lymphocytes", "T Cells", "B Cells", "NK Cells"]}),
                              
         new StepExecution(ClosePlotProperties)
            .setStepNumber("1.42a"),

         new StepExecution(SelectOptionOrPopulations)
            .setStepNumber("1.43")  
            .setStepParams({NamePopulations: ["T Cells", "B Cells", "NK Cells"]}),
            
         new StepVerification(VerifyPopulationsHierarchyAndPlotProperties)
            .setStepNumber("1.44")
            .setStepParams({
               txtXParameter: "CD3 FITC-A", txtYParameter: "CD16+CD56 PE-A", NamePopulations: ["T Cells OR B Cells OR NK Cells"]
            }),
            
         new StepExecution(NavigatePlotPropertiesAndGeneralTab)
            .setStepNumber("1.45")
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "CD16+CD56 PE-A"}),
                
         new StepVerification(VerifyPopulations)
            .setStepNumber("1.46")
            .setStepParams({NamePopulation: ["Lymphocytes", "T Cells", "B Cells", "NK Cells", "T Cells OR B Cells OR NK Cells"]}),

         new StepExecution(ClosePlotProperties)
            .setStepNumber("1.47"),

         new StepExecution(SelectOptionAndPopulations)
            .setStepNumber("1.47")  
            .setStepParams({NamePopulations: ["T Cells", "NK Cells"]}),
                
         new StepVerification(VerifyPopulationsHierarchy)
            .setStepNumber("1.48")
            .setStepParams({NamePopulations: ["T Cells AND NK Cells"]}),
            
         new StepExecution(SelectUndo)
            .setStepNumber("1.49"),  

         new StepVerification(VerifyPopulationsHierarchyDoNotDisplayed)
            .setStepNumber("1.50")
            .setStepParams({NamePopulations: ["T Cells AND NK Cells"]}),
               
         new StepExecution(RedoViaFileMenu)
            .setStepNumber("1.51"),
                
         new StepVerification(VerifyPopulationsHierarchy)
            .setStepNumber("1.52")
            .setStepParams({NamePopulations: ["T Cells AND NK Cells"]}),
            
         new StepExecution(CreateStatisticTable)
            .setStepNumber("1.53")    
            .setStepParams({Path: "Run Pointer Statistics"}),    
                    
         new StepExecution(VerifyPopulationInTheGrid)
            .setStepNumber("1.54")
            .setStepParams({GridType: "RunPointerStatistics", Gate: "T Cells AND NK Cells", Parameter: "Events", Result: 0}), 

         new StepExecution(SelectOptionDeletePopulations)
            .setStepNumber("1.55")  
            .setStepParams({NamePopulations: ["T Cells AND NK Cells"]}),
                
         new StepVerification(VerifyPopulationsHierarchyDoNotDisplayed)
            .setStepNumber("1.56")
            .setStepParams({NamePopulations: ["T Cells AND NK Cells"]}),    
                           
         new StepExecution(SelectOptionRestOfPopulations)
            .setStepNumber("1.57")  
            .setStepParams({NamePopulations: ["Lymphocytes"]}),
              
         new StepVerification(VerifyPopulationsHierarchy)
            .setStepNumber("1.58")
            .setStepParams({NamePopulations: ["Rest Of Lymphocytes"]}),
              
         new StepExecution(NavigatePlotPropertiesAndGeneralTab)
            .setStepNumber("1.59")
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "CD16+CD56 PE-A"}),
                
         new StepVerification(VerifyPopulations)
            .setStepNumber("1.60")
            .setStepParams({NamePopulation: ["Lymphocytes", "T Cells", "B Cells", "NK Cells", "T Cells OR B Cells OR NK Cells"]}),
 
         new StepExecution(ClosePlotProperties)
            .setStepNumber("1.61"),                  

         new StepExecution(ChangeXLabelInPlot)
            .setStepNumber("1.62") 
            .setStepParams({txtXParameter: "CD3 FITC-A", txtYParameter: "CD16+CD56 PE-A", newXLabel: "CD4 PE-Cy7-A"}),

         new StepExecution(ChangeYLabelInPlot)
            .setStepNumber("1.63") 
            .setStepParams({txtXParameter: "CD4 PE-Cy7-A", txtYParameter: "CD16+CD56 PE-A", newYLabel: "CD8 APC-Cy7-A"}),
             
         new StepExecution(NavigatePlotPropertiesAndParametersTab)
            .setStepNumber("1.64")
            .setStepParams({txtXParameter: "CD4 PE-Cy7-A", txtYParameter: "CD8 APC-Cy7-A"}),  
            
         new StepVerification(VerifyAxisOnParametersTabOnPropertyWindow)
            .setStepNumber("1.65")
            .setStepParams({txtXParameter: "CD4 PE-Cy7-A", txtYParameter: "CD8 APC-Cy7-A"}),     

         new StepExecution(OpenGeneralTabAndUpdatePopulation)
            .setStepNumber("1.66")
            .setStepParams({NamePopulation: "T Cells"}), 
                
         new StepExecution(ClosePlotProperties)
            .setStepNumber("1.67"),  
	
         new StepExecution(CreateQuadGate)
            .setStepNumber("1.68")
            .setStepParams({txtXParameter: "CD4 PE-Cy7-A", txtYParameter: "CD8 APC-Cy7-A"}),

         new StepExecution(SelectQuadGate)
            .setStepNumber("1.69")
            .setStepParams({txtXParameter: "CD4 PE-Cy7-A", txtYParameter: "CD8 APC-Cy7-A"}),

         new StepExecution(CloseGatePropertiesWindowAndOpenPlotProperties)
            .setStepNumber("1.70")
            .setStepParams({txtXParameter: "CD4 PE-Cy7-A", txtYParameter: "CD8 APC-Cy7-A"}),

         new StepVerification(VerifyPopulations)
            .setStepNumber("1.71")
            .setStepParams({
               NamePopulation: ["Lymphocytes","Rest of Lymphocytes","B Cells","T Cells OR B Cells OR NK Cells","UL","UR","LL","LR"]
            }),

         new StepExecution(ClosePlotProperties)
            .setStepNumber("1.72"),

         new StepExecution(SelectOptionAndPopulations)
            .setStepNumber("1.73")  
            .setStepParams({NamePopulations: ["UL", "B Cells"]}),
                 
         new SqeKeyword(AddPopulation)
            .setStepNumber("1.74")
            .setKeywordParams({
               GridType: "RunPointerStatistics", 
               TubeNamesPopulations: ["MNEs", "Not MNEs", "Lymphocytes", "Q1_UL", "Q1_UR", "Q1_LL", "Q1_LR", "B Cells", 
                  "T Cells OR B Cells OR NK Cells", "Q1_UL AND B Cells", "Rest Of Lymphocytes"]
            }),

         new StepExecution(NoteRunPointerStatisticsValuesPopulations)
            .setStepNumber("1.75")
            .setStepParams({
               GridType: "RunPointerStatistics",
               NameColumns: ["Name", "MNEs", "Not MNEs", "Lymphocytes", "Q1_UL", "Q1_UR", "Q1_LL", "Q1_LR", "B Cells", 
                  "T Cells OR B Cells OR NK Cells", "Q1_UL AND B Cells", "Rest Of Lymphocytes"]
               }),

         new StepExecution(SelectOptionDeletePopulationsAndConfirm)
            .setStepNumber("1.76")  
            .setStepParams({
               NamePopulations: ["MNEs", "Not MNEs", "Lymphocytes", "Q1", "B Cells", "T Cells OR B Cells OR NK Cells", 
                  "Q1_UL AND B Cells", "Rest Of Lymphocytes"]
            }),   
              
         new StepExecution(SelectUndo)
            .setStepNumber("1.77"),
    
         new StepExecution(VerifyStateViewIsTheSameasNoted)
            .setStepNumber("1.78")  
            .setStepParams({GridType: "RunPointerStatistics"}),

         new StepExecution(CheckShowPopulationStatistics)
            .setStepNumber("1.79"),
                  
         new StepExecution(VerifyPopulationStatisticsIsTheSameAsNoted)
            .setStepNumber("1.80"),
                  
         new StepExecution(SaveAs)
            .setStepNumber("1.81")  
            .setStepParams({NameExperiment: "Mylticolor_Gating_Analysis"}),
    
         new SqeKeyword(LaunchLogIn)
            .setStepNumber("1.82")
            .setKeywordParams({UserID: "BDAdministrator", Password: "bdadministrator"}),  
             
         new StepExecution(OpenExperimentViaFileMenu)
            .setStepNumber("1.83")  
            .setStepParams({NameExperiment: "Mylticolor_Gating_Analysis"}),

         new StepExecution(VerifyPopulationStatisticsIsTheSameAsNoted)
            .setStepNumber("1.84"),
                  
         new StepExecution(CloseExperiment)
            .setStepNumber("1.85")
          
        ]                
    })    