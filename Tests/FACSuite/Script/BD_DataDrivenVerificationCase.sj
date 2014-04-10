//USEUNIT FS_ImportAll
//USEUNIT FS_ExecutionFactory

/**
 * DataDriven test case
 * @author Ivan Getsman
 * @company A1QA
 */   
var DataDrivenVerificationCase = Base.extend({
    FrameworkClassName: "DataDrivenVerificationCase",
    ErrorType: ConfigurationError,
    Settings: {},
    Name: "DataDrivenCase",
    IsValid: true,
    
    /*
      @description Get DataDriven Case objects from content
    */
    getDataDrivenCases : function(casesObject) {
          var listOfCases = [];
          for (var i in casesObject) {
            var listOfSteps = [];
            var eFactory = new ExecutionFactory();
            var vpCase = eFactory.createVerificationCase(casesObject[i]);
            listOfCases.push(vpCase);
          }
          return listOfCases;
      },
    
    init: function (options) {
      this._super(options); 
    }

});  