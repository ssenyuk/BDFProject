//USEUNIT BD_FrameworkClassIncludes
//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

function procedureStarted(e){
    var vpFormat = "According to the VP '%s', Version %s, Date %s"
    var osFormat = "OS: %s    Computer Name: %s";
    var verFormat = "Testing %s Version %s"
    var startFormat = "Testing Started at: %s";   
    var summaryFormat = "%s Tests with total test cases %i."
    var vp = e.VerificationProcedure; 
    var logger = vp.Params.TextLogger; 
    
    logger.writeline(logger.TimeStampedFilePath);
    logger.writeline(aqString.Format(vpFormat, vp.Name, vp.Version, vp.Date));
    logger.writeline(aqString.Format(osFormat, Sys.OSInfo.Version, Sys.HostName));
    logger.writeline(aqString.Format(verFormat, vp.AUT, vp.AUTVersion));
    logger.writeline("");
    logger.writeline(aqString.Format(summaryFormat, vp.Name, vp.Cases.length));
    logger.writeline("");   
}

function caseStarted(e){
    var caseFormat = "Case %s. (Total Steps: %i) %s";
    var _case = e.Case;
    var vp = _case.Parent; 
    var logger = vp.Params.TextLogger; 
        
    logger.writeline(aqString.Format(caseFormat, _case.CaseNumber, _case.Steps.length, _case.Description)); 
}

function stepStarted(e){

}

function stepCompleted(e){
    var stepFormat = "Step %s:\t%s";
    var sqeFormat = "Step %s:\t%s Keyword %s:\t%s - Params(%s)";
    var _case = e.Step ? e.Step.Parent : e.SqeKeyword.Parent; 
    var vp = _case.Parent;
    var logger = vp.Params.TextLogger;  
    
    if (e.Step){
        var isKeywordStep = e.Step.Parent instanceof SqeKeyword; 
        if (!isKeywordStep){
            logger.writeline(aqString.Format(stepFormat, e.Step.StepNumber, e.Step.Status));
        }
    } else if (e.SqeKeyword){
        var keywordParamStr = new BDUtils().optionPropertiesToString(e.SqeKeyword.KeywordParams); 
        logger.writeline(aqString.Format(sqeFormat, e.SqeKeyword.StepNumber, e.SqeKeyword.Status, 
            e.SqeKeyword.Description, e.SqeKeyword.Status, keywordParamStr));
    }
}

function caseCompleted(e){
    var caseFormat = "Execution Time: %i:%i:%i:%i";
    var _case = e.Case;
    var vp = _case.Parent; 
    var logger = vp.Params.TextLogger; 
    
    logger.writeline(aqString.Format(caseFormat, e.ExecutionTime.Hours, e.ExecutionTime.Minutes, e.ExecutionTime.Seconds, 
        e.ExecutionTime.Milliseconds));
    logger.writeline("");
}

function procedureCompleted(e){
    var procedureFormat = "%i hrs : %i min : %i sec"; 
    var vp = e.VerificationProcedure; 
    var logger = vp.Params.TextLogger;
    
    logger.writeline(aqString.Format(procedureFormat, e.ExecutionTime.Hours, e.ExecutionTime.Minutes, e.ExecutionTime.Seconds));
}