//USEUNIT BD_Base
//USEUNIT BD_App

var UnitTest = Base.extend({
    FrameworkClassName: "UnitTest",
    ErrorType: UnitTestError,
    Preparation: "",
    ExpectedWindowName: null,
    TestFunction: null,
    TestedApp: null,
    ErrorFormat: 'An error occurred during the unit test with message: "%s". Recovery: "%s". Then rerun this test.',
    
    init: function(options){
        this._super(options); 
        
        this.App = new App({TestedApp: this.TestedApp});
    },

    run: function(){
        this.App.run();    
        try {
            // activate any window that's showing to make sure app is on top and showing
            for(var prop in this.App.Windows){
                this.App.Windows[prop].activate(); 
            }
            // make sure that topmost window is the expected window
            window = this.App.getTopmostWindow(); 
            if (window && window.Name === this.App.Windows[this.ExpectedWindowName].Name){
                window.activate(); 
                this.TestFunction(window);                             
            } else {
                var message = "Expected window '" + this.ExpectedWindowName + "' was not available. "; 
                if (window && window.Name){
                     message = message + "Actual topmost window was '" + window.Name + "'"; 
                }
                this.error(message); 
            }
        } catch(e){
            var format = "Unhandled error \"%s\" with message \"%s\""; 
            this.error(format, e.name, e.message, this.Preparation); 
        } finally {
            //app.close(); 
        }
    }
}); 