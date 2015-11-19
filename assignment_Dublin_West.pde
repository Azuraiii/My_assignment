ArrayList<West> westArray = new ArrayList<West>();

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
  String[] lines = loadStrings("compensation.csv");
  
  //For loop for filling the global ArrayList
  for(int i=0;i<lines.length;i++)
  {
    //make new element for DublinWest class
    West westElement = new West(lines[i]);
    //Add this element to the ArrayList called westArray
    westArray.add(westElement);
    println(westArray.get(i).west);
    println(westArray.get(i).dublin);
  }
  
}

void drawTrendLineGraph(ArrayList<Float> westArray, String title)
{
  background(255,0,255);
  float border = width * 0.1f;
  //Print the text
  
  textAlign(CENTER,CENTER);
  float textY = (border * 0.5f);
  text(" Dublin and West Region Comparison Chart", width * 0.5f, textY);
  
  //drawAxis
  
  float windowRange = (width - (border * 2.0f));
  float dataRange = 1200;
  float lineWidth = windowRange / (float) (westArray.size() - 1);
  
 stroke(255,255,0);
 
 for(int i = 1; i < westArray.size(); i++)
 {
   float x1 = map(i-1, 0, westArray.size(), border,border+windowRange);
   float x2 = map(i,0, westArray.size(), border,border+windowRange);
   float y1 = map(westArray.get(i-1), 0, dataRange, height - border,( height - border)  - windowRange);
   float y2 = map(westArray.get(i), 0, dataRange, height - border, (height - border) - windowRange);
    line(x1, y1, x2, y2);
  }  
}