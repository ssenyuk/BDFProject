function RegExReplaceDemo1()
{
  var str = "Export To PDF...";

  var re = /[^a-zA-Z0-9]+/g;

  str = str.replace(re, "");
  Log.Message(str);
}
