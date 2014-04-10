//USEUNIT BD_Base
//USEUNIT BD_ConfigurationError
//USEUNIT BD_Setting
//USEUNIT BD_Utils
//USEUNIT BD_Event

/**
 * Contains  class for XML Data providing
 * @author Ivan Getsman
 * @company A1QA
 */
var XmlDataProvider = Base.extend({
    FrameworkClassName: "XmlDataProvider",
    ErrorType: ConfigurationError,
    XMLPath: null,
    Settings: {},
    Name: "XmlDataProvider",
    IsValid: true,
    _Document: new ActiveXObject("Msxml2.DOMDocument.6.0"),
    _RootXML: null,
    
    /*
      @description Constructor
    */
    init: function (filePath) {
        this.XMLPath =filePath; 
    },
   
    /*
     @description Check if the file exists
    */ 
    configFileExists: function(){
        return aqFileSystem.Exists(this.XMLPath.XMLPath);     
    },
    
    /*
     @description Load the content of file
    */ 
    load: function () {
        if (this.configFileExists()){
            this.Settings = {}; 
            this._Document.load(this.XMLPath.XMLPath);        
        } else {
            this.error(ErrorMessages.FileNotFound, this.XMLPath); 
        }
        return this; 
    },
    
    /*
     @description Read block with main_data
    */ 
    readMainData: function () {
      var commonParameters = this._readParametersByParentNode({nodeName : 'main_data'});
      return commonParameters;
    },    
    
    /*
     @description Read block with preconditions
    */ 
    readPreconditions: function () {
      //TODO: here is reading preconditions, no examples yet
    },
    
    /*
     @description Read block with preparation steps
    */ 
    readPreparationSteps: function () {
      //TODO: here is reading preparation steps, no examples yet
    },
    
    /*
     @description Read block with finalization steps
    */ 
    readFinalizationSteps: function () {
      //TODO: here is reading finalization steps, no examples yet
    },

    /*
     @description Read block with common settings
    */ 
    readCommonParameters: function () {
      var commonParameters = this._readParametersByParentNode({nodeName : 'common_parameters'});
      return commonParameters;
    },
    
    _readParametersByParentNode: function (options) {
      var cParameters = this._Document.selectNodes(aqString.Format("//%s/parameter",options.nodeName));
      var parameters = {}
      for (var i = 0; i<cParameters.length; i++) {
          parameters[cParameters[i].getAttribute("name")] = cParameters[i].getAttribute("value");
      }
      return parameters;
    },
    
   
    /*
     @description Read block with test cases
    */ 
    readCases: function () {
      var cases = this._Document.selectNodes("//verification_steps/case");
      var casesList = []
      for (var i = 0; i<cases.length; i++) {
        casesList.push({entityName:cases[i].baseName});
        for (var j = 0; j<cases[i].attributes.length; j++) {
          casesList[i][cases[i].attributes[j].nodeName] = cases[i].attributes[j].nodeValue;
        }
        
        // Collecting steps
        casesList[i]['steps'] = [];
        var steps = cases[i].selectNodes(".//step");
        for (var jj = 0; jj<steps.length; jj++) {
          casesList[i].steps.push({entityName:steps[jj].baseName})
          for (var jjj = 0; jjj<steps[jj].attributes.length; jjj++) {
            casesList[i].steps[jj][steps[jj].attributes[jjj].nodeName] = steps[jj].attributes[jjj].nodeValue;
          }
          
          // Collecting parameters of steps
           casesList[i].steps[jj]['parameters'] = {};
           var stepsParameters = steps[jj].selectNodes(".//parameter")
           for (var p = 0; p<stepsParameters.length; p++) {
              if (stepsParameters[p].getAttribute("value")) {
                casesList[i].steps[jj].parameters[stepsParameters[p].getAttribute("name")] = stepsParameters[p].getAttribute("value");
              } else {
                var listOfvalues = [];
                var parametersValues = stepsParameters[p].selectNodes(".//value");
                for (var value = 0; value<parametersValues.length; value++) {
                  listOfvalues.push(parametersValues[value].text);
                }
                casesList[i].steps[jj].parameters[stepsParameters[p].getAttribute("name")] = listOfvalues;
              }
           }
        }
        
      }
      return casesList;
    }


});