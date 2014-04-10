/**
 * contains event handling functions use to interface CodeSite with TestComplete
 * @author Noel Rice
 * @company Falafel Software
 */

// Event handlers to hook up to TestComplete event handling

function BD_OnLogError(Sender, LogParams) {
    
    SetFileLogging();

    if (Project.Variables.VariableByName("WriteToViewer") ||
        Project.Variables.VariableByName("WriteToLogFile")) {
        dotNET.Raize_CodeSiteLogging.CodeSite.EnterMethod(LogParams.MessageText);
        if (LogParams.AdditionalText && LogParams.AdditionalText.length) {
            dotNET.Raize_CodeSiteLogging.CodeSite.SendError(LogParams.AdditionalText);
        }
        dotNET.Raize_CodeSiteLogging.CodeSite.SendError(LogParams.Priority);
        dotNET.Raize_CodeSiteLogging.CodeSite.ExitMethodCollapse("");
    }
}

function BD_OnLogCreateNode(Sender, LogParams) {
    
    SetFileLogging();

    if (Project.Variables.VariableByName("WriteToViewer") ||
        Project.Variables.VariableByName("WriteToLogFile")) {
        dotNET.Raize_CodeSiteLogging.CodeSite.EnterMethod(LogParams.MessageText);
    }
}

function BD_OnLogMessage(sender, LogParams) {
    
    SetFileLogging();

    if (Project.Variables.VariableByName("WriteToViewer") ||
        Project.Variables.VariableByName("WriteToLogFile")) {
        dotNET.Raize_CodeSiteLogging.CodeSite.Send(LogParams.MessageText);
        if (LogParams.AdditionalText && LogParams.AdditionalText.length) {
            dotNET.Raize_CodeSiteLogging.CodeSite.Send(LogParams.AdditionalText);
        }

    }
}

function BD_OnLogCloseNode(Sender, LogParams) {
    
    if (Project.Variables.VariableByName("WriteToViewer") ||
        Project.Variables.VariableByName("WriteToLogFile")) {
        dotNET.Raize_CodeSiteLogging.CodeSite.ExitMethod(LogParams.MessageText);
    }
}

function SetFileLogging() {
    
    if (Project.Variables.VariableByName("WriteToLogFile")) {
        dest = dotNET.Raize_CodeSiteLogging.CodeSiteDestination.zctor()
        dest.LogFile.Active = true;
        dest.LogFile.FileName = "BDLogFile";
        dest.LogFile.FilePath = "$(MyDocs)";
        if (Project.Variables.VariableByName("WriteToViewer")) {
            dest.Viewer.Active = true;
        }
        dotNET.Raize_CodeSiteLogging.CodeSite.Destination = dest;
    } else {
        dest = dotNET.Raize_CodeSiteLogging.CodeSiteDestination.zctor()
        dest.LogFile.Active = false;
        if (Project.Variables.VariableByName("WriteToViewer")) {
            dest.Viewer.Active = true;
        }
        dotNET.Raize_CodeSiteLogging.CodeSite.Destination = dest;
    }
}