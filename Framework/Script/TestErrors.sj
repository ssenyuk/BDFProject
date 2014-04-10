/**
 * contains usage examples for error objects 
 * @author Noel Rice
 * @company Falafel Software
 */

//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT BD_FrameworkMessageIncludes

function Test1() {
    //BASIC ERROR LOGGING
    new BaseError().log();
    new ElementError().log();
    new WPFElementError().log();

    //CUSTOM ERROR LOGGING
    new WPFElementError('This and that happened.').log();

    try {
        //THROW A RANDOM ERROR
        throw new Error('Something bad happened.');
    } catch (e) {
        //LOGGING WITHIN A CATCH STATEMENT
        new WPFElementError(e).log();
    }

    //ADVANCED ERROR LOGGING
    new BaseWindowError({
        Message: 'This is a custom description.',
        Comments: 'Special type',
        Code: 15,
        Priority: 200,
        BackColor: clRed
    }).log();

    //GROUPS ERROR CODES TOGETHER IF AVAILABLE
    new WPFButtonError({
        Code: 15
    }).log();
}