function Test1()
{
 
}

function Test2()
{
  var comboBox;
  comboBox = Aliases.FACSuite.HwndSource_Window.Window.MessageBarContentControl.Grid.PagesControl.StackPanel.GroupboxXAxis.xParametersPanel.cmbXParam;
  comboBox.Click(122, 13);
  comboBox.Click(119, 11);
  comboBox.Click(100, 13);
  comboBox.ClickItem(3);
}