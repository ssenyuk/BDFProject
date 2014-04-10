//USEUNIT BD_Class

/**
 * contains usage examples for the Class object 
 * @author Noel Rice
 * @company Falafel Software
 */

// define MyClass
var MyClass = Class.extend({
    //PUBLIC PROPERTIES
    MyStringProp: 'Foo',
    MyIntProp: 123,
    MyObject: {},
    MyArray: [],
    
    // This method gets called as the object is constructed.
    // The method is analagous to a constructor in other languages.
    init: function(options){
        if (options){
            if (options.MyStringProp){
                this.MyStringProp = options.MyStringProp;
            }
        }
    }
});

function test(){
    // use MyClass
    var myClass = new MyClass({MyStringProp: "Hello world"});
    Log.Message(myClass.MyStringProp); // outputs "Hello world"
} 