//USEUNIT BD_Base

/**
 * contains usage examples for the Base object 
 * @author Noel Rice
 * @company Falafel Software
 */

var Descendant = Base.extend({
    Name: "Descendant",
    sayHi: function(){
        Log.Message("Hi");
    }
}); 

function test(){
    
    var base = new Base({
      Name: "MyObject"
    });

    var descendant = base.cast(Descendant); 
    
    base.log(); // outputs "Name: MyObject
    descendant.log(); // outputs "Name: MyObject"
    descendant.sayHi(); // outputs "Hi"
    //base.sayHi(); // fails, doesn't support this method
}