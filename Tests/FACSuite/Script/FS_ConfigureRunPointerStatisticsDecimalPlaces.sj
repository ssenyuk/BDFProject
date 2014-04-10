//USEUNIT BD_FrameworkMessageIncludes
//USEUNIT BD_FrameworkClassIncludes
//USEUNIT FS_ConfigureRunPointerStatistics

/**
 * Description: class for the Decimal Places tab of the RunProperties window 
 */


var FSConfigureRunPointerStatisticsDecimalPlaces = FSConfigureRunPointerStatistics.extend({
 
    OKButton: null,

    init: function(options){
        this._super(options);
        
        this.Mapper.map([          
            { Name: "OKButton", NativeClrObject: "OkButton", ClassType: WPFButton, Depth: 20 }
               
        
        // Todo: fill in other controls later. 
 
        ]);
    },
 
closeConfigureRunPointerStatisticsWindow: function() {
    
   this.OKButton.click();    
   return this;
},

setNumericValue: function (statisticName, value){

  var numeric = this.Finder.find({ClrClassName: "NumericUpDown", "DataContext.StatisticName": statisticName, Depth: 20}).cast(WPFNumericUpDown);

while (numeric.Value != value) {

if (numeric.Value > value) numeric.decrement();
if (numeric.Value < value) numeric.increment();

}

return numeric;
}

// Todo: Add other methods later.
}); 