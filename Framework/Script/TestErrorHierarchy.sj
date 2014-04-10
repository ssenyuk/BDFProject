//USEUNIT BD_FrameworkErrorIncludes

function test(){
    var error = new WPFTextBoxError(); 
    
    Log.Message(error instanceof WPFTextBoxError); // true
    Log.Message(error instanceof WPFElementError); // true
    Log.Message(error instanceof ElementError); // true
    Log.Message(error instanceof TestCompleteBaseError); // true
    Log.Message(error instanceof AppError); // false
}

// Order of inheritance: 
//
//TestCompleteBaseError
//  ElementError
//    WPFElementError
//      WPFTextBoxError
//    
//  AppError