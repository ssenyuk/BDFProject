//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT SQE_CreateNewWithoutTube 
//USEUNIT SQE_ImportFCS
//USEUNIT SQE_DisplayStatistics
//USEUNIT Steps_Case_2_ExpectedStats

var case_2_ExpectedStats = 
    new VerificationCase({
        CaseNumber: "2",
        Description: "Expected statistics for non-compensated Calibrite Beads_Tube_001.fcs",
        Steps: [
           new SqeKeyword(CreateNewWithoutTube)
                .setStepNumber("2.1"),

         new SqeKeyword(ImportFCS)
                .setStepNumber("2.2")
                .setKeywordParams({
                Option: "ImportFCSButton", Location: "E:\\BD project\\FACSuiteLiberaryFiles\\FCS file\\FACSDiva", 
                FileName: "Calibrite Beads_Tube_001.fcs"
            }),

         new StepExecution(DeselectEnabledCompensation)
                .setStepNumber("2.3"),

         new StepExecution(CloseTubePropertiesWindow)
                .setStepNumber("2.4"),
             
         new StepExecution(CreateStatisticTable)
                .setStepNumber("2.5")    
                .setStepParams({Path: "Run Pointer Statistics"}),    
         
         new StepExecution(SetDecimalValues)
               .setStepNumber("2.6")
               .setStepParams({
               GridType: "RunPointerStatistics",
               TubeNamesPopulations: ["Events", "% Total", "FSC-A Mean", "SSC-A Mean", "FITC-A Mean", "PE-A Mean", "PerCP-Cy5-5-A Mean", "APC-A Mean", "Time Mean"],
               StatisticName: ["CV", "SD", "RCV", "RSD"], Value: 1}),

         new SqeKeyword(DisplayStatistics)
               .setStepNumber("2.7")
               .setKeywordParams({
               GridType: "RunPointerStatistics",
               TubeNamesPopulations: ["Events", "% Total", "FSC-A Mean", "SSC-A Mean", "FITC-A Mean", "PE-A Mean", "PerCP-Cy5-5-A Mean", "APC-A Mean", "Time Mean"],
               StatisticToCheck: ["FSC-A Min", "FSC-A Max", "FSC-A Mean", "FSC-A GeoMean", "FSC-A SD", "FSC-A CV", "FSC-A Median", "FSC-A RSD", "FSC-A RCV", "FSC-A Mode", 
                                  "SSC-A Min", "SSC-A Max", "SSC-A Mean", "SSC-A GeoMean", "SSC-A SD", "SSC-A CV", "SSC-A Median", "SSC-A RSD", "SSC-A RCV", "SSC-A Mode", 
                                  "FITC-A Min", "FITC-A Max", "FITC-A Mean", "FITC-A GeoMean", "FITC-A SD", "FITC-A CV", "FITC-A Median", "FITC-A RSD", "FITC-A RCV", "FITC-A Mode",
                                  "PE-A Min", "PE-A Max", "PE-A Mean", "PE-A GeoMean", "PE-A SD", "PE-A CV", "PE-A Median", "PE-A RSD", "PE-A RCV", "PE-A Mode", 
                                  "PerCP-Cy5-5-A Min", "PerCP-Cy5-5-A Max", "PerCP-Cy5-5-A Mean", "PerCP-Cy5-5-A GeoMean", "PerCP-Cy5-5-A SD", "PerCP-Cy5-5-A CV", "PerCP-Cy5-5-A Median", "PerCP-Cy5-5-A RSD", "PerCP-Cy5-5-A RCV", "PerCP-Cy5-5-A Mode", 
                                  "APC-A Min", "APC-A Max", "APC-A Mean", "APC-A GeoMean", "APC-A SD", "APC-A CV", "APC-A Median", "APC-A RSD", "APC-A RCV", "APC-A Mode", 
                                  "Time Min", "Time Max", "Time Mean", "Time GeoMean", "Time SD", "Time CV", "Time Median", "Time RSD", "Time RCV", "Time Mode"],
               StatisticToUncheck:[]}),
               
          new StepVerification(VerifyPopulationInTheGrid)
               .setStepNumber("2.8")
               .setStepParams({GridType: "RunPointerStatistics", Gate: "All Events", Fields:[{Parameter: "FSC-A Min", Result: "2197"}, 
                                                                                             {Parameter: "FSC-A Max", Result: "262143"},
                                                                                             {Parameter: "FSC-A Mean", Result: "95578"},
                                                                                             {Parameter: "FSC-A Geo Mean", Result: "94269"},
                                                                                             {Parameter: "FSC-A SD", Result: "18747.4"},
                                                                                             {Parameter: "FSC-A CV", Result: "19.6"},
                                                                                             {Parameter: "FSC-A Median", Result: "92562"},
                                                                                             {Parameter: "FSC-A RSD", Result: "3446.2"},
                                                                                             {Parameter: "FSC-A RCV", Result: "3.7"},
                                                                                             {Parameter: "FSC-A Mode", Result: "92160"}]}),
                                                                                             
          new StepVerification(VerifyPopulationInTheGrid)
               .setStepNumber("2.9")
               .setStepParams({GridType: "RunPointerStatistics", Gate: "All Events", Fields:[{Parameter: "SSC-A Min", Result: "400"}, 
                                                                                             {Parameter: "SSC-A Max", Result: "262143"},
                                                                                             {Parameter: "SSC-A Mean", Result: "117931"},
                                                                                             {Parameter: "SSC-A Geo Mean", Result: "116154"},
                                                                                             {Parameter: "SSC-A SD", Result: "21509.5"},
                                                                                             {Parameter: "SSC-A CV", Result: "18.2"},
                                                                                             {Parameter: "SSC-A Median", Result: "114631"},
                                                                                             {Parameter: "SSC-A RSD", Result: "10320.7"},
                                                                                             {Parameter: "SSC-A RCV", Result: "9.0"},
                                                                                             {Parameter: "SSC-A Mode", Result: "113664"}]}),        
          new StepExecution(VerifyPopulationInTheGrid)
               .setStepNumber("2.10")
               .setStepParams({GridType: "RunPointerStatistics", Gate: "All Events", Fields:[{Parameter: "FITC-A Min", Result: "-20"}, 
                                                                                             {Parameter: "FITC-A Max", Result: "53497"},
                                                                                             {Parameter: "FITC-A Mean", Result: "1142"},
                                                                                             {Parameter: "FITC-A Geo Mean", Result: "214"},
                                                                                             {Parameter: "FITC-A SD", Result: "2064.7"},
                                                                                             {Parameter: "FITC-A CV", Result: "180.7"},
                                                                                             {Parameter: "FITC-A Median", Result: "108"},
                                                                                             {Parameter: "FITC-A RSD", Result: "58.7"},
                                                                                             {Parameter: "FITC-A RCV", Result: "54.4"},
                                                                                             {Parameter: "FITC-A Mode", Result: "0"}]}),    

         new StepVerification(VerifyPopulationInTheGrid)
               .setStepNumber("2.11")
               .setStepParams({GridType: "RunPointerStatistics", Gate: "All Events", Fields:[{Parameter: "PE-A Min", Result: "-36"}, 
                                                                                             {Parameter: "PE-A Max", Result: "73924"},
                                                                                             {Parameter: "PE-A Mean", Result: "1241"},
                                                                                             {Parameter: "PE-A Geo Mean", Result: "235"},
                                                                                             {Parameter: "PE-A SD", Result: "2499.6"},
                                                                                             {Parameter: "PE-A CV", Result: "201.4"},
                                                                                             {Parameter: "PE-A Median", Result: "104"},
                                                                                             {Parameter: "PE-A RSD", Result: "78.3"},
                                                                                             {Parameter: "PE-A RCV", Result: "75.0"},
                                                                                             {Parameter: "PE-A Mode", Result: "0"}]}),  
                                                                                             
         new StepVerification(VerifyPopulationInTheGrid)
               .setStepNumber("2.12")
               .setStepParams({GridType: "RunPointerStatistics", Gate: "All Events", Fields:[{Parameter: "PerCP-Cy5-5-A Min", Result: "-37"}, 
                                                                                             {Parameter: "PerCP-Cy5-5-A Max", Result: "59767"},
                                                                                             {Parameter: "PerCP-Cy5-5-A Mean", Result: "1143"},
                                                                                             {Parameter: "PerCP-Cy5-5-A Geo Mean", Result: "265"},
                                                                                             {Parameter: "PerCP-Cy5-5-A SD", Result: "2039.8"},
                                                                                             {Parameter: "PerCP-Cy5-5-A CV", Result: "178.4"},
                                                                                             {Parameter: "PerCP-Cy5-5-A Median", Result: "175"},
                                                                                             {Parameter: "PerCP-Cy5-5-A RSD", Result: "183.2"},
                                                                                             {Parameter: "PerCP-Cy5-5-A RCV", Result: "104.6"},
                                                                                             {Parameter: "PerCP-Cy5-5-A Mode", Result: "0"}]}),      
                                                                                             
         new StepVerification(VerifyPopulationInTheGrid)
               .setStepNumber("2.13")
               .setStepParams({GridType: "RunPointerStatistics", Gate: "All Events", Fields:[{Parameter: "APC-A Min", Result: "-70"}, 
                                                                                             {Parameter: "APC-A Max", Result: "88410"},
                                                                                             {Parameter: "APC-A Mean", Result: "989"},
                                                                                             {Parameter: "APC-A Geo Mean", Result: "86"},
                                                                                             {Parameter: "APC-A SD", Result: "3069.0"},
                                                                                             {Parameter: "APC-A CV", Result: "310.4"},
                                                                                             {Parameter: "APC-A Median", Result: "69"},
                                                                                             {Parameter: "APC-A RSD", Result: "72.1"},
                                                                                             {Parameter: "APC-A RCV", Result: "104.3"},
                                                                                             {Parameter: "APC-A Mode", Result: "0"}]}),                                                                                                   
                                                                                             
         new StepVerification(VerifyPopulationInTheGrid)
               .setStepNumber("2.14")
               .setStepParams({GridType: "RunPointerStatistics", Gate: "All Events", Fields:[{Parameter: "Time Min", Result: "3202"}, 
                                                                                             {Parameter: "Time Max", Result: "11609"},
                                                                                             {Parameter: "Time Mean", Result: "8230"},
                                                                                             {Parameter: "Time Geo Mean", Result: "7863"},
                                                                                             {Parameter: "Time SD", Result: "2278.5"},
                                                                                             {Parameter: "Time CV", Result: "27.7"},
                                                                                             {Parameter: "Time Median", Result: "8554"},
                                                                                             {Parameter: "Time RSD", Result: "2647.7"},
                                                                                             {Parameter: "Time RCV", Result: "31.0"},
                                                                                             {Parameter: "Time Mode", Result: "11264"}]}),                                                                                                   
                                                                                             						        
                                                                                            											                                                                                                                                                             
        new StepExecution(CloseExperiment)
                .setStepNumber("2.15")
               
        ]                
    })