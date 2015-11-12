ArrayList<West> westArray = new ArrayList <West>();

void setup()
{
  background(0);
  size(500,500);
  
  //load data
  loadData();
}

void loadData()
{
  //loads data to a string array
  String[] lines = loadStrings("Dublin_West.csv");
  
  //For loop for filling the global ArrayList
  for(i=0;i<lines.length;i++)
  {
    //make new element for DublinWest class
    West westElement = new West(lines[i]);
    //Add this element to the ArrayList called dublinwestArray
    westArray.add(westElement);
  }
}