import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.*;

Minim minim;

ArrayList<West> westArray = new ArrayList<West>();

int counter = 0;
int loaddatacounter = 0;
int textcounter = 0;

Graph1 graph1;
Graph2 graph2;
Graph3 graph3;

void setup()
{
  size(500, 500);
  minim = new Minim(this);
  graph1 = new Graph1();
  graph2 = new Graph2();
  graph3 = new Graph3();
}

void loadData1()
{
  //loads data to a string array
  String[] lines = loadStrings("compensation.csv");
  //For loop for filling the global ArrayList
  for (int i=0; i<lines.length; i++)
  {
    //make new element for DublinWest class
    West westElement = new West(lines[i]);
    //Add this element to the ArrayList called westArray
    westArray.add(westElement);
  }
}
void loadData2()
{
  //loads data to a string array
  String[] lines = loadStrings("selfemployed.csv");

  //For loop for filling the global ArrayList
  for (int i=0; i<lines.length; i++)
  {
    //make new element for DublinWest class
    West westElement = new West(lines[i]);
    //Add this element to the ArrayList called westArray
    westArray.add(westElement);
  }
}

void loadData3()
{
  //loads data to a string array
  String[] lines = loadStrings("disposable_income.csv");

  //For loop for filling the global ArrayList
  for (int i=0; i<lines.length; i++)
  {
    //make new element for DublinWest class
    West westElement = new West(lines[i]);
    //Add this element to the ArrayList called westArray
    westArray.add(westElement);
  }
}

void drawTrendLineGraph( )
{
  float border = width * 0.1f;
  
  //Print the text

  textAlign(CENTER, CENTER);
  float textY = (border * 0.5f);
    
  if ( textcounter == 1)
  {
   text(" Compensation for Employees, e.g. Wages, Salaries, Benefits in Kind etc.", width * 0.5f, textY);
  }
  
  if ( textcounter == 2)
  {
   text("Salary of Self Employed", width * 0.5f, textY);
  }
  
  if ( textcounter == 3)
  {
   text("Total Disposable Income per person", width * 0.5f, textY);
  }

  float windowRange = (width - (border * 2.0f));
  float lineWidth = windowRange / (float) (westArray.size() - 1);

  stroke(255,0,0);
  fill(255);

  for (int i = 1; i < westArray.size(); i++)
  {
    float x1 = map(i-1, 0, westArray.size()-1, border, border+windowRange);
    float x2 = map(i, 0, westArray.size()-1, border, border+windowRange);
    /*remember when you gonna use the map function you have to get the min value and map into somewhere on the screen 
     example border which is 50 and  get the max value map it onto another place onto the screen windowsRange = 450*/

    float y1 = map(westArray.get(i-1).west, 0, 30000, height - border, ( height - border)  - windowRange);
    float y2 = map(westArray.get(i).west, 0, 30000, height - border, (height - border) - windowRange);
    stroke(0,255,0);
    line(x1, y1, x2, y2);
    
    if(mouseX >=x1 && mouseX <=x2)
    {
      stroke(255,0,0);
      fill(255,0,0);
      ellipse(x1,y1,5,5);
      fill(255);
      text("West Region Values(in millions):  "+ westArray.get(i-1).west,x1+10,y1);
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
    stroke(0,0,255);
    line(x1, y1, x2, y2);
    
    if(mouseX >=x1 && mouseX <=x2)
    {
      stroke(255,0,0);
      fill(255,0,0);
      ellipse(x1,y1,5,5);
      fill(255);
      text("Dublin Region Values (in millions) :  "+ westArray.get(i-1).dublin,x1+10,y1);
    }
  
  }
  
  
}

void drawAxis(float border, int horizIntervals, int verticalIntervals, int vertDataRange)
{
  stroke(255,255,0);
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
    float y = map(i, 0, verticalIntervals, height - border, border);
    line(border - tickSize, y, border, y);
    float hAxisLabel = map(i, 0, verticalIntervals, 0, vertDataRange);

    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}




void draw()
{
  if ( counter == 0)
  {
    menu();
    
  }
  if ( counter == 1)
  {
   //load data
  loadData1();
  counter = 5;
  textcounter = 1;
  loaddatacounter = 1;
  graph1.display();
  graph1.audio();
  }
  
  
  if ( counter == 2)
  {
   //load data2
   loadData2();
   counter = 5;
   textcounter = 2;
   loaddatacounter = 1;
   graph2.display();
   graph2.audio();
  }
  
  if ( counter == 3)
  {
   //load data2
  loadData3();
   counter = 5;
   textcounter = 3;
   loaddatacounter = 1;
   graph3.display();
   graph3.audio();
  }
  
  if(loaddatacounter == 1)
  {
    drawTrendLineGraph();
    drawAxis(50,10,10,30000);
  }
}

void menu()
{
  //this function is used to create a menu for the program.
  PImage bg = loadImage("ireland_background.png");
  image(bg,0,0);
  bg.resize(500,500);
  background(bg);
  //rectangle 1
  
  PShape rectangle = createShape(RECT, 50 , 300, 100, 100);
  PImage comp = loadImage("compensationforemployees.jpg");
  rectangle.setTexture(comp);
  shape(rectangle);
  
  //rectangle 2
  PShape rectangle2 = createShape(RECT, 200 , 300, 100, 100);
  PImage comp2 = loadImage("self_employed.jpg");
  rectangle2.setTexture(comp2);
  shape(rectangle2);
  
  //rectangle 3
  PShape rectangle3 = createShape(RECT, 350 , 300, 100, 100);
  PImage comp3 = loadImage("rentfordwellings.jpg");
  rectangle3.setTexture(comp3);
  shape(rectangle3);

  //this allows you to set the counter when you press the rectangles
  if (mousePressed)
  {
    if (mouseX > 50 && mouseX < 150 && mouseY > 300 & mouseY < 400)
    {
      counter = 1;
    }
    
    if (mouseX > 200 && mouseX < 300 && mouseY > 300 & mouseY < 400)
    {
      counter = 2;
    }
    
    if (mouseX > 350 && mouseX < 450 && mouseY > 300 & mouseY < 400)
    {
      counter = 3;
    }
  }
  println(counter);
}

//this function allows you to reset the program by setting the counter to 0 to see other graphs
void keyPressed()
{
  if(key ==' ')
  {
    counter = 0;
    loaddatacounter = 0;
    //clearing the arraylist
    westArray.clear();
  }
}