class DrawTrendLineGraph
{
  DrawTrendLineGraph()
  {
    //constructors
  }
  
  //this functions draws the line by taking the values on the array list.
  void update()
  {
    float border = width * 0.1f;
    float textY = (border * 0.5f);

    int horizIntervals = 10;
    int verticalIntervals = 10;
    int vertDataRange = 30000;
    //Print the text

    textAlign(CENTER, CENTER);
    
    //this deals with the hover text

    if ( textcounter == 1)
    {
      text(" GDP: Dublin / Mayo", width * 0.5f, textY);
    }
    
    if ( textcounter == 2)
    {
      text("GDP: Mayo / Galway", width * 0.5f, textY);
    }

    if ( textcounter == 3)
    {
      text("GDP: Dublin / Galway", width * 0.5f, textY);
    }

    float windowRange = (width - (border * 2.0f));
    float lineWidth = windowRange / (float) (westArray.size() - 1);

    stroke(255, 0, 0);
    fill(255);

    for (int i = 1; i < westArray.size(); i++)
    {
      float x1 = map(i-1, 0, westArray.size()-1, border, border+windowRange);
      float x2 = map(i, 0, westArray.size()-1, border, border+windowRange);
      /*remember when you gonna use the map function you have to get the min value and map into somewhere on the screen 
       example border which is 50 and  get the max value map it onto another place onto the screen windowsRange = 450*/

      float y1 = map(westArray.get(i-1).west, 0, 30000, height - border, ( height - border)  - windowRange);
      float y2 = map(westArray.get(i).west, 0, 30000, height - border, (height - border) - windowRange);
      stroke(0, 255, 0);
      //draws the line
      line(x1, y1, x2, y2);
      
      //hover functionality on the graph
      if (mouseX >=x1 && mouseX <=x2)
      {
        stroke(255, 0, 0);
        fill(255, 0, 0);
        ellipse(x1, y1, 5, 5);
        fill(255);
        
        //this deals with the hover text
        if(textcounter == 1)
        {
        text("Mayo: Region Values(in millions):  "+ westArray.get(i-1).west, x1+10, y1);
        }
        if(textcounter == 2)
        {
        text("Galway: Region Values(in millions):  "+ westArray.get(i-1).west, x1+10, y1);
        }
        if(textcounter == 3)
        {
        text("Galway: Region Values(in millions):  "+ westArray.get(i-1).west, x1+10, y1);
        }
      }
    } 

    for (int i = 1; i < westArray.size(); i++)
    {

      float x1 = map(i-1, 0, westArray.size()-1, border, border+windowRange);
      float x2 = map(i, 0, westArray.size()-1, border, border+windowRange);
      /*remember when you gonna use the map function you have to get the min value and map into somewhere on the screen 
       example border which is 50 and  get the max value map it onto another place onto the screen windowsRange = 450*/

      float y1 = map(westArray.get(i-1).dublin, 0, 30000, height - border, ( height - border)  - windowRange);
      float y2 = map(westArray.get(i).dublin, 0, 30000, height - border, (height - border) - windowRange);
      stroke(0, 0, 255);
      line(x1, y1, x2, y2);

      if (mouseX >=x1 && mouseX <=x2)
      {
        stroke(255, 0, 0);
        fill(255, 0, 0);
        ellipse(x1, y1, 5, 5);
        fill(255);
        if (textcounter == 1)
        {
          text("Dublin Region Values(in million) : " +westArray.get(i-1).dublin, x1+10, y1);
        }
        if (textcounter == 2)
        {
          text("Mayo Region Values(in million) : " +westArray.get(i-1).dublin, x1+10, y1);
        }
        if(textcounter ==3)
        {
          text("Dublin Region Values (in millions) :  "+ westArray.get(i-1).dublin, x1+10, y1);
        }
      }
    }
  }
  
  //this function deals with the drawing the axis for the graph
  void drawaxis()
  {
    float border = width * 0.1f;
    int horizIntervals = 10;
    int verticalIntervals = 10;
    int vertDataRange = 30000;
    stroke(255, 255, 0);
    //draw horizontal axis
    line(border, height - border, width - border, height - border);

    // Draw the vertical axis
    line(border, border, border, height - border);

    float windowRange = (width - (border * 2.0f));  
    float tickSize = border * 0.1f;

    for (int i = 0; i <= horizIntervals; i ++)
    {   
      // Draw the ticks
      float x = map(i, 0, horizIntervals, border, border + windowRange);
      line(x, height - (border - tickSize)
        , x, (height - border));  

      //vertical ticks and name
      textAlign(CENTER, CENTER);   
      float textY = height - (border * 0.5f); 
      //text from 2000 - 2013
      text((int) map(i, 0, horizIntervals, 2000, 2013), x, textY);
    }

    for (int i = 0; i <= verticalIntervals; i ++)
    {
      //maps the vertical intervals on the x axis
      //draws the ticks
      float y = map(i, 0, verticalIntervals, height - border, border);
      line(border - tickSize, y, border, y);
      float hAxisLabel = map(i, 0, verticalIntervals, 0, vertDataRange);
      //this deals with the text
      textAlign(RIGHT, CENTER);  
      text((int)hAxisLabel, border - (tickSize * 2.0f), y);
    }
  }
}